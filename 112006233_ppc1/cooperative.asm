;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.10 #15658 (MINGW64)
;--------------------------------------------------------
	.module cooperative
	
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
	.globl _sp_temp
	.globl _temp_tid
	.globl _saved_sp
	.globl _thread_mask
	.globl _active_thread
	.globl _ThreadCreate
	.globl _ThreadYield
	.globl _ThreadExit
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
_active_thread	=	0x0038
_thread_mask	=	0x0039
_saved_sp	=	0x003a
_temp_tid	=	0x003e
_sp_temp	=	0x003f
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
;	cooperative.c:218: void Bootstrap(void)
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
;	cooperative.c:220: thread_mask = 0;
	mov	_thread_mask,#0x00
;	cooperative.c:221: active_thread = ThreadCreate(main);
	mov	dptr,#_main
	lcall	_ThreadCreate
	mov	_active_thread,dpl
;	cooperative.c:222: RESTORESTATE;
	mov	a,_active_thread
	add	a, #_saved_sp
	mov	r1,a
	mov	_SP,@r1
	POP PSW 
	POP DPL 
	POP DPH 
	POP ACC 
	POP B 
;	cooperative.c:223: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ThreadCreate'
;------------------------------------------------------------
;fp            Allocated to registers 
;------------------------------------------------------------
;	cooperative.c:225: ThreadID ThreadCreate(FunctionPtr fp)
;	-----------------------------------------
;	 function ThreadCreate
;	-----------------------------------------
_ThreadCreate:
;	cooperative.c:228: temp_tid = 0;
	mov	_temp_tid,#0x00
