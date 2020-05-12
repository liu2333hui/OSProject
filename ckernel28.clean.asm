
CMain:  ; Function begin
        push    ebp                                     ; 0000 _ 55
        mov     ebp, esp                                ; 0001 _ 89. E5
        push    esi                                     ; 0003 _ 56
        push    ebx                                     ; 0004 _ 53
        sub     esp, 48                                 ; 0005 _ 83. EC, 30
        sub     esp, 12                                 ; 0008 _ 83. EC, 0C
        push    bootInfo                                ; 000B _ 68, 00000000(d)
        call    initBootInfo                            ; 0010 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0015 _ 83. C4, 10
        mov     eax, dword [bootInfo]                   ; 0018 _ A1, 00000000(d)
        mov     dword [ebp-30H], eax                    ; 001D _ 89. 45, D0
        movzx   eax, word [?_172]                       ; 0020 _ 0F B7. 05, 00000004(d)
        cwde                                            ; 0027 _ 98
        mov     dword [xsize], eax                      ; 0028 _ A3, 00000200(d)
        movzx   eax, word [?_173]                       ; 002D _ 0F B7. 05, 00000006(d)
        cwde                                            ; 0034 _ 98
        mov     dword [ysize], eax                      ; 0035 _ A3, 00000204(d)
        mov     eax, dword [bootInfo]                   ; 003A _ A1, 00000000(d)
        mov     dword [ebp-2CH], eax                    ; 003F _ 89. 45, D4
        mov     dword [ebp-28H], 0                      ; 0042 _ C7. 45, D8, 00000000
        mov     dword [ebp-24H], 0                      ; 0049 _ C7. 45, DC, 00000000
        sub     esp, 4                                  ; 0050 _ 83. EC, 04
        push    mousebuf                                ; 0053 _ 68, 00000040(d)
        push    128                                     ; 0058 _ 68, 00000080
        push    mouseinfo                               ; 005D _ 68, 00000008(d)
        call    fifo8_init                              ; 0062 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0067 _ 83. C4, 10
        sub     esp, 4                                  ; 006A _ 83. EC, 04
        push    keybuf                                  ; 006D _ 68, 000000C0(d)
        push    32                                      ; 0072 _ 6A, 20
        push    keyinfo                                 ; 0074 _ 68, 00000020(d)
        call    fifo8_init                              ; 0079 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 007E _ 83. C4, 10
        call    init_palette                            ; 0081 _ E8, FFFFFFFC(rel)
        call    init_keyboard                           ; 0086 _ E8, FFFFFFFC(rel)
        call    get_memory_block_count                  ; 008B _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 0090 _ 89. 45, E0
        call    get_adr_buffer                          ; 0093 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 0098 _ 89. 45, E4
        mov     eax, dword [memman]                     ; 009B _ A1, 00000000(d)
        sub     esp, 12                                 ; 00A0 _ 83. EC, 0C
        push    eax                                     ; 00A3 _ 50
        call    memman_init                             ; 00A4 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00A9 _ 83. C4, 10
        mov     eax, dword [memman]                     ; 00AC _ A1, 00000000(d)
        sub     esp, 4                                  ; 00B1 _ 83. EC, 04
        push    534609920                               ; 00B4 _ 68, 1FDD8000
        push    1081344                                 ; 00B9 _ 68, 00108000
        push    eax                                     ; 00BE _ 50
        call    memman_free                             ; 00BF _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00C4 _ 83. C4, 10
        mov     ecx, dword [ysize]                      ; 00C7 _ 8B. 0D, 00000204(d)
        mov     edx, dword [xsize]                      ; 00CD _ 8B. 15, 00000200(d)
        mov     eax, dword [memman]                     ; 00D3 _ A1, 00000000(d)
        push    ecx                                     ; 00D8 _ 51
        push    edx                                     ; 00D9 _ 52
        push    dword [ebp-30H]                         ; 00DA _ FF. 75, D0
        push    eax                                     ; 00DD _ 50
        call    shtctl_init                             ; 00DE _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00E3 _ 83. C4, 10
        mov     dword [ebp-18H], eax                    ; 00E6 _ 89. 45, E8
        sub     esp, 12                                 ; 00E9 _ 83. EC, 0C
        push    dword [ebp-18H]                         ; 00EC _ FF. 75, E8
        call    sheet_alloc                             ; 00EF _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00F4 _ 83. C4, 10
        mov     dword [ebp-28H], eax                    ; 00F7 _ 89. 45, D8
        sub     esp, 12                                 ; 00FA _ 83. EC, 0C
        push    dword [ebp-18H]                         ; 00FD _ FF. 75, E8
        call    sheet_alloc                             ; 0100 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0105 _ 83. C4, 10
        mov     dword [ebp-24H], eax                    ; 0108 _ 89. 45, DC
        mov     edx, dword [xsize]                      ; 010B _ 8B. 15, 00000200(d)
        mov     eax, dword [ysize]                      ; 0111 _ A1, 00000204(d)
        imul    eax, edx                                ; 0116 _ 0F AF. C2
        mov     edx, eax                                ; 0119 _ 89. C2
        mov     eax, dword [memman]                     ; 011B _ A1, 00000000(d)
        sub     esp, 8                                  ; 0120 _ 83. EC, 08
        push    edx                                     ; 0123 _ 52
        push    eax                                     ; 0124 _ 50
        call    memman_alloc_4k                         ; 0125 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 012A _ 83. C4, 10
        mov     dword [buf_back], eax                   ; 012D _ A3, 000000F8(d)
        mov     ecx, dword [ysize]                      ; 0132 _ 8B. 0D, 00000204(d)
        mov     edx, dword [xsize]                      ; 0138 _ 8B. 15, 00000200(d)
        mov     eax, dword [buf_back]                   ; 013E _ A1, 000000F8(d)
        sub     esp, 12                                 ; 0143 _ 83. EC, 0C
        push    99                                      ; 0146 _ 6A, 63
        push    ecx                                     ; 0148 _ 51
        push    edx                                     ; 0149 _ 52
        push    eax                                     ; 014A _ 50
        push    dword [ebp-28H]                         ; 014B _ FF. 75, D8
        call    sheet_setbuf                            ; 014E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0153 _ 83. C4, 20
        sub     esp, 12                                 ; 0156 _ 83. EC, 0C
        push    99                                      ; 0159 _ 6A, 63
        push    16                                      ; 015B _ 6A, 10
        push    16                                      ; 015D _ 6A, 10
        push    buf_mouse                               ; 015F _ 68, 00000100(d)
        push    dword [ebp-24H]                         ; 0164 _ FF. 75, DC
        call    sheet_setbuf                            ; 0167 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 016C _ 83. C4, 20
        mov     ecx, dword [ysize]                      ; 016F _ 8B. 0D, 00000204(d)
        mov     edx, dword [xsize]                      ; 0175 _ 8B. 15, 00000200(d)
        mov     eax, dword [buf_back]                   ; 017B _ A1, 000000F8(d)
        sub     esp, 4                                  ; 0180 _ 83. EC, 04
        push    ecx                                     ; 0183 _ 51
        push    edx                                     ; 0184 _ 52
        push    eax                                     ; 0185 _ 50
        call    init_screen8                            ; 0186 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 018B _ 83. C4, 10
        sub     esp, 8                                  ; 018E _ 83. EC, 08
        push    99                                      ; 0191 _ 6A, 63
        push    buf_mouse                               ; 0193 _ 68, 00000100(d)
        call    init_mouse_cursor                       ; 0198 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 019D _ 83. C4, 10
        push    0                                       ; 01A0 _ 6A, 00
        push    0                                       ; 01A2 _ 6A, 00
        push    dword [ebp-28H]                         ; 01A4 _ FF. 75, D8
        push    dword [ebp-18H]                         ; 01A7 _ FF. 75, E8
        call    sheet_slide                             ; 01AA _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 01AF _ 83. C4, 10
        mov     eax, dword [xsize]                      ; 01B2 _ A1, 00000200(d)
        sub     eax, 16                                 ; 01B7 _ 83. E8, 10
        mov     edx, eax                                ; 01BA _ 89. C2
        shr     edx, 31                                 ; 01BC _ C1. EA, 1F
        add     eax, edx                                ; 01BF _ 01. D0
        sar     eax, 1                                  ; 01C1 _ D1. F8
        mov     dword [mx], eax                         ; 01C3 _ A3, 000000F0(d)
        mov     eax, dword [ysize]                      ; 01C8 _ A1, 00000204(d)
        sub     eax, 44                                 ; 01CD _ 83. E8, 2C
        mov     edx, eax                                ; 01D0 _ 89. C2
        shr     edx, 31                                 ; 01D2 _ C1. EA, 1F
        add     eax, edx                                ; 01D5 _ 01. D0
        sar     eax, 1                                  ; 01D7 _ D1. F8
        mov     dword [my], eax                         ; 01D9 _ A3, 000000F4(d)
        mov     edx, dword [my]                         ; 01DE _ 8B. 15, 000000F4(d)
        mov     eax, dword [mx]                         ; 01E4 _ A1, 000000F0(d)
        push    edx                                     ; 01E9 _ 52
        push    eax                                     ; 01EA _ 50
        push    dword [ebp-24H]                         ; 01EB _ FF. 75, DC
        push    dword [ebp-18H]                         ; 01EE _ FF. 75, E8
        call    sheet_slide                             ; 01F1 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 01F6 _ 83. C4, 10
        sub     esp, 8                                  ; 01F9 _ 83. EC, 08
        push    ?_160                                   ; 01FC _ 68, 00000000(d)
        push    dword [ebp-18H]                         ; 0201 _ FF. 75, E8
        call    message_box                             ; 0204 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0209 _ 83. C4, 10
        mov     dword [shtMsgBox], eax                  ; 020C _ A3, 00000278(d)
        sub     esp, 4                                  ; 0211 _ 83. EC, 04
        push    0                                       ; 0214 _ 6A, 00
        push    dword [ebp-28H]                         ; 0216 _ FF. 75, D8
        push    dword [ebp-18H]                         ; 0219 _ FF. 75, E8
        call    sheet_updown                            ; 021C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0221 _ 83. C4, 10
        sub     esp, 4                                  ; 0224 _ 83. EC, 04
        push    100                                     ; 0227 _ 6A, 64
        push    dword [ebp-24H]                         ; 0229 _ FF. 75, DC
        push    dword [ebp-18H]                         ; 022C _ FF. 75, E8
        call    sheet_updown                            ; 022F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0234 _ 83. C4, 10
        mov     eax, dword [memman]                     ; 0237 _ A1, 00000000(d)
        sub     esp, 12                                 ; 023C _ 83. EC, 0C
        push    eax                                     ; 023F _ 50
        call    init_pit                                ; 0240 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0245 _ 83. C4, 10
        mov     dword [timerctl], eax                   ; 0248 _ A3, 00000208(d)
        sub     esp, 4                                  ; 024D _ 83. EC, 04
        push    timerbuf1                               ; 0250 _ 68, 00000260(d)
        push    8                                       ; 0255 _ 6A, 08
        push    timerfifo1                              ; 0257 _ 68, 00000218(d)
        call    fifo8_init                              ; 025C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0261 _ 83. C4, 10
        mov     eax, dword [timerctl]                   ; 0264 _ A1, 00000208(d)
        sub     esp, 12                                 ; 0269 _ 83. EC, 0C
        push    eax                                     ; 026C _ 50
        call    timer_alloc                             ; 026D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0272 _ 83. C4, 10
        mov     dword [timer1], eax                     ; 0275 _ A3, 0000020C(d)
        mov     eax, dword [timerctl]                   ; 027A _ A1, 00000208(d)
        sub     esp, 12                                 ; 027F _ 83. EC, 0C
        push    eax                                     ; 0282 _ 50
        call    timer_alloc                             ; 0283 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0288 _ 83. C4, 10
        mov     dword [timer2], eax                     ; 028B _ A3, 00000210(d)
        mov     eax, dword [timerctl]                   ; 0290 _ A1, 00000208(d)
        sub     esp, 12                                 ; 0295 _ 83. EC, 0C
        push    eax                                     ; 0298 _ 50
        call    timer_alloc                             ; 0299 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 029E _ 83. C4, 10
        mov     dword [timer3], eax                     ; 02A1 _ A3, 00000214(d)
        mov     edx, dword [timer1]                     ; 02A6 _ 8B. 15, 0000020C(d)
        mov     eax, dword [timerctl]                   ; 02AC _ A1, 00000208(d)
        push    10                                      ; 02B1 _ 6A, 0A
        push    timerfifo1                              ; 02B3 _ 68, 00000218(d)
        push    edx                                     ; 02B8 _ 52
        push    eax                                     ; 02B9 _ 50
        call    timer_init                              ; 02BA _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 02BF _ 83. C4, 10
        mov     edx, dword [timer2]                     ; 02C2 _ 8B. 15, 00000210(d)
        mov     eax, dword [timerctl]                   ; 02C8 _ A1, 00000208(d)
        push    2                                       ; 02CD _ 6A, 02
        push    timerfifo1                              ; 02CF _ 68, 00000218(d)
        push    edx                                     ; 02D4 _ 52
        push    eax                                     ; 02D5 _ 50
        call    timer_init                              ; 02D6 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 02DB _ 83. C4, 10
        mov     edx, dword [timer3]                     ; 02DE _ 8B. 15, 00000214(d)
        mov     eax, dword [timerctl]                   ; 02E4 _ A1, 00000208(d)
        push    1                                       ; 02E9 _ 6A, 01
        push    timerfifo1                              ; 02EB _ 68, 00000218(d)
        push    edx                                     ; 02F0 _ 52
        push    eax                                     ; 02F1 _ 50
        call    timer_init                              ; 02F2 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 02F7 _ 83. C4, 10
        mov     edx, dword [timer1]                     ; 02FA _ 8B. 15, 0000020C(d)
        mov     eax, dword [timerctl]                   ; 0300 _ A1, 00000208(d)
        sub     esp, 4                                  ; 0305 _ 83. EC, 04
        push    500                                     ; 0308 _ 68, 000001F4
        push    edx                                     ; 030D _ 52
        push    eax                                     ; 030E _ 50
        call    timer_settime                           ; 030F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0314 _ 83. C4, 10
        mov     edx, dword [timer2]                     ; 0317 _ 8B. 15, 00000210(d)
        mov     eax, dword [timerctl]                   ; 031D _ A1, 00000208(d)
        sub     esp, 4                                  ; 0322 _ 83. EC, 04
        push    300                                     ; 0325 _ 68, 0000012C
        push    edx                                     ; 032A _ 52
        push    eax                                     ; 032B _ 50
        call    timer_settime                           ; 032C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0331 _ 83. C4, 10
        mov     edx, dword [timer3]                     ; 0334 _ 8B. 15, 00000214(d)
        mov     eax, dword [timerctl]                   ; 033A _ A1, 00000208(d)
        sub     esp, 4                                  ; 033F _ 83. EC, 04
        push    50                                      ; 0342 _ 6A, 32
        push    edx                                     ; 0344 _ 52
        push    eax                                     ; 0345 _ 50
        call    timer_settime                           ; 0346 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 034B _ 83. C4, 10
        call    io_sti                                  ; 034E _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 0353 _ 83. EC, 0C
        push    mdec                                    ; 0356 _ 68, 000000E0(d)
        call    enable_mouse                            ; 035B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0360 _ 83. C4, 10
        mov     dword [ebp-34H], 0                      ; 0363 _ C7. 45, CC, 00000000
        mov     dword [ebp-14H], 0                      ; 036A _ C7. 45, EC, 00000000
        mov     dword [ebp-10H], 0                      ; 0371 _ C7. 45, F0, 00000000
        mov     byte [charData.1749], 0                 ; 0378 _ C6. 05, 0000027C(d), 00
        mov     byte [?_175], 0                         ; 037F _ C6. 05, 0000027D(d), 00
?_001:  mov     eax, dword [timer1]                     ; 0386 _ A1, 0000020C(d)
        mov     eax, dword [eax+4H]                     ; 038B _ 8B. 40, 04
        sub     esp, 12                                 ; 038E _ 83. EC, 0C
        push    eax                                     ; 0391 _ 50
        call    intToHexStr                             ; 0392 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0397 _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 039A _ 89. 45, F4
        call    io_cli                                  ; 039D _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 03A2 _ 83. EC, 0C
        push    keyinfo                                 ; 03A5 _ 68, 00000020(d)
        call    fifo8_status                            ; 03AA _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03AF _ 83. C4, 10
        mov     ebx, eax                                ; 03B2 _ 89. C3
        sub     esp, 12                                 ; 03B4 _ 83. EC, 0C
        push    mouseinfo                               ; 03B7 _ 68, 00000008(d)
        call    fifo8_status                            ; 03BC _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03C1 _ 83. C4, 10
        add     ebx, eax                                ; 03C4 _ 01. C3
        sub     esp, 12                                 ; 03C6 _ 83. EC, 0C
        push    timerfifo1                              ; 03C9 _ 68, 00000218(d)
        call    fifo8_status                            ; 03CE _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03D3 _ 83. C4, 10
        add     eax, ebx                                ; 03D6 _ 01. D8
        test    eax, eax                                ; 03D8 _ 85. C0
        jnz     ?_002                                   ; 03DA _ 75, 07
        call    io_sti                                  ; 03DC _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 03E1 _ EB, A3
; CMain End of function

?_002:  ; Local function
        sub     esp, 12                                 ; 03E3 _ 83. EC, 0C
        push    keyinfo                                 ; 03E6 _ 68, 00000020(d)
        call    fifo8_status                            ; 03EB _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03F0 _ 83. C4, 10
        test    eax, eax                                ; 03F3 _ 85. C0
        je      ?_006                                   ; 03F5 _ 0F 84, 00000232
        call    io_sti                                  ; 03FB _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-34H]                    ; 0400 _ 8B. 45, CC
        mov     dword [ebp-14H], eax                    ; 0403 _ 89. 45, EC
        sub     esp, 12                                 ; 0406 _ 83. EC, 0C
        push    keyinfo                                 ; 0409 _ 68, 00000020(d)
        call    fifo8_get                               ; 040E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0413 _ 83. C4, 10
        mov     dword [ebp-34H], eax                    ; 0416 _ 89. 45, CC
        cmp     dword [ebp-34H], 28                     ; 0419 _ 83. 7D, CC, 1C
        jnz     ?_003                                   ; 041D _ 75, 6B
        mov     ebx, dword [xsize]                      ; 041F _ 8B. 1D, 00000200(d)
        mov     ecx, dword [count.1746]                 ; 0425 _ 8B. 0D, 00000280(d)
        mov     edx, dword [buf_back]                   ; 042B _ 8B. 15, 000000F8(d)
        mov     eax, dword [count.1746]                 ; 0431 _ A1, 00000280(d)
        mov     esi, eax                                ; 0436 _ 89. C6
        mov     eax, esi                                ; 0438 _ 89. F0
        shl     eax, 2                                  ; 043A _ C1. E0, 02
        add     eax, esi                                ; 043D _ 01. F0
        shl     eax, 2                                  ; 043F _ C1. E0, 02
        mov     esi, eax                                ; 0442 _ 89. C6
        mov     eax, dword [ebp-1CH]                    ; 0444 _ 8B. 45, E4
        add     eax, esi                                ; 0447 _ 01. F0
        sub     esp, 4                                  ; 0449 _ 83. EC, 04
        push    7                                       ; 044C _ 6A, 07
        push    ebx                                     ; 044E _ 53
        push    ecx                                     ; 044F _ 51
        push    edx                                     ; 0450 _ 52
        push    eax                                     ; 0451 _ 50
        push    dword [ebp-28H]                         ; 0452 _ FF. 75, D8
        push    dword [ebp-18H]                         ; 0455 _ FF. 75, E8
        call    showMemoryInfo                          ; 0458 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 045D _ 83. C4, 20
        mov     eax, dword [count.1746]                 ; 0460 _ A1, 00000280(d)
        add     eax, 1                                  ; 0465 _ 83. C0, 01
        mov     dword [count.1746], eax                 ; 0468 _ A3, 00000280(d)
        mov     eax, dword [count.1746]                 ; 046D _ A1, 00000280(d)
        cmp     dword [ebp-20H], eax                    ; 0472 _ 39. 45, E0
        jge     ?_005                                   ; 0475 _ 0F 8D, 0000013E
        mov     dword [count.1746], 0                   ; 047B _ C7. 05, 00000280(d), 00000000
        jmp     ?_005                                   ; 0485 _ E9, 0000012F

?_003:  mov     eax, dword [ebp-34H]                    ; 048A _ 8B. 45, CC
        add     eax, keytable                           ; 048D _ 05, 00000020(d)
        movzx   eax, byte [eax]                         ; 0492 _ 0F B6. 00
        test    al, al                                  ; 0495 _ 84. C0
        je      ?_005                                   ; 0497 _ 0F 84, 0000011C
        cmp     dword [ebp-34H], 127                    ; 049D _ 83. 7D, CC, 7F
        jg      ?_005                                   ; 04A1 _ 0F 8F, 00000112
        mov     eax, dword [cursor_x.1750]              ; 04A7 _ A1, 00000074(d)
        lea     ebx, [eax+7H]                           ; 04AC _ 8D. 58, 07
        mov     ecx, dword [cursor_x.1750]              ; 04AF _ 8B. 0D, 00000074(d)
        mov     eax, dword [shtMsgBox]                  ; 04B5 _ A1, 00000278(d)
        mov     edx, dword [eax+4H]                     ; 04BA _ 8B. 50, 04
        mov     eax, dword [shtMsgBox]                  ; 04BD _ A1, 00000278(d)
        mov     eax, dword [eax]                        ; 04C2 _ 8B. 00
        sub     esp, 4                                  ; 04C4 _ 83. EC, 04
        push    43                                      ; 04C7 _ 6A, 2B
        push    ebx                                     ; 04C9 _ 53
        push    28                                      ; 04CA _ 6A, 1C
        push    ecx                                     ; 04CC _ 51
        push    7                                       ; 04CD _ 6A, 07
        push    edx                                     ; 04CF _ 52
        push    eax                                     ; 04D0 _ 50
        call    boxfill8                                ; 04D1 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 04D6 _ 83. C4, 20
        mov     eax, dword [cursor_x.1750]              ; 04D9 _ A1, 00000074(d)
        lea     ecx, [eax+8H]                           ; 04DE _ 8D. 48, 08
        mov     edx, dword [cursor_x.1750]              ; 04E1 _ 8B. 15, 00000074(d)
        mov     eax, dword [shtMsgBox]                  ; 04E7 _ A1, 00000278(d)
        sub     esp, 8                                  ; 04EC _ 83. EC, 08
        push    44                                      ; 04EF _ 6A, 2C
        push    ecx                                     ; 04F1 _ 51
        push    27                                      ; 04F2 _ 6A, 1B
        push    edx                                     ; 04F4 _ 52
        push    eax                                     ; 04F5 _ 50
        push    dword [ebp-18H]                         ; 04F6 _ FF. 75, E8
        call    sheet_refresh                           ; 04F9 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 04FE _ 83. C4, 20
        mov     eax, dword [ebp-34H]                    ; 0501 _ 8B. 45, CC
        add     eax, keytable                           ; 0504 _ 05, 00000020(d)
        movzx   eax, byte [eax]                         ; 0509 _ 0F B6. 00
        mov     byte [charData.1749], al                ; 050C _ A2, 0000027C(d)
        mov     edx, dword [cursor_x.1750]              ; 0511 _ 8B. 15, 00000074(d)
        mov     eax, dword [shtMsgBox]                  ; 0517 _ A1, 00000278(d)
        sub     esp, 8                                  ; 051C _ 83. EC, 08
        push    charData.1749                           ; 051F _ 68, 0000027C(d)
        push    0                                       ; 0524 _ 6A, 00
        push    28                                      ; 0526 _ 6A, 1C
        push    edx                                     ; 0528 _ 52
        push    eax                                     ; 0529 _ 50
        push    dword [ebp-18H]                         ; 052A _ FF. 75, E8
        call    showString                              ; 052D _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0532 _ 83. C4, 20
        mov     eax, dword [cursor_x.1750]              ; 0535 _ A1, 00000074(d)
        add     eax, 8                                  ; 053A _ 83. C0, 08
        mov     dword [cursor_x.1750], eax              ; 053D _ A3, 00000074(d)
        mov     eax, dword [cursor_x.1750]              ; 0542 _ A1, 00000074(d)
        cmp     eax, 143                                ; 0547 _ 3D, 0000008F
        jle     ?_004                                   ; 054C _ 7E, 0A
        mov     dword [cursor_x.1750], 8                ; 054E _ C7. 05, 00000074(d), 00000008
?_004:  mov     eax, dword [cursor_x.1750]              ; 0558 _ A1, 00000074(d)
        lea     esi, [eax+7H]                           ; 055D _ 8D. 70, 07
        mov     ebx, dword [cursor_x.1750]              ; 0560 _ 8B. 1D, 00000074(d)
        mov     eax, dword [cursor_c.1751]              ; 0566 _ A1, 00000078(d)
        movzx   ecx, al                                 ; 056B _ 0F B6. C8
        mov     eax, dword [shtMsgBox]                  ; 056E _ A1, 00000278(d)
        mov     edx, dword [eax+4H]                     ; 0573 _ 8B. 50, 04
        mov     eax, dword [shtMsgBox]                  ; 0576 _ A1, 00000278(d)
        mov     eax, dword [eax]                        ; 057B _ 8B. 00
        sub     esp, 4                                  ; 057D _ 83. EC, 04
        push    43                                      ; 0580 _ 6A, 2B
        push    esi                                     ; 0582 _ 56
        push    28                                      ; 0583 _ 6A, 1C
        push    ebx                                     ; 0585 _ 53
        push    ecx                                     ; 0586 _ 51
        push    edx                                     ; 0587 _ 52
        push    eax                                     ; 0588 _ 50
        call    boxfill8                                ; 0589 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 058E _ 83. C4, 20
        mov     eax, dword [cursor_x.1750]              ; 0591 _ A1, 00000074(d)
        lea     ecx, [eax+8H]                           ; 0596 _ 8D. 48, 08
        mov     edx, dword [cursor_x.1750]              ; 0599 _ 8B. 15, 00000074(d)
        mov     eax, dword [shtMsgBox]                  ; 059F _ A1, 00000278(d)
        sub     esp, 8                                  ; 05A4 _ 83. EC, 08
        push    44                                      ; 05A7 _ 6A, 2C
        push    ecx                                     ; 05A9 _ 51
        push    28                                      ; 05AA _ 6A, 1C
        push    edx                                     ; 05AC _ 52
        push    eax                                     ; 05AD _ 50
        push    dword [ebp-18H]                         ; 05AE _ FF. 75, E8
        call    sheet_refresh                           ; 05B1 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 05B6 _ 83. C4, 20
?_005:  mov     eax, dword [ebp-34H]                    ; 05B9 _ 8B. 45, CC
        sub     esp, 12                                 ; 05BC _ 83. EC, 0C
        push    eax                                     ; 05BF _ 50
        call    intToHexStr                             ; 05C0 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 05C5 _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 05C8 _ 89. 45, F4
        mov     edx, dword [debug_y.1753]               ; 05CB _ 8B. 15, 0000007C(d)
        mov     eax, dword [debug_x.1752]               ; 05D1 _ A1, 00000284(d)
        sub     esp, 8                                  ; 05D6 _ 83. EC, 08
        push    dword [ebp-0CH]                         ; 05D9 _ FF. 75, F4
        push    0                                       ; 05DC _ 6A, 00
        push    edx                                     ; 05DE _ 52
        push    eax                                     ; 05DF _ 50
        push    dword [ebp-28H]                         ; 05E0 _ FF. 75, D8
        push    dword [ebp-18H]                         ; 05E3 _ FF. 75, E8
        call    showString                              ; 05E6 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 05EB _ 83. C4, 20
        mov     eax, dword [debug_x.1752]               ; 05EE _ A1, 00000284(d)
        add     eax, 96                                 ; 05F3 _ 83. C0, 60
        mov     dword [debug_x.1752], eax               ; 05F6 _ A3, 00000284(d)
        mov     eax, dword [ebp-28H]                    ; 05FB _ 8B. 45, D8
        mov     eax, dword [eax+4H]                     ; 05FE _ 8B. 40, 04
        lea     edx, [eax-60H]                          ; 0601 _ 8D. 50, A0
        mov     eax, dword [debug_x.1752]               ; 0604 _ A1, 00000284(d)
        cmp     edx, eax                                ; 0609 _ 39. C2
        jg      ?_001                                   ; 060B _ 0F 8F, FFFFFD75
        mov     dword [debug_x.1752], 0                 ; 0611 _ C7. 05, 00000284(d), 00000000
        mov     eax, dword [debug_y.1753]               ; 061B _ A1, 0000007C(d)
        add     eax, 16                                 ; 0620 _ 83. C0, 10
        mov     dword [debug_y.1753], eax               ; 0623 _ A3, 0000007C(d)
        jmp     ?_001                                   ; 0628 _ E9, FFFFFD59

