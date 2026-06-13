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
                                     11 	.globl _myTimer0Handler
                                     12 	.globl _Bootstrap
                                     13 	.globl _main
                                     14 	.globl _CY
                                     15 	.globl _AC
                                     16 	.globl _F0
                                     17 	.globl _RS1
                                     18 	.globl _RS0
                                     19 	.globl _OV
                                     20 	.globl _F1
                                     21 	.globl _P
                                     22 	.globl _PS
                                     23 	.globl _PT1
                                     24 	.globl _PX1
                                     25 	.globl _PT0
                                     26 	.globl _PX0
                                     27 	.globl _RD
                                     28 	.globl _WR
                                     29 	.globl _T1
                                     30 	.globl _T0
                                     31 	.globl _INT1
                                     32 	.globl _INT0
                                     33 	.globl _TXD
                                     34 	.globl _RXD
                                     35 	.globl _P3_7
                                     36 	.globl _P3_6
                                     37 	.globl _P3_5
                                     38 	.globl _P3_4
                                     39 	.globl _P3_3
                                     40 	.globl _P3_2
                                     41 	.globl _P3_1
                                     42 	.globl _P3_0
                                     43 	.globl _EA
                                     44 	.globl _ES
                                     45 	.globl _ET1
                                     46 	.globl _EX1
                                     47 	.globl _ET0
                                     48 	.globl _EX0
                                     49 	.globl _P2_7
                                     50 	.globl _P2_6
                                     51 	.globl _P2_5
                                     52 	.globl _P2_4
                                     53 	.globl _P2_3
                                     54 	.globl _P2_2
                                     55 	.globl _P2_1
                                     56 	.globl _P2_0
                                     57 	.globl _SM0
                                     58 	.globl _SM1
                                     59 	.globl _SM2
                                     60 	.globl _REN
                                     61 	.globl _TB8
                                     62 	.globl _RB8
                                     63 	.globl _TI
                                     64 	.globl _RI
                                     65 	.globl _P1_7
                                     66 	.globl _P1_6
                                     67 	.globl _P1_5
                                     68 	.globl _P1_4
                                     69 	.globl _P1_3
                                     70 	.globl _P1_2
                                     71 	.globl _P1_1
                                     72 	.globl _P1_0
                                     73 	.globl _TF1
                                     74 	.globl _TR1
                                     75 	.globl _TF0
                                     76 	.globl _TR0
                                     77 	.globl _IE1
                                     78 	.globl _IT1
                                     79 	.globl _IE0
                                     80 	.globl _IT0
                                     81 	.globl _P0_7
                                     82 	.globl _P0_6
                                     83 	.globl _P0_5
                                     84 	.globl _P0_4
                                     85 	.globl _P0_3
                                     86 	.globl _P0_2
                                     87 	.globl _P0_1
                                     88 	.globl _P0_0
                                     89 	.globl _B
                                     90 	.globl _ACC
                                     91 	.globl _PSW
                                     92 	.globl _IP
                                     93 	.globl _P3
                                     94 	.globl _IE
                                     95 	.globl _P2
                                     96 	.globl _SBUF
                                     97 	.globl _SCON
                                     98 	.globl _P1
                                     99 	.globl _TH1
                                    100 	.globl _TH0
                                    101 	.globl _TL1
                                    102 	.globl _TL0
                                    103 	.globl _TMOD
                                    104 	.globl _TCON
                                    105 	.globl _PCON
                                    106 	.globl _DPH
                                    107 	.globl _DPL
                                    108 	.globl _SP
                                    109 	.globl _P0
                                    110 	.globl _sp_temp
                                    111 	.globl _temp_tid
                                    112 	.globl _saved_sp
                                    113 	.globl _thread_mask
                                    114 	.globl _active_thread
                                    115 	.globl _save_ar7
                                    116 	.globl _save_ar6
                                    117 	.globl _save_r1
                                    118 	.globl _save_r0
                                    119 	.globl _ThreadCreate
                                    120 	.globl _ThreadYield
                                    121 	.globl _ThreadExit
                                    122 ;--------------------------------------------------------
                                    123 ; special function registers
                                    124 ;--------------------------------------------------------
                                    125 	.area RSEG    (ABS,DATA)
      000000                        126 	.org 0x0000
                           000080   127 _P0	=	0x0080
                           000081   128 _SP	=	0x0081
                           000082   129 _DPL	=	0x0082
                           000083   130 _DPH	=	0x0083
                           000087   131 _PCON	=	0x0087
                           000088   132 _TCON	=	0x0088
                           000089   133 _TMOD	=	0x0089
                           00008A   134 _TL0	=	0x008a
                           00008B   135 _TL1	=	0x008b
                           00008C   136 _TH0	=	0x008c
                           00008D   137 _TH1	=	0x008d
                           000090   138 _P1	=	0x0090
                           000098   139 _SCON	=	0x0098
                           000099   140 _SBUF	=	0x0099
                           0000A0   141 _P2	=	0x00a0
                           0000A8   142 _IE	=	0x00a8
                           0000B0   143 _P3	=	0x00b0
                           0000B8   144 _IP	=	0x00b8
                           0000D0   145 _PSW	=	0x00d0
                           0000E0   146 _ACC	=	0x00e0
                           0000F0   147 _B	=	0x00f0
                                    148 ;--------------------------------------------------------
                                    149 ; special function bits
                                    150 ;--------------------------------------------------------
                                    151 	.area RSEG    (ABS,DATA)
      000000                        152 	.org 0x0000
                           000080   153 _P0_0	=	0x0080
                           000081   154 _P0_1	=	0x0081
                           000082   155 _P0_2	=	0x0082
                           000083   156 _P0_3	=	0x0083
                           000084   157 _P0_4	=	0x0084
                           000085   158 _P0_5	=	0x0085
                           000086   159 _P0_6	=	0x0086
                           000087   160 _P0_7	=	0x0087
                           000088   161 _IT0	=	0x0088
                           000089   162 _IE0	=	0x0089
                           00008A   163 _IT1	=	0x008a
                           00008B   164 _IE1	=	0x008b
                           00008C   165 _TR0	=	0x008c
                           00008D   166 _TF0	=	0x008d
                           00008E   167 _TR1	=	0x008e
                           00008F   168 _TF1	=	0x008f
                           000090   169 _P1_0	=	0x0090
                           000091   170 _P1_1	=	0x0091
                           000092   171 _P1_2	=	0x0092
                           000093   172 _P1_3	=	0x0093
                           000094   173 _P1_4	=	0x0094
                           000095   174 _P1_5	=	0x0095
                           000096   175 _P1_6	=	0x0096
                           000097   176 _P1_7	=	0x0097
                           000098   177 _RI	=	0x0098
                           000099   178 _TI	=	0x0099
                           00009A   179 _RB8	=	0x009a
                           00009B   180 _TB8	=	0x009b
                           00009C   181 _REN	=	0x009c
                           00009D   182 _SM2	=	0x009d
                           00009E   183 _SM1	=	0x009e
                           00009F   184 _SM0	=	0x009f
                           0000A0   185 _P2_0	=	0x00a0
                           0000A1   186 _P2_1	=	0x00a1
                           0000A2   187 _P2_2	=	0x00a2
                           0000A3   188 _P2_3	=	0x00a3
                           0000A4   189 _P2_4	=	0x00a4
                           0000A5   190 _P2_5	=	0x00a5
                           0000A6   191 _P2_6	=	0x00a6
                           0000A7   192 _P2_7	=	0x00a7
                           0000A8   193 _EX0	=	0x00a8
                           0000A9   194 _ET0	=	0x00a9
                           0000AA   195 _EX1	=	0x00aa
                           0000AB   196 _ET1	=	0x00ab
                           0000AC   197 _ES	=	0x00ac
                           0000AF   198 _EA	=	0x00af
                           0000B0   199 _P3_0	=	0x00b0
                           0000B1   200 _P3_1	=	0x00b1
                           0000B2   201 _P3_2	=	0x00b2
                           0000B3   202 _P3_3	=	0x00b3
                           0000B4   203 _P3_4	=	0x00b4
                           0000B5   204 _P3_5	=	0x00b5
                           0000B6   205 _P3_6	=	0x00b6
                           0000B7   206 _P3_7	=	0x00b7
                           0000B0   207 _RXD	=	0x00b0
                           0000B1   208 _TXD	=	0x00b1
                           0000B2   209 _INT0	=	0x00b2
                           0000B3   210 _INT1	=	0x00b3
                           0000B4   211 _T0	=	0x00b4
                           0000B5   212 _T1	=	0x00b5
                           0000B6   213 _WR	=	0x00b6
                           0000B7   214 _RD	=	0x00b7
                           0000B8   215 _PX0	=	0x00b8
                           0000B9   216 _PT0	=	0x00b9
                           0000BA   217 _PX1	=	0x00ba
                           0000BB   218 _PT1	=	0x00bb
                           0000BC   219 _PS	=	0x00bc
                           0000D0   220 _P	=	0x00d0
                           0000D1   221 _F1	=	0x00d1
                           0000D2   222 _OV	=	0x00d2
                           0000D3   223 _RS0	=	0x00d3
                           0000D4   224 _RS1	=	0x00d4
                           0000D5   225 _F0	=	0x00d5
                           0000D6   226 _AC	=	0x00d6
                           0000D7   227 _CY	=	0x00d7
                                    228 ;--------------------------------------------------------
                                    229 ; overlayable register banks
                                    230 ;--------------------------------------------------------
                                    231 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        232 	.ds 8
                                    233 ;--------------------------------------------------------
                                    234 ; internal ram data
                                    235 ;--------------------------------------------------------
                                    236 	.area DSEG    (DATA)
                           000033   237 _save_r0	=	0x0033
                           000034   238 _save_r1	=	0x0034
                           000035   239 _save_ar6	=	0x0035
                           000036   240 _save_ar7	=	0x0036
                           000038   241 _active_thread	=	0x0038
                           000039   242 _thread_mask	=	0x0039
                           00003A   243 _saved_sp	=	0x003a
                           00003E   244 _temp_tid	=	0x003e
                           00003F   245 _sp_temp	=	0x003f
                                    246 ;--------------------------------------------------------
                                    247 ; overlayable items in internal ram
                                    248 ;--------------------------------------------------------
                                    249 	.area	OSEG    (OVR,DATA)
                                    250 ;--------------------------------------------------------
                                    251 ; indirectly addressable internal ram data
                                    252 ;--------------------------------------------------------
                                    253 	.area ISEG    (DATA)
                                    254 ;--------------------------------------------------------
                                    255 ; absolute internal ram data
                                    256 ;--------------------------------------------------------
                                    257 	.area IABS    (ABS,DATA)
                                    258 	.area IABS    (ABS,DATA)
                                    259 ;--------------------------------------------------------
                                    260 ; bit data
                                    261 ;--------------------------------------------------------
                                    262 	.area BSEG    (BIT)
                                    263 ;--------------------------------------------------------
                                    264 ; paged external ram data
                                    265 ;--------------------------------------------------------
                                    266 	.area PSEG    (PAG,XDATA)
                                    267 ;--------------------------------------------------------
                                    268 ; uninitialized external ram data
                                    269 ;--------------------------------------------------------
                                    270 	.area XSEG    (XDATA)
                                    271 ;--------------------------------------------------------
                                    272 ; absolute external ram data
                                    273 ;--------------------------------------------------------
                                    274 	.area XABS    (ABS,XDATA)
                                    275 ;--------------------------------------------------------
                                    276 ; initialized external ram data
                                    277 ;--------------------------------------------------------
                                    278 	.area XISEG   (XDATA)
                                    279 	.area HOME    (CODE)
                                    280 	.area GSINIT0 (CODE)
                                    281 	.area GSINIT1 (CODE)
                                    282 	.area GSINIT2 (CODE)
                                    283 	.area GSINIT3 (CODE)
                                    284 	.area GSINIT4 (CODE)
                                    285 	.area GSINIT5 (CODE)
                                    286 	.area GSINIT  (CODE)
                                    287 	.area GSFINAL (CODE)
                                    288 	.area CSEG    (CODE)
                                    289 ;--------------------------------------------------------
                                    290 ; global & static initialisations
                                    291 ;--------------------------------------------------------
                                    292 	.area HOME    (CODE)
                                    293 	.area GSINIT  (CODE)
                                    294 	.area GSFINAL (CODE)
                                    295 	.area GSINIT  (CODE)
                                    296 ;--------------------------------------------------------
                                    297 ; Home
                                    298 ;--------------------------------------------------------
                                    299 	.area HOME    (CODE)
                                    300 	.area HOME    (CODE)
                                    301 ;--------------------------------------------------------
                                    302 ; code
                                    303 ;--------------------------------------------------------
                                    304 	.area CSEG    (CODE)
                                    305 ;------------------------------------------------------------
                                    306 ;Allocation info for local variables in function 'Bootstrap'
                                    307 ;------------------------------------------------------------
                                    308 ;	preemptive.c:40: void Bootstrap(void)
                                    309 ;	-----------------------------------------
                                    310 ;	 function Bootstrap
                                    311 ;	-----------------------------------------
      0000EA                        312 _Bootstrap:
                           000007   313 	ar7 = 0x07
                           000006   314 	ar6 = 0x06
                           000005   315 	ar5 = 0x05
                           000004   316 	ar4 = 0x04
                           000003   317 	ar3 = 0x03
                           000002   318 	ar2 = 0x02
                           000001   319 	ar1 = 0x01
                           000000   320 	ar0 = 0x00
                                    321 ;	preemptive.c:42: thread_mask = 0;
      0000EA 75 39 00         [24]  322 	mov	_thread_mask,#0x00
                                    323 ;	preemptive.c:43: TMOD = 0;
      0000ED 75 89 00         [24]  324 	mov	_TMOD,#0x00
                                    325 ;	preemptive.c:44: IE = 0x82;
      0000F0 75 A8 82         [24]  326 	mov	_IE,#0x82
                                    327 ;	preemptive.c:45: TR0 = 1;
                                    328 ;	assignBit
      0000F3 D2 8C            [12]  329 	setb	_TR0
                                    330 ;	preemptive.c:46: active_thread = ThreadCreate(main);
      0000F5 90 00 D1         [24]  331 	mov	dptr,#_main
      0000F8 12 01 10         [24]  332 	lcall	_ThreadCreate
      0000FB 85 82 38         [24]  333 	mov	_active_thread,dpl
                                    334 ;	preemptive.c:47: RESTORESTATE;
      0000FE E5 38            [12]  335 	mov	a,_active_thread
      000100 24 3A            [12]  336 	add	a, #_saved_sp
      000102 F9               [12]  337 	mov	r1,a
      000103 87 81            [24]  338 	mov	_SP,@r1
      000105 D0 D0            [24]  339 	POP PSW 
      000107 D0 82            [24]  340 	POP DPL 
      000109 D0 83            [24]  341 	POP DPH 
      00010B D0 E0            [24]  342 	POP ACC 
      00010D D0 F0            [24]  343 	POP B 
                                    344 ;	preemptive.c:48: }
      00010F 22               [24]  345 	ret
                                    346 ;------------------------------------------------------------
                                    347 ;Allocation info for local variables in function 'ThreadCreate'
                                    348 ;------------------------------------------------------------
                                    349 ;fp            Allocated to registers 
                                    350 ;------------------------------------------------------------
                                    351 ;	preemptive.c:50: ThreadID ThreadCreate(FunctionPtr fp)
                                    352 ;	-----------------------------------------
                                    353 ;	 function ThreadCreate
                                    354 ;	-----------------------------------------
      000110                        355 _ThreadCreate:
                                    356 ;	preemptive.c:52: EA = 0;
                                    357 ;	assignBit
      000110 C2 AF            [12]  358 	clr	_EA
                                    359 ;	preemptive.c:53: temp_tid = 0;
      000112 75 3E 00         [24]  360 	mov	_temp_tid,#0x00
                                    361 ;	preemptive.c:54: while (temp_tid < MAXTHREADS) {
      000115                        362 00103$:
      000115 74 FC            [12]  363 	mov	a,#0x100 - 0x04
      000117 25 3E            [12]  364 	add	a,_temp_tid
      000119 40 29            [24]  365 	jc	00105$
                                    366 ;	preemptive.c:55: if (!(thread_mask & (1 << temp_tid))) {
      00011B 85 3E F0         [24]  367 	mov	b,_temp_tid
      00011E 05 F0            [12]  368 	inc	b
      000120 7E 01            [12]  369 	mov	r6,#0x01
      000122 7F 00            [12]  370 	mov	r7,#0x00
      000124 80 06            [24]  371 	sjmp	00136$
      000126                        372 00135$:
      000126 EE               [12]  373 	mov	a,r6
      000127 2E               [12]  374 	add	a,r6
      000128 FE               [12]  375 	mov	r6,a
      000129 EF               [12]  376 	mov	a,r7
      00012A 33               [12]  377 	rlc	a
      00012B FF               [12]  378 	mov	r7,a
      00012C                        379 00136$:
      00012C D5 F0 F7         [24]  380 	djnz	b,00135$
      00012F AC 39            [24]  381 	mov	r4,_thread_mask
      000131 7D 00            [12]  382 	mov	r5,#0x00
      000133 EC               [12]  383 	mov	a,r4
      000134 52 06            [12]  384 	anl	ar6,a
      000136 ED               [12]  385 	mov	a,r5
      000137 52 07            [12]  386 	anl	ar7,a
      000139 EE               [12]  387 	mov	a,r6
      00013A 4F               [12]  388 	orl	a,r7
      00013B 60 07            [24]  389 	jz	00105$
                                    390 ;	preemptive.c:58: temp_tid++;
      00013D E5 3E            [12]  391 	mov	a,_temp_tid
      00013F 04               [12]  392 	inc	a
      000140 F5 3E            [12]  393 	mov	_temp_tid,a
      000142 80 D1            [24]  394 	sjmp	00103$
      000144                        395 00105$:
                                    396 ;	preemptive.c:61: if (temp_tid == MAXTHREADS) {
      000144 74 04            [12]  397 	mov	a,#0x04
      000146 B5 3E 06         [24]  398 	cjne	a,_temp_tid,00107$
                                    399 ;	preemptive.c:62: EA = 1;
                                    400 ;	assignBit
      000149 D2 AF            [12]  401 	setb	_EA
                                    402 ;	preemptive.c:63: return -1;
      00014B 75 82 FF         [24]  403 	mov	dpl, #0xff
      00014E 22               [24]  404 	ret
      00014F                        405 00107$:
                                    406 ;	preemptive.c:66: thread_mask |= (1 << temp_tid);
      00014F 85 3E F0         [24]  407 	mov	b,_temp_tid
      000152 05 F0            [12]  408 	inc	b
      000154 74 01            [12]  409 	mov	a,#0x01
      000156 80 02            [24]  410 	sjmp	00141$
      000158                        411 00140$:
      000158 25 E0            [12]  412 	add	a,acc
      00015A                        413 00141$:
      00015A D5 F0 FB         [24]  414 	djnz	b,00140$
      00015D 42 39            [12]  415 	orl	_thread_mask,a
                                    416 ;	preemptive.c:67: sp_temp = SP;
      00015F 85 81 3F         [24]  417 	mov	_sp_temp,_SP
                                    418 ;	preemptive.c:68: SP = 0x3F + (temp_tid * 16);
      000162 E5 3E            [12]  419 	mov	a,_temp_tid
      000164 C4               [12]  420 	swap	a
      000165 54 F0            [12]  421 	anl	a,#0xf0
      000167 FF               [12]  422 	mov	r7,a
      000168 24 3F            [12]  423 	add	a,#0x3f
      00016A F5 81            [12]  424 	mov	_SP,a
                                    425 ;	preemptive.c:78: __endasm;
      00016C C0 82            [24]  426 	PUSH	DPL
      00016E C0 83            [24]  427 	PUSH	DPH
      000170 74 00            [12]  428 	MOV	A, #0
      000172 C0 E0            [24]  429 	PUSH	ACC
      000174 C0 E0            [24]  430 	PUSH	ACC
      000176 C0 E0            [24]  431 	PUSH	ACC
      000178 C0 E0            [24]  432 	PUSH	ACC
                                    433 ;	preemptive.c:80: PSW = (temp_tid << 3);
      00017A E5 3E            [12]  434 	mov	a,_temp_tid
      00017C C4               [12]  435 	swap	a
      00017D 03               [12]  436 	rr	a
      00017E 54 F8            [12]  437 	anl	a,#0xf8
      000180 F5 D0            [12]  438 	mov	_PSW,a
                                    439 ;	preemptive.c:83: __endasm;
      000182 C0 D0            [24]  440 	PUSH	PSW
                                    441 ;	preemptive.c:85: saved_sp[temp_tid] = SP;
      000184 E5 3E            [12]  442 	mov	a,_temp_tid
      000186 24 3A            [12]  443 	add	a, #_saved_sp
      000188 F8               [12]  444 	mov	r0,a
      000189 A6 81            [24]  445 	mov	@r0,_SP
                                    446 ;	preemptive.c:86: SP = sp_temp;
      00018B 85 3F 81         [24]  447 	mov	_SP,_sp_temp
                                    448 ;	preemptive.c:87: EA = 1;
                                    449 ;	assignBit
      00018E D2 AF            [12]  450 	setb	_EA
                                    451 ;	preemptive.c:88: return temp_tid;
      000190 85 3E 82         [24]  452 	mov	dpl, _temp_tid
                                    453 ;	preemptive.c:89: }
      000193 22               [24]  454 	ret
                                    455 ;------------------------------------------------------------
                                    456 ;Allocation info for local variables in function 'ThreadYield'
                                    457 ;------------------------------------------------------------
                                    458 ;	preemptive.c:91: void ThreadYield(void)
                                    459 ;	-----------------------------------------
                                    460 ;	 function ThreadYield
                                    461 ;	-----------------------------------------
      000194                        462 _ThreadYield:
                                    463 ;	preemptive.c:93: EA = 0;
                                    464 ;	assignBit
      000194 C2 AF            [12]  465 	clr	_EA
                                    466 ;	preemptive.c:94: SAVESTATE;
      000196 C0 F0            [24]  467 	PUSH B 
      000198 C0 E0            [24]  468 	PUSH ACC 
      00019A C0 83            [24]  469 	PUSH DPH 
      00019C C0 82            [24]  470 	PUSH DPL 
      00019E C0 D0            [24]  471 	PUSH PSW 
      0001A0 E5 38            [12]  472 	mov	a,_active_thread
      0001A2 24 3A            [12]  473 	add	a, #_saved_sp
      0001A4 F8               [12]  474 	mov	r0,a
      0001A5 A6 81            [24]  475 	mov	@r0,_SP
                                    476 ;	preemptive.c:95: do {
      0001A7                        477 00103$:
                                    478 ;	preemptive.c:96: active_thread++;
      0001A7 E5 38            [12]  479 	mov	a,_active_thread
      0001A9 04               [12]  480 	inc	a
      0001AA F5 38            [12]  481 	mov	_active_thread,a
                                    482 ;	preemptive.c:97: if (active_thread == MAXTHREADS) {
      0001AC 74 04            [12]  483 	mov	a,#0x04
      0001AE B5 38 03         [24]  484 	cjne	a,_active_thread,00104$
                                    485 ;	preemptive.c:98: active_thread = 0;
      0001B1 75 38 00         [24]  486 	mov	_active_thread,#0x00
      0001B4                        487 00104$:
                                    488 ;	preemptive.c:100: } while ((thread_mask & (1 << active_thread)) == 0);
      0001B4 85 38 F0         [24]  489 	mov	b,_active_thread
      0001B7 05 F0            [12]  490 	inc	b
      0001B9 7E 01            [12]  491 	mov	r6,#0x01
      0001BB 7F 00            [12]  492 	mov	r7,#0x00
      0001BD 80 06            [24]  493 	sjmp	00129$
      0001BF                        494 00128$:
      0001BF EE               [12]  495 	mov	a,r6
      0001C0 2E               [12]  496 	add	a,r6
      0001C1 FE               [12]  497 	mov	r6,a
      0001C2 EF               [12]  498 	mov	a,r7
      0001C3 33               [12]  499 	rlc	a
      0001C4 FF               [12]  500 	mov	r7,a
      0001C5                        501 00129$:
      0001C5 D5 F0 F7         [24]  502 	djnz	b,00128$
      0001C8 AC 39            [24]  503 	mov	r4,_thread_mask
      0001CA 7D 00            [12]  504 	mov	r5,#0x00
      0001CC EC               [12]  505 	mov	a,r4
      0001CD 52 06            [12]  506 	anl	ar6,a
      0001CF ED               [12]  507 	mov	a,r5
      0001D0 52 07            [12]  508 	anl	ar7,a
      0001D2 EE               [12]  509 	mov	a,r6
      0001D3 4F               [12]  510 	orl	a,r7
      0001D4 60 D1            [24]  511 	jz	00103$
                                    512 ;	preemptive.c:101: RESTORESTATE;
      0001D6 E5 38            [12]  513 	mov	a,_active_thread
      0001D8 24 3A            [12]  514 	add	a, #_saved_sp
      0001DA F9               [12]  515 	mov	r1,a
      0001DB 87 81            [24]  516 	mov	_SP,@r1
      0001DD D0 D0            [24]  517 	POP PSW 
      0001DF D0 82            [24]  518 	POP DPL 
      0001E1 D0 83            [24]  519 	POP DPH 
      0001E3 D0 E0            [24]  520 	POP ACC 
      0001E5 D0 F0            [24]  521 	POP B 
                                    522 ;	preemptive.c:102: EA = 1;
                                    523 ;	assignBit
      0001E7 D2 AF            [12]  524 	setb	_EA
                                    525 ;	preemptive.c:103: }
      0001E9 22               [24]  526 	ret
                                    527 ;------------------------------------------------------------
                                    528 ;Allocation info for local variables in function 'ThreadExit'
                                    529 ;------------------------------------------------------------
                                    530 ;	preemptive.c:105: void ThreadExit(void)
                                    531 ;	-----------------------------------------
                                    532 ;	 function ThreadExit
                                    533 ;	-----------------------------------------
      0001EA                        534 _ThreadExit:
                                    535 ;	preemptive.c:107: EA = 0;
                                    536 ;	assignBit
      0001EA C2 AF            [12]  537 	clr	_EA
                                    538 ;	preemptive.c:108: thread_mask &= ~(1 << active_thread);
      0001EC 85 38 F0         [24]  539 	mov	b,_active_thread
      0001EF 05 F0            [12]  540 	inc	b
      0001F1 74 01            [12]  541 	mov	a,#0x01
      0001F3 80 02            [24]  542 	sjmp	00127$
      0001F5                        543 00126$:
      0001F5 25 E0            [12]  544 	add	a,acc
      0001F7                        545 00127$:
      0001F7 D5 F0 FB         [24]  546 	djnz	b,00126$
      0001FA F4               [12]  547 	cpl	a
      0001FB 52 39            [12]  548 	anl	_thread_mask,a
                                    549 ;	preemptive.c:109: do {
      0001FD                        550 00103$:
                                    551 ;	preemptive.c:110: active_thread++;
      0001FD E5 38            [12]  552 	mov	a,_active_thread
      0001FF 04               [12]  553 	inc	a
      000200 F5 38            [12]  554 	mov	_active_thread,a
                                    555 ;	preemptive.c:111: if (active_thread == MAXTHREADS) {
      000202 74 04            [12]  556 	mov	a,#0x04
      000204 B5 38 03         [24]  557 	cjne	a,_active_thread,00104$
                                    558 ;	preemptive.c:112: active_thread = 0;
      000207 75 38 00         [24]  559 	mov	_active_thread,#0x00
      00020A                        560 00104$:
                                    561 ;	preemptive.c:114: } while ((thread_mask & (1 << active_thread)) == 0);
      00020A 85 38 F0         [24]  562 	mov	b,_active_thread
      00020D 05 F0            [12]  563 	inc	b
      00020F 7E 01            [12]  564 	mov	r6,#0x01
      000211 7F 00            [12]  565 	mov	r7,#0x00
      000213 80 06            [24]  566 	sjmp	00131$
      000215                        567 00130$:
      000215 EE               [12]  568 	mov	a,r6
      000216 2E               [12]  569 	add	a,r6
      000217 FE               [12]  570 	mov	r6,a
      000218 EF               [12]  571 	mov	a,r7
      000219 33               [12]  572 	rlc	a
      00021A FF               [12]  573 	mov	r7,a
      00021B                        574 00131$:
      00021B D5 F0 F7         [24]  575 	djnz	b,00130$
      00021E AC 39            [24]  576 	mov	r4,_thread_mask
      000220 7D 00            [12]  577 	mov	r5,#0x00
      000222 EC               [12]  578 	mov	a,r4
      000223 52 06            [12]  579 	anl	ar6,a
      000225 ED               [12]  580 	mov	a,r5
      000226 52 07            [12]  581 	anl	ar7,a
      000228 EE               [12]  582 	mov	a,r6
      000229 4F               [12]  583 	orl	a,r7
      00022A 60 D1            [24]  584 	jz	00103$
                                    585 ;	preemptive.c:115: RESTORESTATE;
      00022C E5 38            [12]  586 	mov	a,_active_thread
      00022E 24 3A            [12]  587 	add	a, #_saved_sp
      000230 F9               [12]  588 	mov	r1,a
      000231 87 81            [24]  589 	mov	_SP,@r1
      000233 D0 D0            [24]  590 	POP PSW 
      000235 D0 82            [24]  591 	POP DPL 
      000237 D0 83            [24]  592 	POP DPH 
      000239 D0 E0            [24]  593 	POP ACC 
      00023B D0 F0            [24]  594 	POP B 
                                    595 ;	preemptive.c:116: EA = 1;
                                    596 ;	assignBit
      00023D D2 AF            [12]  597 	setb	_EA
                                    598 ;	preemptive.c:117: }
      00023F 22               [24]  599 	ret
                                    600 ;------------------------------------------------------------
                                    601 ;Allocation info for local variables in function 'myTimer0Handler'
                                    602 ;------------------------------------------------------------
                                    603 ;	preemptive.c:119: void myTimer0Handler(void)
                                    604 ;	-----------------------------------------
                                    605 ;	 function myTimer0Handler
                                    606 ;	-----------------------------------------
      000240                        607 _myTimer0Handler:
                                    608 ;	preemptive.c:133: __endasm;
      000240 C0 F0            [24]  609 	PUSH	B
      000242 C0 E0            [24]  610 	PUSH	ACC
      000244 C0 83            [24]  611 	PUSH	DPH
      000246 C0 82            [24]  612 	PUSH	DPL
      000248 C0 D0            [24]  613 	PUSH	PSW
      00024A 88 33            [24]  614 	MOV	_save_r0, R0
      00024C 89 34            [24]  615 	MOV	_save_r1, R1
      00024E E5 06            [12]  616 	MOV	A, 6
      000250 F5 35            [12]  617 	MOV	_save_ar6, A
      000252 E5 07            [12]  618 	MOV	A, 7
      000254 F5 36            [12]  619 	MOV	_save_ar7, A
                                    620 ;	preemptive.c:134: saved_sp[active_thread] = SP;
      000256 E5 38            [12]  621 	mov	a,_active_thread
      000258 24 3A            [12]  622 	add	a, #_saved_sp
      00025A F8               [12]  623 	mov	r0,a
      00025B A6 81            [24]  624 	mov	@r0,_SP
                                    625 ;	preemptive.c:136: do {
      00025D                        626 00103$:
                                    627 ;	preemptive.c:137: active_thread++;
      00025D E5 38            [12]  628 	mov	a,_active_thread
      00025F 04               [12]  629 	inc	a
      000260 F5 38            [12]  630 	mov	_active_thread,a
                                    631 ;	preemptive.c:138: if (active_thread == MAXTHREADS) {
      000262 74 04            [12]  632 	mov	a,#0x04
      000264 B5 38 03         [24]  633 	cjne	a,_active_thread,00104$
                                    634 ;	preemptive.c:139: active_thread = 0;
      000267 75 38 00         [24]  635 	mov	_active_thread,#0x00
      00026A                        636 00104$:
                                    637 ;	preemptive.c:141: } while ((thread_mask & (1 << active_thread)) == 0);
      00026A 85 38 F0         [24]  638 	mov	b,_active_thread
      00026D 05 F0            [12]  639 	inc	b
      00026F 7E 01            [12]  640 	mov	r6,#0x01
      000271 7F 00            [12]  641 	mov	r7,#0x00
      000273 80 06            [24]  642 	sjmp	00129$
      000275                        643 00128$:
      000275 EE               [12]  644 	mov	a,r6
      000276 2E               [12]  645 	add	a,r6
      000277 FE               [12]  646 	mov	r6,a
      000278 EF               [12]  647 	mov	a,r7
      000279 33               [12]  648 	rlc	a
      00027A FF               [12]  649 	mov	r7,a
      00027B                        650 00129$:
      00027B D5 F0 F7         [24]  651 	djnz	b,00128$
      00027E AC 39            [24]  652 	mov	r4,_thread_mask
      000280 7D 00            [12]  653 	mov	r5,#0x00
      000282 EC               [12]  654 	mov	a,r4
      000283 52 06            [12]  655 	anl	ar6,a
      000285 ED               [12]  656 	mov	a,r5
      000286 52 07            [12]  657 	anl	ar7,a
      000288 EE               [12]  658 	mov	a,r6
      000289 4F               [12]  659 	orl	a,r7
      00028A 60 D1            [24]  660 	jz	00103$
                                    661 ;	preemptive.c:143: sp_temp = saved_sp[active_thread];
      00028C E5 38            [12]  662 	mov	a,_active_thread
      00028E 24 3A            [12]  663 	add	a, #_saved_sp
      000290 F9               [12]  664 	mov	r1,a
      000291 87 3F            [24]  665 	mov	_sp_temp,@r1
                                    666 ;	preemptive.c:144: SP = sp_temp;
      000293 85 3F 81         [24]  667 	mov	_SP,_sp_temp
                                    668 ;	preemptive.c:159: __endasm;
      000296 A8 33            [24]  669 	MOV	R0, _save_r0
      000298 A9 34            [24]  670 	MOV	R1, _save_r1
      00029A E5 35            [12]  671 	MOV	A, _save_ar6
      00029C F5 06            [12]  672 	MOV	6, A
      00029E E5 36            [12]  673 	MOV	A, _save_ar7
      0002A0 F5 07            [12]  674 	MOV	7, A
      0002A2 D0 D0            [24]  675 	POP	PSW
      0002A4 D0 82            [24]  676 	POP	DPL
      0002A6 D0 83            [24]  677 	POP	DPH
      0002A8 D0 E0            [24]  678 	POP	ACC
      0002AA D0 F0            [24]  679 	POP	B
      0002AC 32               [24]  680 	RETI
                                    681 ;	preemptive.c:160: }
      0002AD 22               [24]  682 	ret
                                    683 	.area CSEG    (CODE)
                                    684 	.area CONST   (CODE)
                                    685 	.area XINIT   (CODE)
                                    686 	.area CABS    (ABS,CODE)
