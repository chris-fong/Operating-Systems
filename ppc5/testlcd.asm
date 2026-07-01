;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.10 #15658 (MINGW64)
;--------------------------------------------------------
	.module testlcd
	
	.optsdcc -mmcs51 --model-small
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _timer0_ISR
	.globl __mcs51_genXRAMCLEAR
	.globl __mcs51_genXINIT
	.globl __mcs51_genRAMCLEAR
	.globl __sdcc_gsinit_startup
	.globl _main
	.globl _lcd_consumer
	.globl _pad_producer
	.globl _bank_producer
	.globl _LCD_ready
	.globl _LCD_write_char
	.globl _LCD_Init
	.globl _AnyKeyPressed
	.globl _KeyToChar
	.globl _Init_Keypad
	.globl _ButtonToChar
	.globl _AnyButtonPressed
	.globl _ThreadExit
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
	.globl _ring
	.globl _qtail
	.globl _qhead
	.globl _qcount
	.globl _qlock
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
_qlock	=	0x0021
_qcount	=	0x0022
_qhead	=	0x0023
_qtail	=	0x0024
_ring	=	0x0025
;--------------------------------------------------------
; overlayable items in internal ram
;--------------------------------------------------------
	.area	OSEG    (OVR,DATA)
	.area	OSEG    (OVR,DATA)
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
;Allocation info for local variables in function 'put'
;------------------------------------------------------------
;ch            Allocated to registers r7 
;------------------------------------------------------------
;	testlcd.c:44: static void put(char ch)
;	-----------------------------------------
;	 function put
;	-----------------------------------------
_put:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
	mov	r7, dpl
;	testlcd.c:46: SemaphoreWait(qlock);
0$:
	MOV A, _qlock 
	JZ 0$ 
	JB ACC.7, 0$ 
	DEC _qlock 