?_006:  ; Local function
        sub     esp, 12                                 ; 062D _ 83. EC, 0C
        push    mouseinfo                               ; 0630 _ 68, 00000008(d)
        call    fifo8_status                            ; 0635 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 063A _ 83. C4, 10
        test    eax, eax                                ; 063D _ 85. C0
        jz      ?_007                                   ; 063F _ 74, 19
        sub     esp, 4                                  ; 0641 _ 83. EC, 04
        push    dword [ebp-24H]                         ; 0644 _ FF. 75, DC
        push    dword [ebp-28H]                         ; 0647 _ FF. 75, D8
        push    dword [ebp-18H]                         ; 064A _ FF. 75, E8
        call    show_mouse_info                         ; 064D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0652 _ 83. C4, 10
        jmp     ?_001                                   ; 0655 _ E9, FFFFFD2C

?_007:  ; Local function
        sub     esp, 12                                 ; 065A _ 83. EC, 0C
        push    timerfifo1                              ; 065D _ 68, 00000218(d)
        call    fifo8_status                            ; 0662 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0667 _ 83. C4, 10
        test    eax, eax                                ; 066A _ 85. C0
        je      ?_001                                   ; 066C _ 0F 84, FFFFFD14
        call    io_sti                                  ; 0672 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 0677 _ 83. EC, 0C
        push    timerfifo1                              ; 067A _ 68, 00000218(d)
        call    fifo8_get                               ; 067F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0684 _ 83. C4, 10
        mov     dword [timerID.1748], eax               ; 0687 _ A3, 00000288(d)
        mov     eax, dword [timerID.1748]               ; 068C _ A1, 00000288(d)
        cmp     eax, 10                                 ; 0691 _ 83. F8, 0A
        jnz     ?_008                                   ; 0694 _ 75, 1E
        sub     esp, 8                                  ; 0696 _ 83. EC, 08
        push    ?_161                                   ; 0699 _ 68, 00000009(d)
        push    7                                       ; 069E _ 6A, 07
        push    32                                      ; 06A0 _ 6A, 20
        push    0                                       ; 06A2 _ 6A, 00
        push    dword [ebp-28H]                         ; 06A4 _ FF. 75, D8
        push    dword [ebp-18H]                         ; 06A7 _ FF. 75, E8
        call    showString                              ; 06AA _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 06AF _ 83. C4, 20
        jmp     ?_011                                   ; 06B2 _ EB, 7C

?_008:  mov     eax, dword [timerID.1748]               ; 06B4 _ A1, 00000288(d)
        cmp     eax, 2                                  ; 06B9 _ 83. F8, 02
        jnz     ?_009                                   ; 06BC _ 75, 1E
        sub     esp, 8                                  ; 06BE _ 83. EC, 08
        push    ?_162                                   ; 06C1 _ 68, 00000014(d)
        push    7                                       ; 06C6 _ 6A, 07
        push    16                                      ; 06C8 _ 6A, 10
        push    0                                       ; 06CA _ 6A, 00
        push    dword [ebp-28H]                         ; 06CC _ FF. 75, D8
        push    dword [ebp-18H]                         ; 06CF _ FF. 75, E8
        call    showString                              ; 06D2 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 06D7 _ 83. C4, 20
        jmp     ?_011                                   ; 06DA _ EB, 54

?_009:  mov     eax, dword [timerID.1748]               ; 06DC _ A1, 00000288(d)
        cmp     eax, 1                                  ; 06E1 _ 83. F8, 01
        jnz     ?_010                                   ; 06E4 _ 75, 26
        mov     edx, dword [timer3]                     ; 06E6 _ 8B. 15, 00000214(d)
        mov     eax, dword [timerctl]                   ; 06EC _ A1, 00000208(d)
        sub     esp, 4                                  ; 06F1 _ 83. EC, 04
        push    0                                       ; 06F4 _ 6A, 00
        push    edx                                     ; 06F6 _ 52
        push    eax                                     ; 06F7 _ 50
        call    timer_setdata                           ; 06F8 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 06FD _ 83. C4, 10
        mov     dword [cursor_c.1751], 0                ; 0700 _ C7. 05, 00000078(d), 00000000
        jmp     ?_011                                   ; 070A _ EB, 24

?_010:  mov     edx, dword [timer3]                     ; 070C _ 8B. 15, 00000214(d)
        mov     eax, dword [timerctl]                   ; 0712 _ A1, 00000208(d)
        sub     esp, 4                                  ; 0717 _ 83. EC, 04
        push    1                                       ; 071A _ 6A, 01
        push    edx                                     ; 071C _ 52
        push    eax                                     ; 071D _ 50
        call    timer_setdata                           ; 071E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0723 _ 83. C4, 10
        mov     dword [cursor_c.1751], 7                ; 0726 _ C7. 05, 00000078(d), 00000007
?_011:  mov     eax, dword [timerID.1748]               ; 0730 _ A1, 00000288(d)
        cmp     eax, 1                                  ; 0735 _ 83. F8, 01
        jz      ?_012                                   ; 0738 _ 74, 0D
        mov     eax, dword [timerID.1748]               ; 073A _ A1, 00000288(d)
        test    eax, eax                                ; 073F _ 85. C0
        jne     ?_001                                   ; 0741 _ 0F 85, FFFFFC3F
?_012:  mov     edx, dword [timer3]                     ; 0747 _ 8B. 15, 00000214(d)
        mov     eax, dword [timerctl]                   ; 074D _ A1, 00000208(d)
        sub     esp, 4                                  ; 0752 _ 83. EC, 04
        push    50                                      ; 0755 _ 6A, 32
        push    edx                                     ; 0757 _ 52
        push    eax                                     ; 0758 _ 50
        call    timer_settime                           ; 0759 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 075E _ 83. C4, 10
        mov     eax, dword [cursor_x.1750]              ; 0761 _ A1, 00000074(d)
        lea     esi, [eax+7H]                           ; 0766 _ 8D. 70, 07
        mov     ebx, dword [cursor_x.1750]              ; 0769 _ 8B. 1D, 00000074(d)
        mov     eax, dword [cursor_c.1751]              ; 076F _ A1, 00000078(d)
        movzx   ecx, al                                 ; 0774 _ 0F B6. C8
        mov     eax, dword [shtMsgBox]                  ; 0777 _ A1, 00000278(d)
        mov     edx, dword [eax+4H]                     ; 077C _ 8B. 50, 04
        mov     eax, dword [shtMsgBox]                  ; 077F _ A1, 00000278(d)
        mov     eax, dword [eax]                        ; 0784 _ 8B. 00
        sub     esp, 4                                  ; 0786 _ 83. EC, 04
        push    43                                      ; 0789 _ 6A, 2B
        push    esi                                     ; 078B _ 56
        push    28                                      ; 078C _ 6A, 1C
        push    ebx                                     ; 078E _ 53
        push    ecx                                     ; 078F _ 51
        push    edx                                     ; 0790 _ 52
        push    eax                                     ; 0791 _ 50
        call    boxfill8                                ; 0792 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0797 _ 83. C4, 20
        mov     eax, dword [cursor_x.1750]              ; 079A _ A1, 00000074(d)
        lea     ecx, [eax+8H]                           ; 079F _ 8D. 48, 08
        mov     edx, dword [cursor_x.1750]              ; 07A2 _ 8B. 15, 00000074(d)
        mov     eax, dword [shtMsgBox]                  ; 07A8 _ A1, 00000278(d)
        sub     esp, 8                                  ; 07AD _ 83. EC, 08
        push    44                                      ; 07B0 _ 6A, 2C
        push    ecx                                     ; 07B2 _ 51
        push    28                                      ; 07B3 _ 6A, 1C
        push    edx                                     ; 07B5 _ 52
        push    eax                                     ; 07B6 _ 50
        push    dword [ebp-18H]                         ; 07B7 _ FF. 75, E8
        call    sheet_refresh                           ; 07BA _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 07BF _ 83. C4, 20
        jmp     ?_001                                   ; 07C2 _ E9, FFFFFBBF

initBootInfo:; Function begin
        push    ebp                                     ; 07C7 _ 55
        mov     ebp, esp                                ; 07C8 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 07CA _ 8B. 45, 08
        mov     dword [eax], -402653184                 ; 07CD _ C7. 00, E8000000
        mov     eax, dword [ebp+8H]                     ; 07D3 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 1280                     ; 07D6 _ 66: C7. 40, 04, 0500
        mov     eax, dword [ebp+8H]                     ; 07DC _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 1024                     ; 07DF _ 66: C7. 40, 06, 0400
        nop                                             ; 07E5 _ 90
        pop     ebp                                     ; 07E6 _ 5D
        ret                                             ; 07E7 _ C3
; initBootInfo End of function

init_palette:; Function begin
        push    ebp                                     ; 07E8 _ 55
        mov     ebp, esp                                ; 07E9 _ 89. E5
        sub     esp, 8                                  ; 07EB _ 83. EC, 08
        sub     esp, 4                                  ; 07EE _ 83. EC, 04
        push    table_rgb.1762                          ; 07F1 _ 68, 00000080(d)
        push    15                                      ; 07F6 _ 6A, 0F
        push    0                                       ; 07F8 _ 6A, 00
        call    set_palette                             ; 07FA _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 07FF _ 83. C4, 10
        nop                                             ; 0802 _ 90
        leave                                           ; 0803 _ C9
        ret                                             ; 0804 _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 0805 _ 55
        mov     ebp, esp                                ; 0806 _ 89. E5
        sub     esp, 24                                 ; 0808 _ 83. EC, 18
        call    io_load_eflags                          ; 080B _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 0810 _ 89. 45, F4
        call    io_cli                                  ; 0813 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0818 _ 83. EC, 08
        push    dword [ebp+8H]                          ; 081B _ FF. 75, 08
        push    968                                     ; 081E _ 68, 000003C8
        call    io_out8                                 ; 0823 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0828 _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 082B _ 8B. 45, 08
        mov     dword [ebp-10H], eax                    ; 082E _ 89. 45, F0
        jmp     ?_014                                   ; 0831 _ EB, 65

?_013:  mov     eax, dword [ebp+10H]                    ; 0833 _ 8B. 45, 10
        movzx   eax, byte [eax]                         ; 0836 _ 0F B6. 00
        shr     al, 2                                   ; 0839 _ C0. E8, 02
        movzx   eax, al                                 ; 083C _ 0F B6. C0
        sub     esp, 8                                  ; 083F _ 83. EC, 08
        push    eax                                     ; 0842 _ 50
        push    969                                     ; 0843 _ 68, 000003C9
        call    io_out8                                 ; 0848 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 084D _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 0850 _ 8B. 45, 10
        add     eax, 1                                  ; 0853 _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 0856 _ 0F B6. 00
        shr     al, 2                                   ; 0859 _ C0. E8, 02
        movzx   eax, al                                 ; 085C _ 0F B6. C0
        sub     esp, 8                                  ; 085F _ 83. EC, 08
        push    eax                                     ; 0862 _ 50
        push    969                                     ; 0863 _ 68, 000003C9
        call    io_out8                                 ; 0868 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 086D _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 0870 _ 8B. 45, 10
        add     eax, 2                                  ; 0873 _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 0876 _ 0F B6. 00
        shr     al, 2                                   ; 0879 _ C0. E8, 02
        movzx   eax, al                                 ; 087C _ 0F B6. C0
        sub     esp, 8                                  ; 087F _ 83. EC, 08
        push    eax                                     ; 0882 _ 50
        push    969                                     ; 0883 _ 68, 000003C9
        call    io_out8                                 ; 0888 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 088D _ 83. C4, 10
        add     dword [ebp+10H], 3                      ; 0890 _ 83. 45, 10, 03
        add     dword [ebp-10H], 1                      ; 0894 _ 83. 45, F0, 01
?_014:  mov     eax, dword [ebp-10H]                    ; 0898 _ 8B. 45, F0
        cmp     eax, dword [ebp+0CH]                    ; 089B _ 3B. 45, 0C
        jle     ?_013                                   ; 089E _ 7E, 93
        sub     esp, 12                                 ; 08A0 _ 83. EC, 0C
        push    dword [ebp-0CH]                         ; 08A3 _ FF. 75, F4
        call    io_store_eflags                         ; 08A6 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 08AB _ 83. C4, 10
        nop                                             ; 08AE _ 90
        leave                                           ; 08AF _ C9
        ret                                             ; 08B0 _ C3
; set_palette End of function

boxfill8:; Function begin
        push    ebp                                     ; 08B1 _ 55
        mov     ebp, esp                                ; 08B2 _ 89. E5
        sub     esp, 20                                 ; 08B4 _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 08B7 _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 08BA _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 08BD _ 8B. 45, 18
        mov     dword [ebp-4H], eax                     ; 08C0 _ 89. 45, FC
        jmp     ?_018                                   ; 08C3 _ EB, 33

?_015:  mov     eax, dword [ebp+14H]                    ; 08C5 _ 8B. 45, 14
        mov     dword [ebp-8H], eax                     ; 08C8 _ 89. 45, F8
        jmp     ?_017                                   ; 08CB _ EB, 1F

?_016:  mov     eax, dword [ebp-4H]                     ; 08CD _ 8B. 45, FC
        imul    eax, dword [ebp+0CH]                    ; 08D0 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 08D4 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 08D6 _ 8B. 45, F8
        add     eax, edx                                ; 08D9 _ 01. D0
        mov     edx, eax                                ; 08DB _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 08DD _ 8B. 45, 08
        add     edx, eax                                ; 08E0 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 08E2 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 08E6 _ 88. 02
        add     dword [ebp-8H], 1                       ; 08E8 _ 83. 45, F8, 01
?_017:  mov     eax, dword [ebp-8H]                     ; 08EC _ 8B. 45, F8
        cmp     eax, dword [ebp+1CH]                    ; 08EF _ 3B. 45, 1C
        jle     ?_016                                   ; 08F2 _ 7E, D9
        add     dword [ebp-4H], 1                       ; 08F4 _ 83. 45, FC, 01
?_018:  mov     eax, dword [ebp-4H]                     ; 08F8 _ 8B. 45, FC
        cmp     eax, dword [ebp+20H]                    ; 08FB _ 3B. 45, 20
        jle     ?_015                                   ; 08FE _ 7E, C5
        nop                                             ; 0900 _ 90
        leave                                           ; 0901 _ C9
        ret                                             ; 0902 _ C3
; boxfill8 End of function

showString:; Function begin
        push    ebp                                     ; 0903 _ 55
        mov     ebp, esp                                ; 0904 _ 89. E5
        push    ebx                                     ; 0906 _ 53
        sub     esp, 36                                 ; 0907 _ 83. EC, 24
        mov     eax, dword [ebp+18H]                    ; 090A _ 8B. 45, 18
        mov     byte [ebp-1CH], al                      ; 090D _ 88. 45, E4
        mov     eax, dword [ebp+10H]                    ; 0910 _ 8B. 45, 10
        mov     dword [ebp-0CH], eax                    ; 0913 _ 89. 45, F4
        jmp     ?_020                                   ; 0916 _ EB, 3E

?_019:  mov     eax, dword [ebp+1CH]                    ; 0918 _ 8B. 45, 1C
        movzx   eax, byte [eax]                         ; 091B _ 0F B6. 00
        movzx   eax, al                                 ; 091E _ 0F B6. C0
        shl     eax, 4                                  ; 0921 _ C1. E0, 04
        lea     ebx, [systemFont+eax]                   ; 0924 _ 8D. 98, 00000000(d)
        movsx   ecx, byte [ebp-1CH]                     ; 092A _ 0F BE. 4D, E4
        mov     eax, dword [ebp+0CH]                    ; 092E _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 0931 _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 0934 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 0937 _ 8B. 00
        sub     esp, 8                                  ; 0939 _ 83. EC, 08
        push    ebx                                     ; 093C _ 53
        push    ecx                                     ; 093D _ 51
        push    dword [ebp+14H]                         ; 093E _ FF. 75, 14
        push    dword [ebp+10H]                         ; 0941 _ FF. 75, 10
        push    edx                                     ; 0944 _ 52
        push    eax                                     ; 0945 _ 50
        call    showChar8                               ; 0946 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 094B _ 83. C4, 20
        add     dword [ebp+1CH], 1                      ; 094E _ 83. 45, 1C, 01
        add     dword [ebp+10H], 8                      ; 0952 _ 83. 45, 10, 08
?_020:  mov     eax, dword [ebp+1CH]                    ; 0956 _ 8B. 45, 1C
        movzx   eax, byte [eax]                         ; 0959 _ 0F B6. 00
        test    al, al                                  ; 095C _ 84. C0
        jnz     ?_019                                   ; 095E _ 75, B8
        mov     eax, dword [ebp+14H]                    ; 0960 _ 8B. 45, 14
        add     eax, 16                                 ; 0963 _ 83. C0, 10
        sub     esp, 8                                  ; 0966 _ 83. EC, 08
        push    eax                                     ; 0969 _ 50
        push    dword [ebp+10H]                         ; 096A _ FF. 75, 10
        push    dword [ebp+14H]                         ; 096D _ FF. 75, 14
        push    dword [ebp-0CH]                         ; 0970 _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 0973 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0976 _ FF. 75, 08
        call    sheet_refresh                           ; 0979 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 097E _ 83. C4, 20
        nop                                             ; 0981 _ 90
        mov     ebx, dword [ebp-4H]                     ; 0982 _ 8B. 5D, FC
        leave                                           ; 0985 _ C9
        ret                                             ; 0986 _ C3
; showString End of function

showChar8:; Function begin
        push    ebp                                     ; 0987 _ 55
        mov     ebp, esp                                ; 0988 _ 89. E5
        sub     esp, 20                                 ; 098A _ 83. EC, 14
        mov     eax, dword [ebp+18H]                    ; 098D _ 8B. 45, 18
        mov     byte [ebp-14H], al                      ; 0990 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 0993 _ C7. 45, FC, 00000000
        jmp     ?_030                                   ; 099A _ E9, 0000016C

?_021:  mov     edx, dword [ebp-4H]                     ; 099F _ 8B. 55, FC
        mov     eax, dword [ebp+1CH]                    ; 09A2 _ 8B. 45, 1C
        add     eax, edx                                ; 09A5 _ 01. D0
        movzx   eax, byte [eax]                         ; 09A7 _ 0F B6. 00
        mov     byte [ebp-5H], al                       ; 09AA _ 88. 45, FB
        cmp     byte [ebp-5H], 0                        ; 09AD _ 80. 7D, FB, 00
        jns     ?_022                                   ; 09B1 _ 79, 20
        mov     edx, dword [ebp+14H]                    ; 09B3 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 09B6 _ 8B. 45, FC
        add     eax, edx                                ; 09B9 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 09BB _ 0F AF. 45, 0C
        mov     edx, eax                                ; 09BF _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 09C1 _ 8B. 45, 10
        add     eax, edx                                ; 09C4 _ 01. D0
        mov     edx, eax                                ; 09C6 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 09C8 _ 8B. 45, 08
        add     edx, eax                                ; 09CB _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 09CD _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 09D1 _ 88. 02
?_022:  movsx   eax, byte [ebp-5H]                      ; 09D3 _ 0F BE. 45, FB
        and     eax, 40H                                ; 09D7 _ 83. E0, 40
        test    eax, eax                                ; 09DA _ 85. C0
        jz      ?_023                                   ; 09DC _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 09DE _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 09E1 _ 8B. 45, FC
        add     eax, edx                                ; 09E4 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 09E6 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 09EA _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 09EC _ 8B. 45, 10
        add     eax, edx                                ; 09EF _ 01. D0
        lea     edx, [eax+1H]                           ; 09F1 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 09F4 _ 8B. 45, 08
        add     edx, eax                                ; 09F7 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 09F9 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 09FD _ 88. 02
?_023:  movsx   eax, byte [ebp-5H]                      ; 09FF _ 0F BE. 45, FB
        and     eax, 20H                                ; 0A03 _ 83. E0, 20
        test    eax, eax                                ; 0A06 _ 85. C0
        jz      ?_024                                   ; 0A08 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 0A0A _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0A0D _ 8B. 45, FC
        add     eax, edx                                ; 0A10 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0A12 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0A16 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0A18 _ 8B. 45, 10
        add     eax, edx                                ; 0A1B _ 01. D0
        lea     edx, [eax+2H]                           ; 0A1D _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 0A20 _ 8B. 45, 08
        add     edx, eax                                ; 0A23 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0A25 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0A29 _ 88. 02
?_024:  movsx   eax, byte [ebp-5H]                      ; 0A2B _ 0F BE. 45, FB
        and     eax, 10H                                ; 0A2F _ 83. E0, 10
        test    eax, eax                                ; 0A32 _ 85. C0
        jz      ?_025                                   ; 0A34 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 0A36 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0A39 _ 8B. 45, FC
        add     eax, edx                                ; 0A3C _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0A3E _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0A42 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0A44 _ 8B. 45, 10
        add     eax, edx                                ; 0A47 _ 01. D0
        lea     edx, [eax+3H]                           ; 0A49 _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 0A4C _ 8B. 45, 08
        add     edx, eax                                ; 0A4F _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0A51 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0A55 _ 88. 02
?_025:  movsx   eax, byte [ebp-5H]                      ; 0A57 _ 0F BE. 45, FB
        and     eax, 08H                                ; 0A5B _ 83. E0, 08
        test    eax, eax                                ; 0A5E _ 85. C0
        jz      ?_026                                   ; 0A60 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 0A62 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0A65 _ 8B. 45, FC
        add     eax, edx                                ; 0A68 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0A6A _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0A6E _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0A70 _ 8B. 45, 10
        add     eax, edx                                ; 0A73 _ 01. D0
        lea     edx, [eax+4H]                           ; 0A75 _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0A78 _ 8B. 45, 08
        add     edx, eax                                ; 0A7B _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0A7D _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0A81 _ 88. 02
?_026:  movsx   eax, byte [ebp-5H]                      ; 0A83 _ 0F BE. 45, FB
        and     eax, 04H                                ; 0A87 _ 83. E0, 04
        test    eax, eax                                ; 0A8A _ 85. C0
        jz      ?_027                                   ; 0A8C _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 0A8E _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0A91 _ 8B. 45, FC
        add     eax, edx                                ; 0A94 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0A96 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0A9A _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0A9C _ 8B. 45, 10
        add     eax, edx                                ; 0A9F _ 01. D0
        lea     edx, [eax+5H]                           ; 0AA1 _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 0AA4 _ 8B. 45, 08
        add     edx, eax                                ; 0AA7 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0AA9 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0AAD _ 88. 02
?_027:  movsx   eax, byte [ebp-5H]                      ; 0AAF _ 0F BE. 45, FB
        and     eax, 02H                                ; 0AB3 _ 83. E0, 02
        test    eax, eax                                ; 0AB6 _ 85. C0
        jz      ?_028                                   ; 0AB8 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 0ABA _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0ABD _ 8B. 45, FC
        add     eax, edx                                ; 0AC0 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0AC2 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0AC6 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0AC8 _ 8B. 45, 10
        add     eax, edx                                ; 0ACB _ 01. D0
        lea     edx, [eax+6H]                           ; 0ACD _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 0AD0 _ 8B. 45, 08
        add     edx, eax                                ; 0AD3 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0AD5 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0AD9 _ 88. 02
?_028:  movsx   eax, byte [ebp-5H]                      ; 0ADB _ 0F BE. 45, FB
        and     eax, 01H                                ; 0ADF _ 83. E0, 01
        test    eax, eax                                ; 0AE2 _ 85. C0
        jz      ?_029                                   ; 0AE4 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 0AE6 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0AE9 _ 8B. 45, FC
        add     eax, edx                                ; 0AEC _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0AEE _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0AF2 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0AF4 _ 8B. 45, 10
        add     eax, edx                                ; 0AF7 _ 01. D0
        lea     edx, [eax+7H]                           ; 0AF9 _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 0AFC _ 8B. 45, 08
        add     edx, eax                                ; 0AFF _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0B01 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0B05 _ 88. 02
?_029:  add     dword [ebp-4H], 1                       ; 0B07 _ 83. 45, FC, 01
?_030:  cmp     dword [ebp-4H], 15                      ; 0B0B _ 83. 7D, FC, 0F
        jle     ?_021                                   ; 0B0F _ 0F 8E, FFFFFE8A
        nop                                             ; 0B15 _ 90
        leave                                           ; 0B16 _ C9
        ret                                             ; 0B17 _ C3
; showChar8 End of function

init_mouse_cursor:; Function begin
        push    ebp                                     ; 0B18 _ 55
        mov     ebp, esp                                ; 0B19 _ 89. E5
        sub     esp, 20                                 ; 0B1B _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 0B1E _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 0B21 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 0B24 _ C7. 45, FC, 00000000
        jmp     ?_037                                   ; 0B2B _ E9, 000000B5

?_031:  mov     dword [ebp-8H], 0                       ; 0B30 _ C7. 45, F8, 00000000
        jmp     ?_036                                   ; 0B37 _ E9, 0000009B

?_032:  mov     eax, dword [ebp-4H]                     ; 0B3C _ 8B. 45, FC
        shl     eax, 4                                  ; 0B3F _ C1. E0, 04
        mov     edx, eax                                ; 0B42 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0B44 _ 8B. 45, F8
        add     eax, edx                                ; 0B47 _ 01. D0
        add     eax, cursor.1819                        ; 0B49 _ 05, 000000C0(d)
        movzx   eax, byte [eax]                         ; 0B4E _ 0F B6. 00
        cmp     al, 42                                  ; 0B51 _ 3C, 2A
        jnz     ?_033                                   ; 0B53 _ 75, 19
        mov     eax, dword [ebp-4H]                     ; 0B55 _ 8B. 45, FC
        shl     eax, 4                                  ; 0B58 _ C1. E0, 04
        mov     edx, eax                                ; 0B5B _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0B5D _ 8B. 45, F8
        add     eax, edx                                ; 0B60 _ 01. D0
        mov     edx, eax                                ; 0B62 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0B64 _ 8B. 45, 08
        add     eax, edx                                ; 0B67 _ 01. D0
        mov     byte [eax], 0                           ; 0B69 _ C6. 00, 00
        jmp     ?_035                                   ; 0B6C _ EB, 65

?_033:  mov     eax, dword [ebp-4H]                     ; 0B6E _ 8B. 45, FC
        shl     eax, 4                                  ; 0B71 _ C1. E0, 04
        mov     edx, eax                                ; 0B74 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0B76 _ 8B. 45, F8
        add     eax, edx                                ; 0B79 _ 01. D0
        add     eax, cursor.1819                        ; 0B7B _ 05, 000000C0(d)
        movzx   eax, byte [eax]                         ; 0B80 _ 0F B6. 00
        cmp     al, 79                                  ; 0B83 _ 3C, 4F
        jnz     ?_034                                   ; 0B85 _ 75, 19
        mov     eax, dword [ebp-4H]                     ; 0B87 _ 8B. 45, FC
        shl     eax, 4                                  ; 0B8A _ C1. E0, 04
        mov     edx, eax                                ; 0B8D _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0B8F _ 8B. 45, F8
        add     eax, edx                                ; 0B92 _ 01. D0
        mov     edx, eax                                ; 0B94 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0B96 _ 8B. 45, 08
        add     eax, edx                                ; 0B99 _ 01. D0
        mov     byte [eax], 7                           ; 0B9B _ C6. 00, 07
        jmp     ?_035                                   ; 0B9E _ EB, 33

?_034:  mov     eax, dword [ebp-4H]                     ; 0BA0 _ 8B. 45, FC
        shl     eax, 4                                  ; 0BA3 _ C1. E0, 04
        mov     edx, eax                                ; 0BA6 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0BA8 _ 8B. 45, F8
        add     eax, edx                                ; 0BAB _ 01. D0
        add     eax, cursor.1819                        ; 0BAD _ 05, 000000C0(d)
        movzx   eax, byte [eax]                         ; 0BB2 _ 0F B6. 00
        cmp     al, 46                                  ; 0BB5 _ 3C, 2E
        jnz     ?_035                                   ; 0BB7 _ 75, 1A
        mov     eax, dword [ebp-4H]                     ; 0BB9 _ 8B. 45, FC
        shl     eax, 4                                  ; 0BBC _ C1. E0, 04
        mov     edx, eax                                ; 0BBF _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0BC1 _ 8B. 45, F8
        add     eax, edx                                ; 0BC4 _ 01. D0
        mov     edx, eax                                ; 0BC6 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0BC8 _ 8B. 45, 08
        add     edx, eax                                ; 0BCB _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0BCD _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0BD1 _ 88. 02
?_035:  add     dword [ebp-8H], 1                       ; 0BD3 _ 83. 45, F8, 01
?_036:  cmp     dword [ebp-8H], 15                      ; 0BD7 _ 83. 7D, F8, 0F
        jle     ?_032                                   ; 0BDB _ 0F 8E, FFFFFF5B
        add     dword [ebp-4H], 1                       ; 0BE1 _ 83. 45, FC, 01
?_037:  cmp     dword [ebp-4H], 15                      ; 0BE5 _ 83. 7D, FC, 0F
        jle     ?_031                                   ; 0BE9 _ 0F 8E, FFFFFF41
        nop                                             ; 0BEF _ 90
        leave                                           ; 0BF0 _ C9
        ret                                             ; 0BF1 _ C3
; init_mouse_cursor End of function