;	cooperative.c:229: while (temp_tid < MAXTHREADS) {
00103$:
	mov	a,#0x100 - 0x04
	add	a,_temp_tid
	jc	00105$
;	cooperative.c:230: if (!(thread_mask & (1 << temp_tid))) {
	mov	b,_temp_tid
	inc	b
	mov	r6,#0x01
	mov	r7,#0x00
	sjmp	00136$
00135$:
	mov	a,r6
	add	a,r6
	mov	r6,a
	mov	a,r7
	rlc	a
	mov	r7,a
00136$:
	djnz	b,00135$
	mov	r4,_thread_mask
	mov	r5,#0x00
	mov	a,r4
	anl	ar6,a
	mov	a,r5
	anl	ar7,a
	mov	a,r6
	orl	a,r7
	jz	00105$
;	cooperative.c:233: temp_tid++;
	mov	a,_temp_tid
	inc	a
	mov	_temp_tid,a
	sjmp	00103$
00105$:
;	cooperative.c:236: if (temp_tid == MAXTHREADS) {
	mov	a,#0x04
	cjne	a,_temp_tid,00107$
;	cooperative.c:237: return -1; // No threads available
	mov	dpl, #0xff
	ret
00107$:
;	cooperative.c:241: thread_mask |= (1 << temp_tid);
	mov	b,_temp_tid
	inc	b
	mov	a,#0x01
	sjmp	00141$
00140$:
	add	a,acc
00141$:
	djnz	b,00140$
	orl	_thread_mask,a
;	cooperative.c:244: sp_temp = SP;
	mov	_sp_temp,_SP
;	cooperative.c:247: SP = 0x3F + (temp_tid * 16); 
	mov	a,_temp_tid
	swap	a
	anl	a,#0xf0
	mov	r7,a
	add	a,#0x3f
	mov	_SP,a
;	cooperative.c:262: __endasm;
	PUSH	DPL ; Return address low byte
	PUSH	DPH ; Return address high byte
	MOV	A, #0
	PUSH	ACC ; Push 0 for B
	PUSH	ACC ; Push 0 for ACC
	PUSH	ACC ; Push 0 for DPH
	PUSH	ACC ; Push 0 for DPL
;	cooperative.c:265: PSW = (temp_tid << 3);
	mov	a,_temp_tid
	swap	a
	rr	a
	anl	a,#0xf8
	mov	_PSW,a
;	cooperative.c:268: __endasm;
	PUSH	PSW
;	cooperative.c:271: saved_sp[temp_tid] = SP;
	mov	a,_temp_tid
	add	a, #_saved_sp
	mov	r0,a
	mov	@r0,_SP
;	cooperative.c:272: SP = sp_temp;
	mov	_SP,_sp_temp
;	cooperative.c:274: return temp_tid;
	mov	dpl, _temp_tid
;	cooperative.c:275: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ThreadYield'
;------------------------------------------------------------
;	cooperative.c:277: void ThreadYield(void)
;	-----------------------------------------
;	 function ThreadYield
;	-----------------------------------------
_ThreadYield:
;	cooperative.c:279: SAVESTATE;
	PUSH B 
	PUSH ACC 
	PUSH DPH 
	PUSH DPL 
	PUSH PSW 
	mov	a,_active_thread
	add	a, #_saved_sp
	mov	r0,a
	mov	@r0,_SP
;	cooperative.c:284: do {
00103$:
;	cooperative.c:285: active_thread++;
	mov	a,_active_thread
	inc	a
	mov	_active_thread,a
;	cooperative.c:286: if (active_thread == MAXTHREADS) {
	mov	a,#0x04
	cjne	a,_active_thread,00104$
;	cooperative.c:287: active_thread = 0;
	mov	_active_thread,#0x00
00104$:
;	cooperative.c:289: } while ((thread_mask & (1 << active_thread)) == 0);
	mov	b,_active_thread
	inc	b
	mov	r6,#0x01
	mov	r7,#0x00
	sjmp	00129$
00128$:
	mov	a,r6
	add	a,r6
	mov	r6,a
	mov	a,r7
	rlc	a
	mov	r7,a
00129$:
	djnz	b,00128$
	mov	r4,_thread_mask
	mov	r5,#0x00
	mov	a,r4
	anl	ar6,a
	mov	a,r5
	anl	ar7,a
	mov	a,r6
	orl	a,r7
	jz	00103$
;	cooperative.c:291: RESTORESTATE;
	mov	a,_active_thread
	add	a, #_saved_sp
	mov	r1,a
	mov	_SP,@r1
	POP PSW 
	POP DPL 
	POP DPH 
	POP ACC 
	POP B 
;	cooperative.c:292: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ThreadExit'
;------------------------------------------------------------
;	cooperative.c:294: void ThreadExit(void)
;	-----------------------------------------
;	 function ThreadExit
;	-----------------------------------------
_ThreadExit:
;	cooperative.c:297: thread_mask &= ~(1 << active_thread);
	mov	b,_active_thread
	inc	b
	mov	a,#0x01
	sjmp	00127$
00126$:
	add	a,acc
00127$:
	djnz	b,00126$
	cpl	a
	anl	_thread_mask,a
;	cooperative.c:300: do {
00103$:
;	cooperative.c:301: active_thread++;
	mov	a,_active_thread
	inc	a
	mov	_active_thread,a
;	cooperative.c:302: if (active_thread == MAXTHREADS) {
	mov	a,#0x04
	cjne	a,_active_thread,00104$
;	cooperative.c:303: active_thread = 0;
	mov	_active_thread,#0x00
00104$:
;	cooperative.c:305: } while ((thread_mask & (1 << active_thread)) == 0);
	mov	b,_active_thread
	inc	b
	mov	r6,#0x01
	mov	r7,#0x00
	sjmp	00131$
00130$:
	mov	a,r6
	add	a,r6
	mov	r6,a
	mov	a,r7
	rlc	a
	mov	r7,a
00131$:
	djnz	b,00130$
	mov	r4,_thread_mask
	mov	r5,#0x00
	mov	a,r4
	anl	ar6,a
	mov	a,r5
	anl	ar7,a
	mov	a,r6
	orl	a,r7
	jz	00103$
;	cooperative.c:307: RESTORESTATE;
	mov	a,_active_thread
	add	a, #_saved_sp
	mov	r1,a
	mov	_SP,@r1
	POP PSW 
	POP DPL 
	POP DPH 
	POP ACC 
	POP B 
;	cooperative.c:308: }
	ret
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