;	testlcd.c:47: if (qcount < RING) {
	mov	a,#0x100 - 0x03
	add	a,_qcount
	jc	00104$
;	testlcd.c:48: ring[qtail] = ch;
	mov	a,_qtail
	add	a, #_ring
	mov	r0,a
	mov	@r0,ar7
;	testlcd.c:49: qtail++;
	mov	a,_qtail
	inc	a
	mov	_qtail,a
;	testlcd.c:50: if (qtail == RING) qtail = 0;
	mov	a,#0x03
	cjne	a,_qtail,00102$
	mov	_qtail,#0x00
00102$:
;	testlcd.c:51: qcount++;
	mov	a,_qcount
	inc	a
	mov	_qcount,a
00104$:
;	testlcd.c:53: SemaphoreSignal(qlock);
	INC	_qlock 
;	testlcd.c:54: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'get'
;------------------------------------------------------------
;ch            Allocated to registers r7 
;------------------------------------------------------------
;	testlcd.c:57: static char get(void)
;	-----------------------------------------
;	 function get
;	-----------------------------------------
_get:
;	testlcd.c:59: char ch = 0;
	mov	r7,#0x00
;	testlcd.c:60: SemaphoreWait(qlock);
1$:
	MOV A, _qlock 
	JZ 1$ 
	JB ACC.7, 1$ 
	DEC _qlock 
;	testlcd.c:61: if (qcount > 0) {
	mov	a,_qcount
	jz	00104$
;	testlcd.c:62: ch = ring[qhead];
	mov	a,_qhead
	add	a, #_ring
	mov	r1,a
	mov	ar7,@r1
;	testlcd.c:63: qhead++;
	mov	a,_qhead
	inc	a
	mov	_qhead,a
;	testlcd.c:64: if (qhead == RING) qhead = 0;
	mov	a,#0x03
	cjne	a,_qhead,00102$
	mov	_qhead,#0x00
00102$:
;	testlcd.c:65: qcount--;
	mov	a,_qcount
	dec	a
	mov	_qcount,a
00104$:
;	testlcd.c:67: SemaphoreSignal(qlock);
	INC	_qlock 
;	testlcd.c:68: return ch;
	mov	dpl, r7
;	testlcd.c:69: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'bank_producer'
;------------------------------------------------------------
;down          Allocated to registers r7 
;ch            Allocated to registers r5 
;------------------------------------------------------------
;	testlcd.c:72: void bank_producer(void)
;	-----------------------------------------
;	 function bank_producer
;	-----------------------------------------
_bank_producer:
;	testlcd.c:74: unsigned char down = 0;
	mov	r7,#0x00
;	testlcd.c:76: P2 = 0xFF;                      /* float the inputs; a press pulls low */
	mov	_P2,#0xff
;	testlcd.c:77: while (1) {
00109$:
;	testlcd.c:78: if (AnyButtonPressed()) {
	push	ar7
	lcall	_AnyButtonPressed
	mov	a, dpl
	pop	ar7
	jz	00106$
;	testlcd.c:79: if (!down) {
	mov	a,r7
	jnz	00107$
;	testlcd.c:80: down = 1;
	mov	r7,#0x01
;	testlcd.c:81: ch = ButtonToChar();
	push	ar7
	lcall	_ButtonToChar
	mov	r6, dpl
	pop	ar7
;	testlcd.c:82: if (ch) put(ch);
	mov	a,r6
	mov	r5,a
	jz	00107$
	mov	dpl, r5
	push	ar7
	lcall	_put
	pop	ar7
	sjmp	00107$
00106$:
;	testlcd.c:85: down = 0;
	mov	r7,#0x00
00107$:
;	testlcd.c:87: ThreadYield();
	push	ar7
	lcall	_ThreadYield
	pop	ar7
;	testlcd.c:89: }
	sjmp	00109$
;------------------------------------------------------------
;Allocation info for local variables in function 'pad_producer'
;------------------------------------------------------------
;down          Allocated to registers r7 
;ch            Allocated to registers r5 
;------------------------------------------------------------
;	testlcd.c:92: void pad_producer(void)
;	-----------------------------------------
;	 function pad_producer
;	-----------------------------------------
_pad_producer:
;	testlcd.c:94: unsigned char down = 0;
	mov	r7,#0x00
;	testlcd.c:96: Init_Keypad();
	push	ar7
	lcall	_Init_Keypad
	pop	ar7
;	testlcd.c:97: while (1) {
00109$:
;	testlcd.c:98: if (AnyKeyPressed()) {
	push	ar7
	lcall	_AnyKeyPressed
	mov	a, dpl
	pop	ar7
	jz	00106$
;	testlcd.c:99: if (!down) {
	mov	a,r7
	jnz	00107$
;	testlcd.c:100: down = 1;
	mov	r7,#0x01
;	testlcd.c:101: ch = KeyToChar();
	push	ar7
	lcall	_KeyToChar
	mov	r6, dpl
	pop	ar7
;	testlcd.c:102: if (ch) put(ch);
	mov	a,r6
	mov	r5,a
	jz	00107$
	mov	dpl, r5
	push	ar7
	lcall	_put
	pop	ar7
	sjmp	00107$
00106$:
;	testlcd.c:105: down = 0;
	mov	r7,#0x00
00107$:
;	testlcd.c:107: ThreadYield();
	push	ar7
	lcall	_ThreadYield
	pop	ar7
;	testlcd.c:109: }
	sjmp	00109$
;------------------------------------------------------------
;Allocation info for local variables in function 'lcd_consumer'
;------------------------------------------------------------
;ch            Allocated to registers r6 
;------------------------------------------------------------
;	testlcd.c:112: void lcd_consumer(void)
;	-----------------------------------------
;	 function lcd_consumer
;	-----------------------------------------
_lcd_consumer:
;	testlcd.c:115: LCD_Init();
	lcall	_LCD_Init
;	testlcd.c:116: while (1) {
00105$:
;	testlcd.c:117: ch = get();
	lcall	_get
;	testlcd.c:118: if (ch && LCD_ready()) {
	mov	a,dpl
	mov	r6,a
	jz	00102$
	push	ar6
	lcall	_LCD_ready
	mov	a, dpl
	pop	ar6
	jz	00102$
;	testlcd.c:119: LCD_write_char(ch);
	mov	dpl, r6
	lcall	_LCD_write_char
00102$:
;	testlcd.c:121: ThreadYield();
	lcall	_ThreadYield
;	testlcd.c:123: }
	sjmp	00105$
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;	testlcd.c:125: void main(void)
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	testlcd.c:127: ET0 = 0;                        /* cooperative: no Timer-0 preemption */
;	assignBit
	clr	_ET0
;	testlcd.c:129: SemaphoreCreate(qlock, 1);
	mov	_qlock,#0x01
;	testlcd.c:130: qcount = 0;
	mov	_qcount,#0x00
;	testlcd.c:131: qhead  = 0;
	mov	_qhead,#0x00
;	testlcd.c:132: qtail  = 0;
	mov	_qtail,#0x00
;	testlcd.c:134: ThreadCreate(bank_producer);
	mov	dptr,#_bank_producer
	lcall	_ThreadCreate
;	testlcd.c:135: ThreadCreate(pad_producer);
	mov	dptr,#_pad_producer
	lcall	_ThreadCreate
;	testlcd.c:136: ThreadCreate(lcd_consumer);
	mov	dptr,#_lcd_consumer
	lcall	_ThreadCreate
;	testlcd.c:138: ThreadExit();                   /* hand main's slot to the workers */
;	testlcd.c:139: }
	ljmp	_ThreadExit
;------------------------------------------------------------
;Allocation info for local variables in function '_sdcc_gsinit_startup'
;------------------------------------------------------------
;	testlcd.c:141: void _sdcc_gsinit_startup(void)
;	-----------------------------------------
;	 function _sdcc_gsinit_startup
;	-----------------------------------------
__sdcc_gsinit_startup:
;	testlcd.c:145: __endasm;
	LJMP	_Bootstrap
;	testlcd.c:146: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function '_mcs51_genRAMCLEAR'
;------------------------------------------------------------
;	testlcd.c:148: void _mcs51_genRAMCLEAR(void)  {}
;	-----------------------------------------
;	 function _mcs51_genRAMCLEAR
;	-----------------------------------------
__mcs51_genRAMCLEAR:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function '_mcs51_genXINIT'
;------------------------------------------------------------
;	testlcd.c:149: void _mcs51_genXINIT(void)     {}
;	-----------------------------------------
;	 function _mcs51_genXINIT
;	-----------------------------------------
__mcs51_genXINIT:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function '_mcs51_genXRAMCLEAR'
;------------------------------------------------------------
;	testlcd.c:150: void _mcs51_genXRAMCLEAR(void) {}
;	-----------------------------------------
;	 function _mcs51_genXRAMCLEAR
;	-----------------------------------------
__mcs51_genXRAMCLEAR:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'timer0_ISR'
;------------------------------------------------------------
;	testlcd.c:152: void timer0_ISR(void) __interrupt(1)
;	-----------------------------------------
;	 function timer0_ISR
;	-----------------------------------------
_timer0_ISR:
;	testlcd.c:156: __endasm;
	ljmp	_myTimer0Handler
;	testlcd.c:157: }
	ljmp	sdcc_atomic_maybe_rollback
;	eliminated unneeded mov psw,# (no regs used in bank)
;	eliminated unneeded push/pop not_psw
;	eliminated unneeded push/pop dpl
;	eliminated unneeded push/pop dph
;	eliminated unneeded push/pop b
;	eliminated unneeded push/pop acc
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
