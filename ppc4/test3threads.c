#include <8051.h>
#include "preemptive.h"

/* semaphores */
__data __at (0x20) char mutex;
__data __at (0x21) char full;
__data __at (0x22) char empty;

/* bounded buffer (3-deep circular queue) */
__data __at (0x23) char head;
__data __at (0x24) char tail;
__data __at (0x25) char buffer[3];   /* 0x25..0x27 */

/* per-thread working chars (fixed addrs: SDCC overlays auto-vars across threads) */
__data __at (0x28) char curr_char1;  /* Producer1: 'A'..'Z' */
__data __at (0x29) char cons_char;   /* Consumer            */
__data __at (0x2A) char curr_char2;  /* Producer2: '0'..'9' */

/* Set FAIR to 1 to enable alternating-producer (starvation-free) version. */
#define FAIR 1

#if FAIR
/* 1 => Producer1's turn, 2 => Producer2's turn. Single byte, atomic r/w. */
__data __at (0x2B) volatile char prod_turn;
#endif

void Producer1(void)
{
    curr_char1 = 'A';
    while (1) {
#if FAIR
        while (prod_turn != 1) {}     /* wait for my turn */
#endif
        SemaphoreWait(empty);
        SemaphoreWait(mutex);
        buffer[tail] = curr_char1;    /* critical section: keep short */
        tail++;
        if (tail == 3) {
            tail = 0;
        }
        SemaphoreSignal(mutex);
        SemaphoreSignal(full);
#if FAIR
        prod_turn = 2;                /* hand turn to P2 */
#endif
        curr_char1++;
        if (curr_char1 > 'Z') {
            curr_char1 = 'A';
        }
    }
}

void Producer2(void)
{
    curr_char2 = '0';
    while (1) {
#if FAIR
        while (prod_turn != 2) {}     /* wait for my turn */
#endif
        SemaphoreWait(empty);
        SemaphoreWait(mutex);
        buffer[tail] = curr_char2;    /* critical section: keep short */
        tail++;
        if (tail == 3) {
            tail = 0;
        }
        SemaphoreSignal(mutex);
        SemaphoreSignal(full);
#if FAIR
        prod_turn = 1;                /* hand turn to P1 */
#endif
        curr_char2++;
        if (curr_char2 > '9') {
            curr_char2 = '0';
        }
    }
}

/* Consumer: unchanged from CheckPoint 3 */
void Consumer(void)
{
    TMOD |= 0x20;                     /* |= to preserve Bootstrap timer0 setup */
    TH1 = 0xFA;
    SCON = 0x50;
    TR1 = 1;

    while (1) {
        SemaphoreWait(full);
        SemaphoreWait(mutex);
        cons_char = buffer[head];     /* critical section: keep short */
        head++;
        if (head == 3) {
            head = 0;
        }
        SemaphoreSignal(mutex);
        SemaphoreSignal(empty);

        SBUF = cons_char;             /* transmit outside CS */
        while (TI == 0) {}
        TI = 0;
    }
}

void main(void)
{
    SemaphoreCreate(mutex, 1);
    SemaphoreCreate(empty, 3);
    SemaphoreCreate(full, 0);
    head = 0;
    tail = 0;
#if FAIR
    prod_turn = 1;                    /* P1 goes first */
#endif

    /* 3 threads. Try different spawn orders for Part 1. */
    ThreadCreate(Consumer);           /* Thread 1 */
    ThreadCreate(Producer2);          /* Thread 2 */
    Producer1();                      /* Thread 0 (main) becomes Producer1 */
}

void _sdcc_gsinit_startup(void)
{
    __asm
        LJMP _Bootstrap
    __endasm;
}

void _mcs51_genRAMCLEAR(void) {}
void _mcs51_genXINIT(void) {}
void _mcs51_genXRAMCLEAR(void) {}

void timer0_ISR(void) __interrupt(1) {
    __asm
    ljmp _myTimer0Handler
    __endasm;
}