#ifndef __PREEMPTIVE_H__
#define __PREEMPTIVE_H__

#define MAXTHREADS 4

typedef char ThreadID;
typedef void (*FunctionPtr)(void);

ThreadID ThreadCreate(FunctionPtr);
void ThreadYield(void);
void ThreadExit(void);
void myTimer0Handler(void);

/* ---------- semaphores (busy-wait) ---------- */

#define CNAME(s)     _ ## s          /* mutex -> _mutex            */
#define LABEL(label) label ## $      /* 0 -> 0$  (SDCC local label) */

#define SemaphoreCreate(s, n)  s = n

#define SemaphoreWaitBody(s, label) \
    __asm \
    LABEL(label): \
        MOV A, CNAME(s) \
        JZ LABEL(label) \
        JB ACC.7, LABEL(label) \
        DEC CNAME(s) \
    __endasm;

#define SemaphoreWait(s)  SemaphoreWaitBody(s, __COUNTER__)

#define SemaphoreSignal(s) \
    __asm \
        INC CNAME(s) \
    __endasm;

#endif // __PREEMPTIVE_H__