                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler
                                      3 ; Version 4.5.10 #15658 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module testpreempt
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
                                     18 	.globl _Producer
                                     19 	.globl _ThreadCreate
                                     20 	.globl _CY
                                     21 	.globl _AC
                                     22 	.globl _F0
                                     23 	.globl _RS1
                                     24 	.globl _RS0
                                     25 	.globl _OV
                                     26 	.globl _F1
                                     27 	.globl _P
                                     28 	.globl _PS
                                     29 	.globl _PT1
                                     30 	.globl _PX1
                                     31 	.globl _PT0
                                     32 	.globl _PX0
                                     33 	.globl _RD
                                     34 	.globl _WR
                                     35 	.globl _T1
                                     36 	.globl _T0
                                     37 	.globl _INT1
                                     38 	.globl _INT0
                                     39 	.globl _TXD
                                     40 	.globl _RXD
                                     41 	.globl _P3_7
                                     42 	.globl _P3_6
                                     43 	.globl _P3_5
                                     44 	.globl _P3_4
                                     45 	.globl _P3_3
                                     46 	.globl _P3_2
                                     47 	.globl _P3_1
                                     48 	.globl _P3_0
                                     49 	.globl _EA
                                     50 	.globl _ES
                                     51 	.globl _ET1
                                     52 	.globl _EX1
                                     53 	.globl _ET0
                                     54 	.globl _EX0
                                     55 	.globl _P2_7
                                     56 	.globl _P2_6
                                     57 	.globl _P2_5
                                     58 	.globl _P2_4
                                     59 	.globl _P2_3
                                     60 	.globl _P2_2
                                     61 	.globl _P2_1
                                     62 	.globl _P2_0
                                     63 	.globl _SM0
                                     64 	.globl _SM1
                                     65 	.globl _SM2
                                     66 	.globl _REN
                                     67 	.globl _TB8
                                     68 	.globl _RB8
                                     69 	.globl _TI
                                     70 	.globl _RI
                                     71 	.globl _P1_7
                                     72 	.globl _P1_6
                                     73 	.globl _P1_5
                                     74 	.globl _P1_4
                                     75 	.globl _P1_3
                                     76 	.globl _P1_2
                                     77 	.globl _P1_1
                                     78 	.globl _P1_0
                                     79 	.globl _TF1
                                     80 	.globl _TR1
                                     81 	.globl _TF0
                                     82 	.globl _TR0
                                     83 	.globl _IE1
                                     84 	.globl _IT1
                                     85 	.globl _IE0
                                     86 	.globl _IT0
                                     87 	.globl _P0_7
                                     88 	.globl _P0_6
                                     89 	.globl _P0_5
                                     90 	.globl _P0_4
                                     91 	.globl _P0_3
                                     92 	.globl _P0_2
                                     93 	.globl _P0_1
                                     94 	.globl _P0_0
                                     95 	.globl _B
                                     96 	.globl _ACC
                                     97 	.globl _PSW
                                     98 	.globl _IP
                                     99 	.globl _P3
                                    100 	.globl _IE
                                    101 	.globl _P2
                                    102 	.globl _SBUF
                                    103 	.globl _SCON
                                    104 	.globl _P1
                                    105 	.globl _TH1
                                    106 	.globl _TH0
                                    107 	.globl _TL1
                                    108 	.globl _TL0
                                    109 	.globl _TMOD
                                    110 	.globl _TCON
                                    111 	.globl _PCON
                                    112 	.globl _DPH
                                    113 	.globl _DPL
                                    114 	.globl _SP
                                    115 	.globl _P0
                                    116 	.globl _cons_char
                                    117 	.globl _curr_char
                                    118 	.globl _buffer
                                    119 	.globl _tail
                                    120 	.globl _head
                                    121 	.globl _empty
                                    122 	.globl _full
                                    123 	.globl _mutex
                                    124 ;--------------------------------------------------------
                                    125 ; special function registers
                                    126 ;--------------------------------------------------------
                                    127 	.area RSEG    (ABS,DATA)
      000000                        128 	.org 0x0000
                           000080   129 _P0	=	0x0080
                           000081   130 _SP	=	0x0081
                           000082   131 _DPL	=	0x0082
                           000083   132 _DPH	=	0x0083
                           000087   133 _PCON	=	0x0087
                           000088   134 _TCON	=	0x0088
                           000089   135 _TMOD	=	0x0089
                           00008A   136 _TL0	=	0x008a
                           00008B   137 _TL1	=	0x008b
                           00008C   138 _TH0	=	0x008c
                           00008D   139 _TH1	=	0x008d
                           000090   140 _P1	=	0x0090
                           000098   141 _SCON	=	0x0098
                           000099   142 _SBUF	=	0x0099
                           0000A0   143 _P2	=	0x00a0
                           0000A8   144 _IE	=	0x00a8
                           0000B0   145 _P3	=	0x00b0
                           0000B8   146 _IP	=	0x00b8
                           0000D0   147 _PSW	=	0x00d0
                           0000E0   148 _ACC	=	0x00e0
                           0000F0   149 _B	=	0x00f0
                                    150 ;--------------------------------------------------------
                                    151 ; special function bits
                                    152 ;--------------------------------------------------------
                                    153 	.area RSEG    (ABS,DATA)
      000000                        154 	.org 0x0000
                           000080   155 _P0_0	=	0x0080
                           000081   156 _P0_1	=	0x0081
                           000082   157 _P0_2	=	0x0082
                           000083   158 _P0_3	=	0x0083
                           000084   159 _P0_4	=	0x0084
                           000085   160 _P0_5	=	0x0085
                           000086   161 _P0_6	=	0x0086
                           000087   162 _P0_7	=	0x0087
                           000088   163 _IT0	=	0x0088
                           000089   164 _IE0	=	0x0089
                           00008A   165 _IT1	=	0x008a
                           00008B   166 _IE1	=	0x008b
                           00008C   167 _TR0	=	0x008c
                           00008D   168 _TF0	=	0x008d
                           00008E   169 _TR1	=	0x008e
                           00008F   170 _TF1	=	0x008f
                           000090   171 _P1_0	=	0x0090
                           000091   172 _P1_1	=	0x0091
                           000092   173 _P1_2	=	0x0092
                           000093   174 _P1_3	=	0x0093
                           000094   175 _P1_4	=	0x0094
                           000095   176 _P1_5	=	0x0095
                           000096   177 _P1_6	=	0x0096
                           000097   178 _P1_7	=	0x0097
                           000098   179 _RI	=	0x0098
                           000099   180 _TI	=	0x0099
                           00009A   181 _RB8	=	0x009a
                           00009B   182 _TB8	=	0x009b
                           00009C   183 _REN	=	0x009c
                           00009D   184 _SM2	=	0x009d
                           00009E   185 _SM1	=	0x009e
                           00009F   186 _SM0	=	0x009f
                           0000A0   187 _P2_0	=	0x00a0
                           0000A1   188 _P2_1	=	0x00a1
                           0000A2   189 _P2_2	=	0x00a2
                           0000A3   190 _P2_3	=	0x00a3
                           0000A4   191 _P2_4	=	0x00a4
                           0000A5   192 _P2_5	=	0x00a5
                           0000A6   193 _P2_6	=	0x00a6
                           0000A7   194 _P2_7	=	0x00a7
                           0000A8   195 _EX0	=	0x00a8
                           0000A9   196 _ET0	=	0x00a9
                           0000AA   197 _EX1	=	0x00aa
                           0000AB   198 _ET1	=	0x00ab
                           0000AC   199 _ES	=	0x00ac
                           0000AF   200 _EA	=	0x00af
                           0000B0   201 _P3_0	=	0x00b0
                           0000B1   202 _P3_1	=	0x00b1
                           0000B2   203 _P3_2	=	0x00b2
                           0000B3   204 _P3_3	=	0x00b3
                           0000B4   205 _P3_4	=	0x00b4
                           0000B5   206 _P3_5	=	0x00b5
                           0000B6   207 _P3_6	=	0x00b6
                           0000B7   208 _P3_7	=	0x00b7
                           0000B0   209 _RXD	=	0x00b0
                           0000B1   210 _TXD	=	0x00b1
                           0000B2   211 _INT0	=	0x00b2
                           0000B3   212 _INT1	=	0x00b3
                           0000B4   213 _T0	=	0x00b4
                           0000B5   214 _T1	=	0x00b5
                           0000B6   215 _WR	=	0x00b6
                           0000B7   216 _RD	=	0x00b7
                           0000B8   217 _PX0	=	0x00b8
                           0000B9   218 _PT0	=	0x00b9
                           0000BA   219 _PX1	=	0x00ba
                           0000BB   220 _PT1	=	0x00bb
                           0000BC   221 _PS	=	0x00bc
                           0000D0   222 _P	=	0x00d0
                           0000D1   223 _F1	=	0x00d1
                           0000D2   224 _OV	=	0x00d2
                           0000D3   225 _RS0	=	0x00d3
                           0000D4   226 _RS1	=	0x00d4
                           0000D5   227 _F0	=	0x00d5
                           0000D6   228 _AC	=	0x00d6
                           0000D7   229 _CY	=	0x00d7
                                    230 ;--------------------------------------------------------
                                    231 ; overlayable register banks
                                    232 ;--------------------------------------------------------
                                    233 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        234 	.ds 8
                                    235 ;--------------------------------------------------------
                                    236 ; internal ram data
                                    237 ;--------------------------------------------------------
                                    238 	.area DSEG    (DATA)
                           000020   239 _mutex	=	0x0020
                           000021   240 _full	=	0x0021
                           000022   241 _empty	=	0x0022
                           000023   242 _head	=	0x0023
                           000024   243 _tail	=	0x0024
                           000025   244 _buffer	=	0x0025
                           000028   245 _curr_char	=	0x0028
                           000029   246 _cons_char	=	0x0029
                                    247 ;--------------------------------------------------------
                                    248 ; overlayable items in internal ram
                                    249 ;--------------------------------------------------------
                                    250 ;--------------------------------------------------------
                                    251 ; Stack segment in internal ram
                                    252 ;--------------------------------------------------------
                                    253 	.area SSEG
      000008                        254 __start__stack:
      000008                        255 	.ds	1
                                    256 
                                    257 ;--------------------------------------------------------
                                    258 ; indirectly addressable internal ram data
                                    259 ;--------------------------------------------------------
                                    260 	.area ISEG    (DATA)
                                    261 ;--------------------------------------------------------
                                    262 ; absolute internal ram data
                                    263 ;--------------------------------------------------------
                                    264 	.area IABS    (ABS,DATA)
                                    265 	.area IABS    (ABS,DATA)
                                    266 ;--------------------------------------------------------
                                    267 ; bit data
                                    268 ;--------------------------------------------------------
                                    269 	.area BSEG    (BIT)
                                    270 ;--------------------------------------------------------
                                    271 ; paged external ram data
                                    272 ;--------------------------------------------------------
                                    273 	.area PSEG    (PAG,XDATA)
                                    274 ;--------------------------------------------------------
                                    275 ; uninitialized external ram data
                                    276 ;--------------------------------------------------------
                                    277 	.area XSEG    (XDATA)
                                    278 ;--------------------------------------------------------
                                    279 ; absolute external ram data
                                    280 ;--------------------------------------------------------
                                    281 	.area XABS    (ABS,XDATA)
                                    282 ;--------------------------------------------------------
                                    283 ; initialized external ram data
                                    284 ;--------------------------------------------------------
                                    285 	.area XISEG   (XDATA)
                                    286 	.area HOME    (CODE)
                                    287 	.area GSINIT0 (CODE)
                                    288 	.area GSINIT1 (CODE)
                                    289 	.area GSINIT2 (CODE)
                                    290 	.area GSINIT3 (CODE)
                                    291 	.area GSINIT4 (CODE)
                                    292 	.area GSINIT5 (CODE)
                                    293 	.area GSINIT  (CODE)
                                    294 	.area GSFINAL (CODE)
                                    295 	.area CSEG    (CODE)
                                    296 ;--------------------------------------------------------
                                    297 ; interrupt vector
                                    298 ;--------------------------------------------------------
                                    299 	.area HOME    (CODE)
      000000                        300 __interrupt_vect:
      000000 02 01 13         [24]  301 	ljmp	__sdcc_gsinit_startup
      000003 32               [24]  302 	reti
      000004                        303 	.ds	7
      00000B 02 01 1A         [24]  304 	ljmp	_timer0_ISR
                                    305 ; restartable atomic support routines
      00000E                        306 	.ds	2
      000010                        307 sdcc_atomic_exchange_rollback_start::
      000010 00               [12]  308 	nop
      000011 00               [12]  309 	nop
      000012                        310 sdcc_atomic_exchange_pdata_impl:
      000012 E2               [24]  311 	movx	a, @r0
      000013 FB               [12]  312 	mov	r3, a
      000014 EA               [12]  313 	mov	a, r2
      000015 F2               [24]  314 	movx	@r0, a
      000016 80 2C            [24]  315 	sjmp	sdcc_atomic_exchange_exit
      000018 00               [12]  316 	nop
      000019 00               [12]  317 	nop
      00001A                        318 sdcc_atomic_exchange_xdata_impl:
      00001A E0               [24]  319 	movx	a, @dptr
      00001B FB               [12]  320 	mov	r3, a
      00001C EA               [12]  321 	mov	a, r2
      00001D F0               [24]  322 	movx	@dptr, a
      00001E 80 24            [24]  323 	sjmp	sdcc_atomic_exchange_exit
      000020                        324 sdcc_atomic_compare_exchange_idata_impl:
      000020 E6               [12]  325 	mov	a, @r0
      000021 B5 02 02         [24]  326 	cjne	a, ar2, .+#5
      000024 EB               [12]  327 	mov	a, r3
      000025 F6               [12]  328 	mov	@r0, a
      000026 22               [24]  329 	ret
      000027 00               [12]  330 	nop
      000028                        331 sdcc_atomic_compare_exchange_pdata_impl:
      000028 E2               [24]  332 	movx	a, @r0
      000029 B5 02 02         [24]  333 	cjne	a, ar2, .+#5
      00002C EB               [12]  334 	mov	a, r3
      00002D F2               [24]  335 	movx	@r0, a
      00002E 22               [24]  336 	ret
      00002F 00               [12]  337 	nop
      000030                        338 sdcc_atomic_compare_exchange_xdata_impl:
      000030 E0               [24]  339 	movx	a, @dptr
      000031 B5 02 02         [24]  340 	cjne	a, ar2, .+#5
      000034 EB               [12]  341 	mov	a, r3
      000035 F0               [24]  342 	movx	@dptr, a
      000036 22               [24]  343 	ret
      000037                        344 sdcc_atomic_exchange_rollback_end::
                                    345 
      000037                        346 sdcc_atomic_exchange_gptr_impl::
      000037 30 F6 E0         [24]  347 	jnb	b.6, sdcc_atomic_exchange_xdata_impl
      00003A A8 82            [24]  348 	mov	r0, dpl
      00003C 20 F5 D3         [24]  349 	jb	b.5, sdcc_atomic_exchange_pdata_impl
      00003F                        350 sdcc_atomic_exchange_idata_impl:
      00003F EA               [12]  351 	mov	a, r2
      000040 C6               [12]  352 	xch	a, @r0
      000041 F5 82            [12]  353 	mov	dpl, a
      000043 22               [24]  354 	ret
      000044                        355 sdcc_atomic_exchange_exit:
      000044 8B 82            [24]  356 	mov	dpl, r3
      000046 22               [24]  357 	ret
      000047                        358 sdcc_atomic_compare_exchange_gptr_impl::
      000047 30 F6 E6         [24]  359 	jnb	b.6, sdcc_atomic_compare_exchange_xdata_impl
      00004A A8 82            [24]  360 	mov	r0, dpl
      00004C 20 F5 D9         [24]  361 	jb	b.5, sdcc_atomic_compare_exchange_pdata_impl
      00004F 80 CF            [24]  362 	sjmp	sdcc_atomic_compare_exchange_idata_impl
                                    363 ;--------------------------------------------------------
                                    364 ; global & static initialisations
                                    365 ;--------------------------------------------------------
                                    366 	.area HOME    (CODE)
                                    367 	.area GSINIT  (CODE)
                                    368 	.area GSFINAL (CODE)
                                    369 	.area GSINIT  (CODE)
                                    370 	.globl __sdcc_gsinit_startup
                                    371 	.globl __sdcc_program_startup
                                    372 	.globl __start__stack
                                    373 	.globl __mcs51_genXINIT
                                    374 	.globl __mcs51_genXRAMCLEAR
                                    375 	.globl __mcs51_genRAMCLEAR
                                    376 	.area GSFINAL (CODE)
      00007E 02 00 51         [24]  377 	ljmp	__sdcc_program_startup
                                    378 ;--------------------------------------------------------
                                    379 ; Home
                                    380 ;--------------------------------------------------------
                                    381 	.area HOME    (CODE)
                                    382 	.area HOME    (CODE)
      000051                        383 __sdcc_program_startup:
      000051 02 00 FB         [24]  384 	ljmp	_main
                                    385 ;	return from main will return to caller
                                    386 ;--------------------------------------------------------
                                    387 ; code
                                    388 ;--------------------------------------------------------
                                    389 	.area CSEG    (CODE)
                                    390 ;------------------------------------------------------------
                                    391 ;Allocation info for local variables in function 'Producer'
                                    392 ;------------------------------------------------------------
                                    393 ;	testpreempt.c:18: void Producer(void)
                                    394 ;	-----------------------------------------
                                    395 ;	 function Producer
                                    396 ;	-----------------------------------------
      000081                        397 _Producer:
                           000007   398 	ar7 = 0x07
                           000006   399 	ar6 = 0x06
                           000005   400 	ar5 = 0x05
                           000004   401 	ar4 = 0x04
                           000003   402 	ar3 = 0x03
                           000002   403 	ar2 = 0x02
                           000001   404 	ar1 = 0x01
                           000000   405 	ar0 = 0x00
                                    406 ;	testpreempt.c:20: curr_char = 'A';
      000081 75 28 41         [24]  407 	mov	_curr_char,#0x41
                                    408 ;	testpreempt.c:21: while (1) {
      000084                        409 00106$:
                                    410 ;	testpreempt.c:22: SemaphoreWait(empty);
      000084                        411 0$:
      000084 E5 22            [12]  412 	MOV A, _empty 
      000086 60 FC            [24]  413 	JZ 0$ 
      000088 20 E7 F9         [24]  414 	JB ACC.7, 0$ 
      00008B 15 22            [12]  415 	DEC _empty 
                                    416 ;	testpreempt.c:23: SemaphoreWait(mutex);
      00008D                        417 1$:
      00008D E5 20            [12]  418 	MOV A, _mutex 
      00008F 60 FC            [24]  419 	JZ 1$ 
      000091 20 E7 F9         [24]  420 	JB ACC.7, 1$ 
      000094 15 20            [12]  421 	DEC _mutex 
                                    422 ;	testpreempt.c:24: buffer[tail] = curr_char;     /* critical section: keep short */
      000096 E5 24            [12]  423 	mov	a,_tail
      000098 24 25            [12]  424 	add	a, #_buffer
      00009A F8               [12]  425 	mov	r0,a
      00009B A6 28            [24]  426 	mov	@r0,_curr_char
                                    427 ;	testpreempt.c:25: tail++;
      00009D E5 24            [12]  428 	mov	a,_tail
      00009F 04               [12]  429 	inc	a
      0000A0 F5 24            [12]  430 	mov	_tail,a
                                    431 ;	testpreempt.c:26: if (tail == 3) {
      0000A2 74 03            [12]  432 	mov	a,#0x03
      0000A4 B5 24 03         [24]  433 	cjne	a,_tail,00102$
                                    434 ;	testpreempt.c:27: tail = 0;
      0000A7 75 24 00         [24]  435 	mov	_tail,#0x00
      0000AA                        436 00102$:
                                    437 ;	testpreempt.c:29: SemaphoreSignal(mutex);
      0000AA 05 20            [12]  438 	INC _mutex 
                                    439 ;	testpreempt.c:30: SemaphoreSignal(full);
      0000AC 05 21            [12]  440 	INC _full 
                                    441 ;	testpreempt.c:32: curr_char++;                  /* next char generated outside CS */
      0000AE E5 28            [12]  442 	mov	a,_curr_char
      0000B0 04               [12]  443 	inc	a
      0000B1 F5 28            [12]  444 	mov	_curr_char,a
                                    445 ;	testpreempt.c:33: if (curr_char > 'Z') {
      0000B3 E5 28            [12]  446 	mov	a,_curr_char
      0000B5 24 A5            [12]  447 	add	a,#0xff - 0x5a
      0000B7 50 CB            [24]  448 	jnc	00106$
                                    449 ;	testpreempt.c:34: curr_char = 'A';
      0000B9 75 28 41         [24]  450 	mov	_curr_char,#0x41
                                    451 ;	testpreempt.c:37: }
      0000BC 80 C6            [24]  452 	sjmp	00106$
                                    453 ;------------------------------------------------------------
                                    454 ;Allocation info for local variables in function 'Consumer'
                                    455 ;------------------------------------------------------------
                                    456 ;	testpreempt.c:39: void Consumer(void)
                                    457 ;	-----------------------------------------
                                    458 ;	 function Consumer
                                    459 ;	-----------------------------------------
      0000BE                        460 _Consumer:
                                    461 ;	testpreempt.c:41: TMOD |= 0x20;                     /* |= to preserve Bootstrap timer0 setup */
      0000BE 43 89 20         [24]  462 	orl	_TMOD,#0x20
                                    463 ;	testpreempt.c:42: TH1 = 0xFA;
      0000C1 75 8D FA         [24]  464 	mov	_TH1,#0xfa
                                    465 ;	testpreempt.c:43: SCON = 0x50;
      0000C4 75 98 50         [24]  466 	mov	_SCON,#0x50
                                    467 ;	testpreempt.c:44: TR1 = 1;
                                    468 ;	assignBit
      0000C7 D2 8E            [12]  469 	setb	_TR1
                                    470 ;	testpreempt.c:46: while (1) {
      0000C9                        471 00107$:
                                    472 ;	testpreempt.c:47: SemaphoreWait(full);
      0000C9                        473 2$:
      0000C9 E5 21            [12]  474 	MOV A, _full 
      0000CB 60 FC            [24]  475 	JZ 2$ 
      0000CD 20 E7 F9         [24]  476 	JB ACC.7, 2$ 
      0000D0 15 21            [12]  477 	DEC _full 
                                    478 ;	testpreempt.c:48: SemaphoreWait(mutex);
      0000D2                        479 3$:
      0000D2 E5 20            [12]  480 	MOV A, _mutex 
      0000D4 60 FC            [24]  481 	JZ 3$ 
      0000D6 20 E7 F9         [24]  482 	JB ACC.7, 3$ 
      0000D9 15 20            [12]  483 	DEC _mutex 
                                    484 ;	testpreempt.c:49: cons_char = buffer[head];     /* critical section: keep short */
      0000DB E5 23            [12]  485 	mov	a,_head
      0000DD 24 25            [12]  486 	add	a, #_buffer
      0000DF F9               [12]  487 	mov	r1,a
      0000E0 87 29            [24]  488 	mov	_cons_char,@r1
                                    489 ;	testpreempt.c:50: head++;
      0000E2 E5 23            [12]  490 	mov	a,_head
      0000E4 04               [12]  491 	inc	a
      0000E5 F5 23            [12]  492 	mov	_head,a
                                    493 ;	testpreempt.c:51: if (head == 3) {
      0000E7 74 03            [12]  494 	mov	a,#0x03
      0000E9 B5 23 03         [24]  495 	cjne	a,_head,00102$
                                    496 ;	testpreempt.c:52: head = 0;
      0000EC 75 23 00         [24]  497 	mov	_head,#0x00
      0000EF                        498 00102$:
                                    499 ;	testpreempt.c:54: SemaphoreSignal(mutex);
      0000EF 05 20            [12]  500 	INC _mutex 
                                    501 ;	testpreempt.c:55: SemaphoreSignal(empty);
      0000F1 05 22            [12]  502 	INC _empty 
                                    503 ;	testpreempt.c:57: SBUF = cons_char;             /* transmit outside CS */
      0000F3 85 29 99         [24]  504 	mov	_SBUF,_cons_char
                                    505 ;	testpreempt.c:58: while (TI == 0) {}
      0000F6                        506 00103$:
                                    507 ;	testpreempt.c:59: TI = 0;
                                    508 ;	assignBit
      0000F6 10 99 D0         [24]  509 	jbc	_TI,00107$
                                    510 ;	testpreempt.c:61: }
      0000F9 80 FB            [24]  511 	sjmp	00103$
                                    512 ;------------------------------------------------------------
                                    513 ;Allocation info for local variables in function 'main'
                                    514 ;------------------------------------------------------------
                                    515 ;	testpreempt.c:63: void main(void)
                                    516 ;	-----------------------------------------
                                    517 ;	 function main
                                    518 ;	-----------------------------------------
      0000FB                        519 _main:
                                    520 ;	testpreempt.c:65: SemaphoreCreate(mutex, 1);
      0000FB 75 20 01         [24]  521 	mov	_mutex,#0x01
                                    522 ;	testpreempt.c:66: SemaphoreCreate(empty, 3);
      0000FE 75 22 03         [24]  523 	mov	_empty,#0x03
                                    524 ;	testpreempt.c:67: SemaphoreCreate(full, 0);
      000101 75 21 00         [24]  525 	mov	_full,#0x00
                                    526 ;	testpreempt.c:68: head = 0;
      000104 75 23 00         [24]  527 	mov	_head,#0x00
                                    528 ;	testpreempt.c:69: tail = 0;
      000107 75 24 00         [24]  529 	mov	_tail,#0x00
                                    530 ;	testpreempt.c:71: ThreadCreate(Consumer);
      00010A 90 00 BE         [24]  531 	mov	dptr,#_Consumer
      00010D 12 01 46         [24]  532 	lcall	_ThreadCreate
                                    533 ;	testpreempt.c:72: Producer();
                                    534 ;	testpreempt.c:73: }
      000110 02 00 81         [24]  535 	ljmp	_Producer
                                    536 ;------------------------------------------------------------
                                    537 ;Allocation info for local variables in function '_sdcc_gsinit_startup'
                                    538 ;------------------------------------------------------------
                                    539 ;	testpreempt.c:75: void _sdcc_gsinit_startup(void)
                                    540 ;	-----------------------------------------
                                    541 ;	 function _sdcc_gsinit_startup
                                    542 ;	-----------------------------------------
      000113                        543 __sdcc_gsinit_startup:
                                    544 ;	testpreempt.c:79: __endasm;
      000113 02 01 20         [24]  545 	LJMP	_Bootstrap
                                    546 ;	testpreempt.c:80: }
      000116 22               [24]  547 	ret
                                    548 ;------------------------------------------------------------
                                    549 ;Allocation info for local variables in function '_mcs51_genRAMCLEAR'
                                    550 ;------------------------------------------------------------
                                    551 ;	testpreempt.c:82: void _mcs51_genRAMCLEAR(void) {}
                                    552 ;	-----------------------------------------
                                    553 ;	 function _mcs51_genRAMCLEAR
                                    554 ;	-----------------------------------------
      000117                        555 __mcs51_genRAMCLEAR:
      000117 22               [24]  556 	ret
                                    557 ;------------------------------------------------------------
                                    558 ;Allocation info for local variables in function '_mcs51_genXINIT'
                                    559 ;------------------------------------------------------------
                                    560 ;	testpreempt.c:83: void _mcs51_genXINIT(void) {}
                                    561 ;	-----------------------------------------
                                    562 ;	 function _mcs51_genXINIT
                                    563 ;	-----------------------------------------
      000118                        564 __mcs51_genXINIT:
      000118 22               [24]  565 	ret
                                    566 ;------------------------------------------------------------
                                    567 ;Allocation info for local variables in function '_mcs51_genXRAMCLEAR'
                                    568 ;------------------------------------------------------------
                                    569 ;	testpreempt.c:84: void _mcs51_genXRAMCLEAR(void) {}
                                    570 ;	-----------------------------------------
                                    571 ;	 function _mcs51_genXRAMCLEAR
                                    572 ;	-----------------------------------------
      000119                        573 __mcs51_genXRAMCLEAR:
      000119 22               [24]  574 	ret
                                    575 ;------------------------------------------------------------
                                    576 ;Allocation info for local variables in function 'timer0_ISR'
                                    577 ;------------------------------------------------------------
                                    578 ;	testpreempt.c:86: void timer0_ISR(void) __interrupt(1) {
                                    579 ;	-----------------------------------------
                                    580 ;	 function timer0_ISR
                                    581 ;	-----------------------------------------
      00011A                        582 _timer0_ISR:
                                    583 ;	testpreempt.c:89: __endasm;
      00011A 02 02 76         [24]  584 	ljmp	_myTimer0Handler
                                    585 ;	testpreempt.c:90: }
      00011D 02 00 54         [24]  586 	ljmp	sdcc_atomic_maybe_rollback
                                    587 ;	eliminated unneeded mov psw,# (no regs used in bank)
                                    588 ;	eliminated unneeded push/pop not_psw
                                    589 ;	eliminated unneeded push/pop dpl
                                    590 ;	eliminated unneeded push/pop dph
                                    591 ;	eliminated unneeded push/pop b
                                    592 ;	eliminated unneeded push/pop acc
                                    593 	.area CSEG    (CODE)
                                    594 	.area CONST   (CODE)
                                    595 	.area XINIT   (CODE)
                                    596 	.area CABS    (ABS,CODE)
