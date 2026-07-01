                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler
                                      3 ; Version 4.5.10 #15658 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module testlcd
                                      6 	
                                      7 	.optsdcc -mmcs51 --model-small
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _timer0_ISR
                                     12 	.globl __mcs51_genXRAMCLEAR
                                     13 	.globl __mcs51_genXINIT
                                     14 	.globl __mcs51_genRAMCLEAR
                                     15 	.globl __sdcc_gsinit_startup
                                     16 	.globl _main
                                     17 	.globl _lcd_consumer
                                     18 	.globl _pad_producer
                                     19 	.globl _bank_producer
                                     20 	.globl _LCD_ready
                                     21 	.globl _LCD_write_char
                                     22 	.globl _LCD_Init
                                     23 	.globl _AnyKeyPressed
                                     24 	.globl _KeyToChar
                                     25 	.globl _Init_Keypad
                                     26 	.globl _ButtonToChar
                                     27 	.globl _AnyButtonPressed
                                     28 	.globl _ThreadExit
                                     29 	.globl _ThreadYield
                                     30 	.globl _ThreadCreate
                                     31 	.globl _CY
                                     32 	.globl _AC
                                     33 	.globl _F0
                                     34 	.globl _RS1
                                     35 	.globl _RS0
                                     36 	.globl _OV
                                     37 	.globl _F1
                                     38 	.globl _P
                                     39 	.globl _PS
                                     40 	.globl _PT1
                                     41 	.globl _PX1
                                     42 	.globl _PT0
                                     43 	.globl _PX0
                                     44 	.globl _RD
                                     45 	.globl _WR
                                     46 	.globl _T1
                                     47 	.globl _T0
                                     48 	.globl _INT1
                                     49 	.globl _INT0
                                     50 	.globl _TXD
                                     51 	.globl _RXD
                                     52 	.globl _P3_7
                                     53 	.globl _P3_6
                                     54 	.globl _P3_5
                                     55 	.globl _P3_4
                                     56 	.globl _P3_3
                                     57 	.globl _P3_2
                                     58 	.globl _P3_1
                                     59 	.globl _P3_0
                                     60 	.globl _EA
                                     61 	.globl _ES
                                     62 	.globl _ET1
                                     63 	.globl _EX1
                                     64 	.globl _ET0
                                     65 	.globl _EX0
                                     66 	.globl _P2_7
                                     67 	.globl _P2_6
                                     68 	.globl _P2_5
                                     69 	.globl _P2_4
                                     70 	.globl _P2_3
                                     71 	.globl _P2_2
                                     72 	.globl _P2_1
                                     73 	.globl _P2_0
                                     74 	.globl _SM0
                                     75 	.globl _SM1
                                     76 	.globl _SM2
                                     77 	.globl _REN
                                     78 	.globl _TB8
                                     79 	.globl _RB8
                                     80 	.globl _TI
                                     81 	.globl _RI
                                     82 	.globl _P1_7
                                     83 	.globl _P1_6
                                     84 	.globl _P1_5
                                     85 	.globl _P1_4
                                     86 	.globl _P1_3
                                     87 	.globl _P1_2
                                     88 	.globl _P1_1
                                     89 	.globl _P1_0
                                     90 	.globl _TF1
                                     91 	.globl _TR1
                                     92 	.globl _TF0
                                     93 	.globl _TR0
                                     94 	.globl _IE1
                                     95 	.globl _IT1
                                     96 	.globl _IE0
                                     97 	.globl _IT0
                                     98 	.globl _P0_7
                                     99 	.globl _P0_6
                                    100 	.globl _P0_5
                                    101 	.globl _P0_4
                                    102 	.globl _P0_3
                                    103 	.globl _P0_2
                                    104 	.globl _P0_1
                                    105 	.globl _P0_0
                                    106 	.globl _B
                                    107 	.globl _ACC
                                    108 	.globl _PSW
                                    109 	.globl _IP
                                    110 	.globl _P3
                                    111 	.globl _IE
                                    112 	.globl _P2
                                    113 	.globl _SBUF
                                    114 	.globl _SCON
                                    115 	.globl _P1
                                    116 	.globl _TH1
                                    117 	.globl _TH0
                                    118 	.globl _TL1
                                    119 	.globl _TL0
                                    120 	.globl _TMOD
                                    121 	.globl _TCON
                                    122 	.globl _PCON
                                    123 	.globl _DPH
                                    124 	.globl _DPL
                                    125 	.globl _SP
                                    126 	.globl _P0
                                    127 	.globl _ring
                                    128 	.globl _qtail
                                    129 	.globl _qhead
                                    130 	.globl _qcount
                                    131 	.globl _qlock
                                    132 ;--------------------------------------------------------
                                    133 ; special function registers
                                    134 ;--------------------------------------------------------
                                    135 	.area RSEG    (ABS,DATA)
      000000                        136 	.org 0x0000
                           000080   137 _P0	=	0x0080
                           000081   138 _SP	=	0x0081
                           000082   139 _DPL	=	0x0082
                           000083   140 _DPH	=	0x0083
                           000087   141 _PCON	=	0x0087
                           000088   142 _TCON	=	0x0088
                           000089   143 _TMOD	=	0x0089
                           00008A   144 _TL0	=	0x008a
                           00008B   145 _TL1	=	0x008b
                           00008C   146 _TH0	=	0x008c
                           00008D   147 _TH1	=	0x008d
                           000090   148 _P1	=	0x0090
                           000098   149 _SCON	=	0x0098
                           000099   150 _SBUF	=	0x0099
                           0000A0   151 _P2	=	0x00a0
                           0000A8   152 _IE	=	0x00a8
                           0000B0   153 _P3	=	0x00b0
                           0000B8   154 _IP	=	0x00b8
                           0000D0   155 _PSW	=	0x00d0
                           0000E0   156 _ACC	=	0x00e0
                           0000F0   157 _B	=	0x00f0
                                    158 ;--------------------------------------------------------
                                    159 ; special function bits
                                    160 ;--------------------------------------------------------
                                    161 	.area RSEG    (ABS,DATA)
      000000                        162 	.org 0x0000
                           000080   163 _P0_0	=	0x0080
                           000081   164 _P0_1	=	0x0081
                           000082   165 _P0_2	=	0x0082
                           000083   166 _P0_3	=	0x0083
                           000084   167 _P0_4	=	0x0084
                           000085   168 _P0_5	=	0x0085
                           000086   169 _P0_6	=	0x0086
                           000087   170 _P0_7	=	0x0087
                           000088   171 _IT0	=	0x0088
                           000089   172 _IE0	=	0x0089
                           00008A   173 _IT1	=	0x008a
                           00008B   174 _IE1	=	0x008b
                           00008C   175 _TR0	=	0x008c
                           00008D   176 _TF0	=	0x008d
                           00008E   177 _TR1	=	0x008e
                           00008F   178 _TF1	=	0x008f
                           000090   179 _P1_0	=	0x0090
                           000091   180 _P1_1	=	0x0091
                           000092   181 _P1_2	=	0x0092
                           000093   182 _P1_3	=	0x0093
                           000094   183 _P1_4	=	0x0094
                           000095   184 _P1_5	=	0x0095
                           000096   185 _P1_6	=	0x0096
                           000097   186 _P1_7	=	0x0097
                           000098   187 _RI	=	0x0098
                           000099   188 _TI	=	0x0099
                           00009A   189 _RB8	=	0x009a
                           00009B   190 _TB8	=	0x009b
                           00009C   191 _REN	=	0x009c
                           00009D   192 _SM2	=	0x009d
                           00009E   193 _SM1	=	0x009e
                           00009F   194 _SM0	=	0x009f
                           0000A0   195 _P2_0	=	0x00a0
                           0000A1   196 _P2_1	=	0x00a1
                           0000A2   197 _P2_2	=	0x00a2
                           0000A3   198 _P2_3	=	0x00a3
                           0000A4   199 _P2_4	=	0x00a4
                           0000A5   200 _P2_5	=	0x00a5
                           0000A6   201 _P2_6	=	0x00a6
                           0000A7   202 _P2_7	=	0x00a7
                           0000A8   203 _EX0	=	0x00a8
                           0000A9   204 _ET0	=	0x00a9
                           0000AA   205 _EX1	=	0x00aa
                           0000AB   206 _ET1	=	0x00ab
                           0000AC   207 _ES	=	0x00ac
                           0000AF   208 _EA	=	0x00af
                           0000B0   209 _P3_0	=	0x00b0
                           0000B1   210 _P3_1	=	0x00b1
                           0000B2   211 _P3_2	=	0x00b2
                           0000B3   212 _P3_3	=	0x00b3
                           0000B4   213 _P3_4	=	0x00b4
                           0000B5   214 _P3_5	=	0x00b5
                           0000B6   215 _P3_6	=	0x00b6
                           0000B7   216 _P3_7	=	0x00b7
                           0000B0   217 _RXD	=	0x00b0
                           0000B1   218 _TXD	=	0x00b1
                           0000B2   219 _INT0	=	0x00b2
                           0000B3   220 _INT1	=	0x00b3
                           0000B4   221 _T0	=	0x00b4
                           0000B5   222 _T1	=	0x00b5
                           0000B6   223 _WR	=	0x00b6
                           0000B7   224 _RD	=	0x00b7
                           0000B8   225 _PX0	=	0x00b8
                           0000B9   226 _PT0	=	0x00b9
                           0000BA   227 _PX1	=	0x00ba
                           0000BB   228 _PT1	=	0x00bb
                           0000BC   229 _PS	=	0x00bc
                           0000D0   230 _P	=	0x00d0
                           0000D1   231 _F1	=	0x00d1
                           0000D2   232 _OV	=	0x00d2
                           0000D3   233 _RS0	=	0x00d3
                           0000D4   234 _RS1	=	0x00d4
                           0000D5   235 _F0	=	0x00d5
                           0000D6   236 _AC	=	0x00d6
                           0000D7   237 _CY	=	0x00d7
                                    238 ;--------------------------------------------------------
                                    239 ; overlayable register banks
                                    240 ;--------------------------------------------------------
                                    241 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        242 	.ds 8
                                    243 ;--------------------------------------------------------
                                    244 ; internal ram data
                                    245 ;--------------------------------------------------------
                                    246 	.area DSEG    (DATA)
                           000021   247 _qlock	=	0x0021
                           000022   248 _qcount	=	0x0022
                           000023   249 _qhead	=	0x0023
                           000024   250 _qtail	=	0x0024
                           000025   251 _ring	=	0x0025
                                    252 ;--------------------------------------------------------
                                    253 ; overlayable items in internal ram
                                    254 ;--------------------------------------------------------
                                    255 	.area	OSEG    (OVR,DATA)
                                    256 	.area	OSEG    (OVR,DATA)
                                    257 ;--------------------------------------------------------
                                    258 ; Stack segment in internal ram
                                    259 ;--------------------------------------------------------
                                    260 	.area SSEG
      000021                        261 __start__stack:
      000021                        262 	.ds	1
                                    263 
                                    264 ;--------------------------------------------------------
                                    265 ; indirectly addressable internal ram data
                                    266 ;--------------------------------------------------------
                                    267 	.area ISEG    (DATA)
                                    268 ;--------------------------------------------------------
                                    269 ; absolute internal ram data
                                    270 ;--------------------------------------------------------
                                    271 	.area IABS    (ABS,DATA)
                                    272 	.area IABS    (ABS,DATA)
                                    273 ;--------------------------------------------------------
                                    274 ; bit data
                                    275 ;--------------------------------------------------------
                                    276 	.area BSEG    (BIT)
                                    277 ;--------------------------------------------------------
                                    278 ; paged external ram data
                                    279 ;--------------------------------------------------------
                                    280 	.area PSEG    (PAG,XDATA)
                                    281 ;--------------------------------------------------------
                                    282 ; uninitialized external ram data
                                    283 ;--------------------------------------------------------
                                    284 	.area XSEG    (XDATA)
                                    285 ;--------------------------------------------------------
                                    286 ; absolute external ram data
                                    287 ;--------------------------------------------------------
                                    288 	.area XABS    (ABS,XDATA)
                                    289 ;--------------------------------------------------------
                                    290 ; initialized external ram data
                                    291 ;--------------------------------------------------------
                                    292 	.area XISEG   (XDATA)
                                    293 	.area HOME    (CODE)
                                    294 	.area GSINIT0 (CODE)
                                    295 	.area GSINIT1 (CODE)
                                    296 	.area GSINIT2 (CODE)
                                    297 	.area GSINIT3 (CODE)
                                    298 	.area GSINIT4 (CODE)
                                    299 	.area GSINIT5 (CODE)
                                    300 	.area GSINIT  (CODE)
                                    301 	.area GSFINAL (CODE)
                                    302 	.area CSEG    (CODE)
                                    303 ;--------------------------------------------------------
                                    304 ; interrupt vector
                                    305 ;--------------------------------------------------------
                                    306 	.area HOME    (CODE)
      000000                        307 __interrupt_vect:
      000000 02 01 92         [24]  308 	ljmp	__sdcc_gsinit_startup
      000003 32               [24]  309 	reti
      000004                        310 	.ds	7
      00000B 02 01 99         [24]  311 	ljmp	_timer0_ISR
                                    312 ; restartable atomic support routines
      00000E                        313 	.ds	2
      000010                        314 sdcc_atomic_exchange_rollback_start::
      000010 00               [12]  315 	nop
      000011 00               [12]  316 	nop
      000012                        317 sdcc_atomic_exchange_pdata_impl:
      000012 E2               [24]  318 	movx	a, @r0
      000013 FB               [12]  319 	mov	r3, a
      000014 EA               [12]  320 	mov	a, r2
      000015 F2               [24]  321 	movx	@r0, a
      000016 80 2C            [24]  322 	sjmp	sdcc_atomic_exchange_exit
      000018 00               [12]  323 	nop
      000019 00               [12]  324 	nop
      00001A                        325 sdcc_atomic_exchange_xdata_impl:
      00001A E0               [24]  326 	movx	a, @dptr
      00001B FB               [12]  327 	mov	r3, a
      00001C EA               [12]  328 	mov	a, r2
      00001D F0               [24]  329 	movx	@dptr, a
      00001E 80 24            [24]  330 	sjmp	sdcc_atomic_exchange_exit
      000020                        331 sdcc_atomic_compare_exchange_idata_impl:
      000020 E6               [12]  332 	mov	a, @r0
      000021 B5 02 02         [24]  333 	cjne	a, ar2, .+#5
      000024 EB               [12]  334 	mov	a, r3
      000025 F6               [12]  335 	mov	@r0, a
      000026 22               [24]  336 	ret
      000027 00               [12]  337 	nop
      000028                        338 sdcc_atomic_compare_exchange_pdata_impl:
      000028 E2               [24]  339 	movx	a, @r0
      000029 B5 02 02         [24]  340 	cjne	a, ar2, .+#5
      00002C EB               [12]  341 	mov	a, r3
      00002D F2               [24]  342 	movx	@r0, a
      00002E 22               [24]  343 	ret
      00002F 00               [12]  344 	nop
      000030                        345 sdcc_atomic_compare_exchange_xdata_impl:
      000030 E0               [24]  346 	movx	a, @dptr
      000031 B5 02 02         [24]  347 	cjne	a, ar2, .+#5
      000034 EB               [12]  348 	mov	a, r3
      000035 F0               [24]  349 	movx	@dptr, a
      000036 22               [24]  350 	ret
      000037                        351 sdcc_atomic_exchange_rollback_end::
                                    352 
      000037                        353 sdcc_atomic_exchange_gptr_impl::
      000037 30 F6 E0         [24]  354 	jnb	b.6, sdcc_atomic_exchange_xdata_impl
      00003A A8 82            [24]  355 	mov	r0, dpl
      00003C 20 F5 D3         [24]  356 	jb	b.5, sdcc_atomic_exchange_pdata_impl
      00003F                        357 sdcc_atomic_exchange_idata_impl:
      00003F EA               [12]  358 	mov	a, r2
      000040 C6               [12]  359 	xch	a, @r0
      000041 F5 82            [12]  360 	mov	dpl, a
      000043 22               [24]  361 	ret
      000044                        362 sdcc_atomic_exchange_exit:
      000044 8B 82            [24]  363 	mov	dpl, r3
      000046 22               [24]  364 	ret
      000047                        365 sdcc_atomic_compare_exchange_gptr_impl::
      000047 30 F6 E6         [24]  366 	jnb	b.6, sdcc_atomic_compare_exchange_xdata_impl
      00004A A8 82            [24]  367 	mov	r0, dpl
      00004C 20 F5 D9         [24]  368 	jb	b.5, sdcc_atomic_compare_exchange_pdata_impl
      00004F 80 CF            [24]  369 	sjmp	sdcc_atomic_compare_exchange_idata_impl
                                    370 ;--------------------------------------------------------
                                    371 ; global & static initialisations
                                    372 ;--------------------------------------------------------
                                    373 	.area HOME    (CODE)
                                    374 	.area GSINIT  (CODE)
                                    375 	.area GSFINAL (CODE)
                                    376 	.area GSINIT  (CODE)
                                    377 	.globl __sdcc_gsinit_startup
                                    378 	.globl __sdcc_program_startup
                                    379 	.globl __start__stack
                                    380 	.globl __mcs51_genXINIT
                                    381 	.globl __mcs51_genXRAMCLEAR
                                    382 	.globl __mcs51_genRAMCLEAR
                                    383 	.area GSFINAL (CODE)
      00007E 02 00 51         [24]  384 	ljmp	__sdcc_program_startup
                                    385 ;--------------------------------------------------------
                                    386 ; Home
                                    387 ;--------------------------------------------------------
                                    388 	.area HOME    (CODE)
                                    389 	.area HOME    (CODE)
      000051                        390 __sdcc_program_startup:
      000051 02 01 6F         [24]  391 	ljmp	_main
                                    392 ;	return from main will return to caller
                                    393 ;--------------------------------------------------------
                                    394 ; code
                                    395 ;--------------------------------------------------------
                                    396 	.area CSEG    (CODE)
                                    397 ;------------------------------------------------------------
                                    398 ;Allocation info for local variables in function 'put'
                                    399 ;------------------------------------------------------------
                                    400 ;ch            Allocated to registers r7 
                                    401 ;------------------------------------------------------------
                                    402 ;	testlcd.c:44: static void put(char ch)
                                    403 ;	-----------------------------------------
                                    404 ;	 function put
                                    405 ;	-----------------------------------------
      000081                        406 _put:
                           000007   407 	ar7 = 0x07
                           000006   408 	ar6 = 0x06
                           000005   409 	ar5 = 0x05
                           000004   410 	ar4 = 0x04
                           000003   411 	ar3 = 0x03
                           000002   412 	ar2 = 0x02
                           000001   413 	ar1 = 0x01
                           000000   414 	ar0 = 0x00
      000081 AF 82            [24]  415 	mov	r7, dpl
                                    416 ;	testlcd.c:46: SemaphoreWait(qlock);
      000083                        417 0$:
      000083 E5 21            [12]  418 	MOV A, _qlock 
      000085 60 FC            [24]  419 	JZ 0$ 
      000087 20 E7 F9         [24]  420 	JB ACC.7, 0$ 
      00008A 15 21            [12]  421 	DEC _qlock 
                                    422 ;	testlcd.c:47: if (qcount < RING) {
      00008C 74 FD            [12]  423 	mov	a,#0x100 - 0x03
      00008E 25 22            [12]  424 	add	a,_qcount
      000090 40 19            [24]  425 	jc	00104$
                                    426 ;	testlcd.c:48: ring[qtail] = ch;
      000092 E5 24            [12]  427 	mov	a,_qtail
      000094 24 25            [12]  428 	add	a, #_ring
      000096 F8               [12]  429 	mov	r0,a
      000097 A6 07            [24]  430 	mov	@r0,ar7
                                    431 ;	testlcd.c:49: qtail++;
      000099 E5 24            [12]  432 	mov	a,_qtail
      00009B 04               [12]  433 	inc	a
      00009C F5 24            [12]  434 	mov	_qtail,a
                                    435 ;	testlcd.c:50: if (qtail == RING) qtail = 0;
      00009E 74 03            [12]  436 	mov	a,#0x03
      0000A0 B5 24 03         [24]  437 	cjne	a,_qtail,00102$
      0000A3 75 24 00         [24]  438 	mov	_qtail,#0x00
      0000A6                        439 00102$:
                                    440 ;	testlcd.c:51: qcount++;
      0000A6 E5 22            [12]  441 	mov	a,_qcount
      0000A8 04               [12]  442 	inc	a
      0000A9 F5 22            [12]  443 	mov	_qcount,a
      0000AB                        444 00104$:
                                    445 ;	testlcd.c:53: SemaphoreSignal(qlock);
      0000AB 05 21            [12]  446 	INC	_qlock 
                                    447 ;	testlcd.c:54: }
      0000AD 22               [24]  448 	ret
                                    449 ;------------------------------------------------------------
                                    450 ;Allocation info for local variables in function 'get'
                                    451 ;------------------------------------------------------------
                                    452 ;ch            Allocated to registers r7 
                                    453 ;------------------------------------------------------------
                                    454 ;	testlcd.c:57: static char get(void)
                                    455 ;	-----------------------------------------
                                    456 ;	 function get
                                    457 ;	-----------------------------------------
      0000AE                        458 _get:
                                    459 ;	testlcd.c:59: char ch = 0;
      0000AE 7F 00            [12]  460 	mov	r7,#0x00
                                    461 ;	testlcd.c:60: SemaphoreWait(qlock);
      0000B0                        462 1$:
      0000B0 E5 21            [12]  463 	MOV A, _qlock 
      0000B2 60 FC            [24]  464 	JZ 1$ 
      0000B4 20 E7 F9         [24]  465 	JB ACC.7, 1$ 
      0000B7 15 21            [12]  466 	DEC _qlock 
                                    467 ;	testlcd.c:61: if (qcount > 0) {
      0000B9 E5 22            [12]  468 	mov	a,_qcount
      0000BB 60 19            [24]  469 	jz	00104$
                                    470 ;	testlcd.c:62: ch = ring[qhead];
      0000BD E5 23            [12]  471 	mov	a,_qhead
      0000BF 24 25            [12]  472 	add	a, #_ring
      0000C1 F9               [12]  473 	mov	r1,a
      0000C2 87 07            [24]  474 	mov	ar7,@r1
                                    475 ;	testlcd.c:63: qhead++;
      0000C4 E5 23            [12]  476 	mov	a,_qhead
      0000C6 04               [12]  477 	inc	a
      0000C7 F5 23            [12]  478 	mov	_qhead,a
                                    479 ;	testlcd.c:64: if (qhead == RING) qhead = 0;
      0000C9 74 03            [12]  480 	mov	a,#0x03
      0000CB B5 23 03         [24]  481 	cjne	a,_qhead,00102$
      0000CE 75 23 00         [24]  482 	mov	_qhead,#0x00
      0000D1                        483 00102$:
                                    484 ;	testlcd.c:65: qcount--;
      0000D1 E5 22            [12]  485 	mov	a,_qcount
      0000D3 14               [12]  486 	dec	a
      0000D4 F5 22            [12]  487 	mov	_qcount,a
      0000D6                        488 00104$:
                                    489 ;	testlcd.c:67: SemaphoreSignal(qlock);
      0000D6 05 21            [12]  490 	INC	_qlock 
                                    491 ;	testlcd.c:68: return ch;
      0000D8 8F 82            [24]  492 	mov	dpl, r7
                                    493 ;	testlcd.c:69: }
      0000DA 22               [24]  494 	ret
                                    495 ;------------------------------------------------------------
                                    496 ;Allocation info for local variables in function 'bank_producer'
                                    497 ;------------------------------------------------------------
                                    498 ;down          Allocated to registers r7 
                                    499 ;ch            Allocated to registers r5 
                                    500 ;------------------------------------------------------------
                                    501 ;	testlcd.c:72: void bank_producer(void)
                                    502 ;	-----------------------------------------
                                    503 ;	 function bank_producer
                                    504 ;	-----------------------------------------
      0000DB                        505 _bank_producer:
                                    506 ;	testlcd.c:74: unsigned char down = 0;
      0000DB 7F 00            [12]  507 	mov	r7,#0x00
                                    508 ;	testlcd.c:76: P2 = 0xFF;                      /* float the inputs; a press pulls low */
      0000DD 75 A0 FF         [24]  509 	mov	_P2,#0xff
                                    510 ;	testlcd.c:77: while (1) {
      0000E0                        511 00109$:
                                    512 ;	testlcd.c:78: if (AnyButtonPressed()) {
      0000E0 C0 07            [24]  513 	push	ar7
      0000E2 12 04 63         [24]  514 	lcall	_AnyButtonPressed
      0000E5 E5 82            [12]  515 	mov	a, dpl
      0000E7 D0 07            [24]  516 	pop	ar7
      0000E9 60 1D            [24]  517 	jz	00106$
                                    518 ;	testlcd.c:79: if (!down) {
      0000EB EF               [12]  519 	mov	a,r7
      0000EC 70 1C            [24]  520 	jnz	00107$
                                    521 ;	testlcd.c:80: down = 1;
      0000EE 7F 01            [12]  522 	mov	r7,#0x01
                                    523 ;	testlcd.c:81: ch = ButtonToChar();
      0000F0 C0 07            [24]  524 	push	ar7
      0000F2 12 04 74         [24]  525 	lcall	_ButtonToChar
      0000F5 AE 82            [24]  526 	mov	r6, dpl
      0000F7 D0 07            [24]  527 	pop	ar7
                                    528 ;	testlcd.c:82: if (ch) put(ch);
      0000F9 EE               [12]  529 	mov	a,r6
      0000FA FD               [12]  530 	mov	r5,a
      0000FB 60 0D            [24]  531 	jz	00107$
      0000FD 8D 82            [24]  532 	mov	dpl, r5
      0000FF C0 07            [24]  533 	push	ar7
      000101 12 00 81         [24]  534 	lcall	_put
      000104 D0 07            [24]  535 	pop	ar7
      000106 80 02            [24]  536 	sjmp	00107$
      000108                        537 00106$:
                                    538 ;	testlcd.c:85: down = 0;
      000108 7F 00            [12]  539 	mov	r7,#0x00
      00010A                        540 00107$:
                                    541 ;	testlcd.c:87: ThreadYield();
      00010A C0 07            [24]  542 	push	ar7
      00010C 12 02 49         [24]  543 	lcall	_ThreadYield
      00010F D0 07            [24]  544 	pop	ar7
                                    545 ;	testlcd.c:89: }
      000111 80 CD            [24]  546 	sjmp	00109$
                                    547 ;------------------------------------------------------------
                                    548 ;Allocation info for local variables in function 'pad_producer'
                                    549 ;------------------------------------------------------------
                                    550 ;down          Allocated to registers r7 
                                    551 ;ch            Allocated to registers r5 
                                    552 ;------------------------------------------------------------
                                    553 ;	testlcd.c:92: void pad_producer(void)
                                    554 ;	-----------------------------------------
                                    555 ;	 function pad_producer
                                    556 ;	-----------------------------------------
      000113                        557 _pad_producer:
                                    558 ;	testlcd.c:94: unsigned char down = 0;
      000113 7F 00            [12]  559 	mov	r7,#0x00
                                    560 ;	testlcd.c:96: Init_Keypad();
      000115 C0 07            [24]  561 	push	ar7
      000117 12 05 00         [24]  562 	lcall	_Init_Keypad
      00011A D0 07            [24]  563 	pop	ar7
                                    564 ;	testlcd.c:97: while (1) {
      00011C                        565 00109$:
                                    566 ;	testlcd.c:98: if (AnyKeyPressed()) {
      00011C C0 07            [24]  567 	push	ar7
      00011E 12 05 06         [24]  568 	lcall	_AnyKeyPressed
      000121 E5 82            [12]  569 	mov	a, dpl
      000123 D0 07            [24]  570 	pop	ar7
      000125 60 1D            [24]  571 	jz	00106$
                                    572 ;	testlcd.c:99: if (!down) {
      000127 EF               [12]  573 	mov	a,r7
      000128 70 1C            [24]  574 	jnz	00107$
                                    575 ;	testlcd.c:100: down = 1;
      00012A 7F 01            [12]  576 	mov	r7,#0x01
                                    577 ;	testlcd.c:101: ch = KeyToChar();
      00012C C0 07            [24]  578 	push	ar7
      00012E 12 05 13         [24]  579 	lcall	_KeyToChar
      000131 AE 82            [24]  580 	mov	r6, dpl
      000133 D0 07            [24]  581 	pop	ar7
                                    582 ;	testlcd.c:102: if (ch) put(ch);
      000135 EE               [12]  583 	mov	a,r6
      000136 FD               [12]  584 	mov	r5,a
      000137 60 0D            [24]  585 	jz	00107$
      000139 8D 82            [24]  586 	mov	dpl, r5
      00013B C0 07            [24]  587 	push	ar7
      00013D 12 00 81         [24]  588 	lcall	_put
      000140 D0 07            [24]  589 	pop	ar7
      000142 80 02            [24]  590 	sjmp	00107$
      000144                        591 00106$:
                                    592 ;	testlcd.c:105: down = 0;
      000144 7F 00            [12]  593 	mov	r7,#0x00
      000146                        594 00107$:
                                    595 ;	testlcd.c:107: ThreadYield();
      000146 C0 07            [24]  596 	push	ar7
      000148 12 02 49         [24]  597 	lcall	_ThreadYield
      00014B D0 07            [24]  598 	pop	ar7
                                    599 ;	testlcd.c:109: }
      00014D 80 CD            [24]  600 	sjmp	00109$
                                    601 ;------------------------------------------------------------
                                    602 ;Allocation info for local variables in function 'lcd_consumer'
                                    603 ;------------------------------------------------------------
                                    604 ;ch            Allocated to registers r6 
                                    605 ;------------------------------------------------------------
                                    606 ;	testlcd.c:112: void lcd_consumer(void)
                                    607 ;	-----------------------------------------
                                    608 ;	 function lcd_consumer
                                    609 ;	-----------------------------------------
      00014F                        610 _lcd_consumer:
                                    611 ;	testlcd.c:115: LCD_Init();
      00014F 12 03 60         [24]  612 	lcall	_LCD_Init
                                    613 ;	testlcd.c:116: while (1) {
      000152                        614 00105$:
                                    615 ;	testlcd.c:117: ch = get();
      000152 12 00 AE         [24]  616 	lcall	_get
                                    617 ;	testlcd.c:118: if (ch && LCD_ready()) {
      000155 E5 82            [12]  618 	mov	a,dpl
      000157 FE               [12]  619 	mov	r6,a
      000158 60 10            [24]  620 	jz	00102$
      00015A C0 06            [24]  621 	push	ar6
      00015C 12 03 5C         [24]  622 	lcall	_LCD_ready
      00015F E5 82            [12]  623 	mov	a, dpl
      000161 D0 06            [24]  624 	pop	ar6
      000163 60 05            [24]  625 	jz	00102$
                                    626 ;	testlcd.c:119: LCD_write_char(ch);
      000165 8E 82            [24]  627 	mov	dpl, r6
      000167 12 03 DD         [24]  628 	lcall	_LCD_write_char
      00016A                        629 00102$:
                                    630 ;	testlcd.c:121: ThreadYield();
      00016A 12 02 49         [24]  631 	lcall	_ThreadYield
                                    632 ;	testlcd.c:123: }
      00016D 80 E3            [24]  633 	sjmp	00105$
                                    634 ;------------------------------------------------------------
                                    635 ;Allocation info for local variables in function 'main'
                                    636 ;------------------------------------------------------------
                                    637 ;	testlcd.c:125: void main(void)
                                    638 ;	-----------------------------------------
                                    639 ;	 function main
                                    640 ;	-----------------------------------------
      00016F                        641 _main:
                                    642 ;	testlcd.c:127: ET0 = 0;                        /* cooperative: no Timer-0 preemption */
                                    643 ;	assignBit
      00016F C2 A9            [12]  644 	clr	_ET0
                                    645 ;	testlcd.c:129: SemaphoreCreate(qlock, 1);
      000171 75 21 01         [24]  646 	mov	_qlock,#0x01
                                    647 ;	testlcd.c:130: qcount = 0;
      000174 75 22 00         [24]  648 	mov	_qcount,#0x00
                                    649 ;	testlcd.c:131: qhead  = 0;
      000177 75 23 00         [24]  650 	mov	_qhead,#0x00
                                    651 ;	testlcd.c:132: qtail  = 0;
      00017A 75 24 00         [24]  652 	mov	_qtail,#0x00
                                    653 ;	testlcd.c:134: ThreadCreate(bank_producer);
      00017D 90 00 DB         [24]  654 	mov	dptr,#_bank_producer
      000180 12 01 CF         [24]  655 	lcall	_ThreadCreate
                                    656 ;	testlcd.c:135: ThreadCreate(pad_producer);
      000183 90 01 13         [24]  657 	mov	dptr,#_pad_producer
      000186 12 01 CF         [24]  658 	lcall	_ThreadCreate
                                    659 ;	testlcd.c:136: ThreadCreate(lcd_consumer);
      000189 90 01 4F         [24]  660 	mov	dptr,#_lcd_consumer
      00018C 12 01 CF         [24]  661 	lcall	_ThreadCreate
                                    662 ;	testlcd.c:138: ThreadExit();                   /* hand main's slot to the workers */
                                    663 ;	testlcd.c:139: }
      00018F 02 02 A9         [24]  664 	ljmp	_ThreadExit
                                    665 ;------------------------------------------------------------
                                    666 ;Allocation info for local variables in function '_sdcc_gsinit_startup'
                                    667 ;------------------------------------------------------------
                                    668 ;	testlcd.c:141: void _sdcc_gsinit_startup(void)
                                    669 ;	-----------------------------------------
                                    670 ;	 function _sdcc_gsinit_startup
                                    671 ;	-----------------------------------------
      000192                        672 __sdcc_gsinit_startup:
                                    673 ;	testlcd.c:145: __endasm;
      000192 02 01 9F         [24]  674 	LJMP	_Bootstrap
                                    675 ;	testlcd.c:146: }
      000195 22               [24]  676 	ret
                                    677 ;------------------------------------------------------------
                                    678 ;Allocation info for local variables in function '_mcs51_genRAMCLEAR'
                                    679 ;------------------------------------------------------------
                                    680 ;	testlcd.c:148: void _mcs51_genRAMCLEAR(void)  {}
                                    681 ;	-----------------------------------------
                                    682 ;	 function _mcs51_genRAMCLEAR
                                    683 ;	-----------------------------------------
      000196                        684 __mcs51_genRAMCLEAR:
      000196 22               [24]  685 	ret
                                    686 ;------------------------------------------------------------
                                    687 ;Allocation info for local variables in function '_mcs51_genXINIT'
                                    688 ;------------------------------------------------------------
                                    689 ;	testlcd.c:149: void _mcs51_genXINIT(void)     {}
                                    690 ;	-----------------------------------------
                                    691 ;	 function _mcs51_genXINIT
                                    692 ;	-----------------------------------------
      000197                        693 __mcs51_genXINIT:
      000197 22               [24]  694 	ret
                                    695 ;------------------------------------------------------------
                                    696 ;Allocation info for local variables in function '_mcs51_genXRAMCLEAR'
                                    697 ;------------------------------------------------------------
                                    698 ;	testlcd.c:150: void _mcs51_genXRAMCLEAR(void) {}
                                    699 ;	-----------------------------------------
                                    700 ;	 function _mcs51_genXRAMCLEAR
                                    701 ;	-----------------------------------------
      000198                        702 __mcs51_genXRAMCLEAR:
      000198 22               [24]  703 	ret
                                    704 ;------------------------------------------------------------
                                    705 ;Allocation info for local variables in function 'timer0_ISR'
                                    706 ;------------------------------------------------------------
                                    707 ;	testlcd.c:152: void timer0_ISR(void) __interrupt(1)
                                    708 ;	-----------------------------------------
                                    709 ;	 function timer0_ISR
                                    710 ;	-----------------------------------------
      000199                        711 _timer0_ISR:
                                    712 ;	testlcd.c:156: __endasm;
      000199 02 02 FF         [24]  713 	ljmp	_myTimer0Handler
                                    714 ;	testlcd.c:157: }
      00019C 02 00 54         [24]  715 	ljmp	sdcc_atomic_maybe_rollback
                                    716 ;	eliminated unneeded mov psw,# (no regs used in bank)
                                    717 ;	eliminated unneeded push/pop not_psw
                                    718 ;	eliminated unneeded push/pop dpl
                                    719 ;	eliminated unneeded push/pop dph
                                    720 ;	eliminated unneeded push/pop b
                                    721 ;	eliminated unneeded push/pop acc
                                    722 	.area CSEG    (CODE)
                                    723 	.area CONST   (CODE)
                                    724 	.area XINIT   (CODE)
                                    725 	.area CABS    (ABS,CODE)