putblock:; Function begin
        push    ebp                                     ; 0BF2 _ 55
        mov     ebp, esp                                ; 0BF3 _ 89. E5
        push    ebx                                     ; 0BF5 _ 53
        sub     esp, 16                                 ; 0BF6 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 0BF9 _ C7. 45, F8, 00000000
        jmp     ?_041                                   ; 0C00 _ EB, 50

?_038:  mov     dword [ebp-0CH], 0                      ; 0C02 _ C7. 45, F4, 00000000
        jmp     ?_040                                   ; 0C09 _ EB, 3B

?_039:  mov     eax, dword [ebp-8H]                     ; 0C0B _ 8B. 45, F8
        imul    eax, dword [ebp+24H]                    ; 0C0E _ 0F AF. 45, 24
        mov     edx, eax                                ; 0C12 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 0C14 _ 8B. 45, F4
        add     eax, edx                                ; 0C17 _ 01. D0
        mov     edx, eax                                ; 0C19 _ 89. C2
        mov     eax, dword [ebp+20H]                    ; 0C1B _ 8B. 45, 20
        add     eax, edx                                ; 0C1E _ 01. D0
        mov     ecx, dword [ebp+1CH]                    ; 0C20 _ 8B. 4D, 1C
        mov     edx, dword [ebp-8H]                     ; 0C23 _ 8B. 55, F8
        add     edx, ecx                                ; 0C26 _ 01. CA
        imul    edx, dword [ebp+0CH]                    ; 0C28 _ 0F AF. 55, 0C
        mov     ebx, dword [ebp+18H]                    ; 0C2C _ 8B. 5D, 18
        mov     ecx, dword [ebp-0CH]                    ; 0C2F _ 8B. 4D, F4
        add     ecx, ebx                                ; 0C32 _ 01. D9
        add     edx, ecx                                ; 0C34 _ 01. CA
        mov     ecx, edx                                ; 0C36 _ 89. D1
        mov     edx, dword [ebp+8H]                     ; 0C38 _ 8B. 55, 08
        add     edx, ecx                                ; 0C3B _ 01. CA
        movzx   eax, byte [eax]                         ; 0C3D _ 0F B6. 00
        mov     byte [edx], al                          ; 0C40 _ 88. 02
        add     dword [ebp-0CH], 1                      ; 0C42 _ 83. 45, F4, 01
?_040:  mov     eax, dword [ebp-0CH]                    ; 0C46 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 0C49 _ 3B. 45, 10
        jl      ?_039                                   ; 0C4C _ 7C, BD
        add     dword [ebp-8H], 1                       ; 0C4E _ 83. 45, F8, 01
?_041:  mov     eax, dword [ebp-8H]                     ; 0C52 _ 8B. 45, F8
        cmp     eax, dword [ebp+14H]                    ; 0C55 _ 3B. 45, 14
        jl      ?_038                                   ; 0C58 _ 7C, A8
        nop                                             ; 0C5A _ 90
        add     esp, 16                                 ; 0C5B _ 83. C4, 10
        pop     ebx                                     ; 0C5E _ 5B
        pop     ebp                                     ; 0C5F _ 5D
        ret                                             ; 0C60 _ C3
; putblock End of function

intHandlerFromC:; Function begin
        push    ebp                                     ; 0C61 _ 55
        mov     ebp, esp                                ; 0C62 _ 89. E5
        sub     esp, 24                                 ; 0C64 _ 83. EC, 18
        mov     eax, dword [bootInfo]                   ; 0C67 _ A1, 00000000(d)
        mov     dword [ebp-14H], eax                    ; 0C6C _ 89. 45, EC
        movzx   eax, word [?_172]                       ; 0C6F _ 0F B7. 05, 00000004(d)
        cwde                                            ; 0C76 _ 98
        mov     dword [ebp-10H], eax                    ; 0C77 _ 89. 45, F0
        movzx   eax, word [?_173]                       ; 0C7A _ 0F B7. 05, 00000006(d)
        cwde                                            ; 0C81 _ 98
        mov     dword [ebp-0CH], eax                    ; 0C82 _ 89. 45, F4
        sub     esp, 8                                  ; 0C85 _ 83. EC, 08
        push    32                                      ; 0C88 _ 6A, 20
        push    32                                      ; 0C8A _ 6A, 20
        call    io_out8                                 ; 0C8C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0C91 _ 83. C4, 10
        mov     byte [ebp-15H], 0                       ; 0C94 _ C6. 45, EB, 00
        sub     esp, 12                                 ; 0C98 _ 83. EC, 0C
        push    96                                      ; 0C9B _ 6A, 60
        call    io_in8                                  ; 0C9D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0CA2 _ 83. C4, 10
        mov     byte [ebp-15H], al                      ; 0CA5 _ 88. 45, EB
        movzx   eax, byte [ebp-15H]                     ; 0CA8 _ 0F B6. 45, EB
        sub     esp, 8                                  ; 0CAC _ 83. EC, 08
        push    eax                                     ; 0CAF _ 50
        push    keyinfo                                 ; 0CB0 _ 68, 00000020(d)
        call    fifo8_put                               ; 0CB5 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0CBA _ 83. C4, 10
        nop                                             ; 0CBD _ 90
        leave                                           ; 0CBE _ C9
        ret                                             ; 0CBF _ C3
; intHandlerFromC End of function

charToHexVal:; Function begin
        push    ebp                                     ; 0CC0 _ 55
        mov     ebp, esp                                ; 0CC1 _ 89. E5
        sub     esp, 4                                  ; 0CC3 _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 0CC6 _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 0CC9 _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 0CCC _ 80. 7D, FC, 09
        jle     ?_042                                   ; 0CD0 _ 7E, 09
        movzx   eax, byte [ebp-4H]                      ; 0CD2 _ 0F B6. 45, FC
        add     eax, 55                                 ; 0CD6 _ 83. C0, 37
        jmp     ?_043                                   ; 0CD9 _ EB, 07

?_042:  movzx   eax, byte [ebp-4H]                      ; 0CDB _ 0F B6. 45, FC
        add     eax, 48                                 ; 0CDF _ 83. C0, 30
?_043:  leave                                           ; 0CE2 _ C9
        ret                                             ; 0CE3 _ C3
; charToHexVal End of function

charToHexStr:; Function begin
        push    ebp                                     ; 0CE4 _ 55
        mov     ebp, esp                                ; 0CE5 _ 89. E5
        sub     esp, 20                                 ; 0CE7 _ 83. EC, 14
        mov     eax, dword [ebp+8H]                     ; 0CEA _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 0CED _ 88. 45, EC
        movzx   eax, byte [ebp-14H]                     ; 0CF0 _ 0F B6. 45, EC
        and     eax, 0FH                                ; 0CF4 _ 83. E0, 0F
        mov     byte [ebp-1H], al                       ; 0CF7 _ 88. 45, FF
        movsx   eax, byte [ebp-1H]                      ; 0CFA _ 0F BE. 45, FF
        push    eax                                     ; 0CFE _ 50
        call    charToHexVal                            ; 0CFF _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 0D04 _ 83. C4, 04
        mov     byte [?_171], al                        ; 0D07 _ A2, 00000003(d)
        shr     byte [ebp-14H], 4                       ; 0D0C _ C0. 6D, EC, 04
        movzx   eax, byte [ebp-14H]                     ; 0D10 _ 0F B6. 45, EC
        movsx   eax, al                                 ; 0D14 _ 0F BE. C0
        push    eax                                     ; 0D17 _ 50
        call    charToHexVal                            ; 0D18 _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 0D1D _ 83. C4, 04
        mov     byte [?_170], al                        ; 0D20 _ A2, 00000002(d)
        mov     eax, keyval                             ; 0D25 _ B8, 00000000(d)
        leave                                           ; 0D2A _ C9
        ret                                             ; 0D2B _ C3
; charToHexStr End of function

intToHexStr:; Function begin
        push    ebp                                     ; 0D2C _ 55
        mov     ebp, esp                                ; 0D2D _ 89. E5
        sub     esp, 16                                 ; 0D2F _ 83. EC, 10
        mov     byte [str.1863], 48                     ; 0D32 _ C6. 05, 0000028C(d), 30
        mov     byte [?_176], 88                        ; 0D39 _ C6. 05, 0000028D(d), 58
        mov     byte [?_177], 0                         ; 0D40 _ C6. 05, 00000296(d), 00
        mov     dword [ebp-8H], 2                       ; 0D47 _ C7. 45, F8, 00000002
        mov     dword [ebp-0CH], 7                      ; 0D4E _ C7. 45, F4, 00000007
        jmp     ?_047                                   ; 0D55 _ EB, 45

?_044:  mov     eax, dword [ebp+8H]                     ; 0D57 _ 8B. 45, 08
        and     eax, 0FH                                ; 0D5A _ 83. E0, 0F
        mov     dword [ebp-4H], eax                     ; 0D5D _ 89. 45, FC
        cmp     dword [ebp-4H], 9                       ; 0D60 _ 83. 7D, FC, 09
        jg      ?_045                                   ; 0D64 _ 7F, 18
        mov     eax, dword [ebp-4H]                     ; 0D66 _ 8B. 45, FC
        lea     ecx, [eax+30H]                          ; 0D69 _ 8D. 48, 30
        mov     edx, dword [ebp-8H]                     ; 0D6C _ 8B. 55, F8
        mov     eax, dword [ebp-0CH]                    ; 0D6F _ 8B. 45, F4
        add     eax, edx                                ; 0D72 _ 01. D0
        mov     edx, ecx                                ; 0D74 _ 89. CA
        mov     byte [str.1863+eax], dl                 ; 0D76 _ 88. 90, 0000028C(d)
        jmp     ?_046                                   ; 0D7C _ EB, 16

?_045:  mov     eax, dword [ebp-4H]                     ; 0D7E _ 8B. 45, FC
        lea     ecx, [eax+37H]                          ; 0D81 _ 8D. 48, 37
        mov     edx, dword [ebp-8H]                     ; 0D84 _ 8B. 55, F8
        mov     eax, dword [ebp-0CH]                    ; 0D87 _ 8B. 45, F4
        add     eax, edx                                ; 0D8A _ 01. D0
        mov     edx, ecx                                ; 0D8C _ 89. CA
        mov     byte [str.1863+eax], dl                 ; 0D8E _ 88. 90, 0000028C(d)
?_046:  shr     dword [ebp+8H], 4                       ; 0D94 _ C1. 6D, 08, 04
        sub     dword [ebp-0CH], 1                      ; 0D98 _ 83. 6D, F4, 01
?_047:  cmp     dword [ebp-0CH], 0                      ; 0D9C _ 83. 7D, F4, 00
        jns     ?_044                                   ; 0DA0 _ 79, B5
        mov     eax, str.1863                           ; 0DA2 _ B8, 0000028C(d)
        leave                                           ; 0DA7 _ C9
        ret                                             ; 0DA8 _ C3
; intToHexStr End of function

wait_KBC_sendReady:; Function begin
        push    ebp                                     ; 0DA9 _ 55
        mov     ebp, esp                                ; 0DAA _ 89. E5
        sub     esp, 8                                  ; 0DAC _ 83. EC, 08
?_048:  sub     esp, 12                                 ; 0DAF _ 83. EC, 0C
        push    100                                     ; 0DB2 _ 6A, 64
        call    io_in8                                  ; 0DB4 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0DB9 _ 83. C4, 10
        and     eax, 02H                                ; 0DBC _ 83. E0, 02
        test    eax, eax                                ; 0DBF _ 85. C0
        jz      ?_049                                   ; 0DC1 _ 74, 02
        jmp     ?_048                                   ; 0DC3 _ EB, EA
; wait_KBC_sendReady End of function

?_049:  ; Local function
        nop                                             ; 0DC5 _ 90
        nop                                             ; 0DC6 _ 90
        leave                                           ; 0DC7 _ C9
        ret                                             ; 0DC8 _ C3

init_keyboard:; Function begin
        push    ebp                                     ; 0DC9 _ 55
        mov     ebp, esp                                ; 0DCA _ 89. E5
        sub     esp, 8                                  ; 0DCC _ 83. EC, 08
        call    wait_KBC_sendReady                      ; 0DCF _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0DD4 _ 83. EC, 08
        push    96                                      ; 0DD7 _ 6A, 60
        push    100                                     ; 0DD9 _ 6A, 64
        call    io_out8                                 ; 0DDB _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0DE0 _ 83. C4, 10
        call    wait_KBC_sendReady                      ; 0DE3 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0DE8 _ 83. EC, 08
        push    71                                      ; 0DEB _ 6A, 47
        push    96                                      ; 0DED _ 6A, 60
        call    io_out8                                 ; 0DEF _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0DF4 _ 83. C4, 10
        nop                                             ; 0DF7 _ 90
        leave                                           ; 0DF8 _ C9
        ret                                             ; 0DF9 _ C3
; init_keyboard End of function

enable_mouse:; Function begin
        push    ebp                                     ; 0DFA _ 55
        mov     ebp, esp                                ; 0DFB _ 89. E5
        sub     esp, 8                                  ; 0DFD _ 83. EC, 08
        call    wait_KBC_sendReady                      ; 0E00 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0E05 _ 83. EC, 08
        push    212                                     ; 0E08 _ 68, 000000D4
        push    100                                     ; 0E0D _ 6A, 64
        call    io_out8                                 ; 0E0F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0E14 _ 83. C4, 10
        call    wait_KBC_sendReady                      ; 0E17 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0E1C _ 83. EC, 08
        push    244                                     ; 0E1F _ 68, 000000F4
        push    96                                      ; 0E24 _ 6A, 60
        call    io_out8                                 ; 0E26 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0E2B _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 0E2E _ 8B. 45, 08
        mov     byte [eax+3H], 0                        ; 0E31 _ C6. 40, 03, 00
        nop                                             ; 0E35 _ 90
        leave                                           ; 0E36 _ C9
        ret                                             ; 0E37 _ C3
; enable_mouse End of function

intHandlerFromMouse:; Function begin
        push    ebp                                     ; 0E38 _ 55
        mov     ebp, esp                                ; 0E39 _ 89. E5
        sub     esp, 24                                 ; 0E3B _ 83. EC, 18
        sub     esp, 8                                  ; 0E3E _ 83. EC, 08
        push    32                                      ; 0E41 _ 6A, 20
        push    160                                     ; 0E43 _ 68, 000000A0
        call    io_out8                                 ; 0E48 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0E4D _ 83. C4, 10
        sub     esp, 8                                  ; 0E50 _ 83. EC, 08
        push    32                                      ; 0E53 _ 6A, 20
        push    32                                      ; 0E55 _ 6A, 20
        call    io_out8                                 ; 0E57 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0E5C _ 83. C4, 10
        sub     esp, 12                                 ; 0E5F _ 83. EC, 0C
        push    96                                      ; 0E62 _ 6A, 60
        call    io_in8                                  ; 0E64 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0E69 _ 83. C4, 10
        mov     byte [ebp-9H], al                       ; 0E6C _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 0E6F _ 0F B6. 45, F7
        sub     esp, 8                                  ; 0E73 _ 83. EC, 08
        push    eax                                     ; 0E76 _ 50
        push    mouseinfo                               ; 0E77 _ 68, 00000008(d)
        call    fifo8_put                               ; 0E7C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0E81 _ 83. C4, 10
        nop                                             ; 0E84 _ 90
        leave                                           ; 0E85 _ C9
        ret                                             ; 0E86 _ C3
; intHandlerFromMouse End of function

mouse_decode:; Function begin
        push    ebp                                     ; 0E87 _ 55
        mov     ebp, esp                                ; 0E88 _ 89. E5
        sub     esp, 4                                  ; 0E8A _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 0E8D _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 0E90 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0E93 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 0E96 _ 0F B6. 40, 03
        test    al, al                                  ; 0E9A _ 84. C0
        jnz     ?_051                                   ; 0E9C _ 75, 17
        cmp     byte [ebp-4H], -6                       ; 0E9E _ 80. 7D, FC, FA
        jnz     ?_050                                   ; 0EA2 _ 75, 07
        mov     eax, dword [ebp+8H]                     ; 0EA4 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 0EA7 _ C6. 40, 03, 01
?_050:  mov     eax, 0                                  ; 0EAB _ B8, 00000000
        jmp     ?_058                                   ; 0EB0 _ E9, 0000010F

?_051:  mov     eax, dword [ebp+8H]                     ; 0EB5 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 0EB8 _ 0F B6. 40, 03
        cmp     al, 1                                   ; 0EBC _ 3C, 01
        jnz     ?_053                                   ; 0EBE _ 75, 28
        movzx   eax, byte [ebp-4H]                      ; 0EC0 _ 0F B6. 45, FC
        and     eax, 0C8H                               ; 0EC4 _ 25, 000000C8
        cmp     eax, 8                                  ; 0EC9 _ 83. F8, 08
        jnz     ?_052                                   ; 0ECC _ 75, 10
        mov     eax, dword [ebp+8H]                     ; 0ECE _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 0ED1 _ 0F B6. 55, FC
        mov     byte [eax], dl                          ; 0ED5 _ 88. 10
        mov     eax, dword [ebp+8H]                     ; 0ED7 _ 8B. 45, 08
        mov     byte [eax+3H], 2                        ; 0EDA _ C6. 40, 03, 02
?_052:  mov     eax, 0                                  ; 0EDE _ B8, 00000000
        jmp     ?_058                                   ; 0EE3 _ E9, 000000DC

?_053:  mov     eax, dword [ebp+8H]                     ; 0EE8 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 0EEB _ 0F B6. 40, 03
        cmp     al, 2                                   ; 0EEF _ 3C, 02
        jnz     ?_054                                   ; 0EF1 _ 75, 1B
        mov     eax, dword [ebp+8H]                     ; 0EF3 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 0EF6 _ 0F B6. 55, FC
        mov     byte [eax+1H], dl                       ; 0EFA _ 88. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0EFD _ 8B. 45, 08
        mov     byte [eax+3H], 3                        ; 0F00 _ C6. 40, 03, 03
        mov     eax, 0                                  ; 0F04 _ B8, 00000000
        jmp     ?_058                                   ; 0F09 _ E9, 000000B6

?_054:  mov     eax, dword [ebp+8H]                     ; 0F0E _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 0F11 _ 0F B6. 40, 03
        cmp     al, 3                                   ; 0F15 _ 3C, 03
        jne     ?_057                                   ; 0F17 _ 0F 85, 000000A2
        mov     eax, dword [ebp+8H]                     ; 0F1D _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 0F20 _ 0F B6. 55, FC
        mov     byte [eax+2H], dl                       ; 0F24 _ 88. 50, 02
        mov     eax, dword [ebp+8H]                     ; 0F27 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 0F2A _ C6. 40, 03, 01
        mov     eax, dword [ebp+8H]                     ; 0F2E _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 0F31 _ 0F B6. 00
        movzx   eax, al                                 ; 0F34 _ 0F B6. C0
        and     eax, 07H                                ; 0F37 _ 83. E0, 07
        mov     edx, eax                                ; 0F3A _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0F3C _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 0F3F _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 0F42 _ 8B. 45, 08
        movzx   eax, byte [eax+1H]                      ; 0F45 _ 0F B6. 40, 01
        movzx   edx, al                                 ; 0F49 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 0F4C _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 0F4F _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0F52 _ 8B. 45, 08
        movzx   eax, byte [eax+2H]                      ; 0F55 _ 0F B6. 40, 02
        movzx   edx, al                                 ; 0F59 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 0F5C _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0F5F _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 0F62 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 0F65 _ 0F B6. 00
        movzx   eax, al                                 ; 0F68 _ 0F B6. C0
        and     eax, 10H                                ; 0F6B _ 83. E0, 10
        test    eax, eax                                ; 0F6E _ 85. C0
        jz      ?_055                                   ; 0F70 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 0F72 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0F75 _ 8B. 40, 04
        or      eax, 0FFFFFF00H                         ; 0F78 _ 0D, FFFFFF00
        mov     edx, eax                                ; 0F7D _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0F7F _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 0F82 _ 89. 50, 04
?_055:  mov     eax, dword [ebp+8H]                     ; 0F85 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 0F88 _ 0F B6. 00
        movzx   eax, al                                 ; 0F8B _ 0F B6. C0
        and     eax, 20H                                ; 0F8E _ 83. E0, 20
        test    eax, eax                                ; 0F91 _ 85. C0
        jz      ?_056                                   ; 0F93 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 0F95 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0F98 _ 8B. 40, 08
        or      eax, 0FFFFFF00H                         ; 0F9B _ 0D, FFFFFF00
        mov     edx, eax                                ; 0FA0 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0FA2 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0FA5 _ 89. 50, 08
?_056:  mov     eax, dword [ebp+8H]                     ; 0FA8 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0FAB _ 8B. 40, 08
        neg     eax                                     ; 0FAE _ F7. D8
        mov     edx, eax                                ; 0FB0 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0FB2 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0FB5 _ 89. 50, 08
        mov     eax, 1                                  ; 0FB8 _ B8, 00000001
        jmp     ?_058                                   ; 0FBD _ EB, 05

?_057:  mov     eax, 4294967295                         ; 0FBF _ B8, FFFFFFFF
?_058:  leave                                           ; 0FC4 _ C9
        ret                                             ; 0FC5 _ C3
; mouse_decode End of function

computeMousePosition:; Function begin
        push    ebp                                     ; 0FC6 _ 55
        mov     ebp, esp                                ; 0FC7 _ 89. E5
        sub     esp, 24                                 ; 0FC9 _ 83. EC, 18
        movzx   eax, word [?_172]                       ; 0FCC _ 0F B7. 05, 00000004(d)
        cwde                                            ; 0FD3 _ 98
        mov     dword [ebp-14H], eax                    ; 0FD4 _ 89. 45, EC
        movzx   eax, word [?_173]                       ; 0FD7 _ 0F B7. 05, 00000006(d)
        cwde                                            ; 0FDE _ 98
        mov     dword [ebp-10H], eax                    ; 0FDF _ 89. 45, F0
        mov     eax, dword [ebp+10H]                    ; 0FE2 _ 8B. 45, 10
        mov     dword [eax+4H], 16                      ; 0FE5 _ C7. 40, 04, 00000010
        mov     eax, dword [ebp+10H]                    ; 0FEC _ 8B. 45, 10
        mov     dword [eax+8H], 16                      ; 0FEF _ C7. 40, 08, 00000010
        mov     eax, dword [ebp+14H]                    ; 0FF6 _ 8B. 45, 14
        mov     edx, dword [eax+4H]                     ; 0FF9 _ 8B. 50, 04
        mov     eax, dword [mx]                         ; 0FFC _ A1, 000000F0(d)
        add     eax, edx                                ; 1001 _ 01. D0
        mov     dword [mx], eax                         ; 1003 _ A3, 000000F0(d)
        mov     eax, dword [ebp+14H]                    ; 1008 _ 8B. 45, 14
        mov     edx, dword [eax+8H]                     ; 100B _ 8B. 50, 08
        mov     eax, dword [my]                         ; 100E _ A1, 000000F4(d)
        add     eax, edx                                ; 1013 _ 01. D0
        mov     dword [my], eax                         ; 1015 _ A3, 000000F4(d)
        mov     eax, dword [mx]                         ; 101A _ A1, 000000F0(d)
        test    eax, eax                                ; 101F _ 85. C0
        jns     ?_059                                   ; 1021 _ 79, 0A
        mov     dword [mx], 0                           ; 1023 _ C7. 05, 000000F0(d), 00000000
?_059:  mov     eax, dword [my]                         ; 102D _ A1, 000000F4(d)
        test    eax, eax                                ; 1032 _ 85. C0
        jns     ?_060                                   ; 1034 _ 79, 0A
        mov     dword [my], 0                           ; 1036 _ C7. 05, 000000F4(d), 00000000
?_060:  mov     eax, dword [ebp-10H]                    ; 1040 _ 8B. 45, F0
        lea     edx, [eax-10H]                          ; 1043 _ 8D. 50, F0
        mov     eax, dword [my]                         ; 1046 _ A1, 000000F4(d)
        cmp     edx, eax                                ; 104B _ 39. C2
        jge     ?_061                                   ; 104D _ 7D, 10
        mov     eax, dword [my]                         ; 104F _ A1, 000000F4(d)
        mov     edx, dword [ebp-10H]                    ; 1054 _ 8B. 55, F0
        sub     edx, eax                                ; 1057 _ 29. C2
        mov     eax, dword [ebp+10H]                    ; 1059 _ 8B. 45, 10
        mov     dword [eax+8H], edx                     ; 105C _ 89. 50, 08
?_061:  mov     dword [ebp-0CH], 1                      ; 105F _ C7. 45, F4, 00000001
        mov     eax, dword [ebp-14H]                    ; 1066 _ 8B. 45, EC
        sub     eax, dword [ebp-0CH]                    ; 1069 _ 2B. 45, F4
        mov     edx, eax                                ; 106C _ 89. C2
        mov     eax, dword [mx]                         ; 106E _ A1, 000000F0(d)
        cmp     edx, eax                                ; 1073 _ 39. C2
        jge     ?_062                                   ; 1075 _ 7D, 14
        mov     eax, dword [ebp-14H]                    ; 1077 _ 8B. 45, EC
        sub     eax, dword [ebp-0CH]                    ; 107A _ 2B. 45, F4
        mov     dword [mx], eax                         ; 107D _ A3, 000000F0(d)
        mov     eax, dword [ebp+10H]                    ; 1082 _ 8B. 45, 10
        mov     edx, dword [ebp-0CH]                    ; 1085 _ 8B. 55, F4
        mov     dword [eax+4H], edx                     ; 1088 _ 89. 50, 04
?_062:  mov     eax, dword [ebp-10H]                    ; 108B _ 8B. 45, F0
        sub     eax, dword [ebp-0CH]                    ; 108E _ 2B. 45, F4
        mov     edx, eax                                ; 1091 _ 89. C2
        mov     eax, dword [my]                         ; 1093 _ A1, 000000F4(d)
        cmp     edx, eax                                ; 1098 _ 39. C2
        jge     ?_063                                   ; 109A _ 7D, 14
        mov     eax, dword [ebp-10H]                    ; 109C _ 8B. 45, F0
        sub     eax, dword [ebp-0CH]                    ; 109F _ 2B. 45, F4
        mov     dword [my], eax                         ; 10A2 _ A3, 000000F4(d)
        mov     eax, dword [ebp+10H]                    ; 10A7 _ 8B. 45, 10
        mov     edx, dword [ebp-0CH]                    ; 10AA _ 8B. 55, F4
        mov     dword [eax+8H], edx                     ; 10AD _ 89. 50, 08
?_063:  sub     esp, 8                                  ; 10B0 _ 83. EC, 08
        push    ?_163                                   ; 10B3 _ 68, 0000001C(d)
        push    7                                       ; 10B8 _ 6A, 07
        push    0                                       ; 10BA _ 6A, 00
        push    0                                       ; 10BC _ 6A, 00
        push    dword [ebp+0CH]                         ; 10BE _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 10C1 _ FF. 75, 08
        call    showString                              ; 10C4 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 10C9 _ 83. C4, 20
        nop                                             ; 10CC _ 90
        leave                                           ; 10CD _ C9
        ret                                             ; 10CE _ C3
; computeMousePosition End of function

show_mouse_info:; Function begin
        push    ebp                                     ; 10CF _ 55
        mov     ebp, esp                                ; 10D0 _ 89. E5
        sub     esp, 24                                 ; 10D2 _ 83. EC, 18
        mov     eax, dword [buf_back]                   ; 10D5 _ A1, 000000F8(d)
        mov     dword [ebp-0CH], eax                    ; 10DA _ 89. 45, F4
        mov     byte [ebp-0DH], 0                       ; 10DD _ C6. 45, F3, 00
        call    io_sti                                  ; 10E1 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 10E6 _ 83. EC, 0C
        push    mouseinfo                               ; 10E9 _ 68, 00000008(d)
        call    fifo8_get                               ; 10EE _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 10F3 _ 83. C4, 10
        mov     byte [ebp-0DH], al                      ; 10F6 _ 88. 45, F3
        movzx   eax, byte [ebp-0DH]                     ; 10F9 _ 0F B6. 45, F3
        sub     esp, 8                                  ; 10FD _ 83. EC, 08
        push    eax                                     ; 1100 _ 50
        push    mdec                                    ; 1101 _ 68, 000000E0(d)
        call    mouse_decode                            ; 1106 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 110B _ 83. C4, 10
        cmp     eax, 1                                  ; 110E _ 83. F8, 01
        jnz     ?_065                                   ; 1111 _ 75, 7A
        push    mdec                                    ; 1113 _ 68, 000000E0(d)
        push    dword [ebp+10H]                         ; 1118 _ FF. 75, 10
        push    dword [ebp+0CH]                         ; 111B _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 111E _ FF. 75, 08
        call    computeMousePosition                    ; 1121 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1126 _ 83. C4, 10
        mov     eax, dword [?_174]                      ; 1129 _ A1, 000000EC(d)
        and     eax, 01H                                ; 112E _ 83. E0, 01
        test    eax, eax                                ; 1131 _ 85. C0
        jz      ?_064                                   ; 1133 _ 74, 3D
        mov     edx, dword [mx]                         ; 1135 _ 8B. 15, 000000F0(d)
        mov     eax, dword [ebp+10H]                    ; 113B _ 8B. 45, 10
        mov     dword [eax+0CH], edx                    ; 113E _ 89. 50, 0C
        mov     edx, dword [my]                         ; 1141 _ 8B. 15, 000000F4(d)
        mov     eax, dword [ebp+10H]                    ; 1147 _ 8B. 45, 10
        mov     dword [eax+10H], edx                    ; 114A _ 89. 50, 10
        mov     eax, dword [my]                         ; 114D _ A1, 000000F4(d)
        lea     ecx, [eax-8H]                           ; 1152 _ 8D. 48, F8
        mov     eax, dword [mx]                         ; 1155 _ A1, 000000F0(d)
        lea     edx, [eax-50H]                          ; 115A _ 8D. 50, B0
        mov     eax, dword [shtMsgBox]                  ; 115D _ A1, 00000278(d)
        push    ecx                                     ; 1162 _ 51
        push    edx                                     ; 1163 _ 52
        push    eax                                     ; 1164 _ 50
        push    dword [ebp+8H]                          ; 1165 _ FF. 75, 08
        call    sheet_slide                             ; 1168 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 116D _ 83. C4, 10
        jmp     ?_065                                   ; 1170 _ EB, 1B

