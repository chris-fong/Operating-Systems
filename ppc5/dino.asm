;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.10 #15658 (MINGW64)
;--------------------------------------------------------
	.module dino
	
	.optsdcc -mmcs51 --model-small
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _cactus_bmp
	.globl _dino_bmp
	.globl _timer0_ISR
	.globl __mcs51_genXRAMCLEAR
	.globl __mcs51_genXINIT
	.globl __mcs51_genRAMCLEAR
	.globl __sdcc_gsinit_startup
	.globl _main
	.globl _draw_thread
	.globl _pad_thread
	.globl _LCD_set_symbol
	.globl _LCD_write_string
	.globl _LCD_write_char
	.globl _LCD_IRWrite
	.globl _LCD_Init
	.globl _AnyKeyPressed
	.globl _KeyToChar
	.globl _Init_Keypad
	.globl _ThreadYield
	.globl _ThreadCreate
	.globl _CY
	.globl _AC
	.globl _F0
	.globl _RS1
	.globl _RS0
	.globl _OV
	.globl _F1
	.globl _P
	.globl _PS
	.globl _PT1
	.globl _PX1
	.globl _PT0
	.globl _PX0
	.globl _RD
	.globl _WR
	.globl _T1
	.globl _T0
	.globl _INT1
	.globl _INT0
	.globl _TXD
	.globl _RXD
	.globl _P3_7
	.globl _P3_6
	.globl _P3_5
	.globl _P3_4
	.globl _P3_3
	.globl _P3_2
	.globl _P3_1
	.globl _P3_0
	.globl _EA
	.globl _ES
	.globl _ET1
	.globl _EX1
	.globl _ET0
	.globl _EX0
	.globl _P2_7
	.globl _P2_6
	.globl _P2_5
	.globl _P2_4
	.globl _P2_3
	.globl _P2_2
	.globl _P2_1
	.globl _P2_0
	.globl _SM0
	.globl _SM1
	.globl _SM2
	.globl _REN
	.globl _TB8
	.globl _RB8
	.globl _TI
	.globl _RI
	.globl _P1_7
	.globl _P1_6
	.globl _P1_5
	.globl _P1_4
	.globl _P1_3
	.globl _P1_2
	.globl _P1_1
	.globl _P1_0
	.globl _TF1
	.globl _TR1
	.globl _TF0
	.globl _TR0
	.globl _IE1
	.globl _IT1
	.globl _IE0
	.globl _IT0
	.globl _P0_7
	.globl _P0_6
	.globl _P0_5
	.globl _P0_4
	.globl _P0_3
	.globl _P0_2
	.globl _P0_1
	.globl _P0_0
	.globl _B
	.globl _ACC
	.globl _PSW
	.globl _IP
	.globl _P3
	.globl _IE
	.globl _P2
	.globl _SBUF
	.globl _SCON
	.globl _P1
	.globl _TH1
	.globl _TH0
	.globl _TL1
	.globl _TL0
	.globl _TMOD
	.globl _TCON
	.globl _PCON
	.globl _DPH
	.globl _DPL
	.globl _SP
	.globl _P0
	.globl _fn
	.globl _ft
	.globl _fh
	.globl _fv
	.globl _dm1
	.globl _dm0
	.globl _dcell
	.globl _dcol
	.globl _ddr
	.globl _dst
	.globl _lhot
	.globl _lrng
	.globl _lwait
	.globl _lpicks
	.globl _lk
	.globl _takeCh
	.globl _padCh
	.globl _padDown
	.globl _sbuf
	.globl _row1
	.globl _row0
	.globl _score
	.globl _keyNew
	.globl _keyBox
	.globl _dinoRow
	.globl _level
	.globl _phase
	.globl _wlock
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
_P0	=	0x0080
_SP	=	0x0081
_DPL	=	0x0082
_DPH	=	0x0083
_PCON	=	0x0087
_TCON	=	0x0088
_TMOD	=	0x0089
_TL0	=	0x008a
_TL1	=	0x008b
_TH0	=	0x008c
_TH1	=	0x008d
_P1	=	0x0090
_SCON	=	0x0098
_SBUF	=	0x0099
_P2	=	0x00a0
_IE	=	0x00a8
_P3	=	0x00b0
_IP	=	0x00b8
_PSW	=	0x00d0
_ACC	=	0x00e0
_B	=	0x00f0
;--------------------------------------------------------
; special function bits
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
_P0_0	=	0x0080
_P0_1	=	0x0081
_P0_2	=	0x0082
_P0_3	=	0x0083
_P0_4	=	0x0084
_P0_5	=	0x0085
_P0_6	=	0x0086
_P0_7	=	0x0087
_IT0	=	0x0088
_IE0	=	0x0089
_IT1	=	0x008a
_IE1	=	0x008b
_TR0	=	0x008c
_TF0	=	0x008d
_TR1	=	0x008e
_TF1	=	0x008f
_P1_0	=	0x0090
_P1_1	=	0x0091
_P1_2	=	0x0092
_P1_3	=	0x0093
_P1_4	=	0x0094
_P1_5	=	0x0095
_P1_6	=	0x0096
_P1_7	=	0x0097
_RI	=	0x0098
_TI	=	0x0099
_RB8	=	0x009a
_TB8	=	0x009b
_REN	=	0x009c
_SM2	=	0x009d
_SM1	=	0x009e
_SM0	=	0x009f
_P2_0	=	0x00a0
_P2_1	=	0x00a1
_P2_2	=	0x00a2
_P2_3	=	0x00a3
_P2_4	=	0x00a4
_P2_5	=	0x00a5
_P2_6	=	0x00a6
_P2_7	=	0x00a7
_EX0	=	0x00a8
_ET0	=	0x00a9
_EX1	=	0x00aa
_ET1	=	0x00ab
_ES	=	0x00ac
_EA	=	0x00af
_P3_0	=	0x00b0
_P3_1	=	0x00b1
_P3_2	=	0x00b2
_P3_3	=	0x00b3
_P3_4	=	0x00b4
_P3_5	=	0x00b5
_P3_6	=	0x00b6
_P3_7	=	0x00b7
_RXD	=	0x00b0
_TXD	=	0x00b1
_INT0	=	0x00b2
_INT1	=	0x00b3
_T0	=	0x00b4
_T1	=	0x00b5
_WR	=	0x00b6
_RD	=	0x00b7
_PX0	=	0x00b8
_PT0	=	0x00b9
_PX1	=	0x00ba
_PT1	=	0x00bb
_PS	=	0x00bc
_P	=	0x00d0
_F1	=	0x00d1
_OV	=	0x00d2
_RS0	=	0x00d3
_RS1	=	0x00d4
_F0	=	0x00d5
_AC	=	0x00d6
_CY	=	0x00d7
;--------------------------------------------------------
; overlayable register banks
;--------------------------------------------------------
	.area REG_BANK_0	(REL,OVR,DATA)
	.ds 8
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	.area DSEG    (DATA)
_wlock	=	0x0021
_phase	=	0x0022
_level	=	0x0023
_dinoRow	=	0x0024
_keyBox	=	0x0025
_keyNew	=	0x0026
_score	=	0x0027
_row0	=	0x0029
_row1	=	0x002b
_sbuf	=	0x002d
_padDown	=	0x0031
_padCh	=	0x0032
_takeCh	=	0x0033
_lk	=	0x0034
_lpicks	=	0x0035
_lwait	=	0x0036
_lrng	=	0x0037
_lhot	=	0x0070
_dst	=	0x0071
_ddr	=	0x0072
_dcol	=	0x0073
_dcell	=	0x0074
_dm0	=	0x0075
_dm1	=	0x0077
_fv	=	0x0079
_fh	=	0x007b
_ft	=	0x007c
_fn	=	0x007d
;--------------------------------------------------------
; overlayable items in internal ram
;--------------------------------------------------------
;--------------------------------------------------------
; Stack segment in internal ram
;--------------------------------------------------------
	.area SSEG
