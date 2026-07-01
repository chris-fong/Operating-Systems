// Keypad library for EdSim51 (4x3 matrix via P0, AND gate on P3.3)
#include <8051.h>
#include "keylib.h"

// Initialize keypad
void Init_Keypad(void) {
    P3_3 = 1; // AND gate input (enable in EdSim51)
    P0 = 0xf0; // P0 high: inputs, low: pull-down
}

// Return true if any key is pressed
char AnyKeyPressed(void) {
    P0 = 0xf0; // all rows pull-down
    return !P3_3; // AND gate low = key pressed
}

// Return highest-priority pressed key as ASCII, or 0 if none
char KeyToChar(void) {
    P0 = 0xf7; // test the top row
    if (P0 == 0xb7) { return '1'; }
    if (P0 == 0xd7) { return '2'; }
    if (P0 == 0xe7) { return '3'; }
    P0 = 0xfb; // test the next row
    if (P0 == 0xbb) { return '4'; }
    if (P0 == 0xdb) { return '5'; }
    if (P0 == 0xeb) { return '6'; }
    P0 = 0xfd; // test the 3rd row
    if (P0 == 0xbd) { return '7'; }
    if (P0 == 0xdd) { return '8'; }
    if (P0 == 0xed) { return '9'; }
    P0 = 0xfe; // test the last row
    if (P0 == 0xbe) { return '*'; }
    if (P0 == 0xde) { return '0'; }
    if (P0 == 0xee) { return '#'; }
    return 0;
}