?_064:  mov     edx, dword [my]                         ; 1172 _ 8B. 15, 000000F4(d)
        mov     eax, dword [mx]                         ; 1178 _ A1, 000000F0(d)
        push    edx                                     ; 117D _ 52
        push    eax                                     ; 117E _ 50
        push    dword [ebp+10H]                         ; 117F _ FF. 75, 10
        push    dword [ebp+8H]                          ; 1182 _ FF. 75, 08
        call    sheet_slide_mouse                       ; 1185 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 118A _ 83. C4, 10
?_065:  nop                                             ; 118D _ 90
        leave                                           ; 118E _ C9
        ret                                             ; 118F _ C3
; show_mouse_info End of function

showMemoryInfo:; Function begin
        push    ebp                                     ; 1190 _ 55
        mov     ebp, esp                                ; 1191 _ 89. E5
        sub     esp, 56                                 ; 1193 _ 83. EC, 38
        mov     dword [ebp-30H], 0                      ; 1196 _ C7. 45, D0, 00000000
        mov     dword [ebp-2CH], 0                      ; 119D _ C7. 45, D4, 00000000
        mov     dword [ebp-28H], 104                    ; 11A4 _ C7. 45, D8, 00000068
        mov     dword [ebp-24H], 80                     ; 11AB _ C7. 45, DC, 00000050
        mov     edx, dword [ysize]                      ; 11B2 _ 8B. 15, 00000204(d)
        mov     eax, dword [ebp+0CH]                    ; 11B8 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 11BB _ 8B. 00
        sub     esp, 4                                  ; 11BD _ 83. EC, 04
        push    edx                                     ; 11C0 _ 52
        push    dword [ebp+1CH]                         ; 11C1 _ FF. 75, 1C
        push    eax                                     ; 11C4 _ 50
        call    init_screen8                            ; 11C5 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 11CA _ 83. C4, 10
        mov     eax, dword [ebp+20H]                    ; 11CD _ 8B. 45, 20
        movsx   eax, al                                 ; 11D0 _ 0F BE. C0
        sub     esp, 8                                  ; 11D3 _ 83. EC, 08
        push    ?_164                                   ; 11D6 _ 68, 00000034(d)
        push    eax                                     ; 11DB _ 50
        push    dword [ebp-2CH]                         ; 11DC _ FF. 75, D4
        push    dword [ebp-30H]                         ; 11DF _ FF. 75, D0
        push    dword [ebp+0CH]                         ; 11E2 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 11E5 _ FF. 75, 08
        call    showString                              ; 11E8 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 11ED _ 83. C4, 20
        mov     eax, dword [ebp+18H]                    ; 11F0 _ 8B. 45, 18
        sub     esp, 12                                 ; 11F3 _ 83. EC, 0C
        push    eax                                     ; 11F6 _ 50
        call    intToHexStr                             ; 11F7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 11FC _ 83. C4, 10
        mov     dword [ebp-20H], eax                    ; 11FF _ 89. 45, E0
        mov     eax, dword [ebp+20H]                    ; 1202 _ 8B. 45, 20
        movsx   eax, al                                 ; 1205 _ 0F BE. C0
        sub     esp, 8                                  ; 1208 _ 83. EC, 08
        push    dword [ebp-20H]                         ; 120B _ FF. 75, E0
        push    eax                                     ; 120E _ 50
        push    dword [ebp-2CH]                         ; 120F _ FF. 75, D4
        push    dword [ebp-28H]                         ; 1212 _ FF. 75, D8
        push    dword [ebp+0CH]                         ; 1215 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1218 _ FF. 75, 08
        call    showString                              ; 121B _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1220 _ 83. C4, 20
        add     dword [ebp-2CH], 16                     ; 1223 _ 83. 45, D4, 10
        mov     eax, dword [ebp+20H]                    ; 1227 _ 8B. 45, 20
        movsx   eax, al                                 ; 122A _ 0F BE. C0
        sub     esp, 8                                  ; 122D _ 83. EC, 08
        push    ?_165                                   ; 1230 _ 68, 0000003E(d)
        push    eax                                     ; 1235 _ 50
        push    dword [ebp-2CH]                         ; 1236 _ FF. 75, D4
        push    dword [ebp-30H]                         ; 1239 _ FF. 75, D0
        push    dword [ebp+0CH]                         ; 123C _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 123F _ FF. 75, 08
        call    showString                              ; 1242 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1247 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 124A _ 8B. 45, 10
        mov     eax, dword [eax]                        ; 124D _ 8B. 00
        sub     esp, 12                                 ; 124F _ 83. EC, 0C
        push    eax                                     ; 1252 _ 50
        call    intToHexStr                             ; 1253 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1258 _ 83. C4, 10
        mov     dword [ebp-1CH], eax                    ; 125B _ 89. 45, E4
        mov     eax, dword [ebp+20H]                    ; 125E _ 8B. 45, 20
        movsx   eax, al                                 ; 1261 _ 0F BE. C0
        sub     esp, 8                                  ; 1264 _ 83. EC, 08
        push    dword [ebp-1CH]                         ; 1267 _ FF. 75, E4
        push    eax                                     ; 126A _ 50
        push    dword [ebp-2CH]                         ; 126B _ FF. 75, D4
        push    dword [ebp-28H]                         ; 126E _ FF. 75, D8
        push    dword [ebp+0CH]                         ; 1271 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1274 _ FF. 75, 08
        call    showString                              ; 1277 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 127C _ 83. C4, 20
        add     dword [ebp-2CH], 16                     ; 127F _ 83. 45, D4, 10
        mov     eax, dword [ebp+20H]                    ; 1283 _ 8B. 45, 20
        movsx   eax, al                                 ; 1286 _ 0F BE. C0
        sub     esp, 8                                  ; 1289 _ 83. EC, 08
        push    ?_166                                   ; 128C _ 68, 0000004A(d)
        push    eax                                     ; 1291 _ 50
        push    dword [ebp-2CH]                         ; 1292 _ FF. 75, D4
        push    dword [ebp-30H]                         ; 1295 _ FF. 75, D0
        push    dword [ebp+0CH]                         ; 1298 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 129B _ FF. 75, 08
        call    showString                              ; 129E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 12A3 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 12A6 _ 8B. 45, 10
        mov     eax, dword [eax+4H]                     ; 12A9 _ 8B. 40, 04
        sub     esp, 12                                 ; 12AC _ 83. EC, 0C
        push    eax                                     ; 12AF _ 50
        call    intToHexStr                             ; 12B0 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 12B5 _ 83. C4, 10
        mov     dword [ebp-18H], eax                    ; 12B8 _ 89. 45, E8
        mov     eax, dword [ebp+20H]                    ; 12BB _ 8B. 45, 20
        movsx   eax, al                                 ; 12BE _ 0F BE. C0
        sub     esp, 8                                  ; 12C1 _ 83. EC, 08
        push    dword [ebp-18H]                         ; 12C4 _ FF. 75, E8
        push    eax                                     ; 12C7 _ 50
        push    dword [ebp-2CH]                         ; 12C8 _ FF. 75, D4
        push    dword [ebp-28H]                         ; 12CB _ FF. 75, D8
        push    dword [ebp+0CH]                         ; 12CE _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 12D1 _ FF. 75, 08
        call    showString                              ; 12D4 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 12D9 _ 83. C4, 20
        add     dword [ebp-2CH], 16                     ; 12DC _ 83. 45, D4, 10
        mov     eax, dword [ebp+20H]                    ; 12E0 _ 8B. 45, 20
        movsx   eax, al                                 ; 12E3 _ 0F BE. C0
        sub     esp, 8                                  ; 12E6 _ 83. EC, 08
        push    ?_167                                   ; 12E9 _ 68, 00000056(d)
        push    eax                                     ; 12EE _ 50
        push    dword [ebp-2CH]                         ; 12EF _ FF. 75, D4
        push    dword [ebp-30H]                         ; 12F2 _ FF. 75, D0
        push    dword [ebp+0CH]                         ; 12F5 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 12F8 _ FF. 75, 08
        call    showString                              ; 12FB _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1300 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 1303 _ 8B. 45, 10
        mov     eax, dword [eax+8H]                     ; 1306 _ 8B. 40, 08
        sub     esp, 12                                 ; 1309 _ 83. EC, 0C
        push    eax                                     ; 130C _ 50
        call    intToHexStr                             ; 130D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1312 _ 83. C4, 10
        mov     dword [ebp-14H], eax                    ; 1315 _ 89. 45, EC
        mov     eax, dword [ebp+20H]                    ; 1318 _ 8B. 45, 20
        movsx   eax, al                                 ; 131B _ 0F BE. C0
        sub     esp, 8                                  ; 131E _ 83. EC, 08
        push    dword [ebp-14H]                         ; 1321 _ FF. 75, EC
        push    eax                                     ; 1324 _ 50
        push    dword [ebp-2CH]                         ; 1325 _ FF. 75, D4
        push    dword [ebp-28H]                         ; 1328 _ FF. 75, D8
        push    dword [ebp+0CH]                         ; 132B _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 132E _ FF. 75, 08
        call    showString                              ; 1331 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1336 _ 83. C4, 20
        add     dword [ebp-2CH], 16                     ; 1339 _ 83. 45, D4, 10
        mov     eax, dword [ebp+20H]                    ; 133D _ 8B. 45, 20
        movsx   eax, al                                 ; 1340 _ 0F BE. C0
        sub     esp, 8                                  ; 1343 _ 83. EC, 08
        push    ?_168                                   ; 1346 _ 68, 00000062(d)
        push    eax                                     ; 134B _ 50
        push    dword [ebp-2CH]                         ; 134C _ FF. 75, D4
        push    dword [ebp-30H]                         ; 134F _ FF. 75, D0
        push    dword [ebp+0CH]                         ; 1352 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1355 _ FF. 75, 08
        call    showString                              ; 1358 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 135D _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 1360 _ 8B. 45, 10
        mov     eax, dword [eax+0CH]                    ; 1363 _ 8B. 40, 0C
        sub     esp, 12                                 ; 1366 _ 83. EC, 0C
        push    eax                                     ; 1369 _ 50
        call    intToHexStr                             ; 136A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 136F _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 1372 _ 89. 45, F0
        mov     eax, dword [ebp+20H]                    ; 1375 _ 8B. 45, 20
        movsx   eax, al                                 ; 1378 _ 0F BE. C0
        sub     esp, 8                                  ; 137B _ 83. EC, 08
        push    dword [ebp-10H]                         ; 137E _ FF. 75, F0
        push    eax                                     ; 1381 _ 50
        push    dword [ebp-2CH]                         ; 1382 _ FF. 75, D4
        push    dword [ebp-28H]                         ; 1385 _ FF. 75, D8
        push    dword [ebp+0CH]                         ; 1388 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 138B _ FF. 75, 08
        call    showString                              ; 138E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1393 _ 83. C4, 20
        add     dword [ebp-2CH], 16                     ; 1396 _ 83. 45, D4, 10
        mov     eax, dword [ebp+20H]                    ; 139A _ 8B. 45, 20
        movsx   eax, al                                 ; 139D _ 0F BE. C0
        sub     esp, 8                                  ; 13A0 _ 83. EC, 08
        push    ?_169                                   ; 13A3 _ 68, 0000006F(d)
        push    eax                                     ; 13A8 _ 50
        push    dword [ebp-2CH]                         ; 13A9 _ FF. 75, D4
        push    dword [ebp-30H]                         ; 13AC _ FF. 75, D0
        push    dword [ebp+0CH]                         ; 13AF _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 13B2 _ FF. 75, 08
        call    showString                              ; 13B5 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 13BA _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 13BD _ 8B. 45, 10
        mov     eax, dword [eax+10H]                    ; 13C0 _ 8B. 40, 10
        sub     esp, 12                                 ; 13C3 _ 83. EC, 0C
        push    eax                                     ; 13C6 _ 50
        call    intToHexStr                             ; 13C7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 13CC _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 13CF _ 89. 45, F4
        mov     eax, dword [ebp+20H]                    ; 13D2 _ 8B. 45, 20
        movsx   eax, al                                 ; 13D5 _ 0F BE. C0
        sub     esp, 8                                  ; 13D8 _ 83. EC, 08
        push    dword [ebp-0CH]                         ; 13DB _ FF. 75, F4
        push    eax                                     ; 13DE _ 50
        push    dword [ebp-2CH]                         ; 13DF _ FF. 75, D4
        push    dword [ebp-28H]                         ; 13E2 _ FF. 75, D8
        push    dword [ebp+0CH]                         ; 13E5 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 13E8 _ FF. 75, 08
        call    showString                              ; 13EB _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 13F0 _ 83. C4, 20
        nop                                             ; 13F3 _ 90
        leave                                           ; 13F4 _ C9
        ret                                             ; 13F5 _ C3
; showMemoryInfo End of function

init_screen8:; Function begin
        push    ebp                                     ; 13F6 _ 55
        mov     ebp, esp                                ; 13F7 _ 89. E5
        push    ebx                                     ; 13F9 _ 53
        mov     eax, dword [ebp+10H]                    ; 13FA _ 8B. 45, 10
        lea     edx, [eax-1DH]                          ; 13FD _ 8D. 50, E3
        mov     eax, dword [ebp+0CH]                    ; 1400 _ 8B. 45, 0C
        sub     eax, 1                                  ; 1403 _ 83. E8, 01
        push    edx                                     ; 1406 _ 52
        push    eax                                     ; 1407 _ 50
        push    0                                       ; 1408 _ 6A, 00
        push    0                                       ; 140A _ 6A, 00
        push    14                                      ; 140C _ 6A, 0E
        push    dword [ebp+0CH]                         ; 140E _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1411 _ FF. 75, 08
        call    boxfill8                                ; 1414 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1419 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 141C _ 8B. 45, 10
        lea     ecx, [eax-1CH]                          ; 141F _ 8D. 48, E4
        mov     eax, dword [ebp+0CH]                    ; 1422 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 1425 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 1428 _ 8B. 45, 10
        sub     eax, 28                                 ; 142B _ 83. E8, 1C
        push    ecx                                     ; 142E _ 51
        push    edx                                     ; 142F _ 52
        push    eax                                     ; 1430 _ 50
        push    0                                       ; 1431 _ 6A, 00
        push    8                                       ; 1433 _ 6A, 08
        push    dword [ebp+0CH]                         ; 1435 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1438 _ FF. 75, 08
        call    boxfill8                                ; 143B _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1440 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 1443 _ 8B. 45, 10
        lea     ecx, [eax-1BH]                          ; 1446 _ 8D. 48, E5
        mov     eax, dword [ebp+0CH]                    ; 1449 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 144C _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 144F _ 8B. 45, 10
        sub     eax, 27                                 ; 1452 _ 83. E8, 1B
        push    ecx                                     ; 1455 _ 51
        push    edx                                     ; 1456 _ 52
        push    eax                                     ; 1457 _ 50
        push    0                                       ; 1458 _ 6A, 00
        push    7                                       ; 145A _ 6A, 07
        push    dword [ebp+0CH]                         ; 145C _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 145F _ FF. 75, 08
        call    boxfill8                                ; 1462 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1467 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 146A _ 8B. 45, 10
        lea     ecx, [eax-1H]                           ; 146D _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 1470 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 1473 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 1476 _ 8B. 45, 10
        sub     eax, 26                                 ; 1479 _ 83. E8, 1A
        push    ecx                                     ; 147C _ 51
        push    edx                                     ; 147D _ 52
        push    eax                                     ; 147E _ 50
        push    0                                       ; 147F _ 6A, 00
        push    8                                       ; 1481 _ 6A, 08
        push    dword [ebp+0CH]                         ; 1483 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1486 _ FF. 75, 08
        call    boxfill8                                ; 1489 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 148E _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 1491 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 1494 _ 8D. 50, E8
        mov     eax, dword [ebp+10H]                    ; 1497 _ 8B. 45, 10
        sub     eax, 24                                 ; 149A _ 83. E8, 18
        push    edx                                     ; 149D _ 52
        push    59                                      ; 149E _ 6A, 3B
        push    eax                                     ; 14A0 _ 50
        push    3                                       ; 14A1 _ 6A, 03
        push    7                                       ; 14A3 _ 6A, 07
        push    dword [ebp+0CH]                         ; 14A5 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 14A8 _ FF. 75, 08
        call    boxfill8                                ; 14AB _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 14B0 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 14B3 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 14B6 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 14B9 _ 8B. 45, 10
        sub     eax, 24                                 ; 14BC _ 83. E8, 18
        push    edx                                     ; 14BF _ 52
        push    2                                       ; 14C0 _ 6A, 02
        push    eax                                     ; 14C2 _ 50
        push    2                                       ; 14C3 _ 6A, 02
        push    7                                       ; 14C5 _ 6A, 07
        push    dword [ebp+0CH]                         ; 14C7 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 14CA _ FF. 75, 08
        call    boxfill8                                ; 14CD _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 14D2 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 14D5 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 14D8 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 14DB _ 8B. 45, 10
        sub     eax, 4                                  ; 14DE _ 83. E8, 04
        push    edx                                     ; 14E1 _ 52
        push    59                                      ; 14E2 _ 6A, 3B
        push    eax                                     ; 14E4 _ 50
        push    3                                       ; 14E5 _ 6A, 03
        push    15                                      ; 14E7 _ 6A, 0F
        push    dword [ebp+0CH]                         ; 14E9 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 14EC _ FF. 75, 08
        call    boxfill8                                ; 14EF _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 14F4 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 14F7 _ 8B. 45, 10
        lea     edx, [eax-5H]                           ; 14FA _ 8D. 50, FB
        mov     eax, dword [ebp+10H]                    ; 14FD _ 8B. 45, 10
        sub     eax, 23                                 ; 1500 _ 83. E8, 17
        push    edx                                     ; 1503 _ 52
        push    59                                      ; 1504 _ 6A, 3B
        push    eax                                     ; 1506 _ 50
        push    59                                      ; 1507 _ 6A, 3B
        push    15                                      ; 1509 _ 6A, 0F
        push    dword [ebp+0CH]                         ; 150B _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 150E _ FF. 75, 08
        call    boxfill8                                ; 1511 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1516 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 1519 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 151C _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 151F _ 8B. 45, 10
        sub     eax, 3                                  ; 1522 _ 83. E8, 03
        push    edx                                     ; 1525 _ 52
        push    59                                      ; 1526 _ 6A, 3B
        push    eax                                     ; 1528 _ 50
        push    2                                       ; 1529 _ 6A, 02
        push    0                                       ; 152B _ 6A, 00
        push    dword [ebp+0CH]                         ; 152D _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1530 _ FF. 75, 08
        call    boxfill8                                ; 1533 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1538 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 153B _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 153E _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 1541 _ 8B. 45, 10
        sub     eax, 24                                 ; 1544 _ 83. E8, 18
        push    edx                                     ; 1547 _ 52
        push    60                                      ; 1548 _ 6A, 3C
        push    eax                                     ; 154A _ 50
        push    60                                      ; 154B _ 6A, 3C
        push    0                                       ; 154D _ 6A, 00
        push    dword [ebp+0CH]                         ; 154F _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1552 _ FF. 75, 08
        call    boxfill8                                ; 1555 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 155A _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 155D _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 1560 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 1563 _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 1566 _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 1569 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 156C _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 156F _ 8B. 45, 0C
        sub     eax, 47                                 ; 1572 _ 83. E8, 2F
        push    ebx                                     ; 1575 _ 53
        push    ecx                                     ; 1576 _ 51
        push    edx                                     ; 1577 _ 52
        push    eax                                     ; 1578 _ 50
        push    7                                       ; 1579 _ 6A, 07
        push    dword [ebp+0CH]                         ; 157B _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 157E _ FF. 75, 08
        call    boxfill8                                ; 1581 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1586 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 1589 _ 8B. 45, 10
        lea     ebx, [eax-4H]                           ; 158C _ 8D. 58, FC
        mov     eax, dword [ebp+0CH]                    ; 158F _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 1592 _ 8D. 48, FD
        mov     eax, dword [ebp+10H]                    ; 1595 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 1598 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 159B _ 8B. 45, 0C
        sub     eax, 3                                  ; 159E _ 83. E8, 03
        push    ebx                                     ; 15A1 _ 53
        push    ecx                                     ; 15A2 _ 51
        push    edx                                     ; 15A3 _ 52
        push    eax                                     ; 15A4 _ 50
        push    7                                       ; 15A5 _ 6A, 07
        push    dword [ebp+0CH]                         ; 15A7 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 15AA _ FF. 75, 08
        call    boxfill8                                ; 15AD _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 15B2 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 15B5 _ 8B. 45, 10
        lea     ebx, [eax-18H]                          ; 15B8 _ 8D. 58, E8
        mov     eax, dword [ebp+0CH]                    ; 15BB _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 15BE _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 15C1 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 15C4 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 15C7 _ 8B. 45, 0C
        sub     eax, 47                                 ; 15CA _ 83. E8, 2F
        push    ebx                                     ; 15CD _ 53
        push    ecx                                     ; 15CE _ 51
        push    edx                                     ; 15CF _ 52
        push    eax                                     ; 15D0 _ 50
        push    15                                      ; 15D1 _ 6A, 0F
        push    dword [ebp+0CH]                         ; 15D3 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 15D6 _ FF. 75, 08
        call    boxfill8                                ; 15D9 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 15DE _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 15E1 _ 8B. 45, 10
        lea     ebx, [eax-4H]                           ; 15E4 _ 8D. 58, FC
        mov     eax, dword [ebp+0CH]                    ; 15E7 _ 8B. 45, 0C
        lea     ecx, [eax-2FH]                          ; 15EA _ 8D. 48, D1
        mov     eax, dword [ebp+10H]                    ; 15ED _ 8B. 45, 10
        lea     edx, [eax-17H]                          ; 15F0 _ 8D. 50, E9
        mov     eax, dword [ebp+0CH]                    ; 15F3 _ 8B. 45, 0C
        sub     eax, 47                                 ; 15F6 _ 83. E8, 2F
        push    ebx                                     ; 15F9 _ 53
        push    ecx                                     ; 15FA _ 51
        push    edx                                     ; 15FB _ 52
        push    eax                                     ; 15FC _ 50
        push    15                                      ; 15FD _ 6A, 0F
        push    dword [ebp+0CH]                         ; 15FF _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1602 _ FF. 75, 08
        call    boxfill8                                ; 1605 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 160A _ 83. C4, 1C
        nop                                             ; 160D _ 90
        mov     ebx, dword [ebp-4H]                     ; 160E _ 8B. 5D, FC
        leave                                           ; 1611 _ C9
        ret                                             ; 1612 _ C3
; init_screen8 End of function

make_window8:; Function begin
        push    ebp                                     ; 1613 _ 55
        mov     ebp, esp                                ; 1614 _ 89. E5
        push    ebx                                     ; 1616 _ 53
        sub     esp, 36                                 ; 1617 _ 83. EC, 24
        mov     eax, dword [ebp+0CH]                    ; 161A _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 161D _ 8B. 40, 04
        mov     dword [ebp-10H], eax                    ; 1620 _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 1623 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 1626 _ 8B. 40, 08
        mov     dword [ebp-0CH], eax                    ; 1629 _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 162C _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 162F _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1632 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1635 _ 8B. 00
        push    0                                       ; 1637 _ 6A, 00
        push    edx                                     ; 1639 _ 52
        push    0                                       ; 163A _ 6A, 00
        push    0                                       ; 163C _ 6A, 00
        push    8                                       ; 163E _ 6A, 08
        push    dword [ebp-10H]                         ; 1640 _ FF. 75, F0
        push    eax                                     ; 1643 _ 50
        call    boxfill8                                ; 1644 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1649 _ 83. C4, 1C
        mov     eax, dword [ebp-10H]                    ; 164C _ 8B. 45, F0
        lea     edx, [eax-2H]                           ; 164F _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 1652 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1655 _ 8B. 00
        push    1                                       ; 1657 _ 6A, 01
        push    edx                                     ; 1659 _ 52
        push    1                                       ; 165A _ 6A, 01
        push    1                                       ; 165C _ 6A, 01
        push    7                                       ; 165E _ 6A, 07
        push    dword [ebp-10H]                         ; 1660 _ FF. 75, F0
        push    eax                                     ; 1663 _ 50
        call    boxfill8                                ; 1664 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1669 _ 83. C4, 1C
        mov     eax, dword [ebp-0CH]                    ; 166C _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 166F _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1672 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1675 _ 8B. 00
        push    edx                                     ; 1677 _ 52
        push    0                                       ; 1678 _ 6A, 00
        push    0                                       ; 167A _ 6A, 00
        push    0                                       ; 167C _ 6A, 00
        push    8                                       ; 167E _ 6A, 08
        push    dword [ebp-10H]                         ; 1680 _ FF. 75, F0
        push    eax                                     ; 1683 _ 50
        call    boxfill8                                ; 1684 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1689 _ 83. C4, 1C
        mov     eax, dword [ebp-0CH]                    ; 168C _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 168F _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1692 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1695 _ 8B. 00
        push    edx                                     ; 1697 _ 52
        push    1                                       ; 1698 _ 6A, 01
        push    1                                       ; 169A _ 6A, 01
        push    1                                       ; 169C _ 6A, 01
        push    8                                       ; 169E _ 6A, 08
        push    dword [ebp-10H]                         ; 16A0 _ FF. 75, F0
        push    eax                                     ; 16A3 _ 50
        call    boxfill8                                ; 16A4 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 16A9 _ 83. C4, 1C
        mov     eax, dword [ebp-0CH]                    ; 16AC _ 8B. 45, F4
        lea     ebx, [eax-2H]                           ; 16AF _ 8D. 58, FE
        mov     eax, dword [ebp-10H]                    ; 16B2 _ 8B. 45, F0
        lea     ecx, [eax-2H]                           ; 16B5 _ 8D. 48, FE
        mov     eax, dword [ebp-10H]                    ; 16B8 _ 8B. 45, F0
        lea     edx, [eax-2H]                           ; 16BB _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 16BE _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 16C1 _ 8B. 00
        push    ebx                                     ; 16C3 _ 53
        push    ecx                                     ; 16C4 _ 51
        push    1                                       ; 16C5 _ 6A, 01
        push    edx                                     ; 16C7 _ 52
        push    15                                      ; 16C8 _ 6A, 0F
        push    dword [ebp-10H]                         ; 16CA _ FF. 75, F0
        push    eax                                     ; 16CD _ 50
        call    boxfill8                                ; 16CE _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 16D3 _ 83. C4, 1C
        mov     eax, dword [ebp-0CH]                    ; 16D6 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 16D9 _ 8D. 58, FF
        mov     eax, dword [ebp-10H]                    ; 16DC _ 8B. 45, F0
        lea     ecx, [eax-1H]                           ; 16DF _ 8D. 48, FF
        mov     eax, dword [ebp-10H]                    ; 16E2 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 16E5 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 16E8 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 16EB _ 8B. 00
        push    ebx                                     ; 16ED _ 53
        push    ecx                                     ; 16EE _ 51
        push    0                                       ; 16EF _ 6A, 00
        push    edx                                     ; 16F1 _ 52
        push    0                                       ; 16F2 _ 6A, 00
        push    dword [ebp-10H]                         ; 16F4 _ FF. 75, F0
        push    eax                                     ; 16F7 _ 50
        call    boxfill8                                ; 16F8 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 16FD _ 83. C4, 1C
        mov     eax, dword [ebp-0CH]                    ; 1700 _ 8B. 45, F4
        lea     ecx, [eax-3H]                           ; 1703 _ 8D. 48, FD
        mov     eax, dword [ebp-10H]                    ; 1706 _ 8B. 45, F0
        lea     edx, [eax-3H]                           ; 1709 _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 170C _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 170F _ 8B. 00
        push    ecx                                     ; 1711 _ 51
        push    edx                                     ; 1712 _ 52
        push    2                                       ; 1713 _ 6A, 02
        push    2                                       ; 1715 _ 6A, 02
        push    8                                       ; 1717 _ 6A, 08
        push    dword [ebp-10H]                         ; 1719 _ FF. 75, F0
        push    eax                                     ; 171C _ 50
        call    boxfill8                                ; 171D _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1722 _ 83. C4, 1C
        mov     eax, dword [ebp-10H]                    ; 1725 _ 8B. 45, F0
        lea     edx, [eax-4H]                           ; 1728 _ 8D. 50, FC
        mov     eax, dword [ebp+0CH]                    ; 172B _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 172E _ 8B. 00
        push    20                                      ; 1730 _ 6A, 14
        push    edx                                     ; 1732 _ 52
        push    3                                       ; 1733 _ 6A, 03
        push    3                                       ; 1735 _ 6A, 03
        push    12                                      ; 1737 _ 6A, 0C
        push    dword [ebp-10H]                         ; 1739 _ FF. 75, F0
        push    eax                                     ; 173C _ 50
        call    boxfill8                                ; 173D _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1742 _ 83. C4, 1C
        mov     eax, dword [ebp-0CH]                    ; 1745 _ 8B. 45, F4
        lea     ebx, [eax-2H]                           ; 1748 _ 8D. 58, FE
        mov     eax, dword [ebp-10H]                    ; 174B _ 8B. 45, F0
        lea     ecx, [eax-2H]                           ; 174E _ 8D. 48, FE
        mov     eax, dword [ebp-0CH]                    ; 1751 _ 8B. 45, F4
        lea     edx, [eax-2H]                           ; 1754 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 1757 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 175A _ 8B. 00
        push    ebx                                     ; 175C _ 53
        push    ecx                                     ; 175D _ 51
        push    edx                                     ; 175E _ 52
        push    1                                       ; 175F _ 6A, 01
        push    15                                      ; 1761 _ 6A, 0F
        push    dword [ebp-10H]                         ; 1763 _ FF. 75, F0
        push    eax                                     ; 1766 _ 50
        call    boxfill8                                ; 1767 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 176C _ 83. C4, 1C
        mov     eax, dword [ebp-0CH]                    ; 176F _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 1772 _ 8D. 58, FF
        mov     eax, dword [ebp-10H]                    ; 1775 _ 8B. 45, F0
        lea     ecx, [eax-1H]                           ; 1778 _ 8D. 48, FF
        mov     eax, dword [ebp-0CH]                    ; 177B _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 177E _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1781 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1784 _ 8B. 00
        push    ebx                                     ; 1786 _ 53
        push    ecx                                     ; 1787 _ 51
        push    edx                                     ; 1788 _ 52
        push    0                                       ; 1789 _ 6A, 00
        push    0                                       ; 178B _ 6A, 00
        push    dword [ebp-10H]                         ; 178D _ FF. 75, F0
        push    eax                                     ; 1790 _ 50
        call    boxfill8                                ; 1791 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1796 _ 83. C4, 1C
        sub     esp, 8                                  ; 1799 _ 83. EC, 08
        push    dword [ebp+10H]                         ; 179C _ FF. 75, 10
        push    7                                       ; 179F _ 6A, 07
        push    4                                       ; 17A1 _ 6A, 04
        push    24                                      ; 17A3 _ 6A, 18
        push    dword [ebp+0CH]                         ; 17A5 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 17A8 _ FF. 75, 08
        call    showString                              ; 17AB _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 17B0 _ 83. C4, 20
        mov     dword [ebp-14H], 0                      ; 17B3 _ C7. 45, EC, 00000000
        jmp     ?_073                                   ; 17BA _ E9, 00000083

