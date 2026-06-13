                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler
                                      3 ; Version 4.5.10 #15658 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module cooperative
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
                                    109 	.globl _sp_temp
                                    110 	.globl _temp_tid
                                    111 	.globl _saved_sp
                                    112 	.globl _thread_mask
                                    113 	.globl _active_thread
                                    114 	.globl _ThreadCreate
                                    115 	.globl _ThreadYield
                                    116 	.globl _ThreadExit
                                    117 ;--------------------------------------------------------
                                    118 ; special function registers
                                    119 ;--------------------------------------------------------
                                    120 	.area RSEG    (ABS,DATA)
      000000                        121 	.org 0x0000
                           000080   122 _P0	=	0x0080
                           000081   123 _SP	=	0x0081
                           000082   124 _DPL	=	0x0082
                           000083   125 _DPH	=	0x0083
                           000087   126 _PCON	=	0x0087
                           000088   127 _TCON	=	0x0088
                           000089   128 _TMOD	=	0x0089
                           00008A   129 _TL0	=	0x008a
                           00008B   130 _TL1	=	0x008b
                           00008C   131 _TH0	=	0x008c
                           00008D   132 _TH1	=	0x008d
                           000090   133 _P1	=	0x0090
                           000098   134 _SCON	=	0x0098
                           000099   135 _SBUF	=	0x0099
                           0000A0   136 _P2	=	0x00a0
                           0000A8   137 _IE	=	0x00a8
                           0000B0   138 _P3	=	0x00b0
                           0000B8   139 _IP	=	0x00b8
                           0000D0   140 _PSW	=	0x00d0
                           0000E0   141 _ACC	=	0x00e0
                           0000F0   142 _B	=	0x00f0
                                    143 ;--------------------------------------------------------
                                    144 ; special function bits
                                    145 ;--------------------------------------------------------
                                    146 	.area RSEG    (ABS,DATA)
      000000                        147 	.org 0x0000
                           000080   148 _P0_0	=	0x0080
                           000081   149 _P0_1	=	0x0081
                           000082   150 _P0_2	=	0x0082
                           000083   151 _P0_3	=	0x0083
                           000084   152 _P0_4	=	0x0084
                           000085   153 _P0_5	=	0x0085
                           000086   154 _P0_6	=	0x0086
                           000087   155 _P0_7	=	0x0087
                           000088   156 _IT0	=	0x0088
                           000089   157 _IE0	=	0x0089
                           00008A   158 _IT1	=	0x008a
                           00008B   159 _IE1	=	0x008b
                           00008C   160 _TR0	=	0x008c
                           00008D   161 _TF0	=	0x008d
                           00008E   162 _TR1	=	0x008e
                           00008F   163 _TF1	=	0x008f
                           000090   164 _P1_0	=	0x0090
                           000091   165 _P1_1	=	0x0091
                           000092   166 _P1_2	=	0x0092
                           000093   167 _P1_3	=	0x0093
                           000094   168 _P1_4	=	0x0094
                           000095   169 _P1_5	=	0x0095
                           000096   170 _P1_6	=	0x0096
                           000097   171 _P1_7	=	0x0097
                           000098   172 _RI	=	0x0098
                           000099   173 _TI	=	0x0099
                           00009A   174 _RB8	=	0x009a
                           00009B   175 _TB8	=	0x009b
                           00009C   176 _REN	=	0x009c
                           00009D   177 _SM2	=	0x009d
                           00009E   178 _SM1	=	0x009e
                           00009F   179 _SM0	=	0x009f
                           0000A0   180 _P2_0	=	0x00a0
                           0000A1   181 _P2_1	=	0x00a1
                           0000A2   182 _P2_2	=	0x00a2
                           0000A3   183 _P2_3	=	0x00a3
                           0000A4   184 _P2_4	=	0x00a4
                           0000A5   185 _P2_5	=	0x00a5
                           0000A6   186 _P2_6	=	0x00a6
                           0000A7   187 _P2_7	=	0x00a7
                           0000A8   188 _EX0	=	0x00a8
                           0000A9   189 _ET0	=	0x00a9
                           0000AA   190 _EX1	=	0x00aa
                           0000AB   191 _ET1	=	0x00ab
                           0000AC   192 _ES	=	0x00ac
                           0000AF   193 _EA	=	0x00af
                           0000B0   194 _P3_0	=	0x00b0
                           0000B1   195 _P3_1	=	0x00b1
                           0000B2   196 _P3_2	=	0x00b2
                           0000B3   197 _P3_3	=	0x00b3
                           0000B4   198 _P3_4	=	0x00b4
                           0000B5   199 _P3_5	=	0x00b5
                           0000B6   200 _P3_6	=	0x00b6
                           0000B7   201 _P3_7	=	0x00b7
                           0000B0   202 _RXD	=	0x00b0
                           0000B1   203 _TXD	=	0x00b1
                           0000B2   204 _INT0	=	0x00b2
                           0000B3   205 _INT1	=	0x00b3
                           0000B4   206 _T0	=	0x00b4
                           0000B5   207 _T1	=	0x00b5
                           0000B6   208 _WR	=	0x00b6
                           0000B7   209 _RD	=	0x00b7
                           0000B8   210 _PX0	=	0x00b8
                           0000B9   211 _PT0	=	0x00b9
                           0000BA   212 _PX1	=	0x00ba
                           0000BB   213 _PT1	=	0x00bb
                           0000BC   214 _PS	=	0x00bc
                           0000D0   215 _P	=	0x00d0
                           0000D1   216 _F1	=	0x00d1
                           0000D2   217 _OV	=	0x00d2
                           0000D3   218 _RS0	=	0x00d3
                           0000D4   219 _RS1	=	0x00d4
                           0000D5   220 _F0	=	0x00d5
                           0000D6   221 _AC	=	0x00d6
                           0000D7   222 _CY	=	0x00d7
                                    223 ;--------------------------------------------------------
                                    224 ; overlayable register banks
                                    225 ;--------------------------------------------------------
                                    226 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        227 	.ds 8
                                    228 ;--------------------------------------------------------
                                    229 ; internal ram data
                                    230 ;--------------------------------------------------------
                                    231 	.area DSEG    (DATA)
                           000038   232 _active_thread	=	0x0038
                           000039   233 _thread_mask	=	0x0039
                           00003A   234 _saved_sp	=	0x003a
                           00003E   235 _temp_tid	=	0x003e
                           00003F   236 _sp_temp	=	0x003f
                                    237 ;--------------------------------------------------------
                                    238 ; overlayable items in internal ram
                                    239 ;--------------------------------------------------------
                                    240 	.area	OSEG    (OVR,DATA)
                                    241 ;--------------------------------------------------------
                                    242 ; indirectly addressable internal ram data
                                    243 ;--------------------------------------------------------
                                    244 	.area ISEG    (DATA)
                                    245 ;--------------------------------------------------------
                                    246 ; absolute internal ram data
                                    247 ;--------------------------------------------------------
                                    248 	.area IABS    (ABS,DATA)
                                    249 	.area IABS    (ABS,DATA)
                                    250 ;--------------------------------------------------------
                                    251 ; bit data
                                    252 ;--------------------------------------------------------
                                    253 	.area BSEG    (BIT)
                                    254 ;--------------------------------------------------------
                                    255 ; paged external ram data
                                    256 ;--------------------------------------------------------
                                    257 	.area PSEG    (PAG,XDATA)
                                    258 ;--------------------------------------------------------
                                    259 ; uninitialized external ram data
                                    260 ;--------------------------------------------------------
                                    261 	.area XSEG    (XDATA)
                                    262 ;--------------------------------------------------------
                                    263 ; absolute external ram data
                                    264 ;--------------------------------------------------------
                                    265 	.area XABS    (ABS,XDATA)
                                    266 ;--------------------------------------------------------
                                    267 ; initialized external ram data
                                    268 ;--------------------------------------------------------
                                    269 	.area XISEG   (XDATA)
                                    270 	.area HOME    (CODE)
                                    271 	.area GSINIT0 (CODE)
                                    272 	.area GSINIT1 (CODE)
                                    273 	.area GSINIT2 (CODE)
                                    274 	.area GSINIT3 (CODE)
                                    275 	.area GSINIT4 (CODE)
                                    276 	.area GSINIT5 (CODE)
                                    277 	.area GSINIT  (CODE)
                                    278 	.area GSFINAL (CODE)
                                    279 	.area CSEG    (CODE)
                                    280 ;--------------------------------------------------------
                                    281 ; global & static initialisations
                                    282 ;--------------------------------------------------------
                                    283 	.area HOME    (CODE)
                                    284 	.area GSINIT  (CODE)
                                    285 	.area GSFINAL (CODE)
                                    286 	.area GSINIT  (CODE)
                                    287 ;--------------------------------------------------------
                                    288 ; Home
                                    289 ;--------------------------------------------------------
                                    290 	.area HOME    (CODE)
                                    291 	.area HOME    (CODE)
                                    292 ;--------------------------------------------------------
                                    293 ; code
                                    294 ;--------------------------------------------------------
                                    295 	.area CSEG    (CODE)
                                    296 ;------------------------------------------------------------
                                    297 ;Allocation info for local variables in function 'Bootstrap'
                                    298 ;------------------------------------------------------------
                                    299 ;	cooperative.c:218: void Bootstrap(void)
                                    300 ;	-----------------------------------------
                                    301 ;	 function Bootstrap
                                    302 ;	-----------------------------------------
      0000AB                        303 _Bootstrap:
                           000007   304 	ar7 = 0x07
                           000006   305 	ar6 = 0x06
                           000005   306 	ar5 = 0x05
                           000004   307 	ar4 = 0x04
                           000003   308 	ar3 = 0x03
                           000002   309 	ar2 = 0x02
                           000001   310 	ar1 = 0x01
                           000000   311 	ar0 = 0x00
                                    312 ;	cooperative.c:220: thread_mask = 0;
      0000AB 75 39 00         [24]  313 	mov	_thread_mask,#0x00
                                    314 ;	cooperative.c:221: active_thread = ThreadCreate(main);
      0000AE 90 00 98         [24]  315 	mov	dptr,#_main
      0000B1 12 00 C9         [24]  316 	lcall	_ThreadCreate
      0000B4 85 82 38         [24]  317 	mov	_active_thread,dpl
                                    318 ;	cooperative.c:222: RESTORESTATE;
      0000B7 E5 38            [12]  319 	mov	a,_active_thread
      0000B9 24 3A            [12]  320 	add	a, #_saved_sp
      0000BB F9               [12]  321 	mov	r1,a
      0000BC 87 81            [24]  322 	mov	_SP,@r1
      0000BE D0 D0            [24]  323 	POP PSW 
      0000C0 D0 82            [24]  324 	POP DPL 
      0000C2 D0 83            [24]  325 	POP DPH 
      0000C4 D0 E0            [24]  326 	POP ACC 
      0000C6 D0 F0            [24]  327 	POP B 
                                    328 ;	cooperative.c:223: }
      0000C8 22               [24]  329 	ret
                                    330 ;------------------------------------------------------------
                                    331 ;Allocation info for local variables in function 'ThreadCreate'
                                    332 ;------------------------------------------------------------
                                    333 ;fp            Allocated to registers 
                                    334 ;------------------------------------------------------------
                                    335 ;	cooperative.c:225: ThreadID ThreadCreate(FunctionPtr fp)
                                    336 ;	-----------------------------------------
                                    337 ;	 function ThreadCreate
                                    338 ;	-----------------------------------------
      0000C9                        339 _ThreadCreate:
                                    340 ;	cooperative.c:228: temp_tid = 0;
      0000C9 75 3E 00         [24]  341 	mov	_temp_tid,#0x00
                                    342 ;	cooperative.c:229: while (temp_tid < MAXTHREADS) {
      0000CC                        343 00103$:
      0000CC 74 FC            [12]  344 	mov	a,#0x100 - 0x04
      0000CE 25 3E            [12]  345 	add	a,_temp_tid
      0000D0 40 29            [24]  346 	jc	00105$
                                    347 ;	cooperative.c:230: if (!(thread_mask & (1 << temp_tid))) {
      0000D2 85 3E F0         [24]  348 	mov	b,_temp_tid
      0000D5 05 F0            [12]  349 	inc	b
      0000D7 7E 01            [12]  350 	mov	r6,#0x01
      0000D9 7F 00            [12]  351 	mov	r7,#0x00
      0000DB 80 06            [24]  352 	sjmp	00136$
      0000DD                        353 00135$:
      0000DD EE               [12]  354 	mov	a,r6
      0000DE 2E               [12]  355 	add	a,r6
      0000DF FE               [12]  356 	mov	r6,a
      0000E0 EF               [12]  357 	mov	a,r7
      0000E1 33               [12]  358 	rlc	a
      0000E2 FF               [12]  359 	mov	r7,a
      0000E3                        360 00136$:
      0000E3 D5 F0 F7         [24]  361 	djnz	b,00135$
      0000E6 AC 39            [24]  362 	mov	r4,_thread_mask
      0000E8 7D 00            [12]  363 	mov	r5,#0x00
      0000EA EC               [12]  364 	mov	a,r4
      0000EB 52 06            [12]  365 	anl	ar6,a
      0000ED ED               [12]  366 	mov	a,r5
      0000EE 52 07            [12]  367 	anl	ar7,a
      0000F0 EE               [12]  368 	mov	a,r6
      0000F1 4F               [12]  369 	orl	a,r7
      0000F2 60 07            [24]  370 	jz	00105$
                                    371 ;	cooperative.c:233: temp_tid++;
      0000F4 E5 3E            [12]  372 	mov	a,_temp_tid
      0000F6 04               [12]  373 	inc	a
      0000F7 F5 3E            [12]  374 	mov	_temp_tid,a
      0000F9 80 D1            [24]  375 	sjmp	00103$
      0000FB                        376 00105$:
                                    377 ;	cooperative.c:236: if (temp_tid == MAXTHREADS) {
      0000FB 74 04            [12]  378 	mov	a,#0x04
      0000FD B5 3E 04         [24]  379 	cjne	a,_temp_tid,00107$
                                    380 ;	cooperative.c:237: return -1; // No threads available
      000100 75 82 FF         [24]  381 	mov	dpl, #0xff
      000103 22               [24]  382 	ret
      000104                        383 00107$:
                                    384 ;	cooperative.c:241: thread_mask |= (1 << temp_tid);
      000104 85 3E F0         [24]  385 	mov	b,_temp_tid
      000107 05 F0            [12]  386 	inc	b
      000109 74 01            [12]  387 	mov	a,#0x01
      00010B 80 02            [24]  388 	sjmp	00141$
      00010D                        389 00140$:
      00010D 25 E0            [12]  390 	add	a,acc
      00010F                        391 00141$:
      00010F D5 F0 FB         [24]  392 	djnz	b,00140$
      000112 42 39            [12]  393 	orl	_thread_mask,a
                                    394 ;	cooperative.c:244: sp_temp = SP;
      000114 85 81 3F         [24]  395 	mov	_sp_temp,_SP
                                    396 ;	cooperative.c:247: SP = 0x3F + (temp_tid * 16); 
      000117 E5 3E            [12]  397 	mov	a,_temp_tid
      000119 C4               [12]  398 	swap	a
      00011A 54 F0            [12]  399 	anl	a,#0xf0
      00011C FF               [12]  400 	mov	r7,a
      00011D 24 3F            [12]  401 	add	a,#0x3f
      00011F F5 81            [12]  402 	mov	_SP,a
                                    403 ;	cooperative.c:262: __endasm;
      000121 C0 82            [24]  404 	PUSH	DPL ; Return address low byte
      000123 C0 83            [24]  405 	PUSH	DPH ; Return address high byte
      000125 74 00            [12]  406 	MOV	A, #0
      000127 C0 E0            [24]  407 	PUSH	ACC ; Push 0 for B
      000129 C0 E0            [24]  408 	PUSH	ACC ; Push 0 for ACC
      00012B C0 E0            [24]  409 	PUSH	ACC ; Push 0 for DPH
      00012D C0 E0            [24]  410 	PUSH	ACC ; Push 0 for DPL
                                    411 ;	cooperative.c:265: PSW = (temp_tid << 3);
      00012F E5 3E            [12]  412 	mov	a,_temp_tid
      000131 C4               [12]  413 	swap	a
      000132 03               [12]  414 	rr	a
      000133 54 F8            [12]  415 	anl	a,#0xf8
      000135 F5 D0            [12]  416 	mov	_PSW,a
                                    417 ;	cooperative.c:268: __endasm;
      000137 C0 D0            [24]  418 	PUSH	PSW
                                    419 ;	cooperative.c:271: saved_sp[temp_tid] = SP;
      000139 E5 3E            [12]  420 	mov	a,_temp_tid
      00013B 24 3A            [12]  421 	add	a, #_saved_sp
      00013D F8               [12]  422 	mov	r0,a
      00013E A6 81            [24]  423 	mov	@r0,_SP
                                    424 ;	cooperative.c:272: SP = sp_temp;
      000140 85 3F 81         [24]  425 	mov	_SP,_sp_temp
                                    426 ;	cooperative.c:274: return temp_tid;
      000143 85 3E 82         [24]  427 	mov	dpl, _temp_tid
                                    428 ;	cooperative.c:275: }
      000146 22               [24]  429 	ret
                                    430 ;------------------------------------------------------------
                                    431 ;Allocation info for local variables in function 'ThreadYield'
                                    432 ;------------------------------------------------------------
                                    433 ;	cooperative.c:277: void ThreadYield(void)
                                    434 ;	-----------------------------------------
                                    435 ;	 function ThreadYield
                                    436 ;	-----------------------------------------
      000147                        437 _ThreadYield:
                                    438 ;	cooperative.c:279: SAVESTATE;
      000147 C0 F0            [24]  439 	PUSH B 
      000149 C0 E0            [24]  440 	PUSH ACC 
      00014B C0 83            [24]  441 	PUSH DPH 
      00014D C0 82            [24]  442 	PUSH DPL 
      00014F C0 D0            [24]  443 	PUSH PSW 
      000151 E5 38            [12]  444 	mov	a,_active_thread
      000153 24 3A            [12]  445 	add	a, #_saved_sp
      000155 F8               [12]  446 	mov	r0,a
      000156 A6 81            [24]  447 	mov	@r0,_SP
                                    448 ;	cooperative.c:284: do {
      000158                        449 00103$:
                                    450 ;	cooperative.c:285: active_thread++;
      000158 E5 38            [12]  451 	mov	a,_active_thread
      00015A 04               [12]  452 	inc	a
      00015B F5 38            [12]  453 	mov	_active_thread,a
                                    454 ;	cooperative.c:286: if (active_thread == MAXTHREADS) {
      00015D 74 04            [12]  455 	mov	a,#0x04
      00015F B5 38 03         [24]  456 	cjne	a,_active_thread,00104$
                                    457 ;	cooperative.c:287: active_thread = 0;
      000162 75 38 00         [24]  458 	mov	_active_thread,#0x00
      000165                        459 00104$:
                                    460 ;	cooperative.c:289: } while ((thread_mask & (1 << active_thread)) == 0);
      000165 85 38 F0         [24]  461 	mov	b,_active_thread
      000168 05 F0            [12]  462 	inc	b
      00016A 7E 01            [12]  463 	mov	r6,#0x01
      00016C 7F 00            [12]  464 	mov	r7,#0x00
      00016E 80 06            [24]  465 	sjmp	00129$
      000170                        466 00128$:
      000170 EE               [12]  467 	mov	a,r6
      000171 2E               [12]  468 	add	a,r6
      000172 FE               [12]  469 	mov	r6,a
      000173 EF               [12]  470 	mov	a,r7
      000174 33               [12]  471 	rlc	a
      000175 FF               [12]  472 	mov	r7,a
      000176                        473 00129$:
      000176 D5 F0 F7         [24]  474 	djnz	b,00128$
      000179 AC 39            [24]  475 	mov	r4,_thread_mask
      00017B 7D 00            [12]  476 	mov	r5,#0x00
      00017D EC               [12]  477 	mov	a,r4
      00017E 52 06            [12]  478 	anl	ar6,a
      000180 ED               [12]  479 	mov	a,r5
      000181 52 07            [12]  480 	anl	ar7,a
      000183 EE               [12]  481 	mov	a,r6
      000184 4F               [12]  482 	orl	a,r7
      000185 60 D1            [24]  483 	jz	00103$
                                    484 ;	cooperative.c:291: RESTORESTATE;
      000187 E5 38            [12]  485 	mov	a,_active_thread
      000189 24 3A            [12]  486 	add	a, #_saved_sp
      00018B F9               [12]  487 	mov	r1,a
      00018C 87 81            [24]  488 	mov	_SP,@r1
      00018E D0 D0            [24]  489 	POP PSW 
      000190 D0 82            [24]  490 	POP DPL 
      000192 D0 83            [24]  491 	POP DPH 
      000194 D0 E0            [24]  492 	POP ACC 
      000196 D0 F0            [24]  493 	POP B 
                                    494 ;	cooperative.c:292: }
      000198 22               [24]  495 	ret
                                    496 ;------------------------------------------------------------
                                    497 ;Allocation info for local variables in function 'ThreadExit'
                                    498 ;------------------------------------------------------------
                                    499 ;	cooperative.c:294: void ThreadExit(void)
                                    500 ;	-----------------------------------------
                                    501 ;	 function ThreadExit
                                    502 ;	-----------------------------------------
      000199                        503 _ThreadExit:
                                    504 ;	cooperative.c:297: thread_mask &= ~(1 << active_thread);
      000199 85 38 F0         [24]  505 	mov	b,_active_thread
      00019C 05 F0            [12]  506 	inc	b
      00019E 74 01            [12]  507 	mov	a,#0x01
      0001A0 80 02            [24]  508 	sjmp	00127$
      0001A2                        509 00126$:
      0001A2 25 E0            [12]  510 	add	a,acc
      0001A4                        511 00127$:
      0001A4 D5 F0 FB         [24]  512 	djnz	b,00126$
      0001A7 F4               [12]  513 	cpl	a
      0001A8 52 39            [12]  514 	anl	_thread_mask,a
                                    515 ;	cooperative.c:300: do {
      0001AA                        516 00103$:
                                    517 ;	cooperative.c:301: active_thread++;
      0001AA E5 38            [12]  518 	mov	a,_active_thread
      0001AC 04               [12]  519 	inc	a
      0001AD F5 38            [12]  520 	mov	_active_thread,a
                                    521 ;	cooperative.c:302: if (active_thread == MAXTHREADS) {
      0001AF 74 04            [12]  522 	mov	a,#0x04
      0001B1 B5 38 03         [24]  523 	cjne	a,_active_thread,00104$
                                    524 ;	cooperative.c:303: active_thread = 0;
      0001B4 75 38 00         [24]  525 	mov	_active_thread,#0x00
      0001B7                        526 00104$:
                                    527 ;	cooperative.c:305: } while ((thread_mask & (1 << active_thread)) == 0);
      0001B7 85 38 F0         [24]  528 	mov	b,_active_thread
      0001BA 05 F0            [12]  529 	inc	b
      0001BC 7E 01            [12]  530 	mov	r6,#0x01
      0001BE 7F 00            [12]  531 	mov	r7,#0x00
      0001C0 80 06            [24]  532 	sjmp	00131$
      0001C2                        533 00130$:
      0001C2 EE               [12]  534 	mov	a,r6
      0001C3 2E               [12]  535 	add	a,r6
      0001C4 FE               [12]  536 	mov	r6,a
      0001C5 EF               [12]  537 	mov	a,r7
      0001C6 33               [12]  538 	rlc	a
      0001C7 FF               [12]  539 	mov	r7,a
      0001C8                        540 00131$:
      0001C8 D5 F0 F7         [24]  541 	djnz	b,00130$
      0001CB AC 39            [24]  542 	mov	r4,_thread_mask
      0001CD 7D 00            [12]  543 	mov	r5,#0x00
      0001CF EC               [12]  544 	mov	a,r4
      0001D0 52 06            [12]  545 	anl	ar6,a
      0001D2 ED               [12]  546 	mov	a,r5
      0001D3 52 07            [12]  547 	anl	ar7,a
      0001D5 EE               [12]  548 	mov	a,r6
      0001D6 4F               [12]  549 	orl	a,r7
      0001D7 60 D1            [24]  550 	jz	00103$
                                    551 ;	cooperative.c:307: RESTORESTATE;
      0001D9 E5 38            [12]  552 	mov	a,_active_thread
      0001DB 24 3A            [12]  553 	add	a, #_saved_sp
      0001DD F9               [12]  554 	mov	r1,a
      0001DE 87 81            [24]  555 	mov	_SP,@r1
      0001E0 D0 D0            [24]  556 	POP PSW 
      0001E2 D0 82            [24]  557 	POP DPL 
      0001E4 D0 83            [24]  558 	POP DPH 
      0001E6 D0 E0            [24]  559 	POP ACC 
      0001E8 D0 F0            [24]  560 	POP B 
                                    561 ;	cooperative.c:308: }
      0001EA 22               [24]  562 	ret
                                    563 	.area CSEG    (CODE)
                                    564 	.area CONST   (CODE)
                                    565 	.area XINIT   (CODE)
                                    566 	.area CABS    (ABS,CODE)
