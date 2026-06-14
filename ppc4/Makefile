#
# makefile for testing preemptive multithreading
#

CC = sdcc
CFLAGS = -c
LDFLAGS =

C_OBJECTS = test3threads.rel preemptive.rel

all: test3threads.hex

test3threads.hex: $(C_OBJECTS)
				$(CC) $(LDFLAGS) -o test3threads.hex $(C_OBJECTS)

clean:
	rm *.hex *.ihx *.lnk *.lst *.map *.mem *.rel *.rst *.sym *.asm *.lk

%.rel: %.c preemptive.h Makefile
	$(CC) $(CFLAGS) $<