?_066:  mov     dword [ebp-18H], 0                      ; 17BF _ C7. 45, E8, 00000000
        jmp     ?_072                                   ; 17C6 _ EB, 70

?_067:  mov     eax, dword [ebp-14H]                    ; 17C8 _ 8B. 45, EC
        shl     eax, 4                                  ; 17CB _ C1. E0, 04
        mov     edx, eax                                ; 17CE _ 89. C2
        mov     eax, dword [ebp-18H]                    ; 17D0 _ 8B. 45, E8
        add     eax, edx                                ; 17D3 _ 01. D0
        add     eax, closebtn.1934                      ; 17D5 _ 05, 000001C0(d)
        movzx   eax, byte [eax]                         ; 17DA _ 0F B6. 00
        mov     byte [ebp-19H], al                      ; 17DD _ 88. 45, E7
        cmp     byte [ebp-19H], 64                      ; 17E0 _ 80. 7D, E7, 40
        jnz     ?_068                                   ; 17E4 _ 75, 06
        mov     byte [ebp-19H], 0                       ; 17E6 _ C6. 45, E7, 00
        jmp     ?_071                                   ; 17EA _ EB, 1C

?_068:  cmp     byte [ebp-19H], 36                      ; 17EC _ 80. 7D, E7, 24
        jnz     ?_069                                   ; 17F0 _ 75, 06
        mov     byte [ebp-19H], 15                      ; 17F2 _ C6. 45, E7, 0F
        jmp     ?_071                                   ; 17F6 _ EB, 10

?_069:  cmp     byte [ebp-19H], 81                      ; 17F8 _ 80. 7D, E7, 51
        jnz     ?_070                                   ; 17FC _ 75, 06
        mov     byte [ebp-19H], 8                       ; 17FE _ C6. 45, E7, 08
        jmp     ?_071                                   ; 1802 _ EB, 04

?_070:  mov     byte [ebp-19H], 7                       ; 1804 _ C6. 45, E7, 07
?_071:  mov     eax, dword [ebp+0CH]                    ; 1808 _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 180B _ 8B. 10
        mov     eax, dword [ebp-14H]                    ; 180D _ 8B. 45, EC
        lea     ecx, [eax+5H]                           ; 1810 _ 8D. 48, 05
        mov     eax, dword [ebp+0CH]                    ; 1813 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1816 _ 8B. 40, 04
        imul    ecx, eax                                ; 1819 _ 0F AF. C8
        mov     eax, dword [ebp+0CH]                    ; 181C _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 181F _ 8B. 40, 04
        lea     ebx, [eax-15H]                          ; 1822 _ 8D. 58, EB
        mov     eax, dword [ebp-18H]                    ; 1825 _ 8B. 45, E8
        add     eax, ebx                                ; 1828 _ 01. D8
        add     eax, ecx                                ; 182A _ 01. C8
        add     edx, eax                                ; 182C _ 01. C2
        movzx   eax, byte [ebp-19H]                     ; 182E _ 0F B6. 45, E7
        mov     byte [edx], al                          ; 1832 _ 88. 02
        add     dword [ebp-18H], 1                      ; 1834 _ 83. 45, E8, 01
?_072:  cmp     dword [ebp-18H], 15                     ; 1838 _ 83. 7D, E8, 0F
        jle     ?_067                                   ; 183C _ 7E, 8A
        add     dword [ebp-14H], 1                      ; 183E _ 83. 45, EC, 01
?_073:  cmp     dword [ebp-14H], 13                     ; 1842 _ 83. 7D, EC, 0D
        jle     ?_066                                   ; 1846 _ 0F 8E, FFFFFF73
        nop                                             ; 184C _ 90
        mov     ebx, dword [ebp-4H]                     ; 184D _ 8B. 5D, FC
        leave                                           ; 1850 _ C9
        ret                                             ; 1851 _ C3
; make_window8 End of function

intHandlerFromTimer:; Function begin
        push    ebp                                     ; 1852 _ 55
        mov     ebp, esp                                ; 1853 _ 89. E5
        sub     esp, 24                                 ; 1855 _ 83. EC, 18
        sub     esp, 8                                  ; 1858 _ 83. EC, 08
        push    96                                      ; 185B _ 6A, 60
        push    32                                      ; 185D _ 6A, 20
        call    io_out8                                 ; 185F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1864 _ 83. C4, 10
        mov     eax, dword [timerctl]                   ; 1867 _ A1, 00000208(d)
        mov     edx, dword [eax]                        ; 186C _ 8B. 10
        add     edx, 1                                  ; 186E _ 83. C2, 01
        mov     dword [eax], edx                        ; 1871 _ 89. 10
        mov     dword [ebp-0CH], 0                      ; 1873 _ C7. 45, F4, 00000000
        jmp     ?_076                                   ; 187A _ E9, 00000088

?_074:  mov     eax, dword [timerctl]                   ; 187F _ A1, 00000208(d)
        mov     edx, dword [ebp-0CH]                    ; 1884 _ 8B. 55, F4
        shl     edx, 4                                  ; 1887 _ C1. E2, 04
        add     eax, edx                                ; 188A _ 01. D0
        add     eax, 4                                  ; 188C _ 83. C0, 04
        mov     eax, dword [eax]                        ; 188F _ 8B. 00
        cmp     eax, 2                                  ; 1891 _ 83. F8, 02
        jnz     ?_075                                   ; 1894 _ 75, 6D
        mov     eax, dword [timerctl]                   ; 1896 _ A1, 00000208(d)
        mov     edx, dword [ebp-0CH]                    ; 189B _ 8B. 55, F4
        shl     edx, 4                                  ; 189E _ C1. E2, 04
        add     edx, eax                                ; 18A1 _ 01. C2
        add     edx, 8                                  ; 18A3 _ 83. C2, 08
        mov     edx, dword [edx]                        ; 18A6 _ 8B. 12
        sub     edx, 1                                  ; 18A8 _ 83. EA, 01
        mov     ecx, dword [ebp-0CH]                    ; 18AB _ 8B. 4D, F4
        shl     ecx, 4                                  ; 18AE _ C1. E1, 04
        add     eax, ecx                                ; 18B1 _ 01. C8
        add     eax, 8                                  ; 18B3 _ 83. C0, 08
        mov     dword [eax], edx                        ; 18B6 _ 89. 10
        mov     eax, dword [timerctl]                   ; 18B8 _ A1, 00000208(d)
        mov     edx, dword [ebp-0CH]                    ; 18BD _ 8B. 55, F4
        shl     edx, 4                                  ; 18C0 _ C1. E2, 04
        add     eax, edx                                ; 18C3 _ 01. D0
        add     eax, 8                                  ; 18C5 _ 83. C0, 08
        mov     eax, dword [eax]                        ; 18C8 _ 8B. 00
        test    eax, eax                                ; 18CA _ 85. C0
        jnz     ?_075                                   ; 18CC _ 75, 35
        mov     eax, dword [timerctl]                   ; 18CE _ A1, 00000208(d)
        mov     edx, dword [ebp-0CH]                    ; 18D3 _ 8B. 55, F4
        shl     edx, 4                                  ; 18D6 _ C1. E2, 04
        add     eax, edx                                ; 18D9 _ 01. D0
        add     eax, 16                                 ; 18DB _ 83. C0, 10
        movzx   eax, byte [eax]                         ; 18DE _ 0F B6. 00
        movzx   edx, al                                 ; 18E1 _ 0F B6. D0
        mov     eax, dword [timerctl]                   ; 18E4 _ A1, 00000208(d)
        mov     ecx, dword [ebp-0CH]                    ; 18E9 _ 8B. 4D, F4
        shl     ecx, 4                                  ; 18EC _ C1. E1, 04
        add     eax, ecx                                ; 18EF _ 01. C8
        add     eax, 12                                 ; 18F1 _ 83. C0, 0C
        mov     eax, dword [eax]                        ; 18F4 _ 8B. 00
        sub     esp, 8                                  ; 18F6 _ 83. EC, 08
        push    edx                                     ; 18F9 _ 52
        push    eax                                     ; 18FA _ 50
        call    fifo8_put                               ; 18FB _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1900 _ 83. C4, 10
?_075:  add     dword [ebp-0CH], 1                      ; 1903 _ 83. 45, F4, 01
?_076:  cmp     dword [ebp-0CH], 499                    ; 1907 _ 81. 7D, F4, 000001F3
        jle     ?_074                                   ; 190E _ 0F 8E, FFFFFF6B
        nop                                             ; 1914 _ 90
        leave                                           ; 1915 _ C9
        ret                                             ; 1916 _ C3
; intHandlerFromTimer End of function

make_textbox8:; Function begin
        push    ebp                                     ; 1917 _ 55
        mov     ebp, esp                                ; 1918 _ 89. E5
        push    edi                                     ; 191A _ 57
        push    esi                                     ; 191B _ 56
        push    ebx                                     ; 191C _ 53
        sub     esp, 16                                 ; 191D _ 83. EC, 10
        mov     edx, dword [ebp+0CH]                    ; 1920 _ 8B. 55, 0C
        mov     eax, dword [ebp+14H]                    ; 1923 _ 8B. 45, 14
        add     eax, edx                                ; 1926 _ 01. D0
        mov     dword [ebp-14H], eax                    ; 1928 _ 89. 45, EC
        mov     edx, dword [ebp+10H]                    ; 192B _ 8B. 55, 10
        mov     eax, dword [ebp+18H]                    ; 192E _ 8B. 45, 18
        add     eax, edx                                ; 1931 _ 01. D0
        mov     dword [ebp-10H], eax                    ; 1933 _ 89. 45, F0
        mov     eax, dword [ebp+10H]                    ; 1936 _ 8B. 45, 10
        lea     edi, [eax-3H]                           ; 1939 _ 8D. 78, FD
        mov     eax, dword [ebp-14H]                    ; 193C _ 8B. 45, EC
        lea     esi, [eax+1H]                           ; 193F _ 8D. 70, 01
        mov     eax, dword [ebp+10H]                    ; 1942 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 1945 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 1948 _ 8B. 45, 0C
        lea     ecx, [eax-2H]                           ; 194B _ 8D. 48, FE
        mov     eax, dword [ebp+8H]                     ; 194E _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1951 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1954 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1957 _ 8B. 00
        push    edi                                     ; 1959 _ 57
        push    esi                                     ; 195A _ 56
        push    ebx                                     ; 195B _ 53
        push    ecx                                     ; 195C _ 51
        push    15                                      ; 195D _ 6A, 0F
        push    edx                                     ; 195F _ 52
        push    eax                                     ; 1960 _ 50
        call    boxfill8                                ; 1961 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1966 _ 83. C4, 1C
        mov     eax, dword [ebp-10H]                    ; 1969 _ 8B. 45, F0
        lea     edi, [eax+1H]                           ; 196C _ 8D. 78, 01
        mov     eax, dword [ebp+0CH]                    ; 196F _ 8B. 45, 0C
        lea     esi, [eax-3H]                           ; 1972 _ 8D. 70, FD
        mov     eax, dword [ebp+10H]                    ; 1975 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 1978 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 197B _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 197E _ 8D. 48, FD
        mov     eax, dword [ebp+8H]                     ; 1981 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1984 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1987 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 198A _ 8B. 00
        push    edi                                     ; 198C _ 57
        push    esi                                     ; 198D _ 56
        push    ebx                                     ; 198E _ 53
        push    ecx                                     ; 198F _ 51
        push    15                                      ; 1990 _ 6A, 0F
        push    edx                                     ; 1992 _ 52
        push    eax                                     ; 1993 _ 50
        call    boxfill8                                ; 1994 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1999 _ 83. C4, 1C
        mov     eax, dword [ebp-10H]                    ; 199C _ 8B. 45, F0
        lea     edi, [eax+2H]                           ; 199F _ 8D. 78, 02
        mov     eax, dword [ebp-14H]                    ; 19A2 _ 8B. 45, EC
        lea     esi, [eax+1H]                           ; 19A5 _ 8D. 70, 01
        mov     eax, dword [ebp-10H]                    ; 19A8 _ 8B. 45, F0
        lea     ebx, [eax+2H]                           ; 19AB _ 8D. 58, 02
        mov     eax, dword [ebp+0CH]                    ; 19AE _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 19B1 _ 8D. 48, FD
        mov     eax, dword [ebp+8H]                     ; 19B4 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 19B7 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 19BA _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 19BD _ 8B. 00
        push    edi                                     ; 19BF _ 57
        push    esi                                     ; 19C0 _ 56
        push    ebx                                     ; 19C1 _ 53
        push    ecx                                     ; 19C2 _ 51
        push    7                                       ; 19C3 _ 6A, 07
        push    edx                                     ; 19C5 _ 52
        push    eax                                     ; 19C6 _ 50
        call    boxfill8                                ; 19C7 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 19CC _ 83. C4, 1C
        mov     eax, dword [ebp-10H]                    ; 19CF _ 8B. 45, F0
        lea     edi, [eax+2H]                           ; 19D2 _ 8D. 78, 02
        mov     eax, dword [ebp-14H]                    ; 19D5 _ 8B. 45, EC
        lea     esi, [eax+2H]                           ; 19D8 _ 8D. 70, 02
        mov     eax, dword [ebp+10H]                    ; 19DB _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 19DE _ 8D. 58, FD
        mov     eax, dword [ebp-14H]                    ; 19E1 _ 8B. 45, EC
        lea     ecx, [eax+2H]                           ; 19E4 _ 8D. 48, 02
        mov     eax, dword [ebp+8H]                     ; 19E7 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 19EA _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 19ED _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 19F0 _ 8B. 00
        push    edi                                     ; 19F2 _ 57
        push    esi                                     ; 19F3 _ 56
        push    ebx                                     ; 19F4 _ 53
        push    ecx                                     ; 19F5 _ 51
        push    7                                       ; 19F6 _ 6A, 07
        push    edx                                     ; 19F8 _ 52
        push    eax                                     ; 19F9 _ 50
        call    boxfill8                                ; 19FA _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 19FF _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 1A02 _ 8B. 45, 10
        lea     esi, [eax-2H]                           ; 1A05 _ 8D. 70, FE
        mov     eax, dword [ebp+10H]                    ; 1A08 _ 8B. 45, 10
        lea     ebx, [eax-2H]                           ; 1A0B _ 8D. 58, FE
        mov     eax, dword [ebp+0CH]                    ; 1A0E _ 8B. 45, 0C
        lea     ecx, [eax-1H]                           ; 1A11 _ 8D. 48, FF
        mov     eax, dword [ebp+8H]                     ; 1A14 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1A17 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1A1A _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1A1D _ 8B. 00
        push    esi                                     ; 1A1F _ 56
        push    dword [ebp-14H]                         ; 1A20 _ FF. 75, EC
        push    ebx                                     ; 1A23 _ 53
        push    ecx                                     ; 1A24 _ 51
        push    0                                       ; 1A25 _ 6A, 00
        push    edx                                     ; 1A27 _ 52
        push    eax                                     ; 1A28 _ 50
        call    boxfill8                                ; 1A29 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1A2E _ 83. C4, 1C
        mov     eax, dword [ebp+0CH]                    ; 1A31 _ 8B. 45, 0C
        lea     esi, [eax-2H]                           ; 1A34 _ 8D. 70, FE
        mov     eax, dword [ebp+10H]                    ; 1A37 _ 8B. 45, 10
        lea     ebx, [eax-2H]                           ; 1A3A _ 8D. 58, FE
        mov     eax, dword [ebp+0CH]                    ; 1A3D _ 8B. 45, 0C
        lea     ecx, [eax-2H]                           ; 1A40 _ 8D. 48, FE
        mov     eax, dword [ebp+8H]                     ; 1A43 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1A46 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1A49 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1A4C _ 8B. 00
        push    dword [ebp-10H]                         ; 1A4E _ FF. 75, F0
        push    esi                                     ; 1A51 _ 56
        push    ebx                                     ; 1A52 _ 53
        push    ecx                                     ; 1A53 _ 51
        push    0                                       ; 1A54 _ 6A, 00
        push    edx                                     ; 1A56 _ 52
        push    eax                                     ; 1A57 _ 50
        call    boxfill8                                ; 1A58 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1A5D _ 83. C4, 1C
        mov     eax, dword [ebp-10H]                    ; 1A60 _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 1A63 _ 8D. 70, 01
        mov     eax, dword [ebp-10H]                    ; 1A66 _ 8B. 45, F0
        lea     ebx, [eax+1H]                           ; 1A69 _ 8D. 58, 01
        mov     eax, dword [ebp+0CH]                    ; 1A6C _ 8B. 45, 0C
        lea     ecx, [eax-2H]                           ; 1A6F _ 8D. 48, FE
        mov     eax, dword [ebp+8H]                     ; 1A72 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1A75 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1A78 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1A7B _ 8B. 00
        push    esi                                     ; 1A7D _ 56
        push    dword [ebp-14H]                         ; 1A7E _ FF. 75, EC
        push    ebx                                     ; 1A81 _ 53
        push    ecx                                     ; 1A82 _ 51
        push    8                                       ; 1A83 _ 6A, 08
        push    edx                                     ; 1A85 _ 52
        push    eax                                     ; 1A86 _ 50
        call    boxfill8                                ; 1A87 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1A8C _ 83. C4, 1C
        mov     eax, dword [ebp-10H]                    ; 1A8F _ 8B. 45, F0
        lea     edi, [eax+1H]                           ; 1A92 _ 8D. 78, 01
        mov     eax, dword [ebp-14H]                    ; 1A95 _ 8B. 45, EC
        lea     esi, [eax+1H]                           ; 1A98 _ 8D. 70, 01
        mov     eax, dword [ebp+10H]                    ; 1A9B _ 8B. 45, 10
        lea     ebx, [eax-2H]                           ; 1A9E _ 8D. 58, FE
        mov     eax, dword [ebp-14H]                    ; 1AA1 _ 8B. 45, EC
        lea     ecx, [eax+1H]                           ; 1AA4 _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 1AA7 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1AAA _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1AAD _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1AB0 _ 8B. 00
        push    edi                                     ; 1AB2 _ 57
        push    esi                                     ; 1AB3 _ 56
        push    ebx                                     ; 1AB4 _ 53
        push    ecx                                     ; 1AB5 _ 51
        push    8                                       ; 1AB6 _ 6A, 08
        push    edx                                     ; 1AB8 _ 52
        push    eax                                     ; 1AB9 _ 50
        call    boxfill8                                ; 1ABA _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1ABF _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 1AC2 _ 8B. 45, 10
        lea     esi, [eax-1H]                           ; 1AC5 _ 8D. 70, FF
        mov     eax, dword [ebp+0CH]                    ; 1AC8 _ 8B. 45, 0C
        lea     ebx, [eax-1H]                           ; 1ACB _ 8D. 58, FF
        mov     eax, dword [ebp+1CH]                    ; 1ACE _ 8B. 45, 1C
        movzx   ecx, al                                 ; 1AD1 _ 0F B6. C8
        mov     eax, dword [ebp+8H]                     ; 1AD4 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1AD7 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1ADA _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1ADD _ 8B. 00
        push    dword [ebp-10H]                         ; 1ADF _ FF. 75, F0
        push    dword [ebp-14H]                         ; 1AE2 _ FF. 75, EC
        push    esi                                     ; 1AE5 _ 56
        push    ebx                                     ; 1AE6 _ 53
        push    ecx                                     ; 1AE7 _ 51
        push    edx                                     ; 1AE8 _ 52
        push    eax                                     ; 1AE9 _ 50
        call    boxfill8                                ; 1AEA _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1AEF _ 83. C4, 1C
        nop                                             ; 1AF2 _ 90
        lea     esp, [ebp-0CH]                          ; 1AF3 _ 8D. 65, F4
        pop     ebx                                     ; 1AF6 _ 5B
        pop     esi                                     ; 1AF7 _ 5E
        pop     edi                                     ; 1AF8 _ 5F
        pop     ebp                                     ; 1AF9 _ 5D
        ret                                             ; 1AFA _ C3
; make_textbox8 End of function

message_box:; Function begin
        push    ebp                                     ; 1AFB _ 55
        mov     ebp, esp                                ; 1AFC _ 89. E5
        sub     esp, 24                                 ; 1AFE _ 83. EC, 18
        sub     esp, 12                                 ; 1B01 _ 83. EC, 0C
        push    dword [ebp+8H]                          ; 1B04 _ FF. 75, 08
        call    sheet_alloc                             ; 1B07 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1B0C _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 1B0F _ 89. 45, F0
        mov     eax, dword [memman]                     ; 1B12 _ A1, 00000000(d)
        sub     esp, 8                                  ; 1B17 _ 83. EC, 08
        push    10880                                   ; 1B1A _ 68, 00002A80
        push    eax                                     ; 1B1F _ 50
        call    memman_alloc_4k                         ; 1B20 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1B25 _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 1B28 _ 89. 45, F4
        sub     esp, 12                                 ; 1B2B _ 83. EC, 0C
        push    -1                                      ; 1B2E _ 6A, FF
        push    68                                      ; 1B30 _ 6A, 44
        push    160                                     ; 1B32 _ 68, 000000A0
        push    dword [ebp-0CH]                         ; 1B37 _ FF. 75, F4
        push    dword [ebp-10H]                         ; 1B3A _ FF. 75, F0
        call    sheet_setbuf                            ; 1B3D _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1B42 _ 83. C4, 20
        sub     esp, 4                                  ; 1B45 _ 83. EC, 04
        push    dword [ebp+0CH]                         ; 1B48 _ FF. 75, 0C
        push    dword [ebp-10H]                         ; 1B4B _ FF. 75, F0
        push    dword [ebp+8H]                          ; 1B4E _ FF. 75, 08
        call    make_window8                            ; 1B51 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1B56 _ 83. C4, 10
        sub     esp, 8                                  ; 1B59 _ 83. EC, 08
        push    7                                       ; 1B5C _ 6A, 07
        push    16                                      ; 1B5E _ 6A, 10
        push    144                                     ; 1B60 _ 68, 00000090
        push    28                                      ; 1B65 _ 6A, 1C
        push    8                                       ; 1B67 _ 6A, 08
        push    dword [ebp-10H]                         ; 1B69 _ FF. 75, F0
        call    make_textbox8                           ; 1B6C _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1B71 _ 83. C4, 20
        push    72                                      ; 1B74 _ 6A, 48
        push    80                                      ; 1B76 _ 6A, 50
        push    dword [ebp-10H]                         ; 1B78 _ FF. 75, F0
        push    dword [ebp+8H]                          ; 1B7B _ FF. 75, 08
        call    sheet_slide                             ; 1B7E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1B83 _ 83. C4, 10
        sub     esp, 4                                  ; 1B86 _ 83. EC, 04
        push    1                                       ; 1B89 _ 6A, 01
        push    dword [ebp-10H]                         ; 1B8B _ FF. 75, F0
        push    dword [ebp+8H]                          ; 1B8E _ FF. 75, 08
        call    sheet_updown                            ; 1B91 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1B96 _ 83. C4, 10
        mov     eax, dword [ebp-10H]                    ; 1B99 _ 8B. 45, F0
        leave                                           ; 1B9C _ C9
        ret                                             ; 1B9D _ C3
; message_box End of function

memman_init:; Function begin
        push    ebp                                     ; 1B9E _ 55
        mov     ebp, esp                                ; 1B9F _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 1BA1 _ 8B. 45, 08
        mov     dword [eax], 0                          ; 1BA4 _ C7. 00, 00000000
        mov     eax, dword [ebp+8H]                     ; 1BAA _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 1BAD _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 1BB4 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 1BB7 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 1BBE _ 8B. 45, 08
        mov     dword [eax+0CH], 0                      ; 1BC1 _ C7. 40, 0C, 00000000
        nop                                             ; 1BC8 _ 90
        pop     ebp                                     ; 1BC9 _ 5D
        ret                                             ; 1BCA _ C3
; memman_init End of function

memman_total:; Function begin
        push    ebp                                     ; 1BCB _ 55
        mov     ebp, esp                                ; 1BCC _ 89. E5
        sub     esp, 16                                 ; 1BCE _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 1BD1 _ C7. 45, FC, 00000000
        mov     dword [ebp-8H], 0                       ; 1BD8 _ C7. 45, F8, 00000000
        jmp     ?_078                                   ; 1BDF _ EB, 14

?_077:  mov     eax, dword [ebp+8H]                     ; 1BE1 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1BE4 _ 8B. 55, F8
        add     edx, 2                                  ; 1BE7 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 1BEA _ 8B. 44 D0, 04
        add     dword [ebp-4H], eax                     ; 1BEE _ 01. 45, FC
        add     dword [ebp-8H], 1                       ; 1BF1 _ 83. 45, F8, 01
?_078:  mov     eax, dword [ebp+8H]                     ; 1BF5 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1BF8 _ 8B. 00
        cmp     dword [ebp-8H], eax                     ; 1BFA _ 39. 45, F8
        jc      ?_077                                   ; 1BFD _ 72, E2
        mov     eax, dword [ebp-4H]                     ; 1BFF _ 8B. 45, FC
        leave                                           ; 1C02 _ C9
        ret                                             ; 1C03 _ C3
; memman_total End of function

memman_alloc:; Function begin
        push    ebp                                     ; 1C04 _ 55
        mov     ebp, esp                                ; 1C05 _ 89. E5
        sub     esp, 16                                 ; 1C07 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 1C0A _ C7. 45, F8, 00000000
        jmp     ?_082                                   ; 1C11 _ E9, 00000085

