#include <8051.h>
#include "lcdlib.h"

// LCD ready flag (bit-addressable IRAM at 0x20 to avoid collision with game state)
__data __at (0x20) unsigned char lcd_ready;

#define DB7 P1_7
#define DB6 P1_6
#define DB5 P1_5
#define DB4 P1_4
#define DB  P1
#define RS  P1_3
#define E   P1_2

void delay(unsigned char n);
#define DELAY_AMOUNT 40

unsigned char LCD_ready(void) {
    return lcd_ready;
}

void LCD_Init(void) {
    LCD_functionSet();
    LCD_entryModeSet(1, 0);            // increment AC, no display shift
    LCD_displayOnOffControl(1, 1, 1);  // display on, cursor on and blinking
    lcd_ready = 1;
}

void LCD_IRWrite(char c) {
    unsigned char k;
    lcd_ready = 0;
    DB = (c & 0xf0); // high nibble
    E = 1; E = 0;
    DB = (c << 4);   // low nibble
    E = 1; E = 0;
    delay(DELAY_AMOUNT);
    // CLEAR_DISPLAY and RETURN_HOME need extra delay (~1.5ms)
    if (c == CLEAR_DISPLAY || c == RETURN_HOME)
        for (k = 0; k < 30; k++) delay(DELAY_AMOUNT);
    lcd_ready = 1;
}

void LCD_functionSet(void) {
    lcd_ready = 0;
    // 4-bit mode: function set high nibble sent twice
    DB = 0x20;
    E = 1; E = 0;
    delay(DELAY_AMOUNT);
    E = 1; E = 0;
    delay(DELAY_AMOUNT);
    DB7 = 1; // 2-line mode
    E = 1; E = 0;
    delay(DELAY_AMOUNT);
    lcd_ready = 1;
}

void LCD_write_char(char c) {
    lcd_ready = 0;
    DB = (c & 0xf0) | 0x08; // high nibble, RS=1
    RS = 1;
    E = 1; E = 0;
    DB = (c << 4) | 0x08;   // low nibble, RS=1
    E = 1; E = 0;
    delay(DELAY_AMOUNT);
    lcd_ready = 1;
}

void LCD_write_string(char *str) {
    while (*str) {
        LCD_write_char(*str);
        str++;
    }
}

// Program custom 5x8 glyph to CG RAM, return to DD RAM
void LCD_set_symbol(char code, __code const char *symb) {
    unsigned char i;
    LCD_setCgRamAddress(code);
    for (i = 0; i < 8; i++)
        LCD_write_char(symb[i]);
    LCD_setDdRamAddress(0x00); // return to DD RAM for display
}

void delay(unsigned char n) {
    // n is in DPL; djnz decrements it until zero
    n;
    { __asm dhere: djnz dpl, dhere __endasm; }
}
