#include <8051.h>
#include "buttonlib.h"
// Button library for EdSim51 button bank (tied to port P2)
// Button pressed = 0, released = 1

// Return true if any button is pressed
char AnyButtonPressed(void) {
    return (P2 != 0xFF);
}

// Return highest-priority pressed button as ASCII (0-7), or null if none
// (~P2) sets 1 bits for pressed buttons; test from high (7) to low (0) priority
char ButtonToChar(void) {
    if ((~P2) & 0x80) {
        return '7';
    } else if ((~P2) & 0x40) {
        return '6';
    } else if ((~P2) & 0x20) {
        return '5';
    } else if ((~P2) & 0x10) {
        return '4';
    } else if ((~P2) & 0x08) {
        return '3';
    } else if ((~P2) & 0x04) {
        return '2';
    } else if ((~P2) & 0x02) {
        return '1';
    } else if ((~P2) & 0x01) {
        return '0';
    } else {
        return '\0';   // nothing pressed
    }
}