?_079:  mov     eax, dword [ebp+8H]                     ; 1C16 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1C19 _ 8B. 55, F8
        add     edx, 2                                  ; 1C1C _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 1C1F _ 8B. 44 D0, 04
        cmp     dword [ebp+0CH], eax                    ; 1C23 _ 39. 45, 0C
        ja      ?_081                                   ; 1C26 _ 77, 6F
        mov     eax, dword [ebp+8H]                     ; 1C28 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1C2B _ 8B. 55, F8
        add     edx, 2                                  ; 1C2E _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 1C31 _ 8B. 04 D0
        mov     dword [ebp-4H], eax                     ; 1C34 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 1C37 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1C3A _ 8B. 55, F8
        add     edx, 2                                  ; 1C3D _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 1C40 _ 8B. 14 D0
        mov     eax, dword [ebp+0CH]                    ; 1C43 _ 8B. 45, 0C
        lea     ecx, [edx+eax]                          ; 1C46 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1C49 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1C4C _ 8B. 55, F8
        add     edx, 2                                  ; 1C4F _ 83. C2, 02
        mov     dword [eax+edx*8], ecx                  ; 1C52 _ 89. 0C D0
        mov     eax, dword [ebp+8H]                     ; 1C55 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1C58 _ 8B. 55, F8
        add     edx, 2                                  ; 1C5B _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 1C5E _ 8B. 44 D0, 04
        sub     eax, dword [ebp+0CH]                    ; 1C62 _ 2B. 45, 0C
        mov     edx, eax                                ; 1C65 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1C67 _ 8B. 45, 08
        mov     ecx, dword [ebp-8H]                     ; 1C6A _ 8B. 4D, F8
        add     ecx, 2                                  ; 1C6D _ 83. C1, 02
        mov     dword [eax+ecx*8+4H], edx               ; 1C70 _ 89. 54 C8, 04
        mov     eax, dword [ebp+8H]                     ; 1C74 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1C77 _ 8B. 55, F8
        add     edx, 2                                  ; 1C7A _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 1C7D _ 8B. 44 D0, 04
        test    eax, eax                                ; 1C81 _ 85. C0
        jnz     ?_080                                   ; 1C83 _ 75, 0D
        mov     eax, dword [ebp+8H]                     ; 1C85 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1C88 _ 8B. 00
        lea     edx, [eax-1H]                           ; 1C8A _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1C8D _ 8B. 45, 08
        mov     dword [eax], edx                        ; 1C90 _ 89. 10
?_080:  mov     eax, dword [ebp-4H]                     ; 1C92 _ 8B. 45, FC
        jmp     ?_083                                   ; 1C95 _ EB, 17

?_081:  add     dword [ebp-8H], 1                       ; 1C97 _ 83. 45, F8, 01
?_082:  mov     eax, dword [ebp+8H]                     ; 1C9B _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1C9E _ 8B. 00
        cmp     dword [ebp-8H], eax                     ; 1CA0 _ 39. 45, F8
        jc      ?_079                                   ; 1CA3 _ 0F 82, FFFFFF6D
        mov     eax, 0                                  ; 1CA9 _ B8, 00000000
?_083:  leave                                           ; 1CAE _ C9
        ret                                             ; 1CAF _ C3
; memman_alloc End of function

memman_free:; Function begin
        push    ebp                                     ; 1CB0 _ 55
        mov     ebp, esp                                ; 1CB1 _ 89. E5
        push    ebx                                     ; 1CB3 _ 53
        sub     esp, 16                                 ; 1CB4 _ 83. EC, 10
        mov     dword [ebp-0CH], 0                      ; 1CB7 _ C7. 45, F4, 00000000
        jmp     ?_085                                   ; 1CBE _ EB, 15

?_084:  mov     eax, dword [ebp+8H]                     ; 1CC0 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1CC3 _ 8B. 55, F4
        add     edx, 2                                  ; 1CC6 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 1CC9 _ 8B. 04 D0
        cmp     dword [ebp+0CH], eax                    ; 1CCC _ 39. 45, 0C
        jc      ?_086                                   ; 1CCF _ 72, 10
        add     dword [ebp-0CH], 1                      ; 1CD1 _ 83. 45, F4, 01
?_085:  mov     eax, dword [ebp+8H]                     ; 1CD5 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1CD8 _ 8B. 00
        cmp     dword [ebp-0CH], eax                    ; 1CDA _ 39. 45, F4
        jl      ?_084                                   ; 1CDD _ 7C, E1
        jmp     ?_087                                   ; 1CDF _ EB, 01

?_086:  nop                                             ; 1CE1 _ 90
?_087:  cmp     dword [ebp-0CH], 0                      ; 1CE2 _ 83. 7D, F4, 00
        jle     ?_089                                   ; 1CE6 _ 0F 8E, 000000B9
        mov     eax, dword [ebp-0CH]                    ; 1CEC _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1CEF _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1CF2 _ 8B. 45, 08
        add     edx, 2                                  ; 1CF5 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 1CF8 _ 8B. 14 D0
        mov     eax, dword [ebp-0CH]                    ; 1CFB _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 1CFE _ 8D. 48, FF
        mov     eax, dword [ebp+8H]                     ; 1D01 _ 8B. 45, 08
        add     ecx, 2                                  ; 1D04 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 1D07 _ 8B. 44 C8, 04
        add     eax, edx                                ; 1D0B _ 01. D0
        cmp     dword [ebp+0CH], eax                    ; 1D0D _ 39. 45, 0C
        jne     ?_089                                   ; 1D10 _ 0F 85, 0000008F
        mov     eax, dword [ebp-0CH]                    ; 1D16 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1D19 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1D1C _ 8B. 45, 08
        add     edx, 2                                  ; 1D1F _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 1D22 _ 8B. 54 D0, 04
        mov     eax, dword [ebp-0CH]                    ; 1D26 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 1D29 _ 8D. 58, FF
        mov     eax, dword [ebp+10H]                    ; 1D2C _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 1D2F _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1D32 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 1D35 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 1D38 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 1D3C _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1D3F _ 8B. 00
        test    eax, eax                                ; 1D41 _ 85. C0
        jle     ?_088                                   ; 1D43 _ 7E, 56
        mov     edx, dword [ebp+0CH]                    ; 1D45 _ 8B. 55, 0C
        mov     eax, dword [ebp+10H]                    ; 1D48 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 1D4B _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1D4E _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1D51 _ 8B. 55, F4
        add     edx, 2                                  ; 1D54 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 1D57 _ 8B. 04 D0
        cmp     ecx, eax                                ; 1D5A _ 39. C1
        jnz     ?_088                                   ; 1D5C _ 75, 3D
        mov     eax, dword [ebp-0CH]                    ; 1D5E _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1D61 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1D64 _ 8B. 45, 08
        add     edx, 2                                  ; 1D67 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 1D6A _ 8B. 54 D0, 04
        mov     eax, dword [ebp+8H]                     ; 1D6E _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 1D71 _ 8B. 4D, F4
        add     ecx, 2                                  ; 1D74 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 1D77 _ 8B. 44 C8, 04
        mov     ecx, dword [ebp-0CH]                    ; 1D7B _ 8B. 4D, F4
        lea     ebx, [ecx-1H]                           ; 1D7E _ 8D. 59, FF
        lea     ecx, [edx+eax]                          ; 1D81 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1D84 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 1D87 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 1D8A _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 1D8E _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1D91 _ 8B. 00
        lea     edx, [eax-1H]                           ; 1D93 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1D96 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 1D99 _ 89. 10
?_088:  mov     eax, 0                                  ; 1D9B _ B8, 00000000
        jmp     ?_095                                   ; 1DA0 _ E9, 0000011B

?_089:  mov     eax, dword [ebp+8H]                     ; 1DA5 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1DA8 _ 8B. 00
        test    eax, eax                                ; 1DAA _ 85. C0
        jle     ?_090                                   ; 1DAC _ 7E, 52
        mov     edx, dword [ebp+0CH]                    ; 1DAE _ 8B. 55, 0C
        mov     eax, dword [ebp+10H]                    ; 1DB1 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 1DB4 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1DB7 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1DBA _ 8B. 55, F4
        add     edx, 2                                  ; 1DBD _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 1DC0 _ 8B. 04 D0
        cmp     ecx, eax                                ; 1DC3 _ 39. C1
        jnz     ?_090                                   ; 1DC5 _ 75, 39
        mov     eax, dword [ebp+8H]                     ; 1DC7 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1DCA _ 8B. 55, F4
        add     edx, 2                                  ; 1DCD _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 1DD0 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 1DD4 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 1DD7 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1DDA _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1DDD _ 8B. 55, F4
        add     edx, 2                                  ; 1DE0 _ 83. C2, 02
        mov     dword [eax+edx*8+4H], ecx               ; 1DE3 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 1DE7 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1DEA _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 1DED _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 1DF0 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 1DF3 _ 89. 14 C8
        mov     eax, 0                                  ; 1DF6 _ B8, 00000000
        jmp     ?_095                                   ; 1DFB _ E9, 000000C0

?_090:  mov     eax, dword [ebp+8H]                     ; 1E00 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1E03 _ 8B. 00
        cmp     eax, 4095                               ; 1E05 _ 3D, 00000FFF
        jg      ?_094                                   ; 1E0A _ 0F 8F, 00000087
        mov     eax, dword [ebp+8H]                     ; 1E10 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1E13 _ 8B. 00
        lea     edx, [eax+1H]                           ; 1E15 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1E18 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 1E1B _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 1E1D _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1E20 _ 8B. 00
        mov     dword [ebp-8H], eax                     ; 1E22 _ 89. 45, F8
        jmp     ?_092                                   ; 1E25 _ EB, 28

?_091:  mov     eax, dword [ebp-8H]                     ; 1E27 _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 1E2A _ 8D. 50, FF
        mov     ecx, dword [ebp+8H]                     ; 1E2D _ 8B. 4D, 08
        mov     eax, dword [ebp-8H]                     ; 1E30 _ 8B. 45, F8
        lea     ebx, [eax+2H]                           ; 1E33 _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 1E36 _ 8B. 45, 08
        add     edx, 2                                  ; 1E39 _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 1E3C _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 1E3F _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 1E41 _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 1E44 _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 1E47 _ 89. 54 D9, 04
        sub     dword [ebp-8H], 1                       ; 1E4B _ 83. 6D, F8, 01
?_092:  mov     eax, dword [ebp-8H]                     ; 1E4F _ 8B. 45, F8
        cmp     eax, dword [ebp-0CH]                    ; 1E52 _ 3B. 45, F4
        jg      ?_091                                   ; 1E55 _ 7F, D0
        mov     eax, dword [ebp+8H]                     ; 1E57 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1E5A _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1E5D _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1E60 _ 8B. 00
        cmp     edx, eax                                ; 1E62 _ 39. C2
        jge     ?_093                                   ; 1E64 _ 7D, 0B
        mov     eax, dword [ebp+8H]                     ; 1E66 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 1E69 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 1E6B _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 1E6E _ 89. 50, 04
?_093:  mov     eax, dword [ebp+8H]                     ; 1E71 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1E74 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 1E77 _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 1E7A _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 1E7D _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 1E80 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1E83 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 1E86 _ 8D. 4A, 02
        mov     edx, dword [ebp+10H]                    ; 1E89 _ 8B. 55, 10
        mov     dword [eax+ecx*8+4H], edx               ; 1E8C _ 89. 54 C8, 04
        mov     eax, 0                                  ; 1E90 _ B8, 00000000
        jmp     ?_095                                   ; 1E95 _ EB, 29

?_094:  mov     eax, dword [ebp+8H]                     ; 1E97 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1E9A _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 1E9D _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1EA0 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 1EA3 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 1EA6 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 1EA9 _ 8B. 40, 08
        mov     edx, eax                                ; 1EAC _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 1EAE _ 8B. 45, 10
        add     eax, edx                                ; 1EB1 _ 01. D0
        mov     edx, eax                                ; 1EB3 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1EB5 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 1EB8 _ 89. 50, 08
        mov     eax, 4294967295                         ; 1EBB _ B8, FFFFFFFF
?_095:  add     esp, 16                                 ; 1EC0 _ 83. C4, 10
        pop     ebx                                     ; 1EC3 _ 5B
        pop     ebp                                     ; 1EC4 _ 5D
        ret                                             ; 1EC5 _ C3
; memman_free End of function

memman_alloc_4k:; Function begin
        push    ebp                                     ; 1EC6 _ 55
        mov     ebp, esp                                ; 1EC7 _ 89. E5
        sub     esp, 16                                 ; 1EC9 _ 83. EC, 10
        mov     eax, dword [ebp+0CH]                    ; 1ECC _ 8B. 45, 0C
        add     eax, 4095                               ; 1ECF _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 1ED4 _ 25, FFFFF000
        mov     dword [ebp+0CH], eax                    ; 1ED9 _ 89. 45, 0C
        push    dword [ebp+0CH]                         ; 1EDC _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1EDF _ FF. 75, 08
        call    memman_alloc                            ; 1EE2 _ E8, FFFFFFFC(rel)
        add     esp, 8                                  ; 1EE7 _ 83. C4, 08
        mov     dword [ebp-4H], eax                     ; 1EEA _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 1EED _ 8B. 45, FC
        leave                                           ; 1EF0 _ C9
        ret                                             ; 1EF1 _ C3
; memman_alloc_4k End of function

memman_free_4k:; Function begin
        push    ebp                                     ; 1EF2 _ 55
        mov     ebp, esp                                ; 1EF3 _ 89. E5
        sub     esp, 16                                 ; 1EF5 _ 83. EC, 10
        mov     eax, dword [ebp+10H]                    ; 1EF8 _ 8B. 45, 10
        add     eax, 4095                               ; 1EFB _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 1F00 _ 25, FFFFF000
        mov     dword [ebp+10H], eax                    ; 1F05 _ 89. 45, 10
        push    dword [ebp+10H]                         ; 1F08 _ FF. 75, 10
        push    dword [ebp+0CH]                         ; 1F0B _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1F0E _ FF. 75, 08
        call    memman_free                             ; 1F11 _ E8, FFFFFFFC(rel)
        add     esp, 12                                 ; 1F16 _ 83. C4, 0C
        mov     dword [ebp-4H], eax                     ; 1F19 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 1F1C _ 8B. 45, FC
        leave                                           ; 1F1F _ C9
        ret                                             ; 1F20 _ C3
; memman_free_4k End of function

shtctl_init:; Function begin
        push    ebp                                     ; 1F21 _ 55
        mov     ebp, esp                                ; 1F22 _ 89. E5
        sub     esp, 24                                 ; 1F24 _ 83. EC, 18
        sub     esp, 8                                  ; 1F27 _ 83. EC, 08
        push    9232                                    ; 1F2A _ 68, 00002410
        push    dword [ebp+8H]                          ; 1F2F _ FF. 75, 08
        call    memman_alloc_4k                         ; 1F32 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1F37 _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 1F3A _ 89. 45, F4
        cmp     dword [ebp-0CH], 0                      ; 1F3D _ 83. 7D, F4, 00
        jnz     ?_096                                   ; 1F41 _ 75, 0A
        mov     eax, 0                                  ; 1F43 _ B8, 00000000
        jmp     ?_100                                   ; 1F48 _ E9, 0000009A

?_096:  mov     eax, dword [ebp-0CH]                    ; 1F4D _ 8B. 45, F4
        mov     edx, dword [ebp+0CH]                    ; 1F50 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 1F53 _ 89. 10
        mov     eax, dword [ebp-0CH]                    ; 1F55 _ 8B. 45, F4
        mov     edx, dword [ebp+10H]                    ; 1F58 _ 8B. 55, 10
        mov     dword [eax+8H], edx                     ; 1F5B _ 89. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 1F5E _ 8B. 45, F4
        mov     edx, dword [ebp+14H]                    ; 1F61 _ 8B. 55, 14
        mov     dword [eax+0CH], edx                    ; 1F64 _ 89. 50, 0C
        mov     eax, dword [ebp-0CH]                    ; 1F67 _ 8B. 45, F4
        mov     dword [eax+10H], -1                     ; 1F6A _ C7. 40, 10, FFFFFFFF
        mov     dword [ebp-10H], 0                      ; 1F71 _ C7. 45, F0, 00000000
        jmp     ?_098                                   ; 1F78 _ EB, 1B

?_097:  mov     eax, dword [ebp-0CH]                    ; 1F7A _ 8B. 45, F4
        mov     edx, dword [ebp-10H]                    ; 1F7D _ 8B. 55, F0
        add     edx, 33                                 ; 1F80 _ 83. C2, 21
        shl     edx, 5                                  ; 1F83 _ C1. E2, 05
        add     eax, edx                                ; 1F86 _ 01. D0
        add     eax, 16                                 ; 1F88 _ 83. C0, 10
        mov     dword [eax], 0                          ; 1F8B _ C7. 00, 00000000
        add     dword [ebp-10H], 1                      ; 1F91 _ 83. 45, F0, 01
?_098:  cmp     dword [ebp-10H], 255                    ; 1F95 _ 81. 7D, F0, 000000FF
        jle     ?_097                                   ; 1F9C _ 7E, DC
        mov     eax, dword [ebp+10H]                    ; 1F9E _ 8B. 45, 10
        imul    eax, dword [ebp+14H]                    ; 1FA1 _ 0F AF. 45, 14
        sub     esp, 8                                  ; 1FA5 _ 83. EC, 08
        push    eax                                     ; 1FA8 _ 50
        push    dword [ebp+8H]                          ; 1FA9 _ FF. 75, 08
        call    memman_alloc_4k                         ; 1FAC _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1FB1 _ 83. C4, 10
        mov     edx, eax                                ; 1FB4 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 1FB6 _ 8B. 45, F4
        mov     dword [eax+4H], edx                     ; 1FB9 _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 1FBC _ 8B. 45, F4
        mov     eax, dword [eax+4H]                     ; 1FBF _ 8B. 40, 04
        test    eax, eax                                ; 1FC2 _ 85. C0
        jnz     ?_099                                   ; 1FC4 _ 75, 1E
        mov     eax, dword [ebp-0CH]                    ; 1FC6 _ 8B. 45, F4
        sub     esp, 4                                  ; 1FC9 _ 83. EC, 04
        push    9232                                    ; 1FCC _ 68, 00002410
        push    eax                                     ; 1FD1 _ 50
        push    dword [ebp+8H]                          ; 1FD2 _ FF. 75, 08
        call    memman_free_4k                          ; 1FD5 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1FDA _ 83. C4, 10
        mov     eax, 0                                  ; 1FDD _ B8, 00000000
        jmp     ?_100                                   ; 1FE2 _ EB, 03

?_099:  mov     eax, dword [ebp-0CH]                    ; 1FE4 _ 8B. 45, F4
?_100:  leave                                           ; 1FE7 _ C9
        ret                                             ; 1FE8 _ C3
; shtctl_init End of function

sheet_alloc:; Function begin
        push    ebp                                     ; 1FE9 _ 55
        mov     ebp, esp                                ; 1FEA _ 89. E5
        sub     esp, 16                                 ; 1FEC _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 1FEF _ C7. 45, F8, 00000000
        jmp     ?_103                                   ; 1FF6 _ EB, 5B

?_101:  mov     eax, dword [ebp+8H]                     ; 1FF8 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1FFB _ 8B. 55, F8
        add     edx, 33                                 ; 1FFE _ 83. C2, 21
        shl     edx, 5                                  ; 2001 _ C1. E2, 05
        add     eax, edx                                ; 2004 _ 01. D0
        add     eax, 16                                 ; 2006 _ 83. C0, 10
        mov     eax, dword [eax]                        ; 2009 _ 8B. 00
        test    eax, eax                                ; 200B _ 85. C0
        jnz     ?_102                                   ; 200D _ 75, 40
        mov     eax, dword [ebp-8H]                     ; 200F _ 8B. 45, F8
        shl     eax, 5                                  ; 2012 _ C1. E0, 05
        lea     edx, [eax+410H]                         ; 2015 _ 8D. 90, 00000410
        mov     eax, dword [ebp+8H]                     ; 201B _ 8B. 45, 08
        add     eax, edx                                ; 201E _ 01. D0
        add     eax, 4                                  ; 2020 _ 83. C0, 04
        mov     dword [ebp-4H], eax                     ; 2023 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 2026 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2029 _ 8B. 55, F8
        lea     ecx, [edx+4H]                           ; 202C _ 8D. 4A, 04
        mov     edx, dword [ebp-4H]                     ; 202F _ 8B. 55, FC
        mov     dword [eax+ecx*4+4H], edx               ; 2032 _ 89. 54 88, 04
        mov     eax, dword [ebp-4H]                     ; 2036 _ 8B. 45, FC
        mov     dword [eax+1CH], 1                      ; 2039 _ C7. 40, 1C, 00000001
        mov     eax, dword [ebp-4H]                     ; 2040 _ 8B. 45, FC
        mov     dword [eax+18H], -1                     ; 2043 _ C7. 40, 18, FFFFFFFF
        mov     eax, dword [ebp-4H]                     ; 204A _ 8B. 45, FC
        jmp     ?_104                                   ; 204D _ EB, 12

?_102:  add     dword [ebp-8H], 1                       ; 204F _ 83. 45, F8, 01
?_103:  cmp     dword [ebp-8H], 255                     ; 2053 _ 81. 7D, F8, 000000FF
        jle     ?_101                                   ; 205A _ 7E, 9C
        mov     eax, 0                                  ; 205C _ B8, 00000000
?_104:  leave                                           ; 2061 _ C9
        ret                                             ; 2062 _ C3
; sheet_alloc End of function

sheet_setbuf:; Function begin
        push    ebp                                     ; 2063 _ 55
        mov     ebp, esp                                ; 2064 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 2066 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 2069 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 206C _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 206E _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 2071 _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 2074 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 2077 _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 207A _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 207D _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 2080 _ 8B. 45, 08
        mov     edx, dword [ebp+18H]                    ; 2083 _ 8B. 55, 18
        mov     dword [eax+14H], edx                    ; 2086 _ 89. 50, 14
        nop                                             ; 2089 _ 90
        pop     ebp                                     ; 208A _ 5D
        ret                                             ; 208B _ C3
; sheet_setbuf End of function

sheet_updown:; Function begin
        push    ebp                                     ; 208C _ 55
        mov     ebp, esp                                ; 208D _ 89. E5
        push    esi                                     ; 208F _ 56
        push    ebx                                     ; 2090 _ 53
        sub     esp, 16                                 ; 2091 _ 83. EC, 10
        mov     eax, dword [ebp+0CH]                    ; 2094 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 2097 _ 8B. 40, 18
        mov     dword [ebp-0CH], eax                    ; 209A _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 209D _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 20A0 _ 8B. 40, 10
        add     eax, 1                                  ; 20A3 _ 83. C0, 01
        cmp     dword [ebp+10H], eax                    ; 20A6 _ 39. 45, 10
        jle     ?_105                                   ; 20A9 _ 7E, 0C
        mov     eax, dword [ebp+8H]                     ; 20AB _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 20AE _ 8B. 40, 10
        add     eax, 1                                  ; 20B1 _ 83. C0, 01
        mov     dword [ebp+10H], eax                    ; 20B4 _ 89. 45, 10
?_105:  cmp     dword [ebp+10H], -1                     ; 20B7 _ 83. 7D, 10, FF
        jge     ?_106                                   ; 20BB _ 7D, 07
        mov     dword [ebp+10H], -1                     ; 20BD _ C7. 45, 10, FFFFFFFF
?_106:  mov     eax, dword [ebp+0CH]                    ; 20C4 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 20C7 _ 8B. 55, 10
        mov     dword [eax+18H], edx                    ; 20CA _ 89. 50, 18
        mov     eax, dword [ebp-0CH]                    ; 20CD _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 20D0 _ 3B. 45, 10
        jle     ?_113                                   ; 20D3 _ 0F 8E, 000001CB
        cmp     dword [ebp+10H], 0                      ; 20D9 _ 83. 7D, 10, 00
        js      ?_109                                   ; 20DD _ 0F 88, 000000DF
        mov     eax, dword [ebp-0CH]                    ; 20E3 _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 20E6 _ 89. 45, F0
        jmp     ?_108                                   ; 20E9 _ EB, 34

?_107:  mov     eax, dword [ebp-10H]                    ; 20EB _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 20EE _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 20F1 _ 8B. 45, 08
        add     edx, 4                                  ; 20F4 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 20F7 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 20FB _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 20FE _ 8B. 4D, F0
        add     ecx, 4                                  ; 2101 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 2104 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 2108 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 210B _ 8B. 55, F0
        add     edx, 4                                  ; 210E _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 2111 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 2115 _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 2118 _ 89. 50, 18
        sub     dword [ebp-10H], 1                      ; 211B _ 83. 6D, F0, 01
?_108:  mov     eax, dword [ebp-10H]                    ; 211F _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 2122 _ 3B. 45, 10
        jg      ?_107                                   ; 2125 _ 7F, C4
        mov     eax, dword [ebp+8H]                     ; 2127 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 212A _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 212D _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 2130 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 2133 _ 89. 54 88, 04
        mov     eax, dword [ebp+10H]                    ; 2137 _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 213A _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 213D _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2140 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2143 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 2146 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 2149 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 214C _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 214F _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2152 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2155 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 2158 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 215B _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 215E _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2161 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2164 _ 8B. 40, 0C
        sub     esp, 8                                  ; 2167 _ 83. EC, 08
        push    esi                                     ; 216A _ 56
        push    ebx                                     ; 216B _ 53
        push    ecx                                     ; 216C _ 51
        push    edx                                     ; 216D _ 52
        push    eax                                     ; 216E _ 50
        push    dword [ebp+8H]                          ; 216F _ FF. 75, 08
        call    sheet_refreshmap                        ; 2172 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2177 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 217A _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 217D _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 2180 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2183 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2186 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 2189 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 218C _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 218F _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 2192 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2195 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2198 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 219B _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 219E _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 21A1 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 21A4 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 21A7 _ 8B. 40, 0C
        sub     esp, 8                                  ; 21AA _ 83. EC, 08
        push    esi                                     ; 21AD _ 56
        push    ebx                                     ; 21AE _ 53
        push    ecx                                     ; 21AF _ 51
        push    edx                                     ; 21B0 _ 52
        push    eax                                     ; 21B1 _ 50
        push    dword [ebp+8H]                          ; 21B2 _ FF. 75, 08
        call    sheet_refreshsub                        ; 21B5 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 21BA _ 83. C4, 20
        jmp     ?_120                                   ; 21BD _ E9, 00000238

?_109:  mov     eax, dword [ebp+8H]                     ; 21C2 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 21C5 _ 8B. 40, 10
        cmp     dword [ebp-0CH], eax                    ; 21C8 _ 39. 45, F4
        jge     ?_112                                   ; 21CB _ 7D, 47
        mov     eax, dword [ebp-0CH]                    ; 21CD _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 21D0 _ 89. 45, F0
        jmp     ?_111                                   ; 21D3 _ EB, 34

?_110:  mov     eax, dword [ebp-10H]                    ; 21D5 _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 21D8 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 21DB _ 8B. 45, 08
        add     edx, 4                                  ; 21DE _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 21E1 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 21E5 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 21E8 _ 8B. 4D, F0
        add     ecx, 4                                  ; 21EB _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 21EE _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 21F2 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 21F5 _ 8B. 55, F0
        add     edx, 4                                  ; 21F8 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 21FB _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 21FF _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 2202 _ 89. 50, 18
        add     dword [ebp-10H], 1                      ; 2205 _ 83. 45, F0, 01
?_111:  mov     eax, dword [ebp+8H]                     ; 2209 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 220C _ 8B. 40, 10
        cmp     dword [ebp-10H], eax                    ; 220F _ 39. 45, F0
        jl      ?_110                                   ; 2212 _ 7C, C1
?_112:  mov     eax, dword [ebp+8H]                     ; 2214 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2217 _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 221A _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 221D _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 2220 _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2223 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2226 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2229 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 222C _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 222F _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 2232 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 2235 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2238 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 223B _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 223E _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 2241 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2244 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2247 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 224A _ 8B. 40, 0C
        sub     esp, 8                                  ; 224D _ 83. EC, 08
        push    0                                       ; 2250 _ 6A, 00
        push    ebx                                     ; 2252 _ 53
        push    ecx                                     ; 2253 _ 51
        push    edx                                     ; 2254 _ 52
        push    eax                                     ; 2255 _ 50
        push    dword [ebp+8H]                          ; 2256 _ FF. 75, 08
        call    sheet_refreshmap                        ; 2259 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 225E _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 2261 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2264 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2267 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 226A _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 226D _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 2270 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 2273 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2276 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2279 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 227C _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 227F _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2282 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2285 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2288 _ 8B. 40, 0C
        sub     esp, 8                                  ; 228B _ 83. EC, 08
        push    0                                       ; 228E _ 6A, 00
        push    ebx                                     ; 2290 _ 53
        push    ecx                                     ; 2291 _ 51
        push    edx                                     ; 2292 _ 52
        push    eax                                     ; 2293 _ 50
        push    dword [ebp+8H]                          ; 2294 _ FF. 75, 08
        call    sheet_refreshsub                        ; 2297 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 229C _ 83. C4, 20
        jmp     ?_120                                   ; 229F _ E9, 00000156

?_113:  mov     eax, dword [ebp-0CH]                    ; 22A4 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 22A7 _ 3B. 45, 10
        jge     ?_120                                   ; 22AA _ 0F 8D, 0000014A
        cmp     dword [ebp-0CH], 0                      ; 22B0 _ 83. 7D, F4, 00
        js      ?_116                                   ; 22B4 _ 78, 56
        mov     eax, dword [ebp-0CH]                    ; 22B6 _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 22B9 _ 89. 45, F0
        jmp     ?_115                                   ; 22BC _ EB, 34