__start__stack:
	.ds	1

;--------------------------------------------------------
; indirectly addressable internal ram data
;--------------------------------------------------------
	.area ISEG    (DATA)
;--------------------------------------------------------
; absolute internal ram data
;--------------------------------------------------------
	.area IABS    (ABS,DATA)
	.area IABS    (ABS,DATA)
;--------------------------------------------------------
; bit data
;--------------------------------------------------------
	.area BSEG    (BIT)
;--------------------------------------------------------
; paged external ram data
;--------------------------------------------------------
	.area PSEG    (PAG,XDATA)
;--------------------------------------------------------
; uninitialized external ram data
;--------------------------------------------------------
	.area XSEG    (XDATA)
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area XABS    (ABS,XDATA)
;--------------------------------------------------------
; initialized external ram data
;--------------------------------------------------------
	.area XISEG   (XDATA)
	.area HOME    (CODE)
	.area GSINIT0 (CODE)
	.area GSINIT1 (CODE)
	.area GSINIT2 (CODE)
	.area GSINIT3 (CODE)
	.area GSINIT4 (CODE)
	.area GSINIT5 (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area CSEG    (CODE)
;--------------------------------------------------------
; interrupt vector
;--------------------------------------------------------
	.area HOME    (CODE)
__interrupt_vect:
	ljmp	__sdcc_gsinit_startup
	reti
	.ds	7
	ljmp	_timer0_ISR
; restartable atomic support routines
	.ds	2
sdcc_atomic_exchange_rollback_start::
	nop
	nop
sdcc_atomic_exchange_pdata_impl:
	movx	a, @r0
	mov	r3, a
	mov	a, r2
	movx	@r0, a
	sjmp	sdcc_atomic_exchange_exit
	nop
	nop
sdcc_atomic_exchange_xdata_impl:
	movx	a, @dptr
	mov	r3, a
	mov	a, r2
	movx	@dptr, a
	sjmp	sdcc_atomic_exchange_exit
sdcc_atomic_compare_exchange_idata_impl:
	mov	a, @r0
	cjne	a, ar2, .+#5
	mov	a, r3
	mov	@r0, a
	ret
	nop
sdcc_atomic_compare_exchange_pdata_impl:
	movx	a, @r0
	cjne	a, ar2, .+#5
	mov	a, r3
	movx	@r0, a
	ret
	nop
sdcc_atomic_compare_exchange_xdata_impl:
	movx	a, @dptr
	cjne	a, ar2, .+#5
	mov	a, r3
	movx	@dptr, a
	ret
sdcc_atomic_exchange_rollback_end::

sdcc_atomic_exchange_gptr_impl::
	jnb	b.6, sdcc_atomic_exchange_xdata_impl
	mov	r0, dpl
	jb	b.5, sdcc_atomic_exchange_pdata_impl
sdcc_atomic_exchange_idata_impl:
	mov	a, r2
	xch	a, @r0
	mov	dpl, a
	ret
sdcc_atomic_exchange_exit:
	mov	dpl, r3
	ret
sdcc_atomic_compare_exchange_gptr_impl::
	jnb	b.6, sdcc_atomic_compare_exchange_xdata_impl
	mov	r0, dpl
	jb	b.5, sdcc_atomic_compare_exchange_pdata_impl
	sjmp	sdcc_atomic_compare_exchange_idata_impl
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME    (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area GSINIT  (CODE)
	.globl __sdcc_gsinit_startup
	.globl __sdcc_program_startup
	.globl __start__stack
	.globl __mcs51_genXINIT
	.globl __mcs51_genXRAMCLEAR
	.globl __mcs51_genRAMCLEAR
	.area GSFINAL (CODE)
	ljmp	__sdcc_program_startup
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME    (CODE)
	.area HOME    (CODE)
__sdcc_program_startup:
	ljmp	_main
;	return from main will return to caller
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CSEG    (CODE)
;------------------------------------------------------------
;Allocation info for local variables in function 'take_key'
;------------------------------------------------------------
;	dino.c:92: static void take_key(void)
;	-----------------------------------------
;	 function take_key
;	-----------------------------------------
_take_key:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
;	dino.c:94: takeCh = 0;
	mov	_takeCh,#0x00
;	dino.c:95: SemaphoreWait(wlock);
0$:
	MOV A, _wlock 
	JZ 0$ 
	JB ACC.7, 0$ 
	DEC _wlock 
;	dino.c:96: if (keyNew) { takeCh = keyBox; keyNew = 0; }
	mov	a,_keyNew
	jz	00102$
	mov	_takeCh,_keyBox
	mov	_keyNew,#0x00
00102$:
;	dino.c:97: SemaphoreSignal(wlock);
	INC	_wlock 
;	dino.c:98: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'score_to_text'
;------------------------------------------------------------
;	dino.c:101: static void score_to_text(void)
;	-----------------------------------------
;	 function score_to_text
;	-----------------------------------------
_score_to_text:
;	dino.c:103: fv = score;
	mov	_fv,_score
	mov	(_fv + 1),(_score + 1)
;	dino.c:104: if (fv > 999) fv = 999;
	clr	c
	mov	a,#0xe7
	subb	a,_fv
	mov	a,#0x03
	subb	a,(_fv + 1)
	jnc	00102$
	mov	_fv,#0xe7
	mov	(_fv + 1),#0x03
00102$:
;	dino.c:105: fh = 0; while (fv >= 100) { fv -= 100; fh++; }
	mov	_fh,#0x00
00103$:
	clr	c
	mov	a,_fv
	subb	a,#0x64
	mov	a,(_fv + 1)
	subb	a,#0x00
	jc	00105$
	mov	a,_fv
	add	a,#0x9c
	mov	_fv,a
	mov	a,(_fv + 1)
	addc	a,#0xff
	mov	(_fv + 1),a
	mov	a,_fh
	inc	a
	mov	_fh,a
	sjmp	00103$
00105$:
;	dino.c:106: ft = 0; while (fv >= 10)  { fv -= 10;  ft++; }
	mov	_ft,#0x00
00106$:
	clr	c
	mov	a,_fv
	subb	a,#0x0a
	mov	a,(_fv + 1)
	subb	a,#0x00
	jc	00108$
	mov	a,_fv
	add	a,#0xf6
	mov	_fv,a
	mov	a,(_fv + 1)
	addc	a,#0xff
	mov	(_fv + 1),a
	mov	a,_ft
	inc	a
	mov	_ft,a
	sjmp	00106$
00108$:
;	dino.c:107: fn = 0;
	mov	_fn,#0x00
;	dino.c:108: if (fh)         { sbuf[fn] = '0' + fh; fn++; }
	mov	a,_fh
	jz	00110$
	mov	a,_fn
	add	a, #_sbuf
	mov	r1,a
	mov	r7,_fh
	mov	a,#0x30
	add	a, r7
	mov	@r1,a
	mov	a,_fn
	inc	a
	mov	_fn,a
00110$:
;	dino.c:109: if (fh || ft)   { sbuf[fn] = '0' + ft; fn++; }
	mov	a,_fh
	jnz	00111$
	mov	a,_ft
	jz	00112$
00111$:
	mov	a,_fn
	add	a, #_sbuf
	mov	r1,a
	mov	r7,_ft
	mov	a,#0x30
	add	a, r7
	mov	@r1,a
	mov	a,_fn
	inc	a
	mov	_fn,a
00112$:
;	dino.c:110: sbuf[fn] = '0' + (unsigned char)fv; fn++;
	mov	a,_fn
	add	a, #_sbuf
	mov	r1,a
	mov	r7,_fv
	mov	a,#0x30
	add	a, r7
	mov	@r1,a
	mov	a,_fn
	inc	a
	mov	_fn,a
;	dino.c:111: sbuf[fn] = 0;
	mov	a,_fn
	add	a, #_sbuf
	mov	r0,a
	mov	@r0,#0x00
;	dino.c:112: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'pad_thread'
;------------------------------------------------------------
;	dino.c:115: void pad_thread(void)
;	-----------------------------------------
;	 function pad_thread
;	-----------------------------------------
_pad_thread:
;	dino.c:117: Init_Keypad();
	lcall	_Init_Keypad
;	dino.c:118: padDown = 0;
	mov	_padDown,#0x00
00111$:
;	dino.c:120: if (AnyKeyPressed()) {
	lcall	_AnyKeyPressed
	mov	a, dpl
	jz	00108$
;	dino.c:121: if (!padDown) {
	mov	a,_padDown
	jnz	00109$
;	dino.c:122: padDown = 1;
	mov	_padDown,#0x01
;	dino.c:123: padCh = KeyToChar();
	lcall	_KeyToChar
	mov	_padCh,dpl
;	dino.c:124: if (padCh) {
	mov	a,_padCh
	jz	00109$
;	dino.c:125: SemaphoreWait(wlock);
1$:
	MOV A, _wlock 
	JZ 1$ 
	JB ACC.7, 1$ 
	DEC _wlock 
;	dino.c:126: if (!keyNew) { keyBox = padCh; keyNew = 1; }
	mov	a,_keyNew
	jnz	00102$
	mov	_keyBox,_padCh
	mov	_keyNew,#0x01
00102$:
;	dino.c:127: SemaphoreSignal(wlock);
	INC	_wlock 
	sjmp	00109$
00108$:
;	dino.c:131: padDown = 0;
	mov	_padDown,#0x00
00109$:
;	dino.c:133: ThreadYield();
	lcall	_ThreadYield
;	dino.c:135: }
	sjmp	00111$
;------------------------------------------------------------
;Allocation info for local variables in function 'draw_thread'
;------------------------------------------------------------
;	dino.c:138: void draw_thread(void)
;	-----------------------------------------
;	 function draw_thread
;	-----------------------------------------
_draw_thread:
;	dino.c:140: LCD_Init();
	lcall	_LCD_Init
;	dino.c:141: LCD_set_symbol('\10', dino_bmp);    /* glyph code 1 */
	mov	_LCD_set_symbol_PARM_2,#_dino_bmp
	mov	(_LCD_set_symbol_PARM_2 + 1),#(_dino_bmp >> 8)
	mov	dpl, #0x08
	lcall	_LCD_set_symbol
;	dino.c:142: LCD_set_symbol('\20', cactus_bmp);  /* glyph code 2 */
	mov	_LCD_set_symbol_PARM_2,#_cactus_bmp
	mov	(_LCD_set_symbol_PARM_2 + 1),#(_cactus_bmp >> 8)
	mov	dpl, #0x10
	lcall	_LCD_set_symbol
00130$:
;	dino.c:145: SemaphoreWait(wlock);
2$:
	MOV A, _wlock 
	JZ 2$ 
	JB ACC.7, 2$ 
	DEC _wlock 
;	dino.c:146: dst = phase;
	mov	_dst,_phase
;	dino.c:147: ddr = dinoRow;
	mov	_ddr,_dinoRow
;	dino.c:148: dm0 = row0;
	mov	_dm0,_row0
	mov	(_dm0 + 1),(_row0 + 1)
;	dino.c:149: dm1 = row1;
	mov	_dm1,_row1
	mov	(_dm1 + 1),(_row1 + 1)
;	dino.c:150: SemaphoreSignal(wlock);
	INC	_wlock 
;	dino.c:152: if (dst == ST_PLAY) {
	mov	a,#0x01
	cjne	a,_dst,00212$
	sjmp	00213$
00212$:
	ljmp	00121$
00213$:
;	dino.c:153: LCD_setDdRamAddress(0x00);
	mov	dpl, #0x80
	lcall	_LCD_IRWrite
;	dino.c:154: for (dcol = 0; dcol < 16; dcol++) {
	mov	_dcol,#0x00
00125$:
	mov	a,#0x100 - 0x10
	add	a,_dcol
	jc	00108$
;	dino.c:155: if (dcol == 0 && ddr == 0) dcell = DINO;
	mov	a,_dcol
	jnz	00105$
	mov	a,_ddr
	jnz	00105$
	mov	_dcell,#0x01
	sjmp	00106$
00105$:
;	dino.c:156: else if (dm0 & 1)          dcell = CACTUS;
	mov	a,_dm0
	jnb	acc.0,00102$
	mov	_dcell,#0x02
	sjmp	00106$
00102$:
;	dino.c:157: else                       dcell = ' ';
	mov	_dcell,#0x20
00106$:
;	dino.c:158: LCD_write_char(dcell);
	mov	dpl, _dcell
	lcall	_LCD_write_char
;	dino.c:159: dm0 >>= 1;
	mov	a,(_dm0 + 1)
	clr	c
	rrc	a
	xch	a,_dm0
	rrc	a
	xch	a,_dm0
	mov	(_dm0 + 1),a
;	dino.c:154: for (dcol = 0; dcol < 16; dcol++) {
	mov	a,_dcol
	inc	a
	mov	_dcol,a
	sjmp	00125$
00108$:
;	dino.c:161: LCD_setDdRamAddress(0x40);
	mov	dpl, #0xc0
	lcall	_LCD_IRWrite
;	dino.c:162: for (dcol = 0; dcol < 16; dcol++) {
	mov	_dcol,#0x00
00128$:
	mov	a,#0x100 - 0x10
	add	a,_dcol
	jnc	00218$
	ljmp	00122$
00218$:
;	dino.c:163: if (dcol == 0 && ddr == 1) dcell = DINO;
	mov	a,_dcol
	jnz	00113$
	mov	a,#0x01
	cjne	a,_ddr,00113$
	mov	_dcell,#0x01
	sjmp	00114$
00113$:
;	dino.c:164: else if (dm1 & 1)          dcell = CACTUS;
	mov	a,_dm1
	jnb	acc.0,00110$
	mov	_dcell,#0x02
	sjmp	00114$
00110$:
;	dino.c:165: else                       dcell = ' ';
	mov	_dcell,#0x20
00114$:
;	dino.c:166: LCD_write_char(dcell);
	mov	dpl, _dcell
	lcall	_LCD_write_char
;	dino.c:167: dm1 >>= 1;
	mov	a,(_dm1 + 1)
	clr	c
	rrc	a
	xch	a,_dm1
	rrc	a
	xch	a,_dm1
	mov	(_dm1 + 1),a
;	dino.c:162: for (dcol = 0; dcol < 16; dcol++) {
	mov	a,_dcol
	inc	a
	mov	_dcol,a
	sjmp	00128$
00121$:
;	dino.c:169: } else if (dst == ST_SETUP) {
	mov	a,_dst
	jnz	00118$
;	dino.c:170: LCD_setDdRamAddress(0x00);
	mov	dpl, #0x80
	lcall	_LCD_IRWrite
;	dino.c:171: LCD_write_string("Set 0-9 then #  ");
	mov	dptr,#___str_0
	mov	b, #0x80
	lcall	_LCD_write_string
;	dino.c:172: LCD_setDdRamAddress(0x40);
	mov	dpl, #0xc0
	lcall	_LCD_IRWrite
;	dino.c:173: LCD_write_string("Level: ");
	mov	dptr,#___str_1
	mov	b, #0x80
	lcall	_LCD_write_string
;	dino.c:174: LCD_write_char('0' + level);
	mov	r7,_level
	mov	a,#0x30
	add	a, r7
	mov	dpl,a
	lcall	_LCD_write_char
;	dino.c:175: LCD_write_string("        ");
	mov	dptr,#___str_2
	mov	b, #0x80
	lcall	_LCD_write_string
	sjmp	00122$
00118$:
;	dino.c:177: LCD_setDdRamAddress(0x00);
	mov	dpl, #0x80
	lcall	_LCD_IRWrite
;	dino.c:178: LCD_write_string("Game Over       ");
	mov	dptr,#___str_3
	mov	b, #0x80
	lcall	_LCD_write_string
;	dino.c:179: LCD_setDdRamAddress(0x40);
	mov	dpl, #0xc0
	lcall	_LCD_IRWrite
;	dino.c:180: LCD_write_string("Score: ");
	mov	dptr,#___str_4
	mov	b, #0x80
	lcall	_LCD_write_string
;	dino.c:181: LCD_write_string(sbuf);
	mov	dptr,#_sbuf
	mov	b, #0x40
	lcall	_LCD_write_string
;	dino.c:182: LCD_write_string("       ");
	mov	dptr,#___str_5
	mov	b, #0x80
	lcall	_LCD_write_string
00122$:
;	dino.c:184: ThreadYield();
	lcall	_ThreadYield
;	dino.c:186: }
	ljmp	00130$
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;	dino.c:189: void main(void)
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	dino.c:191: SemaphoreCreate(wlock, 1);
	mov	_wlock,#0x01
;	dino.c:192: keyNew = 0;
	mov	_keyNew,#0x00
;	dino.c:193: phase  = ST_SETUP;
	mov	_phase,#0x00
;	dino.c:194: level  = 0;
	mov	_level,#0x00
;	dino.c:196: ThreadCreate(pad_thread);    /* Thread 1 */
	mov	dptr,#_pad_thread
	lcall	_ThreadCreate
;	dino.c:197: ThreadCreate(draw_thread);   /* Thread 2 */
	mov	dptr,#_draw_thread
	lcall	_ThreadCreate
00134$:
;	dino.c:201: take_key();
	lcall	_take_key
;	dino.c:202: lk = takeCh;
	mov	_lk,_takeCh
;	dino.c:203: if (lk >= '0' && lk <= '9') level = (unsigned char)(lk - '0');
	mov	a,#0x100 - 0x30
	add	a,_lk
	jnc	00104$
	mov	a,_lk
	add	a,#0xff - 0x39
	jc	00104$
	mov	a,_lk
	add	a,#0xd0
	mov	_level, a
	sjmp	00105$
00104$:
;	dino.c:204: else if (lk == '#') break;
	mov	a,#0x23
	cjne	a,_lk,00256$
	sjmp	00107$
00256$:
00105$:
;	dino.c:205: ThreadYield();
	lcall	_ThreadYield
	sjmp	00134$
00107$:
;	dino.c:209: SemaphoreWait(wlock);
3$:
	MOV A, _wlock 
	JZ 3$ 
	JB ACC.7, 3$ 
	DEC _wlock 
;	dino.c:210: row0 = 0; row1 = 0; dinoRow = 0; score = 0; phase = ST_PLAY;
	clr	a
	mov	_row0,a
	mov	(_row0 + 1),a
	mov	_row1,a
	mov	(_row1 + 1),a
	mov	_dinoRow,a
	mov	_score,a
	mov	(_score + 1),a
	mov	_phase,#0x01
;	dino.c:211: SemaphoreSignal(wlock);
	INC	_wlock 
;	dino.c:212: lpicks = 0;
	mov	_lpicks,#0x00
;	dino.c:213: lrng   = 0xA5;
	mov	_lrng,#0xa5
00136$:
;	dino.c:217: take_key();
	lcall	_take_key
;	dino.c:218: lk = takeCh;
	mov	_lk,_takeCh
;	dino.c:219: if      (lk == '2') dinoRow = 0;
	mov	a,#0x32
	cjne	a,_lk,00111$
	mov	_dinoRow,#0x00
	sjmp	00112$
00111$:
;	dino.c:220: else if (lk == '8') dinoRow = 1;
	mov	a,#0x38
	cjne	a,_lk,00112$
	mov	_dinoRow,#0x01
00112$:
;	dino.c:223: SemaphoreWait(wlock);
4$:
	MOV A, _wlock 
	JZ 4$ 
	JB ACC.7, 4$ 
	DEC _wlock 
;	dino.c:224: lhot = dinoRow ? (row1 & 1) : (row0 & 1);
	mov	a,_dinoRow
	jz	00142$
	mov	r7,_row1
	anl	ar7,#0x01
	sjmp	00143$
00142$:
	mov	r6,_row0
	mov	a,#0x01
	anl	a,r6
	mov	r7,a
00143$:
	mov	_lhot,r7
;	dino.c:225: SemaphoreSignal(wlock);
	INC	_wlock 
;	dino.c:226: if (lhot) break;
	mov	a,_lhot
	jz	00262$
	ljmp	00132$
00262$:
;	dino.c:229: lwait = (unsigned char)(10 - level);
	mov	r7,_level
	mov	a,#0x0a
	clr	c
	subb	a,r7
	mov	_lwait, a
;	dino.c:230: lwait = lwait + lwait + lwait + SPEED_MIN;   /* (10-level)*3 + min */
	mov	a,_lwait
	add	a, _lwait
	add	a, _lwait
	mov	r7,a
	add	a,#0x03
	mov	_lwait,a
;	dino.c:231: while (lwait) { ThreadYield(); lwait--; }
00115$:
	mov	a,_lwait
	jz	00117$
	lcall	_ThreadYield
	mov	a,_lwait
	dec	a
	mov	_lwait,a
	sjmp	00115$
00117$:
;	dino.c:234: SemaphoreWait(wlock);
5$:
	MOV A, _wlock 
	JZ 5$ 
	JB ACC.7, 5$ 
	DEC _wlock 
;	dino.c:235: if (dinoRow == 0) { if (row1 & 1) score++; }
	mov	a,_dinoRow
	jnz	00123$
	mov	a,_row1
	jnb	acc.0,00124$
	mov	r6,_score
	mov	r7,(_score + 1)
	mov	a,#0x01
	add	a, r6
	mov	_score,a
	clr	a
	addc	a, r7
	mov	(_score + 1),a
	sjmp	00124$
00123$:
;	dino.c:236: else              { if (row0 & 1) score++; }
	mov	a,_row0
	jnb	acc.0,00124$
	mov	r6,_score
	mov	r7,(_score + 1)
	mov	a,#0x01
	add	a, r6
	mov	_score,a
	clr	a
	addc	a, r7
	mov	(_score + 1),a
00124$:
;	dino.c:237: row0 >>= 1;
	mov	a,(_row0 + 1)
	clr	c
	rrc	a
	xch	a,_row0
	rrc	a
	xch	a,_row0
	mov	(_row0 + 1),a
;	dino.c:238: row1 >>= 1;
	mov	a,(_row1 + 1)
	clr	c
	rrc	a
	xch	a,_row1
	rrc	a
	xch	a,_row1
	mov	(_row1 + 1),a
;	dino.c:239: SemaphoreSignal(wlock);
	INC	_wlock 
;	dino.c:242: lpicks++;
	mov	a,_lpicks
	inc	a
	mov	_lpicks,a
;	dino.c:243: if (lpicks >= SPAWN_EVERY) {
	mov	a,#0x100 - 0x02
	add	a,_lpicks
	jnc	00131$
;	dino.c:244: lpicks = 0;
	mov	_lpicks,#0x00
;	dino.c:245: lrng = (lrng & 1) ? ((lrng >> 1) ^ 0xB8) : (lrng >> 1);
	mov	a,_lrng
	jnb	acc.0,00144$
	mov	a,_lrng
	clr	c
	rrc	a
	mov	r7,a
	xrl	ar7,#0xb8
	sjmp	00145$
00144$:
	mov	a,_lrng
	clr	c
	rrc	a
	mov	r7,a
00145$:
	mov	_lrng,r7
;	dino.c:246: SemaphoreWait(wlock);
6$:
	MOV A, _wlock 
	JZ 6$ 
	JB ACC.7, 6$ 
	DEC _wlock 
;	dino.c:247: if (((row0 | row1) & 0x4000) == 0) {
	mov	a,_row1
	orl	a,_row0
	mov	r6,a
	mov	a,(_row1 + 1)
	orl	a,(_row0 + 1)
	mov	r7,a
	jb	acc.6,00129$
;	dino.c:248: if (lrng & 1) row1 |= 0x8000;
	mov	a,_lrng
	jnb	acc.0,00126$
	mov	a,_row1
	orl	(_row1 + 1),#0x80
	sjmp	00129$
00126$:
;	dino.c:249: else          row0 |= 0x8000;
	mov	a,_row0
	orl	(_row0 + 1),#0x80
00129$:
;	dino.c:251: SemaphoreSignal(wlock);
	INC	_wlock 
00131$:
;	dino.c:253: ThreadYield();
	lcall	_ThreadYield
	ljmp	00136$
00132$:
;	dino.c:257: score_to_text();
	lcall	_score_to_text
;	dino.c:258: SemaphoreWait(wlock);
7$:
	MOV A, _wlock 
	JZ 7$ 
	JB ACC.7, 7$ 
	DEC _wlock 
;	dino.c:259: phase = ST_DEAD;
	mov	_phase,#0x02
;	dino.c:260: SemaphoreSignal(wlock);
	INC	_wlock 
00138$:
;	dino.c:261: for (;;) { ThreadYield(); }
	lcall	_ThreadYield
;	dino.c:262: }
	sjmp	00138$
;------------------------------------------------------------
;Allocation info for local variables in function '_sdcc_gsinit_startup'
;------------------------------------------------------------
;	dino.c:264: void _sdcc_gsinit_startup(void)
;	-----------------------------------------
;	 function _sdcc_gsinit_startup
;	-----------------------------------------
__sdcc_gsinit_startup:
;	dino.c:268: __endasm;
	LJMP	_Bootstrap
;	dino.c:269: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function '_mcs51_genRAMCLEAR'
;------------------------------------------------------------
;	dino.c:271: void _mcs51_genRAMCLEAR(void)  {}
;	-----------------------------------------
;	 function _mcs51_genRAMCLEAR
;	-----------------------------------------
__mcs51_genRAMCLEAR:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function '_mcs51_genXINIT'
;------------------------------------------------------------
;	dino.c:272: void _mcs51_genXINIT(void)     {}
;	-----------------------------------------
;	 function _mcs51_genXINIT
;	-----------------------------------------
__mcs51_genXINIT:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function '_mcs51_genXRAMCLEAR'
;------------------------------------------------------------
;	dino.c:273: void _mcs51_genXRAMCLEAR(void) {}
;	-----------------------------------------
;	 function _mcs51_genXRAMCLEAR
;	-----------------------------------------
__mcs51_genXRAMCLEAR:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'timer0_ISR'
;------------------------------------------------------------
;	dino.c:275: void timer0_ISR(void) __interrupt(1)
;	-----------------------------------------
;	 function timer0_ISR
;	-----------------------------------------
_timer0_ISR:
;	dino.c:279: __endasm;
	ljmp	_myTimer0Handler
;	dino.c:280: }
	ljmp	sdcc_atomic_maybe_rollback
;	eliminated unneeded mov psw,# (no regs used in bank)
;	eliminated unneeded push/pop not_psw
;	eliminated unneeded push/pop dpl
;	eliminated unneeded push/pop dph
;	eliminated unneeded push/pop b
;	eliminated unneeded push/pop acc
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area CONST   (CODE)
_dino_bmp:
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x14	; 20
	.db #0x17	; 23
	.db #0x0e	; 14
	.db #0x0a	; 10
	.area CSEG    (CODE)
	.area CONST   (CODE)
_cactus_bmp:
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x15	; 21
	.db #0x15	; 21
	.db #0x16	; 22
	.db #0x0c	; 12
	.db #0x04	; 4
	.db #0x04	; 4
	.area CSEG    (CODE)
	.area CONST   (CODE)
___str_0:
	.ascii "Set 0-9 then #  "
	.db 0x00
	.area CSEG    (CODE)
	.area CONST   (CODE)
___str_1:
	.ascii "Level: "
	.db 0x00
	.area CSEG    (CODE)
	.area CONST   (CODE)
___str_2:
	.ascii "        "
	.db 0x00
	.area CSEG    (CODE)
	.area CONST   (CODE)
___str_3:
	.ascii "Game Over       "
	.db 0x00
	.area CSEG    (CODE)
	.area CONST   (CODE)
___str_4:
	.ascii "Score: "
	.db 0x00
	.area CSEG    (CODE)
	.area CONST   (CODE)
___str_5:
	.ascii "       "
	.db 0x00
	.area CSEG    (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
