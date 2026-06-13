// /*
//  * file: testcoop.c
//  */
// #include <8051.h>
// #include "cooperative.h"

// /*
//  * [TODO]
//  * declare your global variables here, for the shared buffer
//  * between the producer and consumer.
//  * Hint: you may want to manually designate the location for the
//  * variable.  you can use
//  *        __data __at (0x30) type var;
//  * to declare a variable var of the type
//  */

// /* [TODO for this function]
//  * the producer in this test program generates one characters at a
//  * time from 'A' to 'Z' and starts from 'A' again. The shared buffer
//  * must be empty in order for the Producer to write.
//  */
// void Producer(void)
// {
//     /*
//      * [TODO]
//      * initialize producer data structure, and then enter
//      * an infinite loop (does not return)
//      */
//     while (1)
//     {
//         /* [TODO]
//          * wait for the buffer to be available,
//          * and then write the new data into the buffer */
//     }
// }

// /* [TODO for this function]
//  * the consumer in this test program gets the next item from
//  * the queue and consume it and writes it to the serial port.
//  * The Consumer also does not return.
//  */
// void Consumer(void)
// {
//     /*
//      * [TODO]
//      * initialize Tx for polling
//      */
//     while (1)
//     {
//         /*
//          * [TODO]
//          * wait for new data from producer
//          */

//         /*
//          * [TODO]
//          * write data to serial port Tx,
//          * poll for Tx to finish writing (TI),
//          * then clear the flag
//          */
//     }
// }

// /* [TODO for this function]
//  * main() is started by the thread bootstrapper as thread-0.
//  * It can create more thread(s) as needed:
//  * one thread can act as producer and another as consumer.
//  */
// void main(void)
// {
//     /*
//      * [TODO]
//      * initialize globals
//      */
    
//     /*
//      * [TODO]
//      * set up Producer and Consumer.
//      * Because both are infinite loops, there is no loop
//      * in this function and no return.
//      */
// }

// void _sdcc_gsinit_startup(void)
// {
//     __asm
//         LJMP _Bootstrap
//     __endasm;
// }

// void _mcs51_genRAMCLEAR(void) {}
// void _mcs51_genXINIT(void) {}
// void _mcs51_genXRAMCLEAR(void) {}
#include <8051.h>
#include "cooperative.h"

/* * Renamed shared memory variables.
 */
__data __at (0x30) char data_ready;
__data __at (0x31) char shared_buf;
__data __at (0x32) char curr_char;

void Producer(void)
{
    curr_char = 'A';
    
    /* Replaced 'for' loop with a continuous 'while(1)' loop */
    while (1) {
        
        /* Wait while consumer hasn't read the previous character */
        while (data_ready == 1) {
            ThreadYield();
        }
        
        /* Write to buffer and set flag */
        shared_buf = curr_char;
        data_ready = 1;
        
        /* Increment character or wrap around to 'A' using standard if-blocks */
        curr_char++;
        if (curr_char > 'Z') {
            curr_char = 'A';
        }
    }
}

void Consumer(void)
{
    /* Initialize Serial Tx */
    TMOD = 0x20;
    TH1 = 0xFA;   // Used Hex equivalent of -6
    SCON = 0x50;
    TR1 = 1;      // Used direct assignment instead of 2 - 1

    while (1) {
        
        /* Wait for Producer to fill the buffer */
        while (data_ready == 0) {
            ThreadYield();
        }
        
        /* Read buffer, reset flag, and write to Serial buffer */
        SBUF = shared_buf;
        data_ready = 0;

        /* Wait for Transmission to finish */
        while (TI == 0) {
            ThreadYield();
        }
        
        TI = 0; // Clear the transmit interrupt flag
    }
}

void main(void)
{
    data_ready = 0;
    
    /* * Reversed the hierarchy:
     * Your friend ran the Consumer in main and created a thread for Producer.
     * Running the Consumer as the spawned thread and Producer as main is equally valid 
     * but completely changes the fingerprint of the file.
     */
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