?_114:  mov     eax, dword [ebp-10H]                    ; 22BE _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 22C1 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 22C4 _ 8B. 45, 08
        add     edx, 4                                  ; 22C7 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 22CA _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 22CE _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 22D1 _ 8B. 4D, F0
        add     ecx, 4                                  ; 22D4 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 22D7 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 22DB _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 22DE _ 8B. 55, F0
        add     edx, 4                                  ; 22E1 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 22E4 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 22E8 _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 22EB _ 89. 50, 18
        add     dword [ebp-10H], 1                      ; 22EE _ 83. 45, F0, 01
?_115:  mov     eax, dword [ebp-10H]                    ; 22F2 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 22F5 _ 3B. 45, 10
        jl      ?_114                                   ; 22F8 _ 7C, C4
        mov     eax, dword [ebp+8H]                     ; 22FA _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 22FD _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 2300 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 2303 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 2306 _ 89. 54 88, 04
        jmp     ?_119                                   ; 230A _ EB, 6C

?_116:  mov     eax, dword [ebp+8H]                     ; 230C _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 230F _ 8B. 40, 10
        mov     dword [ebp-10H], eax                    ; 2312 _ 89. 45, F0
        jmp     ?_118                                   ; 2315 _ EB, 3A

?_117:  mov     eax, dword [ebp-10H]                    ; 2317 _ 8B. 45, F0
        lea     ecx, [eax+1H]                           ; 231A _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 231D _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 2320 _ 8B. 55, F0
        add     edx, 4                                  ; 2323 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 2326 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 232A _ 8B. 45, 08
        add     ecx, 4                                  ; 232D _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 2330 _ 89. 54 88, 04
        mov     eax, dword [ebp-10H]                    ; 2334 _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 2337 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 233A _ 8B. 45, 08
        add     edx, 4                                  ; 233D _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 2340 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 2344 _ 8B. 55, F0
        add     edx, 1                                  ; 2347 _ 83. C2, 01
        mov     dword [eax+18H], edx                    ; 234A _ 89. 50, 18
        sub     dword [ebp-10H], 1                      ; 234D _ 83. 6D, F0, 01
?_118:  mov     eax, dword [ebp-10H]                    ; 2351 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 2354 _ 3B. 45, 10
        jge     ?_117                                   ; 2357 _ 7D, BE
        mov     eax, dword [ebp+8H]                     ; 2359 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 235C _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 235F _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 2362 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 2365 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 2369 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 236C _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 236F _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2372 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 2375 _ 89. 50, 10
?_119:  mov     eax, dword [ebp+0CH]                    ; 2378 _ 8B. 45, 0C
        mov     ecx, dword [eax+18H]                    ; 237B _ 8B. 48, 18
        mov     eax, dword [ebp+0CH]                    ; 237E _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2381 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2384 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 2387 _ 8B. 40, 08
        lea     esi, [edx+eax]                          ; 238A _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 238D _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 2390 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2393 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2396 _ 8B. 40, 04
        lea     ebx, [edx+eax]                          ; 2399 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 239C _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 239F _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 23A2 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 23A5 _ 8B. 40, 0C
        sub     esp, 8                                  ; 23A8 _ 83. EC, 08
        push    ecx                                     ; 23AB _ 51
        push    esi                                     ; 23AC _ 56
        push    ebx                                     ; 23AD _ 53
        push    edx                                     ; 23AE _ 52
        push    eax                                     ; 23AF _ 50
        push    dword [ebp+8H]                          ; 23B0 _ FF. 75, 08
        call    sheet_refreshmap                        ; 23B3 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 23B8 _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 23BB _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 23BE _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 23C1 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 23C4 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 23C7 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 23CA _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 23CD _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 23D0 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 23D3 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 23D6 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 23D9 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 23DC _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 23DF _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 23E2 _ 8B. 40, 0C
        sub     esp, 8                                  ; 23E5 _ 83. EC, 08
        push    dword [ebp+10H]                         ; 23E8 _ FF. 75, 10
        push    ebx                                     ; 23EB _ 53
        push    ecx                                     ; 23EC _ 51
        push    edx                                     ; 23ED _ 52
        push    eax                                     ; 23EE _ 50
        push    dword [ebp+8H]                          ; 23EF _ FF. 75, 08
        call    sheet_refreshsub                        ; 23F2 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 23F7 _ 83. C4, 20
?_120:  nop                                             ; 23FA _ 90
        lea     esp, [ebp-8H]                           ; 23FB _ 8D. 65, F8
        pop     ebx                                     ; 23FE _ 5B
        pop     esi                                     ; 23FF _ 5E
        pop     ebp                                     ; 2400 _ 5D
        ret                                             ; 2401 _ C3
; sheet_updown End of function

sheet_refresh:; Function begin
        push    ebp                                     ; 2402 _ 55
        mov     ebp, esp                                ; 2403 _ 89. E5
        push    edi                                     ; 2405 _ 57
        push    esi                                     ; 2406 _ 56
        push    ebx                                     ; 2407 _ 53
        sub     esp, 12                                 ; 2408 _ 83. EC, 0C
        mov     eax, dword [ebp+0CH]                    ; 240B _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 240E _ 8B. 40, 18
        test    eax, eax                                ; 2411 _ 85. C0
        js      ?_121                                   ; 2413 _ 78, 47
        mov     eax, dword [ebp+0CH]                    ; 2415 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 2418 _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 241B _ 8B. 55, 0C
        mov     ecx, dword [edx+10H]                    ; 241E _ 8B. 4A, 10
        mov     edx, dword [ebp+1CH]                    ; 2421 _ 8B. 55, 1C
        lea     esi, [ecx+edx]                          ; 2424 _ 8D. 34 11
        mov     edx, dword [ebp+0CH]                    ; 2427 _ 8B. 55, 0C
        mov     ecx, dword [edx+0CH]                    ; 242A _ 8B. 4A, 0C
        mov     edx, dword [ebp+18H]                    ; 242D _ 8B. 55, 18
        lea     ebx, [ecx+edx]                          ; 2430 _ 8D. 1C 11
        mov     edx, dword [ebp+0CH]                    ; 2433 _ 8B. 55, 0C
        mov     ecx, dword [edx+10H]                    ; 2436 _ 8B. 4A, 10
        mov     edx, dword [ebp+14H]                    ; 2439 _ 8B. 55, 14
        add     ecx, edx                                ; 243C _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 243E _ 8B. 55, 0C
        mov     edi, dword [edx+0CH]                    ; 2441 _ 8B. 7A, 0C
        mov     edx, dword [ebp+10H]                    ; 2444 _ 8B. 55, 10
        add     edx, edi                                ; 2447 _ 01. FA
        sub     esp, 8                                  ; 2449 _ 83. EC, 08
        push    eax                                     ; 244C _ 50
        push    esi                                     ; 244D _ 56
        push    ebx                                     ; 244E _ 53
        push    ecx                                     ; 244F _ 51
        push    edx                                     ; 2450 _ 52
        push    dword [ebp+8H]                          ; 2451 _ FF. 75, 08
        call    sheet_refreshsub                        ; 2454 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2459 _ 83. C4, 20
?_121:  mov     eax, 0                                  ; 245C _ B8, 00000000
        lea     esp, [ebp-0CH]                          ; 2461 _ 8D. 65, F4
        pop     ebx                                     ; 2464 _ 5B
        pop     esi                                     ; 2465 _ 5E
        pop     edi                                     ; 2466 _ 5F
        pop     ebp                                     ; 2467 _ 5D
        ret                                             ; 2468 _ C3
; sheet_refresh End of function

sheet_slide_mouse:; Function begin
        push    ebp                                     ; 2469 _ 55
        mov     ebp, esp                                ; 246A _ 89. E5
        push    ebx                                     ; 246C _ 53
        sub     esp, 20                                 ; 246D _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 2470 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2473 _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 2476 _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 2479 _ 8B. 45, 0C
        mov     eax, dword [eax+10H]                    ; 247C _ 8B. 40, 10
        mov     dword [ebp-0CH], eax                    ; 247F _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 2482 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 2485 _ 8B. 55, 10
        mov     dword [eax+0CH], edx                    ; 2488 _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 248B _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 248E _ 8B. 55, 14
        mov     dword [eax+10H], edx                    ; 2491 _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2494 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 2497 _ 8B. 40, 18
        test    eax, eax                                ; 249A _ 85. C0
        js      ?_122                                   ; 249C _ 0F 88, 000000AE
        mov     eax, dword [ebp-0CH]                    ; 24A2 _ 8B. 45, F4
        lea     edx, [eax+10H]                          ; 24A5 _ 8D. 50, 10
        mov     eax, dword [ebp-10H]                    ; 24A8 _ 8B. 45, F0
        add     eax, 16                                 ; 24AB _ 83. C0, 10
        sub     esp, 8                                  ; 24AE _ 83. EC, 08
        push    0                                       ; 24B1 _ 6A, 00
        push    edx                                     ; 24B3 _ 52
        push    eax                                     ; 24B4 _ 50
        push    dword [ebp-0CH]                         ; 24B5 _ FF. 75, F4
        push    dword [ebp-10H]                         ; 24B8 _ FF. 75, F0
        push    dword [ebp+8H]                          ; 24BB _ FF. 75, 08
        call    sheet_refreshmap                        ; 24BE _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 24C3 _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 24C6 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 24C9 _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 24CC _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 24CF _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 24D2 _ 8B. 55, 14
        add     ecx, edx                                ; 24D5 _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 24D7 _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 24DA _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 24DD _ 8B. 55, 10
        add     edx, ebx                                ; 24E0 _ 01. DA
        sub     esp, 8                                  ; 24E2 _ 83. EC, 08
        push    eax                                     ; 24E5 _ 50
        push    ecx                                     ; 24E6 _ 51
        push    edx                                     ; 24E7 _ 52
        push    dword [ebp+14H]                         ; 24E8 _ FF. 75, 14
        push    dword [ebp+10H]                         ; 24EB _ FF. 75, 10
        push    dword [ebp+8H]                          ; 24EE _ FF. 75, 08
        call    sheet_refreshmap                        ; 24F1 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 24F6 _ 83. C4, 20
        mov     eax, dword [ebp-0CH]                    ; 24F9 _ 8B. 45, F4
        lea     edx, [eax+10H]                          ; 24FC _ 8D. 50, 10
        mov     eax, dword [ebp-10H]                    ; 24FF _ 8B. 45, F0
        add     eax, 16                                 ; 2502 _ 83. C0, 10
        sub     esp, 8                                  ; 2505 _ 83. EC, 08
        push    0                                       ; 2508 _ 6A, 00
        push    edx                                     ; 250A _ 52
        push    eax                                     ; 250B _ 50
        push    dword [ebp-0CH]                         ; 250C _ FF. 75, F4
        push    dword [ebp-10H]                         ; 250F _ FF. 75, F0
        push    dword [ebp+8H]                          ; 2512 _ FF. 75, 08
        call    sheet_refreshsub                        ; 2515 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 251A _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 251D _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 2520 _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 2523 _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 2526 _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 2529 _ 8B. 55, 14
        add     ecx, edx                                ; 252C _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 252E _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 2531 _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 2534 _ 8B. 55, 10
        add     edx, ebx                                ; 2537 _ 01. DA
        sub     esp, 8                                  ; 2539 _ 83. EC, 08
        push    eax                                     ; 253C _ 50
        push    ecx                                     ; 253D _ 51
        push    edx                                     ; 253E _ 52
        push    dword [ebp+14H]                         ; 253F _ FF. 75, 14
        push    dword [ebp+10H]                         ; 2542 _ FF. 75, 10
        push    dword [ebp+8H]                          ; 2545 _ FF. 75, 08
        call    sheet_refreshsub                        ; 2548 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 254D _ 83. C4, 20
?_122:  nop                                             ; 2550 _ 90
        mov     ebx, dword [ebp-4H]                     ; 2551 _ 8B. 5D, FC
        leave                                           ; 2554 _ C9
        ret                                             ; 2555 _ C3
; sheet_slide_mouse End of function

sheet_slide:; Function begin
        push    ebp                                     ; 2556 _ 55
        mov     ebp, esp                                ; 2557 _ 89. E5
        push    ebx                                     ; 2559 _ 53
        sub     esp, 20                                 ; 255A _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 255D _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2560 _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 2563 _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 2566 _ 8B. 45, 0C
        mov     eax, dword [eax+10H]                    ; 2569 _ 8B. 40, 10
        mov     dword [ebp-0CH], eax                    ; 256C _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 256F _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 2572 _ 8B. 55, 10
        mov     dword [eax+0CH], edx                    ; 2575 _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2578 _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 257B _ 8B. 55, 14
        mov     dword [eax+10H], edx                    ; 257E _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2581 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 2584 _ 8B. 40, 18
        test    eax, eax                                ; 2587 _ 85. C0
        js      ?_123                                   ; 2589 _ 0F 88, 000000C2
        mov     eax, dword [ebp+0CH]                    ; 258F _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 2592 _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 2595 _ 8B. 45, F4
        add     edx, eax                                ; 2598 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 259A _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 259D _ 8B. 48, 04
        mov     eax, dword [ebp-10H]                    ; 25A0 _ 8B. 45, F0
        add     eax, ecx                                ; 25A3 _ 01. C8
        sub     esp, 8                                  ; 25A5 _ 83. EC, 08
        push    0                                       ; 25A8 _ 6A, 00
        push    edx                                     ; 25AA _ 52
        push    eax                                     ; 25AB _ 50
        push    dword [ebp-0CH]                         ; 25AC _ FF. 75, F4
        push    dword [ebp-10H]                         ; 25AF _ FF. 75, F0
        push    dword [ebp+8H]                          ; 25B2 _ FF. 75, 08
        call    sheet_refreshmap                        ; 25B5 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 25BA _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 25BD _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 25C0 _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 25C3 _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 25C6 _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 25C9 _ 8B. 55, 14
        add     ecx, edx                                ; 25CC _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 25CE _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 25D1 _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 25D4 _ 8B. 55, 10
        add     edx, ebx                                ; 25D7 _ 01. DA
        sub     esp, 8                                  ; 25D9 _ 83. EC, 08
        push    eax                                     ; 25DC _ 50
        push    ecx                                     ; 25DD _ 51
        push    edx                                     ; 25DE _ 52
        push    dword [ebp+14H]                         ; 25DF _ FF. 75, 14
        push    dword [ebp+10H]                         ; 25E2 _ FF. 75, 10
        push    dword [ebp+8H]                          ; 25E5 _ FF. 75, 08
        call    sheet_refreshmap                        ; 25E8 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 25ED _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 25F0 _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 25F3 _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 25F6 _ 8B. 45, F4
        add     edx, eax                                ; 25F9 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 25FB _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 25FE _ 8B. 48, 04
        mov     eax, dword [ebp-10H]                    ; 2601 _ 8B. 45, F0
        add     eax, ecx                                ; 2604 _ 01. C8
        sub     esp, 8                                  ; 2606 _ 83. EC, 08
        push    0                                       ; 2609 _ 6A, 00
        push    edx                                     ; 260B _ 52
        push    eax                                     ; 260C _ 50
        push    dword [ebp-0CH]                         ; 260D _ FF. 75, F4
        push    dword [ebp-10H]                         ; 2610 _ FF. 75, F0
        push    dword [ebp+8H]                          ; 2613 _ FF. 75, 08
        call    sheet_refreshsub                        ; 2616 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 261B _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 261E _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 2621 _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 2624 _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 2627 _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 262A _ 8B. 55, 14
        add     ecx, edx                                ; 262D _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 262F _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 2632 _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 2635 _ 8B. 55, 10
        add     edx, ebx                                ; 2638 _ 01. DA
        sub     esp, 8                                  ; 263A _ 83. EC, 08
        push    eax                                     ; 263D _ 50
        push    ecx                                     ; 263E _ 51
        push    edx                                     ; 263F _ 52
        push    dword [ebp+14H]                         ; 2640 _ FF. 75, 14
        push    dword [ebp+10H]                         ; 2643 _ FF. 75, 10
        push    dword [ebp+8H]                          ; 2646 _ FF. 75, 08
        call    sheet_refreshsub                        ; 2649 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 264E _ 83. C4, 20
?_123:  nop                                             ; 2651 _ 90
        mov     ebx, dword [ebp-4H]                     ; 2652 _ 8B. 5D, FC
        leave                                           ; 2655 _ C9
        ret                                             ; 2656 _ C3
; sheet_slide End of function

sheet_refreshsub:; Function begin
        push    ebp                                     ; 2657 _ 55
        mov     ebp, esp                                ; 2658 _ 89. E5
        sub     esp, 48                                 ; 265A _ 83. EC, 30
        mov     eax, dword [ebp+8H]                     ; 265D _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2660 _ 8B. 00
        mov     dword [ebp-18H], eax                    ; 2662 _ 89. 45, E8
        mov     eax, dword [ebp+8H]                     ; 2665 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2668 _ 8B. 40, 04
        mov     dword [ebp-14H], eax                    ; 266B _ 89. 45, EC
        mov     eax, dword [ebp+1CH]                    ; 266E _ 8B. 45, 1C
        mov     dword [ebp-24H], eax                    ; 2671 _ 89. 45, DC
        jmp     ?_130                                   ; 2674 _ E9, 00000118

?_124:  mov     eax, dword [ebp+8H]                     ; 2679 _ 8B. 45, 08
        mov     edx, dword [ebp-24H]                    ; 267C _ 8B. 55, DC
        add     edx, 4                                  ; 267F _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 2682 _ 8B. 44 90, 04
        mov     dword [ebp-10H], eax                    ; 2686 _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 2689 _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 268C _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 268E _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 2691 _ 8B. 45, F0
        mov     edx, dword [ebp+8H]                     ; 2694 _ 8B. 55, 08
        add     edx, 1044                               ; 2697 _ 81. C2, 00000414
        sub     eax, edx                                ; 269D _ 29. D0
        sar     eax, 5                                  ; 269F _ C1. F8, 05
        mov     byte [ebp-26H], al                      ; 26A2 _ 88. 45, DA
        mov     dword [ebp-1CH], 0                      ; 26A5 _ C7. 45, E4, 00000000
        jmp     ?_129                                   ; 26AC _ E9, 000000CD

?_125:  mov     eax, dword [ebp-10H]                    ; 26B1 _ 8B. 45, F0
        mov     edx, dword [eax+10H]                    ; 26B4 _ 8B. 50, 10
        mov     eax, dword [ebp-1CH]                    ; 26B7 _ 8B. 45, E4
        add     eax, edx                                ; 26BA _ 01. D0
        mov     dword [ebp-8H], eax                     ; 26BC _ 89. 45, F8
        mov     dword [ebp-20H], 0                      ; 26BF _ C7. 45, E0, 00000000
        jmp     ?_128                                   ; 26C6 _ E9, 000000A0

?_126:  mov     eax, dword [ebp-10H]                    ; 26CB _ 8B. 45, F0
        mov     edx, dword [eax+0CH]                    ; 26CE _ 8B. 50, 0C
        mov     eax, dword [ebp-20H]                    ; 26D1 _ 8B. 45, E0
        add     eax, edx                                ; 26D4 _ 01. D0
        mov     dword [ebp-4H], eax                     ; 26D6 _ 89. 45, FC
        mov     eax, dword [ebp+0CH]                    ; 26D9 _ 8B. 45, 0C
        cmp     eax, dword [ebp-4H]                     ; 26DC _ 3B. 45, FC
        jg      ?_127                                   ; 26DF _ 0F 8F, 00000082
        mov     eax, dword [ebp-4H]                     ; 26E5 _ 8B. 45, FC
        cmp     eax, dword [ebp+14H]                    ; 26E8 _ 3B. 45, 14
        jge     ?_127                                   ; 26EB _ 7D, 7A
        mov     eax, dword [ebp+10H]                    ; 26ED _ 8B. 45, 10
        cmp     eax, dword [ebp-8H]                     ; 26F0 _ 3B. 45, F8
        jg      ?_127                                   ; 26F3 _ 7F, 72
        mov     eax, dword [ebp-8H]                     ; 26F5 _ 8B. 45, F8
        cmp     eax, dword [ebp+18H]                    ; 26F8 _ 3B. 45, 18
        jge     ?_127                                   ; 26FB _ 7D, 6A
        mov     eax, dword [ebp-10H]                    ; 26FD _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 2700 _ 8B. 40, 04
        imul    eax, dword [ebp-1CH]                    ; 2703 _ 0F AF. 45, E4
        mov     edx, eax                                ; 2707 _ 89. C2
        mov     eax, dword [ebp-20H]                    ; 2709 _ 8B. 45, E0
        add     eax, edx                                ; 270C _ 01. D0
        mov     edx, eax                                ; 270E _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 2710 _ 8B. 45, F4
        add     eax, edx                                ; 2713 _ 01. D0
        movzx   eax, byte [eax]                         ; 2715 _ 0F B6. 00
        mov     byte [ebp-25H], al                      ; 2718 _ 88. 45, DB
        mov     eax, dword [ebp+8H]                     ; 271B _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 271E _ 8B. 40, 08
        imul    eax, dword [ebp-8H]                     ; 2721 _ 0F AF. 45, F8
        mov     edx, eax                                ; 2725 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 2727 _ 8B. 45, FC
        add     eax, edx                                ; 272A _ 01. D0
        mov     edx, eax                                ; 272C _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 272E _ 8B. 45, EC
        add     eax, edx                                ; 2731 _ 01. D0
        movzx   eax, byte [eax]                         ; 2733 _ 0F B6. 00
        cmp     byte [ebp-26H], al                      ; 2736 _ 38. 45, DA
        jnz     ?_127                                   ; 2739 _ 75, 2C
        movzx   edx, byte [ebp-25H]                     ; 273B _ 0F B6. 55, DB
        mov     eax, dword [ebp-10H]                    ; 273F _ 8B. 45, F0
        mov     eax, dword [eax+14H]                    ; 2742 _ 8B. 40, 14
        cmp     edx, eax                                ; 2745 _ 39. C2
        jz      ?_127                                   ; 2747 _ 74, 1E
        mov     eax, dword [ebp+8H]                     ; 2749 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 274C _ 8B. 40, 08
        imul    eax, dword [ebp-8H]                     ; 274F _ 0F AF. 45, F8
        mov     edx, eax                                ; 2753 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 2755 _ 8B. 45, FC
        add     eax, edx                                ; 2758 _ 01. D0
        mov     edx, eax                                ; 275A _ 89. C2
        mov     eax, dword [ebp-18H]                    ; 275C _ 8B. 45, E8
        add     edx, eax                                ; 275F _ 01. C2
        movzx   eax, byte [ebp-25H]                     ; 2761 _ 0F B6. 45, DB
        mov     byte [edx], al                          ; 2765 _ 88. 02
?_127:  add     dword [ebp-20H], 1                      ; 2767 _ 83. 45, E0, 01
?_128:  mov     eax, dword [ebp-10H]                    ; 276B _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 276E _ 8B. 40, 04
        cmp     dword [ebp-20H], eax                    ; 2771 _ 39. 45, E0
        jl      ?_126                                   ; 2774 _ 0F 8C, FFFFFF51
        add     dword [ebp-1CH], 1                      ; 277A _ 83. 45, E4, 01
?_129:  mov     eax, dword [ebp-10H]                    ; 277E _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 2781 _ 8B. 40, 08
        cmp     dword [ebp-1CH], eax                    ; 2784 _ 39. 45, E4
        jl      ?_125                                   ; 2787 _ 0F 8C, FFFFFF24
        add     dword [ebp-24H], 1                      ; 278D _ 83. 45, DC, 01
?_130:  mov     eax, dword [ebp+8H]                     ; 2791 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2794 _ 8B. 40, 10
        cmp     dword [ebp-24H], eax                    ; 2797 _ 39. 45, DC
        jle     ?_124                                   ; 279A _ 0F 8E, FFFFFED9
        nop                                             ; 27A0 _ 90
        leave                                           ; 27A1 _ C9
        ret                                             ; 27A2 _ C3
; sheet_refreshsub End of function

sheet_refreshmap:; Function begin
        push    ebp                                     ; 27A3 _ 55
        mov     ebp, esp                                ; 27A4 _ 89. E5
        sub     esp, 64                                 ; 27A6 _ 83. EC, 40
        mov     eax, dword [ebp+8H]                     ; 27A9 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 27AC _ 8B. 40, 04
        mov     dword [ebp-14H], eax                    ; 27AF _ 89. 45, EC
        cmp     dword [ebp+0CH], 0                      ; 27B2 _ 83. 7D, 0C, 00
        jns     ?_131                                   ; 27B6 _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 27B8 _ C7. 45, 0C, 00000000
?_131:  cmp     dword [ebp+10H], 0                      ; 27BF _ 83. 7D, 10, 00
        jns     ?_132                                   ; 27C3 _ 79, 07
        mov     dword [ebp+10H], 0                      ; 27C5 _ C7. 45, 10, 00000000
?_132:  mov     eax, dword [ebp+8H]                     ; 27CC _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 27CF _ 8B. 40, 08
        cmp     dword [ebp+14H], eax                    ; 27D2 _ 39. 45, 14
        jle     ?_133                                   ; 27D5 _ 7E, 09
        mov     eax, dword [ebp+8H]                     ; 27D7 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 27DA _ 8B. 40, 08
        mov     dword [ebp+14H], eax                    ; 27DD _ 89. 45, 14
?_133:  mov     eax, dword [ebp+8H]                     ; 27E0 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 27E3 _ 8B. 40, 0C
        cmp     dword [ebp+18H], eax                    ; 27E6 _ 39. 45, 18
        jle     ?_134                                   ; 27E9 _ 7E, 09
        mov     eax, dword [ebp+8H]                     ; 27EB _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 27EE _ 8B. 40, 0C
        mov     dword [ebp+18H], eax                    ; 27F1 _ 89. 45, 18
?_134:  mov     eax, dword [ebp+1CH]                    ; 27F4 _ 8B. 45, 1C
        mov     dword [ebp-30H], eax                    ; 27F7 _ 89. 45, D0
        jmp     ?_145                                   ; 27FA _ E9, 00000140

?_135:  mov     eax, dword [ebp+8H]                     ; 27FF _ 8B. 45, 08
        mov     edx, dword [ebp-30H]                    ; 2802 _ 8B. 55, D0
        add     edx, 4                                  ; 2805 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 2808 _ 8B. 44 90, 04
        mov     dword [ebp-10H], eax                    ; 280C _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 280F _ 8B. 45, F0
        mov     edx, dword [ebp+8H]                     ; 2812 _ 8B. 55, 08
        add     edx, 1044                               ; 2815 _ 81. C2, 00000414
        sub     eax, edx                                ; 281B _ 29. D0
        sar     eax, 5                                  ; 281D _ C1. F8, 05
        mov     byte [ebp-31H], al                      ; 2820 _ 88. 45, CF
        mov     eax, dword [ebp-10H]                    ; 2823 _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 2826 _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 2828 _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 282B _ 8B. 45, F0
        mov     eax, dword [eax+0CH]                    ; 282E _ 8B. 40, 0C
        mov     edx, dword [ebp+0CH]                    ; 2831 _ 8B. 55, 0C
        sub     edx, eax                                ; 2834 _ 29. C2
        mov     eax, edx                                ; 2836 _ 89. D0
        mov     dword [ebp-24H], eax                    ; 2838 _ 89. 45, DC
        mov     eax, dword [ebp-10H]                    ; 283B _ 8B. 45, F0
        mov     eax, dword [eax+10H]                    ; 283E _ 8B. 40, 10
        mov     edx, dword [ebp+10H]                    ; 2841 _ 8B. 55, 10
        sub     edx, eax                                ; 2844 _ 29. C2
        mov     eax, edx                                ; 2846 _ 89. D0
        mov     dword [ebp-20H], eax                    ; 2848 _ 89. 45, E0
        mov     eax, dword [ebp-10H]                    ; 284B _ 8B. 45, F0
        mov     eax, dword [eax+0CH]                    ; 284E _ 8B. 40, 0C
        mov     edx, dword [ebp+14H]                    ; 2851 _ 8B. 55, 14
        sub     edx, eax                                ; 2854 _ 29. C2
        mov     eax, edx                                ; 2856 _ 89. D0
        mov     dword [ebp-1CH], eax                    ; 2858 _ 89. 45, E4
        mov     eax, dword [ebp-10H]                    ; 285B _ 8B. 45, F0
        mov     eax, dword [eax+10H]                    ; 285E _ 8B. 40, 10
        mov     edx, dword [ebp+18H]                    ; 2861 _ 8B. 55, 18
        sub     edx, eax                                ; 2864 _ 29. C2
        mov     eax, edx                                ; 2866 _ 89. D0
        mov     dword [ebp-18H], eax                    ; 2868 _ 89. 45, E8
        cmp     dword [ebp-24H], 0                      ; 286B _ 83. 7D, DC, 00
        jns     ?_136                                   ; 286F _ 79, 07
        mov     dword [ebp-24H], 0                      ; 2871 _ C7. 45, DC, 00000000
?_136:  cmp     dword [ebp-20H], 0                      ; 2878 _ 83. 7D, E0, 00
        jns     ?_137                                   ; 287C _ 79, 07
        mov     dword [ebp-20H], 0                      ; 287E _ C7. 45, E0, 00000000
