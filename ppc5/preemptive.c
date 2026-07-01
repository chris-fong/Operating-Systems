/*
 * file: preemptive.c
 *
 * Stack-image threading core for SDCC / EdSim51.
 *
 * Every thread runs in register bank 0; instead of giving each thread its
 * own bank, the full register set (R0-R7, ACC, B, DPL, DPH, PSW) is pushed
 * onto that thread's private stack at a switch and popped back when it is
 * resumed. This costs a few more bytes per frame than a bank swap, but it
 * lets the threads call the LCD / keypad libraries freely without worrying
 * about which bank an "ar" temporary lands in.
 *
 * Switches are taken either from Timer 0 (myTimer0Handler) or voluntarily
 * (ThreadYield). The peripheral demos disable ET0 and yield cooperatively,
 * which keeps the saved frame shallow enough for 16-byte stacks.
 *
 * IRAM used by the scheduler: 0x38-0x3F.
 *
 * CS 342300 Spring 2026
 */

#include <8051.h>
#include "preemptive.h"

__data __at (0x38) unsigned char sp_save[MAXTHREADS];  /* 0x38-0x3B */
__data __at (0x3C) unsigned char live_mask;            /* 1 bit per live thread */
__data __at (0x3D) ThreadID      cur;                  /* id of running thread */
__data __at (0x3E) unsigned char nslot;                /* ThreadCreate scratch */
__data __at (0x3F) unsigned char keep_sp;              /* ThreadCreate scratch */

/* Push / pop a complete register image to the active stack. */
#define CTX_PUSH \
    __asm \
        PUSH 0 \
        PUSH 1 \
        PUSH 2 \
        PUSH 3 \
        PUSH 4 \
        PUSH 5 \
        PUSH 6 \
        PUSH 7 \
        PUSH ACC \
        PUSH B \
        PUSH DPL \
        PUSH DPH \
        PUSH PSW \
    __endasm;

#define CTX_POP \
    __asm \
        POP PSW \
        POP DPH \
        POP DPL \
        POP B \
        POP ACC \
        POP 7 \
        POP 6 \
        POP 5 \
        POP 4 \
        POP 3 \
        POP 2 \
        POP 1 \
        POP 0 \
    __endasm;

/* Round-robin to the next live thread id (wrap with a mask since
 * MAXTHREADS is a power of two). Safe to clobber R0/R1 here: the caller
 * always runs this between CTX_PUSH and CTX_POP, so R0-R7 are on the stack. */
#define NEXT_LIVE \
    do { \
        cur = (cur + 1) & (MAXTHREADS - 1); \
    } while (((live_mask >> cur) & 1) == 0)

extern void main(void);

void Bootstrap(void)
{
    live_mask = 0;
    /* Cooperative build: Timer 0 is left disarmed (ET0 = 0), so the only
     * context switches are the explicit ThreadYield() calls. This is what
     * keeps helper locals and the 16-byte stacks safe. */
    cur  = ThreadCreate(main);
    EA   = 0;
    SP   = sp_save[cur];   /* switch onto main's stack ... */
    CTX_POP;               /* ... then drop into main via its prepared frame */
}

ThreadID ThreadCreate(FunctionPtr fp)
{
    EA = 0;

    nslot = 0;
    while (nslot < MAXTHREADS) {
        if (((live_mask >> nslot) & 1) == 0) break;
        nslot++;
    }
    if (nslot == MAXTHREADS) {
        EA = 1;
        return (ThreadID)-1;
    }

    live_mask |= (unsigned char)(1 << nslot);

    keep_sp = SP;
    SP = (unsigned char)(0x40 + (nslot << 4));   /* 16-byte frames from 0x40 */

    /* Lay down a frame that CTX_POP can resume: entry address, then a
     * zeroed register image (bank 0). */
    __asm
        PUSH DPL
        PUSH DPH
        CLR  A
        PUSH ACC   ; r0
        PUSH ACC   ; r1
        PUSH ACC   ; r2
        PUSH ACC   ; r3
        PUSH ACC   ; r4
        PUSH ACC   ; r5
        PUSH ACC   ; r6
        PUSH ACC   ; r7
        PUSH ACC   ; ACC
        PUSH ACC   ; B
        PUSH ACC   ; DPL
        PUSH ACC   ; DPH
        PUSH ACC   ; PSW
    __endasm;

    sp_save[nslot] = SP;
    SP = keep_sp;

    EA = 1;
    return (ThreadID)nslot;
}

void ThreadYield(void)
{
    EA = 0;
    CTX_PUSH;
    sp_save[cur] = SP;
    NEXT_LIVE;
    SP = sp_save[cur];
    CTX_POP;
    EA = 1;
}

void ThreadExit(void)
{
    EA = 0;
    live_mask &= (unsigned char)~(1 << cur);
    if (live_mask == 0) {
        while (1) { }            /* nothing left to run */
    }
    NEXT_LIVE;
    SP = sp_save[cur];
    CTX_POP;
    EA = 1;
}

void myTimer0Handler(void)
{
    CTX_PUSH;
    sp_save[cur] = SP;
    NEXT_LIVE;
    SP = sp_save[cur];
    CTX_POP;
    __asm RETI __endasm;
}
