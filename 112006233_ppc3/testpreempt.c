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

/* working chars (globals to avoid SDCC auto-var overlay across threads) */
__data __at (0x28) char curr_char;
__data __at (0x29) char cons_char;

void Producer(void)
{
    curr_char = 'A';
    while (1) {
        SemaphoreWait(empty);
        SemaphoreWait(mutex);
        buffer[tail] = curr_char;     /* critical section: keep short */
        tail++;
        if (tail == 3) {
            tail = 0;
        }
        SemaphoreSignal(mutex);
        SemaphoreSignal(full);

        curr_char++;                  /* next char generated outside CS */
        if (curr_char > 'Z') {
            curr_char = 'A';
        }
    }
}

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

    ThreadCreate(Consumer);
    Producer();
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