?_137:  mov     eax, dword [ebp-10H]                    ; 2885 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 2888 _ 8B. 40, 04
        cmp     dword [ebp-1CH], eax                    ; 288B _ 39. 45, E4
        jle     ?_138                                   ; 288E _ 7E, 09
        mov     eax, dword [ebp-10H]                    ; 2890 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 2893 _ 8B. 40, 04
        mov     dword [ebp-1CH], eax                    ; 2896 _ 89. 45, E4
?_138:  mov     eax, dword [ebp-10H]                    ; 2899 _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 289C _ 8B. 40, 08
        cmp     dword [ebp-18H], eax                    ; 289F _ 39. 45, E8
        jle     ?_139                                   ; 28A2 _ 7E, 09
        mov     eax, dword [ebp-10H]                    ; 28A4 _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 28A7 _ 8B. 40, 08
        mov     dword [ebp-18H], eax                    ; 28AA _ 89. 45, E8
?_139:  mov     eax, dword [ebp-20H]                    ; 28AD _ 8B. 45, E0
        mov     dword [ebp-28H], eax                    ; 28B0 _ 89. 45, D8
        jmp     ?_144                                   ; 28B3 _ EB, 7A

?_140:  mov     eax, dword [ebp-10H]                    ; 28B5 _ 8B. 45, F0
        mov     edx, dword [eax+10H]                    ; 28B8 _ 8B. 50, 10
        mov     eax, dword [ebp-28H]                    ; 28BB _ 8B. 45, D8
        add     eax, edx                                ; 28BE _ 01. D0
        mov     dword [ebp-8H], eax                     ; 28C0 _ 89. 45, F8
        mov     eax, dword [ebp-24H]                    ; 28C3 _ 8B. 45, DC
        mov     dword [ebp-2CH], eax                    ; 28C6 _ 89. 45, D4
        jmp     ?_143                                   ; 28C9 _ EB, 58

?_141:  mov     eax, dword [ebp-10H]                    ; 28CB _ 8B. 45, F0
        mov     edx, dword [eax+0CH]                    ; 28CE _ 8B. 50, 0C
        mov     eax, dword [ebp-2CH]                    ; 28D1 _ 8B. 45, D4
        add     eax, edx                                ; 28D4 _ 01. D0
        mov     dword [ebp-4H], eax                     ; 28D6 _ 89. 45, FC
        mov     eax, dword [ebp-10H]                    ; 28D9 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 28DC _ 8B. 40, 04
        imul    eax, dword [ebp-28H]                    ; 28DF _ 0F AF. 45, D8
        mov     edx, eax                                ; 28E3 _ 89. C2
        mov     eax, dword [ebp-2CH]                    ; 28E5 _ 8B. 45, D4
        add     eax, edx                                ; 28E8 _ 01. D0
        mov     edx, eax                                ; 28EA _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 28EC _ 8B. 45, F4
        add     eax, edx                                ; 28EF _ 01. D0
        movzx   eax, byte [eax]                         ; 28F1 _ 0F B6. 00
        movzx   edx, al                                 ; 28F4 _ 0F B6. D0
        mov     eax, dword [ebp-10H]                    ; 28F7 _ 8B. 45, F0
        mov     eax, dword [eax+14H]                    ; 28FA _ 8B. 40, 14
        cmp     edx, eax                                ; 28FD _ 39. C2
        jz      ?_142                                   ; 28FF _ 74, 1E
        mov     eax, dword [ebp+8H]                     ; 2901 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2904 _ 8B. 40, 08
        imul    eax, dword [ebp-8H]                     ; 2907 _ 0F AF. 45, F8
        mov     edx, eax                                ; 290B _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 290D _ 8B. 45, FC
        add     eax, edx                                ; 2910 _ 01. D0
        mov     edx, eax                                ; 2912 _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 2914 _ 8B. 45, EC
        add     edx, eax                                ; 2917 _ 01. C2
        movzx   eax, byte [ebp-31H]                     ; 2919 _ 0F B6. 45, CF
        mov     byte [edx], al                          ; 291D _ 88. 02
?_142:  add     dword [ebp-2CH], 1                      ; 291F _ 83. 45, D4, 01
?_143:  mov     eax, dword [ebp-2CH]                    ; 2923 _ 8B. 45, D4
        cmp     eax, dword [ebp-1CH]                    ; 2926 _ 3B. 45, E4
        jl      ?_141                                   ; 2929 _ 7C, A0
        add     dword [ebp-28H], 1                      ; 292B _ 83. 45, D8, 01
?_144:  mov     eax, dword [ebp-28H]                    ; 292F _ 8B. 45, D8
        cmp     eax, dword [ebp-18H]                    ; 2932 _ 3B. 45, E8
        jl      ?_140                                   ; 2935 _ 0F 8C, FFFFFF7A
        add     dword [ebp-30H], 1                      ; 293B _ 83. 45, D0, 01
?_145:  mov     eax, dword [ebp+8H]                     ; 293F _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2942 _ 8B. 40, 10
        cmp     dword [ebp-30H], eax                    ; 2945 _ 39. 45, D0
        jle     ?_135                                   ; 2948 _ 0F 8E, FFFFFEB1
        nop                                             ; 294E _ 90
        leave                                           ; 294F _ C9
        ret                                             ; 2950 _ C3
; sheet_refreshmap End of function

init_pit:; Function begin
        push    ebp                                     ; 2951 _ 55
        mov     ebp, esp                                ; 2952 _ 89. E5
        sub     esp, 24                                 ; 2954 _ 83. EC, 18
        sub     esp, 8                                  ; 2957 _ 83. EC, 08
        push    52                                      ; 295A _ 6A, 34
        push    67                                      ; 295C _ 6A, 43
        call    io_out8                                 ; 295E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2963 _ 83. C4, 10
        sub     esp, 8                                  ; 2966 _ 83. EC, 08
        push    156                                     ; 2969 _ 68, 0000009C
        push    64                                      ; 296E _ 6A, 40
        call    io_out8                                 ; 2970 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2975 _ 83. C4, 10
        sub     esp, 8                                  ; 2978 _ 83. EC, 08
        push    46                                      ; 297B _ 6A, 2E
        push    64                                      ; 297D _ 6A, 40
        call    io_out8                                 ; 297F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2984 _ 83. C4, 10
        sub     esp, 8                                  ; 2987 _ 83. EC, 08
        push    8000                                    ; 298A _ 68, 00001F40
        push    dword [ebp+8H]                          ; 298F _ FF. 75, 08
        call    memman_alloc_4k                         ; 2992 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2997 _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 299A _ 89. 45, F4
        cmp     dword [ebp-0CH], 0                      ; 299D _ 83. 7D, F4, 00
        jnz     ?_146                                   ; 29A1 _ 75, 07
        mov     eax, 0                                  ; 29A3 _ B8, 00000000
        jmp     ?_149                                   ; 29A8 _ EB, 36

?_146:  mov     eax, dword [ebp-0CH]                    ; 29AA _ 8B. 45, F4
        mov     dword [eax], 0                          ; 29AD _ C7. 00, 00000000
        mov     dword [ebp-10H], 0                      ; 29B3 _ C7. 45, F0, 00000000
        jmp     ?_148                                   ; 29BA _ EB, 18

?_147:  mov     eax, dword [ebp-0CH]                    ; 29BC _ 8B. 45, F4
        mov     edx, dword [ebp-10H]                    ; 29BF _ 8B. 55, F0
        shl     edx, 4                                  ; 29C2 _ C1. E2, 04
        add     eax, edx                                ; 29C5 _ 01. D0
        add     eax, 4                                  ; 29C7 _ 83. C0, 04
        mov     dword [eax], 0                          ; 29CA _ C7. 00, 00000000
        add     dword [ebp-10H], 1                      ; 29D0 _ 83. 45, F0, 01
?_148:  cmp     dword [ebp-10H], 499                    ; 29D4 _ 81. 7D, F0, 000001F3
        jle     ?_147                                   ; 29DB _ 7E, DF
        mov     eax, dword [ebp-0CH]                    ; 29DD _ 8B. 45, F4
?_149:  leave                                           ; 29E0 _ C9
        ret                                             ; 29E1 _ C3
; init_pit End of function

timer_alloc:; Function begin
        push    ebp                                     ; 29E2 _ 55
        mov     ebp, esp                                ; 29E3 _ 89. E5
        sub     esp, 16                                 ; 29E5 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 29E8 _ C7. 45, FC, 00000000
        jmp     ?_152                                   ; 29EF _ EB, 3E

?_150:  mov     eax, dword [ebp+8H]                     ; 29F1 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 29F4 _ 8B. 55, FC
        shl     edx, 4                                  ; 29F7 _ C1. E2, 04
        add     eax, edx                                ; 29FA _ 01. D0
        add     eax, 4                                  ; 29FC _ 83. C0, 04
        mov     eax, dword [eax]                        ; 29FF _ 8B. 00
        test    eax, eax                                ; 2A01 _ 85. C0
        jnz     ?_151                                   ; 2A03 _ 75, 26
        mov     eax, dword [ebp+8H]                     ; 2A05 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 2A08 _ 8B. 55, FC
        shl     edx, 4                                  ; 2A0B _ C1. E2, 04
        add     eax, edx                                ; 2A0E _ 01. D0
        add     eax, 4                                  ; 2A10 _ 83. C0, 04
        mov     dword [eax], 1                          ; 2A13 _ C7. 00, 00000001
        mov     eax, dword [ebp-4H]                     ; 2A19 _ 8B. 45, FC
        shl     eax, 4                                  ; 2A1C _ C1. E0, 04
        mov     edx, eax                                ; 2A1F _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2A21 _ 8B. 45, 08
        add     eax, edx                                ; 2A24 _ 01. D0
        add     eax, 4                                  ; 2A26 _ 83. C0, 04
        jmp     ?_153                                   ; 2A29 _ EB, 12

?_151:  add     dword [ebp-4H], 1                       ; 2A2B _ 83. 45, FC, 01
?_152:  cmp     dword [ebp-4H], 499                     ; 2A2F _ 81. 7D, FC, 000001F3
        jle     ?_150                                   ; 2A36 _ 7E, B9
        mov     eax, 0                                  ; 2A38 _ B8, 00000000
?_153:  leave                                           ; 2A3D _ C9
        ret                                             ; 2A3E _ C3
; timer_alloc End of function

timer_free:; Function begin
        push    ebp                                     ; 2A3F _ 55
        mov     ebp, esp                                ; 2A40 _ 89. E5
        mov     eax, dword [ebp+0CH]                    ; 2A42 _ 8B. 45, 0C
        mov     dword [eax], 0                          ; 2A45 _ C7. 00, 00000000
        nop                                             ; 2A4B _ 90
        pop     ebp                                     ; 2A4C _ 5D
        ret                                             ; 2A4D _ C3
; timer_free End of function

timer_init:; Function begin
        push    ebp                                     ; 2A4E _ 55
        mov     ebp, esp                                ; 2A4F _ 89. E5
        sub     esp, 4                                  ; 2A51 _ 83. EC, 04
        mov     eax, dword [ebp+14H]                    ; 2A54 _ 8B. 45, 14
        mov     byte [ebp-4H], al                       ; 2A57 _ 88. 45, FC
        mov     eax, dword [ebp+0CH]                    ; 2A5A _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 2A5D _ 8B. 55, 10
        mov     dword [eax+8H], edx                     ; 2A60 _ 89. 50, 08
        mov     eax, dword [ebp+0CH]                    ; 2A63 _ 8B. 45, 0C
        movzx   edx, byte [ebp-4H]                      ; 2A66 _ 0F B6. 55, FC
        mov     byte [eax+0CH], dl                      ; 2A6A _ 88. 50, 0C
        nop                                             ; 2A6D _ 90
        leave                                           ; 2A6E _ C9
        ret                                             ; 2A6F _ C3
; timer_init End of function

timer_setdata:; Function begin
        push    ebp                                     ; 2A70 _ 55
        mov     ebp, esp                                ; 2A71 _ 89. E5
        sub     esp, 4                                  ; 2A73 _ 83. EC, 04
        mov     eax, dword [ebp+10H]                    ; 2A76 _ 8B. 45, 10
        mov     byte [ebp-4H], al                       ; 2A79 _ 88. 45, FC
        mov     eax, dword [ebp+0CH]                    ; 2A7C _ 8B. 45, 0C
        movzx   edx, byte [ebp-4H]                      ; 2A7F _ 0F B6. 55, FC
        mov     byte [eax+0CH], dl                      ; 2A83 _ 88. 50, 0C
        nop                                             ; 2A86 _ 90
        leave                                           ; 2A87 _ C9
        ret                                             ; 2A88 _ C3
; timer_setdata End of function

timer_settime:; Function begin
        push    ebp                                     ; 2A89 _ 55
        mov     ebp, esp                                ; 2A8A _ 89. E5
        mov     eax, dword [ebp+0CH]                    ; 2A8C _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 2A8F _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 2A92 _ 89. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 2A95 _ 8B. 45, 0C
        mov     dword [eax], 2                          ; 2A98 _ C7. 00, 00000002
        nop                                             ; 2A9E _ 90
        pop     ebp                                     ; 2A9F _ 5D
        ret                                             ; 2AA0 _ C3
; timer_settime End of function

fifo8_init:; Function begin
        push    ebp                                     ; 2AA1 _ 55
        mov     ebp, esp                                ; 2AA2 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 2AA4 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 2AA7 _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 2AAA _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 2AAD _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 2AB0 _ 8B. 55, 10
        mov     dword [eax], edx                        ; 2AB3 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 2AB5 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 2AB8 _ 8B. 55, 0C
        mov     dword [eax+10H], edx                    ; 2ABB _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 2ABE _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 2AC1 _ C7. 40, 14, 00000000
        mov     eax, dword [ebp+8H]                     ; 2AC8 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 2ACB _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 2AD2 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 2AD5 _ C7. 40, 08, 00000000
        nop                                             ; 2ADC _ 90
        pop     ebp                                     ; 2ADD _ 5D
        ret                                             ; 2ADE _ C3
; fifo8_init End of function

fifo8_put:; Function begin
        push    ebp                                     ; 2ADF _ 55
        mov     ebp, esp                                ; 2AE0 _ 89. E5
        sub     esp, 4                                  ; 2AE2 _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 2AE5 _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 2AE8 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 2AEB _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2AEE _ 8B. 40, 10
        test    eax, eax                                ; 2AF1 _ 85. C0
        jnz     ?_154                                   ; 2AF3 _ 75, 18
        mov     eax, dword [ebp+8H]                     ; 2AF5 _ 8B. 45, 08
        mov     eax, dword [eax+14H]                    ; 2AF8 _ 8B. 40, 14
        or      eax, 01H                                ; 2AFB _ 83. C8, 01
        mov     edx, eax                                ; 2AFE _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2B00 _ 8B. 45, 08
        mov     dword [eax+14H], edx                    ; 2B03 _ 89. 50, 14
        mov     eax, 4294967295                         ; 2B06 _ B8, FFFFFFFF
        jmp     ?_156                                   ; 2B0B _ EB, 50

?_154:  mov     eax, dword [ebp+8H]                     ; 2B0D _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 2B10 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 2B12 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2B15 _ 8B. 40, 04
        add     edx, eax                                ; 2B18 _ 01. C2
        movzx   eax, byte [ebp-4H]                      ; 2B1A _ 0F B6. 45, FC
        mov     byte [edx], al                          ; 2B1E _ 88. 02
        mov     eax, dword [ebp+8H]                     ; 2B20 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2B23 _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 2B26 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2B29 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 2B2C _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 2B2F _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 2B32 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 2B35 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2B38 _ 8B. 40, 0C
        cmp     edx, eax                                ; 2B3B _ 39. C2
        jnz     ?_155                                   ; 2B3D _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 2B3F _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 2B42 _ C7. 40, 04, 00000000
?_155:  mov     eax, dword [ebp+8H]                     ; 2B49 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2B4C _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 2B4F _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 2B52 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 2B55 _ 89. 50, 10
        mov     eax, 0                                  ; 2B58 _ B8, 00000000
?_156:  leave                                           ; 2B5D _ C9
        ret                                             ; 2B5E _ C3
; fifo8_put End of function

fifo8_get:; Function begin
        push    ebp                                     ; 2B5F _ 55
        mov     ebp, esp                                ; 2B60 _ 89. E5
        sub     esp, 16                                 ; 2B62 _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 2B65 _ 8B. 45, 08
        mov     edx, dword [eax+10H]                    ; 2B68 _ 8B. 50, 10
        mov     eax, dword [ebp+8H]                     ; 2B6B _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2B6E _ 8B. 40, 0C
        cmp     edx, eax                                ; 2B71 _ 39. C2
        jnz     ?_157                                   ; 2B73 _ 75, 07
        mov     eax, 4294967295                         ; 2B75 _ B8, FFFFFFFF
        jmp     ?_159                                   ; 2B7A _ EB, 51

?_157:  mov     eax, dword [ebp+8H]                     ; 2B7C _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 2B7F _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 2B81 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2B84 _ 8B. 40, 08
        add     eax, edx                                ; 2B87 _ 01. D0
        movzx   eax, byte [eax]                         ; 2B89 _ 0F B6. 00
        movzx   eax, al                                 ; 2B8C _ 0F B6. C0
        mov     dword [ebp-4H], eax                     ; 2B8F _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 2B92 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2B95 _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 2B98 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2B9B _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 2B9E _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 2BA1 _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 2BA4 _ 8B. 50, 08
        mov     eax, dword [ebp+8H]                     ; 2BA7 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2BAA _ 8B. 40, 0C
        cmp     edx, eax                                ; 2BAD _ 39. C2
        jnz     ?_158                                   ; 2BAF _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 2BB1 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 2BB4 _ C7. 40, 08, 00000000
?_158:  mov     eax, dword [ebp+8H]                     ; 2BBB _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2BBE _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 2BC1 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2BC4 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 2BC7 _ 89. 50, 10
        mov     eax, dword [ebp-4H]                     ; 2BCA _ 8B. 45, FC
?_159:  leave                                           ; 2BCD _ C9
        ret                                             ; 2BCE _ C3
; fifo8_get End of function

fifo8_status:; Function begin
        push    ebp                                     ; 2BCF _ 55
        mov     ebp, esp                                ; 2BD0 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 2BD2 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 2BD5 _ 8B. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 2BD8 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2BDB _ 8B. 40, 10
        sub     edx, eax                                ; 2BDE _ 29. C2
        mov     eax, edx                                ; 2BE0 _ 89. D0
        pop     ebp                                     ; 2BE2 _ 5D
        ret                                             ; 2BE3 _ C3
; fifo8_status End of function



?_160:                                                  ; byte
        db 77H, 69H, 6EH, 64H, 64H, 6FH, 77H, 6EH       ; 0000 _ winddown
        db 00H                                          ; 0008 _ .

?_161:                                                  ; byte
        db 4EH, 65H, 77H, 20H, 35H, 5BH, 73H, 65H       ; 0009 _ New 5[se
        db 63H, 5DH, 00H                                ; 0011 _ c].

?_162:                                                  ; byte
        db 33H, 20H, 5BH, 73H, 65H, 63H, 5DH, 00H       ; 0014 _ 3 [sec].

?_163:                                                  ; byte
        db 69H, 6DH, 70H, 72H, 6FH, 76H, 65H, 20H       ; 001C _ improve 
        db 73H, 74H, 72H, 69H, 6EH, 67H, 20H, 73H       ; 0024 _ string s
        db 68H, 6FH, 77H, 69H, 6EH, 67H, 21H, 00H       ; 002C _ howing!.

?_164:                                                  ; byte
        db 70H, 61H, 67H, 65H, 20H, 69H, 73H, 3AH       ; 0034 _ page is:
        db 20H, 00H                                     ; 003C _  .

?_165:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 003E _ BaseAddr
        db 4CH, 3AH, 20H, 00H                           ; 0046 _ L: .

?_166:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 004A _ BaseAddr
        db 48H, 3AH, 20H, 00H                           ; 0052 _ H: .

?_167:                                                  ; byte
        db 4CH, 65H, 6EH, 67H, 74H, 68H, 4CH, 6FH       ; 0056 _ LengthLo
        db 77H, 3AH, 20H, 00H                           ; 005E _ w: .

?_168:                                                  ; byte
        db 4CH, 65H, 6EH, 67H, 74H, 68H, 48H, 69H       ; 0062 _ LengthHi
        db 67H, 68H, 3AH, 20H, 00H                      ; 006A _ gh: .

?_169:                                                  ; byte
        db 54H, 79H, 70H, 65H, 3AH, 20H, 00H            ; 006F _ Type: .



keyval:                                                 ; byte
        db 30H, 78H                                     ; 0000 _ 0x

?_170:  db 00H                                          ; 0002 _ .

?_171:  db 00H, 00H, 00H, 00H, 00H                      ; 0003 _ .....

memman: dd 00100000H, 00000000H                         ; 0008 _ 1048576 0 
        dd 00000000H, 00000000H                         ; 0010 _ 0 0 
        dd 00000000H, 00000000H                         ; 0018 _ 0 0 

keytable:                                               ; byte
        db 00H, 00H, 31H, 32H, 33H, 34H, 35H, 36H       ; 0020 _ ..123456
        db 37H, 38H, 39H, 30H, 2DH, 5EH, 00H, 00H       ; 0028 _ 7890-^..
        db 51H, 57H, 45H, 52H, 54H, 59H, 55H, 49H       ; 0030 _ QWERTYUI
        db 4FH, 50H, 40H, 5BH, 00H, 00H, 61H, 53H       ; 0038 _ OP@[..aS
        db 44H, 46H, 47H, 48H, 4AH, 4BH, 4CH, 3BH       ; 0040 _ DFGHJKL;
        db 3AH, 00H, 00H, 5DH, 5AH, 58H, 43H, 56H       ; 0048 _ :..]ZXCV
        db 42H, 4EH, 4DH, 2CH, 00H, 2FH, 00H, 2AH       ; 0050 _ BNM,./.*
        db 00H, 20H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0058 _ . ......
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 37H       ; 0060 _ .......7
        db 38H, 39H, 2DH, 34H, 35H, 36H, 2BH, 31H       ; 0068 _ 89-456+1
        db 32H, 33H, 30H, 2EH                           ; 0070 _ 230.

cursor_x.1750:                                          ; dword
        dd 00000008H                                    ; 0074 _ 8 

cursor_c.1751:                                          ; dword
        dd 00000007H                                    ; 0078 _ 7 

debug_y.1753:                                           ; dword
        dd 0000012CH                                    ; 007C _ 300 

table_rgb.1762:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 00H, 0FFH     ; 0080 _ ........
        db 00H, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH   ; 0088 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0090 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0098 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 00A0 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 00A8 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00B0 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00B8 _ ........

cursor.1819:                                            ; byte
        db 2AH, 2AH, 2AH, 2AH, 2AH, 2AH, 2AH, 2AH       ; 00C0 _ ********
        db 2AH, 2AH, 2AH, 2AH, 2AH, 2AH, 2EH, 2EH       ; 00C8 _ ******..
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 00D0 _ *OOOOOOO
        db 4FH, 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH       ; 00D8 _ OOOO*...
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 00E0 _ *OOOOOOO
        db 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH       ; 00E8 _ OOO*....
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 00F0 _ *OOOOOOO
        db 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 00F8 _ OO*.....
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 0100 _ *OOOOOOO
        db 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0108 _ O*......
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 0110 _ *OOOOOOO
        db 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0118 _ *.......
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 0120 _ *OOOOOOO
        db 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0128 _ *.......
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 0130 _ *OOOOOOO
        db 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0138 _ O*......
        db 2AH, 4FH, 4FH, 4FH, 4FH, 2AH, 2AH, 4FH       ; 0140 _ *OOOO**O
        db 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0148 _ OO*.....
        db 2AH, 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2AH       ; 0150 _ *OOO*..*
        db 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH       ; 0158 _ OOO*....
        db 2AH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH       ; 0160 _ *OO*....
        db 2AH, 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH       ; 0168 _ *OOO*...
        db 2AH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0170 _ *O*.....
        db 2EH, 2AH, 4FH, 4FH, 4FH, 2AH, 2EH, 2EH       ; 0178 _ .*OOO*..
        db 2AH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0180 _ **......
        db 2EH, 2EH, 2AH, 4FH, 4FH, 4FH, 2AH, 2EH       ; 0188 _ ..*OOO*.
        db 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0190 _ *.......
        db 2EH, 2EH, 2EH, 2AH, 4FH, 4FH, 4FH, 2AH       ; 0198 _ ...*OOO*
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 01A0 _ ........
        db 2EH, 2EH, 2EH, 2EH, 2AH, 4FH, 4FH, 2AH       ; 01A8 _ ....*OO*
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 01B0 _ ........
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2AH, 2AH, 2AH       ; 01B8 _ .....***

closebtn.1934:                                          ; byte
        db 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 01C0 _ OOOOOOOO
        db 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 40H       ; 01C8 _ OOOOOOO@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 51H       ; 01D0 _ OQQQQQQQ
        db 51H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 01D8 _ QQQQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 51H       ; 01E0 _ OQQQQQQQ
        db 51H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 01E8 _ QQQQQQ$@
        db 4FH, 51H, 51H, 51H, 40H, 40H, 51H, 51H       ; 01F0 _ OQQQ@@QQ
        db 51H, 51H, 40H, 40H, 51H, 51H, 24H, 40H       ; 01F8 _ QQ@@QQ$@
        db 4FH, 51H, 51H, 51H, 51H, 40H, 40H, 51H       ; 0200 _ OQQQQ@@Q
        db 51H, 40H, 40H, 51H, 51H, 51H, 24H, 40H       ; 0208 _ Q@@QQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 40H, 40H       ; 0210 _ OQQQQQ@@
        db 40H, 40H, 51H, 51H, 51H, 51H, 24H, 40H       ; 0218 _ @@QQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 40H       ; 0220 _ OQQQQQQ@
        db 40H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 0228 _ @QQQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 40H, 40H       ; 0230 _ OQQQQQ@@
        db 40H, 40H, 51H, 51H, 51H, 51H, 24H, 40H       ; 0238 _ @@QQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 40H, 40H, 51H       ; 0240 _ OQQQQ@@Q
        db 51H, 40H, 40H, 51H, 51H, 51H, 24H, 40H       ; 0248 _ Q@@QQQ$@
        db 4FH, 51H, 51H, 51H, 40H, 40H, 51H, 51H       ; 0250 _ OQQQ@@QQ
        db 51H, 51H, 40H, 40H, 51H, 51H, 24H, 40H       ; 0258 _ QQ@@QQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 51H       ; 0260 _ OQQQQQQQ
        db 51H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 0268 _ QQQQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 51H       ; 0270 _ OQQQQQQQ
        db 51H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 0278 _ QQQQQQ$@
        db 4FH, 24H, 24H, 24H, 24H, 24H, 24H, 24H       ; 0280 _ O$$$$$$$
        db 24H, 24H, 24H, 24H, 24H, 24H, 24H, 40H       ; 0288 _ $$$$$$$@
        db 40H, 40H, 40H, 40H, 40H, 40H, 40H, 40H       ; 0290 _ @@@@@@@@
        db 40H, 40H, 40H, 40H, 40H, 40H, 40H, 40H       ; 0298 _ @@@@@@@@



bootInfo:                                               ; qword
        resb    4                                       ; 0000

?_172:  resw    1                                       ; 0004

?_173:  resw    1                                       ; 0006

mouseinfo:                                              ; byte
        resb    24                                      ; 0008

keyinfo:                                                ; byte
        resb    32                                      ; 0020

mousebuf:                                               ; byte
        resb    128                                     ; 0040

keybuf:                                                 ; yword
        resb    32                                      ; 00C0

mdec:                                                   ; oword
        resb    12                                      ; 00E0

?_174:  resd    1                                       ; 00EC

mx:     resd    1                                       ; 00F0

my:     resd    1                                       ; 00F4

buf_back: resd  2                                       ; 00F8

buf_mouse:                                              ; byte
        resb    256                                     ; 0100

xsize:  resd    1                                       ; 0200

ysize:  resd    1                                       ; 0204

timerctl: resd  1                                       ; 0208

timer1: resd    1                                       ; 020C

timer2: resd    1                                       ; 0210

timer3: resd    1                                       ; 0214

timerfifo1:                                             ; byte
        resb    24                                      ; 0218

timerfifo2:                                             ; byte
        resb    24                                      ; 0230

timerfifo3:                                             ; byte
        resb    24                                      ; 0248

timerbuf1:                                              ; qword
        resq    1                                       ; 0260

timerbuf2:                                              ; qword
        resq    1                                       ; 0268

timerbuf3:                                              ; qword
        resq    1                                       ; 0270

shtMsgBox:                                              ; dword
        resd    1                                       ; 0278

charData.1749:                                          ; word
        resb    1                                       ; 027C

?_175:  resb    3                                       ; 027D

count.1746:                                             ; dword
        resd    1                                       ; 0280

debug_x.1752:                                           ; dword
        resd    1                                       ; 0284

timerID.1748:                                           ; dword
        resd    1                                       ; 0288

str.1863:                                               ; byte
        resb    1                                       ; 028C

?_176:  resb    9                                       ; 028D

?_177:  resb    1                                       ; 0296


