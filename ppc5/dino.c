/*
 * file: dino.c   -- Checkpoint 5, Part 2
 *
 * Cactus-dodging game on the cooperative threading core. THREE threads:
 *   main         : runs the game logic (difficulty, motion, collision, score)
 *   pad_thread   : edge-detects keypad presses into a one-slot mailbox
 *   draw_thread  : owns the LCD, repaints from a snapshot of the world
 *
 * IMPORTANT design rule on this 8051: all threads share register bank 0, so
 * SDCC would lay C auto-locals into low IRAM and they can overrun into the
 * game state. To make that impossible, EVERY variable here lives at a fixed
 * __data __at address and NO function uses C locals. That leaves 0x08-0x1F
 * free for SDCC's own expression temporaries.
 *
 * Only three threads are spawned (main + pad + draw), so the fourth stack
 * slot 0x70-0x7F is never used and is reused here for state.
 *
 * Fixed map:
 *   0x20 lcd_ready(lcdlib)
 *   0x21 wlock  0x22 phase  0x23 level    0x24 dinoRow
 *   0x25 keyBox 0x26 keyNew 0x27-28 score 0x29-2A row0  0x2B-2C row1
 *   0x2D-30 sbuf[4]  0x31 padDown 0x32 padCh 0x33 takeCh
 *   0x34 lk 0x35 lpicks 0x36 lwait 0x37 lrng
 *   0x38-3F scheduler (preemptive.c)
 *   0x70 lhot 0x71 dst 0x72 ddr 0x73 dcol 0x74 dcell 0x75-76 dm0 0x77-78 dm1
 *   0x79-7A fv 0x7B fh 0x7C ft 0x7D fn
 *
 * CS 342300 Spring 2026
 */

#include <8051.h>
#include "preemptive.h"
#include "keylib.h"
#include "lcdlib.h"

#define ST_SETUP  0
#define ST_PLAY   1
#define ST_DEAD   2

#define DINO   1          /* CG RAM glyph codes */
#define CACTUS 2

#define SPAWN_EVERY 2     /* inject a cactus every N steps */
#define SPEED_MIN   3     /* yields per step = (10-level)*3 + SPEED_MIN; tune */

/* ---- shared world ---- */
__data __at (0x21) char          wlock;
__data __at (0x22) unsigned char phase;
__data __at (0x23) unsigned char level;
__data __at (0x24) unsigned char dinoRow;
__data __at (0x25) char          keyBox;
__data __at (0x26) unsigned char keyNew;
__data __at (0x27) unsigned int  score;
__data __at (0x29) unsigned int  row0;
__data __at (0x2B) unsigned int  row1;
__data __at (0x2D) char          sbuf[4];

/* ---- pad_thread state ---- */
__data __at (0x31) unsigned char padDown;
__data __at (0x32) char          padCh;

/* ---- mailbox read scratch (logic) ---- */
__data __at (0x33) char          takeCh;

/* ---- logic state ---- */
__data __at (0x34) char          lk;
__data __at (0x35) unsigned char lpicks;
__data __at (0x36) unsigned char lwait;
__data __at (0x37) unsigned char lrng;
__data __at (0x70) unsigned char lhot;

/* ---- draw_thread state (Thread-3 slot, unused) ---- */
__data __at (0x71) unsigned char dst;
__data __at (0x72) unsigned char ddr;
__data __at (0x73) unsigned char dcol;
__data __at (0x74) char          dcell;
__data __at (0x75) unsigned int  dm0;
__data __at (0x77) unsigned int  dm1;

/* ---- score formatting ---- */
__data __at (0x79) unsigned int  fv;
__data __at (0x7B) unsigned char fh;
__data __at (0x7C) unsigned char ft;
__data __at (0x7D) unsigned char fn;

__code const char dino_bmp[8]   = {0x07, 0x05, 0x06, 0x07, 0x14, 0x17, 0x0E, 0x0A};
__code const char cactus_bmp[8] = {0x04, 0x05, 0x15, 0x15, 0x16, 0x0C, 0x04, 0x04};

/* ====================== helpers (no C locals) ====================== */

/* pull the queued key into takeCh, or 0 if the mailbox is empty */
static void take_key(void)
{
    takeCh = 0;
    SemaphoreWait(wlock);
    if (keyNew) { takeCh = keyBox; keyNew = 0; }
    SemaphoreSignal(wlock);
}

/* render `score` as decimal text in sbuf using subtraction (no divide) */
static void score_to_text(void)
{
    fv = score;
    if (fv > 999) fv = 999;
    fh = 0; while (fv >= 100) { fv -= 100; fh++; }
    ft = 0; while (fv >= 10)  { fv -= 10;  ft++; }
    fn = 0;
    if (fh)         { sbuf[fn] = '0' + fh; fn++; }
    if (fh || ft)   { sbuf[fn] = '0' + ft; fn++; }
    sbuf[fn] = '0' + (unsigned char)fv; fn++;
    sbuf[fn] = 0;
}

