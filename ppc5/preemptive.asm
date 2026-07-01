;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.10 #15658 (MINGW64)
;--------------------------------------------------------
	.module preemptive
	
	.optsdcc -mmcs51 --model-small
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _Bootstrap
	.globl _main
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
	.globl _keep_sp
	.globl _nslot
	.globl _cur
	.globl _live_mask
	.globl _sp_save
	.globl _ThreadCreate
	.globl _ThreadYield
	.globl _ThreadExit
	.globl _myTimer0Handler
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
_sp_save	=	0x0038
_live_mask	=	0x003c
_cur	=	0x003d
_nslot	=	0x003e
_keep_sp	=	0x003f
;--------------------------------------------------------
; overlayable items in internal ram
;--------------------------------------------------------
	.area	OSEG    (OVR,DATA)
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
; global & static initialisations
;--------------------------------------------------------
	.area HOME    (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area GSINIT  (CODE)
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME    (CODE)
	.area HOME    (CODE)
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CSEG    (CODE)
;------------------------------------------------------------
;Allocation info for local variables in function 'Bootstrap'
;------------------------------------------------------------
;	preemptive.c:76: void Bootstrap(void)
;	-----------------------------------------
;	 function Bootstrap
;	-----------------------------------------
_Bootstrap:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
;	preemptive.c:78: live_mask = 0;
	mov	_live_mask,#0x00
;	preemptive.c:82: cur  = ThreadCreate(main);
	mov	dptr,#_main
	lcall	_ThreadCreate
	mov	_cur,dpl
;	preemptive.c:83: EA   = 0;
;	assignBit
	clr	_EA
;	preemptive.c:84: SP   = sp_save[cur];   /* switch onto main's stack ... */
	mov	a,_cur
	add	a, #_sp_save
	mov	r1,a
	mov	_SP,@r1
;	preemptive.c:85: CTX_POP;               /* ... then drop into main via its prepared frame */
	POP PSW 
	POP DPH 
	POP DPL 
	POP B 
	POP ACC 
	POP 7 
	POP 6 
	POP 5 
	POP 4 
	POP 3 
	POP 2 
	POP 1 
	POP 0 
;	preemptive.c:86: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ThreadCreate'
;------------------------------------------------------------
;fp            Allocated to registers 
;------------------------------------------------------------
;	preemptive.c:88: ThreadID ThreadCreate(FunctionPtr fp)
;	-----------------------------------------
;	 function ThreadCreate
;	-----------------------------------------
_ThreadCreate:
;	preemptive.c:90: EA = 0;
;	assignBit
	clr	_EA
;	preemptive.c:92: nslot = 0;
	mov	_nslot,#0x00
;	preemptive.c:93: while (nslot < MAXTHREADS) {
00103$:
	mov	a,#0x100 - 0x04
	add	a,_nslot
	jc	00105$
;	preemptive.c:94: if (((live_mask >> nslot) & 1) == 0) break;
	mov	b,_nslot
	inc	b
	mov	a,_live_mask
	sjmp	00136$
00135$:
	clr	c
	rrc	a
00136$:
	djnz	b,00135$
	jnb	acc.0,00105$
;	preemptive.c:95: nslot++;
	mov	a,_nslot
	inc	a
	mov	_nslot,a
	sjmp	00103$
00105$:
;	preemptive.c:97: if (nslot == MAXTHREADS) {
	mov	a,#0x04
	cjne	a,_nslot,00107$
;	preemptive.c:98: EA = 1;
;	assignBit
	setb	_EA
;	preemptive.c:99: return (ThreadID)-1;
	mov	dpl, #0xff
	ret
00107$:
;	preemptive.c:102: live_mask |= (unsigned char)(1 << nslot);
	mov	b,_nslot
	inc	b
	mov	a,#0x01
	sjmp	00141$
00140$:
	add	a,acc
00141$:
	djnz	b,00140$
	orl	_live_mask,a
;	preemptive.c:104: keep_sp = SP;
	mov	_keep_sp,_SP
;	preemptive.c:105: SP = (unsigned char)(0x40 + (nslot << 4));   /* 16-byte frames from 0x40 */
	mov	a,_nslot
	swap	a
	anl	a,#0xf0
	add	a,#0x40
	mov	r7,a
	mov	_SP,r7
;	preemptive.c:126: __endasm;
	PUSH	DPL
	PUSH	DPH
	CLR	A
	PUSH	ACC ; r0
	PUSH	ACC ; r1
	PUSH	ACC ; r2
	PUSH	ACC ; r3
	PUSH	ACC ; r4
	PUSH	ACC ; r5
	PUSH	ACC ; r6
	PUSH	ACC ; r7
	PUSH	ACC ; ACC
	PUSH	ACC ; B
	PUSH	ACC ; DPL
	PUSH	ACC ; DPH
	PUSH	ACC ; PSW
;	preemptive.c:128: sp_save[nslot] = SP;
	mov	a,_nslot
	add	a, #_sp_save
	mov	r0,a
	mov	@r0,_SP
;	preemptive.c:129: SP = keep_sp;
	mov	_SP,_keep_sp
;	preemptive.c:131: EA = 1;
;	assignBit
	setb	_EA
;	preemptive.c:132: return (ThreadID)nslot;
	mov	dpl, _nslot
;	preemptive.c:133: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ThreadYield'
;------------------------------------------------------------
;	preemptive.c:135: void ThreadYield(void)
;	-----------------------------------------
;	 function ThreadYield
;	-----------------------------------------
_ThreadYield:
;	preemptive.c:137: EA = 0;
;	assignBit
	clr	_EA
;	preemptive.c:138: CTX_PUSH;
	PUSH 0 
	PUSH 1 
	PUSH 2 
	PUSH 3 
	PUSH 4 
	PUSH 5 
	PUSH 6 
	PUSH 7 
	PUSH ACC 
	PUSH B 
	PUSH DPL 
	PUSH DPH 
	PUSH PSW 
;	preemptive.c:139: sp_save[cur] = SP;
	mov	a,_cur
	add	a, #_sp_save
	mov	r0,a
	mov	@r0,_SP
;	preemptive.c:140: NEXT_LIVE;
00101$:
	mov	a,_cur
	mov	r7,a
	inc	a
	anl	a,#0x03
	mov	_cur,a
	mov	b,_cur
	inc	b
	mov	a,_live_mask
	sjmp	00119$
00118$:
	clr	c
	rrc	a
00119$:
	djnz	b,00118$
	jnb	acc.0,00101$
;	preemptive.c:141: SP = sp_save[cur];
	mov	a,_cur
	add	a, #_sp_save
	mov	r1,a
	mov	_SP,@r1
;	preemptive.c:142: CTX_POP;
	POP PSW 
	POP DPH 
	POP DPL 
	POP B 
	POP ACC 
	POP 7 
	POP 6 
	POP 5 
	POP 4 
	POP 3 
	POP 2 
	POP 1 
	POP 0 
;	preemptive.c:143: EA = 1;
;	assignBit
	setb	_EA
;	preemptive.c:144: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ThreadExit'
;------------------------------------------------------------
;	preemptive.c:146: void ThreadExit(void)
;	-----------------------------------------
;	 function ThreadExit
;	-----------------------------------------
_ThreadExit:
;	preemptive.c:148: EA = 0;
;	assignBit
	clr	_EA
;	preemptive.c:149: live_mask &= (unsigned char)~(1 << cur);
	mov	b,_cur
	inc	b
	mov	a,#0x01
	sjmp	00130$
00129$:
	add	a,acc
00130$:
	djnz	b,00129$
	cpl	a
	anl	_live_mask,a
;	preemptive.c:150: if (live_mask == 0) {
	mov	a,_live_mask
	jnz	00106$
;	preemptive.c:151: while (1) { }            /* nothing left to run */
00102$:
;	preemptive.c:153: NEXT_LIVE;
	sjmp	00102$
00106$:
	mov	a,_cur
	mov	r7,a
	inc	a
	anl	a,#0x03
	mov	_cur,a
	mov	b,_cur
	inc	b
	mov	a,_live_mask
	sjmp	00133$
00132$:
	clr	c
	rrc	a
00133$:
	djnz	b,00132$
	jnb	acc.0,00106$
;	preemptive.c:154: SP = sp_save[cur];
	mov	a,_cur
	add	a, #_sp_save
	mov	r1,a
	mov	_SP,@r1
;	preemptive.c:155: CTX_POP;
	POP PSW 
	POP DPH 
	POP DPL 
	POP B 
	POP ACC 
	POP 7 
	POP 6 
	POP 5 
	POP 4 
	POP 3 
	POP 2 
	POP 1 
	POP 0 
;	preemptive.c:156: EA = 1;
;	assignBit
	setb	_EA
;	preemptive.c:157: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'myTimer0Handler'
;------------------------------------------------------------
;	preemptive.c:159: void myTimer0Handler(void)
;	-----------------------------------------
;	 function myTimer0Handler
;	-----------------------------------------
_myTimer0Handler:
;	preemptive.c:161: CTX_PUSH;
	PUSH 0 
	PUSH 1 
	PUSH 2 
	PUSH 3 
	PUSH 4 
	PUSH 5 
	PUSH 6 
	PUSH 7 
	PUSH ACC 
	PUSH B 
	PUSH DPL 
	PUSH DPH 
	PUSH PSW 
;	preemptive.c:162: sp_save[cur] = SP;
	mov	a,_cur
	add	a, #_sp_save
	mov	r0,a
	mov	@r0,_SP
;	preemptive.c:163: NEXT_LIVE;
00101$:
	mov	a,_cur
	mov	r7,a
	inc	a
	anl	a,#0x03
	mov	_cur,a
	mov	b,_cur
	inc	b
	mov	a,_live_mask
	sjmp	00119$
00118$:
	clr	c
	rrc	a
00119$:
	djnz	b,00118$
	jnb	acc.0,00101$
;	preemptive.c:164: SP = sp_save[cur];
	mov	a,_cur
	add	a, #_sp_save
	mov	r1,a
	mov	_SP,@r1
;	preemptive.c:165: CTX_POP;
	POP PSW 
	POP DPH 
	POP DPL 
	POP B 
	POP ACC 
	POP 7 
	POP 6 
	POP 5 
	POP 4 
	POP 3 
	POP 2 
	POP 1 
	POP 0 
;	preemptive.c:166: __asm RETI __endasm;
	RETI	
;	preemptive.c:167: }
	ret
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
