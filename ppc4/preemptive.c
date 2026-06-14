#include <8051.h>
#include "preemptive.h"

__data __at (0x33) char save_r0;
__data __at (0x34) char save_r1;
__data __at (0x35) char save_ar6;
__data __at (0x36) char save_ar7;
__data __at (0x38) ThreadID active_thread;
__data __at (0x39) char thread_mask;
__data __at (0x3A) char saved_sp[MAXTHREADS];
__data __at (0x3E) ThreadID temp_tid;
__data __at (0x3F) char sp_temp;

#define SAVESTATE \
    { \
        __asm \
        PUSH B \
        PUSH ACC \
        PUSH DPH \
        PUSH DPL \
        PUSH PSW \
        __endasm; \
        saved_sp[active_thread] = SP; \
    }

#define RESTORESTATE \
    { \
        SP = saved_sp[active_thread]; \
        __asm \
        POP PSW \
        POP DPL \
        POP DPH \
        POP ACC \
        POP B \
        __endasm; \
    }

extern void main(void);

void Bootstrap(void)
{
    thread_mask = 0;
    TMOD = 0;
    IE = 0x82;
    TR0 = 1;
    active_thread = ThreadCreate(main);
    RESTORESTATE;
}

ThreadID ThreadCreate(FunctionPtr fp)
{
    EA = 0;
    temp_tid = 0;
    while (temp_tid < MAXTHREADS) {
        if (!(thread_mask & (1 << temp_tid))) {
            break;
        }
        temp_tid++;
    }

    if (temp_tid == MAXTHREADS) {
        EA = 1;
        return -1;
    }

    thread_mask |= (1 << temp_tid);
    sp_temp = SP;
    SP = 0x3F + (temp_tid * 16);

    __asm
        PUSH DPL
        PUSH DPH
        MOV A, #0
        PUSH ACC
        PUSH ACC
        PUSH ACC
        PUSH ACC
    __endasm;

    PSW = (temp_tid << 3);
    __asm
        PUSH PSW
    __endasm;

    saved_sp[temp_tid] = SP;
    SP = sp_temp;
    EA = 1;
    return temp_tid;
}

void ThreadYield(void)
{
    EA = 0;
    SAVESTATE;
    do {
        active_thread++;
        if (active_thread == MAXTHREADS) {
            active_thread = 0;
        }
    } while ((thread_mask & (1 << active_thread)) == 0);
    RESTORESTATE;
    EA = 1;
}

void ThreadExit(void)
{
    EA = 0;
    thread_mask &= ~(1 << active_thread);
    do {
        active_thread++;
        if (active_thread == MAXTHREADS) {
            active_thread = 0;
        }
    } while ((thread_mask & (1 << active_thread)) == 0);
    RESTORESTATE;
    EA = 1;
}

void myTimer0Handler(void)
{
    __asm
    PUSH B
    PUSH ACC
    PUSH DPH
    PUSH DPL
    PUSH PSW
    MOV _save_r0, R0
    MOV _save_r1, R1
    MOV A, 6
    MOV _save_ar6, A
    MOV A, 7
    MOV _save_ar7, A
    __endasm;
    saved_sp[active_thread] = SP;

    do {
        active_thread++;
        if (active_thread == MAXTHREADS) {
            active_thread = 0;
        }
    } while ((thread_mask & (1 << active_thread)) == 0);

    sp_temp = saved_sp[active_thread];
    SP = sp_temp;

    __asm
    MOV R0, _save_r0
    MOV R1, _save_r1
    MOV A, _save_ar6
    MOV 6, A
    MOV A, _save_ar7
    MOV 7, A
    POP PSW
    POP DPL
    POP DPH
    POP ACC
    POP B
    RETI
    __endasm;
}