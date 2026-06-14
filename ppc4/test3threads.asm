;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.10 #15658 (MINGW64)
;--------------------------------------------------------
	.module test3threads
	
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
	.globl _Consumer
	.globl _Producer2
	.globl _Producer1
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
	.globl _prod_turn
	.globl _curr_char2
	.globl _cons_char
	.globl _curr_char1
	.globl _buffer
	.globl _tail
	.globl _head
	.globl _empty
	.globl _full
	.globl _mutex
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
_mutex	=	0x0020
_full	=	0x0021
_empty	=	0x0022
_head	=	0x0023
_tail	=	0x0024
_buffer	=	0x0025
_curr_char1	=	0x0028
_cons_char	=	0x0029
_curr_char2	=	0x002a
_prod_turn	=	0x002b
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
;Allocation info for local variables in function 'Producer1'
;------------------------------------------------------------
;	test3threads.c:27: void Producer1(void)
;	-----------------------------------------
;	 function Producer1
;	-----------------------------------------
_Producer1:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
;	test3threads.c:29: curr_char1 = 'A';
	mov	_curr_char1,#0x41
;	test3threads.c:32: while (prod_turn != 1) {}     /* wait for my turn */
00101$:
	mov	a,#0x01
	cjne	a,_prod_turn,00101$
;	test3threads.c:34: SemaphoreWait(empty);
0$:
	MOV A, _empty 
	JZ 0$ 
	JB ACC.7, 0$ 
	DEC _empty 
;	test3threads.c:35: SemaphoreWait(mutex);
1$:
	MOV A, _mutex 
	JZ 1$ 
	JB ACC.7, 1$ 
	DEC _mutex 
;	test3threads.c:36: buffer[tail] = curr_char1;    /* critical section: keep short */
	mov	a,_tail
	add	a, #_buffer
	mov	r0,a
	mov	@r0,_curr_char1
;	test3threads.c:37: tail++;
	mov	a,_tail
	inc	a
	mov	_tail,a
