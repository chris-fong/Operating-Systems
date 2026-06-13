#include <8051.h>
#include "preemptive.h"

__data __at (0x30) char data_ready;
__data __at (0x31) char shared_buf;
__data __at (0x32) char curr_char;

void Producer(void)
{
    curr_char = 'A';
    while (1) {
        while (data_ready == 1) {}
        __critical {
            shared_buf = curr_char;
            data_ready = 1;
        }
        curr_char++;
        if (curr_char > 'Z') {
            curr_char = 'A';
        }
    }
}

void Consumer(void)
{
    TMOD |= 0x20;
    TH1 = 0xFA;
    SCON = 0x50;
    TR1 = 1;

    while (1) {
        while (data_ready == 0) {}
        __critical {
            SBUF = shared_buf;
            data_ready = 0;
        }
        while (TI == 0) {}
        TI = 0;
    }
}

void main(void)
{
    data_ready = 0;
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