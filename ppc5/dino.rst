                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler
                                      3 ; Version 4.5.10 #15658 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module dino
                                      6 	
                                      7 	.optsdcc -mmcs51 --model-small
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _cactus_bmp
                                     12 	.globl _dino_bmp
                                     13 	.globl _timer0_ISR
                                     14 	.globl __mcs51_genXRAMCLEAR
                                     15 	.globl __mcs51_genXINIT
                                     16 	.globl __mcs51_genRAMCLEAR
                                     17 	.globl __sdcc_gsinit_startup
                                     18 	.globl _main
                                     19 	.globl _draw_thread
                                     20 	.globl _pad_thread
                                     21 	.globl _LCD_set_symbol
                                     22 	.globl _LCD_write_string
                                     23 	.globl _LCD_write_char
                                     24 	.globl _LCD_IRWrite
                                     25 	.globl _LCD_Init
                                     26 	.globl _AnyKeyPressed
                                     27 	.globl _KeyToChar
                                     28 	.globl _Init_Keypad
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
                                    127 	.globl _fn
                                    128 	.globl _ft
                                    129 	.globl _fh
                                    130 	.globl _fv
                                    131 	.globl _dm1
                                    132 	.globl _dm0
                                    133 	.globl _dcell
                                    134 	.globl _dcol
                                    135 	.globl _ddr
                                    136 	.globl _dst
                                    137 	.globl _lhot
                                    138 	.globl _lrng
                                    139 	.globl _lwait
                                    140 	.globl _lpicks
                                    141 	.globl _lk
                                    142 	.globl _takeCh
                                    143 	.globl _padCh
                                    144 	.globl _padDown
                                    145 	.globl _sbuf
                                    146 	.globl _row1
                                    147 	.globl _row0
                                    148 	.globl _score
                                    149 	.globl _keyNew
                                    150 	.globl _keyBox
                                    151 	.globl _dinoRow
                                    152 	.globl _level
                                    153 	.globl _phase
                                    154 	.globl _wlock
                                    155 ;--------------------------------------------------------
                                    156 ; special function registers
                                    157 ;--------------------------------------------------------
                                    158 	.area RSEG    (ABS,DATA)
      000000                        159 	.org 0x0000
                           000080   160 _P0	=	0x0080
                           000081   161 _SP	=	0x0081
                           000082   162 _DPL	=	0x0082
                           000083   163 _DPH	=	0x0083
                           000087   164 _PCON	=	0x0087
                           000088   165 _TCON	=	0x0088
                           000089   166 _TMOD	=	0x0089
                           00008A   167 _TL0	=	0x008a
                           00008B   168 _TL1	=	0x008b
                           00008C   169 _TH0	=	0x008c
                           00008D   170 _TH1	=	0x008d
                           000090   171 _P1	=	0x0090
                           000098   172 _SCON	=	0x0098
                           000099   173 _SBUF	=	0x0099
                           0000A0   174 _P2	=	0x00a0
                           0000A8   175 _IE	=	0x00a8
                           0000B0   176 _P3	=	0x00b0
                           0000B8   177 _IP	=	0x00b8
                           0000D0   178 _PSW	=	0x00d0
                           0000E0   179 _ACC	=	0x00e0
                           0000F0   180 _B	=	0x00f0
                                    181 ;--------------------------------------------------------
                                    182 ; special function bits
                                    183 ;--------------------------------------------------------
                                    184 	.area RSEG    (ABS,DATA)
      000000                        185 	.org 0x0000
                           000080   186 _P0_0	=	0x0080
                           000081   187 _P0_1	=	0x0081
                           000082   188 _P0_2	=	0x0082
                           000083   189 _P0_3	=	0x0083
                           000084   190 _P0_4	=	0x0084
                           000085   191 _P0_5	=	0x0085
                           000086   192 _P0_6	=	0x0086
                           000087   193 _P0_7	=	0x0087
                           000088   194 _IT0	=	0x0088
                           000089   195 _IE0	=	0x0089
                           00008A   196 _IT1	=	0x008a
                           00008B   197 _IE1	=	0x008b
                           00008C   198 _TR0	=	0x008c
                           00008D   199 _TF0	=	0x008d
                           00008E   200 _TR1	=	0x008e
                           00008F   201 _TF1	=	0x008f
                           000090   202 _P1_0	=	0x0090
                           000091   203 _P1_1	=	0x0091
                           000092   204 _P1_2	=	0x0092
                           000093   205 _P1_3	=	0x0093
                           000094   206 _P1_4	=	0x0094
                           000095   207 _P1_5	=	0x0095
                           000096   208 _P1_6	=	0x0096
                           000097   209 _P1_7	=	0x0097
                           000098   210 _RI	=	0x0098
                           000099   211 _TI	=	0x0099
                           00009A   212 _RB8	=	0x009a
                           00009B   213 _TB8	=	0x009b
                           00009C   214 _REN	=	0x009c
                           00009D   215 _SM2	=	0x009d
                           00009E   216 _SM1	=	0x009e
                           00009F   217 _SM0	=	0x009f
                           0000A0   218 _P2_0	=	0x00a0
                           0000A1   219 _P2_1	=	0x00a1
                           0000A2   220 _P2_2	=	0x00a2
                           0000A3   221 _P2_3	=	0x00a3
                           0000A4   222 _P2_4	=	0x00a4
                           0000A5   223 _P2_5	=	0x00a5
                           0000A6   224 _P2_6	=	0x00a6
                           0000A7   225 _P2_7	=	0x00a7
                           0000A8   226 _EX0	=	0x00a8
                           0000A9   227 _ET0	=	0x00a9
                           0000AA   228 _EX1	=	0x00aa
                           0000AB   229 _ET1	=	0x00ab
                           0000AC   230 _ES	=	0x00ac
                           0000AF   231 _EA	=	0x00af
                           0000B0   232 _P3_0	=	0x00b0
                           0000B1   233 _P3_1	=	0x00b1
                           0000B2   234 _P3_2	=	0x00b2
                           0000B3   235 _P3_3	=	0x00b3
                           0000B4   236 _P3_4	=	0x00b4
                           0000B5   237 _P3_5	=	0x00b5
                           0000B6   238 _P3_6	=	0x00b6
                           0000B7   239 _P3_7	=	0x00b7
                           0000B0   240 _RXD	=	0x00b0
                           0000B1   241 _TXD	=	0x00b1
                           0000B2   242 _INT0	=	0x00b2
                           0000B3   243 _INT1	=	0x00b3
                           0000B4   244 _T0	=	0x00b4
                           0000B5   245 _T1	=	0x00b5
                           0000B6   246 _WR	=	0x00b6
                           0000B7   247 _RD	=	0x00b7
                           0000B8   248 _PX0	=	0x00b8
                           0000B9   249 _PT0	=	0x00b9
                           0000BA   250 _PX1	=	0x00ba
                           0000BB   251 _PT1	=	0x00bb
                           0000BC   252 _PS	=	0x00bc
                           0000D0   253 _P	=	0x00d0
                           0000D1   254 _F1	=	0x00d1
                           0000D2   255 _OV	=	0x00d2
                           0000D3   256 _RS0	=	0x00d3
                           0000D4   257 _RS1	=	0x00d4
                           0000D5   258 _F0	=	0x00d5
                           0000D6   259 _AC	=	0x00d6
                           0000D7   260 _CY	=	0x00d7
                                    261 ;--------------------------------------------------------
                                    262 ; overlayable register banks
                                    263 ;--------------------------------------------------------
                                    264 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        265 	.ds 8
                                    266 ;--------------------------------------------------------
                                    267 ; internal ram data
                                    268 ;--------------------------------------------------------
                                    269 	.area DSEG    (DATA)
                           000021   270 _wlock	=	0x0021
                           000022   271 _phase	=	0x0022
                           000023   272 _level	=	0x0023
                           000024   273 _dinoRow	=	0x0024
                           000025   274 _keyBox	=	0x0025
                           000026   275 _keyNew	=	0x0026
                           000027   276 _score	=	0x0027
                           000029   277 _row0	=	0x0029
                           00002B   278 _row1	=	0x002b
                           00002D   279 _sbuf	=	0x002d
                           000031   280 _padDown	=	0x0031
                           000032   281 _padCh	=	0x0032
                           000033   282 _takeCh	=	0x0033
                           000034   283 _lk	=	0x0034
                           000035   284 _lpicks	=	0x0035
                           000036   285 _lwait	=	0x0036
                           000037   286 _lrng	=	0x0037
                           000070   287 _lhot	=	0x0070
                           000071   288 _dst	=	0x0071
                           000072   289 _ddr	=	0x0072
                           000073   290 _dcol	=	0x0073
                           000074   291 _dcell	=	0x0074
                           000075   292 _dm0	=	0x0075
                           000077   293 _dm1	=	0x0077
                           000079   294 _fv	=	0x0079
                           00007B   295 _fh	=	0x007b
                           00007C   296 _ft	=	0x007c
                           00007D   297 _fn	=	0x007d
                                    298 ;--------------------------------------------------------
                                    299 ; overlayable items in internal ram
                                    300 ;--------------------------------------------------------
                                    301 ;--------------------------------------------------------
                                    302 ; Stack segment in internal ram
                                    303 ;--------------------------------------------------------
                                    304 	.area SSEG
      000021                        305 __start__stack:
      000021                        306 	.ds	1
                                    307 
                                    308 ;--------------------------------------------------------
                                    309 ; indirectly addressable internal ram data
                                    310 ;--------------------------------------------------------
                                    311 	.area ISEG    (DATA)
                                    312 ;--------------------------------------------------------
                                    313 ; absolute internal ram data
                                    314 ;--------------------------------------------------------
                                    315 	.area IABS    (ABS,DATA)
                                    316 	.area IABS    (ABS,DATA)
                                    317 ;--------------------------------------------------------
                                    318 ; bit data
                                    319 ;--------------------------------------------------------
                                    320 	.area BSEG    (BIT)
                                    321 ;--------------------------------------------------------
                                    322 ; paged external ram data
                                    323 ;--------------------------------------------------------
                                    324 	.area PSEG    (PAG,XDATA)
                                    325 ;--------------------------------------------------------
                                    326 ; uninitialized external ram data
                                    327 ;--------------------------------------------------------
                                    328 	.area XSEG    (XDATA)
                                    329 ;--------------------------------------------------------
                                    330 ; absolute external ram data
                                    331 ;--------------------------------------------------------
                                    332 	.area XABS    (ABS,XDATA)
                                    333 ;--------------------------------------------------------
                                    334 ; initialized external ram data
                                    335 ;--------------------------------------------------------
                                    336 	.area XISEG   (XDATA)
                                    337 	.area HOME    (CODE)
                                    338 	.area GSINIT0 (CODE)
                                    339 	.area GSINIT1 (CODE)
                                    340 	.area GSINIT2 (CODE)
                                    341 	.area GSINIT3 (CODE)
                                    342 	.area GSINIT4 (CODE)
                                    343 	.area GSINIT5 (CODE)
                                    344 	.area GSINIT  (CODE)
                                    345 	.area GSFINAL (CODE)
                                    346 	.area CSEG    (CODE)
                                    347 ;--------------------------------------------------------
                                    348 ; interrupt vector
                                    349 ;--------------------------------------------------------
                                    350 	.area HOME    (CODE)
      000000                        351 __interrupt_vect:
      000000 02 04 1F         [24]  352 	ljmp	__sdcc_gsinit_startup
      000003 32               [24]  353 	reti
      000004                        354 	.ds	7
      00000B 02 04 26         [24]  355 	ljmp	_timer0_ISR
                                    356 ; restartable atomic support routines
      00000E                        357 	.ds	2
      000010                        358 sdcc_atomic_exchange_rollback_start::
      000010 00               [12]  359 	nop
      000011 00               [12]  360 	nop
      000012                        361 sdcc_atomic_exchange_pdata_impl:
      000012 E2               [24]  362 	movx	a, @r0
      000013 FB               [12]  363 	mov	r3, a
      000014 EA               [12]  364 	mov	a, r2
      000015 F2               [24]  365 	movx	@r0, a
      000016 80 2C            [24]  366 	sjmp	sdcc_atomic_exchange_exit
      000018 00               [12]  367 	nop
      000019 00               [12]  368 	nop
      00001A                        369 sdcc_atomic_exchange_xdata_impl:
      00001A E0               [24]  370 	movx	a, @dptr
      00001B FB               [12]  371 	mov	r3, a
      00001C EA               [12]  372 	mov	a, r2
      00001D F0               [24]  373 	movx	@dptr, a
      00001E 80 24            [24]  374 	sjmp	sdcc_atomic_exchange_exit
      000020                        375 sdcc_atomic_compare_exchange_idata_impl:
      000020 E6               [12]  376 	mov	a, @r0
      000021 B5 02 02         [24]  377 	cjne	a, ar2, .+#5
      000024 EB               [12]  378 	mov	a, r3
      000025 F6               [12]  379 	mov	@r0, a
      000026 22               [24]  380 	ret
      000027 00               [12]  381 	nop
      000028                        382 sdcc_atomic_compare_exchange_pdata_impl:
      000028 E2               [24]  383 	movx	a, @r0
      000029 B5 02 02         [24]  384 	cjne	a, ar2, .+#5
      00002C EB               [12]  385 	mov	a, r3
      00002D F2               [24]  386 	movx	@r0, a
      00002E 22               [24]  387 	ret
      00002F 00               [12]  388 	nop
      000030                        389 sdcc_atomic_compare_exchange_xdata_impl:
      000030 E0               [24]  390 	movx	a, @dptr
      000031 B5 02 02         [24]  391 	cjne	a, ar2, .+#5
      000034 EB               [12]  392 	mov	a, r3
      000035 F0               [24]  393 	movx	@dptr, a
      000036 22               [24]  394 	ret
      000037                        395 sdcc_atomic_exchange_rollback_end::
                                    396 
      000037                        397 sdcc_atomic_exchange_gptr_impl::
      000037 30 F6 E0         [24]  398 	jnb	b.6, sdcc_atomic_exchange_xdata_impl
      00003A A8 82            [24]  399 	mov	r0, dpl
      00003C 20 F5 D3         [24]  400 	jb	b.5, sdcc_atomic_exchange_pdata_impl
      00003F                        401 sdcc_atomic_exchange_idata_impl:
      00003F EA               [12]  402 	mov	a, r2
      000040 C6               [12]  403 	xch	a, @r0
      000041 F5 82            [12]  404 	mov	dpl, a
      000043 22               [24]  405 	ret
      000044                        406 sdcc_atomic_exchange_exit:
      000044 8B 82            [24]  407 	mov	dpl, r3
      000046 22               [24]  408 	ret
      000047                        409 sdcc_atomic_compare_exchange_gptr_impl::
      000047 30 F6 E6         [24]  410 	jnb	b.6, sdcc_atomic_compare_exchange_xdata_impl
      00004A A8 82            [24]  411 	mov	r0, dpl
      00004C 20 F5 D9         [24]  412 	jb	b.5, sdcc_atomic_compare_exchange_pdata_impl
      00004F 80 CF            [24]  413 	sjmp	sdcc_atomic_compare_exchange_idata_impl
                                    414 ;--------------------------------------------------------
                                    415 ; global & static initialisations
                                    416 ;--------------------------------------------------------
                                    417 	.area HOME    (CODE)
                                    418 	.area GSINIT  (CODE)
                                    419 	.area GSFINAL (CODE)
                                    420 	.area GSINIT  (CODE)
                                    421 	.globl __sdcc_gsinit_startup
                                    422 	.globl __sdcc_program_startup
                                    423 	.globl __start__stack
                                    424 	.globl __mcs51_genXINIT
                                    425 	.globl __mcs51_genXRAMCLEAR
                                    426 	.globl __mcs51_genRAMCLEAR
                                    427 	.area GSFINAL (CODE)
      00007E 02 00 51         [24]  428 	ljmp	__sdcc_program_startup
                                    429 ;--------------------------------------------------------
                                    430 ; Home
                                    431 ;--------------------------------------------------------
                                    432 	.area HOME    (CODE)
                                    433 	.area HOME    (CODE)
      000051                        434 __sdcc_program_startup:
      000051 02 02 AC         [24]  435 	ljmp	_main
                                    436 ;	return from main will return to caller
                                    437 ;--------------------------------------------------------
                                    438 ; code
                                    439 ;--------------------------------------------------------
                                    440 	.area CSEG    (CODE)
                                    441 ;------------------------------------------------------------
                                    442 ;Allocation info for local variables in function 'take_key'
                                    443 ;------------------------------------------------------------
                                    444 ;	dino.c:92: static void take_key(void)
                                    445 ;	-----------------------------------------
                                    446 ;	 function take_key
                                    447 ;	-----------------------------------------
      000081                        448 _take_key:
                           000007   449 	ar7 = 0x07
                           000006   450 	ar6 = 0x06
                           000005   451 	ar5 = 0x05
                           000004   452 	ar4 = 0x04
                           000003   453 	ar3 = 0x03
                           000002   454 	ar2 = 0x02
                           000001   455 	ar1 = 0x01
                           000000   456 	ar0 = 0x00
                                    457 ;	dino.c:94: takeCh = 0;
      000081 75 33 00         [24]  458 	mov	_takeCh,#0x00
                                    459 ;	dino.c:95: SemaphoreWait(wlock);
      000084                        460 0$:
      000084 E5 21            [12]  461 	MOV A, _wlock 
      000086 60 FC            [24]  462 	JZ 0$ 
      000088 20 E7 F9         [24]  463 	JB ACC.7, 0$ 
      00008B 15 21            [12]  464 	DEC _wlock 
                                    465 ;	dino.c:96: if (keyNew) { takeCh = keyBox; keyNew = 0; }
      00008D E5 26            [12]  466 	mov	a,_keyNew
      00008F 60 06            [24]  467 	jz	00102$
      000091 85 25 33         [24]  468 	mov	_takeCh,_keyBox
      000094 75 26 00         [24]  469 	mov	_keyNew,#0x00
      000097                        470 00102$:
                                    471 ;	dino.c:97: SemaphoreSignal(wlock);
      000097 05 21            [12]  472 	INC	_wlock 
                                    473 ;	dino.c:98: }
      000099 22               [24]  474 	ret
                                    475 ;------------------------------------------------------------
                                    476 ;Allocation info for local variables in function 'score_to_text'
                                    477 ;------------------------------------------------------------
                                    478 ;	dino.c:101: static void score_to_text(void)
                                    479 ;	-----------------------------------------
                                    480 ;	 function score_to_text
                                    481 ;	-----------------------------------------
      00009A                        482 _score_to_text:
                                    483 ;	dino.c:103: fv = score;
      00009A 85 27 79         [24]  484 	mov	_fv,_score
      00009D 85 28 7A         [24]  485 	mov	(_fv + 1),(_score + 1)
                                    486 ;	dino.c:104: if (fv > 999) fv = 999;
      0000A0 C3               [12]  487 	clr	c
      0000A1 74 E7            [12]  488 	mov	a,#0xe7
      0000A3 95 79            [12]  489 	subb	a,_fv
      0000A5 74 03            [12]  490 	mov	a,#0x03
      0000A7 95 7A            [12]  491 	subb	a,(_fv + 1)
      0000A9 50 06            [24]  492 	jnc	00102$
      0000AB 75 79 E7         [24]  493 	mov	_fv,#0xe7
      0000AE 75 7A 03         [24]  494 	mov	(_fv + 1),#0x03
      0000B1                        495 00102$:
                                    496 ;	dino.c:105: fh = 0; while (fv >= 100) { fv -= 100; fh++; }
      0000B1 75 7B 00         [24]  497 	mov	_fh,#0x00
      0000B4                        498 00103$:
      0000B4 C3               [12]  499 	clr	c
      0000B5 E5 79            [12]  500 	mov	a,_fv
      0000B7 94 64            [12]  501 	subb	a,#0x64
      0000B9 E5 7A            [12]  502 	mov	a,(_fv + 1)
      0000BB 94 00            [12]  503 	subb	a,#0x00
      0000BD 40 13            [24]  504 	jc	00105$
      0000BF E5 79            [12]  505 	mov	a,_fv
      0000C1 24 9C            [12]  506 	add	a,#0x9c
      0000C3 F5 79            [12]  507 	mov	_fv,a
      0000C5 E5 7A            [12]  508 	mov	a,(_fv + 1)
      0000C7 34 FF            [12]  509 	addc	a,#0xff
      0000C9 F5 7A            [12]  510 	mov	(_fv + 1),a
      0000CB E5 7B            [12]  511 	mov	a,_fh
      0000CD 04               [12]  512 	inc	a
      0000CE F5 7B            [12]  513 	mov	_fh,a
      0000D0 80 E2            [24]  514 	sjmp	00103$
      0000D2                        515 00105$:
                                    516 ;	dino.c:106: ft = 0; while (fv >= 10)  { fv -= 10;  ft++; }
      0000D2 75 7C 00         [24]  517 	mov	_ft,#0x00
      0000D5                        518 00106$:
      0000D5 C3               [12]  519 	clr	c
      0000D6 E5 79            [12]  520 	mov	a,_fv
      0000D8 94 0A            [12]  521 	subb	a,#0x0a
      0000DA E5 7A            [12]  522 	mov	a,(_fv + 1)
      0000DC 94 00            [12]  523 	subb	a,#0x00
      0000DE 40 13            [24]  524 	jc	00108$
      0000E0 E5 79            [12]  525 	mov	a,_fv
      0000E2 24 F6            [12]  526 	add	a,#0xf6
      0000E4 F5 79            [12]  527 	mov	_fv,a
      0000E6 E5 7A            [12]  528 	mov	a,(_fv + 1)
      0000E8 34 FF            [12]  529 	addc	a,#0xff
      0000EA F5 7A            [12]  530 	mov	(_fv + 1),a
      0000EC E5 7C            [12]  531 	mov	a,_ft
      0000EE 04               [12]  532 	inc	a
      0000EF F5 7C            [12]  533 	mov	_ft,a
      0000F1 80 E2            [24]  534 	sjmp	00106$
      0000F3                        535 00108$:
                                    536 ;	dino.c:107: fn = 0;
      0000F3 75 7D 00         [24]  537 	mov	_fn,#0x00
                                    538 ;	dino.c:108: if (fh)         { sbuf[fn] = '0' + fh; fn++; }
      0000F6 E5 7B            [12]  539 	mov	a,_fh
      0000F8 60 10            [24]  540 	jz	00110$
      0000FA E5 7D            [12]  541 	mov	a,_fn
      0000FC 24 2D            [12]  542 	add	a, #_sbuf
      0000FE F9               [12]  543 	mov	r1,a
      0000FF AF 7B            [24]  544 	mov	r7,_fh
      000101 74 30            [12]  545 	mov	a,#0x30
      000103 2F               [12]  546 	add	a, r7
      000104 F7               [12]  547 	mov	@r1,a
      000105 E5 7D            [12]  548 	mov	a,_fn
      000107 04               [12]  549 	inc	a
      000108 F5 7D            [12]  550 	mov	_fn,a
      00010A                        551 00110$:
                                    552 ;	dino.c:109: if (fh || ft)   { sbuf[fn] = '0' + ft; fn++; }
      00010A E5 7B            [12]  553 	mov	a,_fh
      00010C 70 04            [24]  554 	jnz	00111$
      00010E E5 7C            [12]  555 	mov	a,_ft
      000110 60 10            [24]  556 	jz	00112$
      000112                        557 00111$:
      000112 E5 7D            [12]  558 	mov	a,_fn
      000114 24 2D            [12]  559 	add	a, #_sbuf
      000116 F9               [12]  560 	mov	r1,a
      000117 AF 7C            [24]  561 	mov	r7,_ft
      000119 74 30            [12]  562 	mov	a,#0x30
      00011B 2F               [12]  563 	add	a, r7
      00011C F7               [12]  564 	mov	@r1,a
      00011D E5 7D            [12]  565 	mov	a,_fn
      00011F 04               [12]  566 	inc	a
      000120 F5 7D            [12]  567 	mov	_fn,a
      000122                        568 00112$:
                                    569 ;	dino.c:110: sbuf[fn] = '0' + (unsigned char)fv; fn++;
      000122 E5 7D            [12]  570 	mov	a,_fn
      000124 24 2D            [12]  571 	add	a, #_sbuf
      000126 F9               [12]  572 	mov	r1,a
      000127 AF 79            [24]  573 	mov	r7,_fv
      000129 74 30            [12]  574 	mov	a,#0x30
      00012B 2F               [12]  575 	add	a, r7
      00012C F7               [12]  576 	mov	@r1,a
      00012D E5 7D            [12]  577 	mov	a,_fn
      00012F 04               [12]  578 	inc	a
      000130 F5 7D            [12]  579 	mov	_fn,a
                                    580 ;	dino.c:111: sbuf[fn] = 0;
      000132 E5 7D            [12]  581 	mov	a,_fn
      000134 24 2D            [12]  582 	add	a, #_sbuf
      000136 F8               [12]  583 	mov	r0,a
      000137 76 00            [12]  584 	mov	@r0,#0x00
                                    585 ;	dino.c:112: }
      000139 22               [24]  586 	ret
                                    587 ;------------------------------------------------------------
                                    588 ;Allocation info for local variables in function 'pad_thread'
                                    589 ;------------------------------------------------------------
                                    590 ;	dino.c:115: void pad_thread(void)
                                    591 ;	-----------------------------------------
                                    592 ;	 function pad_thread
                                    593 ;	-----------------------------------------
      00013A                        594 _pad_thread:
                                    595 ;	dino.c:117: Init_Keypad();
      00013A 12 06 F0         [24]  596 	lcall	_Init_Keypad
                                    597 ;	dino.c:118: padDown = 0;
      00013D 75 31 00         [24]  598 	mov	_padDown,#0x00
      000140                        599 00111$:
                                    600 ;	dino.c:120: if (AnyKeyPressed()) {
      000140 12 06 F6         [24]  601 	lcall	_AnyKeyPressed
      000143 E5 82            [12]  602 	mov	a, dpl
      000145 60 28            [24]  603 	jz	00108$
                                    604 ;	dino.c:121: if (!padDown) {
      000147 E5 31            [12]  605 	mov	a,_padDown
      000149 70 27            [24]  606 	jnz	00109$
                                    607 ;	dino.c:122: padDown = 1;
      00014B 75 31 01         [24]  608 	mov	_padDown,#0x01
                                    609 ;	dino.c:123: padCh = KeyToChar();
      00014E 12 07 03         [24]  610 	lcall	_KeyToChar
      000151 85 82 32         [24]  611 	mov	_padCh,dpl
                                    612 ;	dino.c:124: if (padCh) {
      000154 E5 32            [12]  613 	mov	a,_padCh
      000156 60 1A            [24]  614 	jz	00109$
                                    615 ;	dino.c:125: SemaphoreWait(wlock);
      000158                        616 1$:
      000158 E5 21            [12]  617 	MOV A, _wlock 
      00015A 60 FC            [24]  618 	JZ 1$ 
      00015C 20 E7 F9         [24]  619 	JB ACC.7, 1$ 
      00015F 15 21            [12]  620 	DEC _wlock 
                                    621 ;	dino.c:126: if (!keyNew) { keyBox = padCh; keyNew = 1; }
      000161 E5 26            [12]  622 	mov	a,_keyNew
      000163 70 06            [24]  623 	jnz	00102$
      000165 85 32 25         [24]  624 	mov	_keyBox,_padCh
      000168 75 26 01         [24]  625 	mov	_keyNew,#0x01
      00016B                        626 00102$:
                                    627 ;	dino.c:127: SemaphoreSignal(wlock);
      00016B 05 21            [12]  628 	INC	_wlock 
      00016D 80 03            [24]  629 	sjmp	00109$
      00016F                        630 00108$:
                                    631 ;	dino.c:131: padDown = 0;
      00016F 75 31 00         [24]  632 	mov	_padDown,#0x00
      000172                        633 00109$:
                                    634 ;	dino.c:133: ThreadYield();
      000172 12 04 D6         [24]  635 	lcall	_ThreadYield
                                    636 ;	dino.c:135: }
      000175 80 C9            [24]  637 	sjmp	00111$
                                    638 ;------------------------------------------------------------
                                    639 ;Allocation info for local variables in function 'draw_thread'
                                    640 ;------------------------------------------------------------
                                    641 ;	dino.c:138: void draw_thread(void)
                                    642 ;	-----------------------------------------
                                    643 ;	 function draw_thread
                                    644 ;	-----------------------------------------
      000177                        645 _draw_thread:
                                    646 ;	dino.c:140: LCD_Init();
      000177 12 05 ED         [24]  647 	lcall	_LCD_Init
                                    648 ;	dino.c:141: LCD_set_symbol('\10', dino_bmp);    /* glyph code 1 */
      00017A 75 08 9B         [24]  649 	mov	_LCD_set_symbol_PARM_2,#_dino_bmp
      00017D 75 09 07         [24]  650 	mov	(_LCD_set_symbol_PARM_2 + 1),#(_dino_bmp >> 8)
      000180 75 82 08         [24]  651 	mov	dpl, #0x08
      000183 12 06 BF         [24]  652 	lcall	_LCD_set_symbol
                                    653 ;	dino.c:142: LCD_set_symbol('\20', cactus_bmp);  /* glyph code 2 */
      000186 75 08 A3         [24]  654 	mov	_LCD_set_symbol_PARM_2,#_cactus_bmp
      000189 75 09 07         [24]  655 	mov	(_LCD_set_symbol_PARM_2 + 1),#(_cactus_bmp >> 8)
      00018C 75 82 10         [24]  656 	mov	dpl, #0x10
      00018F 12 06 BF         [24]  657 	lcall	_LCD_set_symbol
      000192                        658 00130$:
                                    659 ;	dino.c:145: SemaphoreWait(wlock);
      000192                        660 2$:
      000192 E5 21            [12]  661 	MOV A, _wlock 
      000194 60 FC            [24]  662 	JZ 2$ 
      000196 20 E7 F9         [24]  663 	JB ACC.7, 2$ 
      000199 15 21            [12]  664 	DEC _wlock 
                                    665 ;	dino.c:146: dst = phase;
      00019B 85 22 71         [24]  666 	mov	_dst,_phase
                                    667 ;	dino.c:147: ddr = dinoRow;
      00019E 85 24 72         [24]  668 	mov	_ddr,_dinoRow
                                    669 ;	dino.c:148: dm0 = row0;
      0001A1 85 29 75         [24]  670 	mov	_dm0,_row0
      0001A4 85 2A 76         [24]  671 	mov	(_dm0 + 1),(_row0 + 1)
                                    672 ;	dino.c:149: dm1 = row1;
      0001A7 85 2B 77         [24]  673 	mov	_dm1,_row1
      0001AA 85 2C 78         [24]  674 	mov	(_dm1 + 1),(_row1 + 1)
                                    675 ;	dino.c:150: SemaphoreSignal(wlock);
      0001AD 05 21            [12]  676 	INC	_wlock 
                                    677 ;	dino.c:152: if (dst == ST_PLAY) {
      0001AF 74 01            [12]  678 	mov	a,#0x01
      0001B1 B5 71 02         [24]  679 	cjne	a,_dst,00212$
      0001B4 80 03            [24]  680 	sjmp	00213$
      0001B6                        681 00212$:
      0001B6 02 02 3F         [24]  682 	ljmp	00121$
      0001B9                        683 00213$:
                                    684 ;	dino.c:153: LCD_setDdRamAddress(0x00);
      0001B9 75 82 80         [24]  685 	mov	dpl, #0x80
      0001BC 12 06 00         [24]  686 	lcall	_LCD_IRWrite
                                    687 ;	dino.c:154: for (dcol = 0; dcol < 16; dcol++) {
      0001BF 75 73 00         [24]  688 	mov	_dcol,#0x00
      0001C2                        689 00125$:
      0001C2 74 F0            [12]  690 	mov	a,#0x100 - 0x10
      0001C4 25 73            [12]  691 	add	a,_dcol
      0001C6 40 32            [24]  692 	jc	00108$
                                    693 ;	dino.c:155: if (dcol == 0 && ddr == 0) dcell = DINO;
      0001C8 E5 73            [12]  694 	mov	a,_dcol
      0001CA 70 09            [24]  695 	jnz	00105$
      0001CC E5 72            [12]  696 	mov	a,_ddr
      0001CE 70 05            [24]  697 	jnz	00105$
      0001D0 75 74 01         [24]  698 	mov	_dcell,#0x01
      0001D3 80 0D            [24]  699 	sjmp	00106$
      0001D5                        700 00105$:
                                    701 ;	dino.c:156: else if (dm0 & 1)          dcell = CACTUS;
      0001D5 E5 75            [12]  702 	mov	a,_dm0
      0001D7 30 E0 05         [24]  703 	jnb	acc.0,00102$
      0001DA 75 74 02         [24]  704 	mov	_dcell,#0x02
      0001DD 80 03            [24]  705 	sjmp	00106$
      0001DF                        706 00102$:
                                    707 ;	dino.c:157: else                       dcell = ' ';
      0001DF 75 74 20         [24]  708 	mov	_dcell,#0x20
      0001E2                        709 00106$:
                                    710 ;	dino.c:158: LCD_write_char(dcell);
      0001E2 85 74 82         [24]  711 	mov	dpl, _dcell
      0001E5 12 06 6A         [24]  712 	lcall	_LCD_write_char
                                    713 ;	dino.c:159: dm0 >>= 1;
      0001E8 E5 76            [12]  714 	mov	a,(_dm0 + 1)
      0001EA C3               [12]  715 	clr	c
      0001EB 13               [12]  716 	rrc	a
      0001EC C5 75            [12]  717 	xch	a,_dm0
      0001EE 13               [12]  718 	rrc	a
      0001EF C5 75            [12]  719 	xch	a,_dm0
      0001F1 F5 76            [12]  720 	mov	(_dm0 + 1),a
                                    721 ;	dino.c:154: for (dcol = 0; dcol < 16; dcol++) {
      0001F3 E5 73            [12]  722 	mov	a,_dcol
      0001F5 04               [12]  723 	inc	a
      0001F6 F5 73            [12]  724 	mov	_dcol,a
      0001F8 80 C8            [24]  725 	sjmp	00125$
      0001FA                        726 00108$:
                                    727 ;	dino.c:161: LCD_setDdRamAddress(0x40);
      0001FA 75 82 C0         [24]  728 	mov	dpl, #0xc0
      0001FD 12 06 00         [24]  729 	lcall	_LCD_IRWrite
                                    730 ;	dino.c:162: for (dcol = 0; dcol < 16; dcol++) {
      000200 75 73 00         [24]  731 	mov	_dcol,#0x00
      000203                        732 00128$:
      000203 74 F0            [12]  733 	mov	a,#0x100 - 0x10
      000205 25 73            [12]  734 	add	a,_dcol
      000207 50 03            [24]  735 	jnc	00218$
      000209 02 02 A6         [24]  736 	ljmp	00122$
      00020C                        737 00218$:
                                    738 ;	dino.c:163: if (dcol == 0 && ddr == 1) dcell = DINO;
      00020C E5 73            [12]  739 	mov	a,_dcol
      00020E 70 0A            [24]  740 	jnz	00113$
      000210 74 01            [12]  741 	mov	a,#0x01
      000212 B5 72 05         [24]  742 	cjne	a,_ddr,00113$
      000215 75 74 01         [24]  743 	mov	_dcell,#0x01
      000218 80 0D            [24]  744 	sjmp	00114$
      00021A                        745 00113$:
                                    746 ;	dino.c:164: else if (dm1 & 1)          dcell = CACTUS;
      00021A E5 77            [12]  747 	mov	a,_dm1
      00021C 30 E0 05         [24]  748 	jnb	acc.0,00110$
      00021F 75 74 02         [24]  749 	mov	_dcell,#0x02
      000222 80 03            [24]  750 	sjmp	00114$
      000224                        751 00110$:
                                    752 ;	dino.c:165: else                       dcell = ' ';
      000224 75 74 20         [24]  753 	mov	_dcell,#0x20
      000227                        754 00114$:
                                    755 ;	dino.c:166: LCD_write_char(dcell);
      000227 85 74 82         [24]  756 	mov	dpl, _dcell
      00022A 12 06 6A         [24]  757 	lcall	_LCD_write_char
                                    758 ;	dino.c:167: dm1 >>= 1;
      00022D E5 78            [12]  759 	mov	a,(_dm1 + 1)
      00022F C3               [12]  760 	clr	c
      000230 13               [12]  761 	rrc	a
      000231 C5 77            [12]  762 	xch	a,_dm1
      000233 13               [12]  763 	rrc	a
      000234 C5 77            [12]  764 	xch	a,_dm1
      000236 F5 78            [12]  765 	mov	(_dm1 + 1),a
                                    766 ;	dino.c:162: for (dcol = 0; dcol < 16; dcol++) {
      000238 E5 73            [12]  767 	mov	a,_dcol
      00023A 04               [12]  768 	inc	a
      00023B F5 73            [12]  769 	mov	_dcol,a
      00023D 80 C4            [24]  770 	sjmp	00128$
      00023F                        771 00121$:
                                    772 ;	dino.c:169: } else if (dst == ST_SETUP) {
      00023F E5 71            [12]  773 	mov	a,_dst
      000241 70 33            [24]  774 	jnz	00118$
                                    775 ;	dino.c:170: LCD_setDdRamAddress(0x00);
      000243 75 82 80         [24]  776 	mov	dpl, #0x80
      000246 12 06 00         [24]  777 	lcall	_LCD_IRWrite
                                    778 ;	dino.c:171: LCD_write_string("Set 0-9 then #  ");
      000249 90 07 AB         [24]  779 	mov	dptr,#___str_0
      00024C 75 F0 80         [24]  780 	mov	b, #0x80
      00024F 12 06 94         [24]  781 	lcall	_LCD_write_string
                                    782 ;	dino.c:172: LCD_setDdRamAddress(0x40);
      000252 75 82 C0         [24]  783 	mov	dpl, #0xc0
      000255 12 06 00         [24]  784 	lcall	_LCD_IRWrite
                                    785 ;	dino.c:173: LCD_write_string("Level: ");
      000258 90 07 BC         [24]  786 	mov	dptr,#___str_1
      00025B 75 F0 80         [24]  787 	mov	b, #0x80
      00025E 12 06 94         [24]  788 	lcall	_LCD_write_string
                                    789 ;	dino.c:174: LCD_write_char('0' + level);
      000261 AF 23            [24]  790 	mov	r7,_level
      000263 74 30            [12]  791 	mov	a,#0x30
      000265 2F               [12]  792 	add	a, r7
      000266 F5 82            [12]  793 	mov	dpl,a
      000268 12 06 6A         [24]  794 	lcall	_LCD_write_char
                                    795 ;	dino.c:175: LCD_write_string("        ");
      00026B 90 07 C4         [24]  796 	mov	dptr,#___str_2
      00026E 75 F0 80         [24]  797 	mov	b, #0x80
      000271 12 06 94         [24]  798 	lcall	_LCD_write_string
      000274 80 30            [24]  799 	sjmp	00122$
      000276                        800 00118$:
                                    801 ;	dino.c:177: LCD_setDdRamAddress(0x00);
      000276 75 82 80         [24]  802 	mov	dpl, #0x80
      000279 12 06 00         [24]  803 	lcall	_LCD_IRWrite
                                    804 ;	dino.c:178: LCD_write_string("Game Over       ");
      00027C 90 07 CD         [24]  805 	mov	dptr,#___str_3
      00027F 75 F0 80         [24]  806 	mov	b, #0x80
      000282 12 06 94         [24]  807 	lcall	_LCD_write_string
                                    808 ;	dino.c:179: LCD_setDdRamAddress(0x40);
      000285 75 82 C0         [24]  809 	mov	dpl, #0xc0
      000288 12 06 00         [24]  810 	lcall	_LCD_IRWrite
                                    811 ;	dino.c:180: LCD_write_string("Score: ");
      00028B 90 07 DE         [24]  812 	mov	dptr,#___str_4
      00028E 75 F0 80         [24]  813 	mov	b, #0x80
      000291 12 06 94         [24]  814 	lcall	_LCD_write_string
                                    815 ;	dino.c:181: LCD_write_string(sbuf);
      000294 90 00 2D         [24]  816 	mov	dptr,#_sbuf
      000297 75 F0 40         [24]  817 	mov	b, #0x40
      00029A 12 06 94         [24]  818 	lcall	_LCD_write_string
                                    819 ;	dino.c:182: LCD_write_string("       ");
      00029D 90 07 E6         [24]  820 	mov	dptr,#___str_5
      0002A0 75 F0 80         [24]  821 	mov	b, #0x80
      0002A3 12 06 94         [24]  822 	lcall	_LCD_write_string
      0002A6                        823 00122$:
                                    824 ;	dino.c:184: ThreadYield();
      0002A6 12 04 D6         [24]  825 	lcall	_ThreadYield
                                    826 ;	dino.c:186: }
      0002A9 02 01 92         [24]  827 	ljmp	00130$
                                    828 ;------------------------------------------------------------
                                    829 ;Allocation info for local variables in function 'main'
                                    830 ;------------------------------------------------------------
                                    831 ;	dino.c:189: void main(void)
                                    832 ;	-----------------------------------------
                                    833 ;	 function main
                                    834 ;	-----------------------------------------
      0002AC                        835 _main:
                                    836 ;	dino.c:191: SemaphoreCreate(wlock, 1);
      0002AC 75 21 01         [24]  837 	mov	_wlock,#0x01
                                    838 ;	dino.c:192: keyNew = 0;
      0002AF 75 26 00         [24]  839 	mov	_keyNew,#0x00
                                    840 ;	dino.c:193: phase  = ST_SETUP;
      0002B2 75 22 00         [24]  841 	mov	_phase,#0x00
                                    842 ;	dino.c:194: level  = 0;
      0002B5 75 23 00         [24]  843 	mov	_level,#0x00
                                    844 ;	dino.c:196: ThreadCreate(pad_thread);    /* Thread 1 */
      0002B8 90 01 3A         [24]  845 	mov	dptr,#_pad_thread
      0002BB 12 04 5C         [24]  846 	lcall	_ThreadCreate
                                    847 ;	dino.c:197: ThreadCreate(draw_thread);   /* Thread 2 */
      0002BE 90 01 77         [24]  848 	mov	dptr,#_draw_thread
      0002C1 12 04 5C         [24]  849 	lcall	_ThreadCreate
      0002C4                        850 00134$:
                                    851 ;	dino.c:201: take_key();
      0002C4 12 00 81         [24]  852 	lcall	_take_key
                                    853 ;	dino.c:202: lk = takeCh;
      0002C7 85 33 34         [24]  854 	mov	_lk,_takeCh
                                    855 ;	dino.c:203: if (lk >= '0' && lk <= '9') level = (unsigned char)(lk - '0');
      0002CA 74 D0            [12]  856 	mov	a,#0x100 - 0x30
      0002CC 25 34            [12]  857 	add	a,_lk
      0002CE 50 0E            [24]  858 	jnc	00104$
      0002D0 E5 34            [12]  859 	mov	a,_lk
      0002D2 24 C6            [12]  860 	add	a,#0xff - 0x39
      0002D4 40 08            [24]  861 	jc	00104$
      0002D6 E5 34            [12]  862 	mov	a,_lk
      0002D8 24 D0            [12]  863 	add	a,#0xd0
      0002DA F5 23            [12]  864 	mov	_level, a
      0002DC 80 07            [24]  865 	sjmp	00105$
      0002DE                        866 00104$:
                                    867 ;	dino.c:204: else if (lk == '#') break;
      0002DE 74 23            [12]  868 	mov	a,#0x23
      0002E0 B5 34 02         [24]  869 	cjne	a,_lk,00256$
      0002E3 80 05            [24]  870 	sjmp	00107$
      0002E5                        871 00256$:
      0002E5                        872 00105$:
                                    873 ;	dino.c:205: ThreadYield();
      0002E5 12 04 D6         [24]  874 	lcall	_ThreadYield
      0002E8 80 DA            [24]  875 	sjmp	00134$
      0002EA                        876 00107$:
                                    877 ;	dino.c:209: SemaphoreWait(wlock);
      0002EA                        878 3$:
      0002EA E5 21            [12]  879 	MOV A, _wlock 
      0002EC 60 FC            [24]  880 	JZ 3$ 
      0002EE 20 E7 F9         [24]  881 	JB ACC.7, 3$ 
      0002F1 15 21            [12]  882 	DEC _wlock 
                                    883 ;	dino.c:210: row0 = 0; row1 = 0; dinoRow = 0; score = 0; phase = ST_PLAY;
      0002F3 E4               [12]  884 	clr	a
      0002F4 F5 29            [12]  885 	mov	_row0,a
      0002F6 F5 2A            [12]  886 	mov	(_row0 + 1),a
      0002F8 F5 2B            [12]  887 	mov	_row1,a
      0002FA F5 2C            [12]  888 	mov	(_row1 + 1),a
      0002FC F5 24            [12]  889 	mov	_dinoRow,a
      0002FE F5 27            [12]  890 	mov	_score,a
      000300 F5 28            [12]  891 	mov	(_score + 1),a
      000302 75 22 01         [24]  892 	mov	_phase,#0x01
                                    893 ;	dino.c:211: SemaphoreSignal(wlock);
      000305 05 21            [12]  894 	INC	_wlock 
                                    895 ;	dino.c:212: lpicks = 0;
      000307 75 35 00         [24]  896 	mov	_lpicks,#0x00
                                    897 ;	dino.c:213: lrng   = 0xA5;
      00030A 75 37 A5         [24]  898 	mov	_lrng,#0xa5
      00030D                        899 00136$:
                                    900 ;	dino.c:217: take_key();
      00030D 12 00 81         [24]  901 	lcall	_take_key
                                    902 ;	dino.c:218: lk = takeCh;
      000310 85 33 34         [24]  903 	mov	_lk,_takeCh
                                    904 ;	dino.c:219: if      (lk == '2') dinoRow = 0;
      000313 74 32            [12]  905 	mov	a,#0x32
      000315 B5 34 05         [24]  906 	cjne	a,_lk,00111$
      000318 75 24 00         [24]  907 	mov	_dinoRow,#0x00
      00031B 80 08            [24]  908 	sjmp	00112$
      00031D                        909 00111$:
                                    910 ;	dino.c:220: else if (lk == '8') dinoRow = 1;
      00031D 74 38            [12]  911 	mov	a,#0x38
      00031F B5 34 03         [24]  912 	cjne	a,_lk,00112$
      000322 75 24 01         [24]  913 	mov	_dinoRow,#0x01
      000325                        914 00112$:
                                    915 ;	dino.c:223: SemaphoreWait(wlock);
      000325                        916 4$:
      000325 E5 21            [12]  917 	MOV A, _wlock 
      000327 60 FC            [24]  918 	JZ 4$ 
      000329 20 E7 F9         [24]  919 	JB ACC.7, 4$ 
      00032C 15 21            [12]  920 	DEC _wlock 
                                    921 ;	dino.c:224: lhot = dinoRow ? (row1 & 1) : (row0 & 1);
      00032E E5 24            [12]  922 	mov	a,_dinoRow
      000330 60 07            [24]  923 	jz	00142$
      000332 AF 2B            [24]  924 	mov	r7,_row1
      000334 53 07 01         [24]  925 	anl	ar7,#0x01
      000337 80 06            [24]  926 	sjmp	00143$
      000339                        927 00142$:
      000339 AE 29            [24]  928 	mov	r6,_row0
      00033B 74 01            [12]  929 	mov	a,#0x01
      00033D 5E               [12]  930 	anl	a,r6
      00033E FF               [12]  931 	mov	r7,a
      00033F                        932 00143$:
      00033F 8F 70            [24]  933 	mov	_lhot,r7
                                    934 ;	dino.c:225: SemaphoreSignal(wlock);
      000341 05 21            [12]  935 	INC	_wlock 
                                    936 ;	dino.c:226: if (lhot) break;
      000343 E5 70            [12]  937 	mov	a,_lhot
      000345 60 03            [24]  938 	jz	00262$
      000347 02 04 09         [24]  939 	ljmp	00132$
      00034A                        940 00262$:
                                    941 ;	dino.c:229: lwait = (unsigned char)(10 - level);
      00034A AF 23            [24]  942 	mov	r7,_level
      00034C 74 0A            [12]  943 	mov	a,#0x0a
      00034E C3               [12]  944 	clr	c
      00034F 9F               [12]  945 	subb	a,r7
      000350 F5 36            [12]  946 	mov	_lwait, a
                                    947 ;	dino.c:230: lwait = lwait + lwait + lwait + SPEED_MIN;   /* (10-level)*3 + min */
      000352 E5 36            [12]  948 	mov	a,_lwait
      000354 25 36            [12]  949 	add	a, _lwait
      000356 25 36            [12]  950 	add	a, _lwait
      000358 FF               [12]  951 	mov	r7,a
      000359 24 03            [12]  952 	add	a,#0x03
      00035B F5 36            [12]  953 	mov	_lwait,a
                                    954 ;	dino.c:231: while (lwait) { ThreadYield(); lwait--; }
      00035D                        955 00115$:
      00035D E5 36            [12]  956 	mov	a,_lwait
      00035F 60 0A            [24]  957 	jz	00117$
      000361 12 04 D6         [24]  958 	lcall	_ThreadYield
      000364 E5 36            [12]  959 	mov	a,_lwait
      000366 14               [12]  960 	dec	a
      000367 F5 36            [12]  961 	mov	_lwait,a
      000369 80 F2            [24]  962 	sjmp	00115$
      00036B                        963 00117$:
                                    964 ;	dino.c:234: SemaphoreWait(wlock);
      00036B                        965 5$:
      00036B E5 21            [12]  966 	MOV A, _wlock 
      00036D 60 FC            [24]  967 	JZ 5$ 
      00036F 20 E7 F9         [24]  968 	JB ACC.7, 5$ 
      000372 15 21            [12]  969 	DEC _wlock 
                                    970 ;	dino.c:235: if (dinoRow == 0) { if (row1 & 1) score++; }
      000374 E5 24            [12]  971 	mov	a,_dinoRow
      000376 70 14            [24]  972 	jnz	00123$
      000378 E5 2B            [12]  973 	mov	a,_row1
      00037A 30 E0 21         [24]  974 	jnb	acc.0,00124$
      00037D AE 27            [24]  975 	mov	r6,_score
      00037F AF 28            [24]  976 	mov	r7,(_score + 1)
      000381 74 01            [12]  977 	mov	a,#0x01
      000383 2E               [12]  978 	add	a, r6
      000384 F5 27            [12]  979 	mov	_score,a
      000386 E4               [12]  980 	clr	a
      000387 3F               [12]  981 	addc	a, r7
      000388 F5 28            [12]  982 	mov	(_score + 1),a
      00038A 80 12            [24]  983 	sjmp	00124$
      00038C                        984 00123$:
                                    985 ;	dino.c:236: else              { if (row0 & 1) score++; }
      00038C E5 29            [12]  986 	mov	a,_row0
      00038E 30 E0 0D         [24]  987 	jnb	acc.0,00124$
      000391 AE 27            [24]  988 	mov	r6,_score
      000393 AF 28            [24]  989 	mov	r7,(_score + 1)
      000395 74 01            [12]  990 	mov	a,#0x01
      000397 2E               [12]  991 	add	a, r6
      000398 F5 27            [12]  992 	mov	_score,a
      00039A E4               [12]  993 	clr	a
      00039B 3F               [12]  994 	addc	a, r7
      00039C F5 28            [12]  995 	mov	(_score + 1),a
      00039E                        996 00124$:
                                    997 ;	dino.c:237: row0 >>= 1;
      00039E E5 2A            [12]  998 	mov	a,(_row0 + 1)
      0003A0 C3               [12]  999 	clr	c
      0003A1 13               [12] 1000 	rrc	a
      0003A2 C5 29            [12] 1001 	xch	a,_row0
      0003A4 13               [12] 1002 	rrc	a
      0003A5 C5 29            [12] 1003 	xch	a,_row0
      0003A7 F5 2A            [12] 1004 	mov	(_row0 + 1),a
                                   1005 ;	dino.c:238: row1 >>= 1;
      0003A9 E5 2C            [12] 1006 	mov	a,(_row1 + 1)
      0003AB C3               [12] 1007 	clr	c
      0003AC 13               [12] 1008 	rrc	a
      0003AD C5 2B            [12] 1009 	xch	a,_row1
      0003AF 13               [12] 1010 	rrc	a
      0003B0 C5 2B            [12] 1011 	xch	a,_row1
      0003B2 F5 2C            [12] 1012 	mov	(_row1 + 1),a
                                   1013 ;	dino.c:239: SemaphoreSignal(wlock);
      0003B4 05 21            [12] 1014 	INC	_wlock 
                                   1015 ;	dino.c:242: lpicks++;
      0003B6 E5 35            [12] 1016 	mov	a,_lpicks
      0003B8 04               [12] 1017 	inc	a
      0003B9 F5 35            [12] 1018 	mov	_lpicks,a
                                   1019 ;	dino.c:243: if (lpicks >= SPAWN_EVERY) {
      0003BB 74 FE            [12] 1020 	mov	a,#0x100 - 0x02
      0003BD 25 35            [12] 1021 	add	a,_lpicks
      0003BF 50 42            [24] 1022 	jnc	00131$
                                   1023 ;	dino.c:244: lpicks = 0;
      0003C1 75 35 00         [24] 1024 	mov	_lpicks,#0x00
                                   1025 ;	dino.c:245: lrng = (lrng & 1) ? ((lrng >> 1) ^ 0xB8) : (lrng >> 1);
      0003C4 E5 37            [12] 1026 	mov	a,_lrng
      0003C6 30 E0 0A         [24] 1027 	jnb	acc.0,00144$
      0003C9 E5 37            [12] 1028 	mov	a,_lrng
      0003CB C3               [12] 1029 	clr	c
      0003CC 13               [12] 1030 	rrc	a
      0003CD FF               [12] 1031 	mov	r7,a
      0003CE 63 07 B8         [24] 1032 	xrl	ar7,#0xb8
      0003D1 80 05            [24] 1033 	sjmp	00145$
      0003D3                       1034 00144$:
      0003D3 E5 37            [12] 1035 	mov	a,_lrng
      0003D5 C3               [12] 1036 	clr	c
      0003D6 13               [12] 1037 	rrc	a
      0003D7 FF               [12] 1038 	mov	r7,a
      0003D8                       1039 00145$:
      0003D8 8F 37            [24] 1040 	mov	_lrng,r7
                                   1041 ;	dino.c:246: SemaphoreWait(wlock);
      0003DA                       1042 6$:
      0003DA E5 21            [12] 1043 	MOV A, _wlock 
      0003DC 60 FC            [24] 1044 	JZ 6$ 
      0003DE 20 E7 F9         [24] 1045 	JB ACC.7, 6$ 
      0003E1 15 21            [12] 1046 	DEC _wlock 
                                   1047 ;	dino.c:247: if (((row0 | row1) & 0x4000) == 0) {
      0003E3 E5 2B            [12] 1048 	mov	a,_row1
      0003E5 45 29            [12] 1049 	orl	a,_row0
      0003E7 FE               [12] 1050 	mov	r6,a
      0003E8 E5 2C            [12] 1051 	mov	a,(_row1 + 1)
      0003EA 45 2A            [12] 1052 	orl	a,(_row0 + 1)
      0003EC FF               [12] 1053 	mov	r7,a
      0003ED 20 E6 11         [24] 1054 	jb	acc.6,00129$
                                   1055 ;	dino.c:248: if (lrng & 1) row1 |= 0x8000;
      0003F0 E5 37            [12] 1056 	mov	a,_lrng
      0003F2 30 E0 07         [24] 1057 	jnb	acc.0,00126$
      0003F5 E5 2B            [12] 1058 	mov	a,_row1
      0003F7 43 2C 80         [24] 1059 	orl	(_row1 + 1),#0x80
      0003FA 80 05            [24] 1060 	sjmp	00129$
      0003FC                       1061 00126$:
                                   1062 ;	dino.c:249: else          row0 |= 0x8000;
      0003FC E5 29            [12] 1063 	mov	a,_row0
      0003FE 43 2A 80         [24] 1064 	orl	(_row0 + 1),#0x80
      000401                       1065 00129$:
                                   1066 ;	dino.c:251: SemaphoreSignal(wlock);
      000401 05 21            [12] 1067 	INC	_wlock 
      000403                       1068 00131$:
                                   1069 ;	dino.c:253: ThreadYield();
      000403 12 04 D6         [24] 1070 	lcall	_ThreadYield
      000406 02 03 0D         [24] 1071 	ljmp	00136$
      000409                       1072 00132$:
                                   1073 ;	dino.c:257: score_to_text();
      000409 12 00 9A         [24] 1074 	lcall	_score_to_text
                                   1075 ;	dino.c:258: SemaphoreWait(wlock);
      00040C                       1076 7$:
      00040C E5 21            [12] 1077 	MOV A, _wlock 
      00040E 60 FC            [24] 1078 	JZ 7$ 
      000410 20 E7 F9         [24] 1079 	JB ACC.7, 7$ 
      000413 15 21            [12] 1080 	DEC _wlock 
                                   1081 ;	dino.c:259: phase = ST_DEAD;
      000415 75 22 02         [24] 1082 	mov	_phase,#0x02
                                   1083 ;	dino.c:260: SemaphoreSignal(wlock);
      000418 05 21            [12] 1084 	INC	_wlock 
      00041A                       1085 00138$:
                                   1086 ;	dino.c:261: for (;;) { ThreadYield(); }
      00041A 12 04 D6         [24] 1087 	lcall	_ThreadYield
                                   1088 ;	dino.c:262: }
      00041D 80 FB            [24] 1089 	sjmp	00138$
                                   1090 ;------------------------------------------------------------
                                   1091 ;Allocation info for local variables in function '_sdcc_gsinit_startup'
                                   1092 ;------------------------------------------------------------
                                   1093 ;	dino.c:264: void _sdcc_gsinit_startup(void)
                                   1094 ;	-----------------------------------------
                                   1095 ;	 function _sdcc_gsinit_startup
                                   1096 ;	-----------------------------------------
      00041F                       1097 __sdcc_gsinit_startup:
                                   1098 ;	dino.c:268: __endasm;
      00041F 02 04 2C         [24] 1099 	LJMP	_Bootstrap
                                   1100 ;	dino.c:269: }
      000422 22               [24] 1101 	ret
                                   1102 ;------------------------------------------------------------
                                   1103 ;Allocation info for local variables in function '_mcs51_genRAMCLEAR'
                                   1104 ;------------------------------------------------------------
                                   1105 ;	dino.c:271: void _mcs51_genRAMCLEAR(void)  {}
                                   1106 ;	-----------------------------------------
                                   1107 ;	 function _mcs51_genRAMCLEAR
                                   1108 ;	-----------------------------------------
      000423                       1109 __mcs51_genRAMCLEAR:
      000423 22               [24] 1110 	ret
                                   1111 ;------------------------------------------------------------
                                   1112 ;Allocation info for local variables in function '_mcs51_genXINIT'
                                   1113 ;------------------------------------------------------------
                                   1114 ;	dino.c:272: void _mcs51_genXINIT(void)     {}
                                   1115 ;	-----------------------------------------
                                   1116 ;	 function _mcs51_genXINIT
                                   1117 ;	-----------------------------------------
      000424                       1118 __mcs51_genXINIT:
      000424 22               [24] 1119 	ret
                                   1120 ;------------------------------------------------------------
                                   1121 ;Allocation info for local variables in function '_mcs51_genXRAMCLEAR'
                                   1122 ;------------------------------------------------------------
                                   1123 ;	dino.c:273: void _mcs51_genXRAMCLEAR(void) {}
                                   1124 ;	-----------------------------------------
                                   1125 ;	 function _mcs51_genXRAMCLEAR
                                   1126 ;	-----------------------------------------
      000425                       1127 __mcs51_genXRAMCLEAR:
      000425 22               [24] 1128 	ret
                                   1129 ;------------------------------------------------------------
                                   1130 ;Allocation info for local variables in function 'timer0_ISR'
                                   1131 ;------------------------------------------------------------
                                   1132 ;	dino.c:275: void timer0_ISR(void) __interrupt(1)
                                   1133 ;	-----------------------------------------
                                   1134 ;	 function timer0_ISR
                                   1135 ;	-----------------------------------------
      000426                       1136 _timer0_ISR:
                                   1137 ;	dino.c:279: __endasm;
      000426 02 05 8C         [24] 1138 	ljmp	_myTimer0Handler
                                   1139 ;	dino.c:280: }
      000429 02 00 54         [24] 1140 	ljmp	sdcc_atomic_maybe_rollback
                                   1141 ;	eliminated unneeded mov psw,# (no regs used in bank)
                                   1142 ;	eliminated unneeded push/pop not_psw
                                   1143 ;	eliminated unneeded push/pop dpl
                                   1144 ;	eliminated unneeded push/pop dph
                                   1145 ;	eliminated unneeded push/pop b
                                   1146 ;	eliminated unneeded push/pop acc
                                   1147 	.area CSEG    (CODE)
                                   1148 	.area CONST   (CODE)
                                   1149 	.area CONST   (CODE)
      00079B                       1150 _dino_bmp:
      00079B 07                    1151 	.db #0x07	; 7
      00079C 05                    1152 	.db #0x05	; 5
      00079D 06                    1153 	.db #0x06	; 6
      00079E 07                    1154 	.db #0x07	; 7
      00079F 14                    1155 	.db #0x14	; 20
      0007A0 17                    1156 	.db #0x17	; 23
      0007A1 0E                    1157 	.db #0x0e	; 14
      0007A2 0A                    1158 	.db #0x0a	; 10
                                   1159 	.area CSEG    (CODE)
                                   1160 	.area CONST   (CODE)
      0007A3                       1161 _cactus_bmp:
      0007A3 04                    1162 	.db #0x04	; 4
      0007A4 05                    1163 	.db #0x05	; 5
      0007A5 15                    1164 	.db #0x15	; 21
      0007A6 15                    1165 	.db #0x15	; 21
      0007A7 16                    1166 	.db #0x16	; 22
      0007A8 0C                    1167 	.db #0x0c	; 12
      0007A9 04                    1168 	.db #0x04	; 4
      0007AA 04                    1169 	.db #0x04	; 4
                                   1170 	.area CSEG    (CODE)
                                   1171 	.area CONST   (CODE)
      0007AB                       1172 ___str_0:
      0007AB 53 65 74 20 30 2D 39  1173 	.ascii "Set 0-9 then #  "
             20 74 68 65 6E 20 23
             20 20
      0007BB 00                    1174 	.db 0x00
                                   1175 	.area CSEG    (CODE)
                                   1176 	.area CONST   (CODE)
      0007BC                       1177 ___str_1:
      0007BC 4C 65 76 65 6C 3A 20  1178 	.ascii "Level: "
      0007C3 00                    1179 	.db 0x00
                                   1180 	.area CSEG    (CODE)
                                   1181 	.area CONST   (CODE)
      0007C4                       1182 ___str_2:
      0007C4 20 20 20 20 20 20 20  1183 	.ascii "        "
             20
      0007CC 00                    1184 	.db 0x00
                                   1185 	.area CSEG    (CODE)
                                   1186 	.area CONST   (CODE)
      0007CD                       1187 ___str_3:
      0007CD 47 61 6D 65 20 4F 76  1188 	.ascii "Game Over       "
             65 72 20 20 20 20 20
             20 20
      0007DD 00                    1189 	.db 0x00
                                   1190 	.area CSEG    (CODE)
                                   1191 	.area CONST   (CODE)
      0007DE                       1192 ___str_4:
      0007DE 53 63 6F 72 65 3A 20  1193 	.ascii "Score: "
      0007E5 00                    1194 	.db 0x00
                                   1195 	.area CSEG    (CODE)
                                   1196 	.area CONST   (CODE)
      0007E6                       1197 ___str_5:
      0007E6 20 20 20 20 20 20 20  1198 	.ascii "       "
      0007ED 00                    1199 	.db 0x00
                                   1200 	.area CSEG    (CODE)
                                   1201 	.area XINIT   (CODE)
                                   1202 	.area CABS    (ABS,CODE)