/* ====================== keypad thread ====================== */
void pad_thread(void)
{
    Init_Keypad();
    padDown = 0;
    for (;;) {
        if (AnyKeyPressed()) {
            if (!padDown) {
                padDown = 1;
                padCh = KeyToChar();
                if (padCh) {
                    SemaphoreWait(wlock);
                    if (!keyNew) { keyBox = padCh; keyNew = 1; }
                    SemaphoreSignal(wlock);
                }
            }
        } else {
            padDown = 0;
        }
        ThreadYield();
    }
}

/* ====================== render thread ====================== */
void draw_thread(void)
{
    LCD_Init();
    LCD_set_symbol('\10', dino_bmp);    /* glyph code 1 */
    LCD_set_symbol('\20', cactus_bmp);  /* glyph code 2 */

    for (;;) {
        SemaphoreWait(wlock);
        dst = phase;
        ddr = dinoRow;
        dm0 = row0;
        dm1 = row1;
        SemaphoreSignal(wlock);

        if (dst == ST_PLAY) {
            LCD_setDdRamAddress(0x00);
            for (dcol = 0; dcol < 16; dcol++) {
                if (dcol == 0 && ddr == 0) dcell = DINO;
                else if (dm0 & 1)          dcell = CACTUS;
                else                       dcell = ' ';
                LCD_write_char(dcell);
                dm0 >>= 1;
            }
            LCD_setDdRamAddress(0x40);
            for (dcol = 0; dcol < 16; dcol++) {
                if (dcol == 0 && ddr == 1) dcell = DINO;
                else if (dm1 & 1)          dcell = CACTUS;
                else                       dcell = ' ';
                LCD_write_char(dcell);
                dm1 >>= 1;
            }
        } else if (dst == ST_SETUP) {
            LCD_setDdRamAddress(0x00);
            LCD_write_string("Set 0-9 then #  ");
            LCD_setDdRamAddress(0x40);
            LCD_write_string("Level: ");
            LCD_write_char('0' + level);
            LCD_write_string("        ");
        } else {
            LCD_setDdRamAddress(0x00);
            LCD_write_string("Game Over       ");
            LCD_setDdRamAddress(0x40);
            LCD_write_string("Score: ");
            LCD_write_string(sbuf);
            LCD_write_string("       ");
        }
        ThreadYield();
    }
}

/* ====================== logic (runs as main / Thread 0) ====================== */
void main(void)
{
    SemaphoreCreate(wlock, 1);
    keyNew = 0;
    phase  = ST_SETUP;
    level  = 0;

    ThreadCreate(pad_thread);    /* Thread 1 */
    ThreadCreate(draw_thread);   /* Thread 2 */

    /* difficulty select: a digit, then '#' */
    for (;;) {
        take_key();
        lk = takeCh;
        if (lk >= '0' && lk <= '9') level = (unsigned char)(lk - '0');
        else if (lk == '#') break;
        ThreadYield();
    }

    /* new game */
    SemaphoreWait(wlock);
    row0 = 0; row1 = 0; dinoRow = 0; score = 0; phase = ST_PLAY;
    SemaphoreSignal(wlock);
    lpicks = 0;
    lrng   = 0xA5;

    for (;;) {
        /* movement */
        take_key();
        lk = takeCh;
        if      (lk == '2') dinoRow = 0;
        else if (lk == '8') dinoRow = 1;

        /* a cactus already in the dino's cell is fatal */
        SemaphoreWait(wlock);
        lhot = dinoRow ? (row1 & 1) : (row0 & 1);
        SemaphoreSignal(wlock);
        if (lhot) break;

        /* pace the frame; yield so pad and draw keep running */
        lwait = (unsigned char)(10 - level);
        lwait = lwait + lwait + lwait + SPEED_MIN;   /* (10-level)*3 + min */
        while (lwait) { ThreadYield(); lwait--; }

        /* dodge scores a point, then slide every cactus one column left */
        SemaphoreWait(wlock);
        if (dinoRow == 0) { if (row1 & 1) score++; }
        else              { if (row0 & 1) score++; }
        row0 >>= 1;
        row1 >>= 1;
        SemaphoreSignal(wlock);

        /* spawn, keeping column 14 empty so the wall is always passable */
        lpicks++;
        if (lpicks >= SPAWN_EVERY) {
            lpicks = 0;
            lrng = (lrng & 1) ? ((lrng >> 1) ^ 0xB8) : (lrng >> 1);
            SemaphoreWait(wlock);
            if (((row0 | row1) & 0x4000) == 0) {
                if (lrng & 1) row1 |= 0x8000;
                else          row0 |= 0x8000;
            }
            SemaphoreSignal(wlock);
        }
        ThreadYield();
    }

    /* dead: publish score, then idle */
    score_to_text();
    SemaphoreWait(wlock);
    phase = ST_DEAD;
    SemaphoreSignal(wlock);
    for (;;) { ThreadYield(); }
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
