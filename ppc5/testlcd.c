/*
 * file: testlcd.c   -- Checkpoint 5, Part 1
 *
 * Two producers and one consumer wired to real peripherals on top of the
 * stack-image threading core:
 *
 *   bank_producer  : button bank (P2)  -> enqueue ASCII
 *   pad_producer   : numeric keypad    -> enqueue ASCII
 *   lcd_consumer   : dequeue -> LCD_write_char
 *
 * Scheduling is cooperative: main clears ET0 so Timer 0 never preempts, and
 * each thread calls ThreadYield() once per pass at the top of its loop. A
 * switch therefore only ever happens at that shallow point, so the 13-byte
 * register frame always fits inside the 16-byte per-thread stack even though
 * the LCD and keypad calls nest several levels deep.
 *
 * A 3-slot ring buffer is protected by one binary lock (qlock). Access is
 * non-blocking: a producer that finds the ring full simply skips this round
 * and yields, and the consumer skips when the ring is empty. Because the lock
 * is always released before the yield, SemaphoreWait never spins.
 *
 * Shared, fixed-address state (auto-locals stay private per thread):
 *   0x20 lcd_ready (lcdlib)   0x21 qlock   0x22 qcount
 *   0x23 qhead    0x24 qtail  0x25-0x27 ring[3]
 *
 * CS 342300 Spring 2026
 */

#include <8051.h>
#include "preemptive.h"
#include "buttonlib.h"
#include "keylib.h"
#include "lcdlib.h"

#define RING 3

__data __at (0x21) char          qlock;
__data __at (0x22) unsigned char qcount;
__data __at (0x23) unsigned char qhead;
__data __at (0x24) unsigned char qtail;
__data __at (0x25) char          ring[RING];

/* Push one byte if the ring has room (drops it silently if full). */
static void put(char ch)
{
    SemaphoreWait(qlock);
    if (qcount < RING) {
        ring[qtail] = ch;
        qtail++;
        if (qtail == RING) qtail = 0;
        qcount++;
    }
    SemaphoreSignal(qlock);
}

/* Pop one byte if available; returns 0 when the ring is empty. */
static char get(void)
{
    char ch = 0;
    SemaphoreWait(qlock);
    if (qcount > 0) {
        ch = ring[qhead];
        qhead++;
        if (qhead == RING) qhead = 0;
        qcount--;
    }
    SemaphoreSignal(qlock);
    return ch;
}

/* Thread: button bank, one byte per press (edge detected). */
void bank_producer(void)
{
    unsigned char down = 0;
    char ch;
    P2 = 0xFF;                      /* float the inputs; a press pulls low */
    while (1) {
        if (AnyButtonPressed()) {
            if (!down) {
                down = 1;
                ch = ButtonToChar();
                if (ch) put(ch);
            }
        } else {
            down = 0;
        }
        ThreadYield();
    }
}

/* Thread: keypad, one byte per press (edge detected). */
void pad_producer(void)
{
    unsigned char down = 0;
    char ch;
    Init_Keypad();
    while (1) {
        if (AnyKeyPressed()) {
            if (!down) {
                down = 1;
                ch = KeyToChar();
                if (ch) put(ch);
            }
        } else {
            down = 0;
        }
        ThreadYield();
    }
}

/* Thread: LCD. Show one queued byte per pass once the panel is ready. */
void lcd_consumer(void)
{
    char ch;
    LCD_Init();
    while (1) {
        ch = get();
        if (ch && LCD_ready()) {
            LCD_write_char(ch);
        }
        ThreadYield();
    }
}

void main(void)
{
    ET0 = 0;                        /* cooperative: no Timer-0 preemption */

    SemaphoreCreate(qlock, 1);
    qcount = 0;
    qhead  = 0;
    qtail  = 0;

    ThreadCreate(bank_producer);
    ThreadCreate(pad_producer);
    ThreadCreate(lcd_consumer);

    ThreadExit();                   /* hand main's slot to the workers */
}

void _sdcc_gsinit_startup(void)
{
    __asm
        LJMP _Bootstrap
    __endasm;
}

void _mcs51_genRAMCLEAR(void)  {}
void _mcs51_genXINIT(void)     {}
void _mcs51_genXRAMCLEAR(void) {}

void timer0_ISR(void) __interrupt(1)
{
    __asm
        ljmp _myTimer0Handler
    __endasm;
}
