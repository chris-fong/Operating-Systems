/*
 * file: preemptive.h
 *
 * Threading package for SDCC / EdSim51. The scheduler keeps a full
 * register image on each thread's own stack, so every thread shares
 * register bank 0. Timer 0 can drive preemption, but a thread may mask
 * ET0 and drive switches itself with ThreadYield(); the peripheral demos
 * in this checkpoint do exactly that.
 *
 * CS 342300 Spring 2026
 */

#ifndef __PREEMPTIVE_H__
#define __PREEMPTIVE_H__

#define MAXTHREADS 4              /* must stay a power of two */

typedef char ThreadID;
typedef void (*FunctionPtr)(void);

ThreadID ThreadCreate(FunctionPtr);
void     ThreadYield(void);
void     ThreadExit(void);
void     myTimer0Handler(void);

/* ----------------------------------------------------------------------
 * Busy-wait semaphores (carried over from my earlier checkpoints).
 * A C identifier s maps to the assembler symbol _s; CAT2 turns a
 * __COUNTER__ value into a fresh SDCC-local label (1$, 2$, ...) so the
 * same macro may appear many times in one file without clashing.
 *
 * Used here only as a one-count lock that is released before any yield,
 * so the wait always finds the lock free and never actually spins.
 * -------------------------------------------------------------------- */
#define ASMNAME(s)   _ ## s
#define MKLBL(n)     n ## $

#define SemaphoreCreate(s, v)   (s) = (v)

#define SemaphoreSignal(s)      { __asm INC ASMNAME(s) __endasm; }

#define SemaphoreDownAt(s, n) \
    __asm \
    MKLBL(n): \
        MOV  A, ASMNAME(s) \
        JZ   MKLBL(n) \
        JB   ACC.7, MKLBL(n) \
        DEC  ASMNAME(s) \
    __endasm;
#define SemaphoreWait(s)        SemaphoreDownAt(s, __COUNTER__)

#endif /* __PREEMPTIVE_H__ */
