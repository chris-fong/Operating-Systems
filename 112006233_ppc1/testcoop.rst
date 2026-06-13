                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler
                                      3 ; Version 4.5.10 #15658 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module testcoop
                                      6 	
                                      7 	.optsdcc -mmcs51 --model-small
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl __mcs51_genXRAMCLEAR
                                     12 	.globl __mcs51_genXINIT
                                     13 	.globl __mcs51_genRAMCLEAR
                                     14 	.globl __sdcc_gsinit_startup
                                     15 	.globl _main
                                     16 	.globl _Consumer
                                     17 	.globl _Producer
                                     18 	.globl _ThreadYield
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
                                    116 	.globl _curr_char
                                    117 	.globl _shared_buf
                                    118 	.globl _data_ready
                                    119 ;--------------------------------------------------------
                                    120 ; special function registers
                                    121 ;--------------------------------------------------------
                                    122 	.area RSEG    (ABS,DATA)
      000000                        123 	.org 0x0000
                           000080   124 _P0	=	0x0080
                           000081   125 _SP	=	0x0081
                           000082   126 _DPL	=	0x0082
                           000083   127 _DPH	=	0x0083
                           000087   128 _PCON	=	0x0087
                           000088   129 _TCON	=	0x0088
                           000089   130 _TMOD	=	0x0089
                           00008A   131 _TL0	=	0x008a
                           00008B   132 _TL1	=	0x008b
                           00008C   133 _TH0	=	0x008c
                           00008D   134 _TH1	=	0x008d
                           000090   135 _P1	=	0x0090
                           000098   136 _SCON	=	0x0098
                           000099   137 _SBUF	=	0x0099
                           0000A0   138 _P2	=	0x00a0
                           0000A8   139 _IE	=	0x00a8
                           0000B0   140 _P3	=	0x00b0
                           0000B8   141 _IP	=	0x00b8
                           0000D0   142 _PSW	=	0x00d0
                           0000E0   143 _ACC	=	0x00e0
                           0000F0   144 _B	=	0x00f0
                                    145 ;--------------------------------------------------------
                                    146 ; special function bits
                                    147 ;--------------------------------------------------------
                                    148 	.area RSEG    (ABS,DATA)
      000000                        149 	.org 0x0000
                           000080   150 _P0_0	=	0x0080
                           000081   151 _P0_1	=	0x0081
                           000082   152 _P0_2	=	0x0082
                           000083   153 _P0_3	=	0x0083
                           000084   154 _P0_4	=	0x0084
                           000085   155 _P0_5	=	0x0085
                           000086   156 _P0_6	=	0x0086
                           000087   157 _P0_7	=	0x0087
                           000088   158 _IT0	=	0x0088
                           000089   159 _IE0	=	0x0089
                           00008A   160 _IT1	=	0x008a
                           00008B   161 _IE1	=	0x008b
                           00008C   162 _TR0	=	0x008c
                           00008D   163 _TF0	=	0x008d
                           00008E   164 _TR1	=	0x008e
                           00008F   165 _TF1	=	0x008f
                           000090   166 _P1_0	=	0x0090
                           000091   167 _P1_1	=	0x0091
                           000092   168 _P1_2	=	0x0092
                           000093   169 _P1_3	=	0x0093
                           000094   170 _P1_4	=	0x0094
                           000095   171 _P1_5	=	0x0095
                           000096   172 _P1_6	=	0x0096
                           000097   173 _P1_7	=	0x0097
                           000098   174 _RI	=	0x0098
                           000099   175 _TI	=	0x0099
                           00009A   176 _RB8	=	0x009a
                           00009B   177 _TB8	=	0x009b
                           00009C   178 _REN	=	0x009c
                           00009D   179 _SM2	=	0x009d
                           00009E   180 _SM1	=	0x009e
                           00009F   181 _SM0	=	0x009f
                           0000A0   182 _P2_0	=	0x00a0
                           0000A1   183 _P2_1	=	0x00a1
                           0000A2   184 _P2_2	=	0x00a2
                           0000A3   185 _P2_3	=	0x00a3
                           0000A4   186 _P2_4	=	0x00a4
                           0000A5   187 _P2_5	=	0x00a5
                           0000A6   188 _P2_6	=	0x00a6
                           0000A7   189 _P2_7	=	0x00a7
                           0000A8   190 _EX0	=	0x00a8
                           0000A9   191 _ET0	=	0x00a9
                           0000AA   192 _EX1	=	0x00aa
                           0000AB   193 _ET1	=	0x00ab
                           0000AC   194 _ES	=	0x00ac
                           0000AF   195 _EA	=	0x00af
                           0000B0   196 _P3_0	=	0x00b0
                           0000B1   197 _P3_1	=	0x00b1
                           0000B2   198 _P3_2	=	0x00b2
                           0000B3   199 _P3_3	=	0x00b3
                           0000B4   200 _P3_4	=	0x00b4
                           0000B5   201 _P3_5	=	0x00b5
                           0000B6   202 _P3_6	=	0x00b6
                           0000B7   203 _P3_7	=	0x00b7
                           0000B0   204 _RXD	=	0x00b0
                           0000B1   205 _TXD	=	0x00b1
                           0000B2   206 _INT0	=	0x00b2
                           0000B3   207 _INT1	=	0x00b3
                           0000B4   208 _T0	=	0x00b4
                           0000B5   209 _T1	=	0x00b5
                           0000B6   210 _WR	=	0x00b6
                           0000B7   211 _RD	=	0x00b7
                           0000B8   212 _PX0	=	0x00b8
                           0000B9   213 _PT0	=	0x00b9
                           0000BA   214 _PX1	=	0x00ba
                           0000BB   215 _PT1	=	0x00bb
                           0000BC   216 _PS	=	0x00bc
                           0000D0   217 _P	=	0x00d0
                           0000D1   218 _F1	=	0x00d1
                           0000D2   219 _OV	=	0x00d2
                           0000D3   220 _RS0	=	0x00d3
                           0000D4   221 _RS1	=	0x00d4
                           0000D5   222 _F0	=	0x00d5
                           0000D6   223 _AC	=	0x00d6
                           0000D7   224 _CY	=	0x00d7
                                    225 ;--------------------------------------------------------
                                    226 ; overlayable register banks
                                    227 ;--------------------------------------------------------
                                    228 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        229 	.ds 8
                                    230 ;--------------------------------------------------------
                                    231 ; internal ram data
                                    232 ;--------------------------------------------------------
                                    233 	.area DSEG    (DATA)
                           000030   234 _data_ready	=	0x0030
                           000031   235 _shared_buf	=	0x0031
                           000032   236 _curr_char	=	0x0032
                                    237 ;--------------------------------------------------------
                                    238 ; overlayable items in internal ram
                                    239 ;--------------------------------------------------------
                                    240 ;--------------------------------------------------------
                                    241 ; Stack segment in internal ram
                                    242 ;--------------------------------------------------------
                                    243 	.area SSEG
      000008                        244 __start__stack:
      000008                        245 	.ds	1
                                    246 
                                    247 ;--------------------------------------------------------
                                    248 ; indirectly addressable internal ram data
                                    249 ;--------------------------------------------------------
                                    250 	.area ISEG    (DATA)
                                    251 ;--------------------------------------------------------
                                    252 ; absolute internal ram data
                                    253 ;--------------------------------------------------------
                                    254 	.area IABS    (ABS,DATA)
                                    255 	.area IABS    (ABS,DATA)
                                    256 ;--------------------------------------------------------
                                    257 ; bit data
                                    258 ;--------------------------------------------------------
                                    259 	.area BSEG    (BIT)
                                    260 ;--------------------------------------------------------
                                    261 ; paged external ram data
                                    262 ;--------------------------------------------------------
                                    263 	.area PSEG    (PAG,XDATA)
                                    264 ;--------------------------------------------------------
                                    265 ; uninitialized external ram data
                                    266 ;--------------------------------------------------------
                                    267 	.area XSEG    (XDATA)
                                    268 ;--------------------------------------------------------
                                    269 ; absolute external ram data
                                    270 ;--------------------------------------------------------
                                    271 	.area XABS    (ABS,XDATA)
                                    272 ;--------------------------------------------------------
                                    273 ; initialized external ram data
                                    274 ;--------------------------------------------------------
                                    275 	.area XISEG   (XDATA)
                                    276 	.area HOME    (CODE)
                                    277 	.area GSINIT0 (CODE)
                                    278 	.area GSINIT1 (CODE)
                                    279 	.area GSINIT2 (CODE)
                                    280 	.area GSINIT3 (CODE)
                                    281 	.area GSINIT4 (CODE)
                                    282 	.area GSINIT5 (CODE)
                                    283 	.area GSINIT  (CODE)
                                    284 	.area GSFINAL (CODE)
                                    285 	.area CSEG    (CODE)
                                    286 ;--------------------------------------------------------
                                    287 ; interrupt vector
                                    288 ;--------------------------------------------------------
                                    289 	.area HOME    (CODE)
      000000                        290 __interrupt_vect:
      000000 02 00 A4         [24]  291 	ljmp	__sdcc_gsinit_startup
                                    292 ; restartable atomic support routines
      000003                        293 	.ds	5
      000008                        294 sdcc_atomic_exchange_rollback_start::
      000008 00               [12]  295 	nop
      000009 00               [12]  296 	nop
      00000A                        297 sdcc_atomic_exchange_pdata_impl:
      00000A E2               [24]  298 	movx	a, @r0
      00000B FB               [12]  299 	mov	r3, a
      00000C EA               [12]  300 	mov	a, r2
      00000D F2               [24]  301 	movx	@r0, a
      00000E 80 2C            [24]  302 	sjmp	sdcc_atomic_exchange_exit
      000010 00               [12]  303 	nop
      000011 00               [12]  304 	nop
      000012                        305 sdcc_atomic_exchange_xdata_impl:
      000012 E0               [24]  306 	movx	a, @dptr
      000013 FB               [12]  307 	mov	r3, a
      000014 EA               [12]  308 	mov	a, r2
      000015 F0               [24]  309 	movx	@dptr, a
      000016 80 24            [24]  310 	sjmp	sdcc_atomic_exchange_exit
      000018                        311 sdcc_atomic_compare_exchange_idata_impl:
      000018 E6               [12]  312 	mov	a, @r0
      000019 B5 02 02         [24]  313 	cjne	a, ar2, .+#5
      00001C EB               [12]  314 	mov	a, r3
      00001D F6               [12]  315 	mov	@r0, a
      00001E 22               [24]  316 	ret
      00001F 00               [12]  317 	nop
      000020                        318 sdcc_atomic_compare_exchange_pdata_impl:
      000020 E2               [24]  319 	movx	a, @r0
      000021 B5 02 02         [24]  320 	cjne	a, ar2, .+#5
      000024 EB               [12]  321 	mov	a, r3
      000025 F2               [24]  322 	movx	@r0, a
      000026 22               [24]  323 	ret
      000027 00               [12]  324 	nop
      000028                        325 sdcc_atomic_compare_exchange_xdata_impl:
      000028 E0               [24]  326 	movx	a, @dptr
      000029 B5 02 02         [24]  327 	cjne	a, ar2, .+#5
      00002C EB               [12]  328 	mov	a, r3
      00002D F0               [24]  329 	movx	@dptr, a
      00002E 22               [24]  330 	ret
      00002F                        331 sdcc_atomic_exchange_rollback_end::
                                    332 
      00002F                        333 sdcc_atomic_exchange_gptr_impl::
      00002F 30 F6 E0         [24]  334 	jnb	b.6, sdcc_atomic_exchange_xdata_impl
      000032 A8 82            [24]  335 	mov	r0, dpl
      000034 20 F5 D3         [24]  336 	jb	b.5, sdcc_atomic_exchange_pdata_impl
      000037                        337 sdcc_atomic_exchange_idata_impl:
      000037 EA               [12]  338 	mov	a, r2
      000038 C6               [12]  339 	xch	a, @r0
      000039 F5 82            [12]  340 	mov	dpl, a
      00003B 22               [24]  341 	ret
      00003C                        342 sdcc_atomic_exchange_exit:
      00003C 8B 82            [24]  343 	mov	dpl, r3
      00003E 22               [24]  344 	ret
      00003F                        345 sdcc_atomic_compare_exchange_gptr_impl::
      00003F 30 F6 E6         [24]  346 	jnb	b.6, sdcc_atomic_compare_exchange_xdata_impl
      000042 A8 82            [24]  347 	mov	r0, dpl
      000044 20 F5 D9         [24]  348 	jb	b.5, sdcc_atomic_compare_exchange_pdata_impl
      000047 80 CF            [24]  349 	sjmp	sdcc_atomic_compare_exchange_idata_impl
                                    350 ;--------------------------------------------------------
                                    351 ; global & static initialisations
                                    352 ;--------------------------------------------------------
                                    353 	.area HOME    (CODE)
                                    354 	.area GSINIT  (CODE)
                                    355 	.area GSFINAL (CODE)
                                    356 	.area GSINIT  (CODE)
                                    357 	.globl __sdcc_gsinit_startup
                                    358 	.globl __sdcc_program_startup
                                    359 	.globl __start__stack
                                    360 	.globl __mcs51_genXINIT
                                    361 	.globl __mcs51_genXRAMCLEAR
                                    362 	.globl __mcs51_genRAMCLEAR
                                    363 	.area GSFINAL (CODE)
      00004C 02 00 49         [24]  364 	ljmp	__sdcc_program_startup
                                    365 ;--------------------------------------------------------
                                    366 ; Home
                                    367 ;--------------------------------------------------------
                                    368 	.area HOME    (CODE)
                                    369 	.area HOME    (CODE)
      000049                        370 __sdcc_program_startup:
      000049 02 00 98         [24]  371 	ljmp	_main
                                    372 ;	return from main will return to caller
                                    373 ;--------------------------------------------------------
                                    374 ; code
                                    375 ;--------------------------------------------------------
                                    376 	.area CSEG    (CODE)
                                    377 ;------------------------------------------------------------
                                    378 ;Allocation info for local variables in function 'Producer'
                                    379 ;------------------------------------------------------------
                                    380 ;	testcoop.c:103: void Producer(void)
                                    381 ;	-----------------------------------------
                                    382 ;	 function Producer
                                    383 ;	-----------------------------------------
      00004F                        384 _Producer:
                           000007   385 	ar7 = 0x07
                           000006   386 	ar6 = 0x06
                           000005   387 	ar5 = 0x05
                           000004   388 	ar4 = 0x04
                           000003   389 	ar3 = 0x03
                           000002   390 	ar2 = 0x02
                           000001   391 	ar1 = 0x01
                           000000   392 	ar0 = 0x00
                                    393 ;	testcoop.c:105: curr_char = 'A';
      00004F 75 32 41         [24]  394 	mov	_curr_char,#0x41
                                    395 ;	testcoop.c:111: while (data_ready == 1) {
      000052                        396 00101$:
      000052 74 01            [12]  397 	mov	a,#0x01
      000054 B5 30 05         [24]  398 	cjne	a,_data_ready,00103$
                                    399 ;	testcoop.c:112: ThreadYield();
      000057 12 01 47         [24]  400 	lcall	_ThreadYield
      00005A 80 F6            [24]  401 	sjmp	00101$
      00005C                        402 00103$:
                                    403 ;	testcoop.c:116: shared_buf = curr_char;
      00005C 85 32 31         [24]  404 	mov	_shared_buf,_curr_char
                                    405 ;	testcoop.c:117: data_ready = 1;
      00005F 75 30 01         [24]  406 	mov	_data_ready,#0x01
                                    407 ;	testcoop.c:120: curr_char++;
      000062 E5 32            [12]  408 	mov	a,_curr_char
      000064 04               [12]  409 	inc	a
      000065 F5 32            [12]  410 	mov	_curr_char,a
                                    411 ;	testcoop.c:121: if (curr_char > 'Z') {
      000067 E5 32            [12]  412 	mov	a,_curr_char
      000069 24 A5            [12]  413 	add	a,#0xff - 0x5a
      00006B 50 E5            [24]  414 	jnc	00101$
                                    415 ;	testcoop.c:122: curr_char = 'A';
      00006D 75 32 41         [24]  416 	mov	_curr_char,#0x41
                                    417 ;	testcoop.c:125: }
      000070 80 E0            [24]  418 	sjmp	00101$
                                    419 ;------------------------------------------------------------
                                    420 ;Allocation info for local variables in function 'Consumer'
                                    421 ;------------------------------------------------------------
                                    422 ;	testcoop.c:127: void Consumer(void)
                                    423 ;	-----------------------------------------
                                    424 ;	 function Consumer
                                    425 ;	-----------------------------------------
      000072                        426 _Consumer:
                                    427 ;	testcoop.c:130: TMOD = 0x20;
      000072 75 89 20         [24]  428 	mov	_TMOD,#0x20
                                    429 ;	testcoop.c:131: TH1 = 0xFA;   // Used Hex equivalent of -6
      000075 75 8D FA         [24]  430 	mov	_TH1,#0xfa
                                    431 ;	testcoop.c:132: SCON = 0x50;
      000078 75 98 50         [24]  432 	mov	_SCON,#0x50
                                    433 ;	testcoop.c:133: TR1 = 1;      // Used direct assignment instead of 2 - 1
                                    434 ;	assignBit
      00007B D2 8E            [12]  435 	setb	_TR1
                                    436 ;	testcoop.c:138: while (data_ready == 0) {
      00007D                        437 00101$:
      00007D E5 30            [12]  438 	mov	a,_data_ready
      00007F 70 05            [24]  439 	jnz	00103$
                                    440 ;	testcoop.c:139: ThreadYield();
      000081 12 01 47         [24]  441 	lcall	_ThreadYield
      000084 80 F7            [24]  442 	sjmp	00101$
      000086                        443 00103$:
                                    444 ;	testcoop.c:143: SBUF = shared_buf;
      000086 85 31 99         [24]  445 	mov	_SBUF,_shared_buf
                                    446 ;	testcoop.c:144: data_ready = 0;
      000089 75 30 00         [24]  447 	mov	_data_ready,#0x00
                                    448 ;	testcoop.c:147: while (TI == 0) {
      00008C                        449 00104$:
      00008C 20 99 05         [24]  450 	jb	_TI,00106$
                                    451 ;	testcoop.c:148: ThreadYield();
      00008F 12 01 47         [24]  452 	lcall	_ThreadYield
      000092 80 F8            [24]  453 	sjmp	00104$
      000094                        454 00106$:
                                    455 ;	testcoop.c:151: TI = 0; // Clear the transmit interrupt flag
                                    456 ;	assignBit
      000094 C2 99            [12]  457 	clr	_TI
                                    458 ;	testcoop.c:153: }
      000096 80 E5            [24]  459 	sjmp	00101$
                                    460 ;------------------------------------------------------------
                                    461 ;Allocation info for local variables in function 'main'
                                    462 ;------------------------------------------------------------
                                    463 ;	testcoop.c:155: void main(void)
                                    464 ;	-----------------------------------------
                                    465 ;	 function main
                                    466 ;	-----------------------------------------
      000098                        467 _main:
                                    468 ;	testcoop.c:157: data_ready = 0;
      000098 75 30 00         [24]  469 	mov	_data_ready,#0x00
                                    470 ;	testcoop.c:164: ThreadCreate(Consumer);
      00009B 90 00 72         [24]  471 	mov	dptr,#_Consumer
      00009E 12 00 C9         [24]  472 	lcall	_ThreadCreate
                                    473 ;	testcoop.c:165: Producer();
                                    474 ;	testcoop.c:166: }
      0000A1 02 00 4F         [24]  475 	ljmp	_Producer
                                    476 ;------------------------------------------------------------
                                    477 ;Allocation info for local variables in function '_sdcc_gsinit_startup'
                                    478 ;------------------------------------------------------------
                                    479 ;	testcoop.c:168: void _sdcc_gsinit_startup(void)
                                    480 ;	-----------------------------------------
                                    481 ;	 function _sdcc_gsinit_startup
                                    482 ;	-----------------------------------------
      0000A4                        483 __sdcc_gsinit_startup:
                                    484 ;	testcoop.c:172: __endasm;
      0000A4 02 00 AB         [24]  485 	LJMP	_Bootstrap
                                    486 ;	testcoop.c:173: }
      0000A7 22               [24]  487 	ret
                                    488 ;------------------------------------------------------------
                                    489 ;Allocation info for local variables in function '_mcs51_genRAMCLEAR'
                                    490 ;------------------------------------------------------------
                                    491 ;	testcoop.c:175: void _mcs51_genRAMCLEAR(void) {}
                                    492 ;	-----------------------------------------
                                    493 ;	 function _mcs51_genRAMCLEAR
                                    494 ;	-----------------------------------------
      0000A8                        495 __mcs51_genRAMCLEAR:
      0000A8 22               [24]  496 	ret
                                    497 ;------------------------------------------------------------
                                    498 ;Allocation info for local variables in function '_mcs51_genXINIT'
                                    499 ;------------------------------------------------------------
                                    500 ;	testcoop.c:176: void _mcs51_genXINIT(void) {}
                                    501 ;	-----------------------------------------
                                    502 ;	 function _mcs51_genXINIT
                                    503 ;	-----------------------------------------
      0000A9                        504 __mcs51_genXINIT:
      0000A9 22               [24]  505 	ret
                                    506 ;------------------------------------------------------------
                                    507 ;Allocation info for local variables in function '_mcs51_genXRAMCLEAR'
                                    508 ;------------------------------------------------------------
                                    509 ;	testcoop.c:177: void _mcs51_genXRAMCLEAR(void) {}
                                    510 ;	-----------------------------------------
                                    511 ;	 function _mcs51_genXRAMCLEAR
                                    512 ;	-----------------------------------------
      0000AA                        513 __mcs51_genXRAMCLEAR:
      0000AA 22               [24]  514 	ret
                                    515 	.area CSEG    (CODE)
                                    516 	.area CONST   (CODE)
                                    517 	.area XINIT   (CODE)
                                    518 	.area CABS    (ABS,CODE)
