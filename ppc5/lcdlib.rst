                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler
                                      3 ; Version 4.5.10 #15658 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module lcdlib
                                      6 	
                                      7 	.optsdcc -mmcs51 --model-small
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _CY
                                     12 	.globl _AC
                                     13 	.globl _F0
                                     14 	.globl _RS1
                                     15 	.globl _RS0
                                     16 	.globl _OV
                                     17 	.globl _F1
                                     18 	.globl _P
                                     19 	.globl _PS
                                     20 	.globl _PT1
                                     21 	.globl _PX1
                                     22 	.globl _PT0
                                     23 	.globl _PX0
                                     24 	.globl _RD
                                     25 	.globl _WR
                                     26 	.globl _T1
                                     27 	.globl _T0
                                     28 	.globl _INT1
                                     29 	.globl _INT0
                                     30 	.globl _TXD
                                     31 	.globl _RXD
                                     32 	.globl _P3_7
                                     33 	.globl _P3_6
                                     34 	.globl _P3_5
                                     35 	.globl _P3_4
                                     36 	.globl _P3_3
                                     37 	.globl _P3_2
                                     38 	.globl _P3_1
                                     39 	.globl _P3_0
                                     40 	.globl _EA
                                     41 	.globl _ES
                                     42 	.globl _ET1
                                     43 	.globl _EX1
                                     44 	.globl _ET0
                                     45 	.globl _EX0
                                     46 	.globl _P2_7
                                     47 	.globl _P2_6
                                     48 	.globl _P2_5
                                     49 	.globl _P2_4
                                     50 	.globl _P2_3
                                     51 	.globl _P2_2
                                     52 	.globl _P2_1
                                     53 	.globl _P2_0
                                     54 	.globl _SM0
                                     55 	.globl _SM1
                                     56 	.globl _SM2
                                     57 	.globl _REN
                                     58 	.globl _TB8
                                     59 	.globl _RB8
                                     60 	.globl _TI
                                     61 	.globl _RI
                                     62 	.globl _P1_7
                                     63 	.globl _P1_6
                                     64 	.globl _P1_5
                                     65 	.globl _P1_4
                                     66 	.globl _P1_3
                                     67 	.globl _P1_2
                                     68 	.globl _P1_1
                                     69 	.globl _P1_0
                                     70 	.globl _TF1
                                     71 	.globl _TR1
                                     72 	.globl _TF0
                                     73 	.globl _TR0
                                     74 	.globl _IE1
                                     75 	.globl _IT1
                                     76 	.globl _IE0
                                     77 	.globl _IT0
                                     78 	.globl _P0_7
                                     79 	.globl _P0_6
                                     80 	.globl _P0_5
                                     81 	.globl _P0_4
                                     82 	.globl _P0_3
                                     83 	.globl _P0_2
                                     84 	.globl _P0_1
                                     85 	.globl _P0_0
                                     86 	.globl _B
                                     87 	.globl _ACC
                                     88 	.globl _PSW
                                     89 	.globl _IP
                                     90 	.globl _P3
                                     91 	.globl _IE
                                     92 	.globl _P2
                                     93 	.globl _SBUF
                                     94 	.globl _SCON
                                     95 	.globl _P1
                                     96 	.globl _TH1
                                     97 	.globl _TH0
                                     98 	.globl _TL1
                                     99 	.globl _TL0
                                    100 	.globl _TMOD
                                    101 	.globl _TCON
                                    102 	.globl _PCON
                                    103 	.globl _DPH
                                    104 	.globl _DPL
                                    105 	.globl _SP
                                    106 	.globl _P0
                                    107 	.globl _LCD_set_symbol_PARM_2
                                    108 	.globl _lcd_ready
                                    109 	.globl _LCD_ready
                                    110 	.globl _LCD_Init
                                    111 	.globl _LCD_IRWrite
                                    112 	.globl _LCD_functionSet
                                    113 	.globl _LCD_write_char
                                    114 	.globl _LCD_write_string
                                    115 	.globl _LCD_set_symbol
                                    116 	.globl _delay
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
                           000020   232 _lcd_ready	=	0x0020
      000008                        233 _LCD_set_symbol_PARM_2:
      000008                        234 	.ds 2
                                    235 ;--------------------------------------------------------
                                    236 ; overlayable items in internal ram
                                    237 ;--------------------------------------------------------
                                    238 	.area	OSEG    (OVR,DATA)
                                    239 ;--------------------------------------------------------
                                    240 ; indirectly addressable internal ram data
                                    241 ;--------------------------------------------------------
                                    242 	.area ISEG    (DATA)
                                    243 ;--------------------------------------------------------
                                    244 ; absolute internal ram data
                                    245 ;--------------------------------------------------------
                                    246 	.area IABS    (ABS,DATA)
                                    247 	.area IABS    (ABS,DATA)
                                    248 ;--------------------------------------------------------
                                    249 ; bit data
                                    250 ;--------------------------------------------------------
                                    251 	.area BSEG    (BIT)
                                    252 ;--------------------------------------------------------
                                    253 ; paged external ram data
                                    254 ;--------------------------------------------------------
                                    255 	.area PSEG    (PAG,XDATA)
                                    256 ;--------------------------------------------------------
                                    257 ; uninitialized external ram data
                                    258 ;--------------------------------------------------------
                                    259 	.area XSEG    (XDATA)
                                    260 ;--------------------------------------------------------
                                    261 ; absolute external ram data
                                    262 ;--------------------------------------------------------
                                    263 	.area XABS    (ABS,XDATA)
                                    264 ;--------------------------------------------------------
                                    265 ; initialized external ram data
                                    266 ;--------------------------------------------------------
                                    267 	.area XISEG   (XDATA)
                                    268 	.area HOME    (CODE)
                                    269 	.area GSINIT0 (CODE)
                                    270 	.area GSINIT1 (CODE)
                                    271 	.area GSINIT2 (CODE)
                                    272 	.area GSINIT3 (CODE)
                                    273 	.area GSINIT4 (CODE)
                                    274 	.area GSINIT5 (CODE)
                                    275 	.area GSINIT  (CODE)
                                    276 	.area GSFINAL (CODE)
                                    277 	.area CSEG    (CODE)
                                    278 ;--------------------------------------------------------
                                    279 ; global & static initialisations
                                    280 ;--------------------------------------------------------
                                    281 	.area HOME    (CODE)
                                    282 	.area GSINIT  (CODE)
                                    283 	.area GSFINAL (CODE)
                                    284 	.area GSINIT  (CODE)
                                    285 ;--------------------------------------------------------
                                    286 ; Home
                                    287 ;--------------------------------------------------------
                                    288 	.area HOME    (CODE)
                                    289 	.area HOME    (CODE)
                                    290 ;--------------------------------------------------------
                                    291 ; code
                                    292 ;--------------------------------------------------------
                                    293 	.area CSEG    (CODE)
                                    294 ;------------------------------------------------------------
                                    295 ;Allocation info for local variables in function 'LCD_ready'
                                    296 ;------------------------------------------------------------
                                    297 ;	lcdlib.c:18: unsigned char LCD_ready(void) {
                                    298 ;	-----------------------------------------
                                    299 ;	 function LCD_ready
                                    300 ;	-----------------------------------------
      0005E9                        301 _LCD_ready:
                           000007   302 	ar7 = 0x07
                           000006   303 	ar6 = 0x06
                           000005   304 	ar5 = 0x05
                           000004   305 	ar4 = 0x04
                           000003   306 	ar3 = 0x03
                           000002   307 	ar2 = 0x02
                           000001   308 	ar1 = 0x01
                           000000   309 	ar0 = 0x00
                                    310 ;	lcdlib.c:19: return lcd_ready;
      0005E9 85 20 82         [24]  311 	mov	dpl, _lcd_ready
                                    312 ;	lcdlib.c:20: }
      0005EC 22               [24]  313 	ret
                                    314 ;------------------------------------------------------------
                                    315 ;Allocation info for local variables in function 'LCD_Init'
                                    316 ;------------------------------------------------------------
                                    317 ;	lcdlib.c:22: void LCD_Init(void) {
                                    318 ;	-----------------------------------------
                                    319 ;	 function LCD_Init
                                    320 ;	-----------------------------------------
      0005ED                        321 _LCD_Init:
                                    322 ;	lcdlib.c:23: LCD_functionSet();
      0005ED 12 06 40         [24]  323 	lcall	_LCD_functionSet
                                    324 ;	lcdlib.c:24: LCD_entryModeSet(1, 0);            // increment AC, no display shift
      0005F0 75 82 06         [24]  325 	mov	dpl, #0x06
      0005F3 12 06 00         [24]  326 	lcall	_LCD_IRWrite
                                    327 ;	lcdlib.c:25: LCD_displayOnOffControl(1, 1, 1);  // display on, cursor on and blinking
      0005F6 75 82 0F         [24]  328 	mov	dpl, #0x0f
      0005F9 12 06 00         [24]  329 	lcall	_LCD_IRWrite
                                    330 ;	lcdlib.c:26: lcd_ready = 1;
      0005FC 75 20 01         [24]  331 	mov	_lcd_ready,#0x01
                                    332 ;	lcdlib.c:27: }
      0005FF 22               [24]  333 	ret
                                    334 ;------------------------------------------------------------
                                    335 ;Allocation info for local variables in function 'LCD_IRWrite'
                                    336 ;------------------------------------------------------------
                                    337 ;c             Allocated to registers r7 
                                    338 ;k             Allocated to registers r7 
                                    339 ;------------------------------------------------------------
                                    340 ;	lcdlib.c:29: void LCD_IRWrite(char c) {
                                    341 ;	-----------------------------------------
                                    342 ;	 function LCD_IRWrite
                                    343 ;	-----------------------------------------
      000600                        344 _LCD_IRWrite:
      000600 AF 82            [24]  345 	mov	r7, dpl
                                    346 ;	lcdlib.c:31: lcd_ready = 0;
      000602 75 20 00         [24]  347 	mov	_lcd_ready,#0x00
                                    348 ;	lcdlib.c:32: DB = (c & 0xf0); // high nibble
      000605 74 F0            [12]  349 	mov	a,#0xf0
      000607 5F               [12]  350 	anl	a,r7
      000608 F5 90            [12]  351 	mov	_P1,a
                                    352 ;	lcdlib.c:33: E = 1; E = 0;
                                    353 ;	assignBit
      00060A D2 92            [12]  354 	setb	_P1_2
                                    355 ;	assignBit
      00060C C2 92            [12]  356 	clr	_P1_2
                                    357 ;	lcdlib.c:34: DB = (c << 4);   // low nibble
      00060E EF               [12]  358 	mov	a,r7
      00060F C4               [12]  359 	swap	a
      000610 54 F0            [12]  360 	anl	a,#0xf0
      000612 F5 90            [12]  361 	mov	_P1,a
                                    362 ;	lcdlib.c:35: E = 1; E = 0;
                                    363 ;	assignBit
      000614 D2 92            [12]  364 	setb	_P1_2
                                    365 ;	assignBit
      000616 C2 92            [12]  366 	clr	_P1_2
                                    367 ;	lcdlib.c:36: delay(DELAY_AMOUNT);
      000618 75 82 28         [24]  368 	mov	dpl, #0x28
      00061B C0 07            [24]  369 	push	ar7
      00061D 12 06 EC         [24]  370 	lcall	_delay
      000620 D0 07            [24]  371 	pop	ar7
                                    372 ;	lcdlib.c:38: if (c == CLEAR_DISPLAY || c == RETURN_HOME)
      000622 BF 01 02         [24]  373 	cjne	r7,#0x01,00122$
      000625 80 03            [24]  374 	sjmp	00110$
      000627                        375 00122$:
      000627 BF 02 12         [24]  376 	cjne	r7,#0x02,00103$
                                    377 ;	lcdlib.c:39: for (k = 0; k < 30; k++) delay(DELAY_AMOUNT);
      00062A                        378 00110$:
      00062A 7F 00            [12]  379 	mov	r7,#0x00
      00062C                        380 00105$:
      00062C 75 82 28         [24]  381 	mov	dpl, #0x28
      00062F C0 07            [24]  382 	push	ar7
      000631 12 06 EC         [24]  383 	lcall	_delay
      000634 D0 07            [24]  384 	pop	ar7
      000636 0F               [12]  385 	inc	r7
      000637 BF 1E 00         [24]  386 	cjne	r7,#0x1e,00125$
      00063A                        387 00125$:
      00063A 40 F0            [24]  388 	jc	00105$
      00063C                        389 00103$:
                                    390 ;	lcdlib.c:40: lcd_ready = 1;
      00063C 75 20 01         [24]  391 	mov	_lcd_ready,#0x01
                                    392 ;	lcdlib.c:41: }
      00063F 22               [24]  393 	ret
                                    394 ;------------------------------------------------------------
                                    395 ;Allocation info for local variables in function 'LCD_functionSet'
                                    396 ;------------------------------------------------------------
                                    397 ;	lcdlib.c:43: void LCD_functionSet(void) {
                                    398 ;	-----------------------------------------
                                    399 ;	 function LCD_functionSet
                                    400 ;	-----------------------------------------
      000640                        401 _LCD_functionSet:
                                    402 ;	lcdlib.c:44: lcd_ready = 0;
      000640 75 20 00         [24]  403 	mov	_lcd_ready,#0x00
                                    404 ;	lcdlib.c:46: DB = 0x20;
      000643 75 90 20         [24]  405 	mov	_P1,#0x20
                                    406 ;	lcdlib.c:47: E = 1; E = 0;
                                    407 ;	assignBit
      000646 D2 92            [12]  408 	setb	_P1_2
                                    409 ;	assignBit
      000648 C2 92            [12]  410 	clr	_P1_2
                                    411 ;	lcdlib.c:48: delay(DELAY_AMOUNT);
      00064A 75 82 28         [24]  412 	mov	dpl, #0x28
      00064D 12 06 EC         [24]  413 	lcall	_delay
                                    414 ;	lcdlib.c:49: E = 1; E = 0;
                                    415 ;	assignBit
      000650 D2 92            [12]  416 	setb	_P1_2
                                    417 ;	assignBit
      000652 C2 92            [12]  418 	clr	_P1_2
                                    419 ;	lcdlib.c:50: delay(DELAY_AMOUNT);
      000654 75 82 28         [24]  420 	mov	dpl, #0x28
      000657 12 06 EC         [24]  421 	lcall	_delay
                                    422 ;	lcdlib.c:51: DB7 = 1; // 2-line mode
                                    423 ;	assignBit
      00065A D2 97            [12]  424 	setb	_P1_7
                                    425 ;	lcdlib.c:52: E = 1; E = 0;
                                    426 ;	assignBit
      00065C D2 92            [12]  427 	setb	_P1_2
                                    428 ;	assignBit
      00065E C2 92            [12]  429 	clr	_P1_2
                                    430 ;	lcdlib.c:53: delay(DELAY_AMOUNT);
      000660 75 82 28         [24]  431 	mov	dpl, #0x28
      000663 12 06 EC         [24]  432 	lcall	_delay
                                    433 ;	lcdlib.c:54: lcd_ready = 1;
      000666 75 20 01         [24]  434 	mov	_lcd_ready,#0x01
                                    435 ;	lcdlib.c:55: }
      000669 22               [24]  436 	ret
                                    437 ;------------------------------------------------------------
                                    438 ;Allocation info for local variables in function 'LCD_write_char'
                                    439 ;------------------------------------------------------------
                                    440 ;c             Allocated to registers r7 
                                    441 ;------------------------------------------------------------
                                    442 ;	lcdlib.c:57: void LCD_write_char(char c) {
                                    443 ;	-----------------------------------------
                                    444 ;	 function LCD_write_char
                                    445 ;	-----------------------------------------
      00066A                        446 _LCD_write_char:
      00066A AF 82            [24]  447 	mov	r7, dpl
                                    448 ;	lcdlib.c:58: lcd_ready = 0;
      00066C 75 20 00         [24]  449 	mov	_lcd_ready,#0x00
                                    450 ;	lcdlib.c:59: DB = (c & 0xf0) | 0x08; // high nibble, RS=1
      00066F 74 F0            [12]  451 	mov	a,#0xf0
      000671 5F               [12]  452 	anl	a,r7
      000672 44 08            [12]  453 	orl	a,#0x08
      000674 F5 90            [12]  454 	mov	_P1,a
                                    455 ;	lcdlib.c:60: RS = 1;
                                    456 ;	assignBit
      000676 D2 93            [12]  457 	setb	_P1_3
                                    458 ;	lcdlib.c:61: E = 1; E = 0;
                                    459 ;	assignBit
      000678 D2 92            [12]  460 	setb	_P1_2
                                    461 ;	assignBit
      00067A C2 92            [12]  462 	clr	_P1_2
                                    463 ;	lcdlib.c:62: DB = (c << 4) | 0x08;   // low nibble, RS=1
      00067C EF               [12]  464 	mov	a,r7
      00067D C4               [12]  465 	swap	a
      00067E 54 F0            [12]  466 	anl	a,#0xf0
      000680 FF               [12]  467 	mov	r7,a
      000681 74 08            [12]  468 	mov	a,#0x08
      000683 4F               [12]  469 	orl	a,r7
      000684 F5 90            [12]  470 	mov	_P1,a
                                    471 ;	lcdlib.c:63: E = 1; E = 0;
                                    472 ;	assignBit
      000686 D2 92            [12]  473 	setb	_P1_2
                                    474 ;	assignBit
      000688 C2 92            [12]  475 	clr	_P1_2
                                    476 ;	lcdlib.c:64: delay(DELAY_AMOUNT);
      00068A 75 82 28         [24]  477 	mov	dpl, #0x28
      00068D 12 06 EC         [24]  478 	lcall	_delay
                                    479 ;	lcdlib.c:65: lcd_ready = 1;
      000690 75 20 01         [24]  480 	mov	_lcd_ready,#0x01
                                    481 ;	lcdlib.c:66: }
      000693 22               [24]  482 	ret
                                    483 ;------------------------------------------------------------
                                    484 ;Allocation info for local variables in function 'LCD_write_string'
                                    485 ;------------------------------------------------------------
                                    486 ;str           Allocated to registers 
                                    487 ;------------------------------------------------------------
                                    488 ;	lcdlib.c:68: void LCD_write_string(char *str) {
                                    489 ;	-----------------------------------------
                                    490 ;	 function LCD_write_string
                                    491 ;	-----------------------------------------
      000694                        492 _LCD_write_string:
      000694 AD 82            [24]  493 	mov	r5, dpl
      000696 AE 83            [24]  494 	mov	r6, dph
      000698 AF F0            [24]  495 	mov	r7, b
                                    496 ;	lcdlib.c:69: while (*str) {
      00069A                        497 00101$:
      00069A 8D 82            [24]  498 	mov	dpl,r5
      00069C 8E 83            [24]  499 	mov	dph,r6
      00069E 8F F0            [24]  500 	mov	b,r7
      0006A0 12 07 7F         [24]  501 	lcall	__gptrget
      0006A3 FC               [12]  502 	mov	r4,a
      0006A4 60 18            [24]  503 	jz	00104$
                                    504 ;	lcdlib.c:70: LCD_write_char(*str);
      0006A6 8C 82            [24]  505 	mov	dpl, r4
      0006A8 C0 07            [24]  506 	push	ar7
      0006AA C0 06            [24]  507 	push	ar6
      0006AC C0 05            [24]  508 	push	ar5
      0006AE 12 06 6A         [24]  509 	lcall	_LCD_write_char
      0006B1 D0 05            [24]  510 	pop	ar5
      0006B3 D0 06            [24]  511 	pop	ar6
      0006B5 D0 07            [24]  512 	pop	ar7
                                    513 ;	lcdlib.c:71: str++;
      0006B7 0D               [12]  514 	inc	r5
      0006B8 BD 00 DF         [24]  515 	cjne	r5,#0x00,00101$
      0006BB 0E               [12]  516 	inc	r6
      0006BC 80 DC            [24]  517 	sjmp	00101$
      0006BE                        518 00104$:
                                    519 ;	lcdlib.c:73: }
      0006BE 22               [24]  520 	ret
                                    521 ;------------------------------------------------------------
                                    522 ;Allocation info for local variables in function 'LCD_set_symbol'
                                    523 ;------------------------------------------------------------
                                    524 ;symb          Allocated with name '_LCD_set_symbol_PARM_2'
                                    525 ;code          Allocated to registers r7 
                                    526 ;i             Allocated to registers r7 
                                    527 ;------------------------------------------------------------
                                    528 ;	lcdlib.c:76: void LCD_set_symbol(char code, __code const char *symb) {
                                    529 ;	-----------------------------------------
                                    530 ;	 function LCD_set_symbol
                                    531 ;	-----------------------------------------
      0006BF                        532 _LCD_set_symbol:
      0006BF AF 82            [24]  533 	mov	r7, dpl
                                    534 ;	lcdlib.c:78: LCD_setCgRamAddress(code);
      0006C1 74 40            [12]  535 	mov	a,#0x40
      0006C3 4F               [12]  536 	orl	a,r7
      0006C4 F5 82            [12]  537 	mov	dpl,a
      0006C6 12 06 00         [24]  538 	lcall	_LCD_IRWrite
                                    539 ;	lcdlib.c:79: for (i = 0; i < 8; i++)
      0006C9 7F 00            [12]  540 	mov	r7,#0x00
      0006CB                        541 00102$:
                                    542 ;	lcdlib.c:80: LCD_write_char(symb[i]);
      0006CB EF               [12]  543 	mov	a,r7
      0006CC 25 08            [12]  544 	add	a, _LCD_set_symbol_PARM_2
      0006CE F5 82            [12]  545 	mov	dpl,a
      0006D0 E4               [12]  546 	clr	a
      0006D1 35 09            [12]  547 	addc	a, (_LCD_set_symbol_PARM_2 + 1)
      0006D3 F5 83            [12]  548 	mov	dph,a
      0006D5 E4               [12]  549 	clr	a
      0006D6 93               [24]  550 	movc	a,@a+dptr
      0006D7 F5 82            [12]  551 	mov	dpl,a
      0006D9 C0 07            [24]  552 	push	ar7
      0006DB 12 06 6A         [24]  553 	lcall	_LCD_write_char
      0006DE D0 07            [24]  554 	pop	ar7
                                    555 ;	lcdlib.c:79: for (i = 0; i < 8; i++)
      0006E0 0F               [12]  556 	inc	r7
      0006E1 BF 08 00         [24]  557 	cjne	r7,#0x08,00119$
      0006E4                        558 00119$:
      0006E4 40 E5            [24]  559 	jc	00102$
                                    560 ;	lcdlib.c:81: LCD_setDdRamAddress(0x00); // return to DD RAM for display
      0006E6 75 82 80         [24]  561 	mov	dpl, #0x80
                                    562 ;	lcdlib.c:82: }
      0006E9 02 06 00         [24]  563 	ljmp	_LCD_IRWrite
                                    564 ;------------------------------------------------------------
                                    565 ;Allocation info for local variables in function 'delay'
                                    566 ;------------------------------------------------------------
                                    567 ;n             Allocated to registers 
                                    568 ;------------------------------------------------------------
                                    569 ;	lcdlib.c:84: void delay(unsigned char n) {
                                    570 ;	-----------------------------------------
                                    571 ;	 function delay
                                    572 ;	-----------------------------------------
      0006EC                        573 _delay:
                                    574 ;	lcdlib.c:87: { __asm dhere: djnz dpl, dhere __endasm; }
      0006EC                        575 dhere:
      0006EC D5 82 FD         [24]  576 	djnz dpl, dhere 
                                    577 ;	lcdlib.c:88: }
      0006EF 22               [24]  578 	ret
                                    579 	.area CSEG    (CODE)
                                    580 	.area CONST   (CODE)
                                    581 	.area XINIT   (CODE)
                                    582 	.area CABS    (ABS,CODE)