;	test3threads.c:38: if (tail == 3) {
	mov	a,#0x03
	cjne	a,_tail,00105$
;	test3threads.c:39: tail = 0;
	mov	_tail,#0x00
00105$:
;	test3threads.c:41: SemaphoreSignal(mutex);
	INC _mutex 
;	test3threads.c:42: SemaphoreSignal(full);
	INC _full 
;	test3threads.c:44: prod_turn = 2;                /* hand turn to P2 */
	mov	_prod_turn,#0x02
;	test3threads.c:46: curr_char1++;
	mov	a,_curr_char1
	inc	a
	mov	_curr_char1,a
;	test3threads.c:47: if (curr_char1 > 'Z') {
	mov	a,_curr_char1
	add	a,#0xff - 0x5a
	jnc	00101$
;	test3threads.c:48: curr_char1 = 'A';
	mov	_curr_char1,#0x41
;	test3threads.c:51: }
	sjmp	00101$
;------------------------------------------------------------
;Allocation info for local variables in function 'Producer2'
;------------------------------------------------------------
;	test3threads.c:53: void Producer2(void)
;	-----------------------------------------
;	 function Producer2
;	-----------------------------------------
_Producer2:
;	test3threads.c:55: curr_char2 = '0';
	mov	_curr_char2,#0x30
;	test3threads.c:58: while (prod_turn != 2) {}     /* wait for my turn */
00101$:
	mov	a,#0x02
	cjne	a,_prod_turn,00101$
;	test3threads.c:60: SemaphoreWait(empty);
2$:
	MOV A, _empty 
	JZ 2$ 
	JB ACC.7, 2$ 
	DEC _empty 
;	test3threads.c:61: SemaphoreWait(mutex);
3$:
	MOV A, _mutex 
	JZ 3$ 
	JB ACC.7, 3$ 
	DEC _mutex 
;	test3threads.c:62: buffer[tail] = curr_char2;    /* critical section: keep short */
	mov	a,_tail
	add	a, #_buffer
	mov	r0,a
	mov	@r0,_curr_char2
;	test3threads.c:63: tail++;
	mov	a,_tail
	inc	a
	mov	_tail,a
;	test3threads.c:64: if (tail == 3) {
	mov	a,#0x03
	cjne	a,_tail,00105$
;	test3threads.c:65: tail = 0;
	mov	_tail,#0x00
00105$:
;	test3threads.c:67: SemaphoreSignal(mutex);
	INC _mutex 
;	test3threads.c:68: SemaphoreSignal(full);
	INC _full 
;	test3threads.c:70: prod_turn = 1;                /* hand turn to P1 */
	mov	_prod_turn,#0x01
;	test3threads.c:72: curr_char2++;
	mov	a,_curr_char2
	inc	a
	mov	_curr_char2,a
;	test3threads.c:73: if (curr_char2 > '9') {
	mov	a,_curr_char2
	add	a,#0xff - 0x39
	jnc	00101$
;	test3threads.c:74: curr_char2 = '0';
	mov	_curr_char2,#0x30
;	test3threads.c:77: }
	sjmp	00101$
;------------------------------------------------------------
;Allocation info for local variables in function 'Consumer'
;------------------------------------------------------------
;	test3threads.c:80: void Consumer(void)
;	-----------------------------------------
;	 function Consumer
;	-----------------------------------------
_Consumer:
;	test3threads.c:82: TMOD |= 0x20;                     /* |= to preserve Bootstrap timer0 setup */
	orl	_TMOD,#0x20
;	test3threads.c:83: TH1 = 0xFA;
	mov	_TH1,#0xfa
;	test3threads.c:84: SCON = 0x50;
	mov	_SCON,#0x50
;	test3threads.c:85: TR1 = 1;
;	assignBit
	setb	_TR1
;	test3threads.c:87: while (1) {
00107$:
;	test3threads.c:88: SemaphoreWait(full);
4$:
	MOV A, _full 
	JZ 4$ 
	JB ACC.7, 4$ 
	DEC _full 
;	test3threads.c:89: SemaphoreWait(mutex);
5$:
	MOV A, _mutex 
	JZ 5$ 
	JB ACC.7, 5$ 
	DEC _mutex 
;	test3threads.c:90: cons_char = buffer[head];     /* critical section: keep short */
	mov	a,_head
	add	a, #_buffer
	mov	r1,a
	mov	_cons_char,@r1
;	test3threads.c:91: head++;
	mov	a,_head
	inc	a
	mov	_head,a
;	test3threads.c:92: if (head == 3) {
	mov	a,#0x03
	cjne	a,_head,00102$
;	test3threads.c:93: head = 0;
	mov	_head,#0x00
00102$:
;	test3threads.c:95: SemaphoreSignal(mutex);
	INC _mutex 
;	test3threads.c:96: SemaphoreSignal(empty);
	INC _empty 
;	test3threads.c:98: SBUF = cons_char;             /* transmit outside CS */
	mov	_SBUF,_cons_char
;	test3threads.c:99: while (TI == 0) {}
00103$:
;	test3threads.c:100: TI = 0;
;	assignBit
	jbc	_TI,00107$
;	test3threads.c:102: }
	sjmp	00103$
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;	test3threads.c:104: void main(void)
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	test3threads.c:106: SemaphoreCreate(mutex, 1);
	mov	_mutex,#0x01
;	test3threads.c:107: SemaphoreCreate(empty, 3);
	mov	_empty,#0x03
;	test3threads.c:108: SemaphoreCreate(full, 0);
	mov	_full,#0x00
;	test3threads.c:109: head = 0;
	mov	_head,#0x00
;	test3threads.c:110: tail = 0;
	mov	_tail,#0x00
;	test3threads.c:112: prod_turn = 1;                    /* P1 goes first */
	mov	_prod_turn,#0x01
;	test3threads.c:116: ThreadCreate(Consumer);           /* Thread 1 */
	mov	dptr,#_Consumer
	lcall	_ThreadCreate
;	test3threads.c:117: ThreadCreate(Producer2);          /* Thread 2 */
	mov	dptr,#_Producer2
	lcall	_ThreadCreate
;	test3threads.c:118: Producer1();                      /* Thread 0 (main) becomes Producer1 */
;	test3threads.c:119: }
	ljmp	_Producer1
;------------------------------------------------------------
;Allocation info for local variables in function '_sdcc_gsinit_startup'
;------------------------------------------------------------
;	test3threads.c:121: void _sdcc_gsinit_startup(void)
;	-----------------------------------------
;	 function _sdcc_gsinit_startup
;	-----------------------------------------
__sdcc_gsinit_startup:
;	test3threads.c:125: __endasm;
	LJMP	_Bootstrap
;	test3threads.c:126: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function '_mcs51_genRAMCLEAR'
;------------------------------------------------------------
;	test3threads.c:128: void _mcs51_genRAMCLEAR(void) {}
;	-----------------------------------------
;	 function _mcs51_genRAMCLEAR
;	-----------------------------------------
__mcs51_genRAMCLEAR:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function '_mcs51_genXINIT'
;------------------------------------------------------------
;	test3threads.c:129: void _mcs51_genXINIT(void) {}
;	-----------------------------------------
;	 function _mcs51_genXINIT
;	-----------------------------------------
__mcs51_genXINIT:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function '_mcs51_genXRAMCLEAR'
;------------------------------------------------------------
;	test3threads.c:130: void _mcs51_genXRAMCLEAR(void) {}
;	-----------------------------------------
;	 function _mcs51_genXRAMCLEAR
;	-----------------------------------------
__mcs51_genXRAMCLEAR:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'timer0_ISR'
;------------------------------------------------------------
;	test3threads.c:132: void timer0_ISR(void) __interrupt(1) {
;	-----------------------------------------
;	 function timer0_ISR
;	-----------------------------------------
_timer0_ISR:
;	test3threads.c:135: __endasm;
	ljmp	_myTimer0Handler
;	test3threads.c:136: }
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
