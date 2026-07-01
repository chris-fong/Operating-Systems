                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler
                                      3 ; Version 4.5.10 #15658 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module preemptive
                                      6 	
                                      7 	.optsdcc -mmcs51 --model-small
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _Bootstrap
                                     12 	.globl _main
                                     13 	.globl _CY
                                     14 	.globl _AC
                                     15 	.globl _F0
                                     16 	.globl _RS1
                                     17 	.globl _RS0
                                     18 	.globl _OV
                                     19 	.globl _F1
                                     20 	.globl _P
                                     21 	.globl _PS
                                     22 	.globl _PT1
                                     23 	.globl _PX1
                                     24 	.globl _PT0
                                     25 	.globl _PX0
                                     26 	.globl _RD
                                     27 	.globl _WR
                                     28 	.globl _T1
                                     29 	.globl _T0
                                     30 	.globl _INT1
                                     31 	.globl _INT0
                                     32 	.globl _TXD
                                     33 	.globl _RXD
                                     34 	.globl _P3_7
                                     35 	.globl _P3_6
                                     36 	.globl _P3_5
                                     37 	.globl _P3_4
                                     38 	.globl _P3_3
                                     39 	.globl _P3_2
                                     40 	.globl _P3_1
                                     41 	.globl _P3_0
                                     42 	.globl _EA
                                     43 	.globl _ES
                                     44 	.globl _ET1
                                     45 	.globl _EX1
                                     46 	.globl _ET0
                                     47 	.globl _EX0
                                     48 	.globl _P2_7
                                     49 	.globl _P2_6
                                     50 	.globl _P2_5
                                     51 	.globl _P2_4
                                     52 	.globl _P2_3
                                     53 	.globl _P2_2
                                     54 	.globl _P2_1
                                     55 	.globl _P2_0
                                     56 	.globl _SM0
                                     57 	.globl _SM1
                                     58 	.globl _SM2
                                     59 	.globl _REN
                                     60 	.globl _TB8
                                     61 	.globl _RB8
                                     62 	.globl _TI
                                     63 	.globl _RI
                                     64 	.globl _P1_7
                                     65 	.globl _P1_6
                                     66 	.globl _P1_5
                                     67 	.globl _P1_4
                                     68 	.globl _P1_3
                                     69 	.globl _P1_2
                                     70 	.globl _P1_1
                                     71 	.globl _P1_0
                                     72 	.globl _TF1
                                     73 	.globl _TR1
                                     74 	.globl _TF0
                                     75 	.globl _TR0
                                     76 	.globl _IE1
                                     77 	.globl _IT1
                                     78 	.globl _IE0
                                     79 	.globl _IT0
                                     80 	.globl _P0_7
                                     81 	.globl _P0_6
                                     82 	.globl _P0_5
                                     83 	.globl _P0_4
                                     84 	.globl _P0_3
                                     85 	.globl _P0_2
                                     86 	.globl _P0_1
                                     87 	.globl _P0_0
                                     88 	.globl _B
                                     89 	.globl _ACC
                                     90 	.globl _PSW
                                     91 	.globl _IP
                                     92 	.globl _P3
                                     93 	.globl _IE
                                     94 	.globl _P2
                                     95 	.globl _SBUF
                                     96 	.globl _SCON
                                     97 	.globl _P1
                                     98 	.globl _TH1
                                     99 	.globl _TH0
                                    100 	.globl _TL1
                                    101 	.globl _TL0
                                    102 	.globl _TMOD
                                    103 	.globl _TCON
                                    104 	.globl _PCON
                                    105 	.globl _DPH
                                    106 	.globl _DPL
                                    107 	.globl _SP
                                    108 	.globl _P0
                                    109 	.globl _keep_sp
                                    110 	.globl _nslot
                                    111 	.globl _cur
                                    112 	.globl _live_mask
                                    113 	.globl _sp_save
                                    114 	.globl _ThreadCreate
                                    115 	.globl _ThreadYield
                                    116 	.globl _ThreadExit
                                    117 	.globl _myTimer0Handler
                                    118 ;--------------------------------------------------------
                                    119 ; special function registers
                                    120 ;--------------------------------------------------------
                                    121 	.area RSEG    (ABS,DATA)
      000000                        122 	.org 0x0000
                           000080   123 _P0	=	0x0080
                           000081   124 _SP	=	0x0081
                           000082   125 _DPL	=	0x0082
                           000083   126 _DPH	=	0x0083
                           000087   127 _PCON	=	0x0087
                           000088   128 _TCON	=	0x0088
                           000089   129 _TMOD	=	0x0089
                           00008A   130 _TL0	=	0x008a
                           00008B   131 _TL1	=	0x008b
                           00008C   132 _TH0	=	0x008c
                           00008D   133 _TH1	=	0x008d
                           000090   134 _P1	=	0x0090
                           000098   135 _SCON	=	0x0098
                           000099   136 _SBUF	=	0x0099
                           0000A0   137 _P2	=	0x00a0
                           0000A8   138 _IE	=	0x00a8
                           0000B0   139 _P3	=	0x00b0
                           0000B8   140 _IP	=	0x00b8
                           0000D0   141 _PSW	=	0x00d0
                           0000E0   142 _ACC	=	0x00e0
                           0000F0   143 _B	=	0x00f0
                                    144 ;--------------------------------------------------------
                                    145 ; special function bits
                                    146 ;--------------------------------------------------------
                                    147 	.area RSEG    (ABS,DATA)
      000000                        148 	.org 0x0000
                           000080   149 _P0_0	=	0x0080
                           000081   150 _P0_1	=	0x0081
                           000082   151 _P0_2	=	0x0082
                           000083   152 _P0_3	=	0x0083
                           000084   153 _P0_4	=	0x0084
                           000085   154 _P0_5	=	0x0085
                           000086   155 _P0_6	=	0x0086
                           000087   156 _P0_7	=	0x0087
                           000088   157 _IT0	=	0x0088
                           000089   158 _IE0	=	0x0089
                           00008A   159 _IT1	=	0x008a
                           00008B   160 _IE1	=	0x008b
                           00008C   161 _TR0	=	0x008c
                           00008D   162 _TF0	=	0x008d
                           00008E   163 _TR1	=	0x008e
                           00008F   164 _TF1	=	0x008f
                           000090   165 _P1_0	=	0x0090
                           000091   166 _P1_1	=	0x0091
                           000092   167 _P1_2	=	0x0092
                           000093   168 _P1_3	=	0x0093
                           000094   169 _P1_4	=	0x0094
                           000095   170 _P1_5	=	0x0095
                           000096   171 _P1_6	=	0x0096
                           000097   172 _P1_7	=	0x0097
                           000098   173 _RI	=	0x0098
                           000099   174 _TI	=	0x0099
                           00009A   175 _RB8	=	0x009a
                           00009B   176 _TB8	=	0x009b
                           00009C   177 _REN	=	0x009c
                           00009D   178 _SM2	=	0x009d
                           00009E   179 _SM1	=	0x009e
                           00009F   180 _SM0	=	0x009f
                           0000A0   181 _P2_0	=	0x00a0
                           0000A1   182 _P2_1	=	0x00a1
                           0000A2   183 _P2_2	=	0x00a2
                           0000A3   184 _P2_3	=	0x00a3
                           0000A4   185 _P2_4	=	0x00a4
                           0000A5   186 _P2_5	=	0x00a5
                           0000A6   187 _P2_6	=	0x00a6
                           0000A7   188 _P2_7	=	0x00a7
                           0000A8   189 _EX0	=	0x00a8
                           0000A9   190 _ET0	=	0x00a9
                           0000AA   191 _EX1	=	0x00aa
                           0000AB   192 _ET1	=	0x00ab
                           0000AC   193 _ES	=	0x00ac
                           0000AF   194 _EA	=	0x00af
                           0000B0   195 _P3_0	=	0x00b0
                           0000B1   196 _P3_1	=	0x00b1
                           0000B2   197 _P3_2	=	0x00b2
                           0000B3   198 _P3_3	=	0x00b3
                           0000B4   199 _P3_4	=	0x00b4
                           0000B5   200 _P3_5	=	0x00b5
                           0000B6   201 _P3_6	=	0x00b6
                           0000B7   202 _P3_7	=	0x00b7
                           0000B0   203 _RXD	=	0x00b0
                           0000B1   204 _TXD	=	0x00b1
                           0000B2   205 _INT0	=	0x00b2
                           0000B3   206 _INT1	=	0x00b3
                           0000B4   207 _T0	=	0x00b4
                           0000B5   208 _T1	=	0x00b5
                           0000B6   209 _WR	=	0x00b6
                           0000B7   210 _RD	=	0x00b7
                           0000B8   211 _PX0	=	0x00b8
                           0000B9   212 _PT0	=	0x00b9
                           0000BA   213 _PX1	=	0x00ba
                           0000BB   214 _PT1	=	0x00bb
                           0000BC   215 _PS	=	0x00bc
                           0000D0   216 _P	=	0x00d0
                           0000D1   217 _F1	=	0x00d1
                           0000D2   218 _OV	=	0x00d2
                           0000D3   219 _RS0	=	0x00d3
                           0000D4   220 _RS1	=	0x00d4
                           0000D5   221 _F0	=	0x00d5
                           0000D6   222 _AC	=	0x00d6
                           0000D7   223 _CY	=	0x00d7
                                    224 ;--------------------------------------------------------
                                    225 ; overlayable register banks
                                    226 ;--------------------------------------------------------
                                    227 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        228 	.ds 8
                                    229 ;--------------------------------------------------------
                                    230 ; internal ram data
                                    231 ;--------------------------------------------------------
                                    232 	.area DSEG    (DATA)
                           000038   233 _sp_save	=	0x0038
                           00003C   234 _live_mask	=	0x003c
                           00003D   235 _cur	=	0x003d
                           00003E   236 _nslot	=	0x003e
                           00003F   237 _keep_sp	=	0x003f
                                    238 ;--------------------------------------------------------
                                    239 ; overlayable items in internal ram
                                    240 ;--------------------------------------------------------
                                    241 	.area	OSEG    (OVR,DATA)
                                    242 ;--------------------------------------------------------
                                    243 ; indirectly addressable internal ram data
                                    244 ;--------------------------------------------------------
                                    245 	.area ISEG    (DATA)
                                    246 ;--------------------------------------------------------
                                    247 ; absolute internal ram data
                                    248 ;--------------------------------------------------------
                                    249 	.area IABS    (ABS,DATA)
                                    250 	.area IABS    (ABS,DATA)
                                    251 ;--------------------------------------------------------
                                    252 ; bit data
                                    253 ;--------------------------------------------------------
                                    254 	.area BSEG    (BIT)
                                    255 ;--------------------------------------------------------
                                    256 ; paged external ram data
                                    257 ;--------------------------------------------------------
                                    258 	.area PSEG    (PAG,XDATA)
                                    259 ;--------------------------------------------------------
                                    260 ; uninitialized external ram data
                                    261 ;--------------------------------------------------------
                                    262 	.area XSEG    (XDATA)
                                    263 ;--------------------------------------------------------
                                    264 ; absolute external ram data
                                    265 ;--------------------------------------------------------
                                    266 	.area XABS    (ABS,XDATA)
                                    267 ;--------------------------------------------------------
                                    268 ; initialized external ram data
                                    269 ;--------------------------------------------------------
                                    270 	.area XISEG   (XDATA)
                                    271 	.area HOME    (CODE)
                                    272 	.area GSINIT0 (CODE)
                                    273 	.area GSINIT1 (CODE)
                                    274 	.area GSINIT2 (CODE)
                                    275 	.area GSINIT3 (CODE)
                                    276 	.area GSINIT4 (CODE)
                                    277 	.area GSINIT5 (CODE)
                                    278 	.area GSINIT  (CODE)
                                    279 	.area GSFINAL (CODE)
                                    280 	.area CSEG    (CODE)
                                    281 ;--------------------------------------------------------
                                    282 ; global & static initialisations
                                    283 ;--------------------------------------------------------
                                    284 	.area HOME    (CODE)
                                    285 	.area GSINIT  (CODE)
                                    286 	.area GSFINAL (CODE)
                                    287 	.area GSINIT  (CODE)
                                    288 ;--------------------------------------------------------
                                    289 ; Home
                                    290 ;--------------------------------------------------------
                                    291 	.area HOME    (CODE)
                                    292 	.area HOME    (CODE)
                                    293 ;--------------------------------------------------------
                                    294 ; code
                                    295 ;--------------------------------------------------------
                                    296 	.area CSEG    (CODE)
                                    297 ;------------------------------------------------------------
                                    298 ;Allocation info for local variables in function 'Bootstrap'
                                    299 ;------------------------------------------------------------
                                    300 ;	preemptive.c:76: void Bootstrap(void)
                                    301 ;	-----------------------------------------
                                    302 ;	 function Bootstrap
                                    303 ;	-----------------------------------------
      00042C                        304 _Bootstrap:
                           000007   305 	ar7 = 0x07
                           000006   306 	ar6 = 0x06
                           000005   307 	ar5 = 0x05
                           000004   308 	ar4 = 0x04
                           000003   309 	ar3 = 0x03
                           000002   310 	ar2 = 0x02
                           000001   311 	ar1 = 0x01
                           000000   312 	ar0 = 0x00
                                    313 ;	preemptive.c:78: live_mask = 0;
      00042C 75 3C 00         [24]  314 	mov	_live_mask,#0x00
                                    315 ;	preemptive.c:82: cur  = ThreadCreate(main);
      00042F 90 02 AC         [24]  316 	mov	dptr,#_main
      000432 12 04 5C         [24]  317 	lcall	_ThreadCreate
      000435 85 82 3D         [24]  318 	mov	_cur,dpl
                                    319 ;	preemptive.c:83: EA   = 0;
                                    320 ;	assignBit
      000438 C2 AF            [12]  321 	clr	_EA
                                    322 ;	preemptive.c:84: SP   = sp_save[cur];   /* switch onto main's stack ... */
      00043A E5 3D            [12]  323 	mov	a,_cur
      00043C 24 38            [12]  324 	add	a, #_sp_save
      00043E F9               [12]  325 	mov	r1,a
      00043F 87 81            [24]  326 	mov	_SP,@r1
                                    327 ;	preemptive.c:85: CTX_POP;               /* ... then drop into main via its prepared frame */
      000441 D0 D0            [24]  328 	POP PSW 
      000443 D0 83            [24]  329 	POP DPH 
      000445 D0 82            [24]  330 	POP DPL 
      000447 D0 F0            [24]  331 	POP B 
      000449 D0 E0            [24]  332 	POP ACC 
      00044B D0 07            [24]  333 	POP 7 
      00044D D0 06            [24]  334 	POP 6 
      00044F D0 05            [24]  335 	POP 5 
      000451 D0 04            [24]  336 	POP 4 
      000453 D0 03            [24]  337 	POP 3 
      000455 D0 02            [24]  338 	POP 2 
      000457 D0 01            [24]  339 	POP 1 
      000459 D0 00            [24]  340 	POP 0 
                                    341 ;	preemptive.c:86: }
      00045B 22               [24]  342 	ret
                                    343 ;------------------------------------------------------------
                                    344 ;Allocation info for local variables in function 'ThreadCreate'
                                    345 ;------------------------------------------------------------
                                    346 ;fp            Allocated to registers 
                                    347 ;------------------------------------------------------------
                                    348 ;	preemptive.c:88: ThreadID ThreadCreate(FunctionPtr fp)
                                    349 ;	-----------------------------------------
                                    350 ;	 function ThreadCreate
                                    351 ;	-----------------------------------------
      00045C                        352 _ThreadCreate:
                                    353 ;	preemptive.c:90: EA = 0;
                                    354 ;	assignBit
      00045C C2 AF            [12]  355 	clr	_EA
                                    356 ;	preemptive.c:92: nslot = 0;
      00045E 75 3E 00         [24]  357 	mov	_nslot,#0x00
                                    358 ;	preemptive.c:93: while (nslot < MAXTHREADS) {
      000461                        359 00103$:
      000461 74 FC            [12]  360 	mov	a,#0x100 - 0x04
      000463 25 3E            [12]  361 	add	a,_nslot
      000465 40 18            [24]  362 	jc	00105$
                                    363 ;	preemptive.c:94: if (((live_mask >> nslot) & 1) == 0) break;
      000467 85 3E F0         [24]  364 	mov	b,_nslot
      00046A 05 F0            [12]  365 	inc	b
      00046C E5 3C            [12]  366 	mov	a,_live_mask
      00046E 80 02            [24]  367 	sjmp	00136$
      000470                        368 00135$:
      000470 C3               [12]  369 	clr	c
      000471 13               [12]  370 	rrc	a
      000472                        371 00136$:
      000472 D5 F0 FB         [24]  372 	djnz	b,00135$
      000475 30 E0 07         [24]  373 	jnb	acc.0,00105$
                                    374 ;	preemptive.c:95: nslot++;
      000478 E5 3E            [12]  375 	mov	a,_nslot
      00047A 04               [12]  376 	inc	a
      00047B F5 3E            [12]  377 	mov	_nslot,a
      00047D 80 E2            [24]  378 	sjmp	00103$
      00047F                        379 00105$:
                                    380 ;	preemptive.c:97: if (nslot == MAXTHREADS) {
      00047F 74 04            [12]  381 	mov	a,#0x04
      000481 B5 3E 06         [24]  382 	cjne	a,_nslot,00107$
                                    383 ;	preemptive.c:98: EA = 1;
                                    384 ;	assignBit
      000484 D2 AF            [12]  385 	setb	_EA
                                    386 ;	preemptive.c:99: return (ThreadID)-1;
      000486 75 82 FF         [24]  387 	mov	dpl, #0xff
      000489 22               [24]  388 	ret
      00048A                        389 00107$:
                                    390 ;	preemptive.c:102: live_mask |= (unsigned char)(1 << nslot);
      00048A 85 3E F0         [24]  391 	mov	b,_nslot
      00048D 05 F0            [12]  392 	inc	b
      00048F 74 01            [12]  393 	mov	a,#0x01
      000491 80 02            [24]  394 	sjmp	00141$
      000493                        395 00140$:
      000493 25 E0            [12]  396 	add	a,acc
      000495                        397 00141$:
      000495 D5 F0 FB         [24]  398 	djnz	b,00140$
      000498 42 3C            [12]  399 	orl	_live_mask,a
                                    400 ;	preemptive.c:104: keep_sp = SP;
      00049A 85 81 3F         [24]  401 	mov	_keep_sp,_SP
                                    402 ;	preemptive.c:105: SP = (unsigned char)(0x40 + (nslot << 4));   /* 16-byte frames from 0x40 */
      00049D E5 3E            [12]  403 	mov	a,_nslot
      00049F C4               [12]  404 	swap	a
      0004A0 54 F0            [12]  405 	anl	a,#0xf0
      0004A2 24 40            [12]  406 	add	a,#0x40
      0004A4 FF               [12]  407 	mov	r7,a
      0004A5 8F 81            [24]  408 	mov	_SP,r7
                                    409 ;	preemptive.c:126: __endasm;
      0004A7 C0 82            [24]  410 	PUSH	DPL
      0004A9 C0 83            [24]  411 	PUSH	DPH
      0004AB E4               [12]  412 	CLR	A
      0004AC C0 E0            [24]  413 	PUSH	ACC ; r0
      0004AE C0 E0            [24]  414 	PUSH	ACC ; r1
      0004B0 C0 E0            [24]  415 	PUSH	ACC ; r2
      0004B2 C0 E0            [24]  416 	PUSH	ACC ; r3
      0004B4 C0 E0            [24]  417 	PUSH	ACC ; r4
      0004B6 C0 E0            [24]  418 	PUSH	ACC ; r5
      0004B8 C0 E0            [24]  419 	PUSH	ACC ; r6
      0004BA C0 E0            [24]  420 	PUSH	ACC ; r7
      0004BC C0 E0            [24]  421 	PUSH	ACC ; ACC
      0004BE C0 E0            [24]  422 	PUSH	ACC ; B
      0004C0 C0 E0            [24]  423 	PUSH	ACC ; DPL
      0004C2 C0 E0            [24]  424 	PUSH	ACC ; DPH
      0004C4 C0 E0            [24]  425 	PUSH	ACC ; PSW
                                    426 ;	preemptive.c:128: sp_save[nslot] = SP;
      0004C6 E5 3E            [12]  427 	mov	a,_nslot
      0004C8 24 38            [12]  428 	add	a, #_sp_save
      0004CA F8               [12]  429 	mov	r0,a
      0004CB A6 81            [24]  430 	mov	@r0,_SP
                                    431 ;	preemptive.c:129: SP = keep_sp;
      0004CD 85 3F 81         [24]  432 	mov	_SP,_keep_sp
                                    433 ;	preemptive.c:131: EA = 1;
                                    434 ;	assignBit
      0004D0 D2 AF            [12]  435 	setb	_EA
                                    436 ;	preemptive.c:132: return (ThreadID)nslot;
      0004D2 85 3E 82         [24]  437 	mov	dpl, _nslot
                                    438 ;	preemptive.c:133: }
      0004D5 22               [24]  439 	ret
                                    440 ;------------------------------------------------------------
                                    441 ;Allocation info for local variables in function 'ThreadYield'
                                    442 ;------------------------------------------------------------
                                    443 ;	preemptive.c:135: void ThreadYield(void)
                                    444 ;	-----------------------------------------
                                    445 ;	 function ThreadYield
                                    446 ;	-----------------------------------------
      0004D6                        447 _ThreadYield:
                                    448 ;	preemptive.c:137: EA = 0;
                                    449 ;	assignBit
      0004D6 C2 AF            [12]  450 	clr	_EA
                                    451 ;	preemptive.c:138: CTX_PUSH;
      0004D8 C0 00            [24]  452 	PUSH 0 
      0004DA C0 01            [24]  453 	PUSH 1 
      0004DC C0 02            [24]  454 	PUSH 2 
      0004DE C0 03            [24]  455 	PUSH 3 
      0004E0 C0 04            [24]  456 	PUSH 4 
      0004E2 C0 05            [24]  457 	PUSH 5 
      0004E4 C0 06            [24]  458 	PUSH 6 
      0004E6 C0 07            [24]  459 	PUSH 7 
      0004E8 C0 E0            [24]  460 	PUSH ACC 
      0004EA C0 F0            [24]  461 	PUSH B 
      0004EC C0 82            [24]  462 	PUSH DPL 
      0004EE C0 83            [24]  463 	PUSH DPH 
      0004F0 C0 D0            [24]  464 	PUSH PSW 
                                    465 ;	preemptive.c:139: sp_save[cur] = SP;
      0004F2 E5 3D            [12]  466 	mov	a,_cur
      0004F4 24 38            [12]  467 	add	a, #_sp_save
      0004F6 F8               [12]  468 	mov	r0,a
      0004F7 A6 81            [24]  469 	mov	@r0,_SP
                                    470 ;	preemptive.c:140: NEXT_LIVE;
      0004F9                        471 00101$:
      0004F9 E5 3D            [12]  472 	mov	a,_cur
      0004FB FF               [12]  473 	mov	r7,a
      0004FC 04               [12]  474 	inc	a
      0004FD 54 03            [12]  475 	anl	a,#0x03
      0004FF F5 3D            [12]  476 	mov	_cur,a
      000501 85 3D F0         [24]  477 	mov	b,_cur
      000504 05 F0            [12]  478 	inc	b
      000506 E5 3C            [12]  479 	mov	a,_live_mask
      000508 80 02            [24]  480 	sjmp	00119$
      00050A                        481 00118$:
      00050A C3               [12]  482 	clr	c
      00050B 13               [12]  483 	rrc	a
      00050C                        484 00119$:
      00050C D5 F0 FB         [24]  485 	djnz	b,00118$
      00050F 30 E0 E7         [24]  486 	jnb	acc.0,00101$
                                    487 ;	preemptive.c:141: SP = sp_save[cur];
      000512 E5 3D            [12]  488 	mov	a,_cur
      000514 24 38            [12]  489 	add	a, #_sp_save
      000516 F9               [12]  490 	mov	r1,a
      000517 87 81            [24]  491 	mov	_SP,@r1
                                    492 ;	preemptive.c:142: CTX_POP;
      000519 D0 D0            [24]  493 	POP PSW 
      00051B D0 83            [24]  494 	POP DPH 
      00051D D0 82            [24]  495 	POP DPL 
      00051F D0 F0            [24]  496 	POP B 
      000521 D0 E0            [24]  497 	POP ACC 
      000523 D0 07            [24]  498 	POP 7 
      000525 D0 06            [24]  499 	POP 6 
      000527 D0 05            [24]  500 	POP 5 
      000529 D0 04            [24]  501 	POP 4 
      00052B D0 03            [24]  502 	POP 3 
      00052D D0 02            [24]  503 	POP 2 
      00052F D0 01            [24]  504 	POP 1 
      000531 D0 00            [24]  505 	POP 0 
                                    506 ;	preemptive.c:143: EA = 1;
                                    507 ;	assignBit
      000533 D2 AF            [12]  508 	setb	_EA
                                    509 ;	preemptive.c:144: }
      000535 22               [24]  510 	ret
                                    511 ;------------------------------------------------------------
                                    512 ;Allocation info for local variables in function 'ThreadExit'
                                    513 ;------------------------------------------------------------
                                    514 ;	preemptive.c:146: void ThreadExit(void)
                                    515 ;	-----------------------------------------
                                    516 ;	 function ThreadExit
                                    517 ;	-----------------------------------------
      000536                        518 _ThreadExit:
                                    519 ;	preemptive.c:148: EA = 0;
                                    520 ;	assignBit
      000536 C2 AF            [12]  521 	clr	_EA
                                    522 ;	preemptive.c:149: live_mask &= (unsigned char)~(1 << cur);
      000538 85 3D F0         [24]  523 	mov	b,_cur
      00053B 05 F0            [12]  524 	inc	b
      00053D 74 01            [12]  525 	mov	a,#0x01
      00053F 80 02            [24]  526 	sjmp	00130$
      000541                        527 00129$:
      000541 25 E0            [12]  528 	add	a,acc
      000543                        529 00130$:
      000543 D5 F0 FB         [24]  530 	djnz	b,00129$
      000546 F4               [12]  531 	cpl	a
      000547 52 3C            [12]  532 	anl	_live_mask,a
                                    533 ;	preemptive.c:150: if (live_mask == 0) {
      000549 E5 3C            [12]  534 	mov	a,_live_mask
      00054B 70 02            [24]  535 	jnz	00106$
                                    536 ;	preemptive.c:151: while (1) { }            /* nothing left to run */
      00054D                        537 00102$:
                                    538 ;	preemptive.c:153: NEXT_LIVE;
      00054D 80 FE            [24]  539 	sjmp	00102$
      00054F                        540 00106$:
      00054F E5 3D            [12]  541 	mov	a,_cur
      000551 FF               [12]  542 	mov	r7,a
      000552 04               [12]  543 	inc	a
      000553 54 03            [12]  544 	anl	a,#0x03
      000555 F5 3D            [12]  545 	mov	_cur,a
      000557 85 3D F0         [24]  546 	mov	b,_cur
      00055A 05 F0            [12]  547 	inc	b
      00055C E5 3C            [12]  548 	mov	a,_live_mask
      00055E 80 02            [24]  549 	sjmp	00133$
      000560                        550 00132$:
      000560 C3               [12]  551 	clr	c
      000561 13               [12]  552 	rrc	a
      000562                        553 00133$:
      000562 D5 F0 FB         [24]  554 	djnz	b,00132$
      000565 30 E0 E7         [24]  555 	jnb	acc.0,00106$
                                    556 ;	preemptive.c:154: SP = sp_save[cur];
      000568 E5 3D            [12]  557 	mov	a,_cur
      00056A 24 38            [12]  558 	add	a, #_sp_save
      00056C F9               [12]  559 	mov	r1,a
      00056D 87 81            [24]  560 	mov	_SP,@r1
                                    561 ;	preemptive.c:155: CTX_POP;
      00056F D0 D0            [24]  562 	POP PSW 
      000571 D0 83            [24]  563 	POP DPH 
      000573 D0 82            [24]  564 	POP DPL 
      000575 D0 F0            [24]  565 	POP B 
      000577 D0 E0            [24]  566 	POP ACC 
      000579 D0 07            [24]  567 	POP 7 
      00057B D0 06            [24]  568 	POP 6 
      00057D D0 05            [24]  569 	POP 5 
      00057F D0 04            [24]  570 	POP 4 
      000581 D0 03            [24]  571 	POP 3 
      000583 D0 02            [24]  572 	POP 2 
      000585 D0 01            [24]  573 	POP 1 
      000587 D0 00            [24]  574 	POP 0 
                                    575 ;	preemptive.c:156: EA = 1;
                                    576 ;	assignBit
      000589 D2 AF            [12]  577 	setb	_EA
                                    578 ;	preemptive.c:157: }
      00058B 22               [24]  579 	ret
                                    580 ;------------------------------------------------------------
                                    581 ;Allocation info for local variables in function 'myTimer0Handler'
                                    582 ;------------------------------------------------------------
                                    583 ;	preemptive.c:159: void myTimer0Handler(void)
                                    584 ;	-----------------------------------------
                                    585 ;	 function myTimer0Handler
                                    586 ;	-----------------------------------------
      00058C                        587 _myTimer0Handler:
                                    588 ;	preemptive.c:161: CTX_PUSH;
      00058C C0 00            [24]  589 	PUSH 0 
      00058E C0 01            [24]  590 	PUSH 1 
      000590 C0 02            [24]  591 	PUSH 2 
      000592 C0 03            [24]  592 	PUSH 3 
      000594 C0 04            [24]  593 	PUSH 4 
      000596 C0 05            [24]  594 	PUSH 5 
      000598 C0 06            [24]  595 	PUSH 6 
      00059A C0 07            [24]  596 	PUSH 7 
      00059C C0 E0            [24]  597 	PUSH ACC 
      00059E C0 F0            [24]  598 	PUSH B 
      0005A0 C0 82            [24]  599 	PUSH DPL 
      0005A2 C0 83            [24]  600 	PUSH DPH 
      0005A4 C0 D0            [24]  601 	PUSH PSW 
                                    602 ;	preemptive.c:162: sp_save[cur] = SP;
      0005A6 E5 3D            [12]  603 	mov	a,_cur
      0005A8 24 38            [12]  604 	add	a, #_sp_save
      0005AA F8               [12]  605 	mov	r0,a
      0005AB A6 81            [24]  606 	mov	@r0,_SP
                                    607 ;	preemptive.c:163: NEXT_LIVE;
      0005AD                        608 00101$:
      0005AD E5 3D            [12]  609 	mov	a,_cur
      0005AF FF               [12]  610 	mov	r7,a
      0005B0 04               [12]  611 	inc	a
      0005B1 54 03            [12]  612 	anl	a,#0x03
      0005B3 F5 3D            [12]  613 	mov	_cur,a
      0005B5 85 3D F0         [24]  614 	mov	b,_cur
      0005B8 05 F0            [12]  615 	inc	b
      0005BA E5 3C            [12]  616 	mov	a,_live_mask
      0005BC 80 02            [24]  617 	sjmp	00119$
      0005BE                        618 00118$:
      0005BE C3               [12]  619 	clr	c
      0005BF 13               [12]  620 	rrc	a
      0005C0                        621 00119$:
      0005C0 D5 F0 FB         [24]  622 	djnz	b,00118$
      0005C3 30 E0 E7         [24]  623 	jnb	acc.0,00101$
                                    624 ;	preemptive.c:164: SP = sp_save[cur];
      0005C6 E5 3D            [12]  625 	mov	a,_cur
      0005C8 24 38            [12]  626 	add	a, #_sp_save
      0005CA F9               [12]  627 	mov	r1,a
      0005CB 87 81            [24]  628 	mov	_SP,@r1
                                    629 ;	preemptive.c:165: CTX_POP;
      0005CD D0 D0            [24]  630 	POP PSW 
      0005CF D0 83            [24]  631 	POP DPH 
      0005D1 D0 82            [24]  632 	POP DPL 
      0005D3 D0 F0            [24]  633 	POP B 
      0005D5 D0 E0            [24]  634 	POP ACC 
      0005D7 D0 07            [24]  635 	POP 7 
      0005D9 D0 06            [24]  636 	POP 6 
      0005DB D0 05            [24]  637 	POP 5 
      0005DD D0 04            [24]  638 	POP 4 
      0005DF D0 03            [24]  639 	POP 3 
      0005E1 D0 02            [24]  640 	POP 2 
      0005E3 D0 01            [24]  641 	POP 1 
      0005E5 D0 00            [24]  642 	POP 0 
                                    643 ;	preemptive.c:166: __asm RETI __endasm;
      0005E7 32               [24]  644 	RETI	
                                    645 ;	preemptive.c:167: }
      0005E8 22               [24]  646 	ret
                                    647 	.area CSEG    (CODE)
                                    648 	.area CONST   (CODE)
                                    649 	.area XINIT   (CODE)
                                    650 	.area CABS    (ABS,CODE)
