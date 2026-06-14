                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler
                                      3 ; Version 4.5.10 #15658 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module test3threads
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
                                     17 	.globl _Consumer
                                     18 	.globl _Producer2
                                     19 	.globl _Producer1
                                     20 	.globl _ThreadCreate
                                     21 	.globl _CY
                                     22 	.globl _AC
                                     23 	.globl _F0
                                     24 	.globl _RS1
                                     25 	.globl _RS0
                                     26 	.globl _OV
                                     27 	.globl _F1
                                     28 	.globl _P
                                     29 	.globl _PS
                                     30 	.globl _PT1
                                     31 	.globl _PX1
                                     32 	.globl _PT0
                                     33 	.globl _PX0
                                     34 	.globl _RD
                                     35 	.globl _WR
                                     36 	.globl _T1
                                     37 	.globl _T0
                                     38 	.globl _INT1
                                     39 	.globl _INT0
                                     40 	.globl _TXD
                                     41 	.globl _RXD
                                     42 	.globl _P3_7
                                     43 	.globl _P3_6
                                     44 	.globl _P3_5
                                     45 	.globl _P3_4
                                     46 	.globl _P3_3
                                     47 	.globl _P3_2
                                     48 	.globl _P3_1
                                     49 	.globl _P3_0
                                     50 	.globl _EA
                                     51 	.globl _ES
                                     52 	.globl _ET1
                                     53 	.globl _EX1
                                     54 	.globl _ET0
                                     55 	.globl _EX0
                                     56 	.globl _P2_7
                                     57 	.globl _P2_6
                                     58 	.globl _P2_5
                                     59 	.globl _P2_4
                                     60 	.globl _P2_3
                                     61 	.globl _P2_2
                                     62 	.globl _P2_1
                                     63 	.globl _P2_0
                                     64 	.globl _SM0
                                     65 	.globl _SM1
                                     66 	.globl _SM2
                                     67 	.globl _REN
                                     68 	.globl _TB8
                                     69 	.globl _RB8
                                     70 	.globl _TI
                                     71 	.globl _RI
                                     72 	.globl _P1_7
                                     73 	.globl _P1_6
                                     74 	.globl _P1_5
                                     75 	.globl _P1_4
                                     76 	.globl _P1_3
                                     77 	.globl _P1_2
                                     78 	.globl _P1_1
                                     79 	.globl _P1_0
                                     80 	.globl _TF1
                                     81 	.globl _TR1
                                     82 	.globl _TF0
                                     83 	.globl _TR0
                                     84 	.globl _IE1
                                     85 	.globl _IT1
                                     86 	.globl _IE0
                                     87 	.globl _IT0
                                     88 	.globl _P0_7
                                     89 	.globl _P0_6
                                     90 	.globl _P0_5
                                     91 	.globl _P0_4
                                     92 	.globl _P0_3
                                     93 	.globl _P0_2
                                     94 	.globl _P0_1
                                     95 	.globl _P0_0
                                     96 	.globl _B
                                     97 	.globl _ACC
                                     98 	.globl _PSW
                                     99 	.globl _IP
                                    100 	.globl _P3
                                    101 	.globl _IE
                                    102 	.globl _P2
                                    103 	.globl _SBUF
                                    104 	.globl _SCON
                                    105 	.globl _P1
                                    106 	.globl _TH1
                                    107 	.globl _TH0
                                    108 	.globl _TL1
                                    109 	.globl _TL0
                                    110 	.globl _TMOD
                                    111 	.globl _TCON
                                    112 	.globl _PCON
                                    113 	.globl _DPH
                                    114 	.globl _DPL
                                    115 	.globl _SP
                                    116 	.globl _P0
                                    117 	.globl _prod_turn
                                    118 	.globl _curr_char2
                                    119 	.globl _cons_char
                                    120 	.globl _curr_char1
                                    121 	.globl _buffer
                                    122 	.globl _tail
                                    123 	.globl _head
                                    124 	.globl _empty
                                    125 	.globl _full
                                    126 	.globl _mutex
                                    127 ;--------------------------------------------------------
                                    128 ; special function registers
                                    129 ;--------------------------------------------------------
                                    130 	.area RSEG    (ABS,DATA)
      000000                        131 	.org 0x0000
                           000080   132 _P0	=	0x0080
                           000081   133 _SP	=	0x0081
                           000082   134 _DPL	=	0x0082
                           000083   135 _DPH	=	0x0083
                           000087   136 _PCON	=	0x0087
                           000088   137 _TCON	=	0x0088
                           000089   138 _TMOD	=	0x0089
                           00008A   139 _TL0	=	0x008a
                           00008B   140 _TL1	=	0x008b
                           00008C   141 _TH0	=	0x008c
                           00008D   142 _TH1	=	0x008d
                           000090   143 _P1	=	0x0090
                           000098   144 _SCON	=	0x0098
                           000099   145 _SBUF	=	0x0099
                           0000A0   146 _P2	=	0x00a0
                           0000A8   147 _IE	=	0x00a8
                           0000B0   148 _P3	=	0x00b0
                           0000B8   149 _IP	=	0x00b8
                           0000D0   150 _PSW	=	0x00d0
                           0000E0   151 _ACC	=	0x00e0
                           0000F0   152 _B	=	0x00f0
                                    153 ;--------------------------------------------------------
                                    154 ; special function bits
                                    155 ;--------------------------------------------------------
                                    156 	.area RSEG    (ABS,DATA)
      000000                        157 	.org 0x0000
                           000080   158 _P0_0	=	0x0080
                           000081   159 _P0_1	=	0x0081
                           000082   160 _P0_2	=	0x0082
                           000083   161 _P0_3	=	0x0083
                           000084   162 _P0_4	=	0x0084
                           000085   163 _P0_5	=	0x0085
                           000086   164 _P0_6	=	0x0086
                           000087   165 _P0_7	=	0x0087
                           000088   166 _IT0	=	0x0088
                           000089   167 _IE0	=	0x0089
                           00008A   168 _IT1	=	0x008a
                           00008B   169 _IE1	=	0x008b
                           00008C   170 _TR0	=	0x008c
                           00008D   171 _TF0	=	0x008d
                           00008E   172 _TR1	=	0x008e
                           00008F   173 _TF1	=	0x008f
                           000090   174 _P1_0	=	0x0090
                           000091   175 _P1_1	=	0x0091
                           000092   176 _P1_2	=	0x0092
                           000093   177 _P1_3	=	0x0093
                           000094   178 _P1_4	=	0x0094
                           000095   179 _P1_5	=	0x0095
                           000096   180 _P1_6	=	0x0096
                           000097   181 _P1_7	=	0x0097
                           000098   182 _RI	=	0x0098
                           000099   183 _TI	=	0x0099
                           00009A   184 _RB8	=	0x009a
                           00009B   185 _TB8	=	0x009b
                           00009C   186 _REN	=	0x009c
                           00009D   187 _SM2	=	0x009d
                           00009E   188 _SM1	=	0x009e
                           00009F   189 _SM0	=	0x009f
                           0000A0   190 _P2_0	=	0x00a0
                           0000A1   191 _P2_1	=	0x00a1
                           0000A2   192 _P2_2	=	0x00a2
                           0000A3   193 _P2_3	=	0x00a3
                           0000A4   194 _P2_4	=	0x00a4
                           0000A5   195 _P2_5	=	0x00a5
                           0000A6   196 _P2_6	=	0x00a6
                           0000A7   197 _P2_7	=	0x00a7
                           0000A8   198 _EX0	=	0x00a8
                           0000A9   199 _ET0	=	0x00a9
                           0000AA   200 _EX1	=	0x00aa
                           0000AB   201 _ET1	=	0x00ab
                           0000AC   202 _ES	=	0x00ac
                           0000AF   203 _EA	=	0x00af
                           0000B0   204 _P3_0	=	0x00b0
                           0000B1   205 _P3_1	=	0x00b1
                           0000B2   206 _P3_2	=	0x00b2
                           0000B3   207 _P3_3	=	0x00b3
                           0000B4   208 _P3_4	=	0x00b4
                           0000B5   209 _P3_5	=	0x00b5
                           0000B6   210 _P3_6	=	0x00b6
                           0000B7   211 _P3_7	=	0x00b7
                           0000B0   212 _RXD	=	0x00b0
                           0000B1   213 _TXD	=	0x00b1
                           0000B2   214 _INT0	=	0x00b2
                           0000B3   215 _INT1	=	0x00b3
                           0000B4   216 _T0	=	0x00b4
                           0000B5   217 _T1	=	0x00b5
                           0000B6   218 _WR	=	0x00b6
                           0000B7   219 _RD	=	0x00b7
                           0000B8   220 _PX0	=	0x00b8
                           0000B9   221 _PT0	=	0x00b9
                           0000BA   222 _PX1	=	0x00ba
                           0000BB   223 _PT1	=	0x00bb
                           0000BC   224 _PS	=	0x00bc
                           0000D0   225 _P	=	0x00d0
                           0000D1   226 _F1	=	0x00d1
                           0000D2   227 _OV	=	0x00d2
                           0000D3   228 _RS0	=	0x00d3
                           0000D4   229 _RS1	=	0x00d4
                           0000D5   230 _F0	=	0x00d5
                           0000D6   231 _AC	=	0x00d6
                           0000D7   232 _CY	=	0x00d7
                                    233 ;--------------------------------------------------------
                                    234 ; overlayable register banks
                                    235 ;--------------------------------------------------------
                                    236 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        237 	.ds 8
                                    238 ;--------------------------------------------------------
                                    239 ; internal ram data
                                    240 ;--------------------------------------------------------
                                    241 	.area DSEG    (DATA)
                           000020   242 _mutex	=	0x0020
                           000021   243 _full	=	0x0021
                           000022   244 _empty	=	0x0022
                           000023   245 _head	=	0x0023
                           000024   246 _tail	=	0x0024
                           000025   247 _buffer	=	0x0025
                           000028   248 _curr_char1	=	0x0028
                           000029   249 _cons_char	=	0x0029
                           00002A   250 _curr_char2	=	0x002a
                           00002B   251 _prod_turn	=	0x002b
                                    252 ;--------------------------------------------------------
                                    253 ; overlayable items in internal ram
                                    254 ;--------------------------------------------------------
                                    255 ;--------------------------------------------------------
                                    256 ; Stack segment in internal ram
                                    257 ;--------------------------------------------------------
                                    258 	.area SSEG
      000008                        259 __start__stack:
      000008                        260 	.ds	1
                                    261 
                                    262 ;--------------------------------------------------------
                                    263 ; indirectly addressable internal ram data
                                    264 ;--------------------------------------------------------
                                    265 	.area ISEG    (DATA)
                                    266 ;--------------------------------------------------------
                                    267 ; absolute internal ram data
                                    268 ;--------------------------------------------------------
                                    269 	.area IABS    (ABS,DATA)
                                    270 	.area IABS    (ABS,DATA)
                                    271 ;--------------------------------------------------------
                                    272 ; bit data
                                    273 ;--------------------------------------------------------
                                    274 	.area BSEG    (BIT)
                                    275 ;--------------------------------------------------------
                                    276 ; paged external ram data
                                    277 ;--------------------------------------------------------
                                    278 	.area PSEG    (PAG,XDATA)
                                    279 ;--------------------------------------------------------
                                    280 ; uninitialized external ram data
                                    281 ;--------------------------------------------------------
                                    282 	.area XSEG    (XDATA)
                                    283 ;--------------------------------------------------------
                                    284 ; absolute external ram data
                                    285 ;--------------------------------------------------------
                                    286 	.area XABS    (ABS,XDATA)
                                    287 ;--------------------------------------------------------
                                    288 ; initialized external ram data
                                    289 ;--------------------------------------------------------
                                    290 	.area XISEG   (XDATA)
                                    291 	.area HOME    (CODE)
                                    292 	.area GSINIT0 (CODE)
                                    293 	.area GSINIT1 (CODE)
                                    294 	.area GSINIT2 (CODE)
                                    295 	.area GSINIT3 (CODE)
                                    296 	.area GSINIT4 (CODE)
                                    297 	.area GSINIT5 (CODE)
                                    298 	.area GSINIT  (CODE)
                                    299 	.area GSFINAL (CODE)
                                    300 	.area CSEG    (CODE)
                                    301 ;--------------------------------------------------------
                                    302 ; interrupt vector
                                    303 ;--------------------------------------------------------
                                    304 	.area HOME    (CODE)
      000000                        305 __interrupt_vect:
      000000 02 01 69         [24]  306 	ljmp	__sdcc_gsinit_startup
      000003 32               [24]  307 	reti
      000004                        308 	.ds	7
      00000B 02 01 70         [24]  309 	ljmp	_timer0_ISR
                                    310 ; restartable atomic support routines
      00000E                        311 	.ds	2
      000010                        312 sdcc_atomic_exchange_rollback_start::
      000010 00               [12]  313 	nop
      000011 00               [12]  314 	nop
      000012                        315 sdcc_atomic_exchange_pdata_impl:
      000012 E2               [24]  316 	movx	a, @r0
      000013 FB               [12]  317 	mov	r3, a
      000014 EA               [12]  318 	mov	a, r2
      000015 F2               [24]  319 	movx	@r0, a
      000016 80 2C            [24]  320 	sjmp	sdcc_atomic_exchange_exit
      000018 00               [12]  321 	nop
      000019 00               [12]  322 	nop
      00001A                        323 sdcc_atomic_exchange_xdata_impl:
      00001A E0               [24]  324 	movx	a, @dptr
      00001B FB               [12]  325 	mov	r3, a
      00001C EA               [12]  326 	mov	a, r2
      00001D F0               [24]  327 	movx	@dptr, a
      00001E 80 24            [24]  328 	sjmp	sdcc_atomic_exchange_exit
      000020                        329 sdcc_atomic_compare_exchange_idata_impl:
      000020 E6               [12]  330 	mov	a, @r0
      000021 B5 02 02         [24]  331 	cjne	a, ar2, .+#5
      000024 EB               [12]  332 	mov	a, r3
      000025 F6               [12]  333 	mov	@r0, a
      000026 22               [24]  334 	ret
      000027 00               [12]  335 	nop
      000028                        336 sdcc_atomic_compare_exchange_pdata_impl:
      000028 E2               [24]  337 	movx	a, @r0
      000029 B5 02 02         [24]  338 	cjne	a, ar2, .+#5
      00002C EB               [12]  339 	mov	a, r3
      00002D F2               [24]  340 	movx	@r0, a
      00002E 22               [24]  341 	ret
      00002F 00               [12]  342 	nop
      000030                        343 sdcc_atomic_compare_exchange_xdata_impl:
      000030 E0               [24]  344 	movx	a, @dptr
      000031 B5 02 02         [24]  345 	cjne	a, ar2, .+#5
      000034 EB               [12]  346 	mov	a, r3
      000035 F0               [24]  347 	movx	@dptr, a
      000036 22               [24]  348 	ret
      000037                        349 sdcc_atomic_exchange_rollback_end::
                                    350 
      000037                        351 sdcc_atomic_exchange_gptr_impl::
      000037 30 F6 E0         [24]  352 	jnb	b.6, sdcc_atomic_exchange_xdata_impl
      00003A A8 82            [24]  353 	mov	r0, dpl
      00003C 20 F5 D3         [24]  354 	jb	b.5, sdcc_atomic_exchange_pdata_impl
      00003F                        355 sdcc_atomic_exchange_idata_impl:
      00003F EA               [12]  356 	mov	a, r2
      000040 C6               [12]  357 	xch	a, @r0
      000041 F5 82            [12]  358 	mov	dpl, a
      000043 22               [24]  359 	ret
      000044                        360 sdcc_atomic_exchange_exit:
      000044 8B 82            [24]  361 	mov	dpl, r3
      000046 22               [24]  362 	ret
      000047                        363 sdcc_atomic_compare_exchange_gptr_impl::
      000047 30 F6 E6         [24]  364 	jnb	b.6, sdcc_atomic_compare_exchange_xdata_impl
      00004A A8 82            [24]  365 	mov	r0, dpl
      00004C 20 F5 D9         [24]  366 	jb	b.5, sdcc_atomic_compare_exchange_pdata_impl
      00004F 80 CF            [24]  367 	sjmp	sdcc_atomic_compare_exchange_idata_impl
                                    368 ;--------------------------------------------------------
                                    369 ; global & static initialisations
                                    370 ;--------------------------------------------------------
                                    371 	.area HOME    (CODE)
                                    372 	.area GSINIT  (CODE)
                                    373 	.area GSFINAL (CODE)
                                    374 	.area GSINIT  (CODE)
                                    375 	.globl __sdcc_gsinit_startup
                                    376 	.globl __sdcc_program_startup
                                    377 	.globl __start__stack
                                    378 	.globl __mcs51_genXINIT
                                    379 	.globl __mcs51_genXRAMCLEAR
                                    380 	.globl __mcs51_genRAMCLEAR
                                    381 	.area GSFINAL (CODE)
      00007E 02 00 51         [24]  382 	ljmp	__sdcc_program_startup
                                    383 ;--------------------------------------------------------
                                    384 ; Home
                                    385 ;--------------------------------------------------------
                                    386 	.area HOME    (CODE)
                                    387 	.area HOME    (CODE)
      000051                        388 __sdcc_program_startup:
      000051 02 01 48         [24]  389 	ljmp	_main
                                    390 ;	return from main will return to caller
                                    391 ;--------------------------------------------------------
                                    392 ; code
                                    393 ;--------------------------------------------------------
                                    394 	.area CSEG    (CODE)
                                    395 ;------------------------------------------------------------
                                    396 ;Allocation info for local variables in function 'Producer1'
                                    397 ;------------------------------------------------------------
                                    398 ;	test3threads.c:27: void Producer1(void)
                                    399 ;	-----------------------------------------
                                    400 ;	 function Producer1
                                    401 ;	-----------------------------------------
      000081                        402 _Producer1:
                           000007   403 	ar7 = 0x07
                           000006   404 	ar6 = 0x06
                           000005   405 	ar5 = 0x05
                           000004   406 	ar4 = 0x04
                           000003   407 	ar3 = 0x03
                           000002   408 	ar2 = 0x02
                           000001   409 	ar1 = 0x01
                           000000   410 	ar0 = 0x00
                                    411 ;	test3threads.c:29: curr_char1 = 'A';
      000081 75 28 41         [24]  412 	mov	_curr_char1,#0x41
                                    413 ;	test3threads.c:32: while (prod_turn != 1) {}     /* wait for my turn */
      000084                        414 00101$:
      000084 74 01            [12]  415 	mov	a,#0x01
      000086 B5 2B FB         [24]  416 	cjne	a,_prod_turn,00101$
                                    417 ;	test3threads.c:34: SemaphoreWait(empty);
      000089                        418 0$:
      000089 E5 22            [12]  419 	MOV A, _empty 
      00008B 60 FC            [24]  420 	JZ 0$ 
      00008D 20 E7 F9         [24]  421 	JB ACC.7, 0$ 
      000090 15 22            [12]  422 	DEC _empty 
                                    423 ;	test3threads.c:35: SemaphoreWait(mutex);
      000092                        424 1$:
      000092 E5 20            [12]  425 	MOV A, _mutex 
      000094 60 FC            [24]  426 	JZ 1$ 
      000096 20 E7 F9         [24]  427 	JB ACC.7, 1$ 
      000099 15 20            [12]  428 	DEC _mutex 
                                    429 ;	test3threads.c:36: buffer[tail] = curr_char1;    /* critical section: keep short */
      00009B E5 24            [12]  430 	mov	a,_tail
      00009D 24 25            [12]  431 	add	a, #_buffer
      00009F F8               [12]  432 	mov	r0,a
      0000A0 A6 28            [24]  433 	mov	@r0,_curr_char1
                                    434 ;	test3threads.c:37: tail++;
      0000A2 E5 24            [12]  435 	mov	a,_tail
      0000A4 04               [12]  436 	inc	a
      0000A5 F5 24            [12]  437 	mov	_tail,a
                                    438 ;	test3threads.c:38: if (tail == 3) {
      0000A7 74 03            [12]  439 	mov	a,#0x03
      0000A9 B5 24 03         [24]  440 	cjne	a,_tail,00105$
                                    441 ;	test3threads.c:39: tail = 0;
      0000AC 75 24 00         [24]  442 	mov	_tail,#0x00
      0000AF                        443 00105$:
                                    444 ;	test3threads.c:41: SemaphoreSignal(mutex);
      0000AF 05 20            [12]  445 	INC _mutex 
                                    446 ;	test3threads.c:42: SemaphoreSignal(full);
      0000B1 05 21            [12]  447 	INC _full 
                                    448 ;	test3threads.c:44: prod_turn = 2;                /* hand turn to P2 */
      0000B3 75 2B 02         [24]  449 	mov	_prod_turn,#0x02
                                    450 ;	test3threads.c:46: curr_char1++;
      0000B6 E5 28            [12]  451 	mov	a,_curr_char1
      0000B8 04               [12]  452 	inc	a
      0000B9 F5 28            [12]  453 	mov	_curr_char1,a
                                    454 ;	test3threads.c:47: if (curr_char1 > 'Z') {
      0000BB E5 28            [12]  455 	mov	a,_curr_char1
      0000BD 24 A5            [12]  456 	add	a,#0xff - 0x5a
      0000BF 50 C3            [24]  457 	jnc	00101$
                                    458 ;	test3threads.c:48: curr_char1 = 'A';
      0000C1 75 28 41         [24]  459 	mov	_curr_char1,#0x41
                                    460 ;	test3threads.c:51: }
      0000C4 80 BE            [24]  461 	sjmp	00101$
                                    462 ;------------------------------------------------------------
                                    463 ;Allocation info for local variables in function 'Producer2'
                                    464 ;------------------------------------------------------------
                                    465 ;	test3threads.c:53: void Producer2(void)
                                    466 ;	-----------------------------------------
                                    467 ;	 function Producer2
                                    468 ;	-----------------------------------------
      0000C6                        469 _Producer2:
                                    470 ;	test3threads.c:55: curr_char2 = '0';
      0000C6 75 2A 30         [24]  471 	mov	_curr_char2,#0x30
                                    472 ;	test3threads.c:58: while (prod_turn != 2) {}     /* wait for my turn */
      0000C9                        473 00101$:
      0000C9 74 02            [12]  474 	mov	a,#0x02
      0000CB B5 2B FB         [24]  475 	cjne	a,_prod_turn,00101$
                                    476 ;	test3threads.c:60: SemaphoreWait(empty);
      0000CE                        477 2$:
      0000CE E5 22            [12]  478 	MOV A, _empty 
      0000D0 60 FC            [24]  479 	JZ 2$ 
      0000D2 20 E7 F9         [24]  480 	JB ACC.7, 2$ 
      0000D5 15 22            [12]  481 	DEC _empty 
                                    482 ;	test3threads.c:61: SemaphoreWait(mutex);
      0000D7                        483 3$:
      0000D7 E5 20            [12]  484 	MOV A, _mutex 
      0000D9 60 FC            [24]  485 	JZ 3$ 
      0000DB 20 E7 F9         [24]  486 	JB ACC.7, 3$ 
      0000DE 15 20            [12]  487 	DEC _mutex 
                                    488 ;	test3threads.c:62: buffer[tail] = curr_char2;    /* critical section: keep short */
      0000E0 E5 24            [12]  489 	mov	a,_tail
      0000E2 24 25            [12]  490 	add	a, #_buffer
      0000E4 F8               [12]  491 	mov	r0,a
      0000E5 A6 2A            [24]  492 	mov	@r0,_curr_char2
                                    493 ;	test3threads.c:63: tail++;
      0000E7 E5 24            [12]  494 	mov	a,_tail
      0000E9 04               [12]  495 	inc	a
      0000EA F5 24            [12]  496 	mov	_tail,a
                                    497 ;	test3threads.c:64: if (tail == 3) {
      0000EC 74 03            [12]  498 	mov	a,#0x03
      0000EE B5 24 03         [24]  499 	cjne	a,_tail,00105$
                                    500 ;	test3threads.c:65: tail = 0;
      0000F1 75 24 00         [24]  501 	mov	_tail,#0x00
      0000F4                        502 00105$:
                                    503 ;	test3threads.c:67: SemaphoreSignal(mutex);
      0000F4 05 20            [12]  504 	INC _mutex 
                                    505 ;	test3threads.c:68: SemaphoreSignal(full);
      0000F6 05 21            [12]  506 	INC _full 
                                    507 ;	test3threads.c:70: prod_turn = 1;                /* hand turn to P1 */
      0000F8 75 2B 01         [24]  508 	mov	_prod_turn,#0x01
                                    509 ;	test3threads.c:72: curr_char2++;
      0000FB E5 2A            [12]  510 	mov	a,_curr_char2
      0000FD 04               [12]  511 	inc	a
      0000FE F5 2A            [12]  512 	mov	_curr_char2,a
                                    513 ;	test3threads.c:73: if (curr_char2 > '9') {
      000100 E5 2A            [12]  514 	mov	a,_curr_char2
      000102 24 C6            [12]  515 	add	a,#0xff - 0x39
      000104 50 C3            [24]  516 	jnc	00101$
                                    517 ;	test3threads.c:74: curr_char2 = '0';
      000106 75 2A 30         [24]  518 	mov	_curr_char2,#0x30
                                    519 ;	test3threads.c:77: }
      000109 80 BE            [24]  520 	sjmp	00101$
                                    521 ;------------------------------------------------------------
                                    522 ;Allocation info for local variables in function 'Consumer'
                                    523 ;------------------------------------------------------------
                                    524 ;	test3threads.c:80: void Consumer(void)
                                    525 ;	-----------------------------------------
                                    526 ;	 function Consumer
                                    527 ;	-----------------------------------------
      00010B                        528 _Consumer:
                                    529 ;	test3threads.c:82: TMOD |= 0x20;                     /* |= to preserve Bootstrap timer0 setup */
      00010B 43 89 20         [24]  530 	orl	_TMOD,#0x20
                                    531 ;	test3threads.c:83: TH1 = 0xFA;
      00010E 75 8D FA         [24]  532 	mov	_TH1,#0xfa
                                    533 ;	test3threads.c:84: SCON = 0x50;
      000111 75 98 50         [24]  534 	mov	_SCON,#0x50
                                    535 ;	test3threads.c:85: TR1 = 1;
                                    536 ;	assignBit
      000114 D2 8E            [12]  537 	setb	_TR1
                                    538 ;	test3threads.c:87: while (1) {
      000116                        539 00107$:
                                    540 ;	test3threads.c:88: SemaphoreWait(full);
      000116                        541 4$:
      000116 E5 21            [12]  542 	MOV A, _full 
      000118 60 FC            [24]  543 	JZ 4$ 
      00011A 20 E7 F9         [24]  544 	JB ACC.7, 4$ 
      00011D 15 21            [12]  545 	DEC _full 
                                    546 ;	test3threads.c:89: SemaphoreWait(mutex);
      00011F                        547 5$:
      00011F E5 20            [12]  548 	MOV A, _mutex 
      000121 60 FC            [24]  549 	JZ 5$ 
      000123 20 E7 F9         [24]  550 	JB ACC.7, 5$ 
      000126 15 20            [12]  551 	DEC _mutex 
                                    552 ;	test3threads.c:90: cons_char = buffer[head];     /* critical section: keep short */
      000128 E5 23            [12]  553 	mov	a,_head
      00012A 24 25            [12]  554 	add	a, #_buffer
      00012C F9               [12]  555 	mov	r1,a
      00012D 87 29            [24]  556 	mov	_cons_char,@r1
                                    557 ;	test3threads.c:91: head++;
      00012F E5 23            [12]  558 	mov	a,_head
      000131 04               [12]  559 	inc	a
      000132 F5 23            [12]  560 	mov	_head,a
                                    561 ;	test3threads.c:92: if (head == 3) {
      000134 74 03            [12]  562 	mov	a,#0x03
      000136 B5 23 03         [24]  563 	cjne	a,_head,00102$
                                    564 ;	test3threads.c:93: head = 0;
      000139 75 23 00         [24]  565 	mov	_head,#0x00
      00013C                        566 00102$:
                                    567 ;	test3threads.c:95: SemaphoreSignal(mutex);
      00013C 05 20            [12]  568 	INC _mutex 
                                    569 ;	test3threads.c:96: SemaphoreSignal(empty);
      00013E 05 22            [12]  570 	INC _empty 
                                    571 ;	test3threads.c:98: SBUF = cons_char;             /* transmit outside CS */
      000140 85 29 99         [24]  572 	mov	_SBUF,_cons_char
                                    573 ;	test3threads.c:99: while (TI == 0) {}
      000143                        574 00103$:
                                    575 ;	test3threads.c:100: TI = 0;
                                    576 ;	assignBit
      000143 10 99 D0         [24]  577 	jbc	_TI,00107$
                                    578 ;	test3threads.c:102: }
      000146 80 FB            [24]  579 	sjmp	00103$
                                    580 ;------------------------------------------------------------
                                    581 ;Allocation info for local variables in function 'main'
                                    582 ;------------------------------------------------------------
                                    583 ;	test3threads.c:104: void main(void)
                                    584 ;	-----------------------------------------
                                    585 ;	 function main
                                    586 ;	-----------------------------------------
      000148                        587 _main:
                                    588 ;	test3threads.c:106: SemaphoreCreate(mutex, 1);
      000148 75 20 01         [24]  589 	mov	_mutex,#0x01
                                    590 ;	test3threads.c:107: SemaphoreCreate(empty, 3);
      00014B 75 22 03         [24]  591 	mov	_empty,#0x03
                                    592 ;	test3threads.c:108: SemaphoreCreate(full, 0);
      00014E 75 21 00         [24]  593 	mov	_full,#0x00
                                    594 ;	test3threads.c:109: head = 0;
      000151 75 23 00         [24]  595 	mov	_head,#0x00
                                    596 ;	test3threads.c:110: tail = 0;
      000154 75 24 00         [24]  597 	mov	_tail,#0x00
                                    598 ;	test3threads.c:112: prod_turn = 1;                    /* P1 goes first */
      000157 75 2B 01         [24]  599 	mov	_prod_turn,#0x01
                                    600 ;	test3threads.c:116: ThreadCreate(Consumer);           /* Thread 1 */
      00015A 90 01 0B         [24]  601 	mov	dptr,#_Consumer
      00015D 12 01 9C         [24]  602 	lcall	_ThreadCreate
                                    603 ;	test3threads.c:117: ThreadCreate(Producer2);          /* Thread 2 */
      000160 90 00 C6         [24]  604 	mov	dptr,#_Producer2
      000163 12 01 9C         [24]  605 	lcall	_ThreadCreate
                                    606 ;	test3threads.c:118: Producer1();                      /* Thread 0 (main) becomes Producer1 */
                                    607 ;	test3threads.c:119: }
      000166 02 00 81         [24]  608 	ljmp	_Producer1
                                    609 ;------------------------------------------------------------
                                    610 ;Allocation info for local variables in function '_sdcc_gsinit_startup'
                                    611 ;------------------------------------------------------------
                                    612 ;	test3threads.c:121: void _sdcc_gsinit_startup(void)
                                    613 ;	-----------------------------------------
                                    614 ;	 function _sdcc_gsinit_startup
                                    615 ;	-----------------------------------------
      000169                        616 __sdcc_gsinit_startup:
                                    617 ;	test3threads.c:125: __endasm;
      000169 02 01 76         [24]  618 	LJMP	_Bootstrap
                                    619 ;	test3threads.c:126: }
      00016C 22               [24]  620 	ret
                                    621 ;------------------------------------------------------------
                                    622 ;Allocation info for local variables in function '_mcs51_genRAMCLEAR'
                                    623 ;------------------------------------------------------------
                                    624 ;	test3threads.c:128: void _mcs51_genRAMCLEAR(void) {}
                                    625 ;	-----------------------------------------
                                    626 ;	 function _mcs51_genRAMCLEAR
                                    627 ;	-----------------------------------------
      00016D                        628 __mcs51_genRAMCLEAR:
      00016D 22               [24]  629 	ret
                                    630 ;------------------------------------------------------------
                                    631 ;Allocation info for local variables in function '_mcs51_genXINIT'
                                    632 ;------------------------------------------------------------
                                    633 ;	test3threads.c:129: void _mcs51_genXINIT(void) {}
                                    634 ;	-----------------------------------------
                                    635 ;	 function _mcs51_genXINIT
                                    636 ;	-----------------------------------------
      00016E                        637 __mcs51_genXINIT:
      00016E 22               [24]  638 	ret
                                    639 ;------------------------------------------------------------
                                    640 ;Allocation info for local variables in function '_mcs51_genXRAMCLEAR'
                                    641 ;------------------------------------------------------------
                                    642 ;	test3threads.c:130: void _mcs51_genXRAMCLEAR(void) {}
                                    643 ;	-----------------------------------------
                                    644 ;	 function _mcs51_genXRAMCLEAR
                                    645 ;	-----------------------------------------
      00016F                        646 __mcs51_genXRAMCLEAR:
      00016F 22               [24]  647 	ret
                                    648 ;------------------------------------------------------------
                                    649 ;Allocation info for local variables in function 'timer0_ISR'
                                    650 ;------------------------------------------------------------
                                    651 ;	test3threads.c:132: void timer0_ISR(void) __interrupt(1) {
                                    652 ;	-----------------------------------------
                                    653 ;	 function timer0_ISR
                                    654 ;	-----------------------------------------
      000170                        655 _timer0_ISR:
                                    656 ;	test3threads.c:135: __endasm;
      000170 02 02 CC         [24]  657 	ljmp	_myTimer0Handler
                                    658 ;	test3threads.c:136: }
      000173 02 00 54         [24]  659 	ljmp	sdcc_atomic_maybe_rollback
                                    660 ;	eliminated unneeded mov psw,# (no regs used in bank)
                                    661 ;	eliminated unneeded push/pop not_psw
                                    662 ;	eliminated unneeded push/pop dpl
                                    663 ;	eliminated unneeded push/pop dph
                                    664 ;	eliminated unneeded push/pop b
                                    665 ;	eliminated unneeded push/pop acc
                                    666 	.area CSEG    (CODE)
                                    667 	.area CONST   (CODE)
                                    668 	.area XINIT   (CODE)
                                    669 	.area CABS    (ABS,CODE)
