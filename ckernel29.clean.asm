
CMain:  ; Function begin
        push    ebp                                     ; 0000 _ 55
        mov     ebp, esp                                ; 0001 _ 89. E5
        push    esi                                     ; 0003 _ 56
        push    ebx                                     ; 0004 _ 53
        sub     esp, 64                                 ; 0005 _ 83. EC, 40
        sub     esp, 12                                 ; 0008 _ 83. EC, 0C
        push    bootInfo                                ; 000B _ 68, 00000000(d)
        call    initBootInfo                            ; 0010 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0015 _ 83. C4, 10
        mov     eax, dword [bootInfo]                   ; 0018 _ A1, 00000000(d)
        mov     dword [ebp-28H], eax                    ; 001D _ 89. 45, D8
        movzx   eax, word [?_172]                       ; 0020 _ 0F B7. 05, 00000004(d)
        cwde                                            ; 0027 _ 98
        mov     dword [xsize], eax                      ; 0028 _ A3, 00000200(d)
        movzx   eax, word [?_173]                       ; 002D _ 0F B7. 05, 00000006(d)
        cwde                                            ; 0034 _ 98
        mov     dword [ysize], eax                      ; 0035 _ A3, 00000204(d)
        mov     eax, dword [bootInfo]                   ; 003A _ A1, 00000000(d)
        mov     dword [ebp-24H], eax                    ; 003F _ 89. 45, DC
        sub     esp, 4                                  ; 0042 _ 83. EC, 04
        push    mousebuf                                ; 0045 _ 68, 00000040(d)
        push    128                                     ; 004A _ 68, 00000080
        push    mouseinfo                               ; 004F _ 68, 00000008(d)
        call    fifo8_init                              ; 0054 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0059 _ 83. C4, 10
        sub     esp, 4                                  ; 005C _ 83. EC, 04
        push    keybuf                                  ; 005F _ 68, 000000C0(d)
        push    32                                      ; 0064 _ 6A, 20
        push    keyinfo                                 ; 0066 _ 68, 00000020(d)
        call    fifo8_init                              ; 006B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0070 _ 83. C4, 10
        call    init_palette                            ; 0073 _ E8, FFFFFFFC(rel)
        call    init_keyboard                           ; 0078 _ E8, FFFFFFFC(rel)
        call    get_memory_block_count                  ; 007D _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 0082 _ 89. 45, E0
        call    get_adr_buffer                          ; 0085 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 008A _ 89. 45, E4
        mov     eax, dword [memman]                     ; 008D _ A1, 00000008(d)
        sub     esp, 12                                 ; 0092 _ 83. EC, 0C
        push    eax                                     ; 0095 _ 50
        call    memman_init                             ; 0096 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 009B _ 83. C4, 10
        mov     eax, dword [memman]                     ; 009E _ A1, 00000008(d)
        sub     esp, 4                                  ; 00A3 _ 83. EC, 04
        push    534609920                               ; 00A6 _ 68, 1FDD8000
        push    1081344                                 ; 00AB _ 68, 00108000
        push    eax                                     ; 00B0 _ 50
        call    memman_free                             ; 00B1 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00B6 _ 83. C4, 10
        mov     ecx, dword [ysize]                      ; 00B9 _ 8B. 0D, 00000204(d)
        mov     edx, dword [xsize]                      ; 00BF _ 8B. 15, 00000200(d)
        mov     eax, dword [memman]                     ; 00C5 _ A1, 00000008(d)
        push    ecx                                     ; 00CA _ 51
        push    edx                                     ; 00CB _ 52
        push    dword [ebp-28H]                         ; 00CC _ FF. 75, D8
        push    eax                                     ; 00CF _ 50
        call    shtctl_init                             ; 00D0 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00D5 _ 83. C4, 10
        mov     dword [shtctl], eax                     ; 00D8 _ A3, 00000284(d)
        mov     eax, dword [shtctl]                     ; 00DD _ A1, 00000284(d)
        sub     esp, 12                                 ; 00E2 _ 83. EC, 0C
        push    eax                                     ; 00E5 _ 50
        call    sheet_alloc                             ; 00E6 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00EB _ 83. C4, 10
        mov     dword [sht_back], eax                   ; 00EE _ A3, 0000027C(d)
        mov     eax, dword [shtctl]                     ; 00F3 _ A1, 00000284(d)
        sub     esp, 12                                 ; 00F8 _ 83. EC, 0C
        push    eax                                     ; 00FB _ 50
        call    sheet_alloc                             ; 00FC _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0101 _ 83. C4, 10
        mov     dword [sht_mouse], eax                  ; 0104 _ A3, 00000280(d)
        mov     edx, dword [xsize]                      ; 0109 _ 8B. 15, 00000200(d)
        mov     eax, dword [ysize]                      ; 010F _ A1, 00000204(d)
        imul    eax, edx                                ; 0114 _ 0F AF. C2
        mov     edx, eax                                ; 0117 _ 89. C2
        mov     eax, dword [memman]                     ; 0119 _ A1, 00000008(d)
        sub     esp, 8                                  ; 011E _ 83. EC, 08
        push    edx                                     ; 0121 _ 52
        push    eax                                     ; 0122 _ 50
        call    memman_alloc_4k                         ; 0123 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0128 _ 83. C4, 10
        mov     dword [buf_back], eax                   ; 012B _ A3, 000000F8(d)
        mov     ebx, dword [ysize]                      ; 0130 _ 8B. 1D, 00000204(d)
        mov     ecx, dword [xsize]                      ; 0136 _ 8B. 0D, 00000200(d)
        mov     edx, dword [buf_back]                   ; 013C _ 8B. 15, 000000F8(d)
        mov     eax, dword [sht_back]                   ; 0142 _ A1, 0000027C(d)
        sub     esp, 12                                 ; 0147 _ 83. EC, 0C
        push    99                                      ; 014A _ 6A, 63
        push    ebx                                     ; 014C _ 53
        push    ecx                                     ; 014D _ 51
        push    edx                                     ; 014E _ 52
        push    eax                                     ; 014F _ 50
        call    sheet_setbuf                            ; 0150 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0155 _ 83. C4, 20
        mov     eax, dword [sht_mouse]                  ; 0158 _ A1, 00000280(d)
        sub     esp, 12                                 ; 015D _ 83. EC, 0C
        push    99                                      ; 0160 _ 6A, 63
        push    16                                      ; 0162 _ 6A, 10
        push    16                                      ; 0164 _ 6A, 10
        push    buf_mouse                               ; 0166 _ 68, 00000100(d)
        push    eax                                     ; 016B _ 50
        call    sheet_setbuf                            ; 016C _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0171 _ 83. C4, 20
        mov     ecx, dword [ysize]                      ; 0174 _ 8B. 0D, 00000204(d)
        mov     edx, dword [xsize]                      ; 017A _ 8B. 15, 00000200(d)
        mov     eax, dword [buf_back]                   ; 0180 _ A1, 000000F8(d)
        sub     esp, 4                                  ; 0185 _ 83. EC, 04
        push    ecx                                     ; 0188 _ 51
        push    edx                                     ; 0189 _ 52
        push    eax                                     ; 018A _ 50
        call    init_screen8                            ; 018B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0190 _ 83. C4, 10
        sub     esp, 8                                  ; 0193 _ 83. EC, 08
        push    99                                      ; 0196 _ 6A, 63
        push    buf_mouse                               ; 0198 _ 68, 00000100(d)
        call    init_mouse_cursor                       ; 019D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 01A2 _ 83. C4, 10
        mov     edx, dword [sht_back]                   ; 01A5 _ 8B. 15, 0000027C(d)
        mov     eax, dword [shtctl]                     ; 01AB _ A1, 00000284(d)
        push    0                                       ; 01B0 _ 6A, 00
        push    0                                       ; 01B2 _ 6A, 00
        push    edx                                     ; 01B4 _ 52
        push    eax                                     ; 01B5 _ 50
        call    sheet_slide                             ; 01B6 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 01BB _ 83. C4, 10
        mov     eax, dword [xsize]                      ; 01BE _ A1, 00000200(d)
        sub     eax, 16                                 ; 01C3 _ 83. E8, 10
        mov     edx, eax                                ; 01C6 _ 89. C2
        shr     edx, 31                                 ; 01C8 _ C1. EA, 1F
        add     eax, edx                                ; 01CB _ 01. D0
        sar     eax, 1                                  ; 01CD _ D1. F8
        mov     dword [mx], eax                         ; 01CF _ A3, 000000F0(d)
        mov     eax, dword [ysize]                      ; 01D4 _ A1, 00000204(d)
        sub     eax, 44                                 ; 01D9 _ 83. E8, 2C
        mov     edx, eax                                ; 01DC _ 89. C2
        shr     edx, 31                                 ; 01DE _ C1. EA, 1F
        add     eax, edx                                ; 01E1 _ 01. D0
        sar     eax, 1                                  ; 01E3 _ D1. F8
        mov     dword [my], eax                         ; 01E5 _ A3, 000000F4(d)
        mov     ebx, dword [my]                         ; 01EA _ 8B. 1D, 000000F4(d)
        mov     ecx, dword [mx]                         ; 01F0 _ 8B. 0D, 000000F0(d)
        mov     edx, dword [sht_mouse]                  ; 01F6 _ 8B. 15, 00000280(d)
        mov     eax, dword [shtctl]                     ; 01FC _ A1, 00000284(d)
        push    ebx                                     ; 0201 _ 53
        push    ecx                                     ; 0202 _ 51
        push    edx                                     ; 0203 _ 52
        push    eax                                     ; 0204 _ 50
        call    sheet_slide                             ; 0205 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 020A _ 83. C4, 10
        mov     eax, dword [shtctl]                     ; 020D _ A1, 00000284(d)
        sub     esp, 8                                  ; 0212 _ 83. EC, 08
        push    ?_160                                   ; 0215 _ 68, 00000000(d)
        push    eax                                     ; 021A _ 50
        call    message_box                             ; 021B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0220 _ 83. C4, 10
        mov     dword [shtMsgBox], eax                  ; 0223 _ A3, 00000278(d)
        mov     edx, dword [sht_back]                   ; 0228 _ 8B. 15, 0000027C(d)
        mov     eax, dword [shtctl]                     ; 022E _ A1, 00000284(d)
        sub     esp, 4                                  ; 0233 _ 83. EC, 04
        push    0                                       ; 0236 _ 6A, 00
        push    edx                                     ; 0238 _ 52
        push    eax                                     ; 0239 _ 50
        call    sheet_updown                            ; 023A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 023F _ 83. C4, 10
        mov     edx, dword [sht_mouse]                  ; 0242 _ 8B. 15, 00000280(d)
        mov     eax, dword [shtctl]                     ; 0248 _ A1, 00000284(d)
        sub     esp, 4                                  ; 024D _ 83. EC, 04
        push    100                                     ; 0250 _ 6A, 64
        push    edx                                     ; 0252 _ 52
        push    eax                                     ; 0253 _ 50
        call    sheet_updown                            ; 0254 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0259 _ 83. C4, 10
        mov     eax, dword [memman]                     ; 025C _ A1, 00000008(d)
        sub     esp, 12                                 ; 0261 _ 83. EC, 0C
        push    eax                                     ; 0264 _ 50
        call    init_pit                                ; 0265 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 026A _ 83. C4, 10
        mov     dword [timerctl], eax                   ; 026D _ A3, 00000208(d)
        sub     esp, 4                                  ; 0272 _ 83. EC, 04
        push    timerbuf1                               ; 0275 _ 68, 00000260(d)
        push    8                                       ; 027A _ 6A, 08
        push    timerfifo1                              ; 027C _ 68, 00000218(d)
        call    fifo8_init                              ; 0281 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0286 _ 83. C4, 10
        mov     eax, dword [timerctl]                   ; 0289 _ A1, 00000208(d)
        sub     esp, 12                                 ; 028E _ 83. EC, 0C
        push    eax                                     ; 0291 _ 50
        call    timer_alloc                             ; 0292 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0297 _ 83. C4, 10
        mov     dword [timer1], eax                     ; 029A _ A3, 0000020C(d)
        mov     eax, dword [timerctl]                   ; 029F _ A1, 00000208(d)
        sub     esp, 12                                 ; 02A4 _ 83. EC, 0C
        push    eax                                     ; 02A7 _ 50
        call    timer_alloc                             ; 02A8 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 02AD _ 83. C4, 10
        mov     dword [timer2], eax                     ; 02B0 _ A3, 00000210(d)
        mov     eax, dword [timerctl]                   ; 02B5 _ A1, 00000208(d)
        sub     esp, 12                                 ; 02BA _ 83. EC, 0C
        push    eax                                     ; 02BD _ 50
        call    timer_alloc                             ; 02BE _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 02C3 _ 83. C4, 10
        mov     dword [timer3], eax                     ; 02C6 _ A3, 00000214(d)
        mov     edx, dword [timer1]                     ; 02CB _ 8B. 15, 0000020C(d)
        mov     eax, dword [timerctl]                   ; 02D1 _ A1, 00000208(d)
        push    10                                      ; 02D6 _ 6A, 0A
        push    timerfifo1                              ; 02D8 _ 68, 00000218(d)
        push    edx                                     ; 02DD _ 52
        push    eax                                     ; 02DE _ 50
        call    timer_init                              ; 02DF _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 02E4 _ 83. C4, 10
        mov     edx, dword [timer2]                     ; 02E7 _ 8B. 15, 00000210(d)
        mov     eax, dword [timerctl]                   ; 02ED _ A1, 00000208(d)
        push    2                                       ; 02F2 _ 6A, 02
        push    timerfifo1                              ; 02F4 _ 68, 00000218(d)
        push    edx                                     ; 02F9 _ 52
        push    eax                                     ; 02FA _ 50
        call    timer_init                              ; 02FB _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0300 _ 83. C4, 10
        mov     edx, dword [timer3]                     ; 0303 _ 8B. 15, 00000214(d)
        mov     eax, dword [timerctl]                   ; 0309 _ A1, 00000208(d)
        push    1                                       ; 030E _ 6A, 01
        push    timerfifo1                              ; 0310 _ 68, 00000218(d)
        push    edx                                     ; 0315 _ 52
        push    eax                                     ; 0316 _ 50
        call    timer_init                              ; 0317 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 031C _ 83. C4, 10
        mov     edx, dword [timer1]                     ; 031F _ 8B. 15, 0000020C(d)
        mov     eax, dword [timerctl]                   ; 0325 _ A1, 00000208(d)
        sub     esp, 4                                  ; 032A _ 83. EC, 04
        push    500                                     ; 032D _ 68, 000001F4
        push    edx                                     ; 0332 _ 52
        push    eax                                     ; 0333 _ 50
        call    timer_settime                           ; 0334 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0339 _ 83. C4, 10
        mov     edx, dword [timer2]                     ; 033C _ 8B. 15, 00000210(d)
        mov     eax, dword [timerctl]                   ; 0342 _ A1, 00000208(d)
        sub     esp, 4                                  ; 0347 _ 83. EC, 04
        push    300                                     ; 034A _ 68, 0000012C
        push    edx                                     ; 034F _ 52
        push    eax                                     ; 0350 _ 50
        call    timer_settime                           ; 0351 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0356 _ 83. C4, 10
        mov     edx, dword [timer3]                     ; 0359 _ 8B. 15, 00000214(d)
        mov     eax, dword [timerctl]                   ; 035F _ A1, 00000208(d)
        sub     esp, 4                                  ; 0364 _ 83. EC, 04
        push    50                                      ; 0367 _ 6A, 32
        push    edx                                     ; 0369 _ 52
        push    eax                                     ; 036A _ 50
        call    timer_settime                           ; 036B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0370 _ 83. C4, 10
        call    io_sti                                  ; 0373 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 0378 _ 83. EC, 0C
        push    mdec                                    ; 037B _ 68, 000000E0(d)
        call    enable_mouse                            ; 0380 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0385 _ 83. C4, 10
        mov     dword [ebp-40H], 0                      ; 0388 _ C7. 45, C0, 00000000
        mov     dword [ebp-18H], 0                      ; 038F _ C7. 45, E8, 00000000
        mov     dword [ebp-3CH], 0                      ; 0396 _ C7. 45, C4, 00000000
        mov     dword [ebp-14H], 0                      ; 039D _ C7. 45, EC, 00000000
        mov     dword [ebp-10H], 0                      ; 03A4 _ C7. 45, F0, 00000000
        mov     byte [charData.1749], 0                 ; 03AB _ C6. 05, 00000288(d), 00
        mov     byte [?_175], 0                         ; 03B2 _ C6. 05, 00000289(d), 00
        mov     dword [ebp-38H], 8                      ; 03B9 _ C7. 45, C8, 00000008
        mov     dword [ebp-34H], 7                      ; 03C0 _ C7. 45, CC, 00000007
        mov     dword [ebp-30H], 0                      ; 03C7 _ C7. 45, D0, 00000000
        mov     dword [ebp-2CH], 300                    ; 03CE _ C7. 45, D4, 0000012C
?_001:  mov     eax, dword [timer1]                     ; 03D5 _ A1, 0000020C(d)
        mov     eax, dword [eax+4H]                     ; 03DA _ 8B. 40, 04
        sub     esp, 12                                 ; 03DD _ 83. EC, 0C
        push    eax                                     ; 03E0 _ 50
        call    intToHexStr                             ; 03E1 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03E6 _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 03E9 _ 89. 45, F4
        call    io_cli                                  ; 03EC _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 03F1 _ 83. EC, 0C
        push    keyinfo                                 ; 03F4 _ 68, 00000020(d)
        call    fifo8_status                            ; 03F9 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03FE _ 83. C4, 10
        mov     ebx, eax                                ; 0401 _ 89. C3
        sub     esp, 12                                 ; 0403 _ 83. EC, 0C
        push    mouseinfo                               ; 0406 _ 68, 00000008(d)
        call    fifo8_status                            ; 040B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0410 _ 83. C4, 10
        add     ebx, eax                                ; 0413 _ 01. C3
        sub     esp, 12                                 ; 0415 _ 83. EC, 0C
        push    timerfifo1                              ; 0418 _ 68, 00000218(d)
        call    fifo8_status                            ; 041D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0422 _ 83. C4, 10
        add     eax, ebx                                ; 0425 _ 01. D8
        test    eax, eax                                ; 0427 _ 85. C0
        jnz     ?_002                                   ; 0429 _ 75, 07
        call    io_sti                                  ; 042B _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 0430 _ EB, A3
; CMain End of function

?_002:  ; Local function
        sub     esp, 12                                 ; 0432 _ 83. EC, 0C
        push    keyinfo                                 ; 0435 _ 68, 00000020(d)
        call    fifo8_status                            ; 043A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 043F _ 83. C4, 10
        test    eax, eax                                ; 0442 _ 85. C0
        je      ?_006                                   ; 0444 _ 0F 84, 000001EC
        call    io_sti                                  ; 044A _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-40H]                    ; 044F _ 8B. 45, C0
        mov     dword [ebp-18H], eax                    ; 0452 _ 89. 45, E8
        sub     esp, 12                                 ; 0455 _ 83. EC, 0C
        push    keyinfo                                 ; 0458 _ 68, 00000020(d)
        call    fifo8_get                               ; 045D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0462 _ 83. C4, 10
        mov     dword [ebp-40H], eax                    ; 0465 _ 89. 45, C0
        cmp     dword [ebp-40H], 28                     ; 0468 _ 83. 7D, C0, 1C
        jnz     ?_003                                   ; 046C _ 75, 5D
        mov     ebx, dword [xsize]                      ; 046E _ 8B. 1D, 00000200(d)
        mov     ecx, dword [buf_back]                   ; 0474 _ 8B. 0D, 000000F8(d)
        mov     edx, dword [ebp-3CH]                    ; 047A _ 8B. 55, C4
        mov     eax, edx                                ; 047D _ 89. D0
        shl     eax, 2                                  ; 047F _ C1. E0, 02
        add     eax, edx                                ; 0482 _ 01. D0
        shl     eax, 2                                  ; 0484 _ C1. E0, 02
        mov     edx, eax                                ; 0487 _ 89. C2
        mov     eax, dword [ebp-1CH]                    ; 0489 _ 8B. 45, E4
        lea     esi, [edx+eax]                          ; 048C _ 8D. 34 02
        mov     edx, dword [sht_back]                   ; 048F _ 8B. 15, 0000027C(d)
        mov     eax, dword [shtctl]                     ; 0495 _ A1, 00000284(d)
        sub     esp, 4                                  ; 049A _ 83. EC, 04
        push    7                                       ; 049D _ 6A, 07
        push    ebx                                     ; 049F _ 53
        push    dword [ebp-3CH]                         ; 04A0 _ FF. 75, C4
        push    ecx                                     ; 04A3 _ 51
        push    esi                                     ; 04A4 _ 56
        push    edx                                     ; 04A5 _ 52
        push    eax                                     ; 04A6 _ 50
        call    showMemoryInfo                          ; 04A7 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 04AC _ 83. C4, 20
        add     dword [ebp-3CH], 1                      ; 04AF _ 83. 45, C4, 01
        mov     eax, dword [ebp-3CH]                    ; 04B3 _ 8B. 45, C4
        cmp     eax, dword [ebp-20H]                    ; 04B6 _ 3B. 45, E0
        jle     ?_005                                   ; 04B9 _ 0F 8E, 0000011A
        mov     dword [ebp-3CH], 0                      ; 04BF _ C7. 45, C4, 00000000
        jmp     ?_005                                   ; 04C6 _ E9, 0000010E

?_003:  mov     eax, dword [ebp-40H]                    ; 04CB _ 8B. 45, C0
        add     eax, keytable                           ; 04CE _ 05, 00000020(d)
        movzx   eax, byte [eax]                         ; 04D3 _ 0F B6. 00
        test    al, al                                  ; 04D6 _ 84. C0
        je      ?_005                                   ; 04D8 _ 0F 84, 000000FB
        cmp     dword [ebp-40H], 127                    ; 04DE _ 83. 7D, C0, 7F
        jg      ?_005                                   ; 04E2 _ 0F 8F, 000000F1
        mov     eax, dword [ebp-38H]                    ; 04E8 _ 8B. 45, C8
        lea     ecx, [eax+7H]                           ; 04EB _ 8D. 48, 07
        mov     eax, dword [shtMsgBox]                  ; 04EE _ A1, 00000278(d)
        mov     edx, dword [eax+4H]                     ; 04F3 _ 8B. 50, 04
        mov     eax, dword [shtMsgBox]                  ; 04F6 _ A1, 00000278(d)
        mov     eax, dword [eax]                        ; 04FB _ 8B. 00
        sub     esp, 4                                  ; 04FD _ 83. EC, 04
        push    43                                      ; 0500 _ 6A, 2B
        push    ecx                                     ; 0502 _ 51
        push    28                                      ; 0503 _ 6A, 1C
        push    dword [ebp-38H]                         ; 0505 _ FF. 75, C8
        push    7                                       ; 0508 _ 6A, 07
        push    edx                                     ; 050A _ 52
        push    eax                                     ; 050B _ 50
        call    boxfill8                                ; 050C _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0511 _ 83. C4, 20
        mov     eax, dword [ebp-38H]                    ; 0514 _ 8B. 45, C8
        lea     ecx, [eax+8H]                           ; 0517 _ 8D. 48, 08
        mov     edx, dword [shtMsgBox]                  ; 051A _ 8B. 15, 00000278(d)
        mov     eax, dword [shtctl]                     ; 0520 _ A1, 00000284(d)
        sub     esp, 8                                  ; 0525 _ 83. EC, 08
        push    44                                      ; 0528 _ 6A, 2C
        push    ecx                                     ; 052A _ 51
        push    27                                      ; 052B _ 6A, 1B
        push    dword [ebp-38H]                         ; 052D _ FF. 75, C8
        push    edx                                     ; 0530 _ 52
        push    eax                                     ; 0531 _ 50
        call    sheet_refresh                           ; 0532 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0537 _ 83. C4, 20
        mov     eax, dword [ebp-40H]                    ; 053A _ 8B. 45, C0
        add     eax, keytable                           ; 053D _ 05, 00000020(d)
        movzx   eax, byte [eax]                         ; 0542 _ 0F B6. 00
        mov     byte [charData.1749], al                ; 0545 _ A2, 00000288(d)
        mov     edx, dword [shtMsgBox]                  ; 054A _ 8B. 15, 00000278(d)
        mov     eax, dword [shtctl]                     ; 0550 _ A1, 00000284(d)
        sub     esp, 8                                  ; 0555 _ 83. EC, 08
        push    charData.1749                           ; 0558 _ 68, 00000288(d)
        push    0                                       ; 055D _ 6A, 00
        push    28                                      ; 055F _ 6A, 1C
        push    dword [ebp-38H]                         ; 0561 _ FF. 75, C8
        push    edx                                     ; 0564 _ 52
        push    eax                                     ; 0565 _ 50
        call    showString                              ; 0566 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 056B _ 83. C4, 20
        add     dword [ebp-38H], 8                      ; 056E _ 83. 45, C8, 08
        cmp     dword [ebp-38H], 143                    ; 0572 _ 81. 7D, C8, 0000008F
        jle     ?_004                                   ; 0579 _ 7E, 07
        mov     dword [ebp-38H], 8                      ; 057B _ C7. 45, C8, 00000008
?_004:  mov     eax, dword [ebp-38H]                    ; 0582 _ 8B. 45, C8
        lea     ebx, [eax+7H]                           ; 0585 _ 8D. 58, 07
        mov     eax, dword [ebp-34H]                    ; 0588 _ 8B. 45, CC
        movzx   ecx, al                                 ; 058B _ 0F B6. C8
        mov     eax, dword [shtMsgBox]                  ; 058E _ A1, 00000278(d)
        mov     edx, dword [eax+4H]                     ; 0593 _ 8B. 50, 04
        mov     eax, dword [shtMsgBox]                  ; 0596 _ A1, 00000278(d)
        mov     eax, dword [eax]                        ; 059B _ 8B. 00
        sub     esp, 4                                  ; 059D _ 83. EC, 04
        push    43                                      ; 05A0 _ 6A, 2B
        push    ebx                                     ; 05A2 _ 53
        push    28                                      ; 05A3 _ 6A, 1C
        push    dword [ebp-38H]                         ; 05A5 _ FF. 75, C8
        push    ecx                                     ; 05A8 _ 51
        push    edx                                     ; 05A9 _ 52
        push    eax                                     ; 05AA _ 50
        call    boxfill8                                ; 05AB _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 05B0 _ 83. C4, 20
        mov     eax, dword [ebp-38H]                    ; 05B3 _ 8B. 45, C8
        lea     ecx, [eax+8H]                           ; 05B6 _ 8D. 48, 08
        mov     edx, dword [shtMsgBox]                  ; 05B9 _ 8B. 15, 00000278(d)
        mov     eax, dword [shtctl]                     ; 05BF _ A1, 00000284(d)
        sub     esp, 8                                  ; 05C4 _ 83. EC, 08
        push    44                                      ; 05C7 _ 6A, 2C
        push    ecx                                     ; 05C9 _ 51
        push    28                                      ; 05CA _ 6A, 1C
        push    dword [ebp-38H]                         ; 05CC _ FF. 75, C8
        push    edx                                     ; 05CF _ 52
        push    eax                                     ; 05D0 _ 50
        call    sheet_refresh                           ; 05D1 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 05D6 _ 83. C4, 20
?_005:  mov     eax, dword [ebp-40H]                    ; 05D9 _ 8B. 45, C0
        sub     esp, 12                                 ; 05DC _ 83. EC, 0C
        push    eax                                     ; 05DF _ 50
        call    intToHexStr                             ; 05E0 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 05E5 _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 05E8 _ 89. 45, F4
        mov     edx, dword [sht_back]                   ; 05EB _ 8B. 15, 0000027C(d)
        mov     eax, dword [shtctl]                     ; 05F1 _ A1, 00000284(d)
        sub     esp, 8                                  ; 05F6 _ 83. EC, 08
        push    dword [ebp-0CH]                         ; 05F9 _ FF. 75, F4
        push    0                                       ; 05FC _ 6A, 00
        push    dword [ebp-2CH]                         ; 05FE _ FF. 75, D4
        push    dword [ebp-30H]                         ; 0601 _ FF. 75, D0
        push    edx                                     ; 0604 _ 52
        push    eax                                     ; 0605 _ 50
        call    showString                              ; 0606 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 060B _ 83. C4, 20
        add     dword [ebp-30H], 96                     ; 060E _ 83. 45, D0, 60
        mov     eax, dword [sht_back]                   ; 0612 _ A1, 0000027C(d)
        mov     eax, dword [eax+4H]                     ; 0617 _ 8B. 40, 04
        sub     eax, 96                                 ; 061A _ 83. E8, 60
        cmp     dword [ebp-30H], eax                    ; 061D _ 39. 45, D0
        jl      ?_001                                   ; 0620 _ 0F 8C, FFFFFDAF
        mov     dword [ebp-30H], 0                      ; 0626 _ C7. 45, D0, 00000000
        add     dword [ebp-2CH], 16                     ; 062D _ 83. 45, D4, 10
        jmp     ?_001                                   ; 0631 _ E9, FFFFFD9F

?_006:  ; Local function
        sub     esp, 12                                 ; 0636 _ 83. EC, 0C
        push    mouseinfo                               ; 0639 _ 68, 00000008(d)
        call    fifo8_status                            ; 063E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0643 _ 83. C4, 10
        test    eax, eax                                ; 0646 _ 85. C0
        jz      ?_007                                   ; 0648 _ 74, 24
        mov     ecx, dword [sht_mouse]                  ; 064A _ 8B. 0D, 00000280(d)
        mov     edx, dword [sht_back]                   ; 0650 _ 8B. 15, 0000027C(d)
        mov     eax, dword [shtctl]                     ; 0656 _ A1, 00000284(d)
        sub     esp, 4                                  ; 065B _ 83. EC, 04
        push    ecx                                     ; 065E _ 51
        push    edx                                     ; 065F _ 52
        push    eax                                     ; 0660 _ 50
        call    show_mouse_info                         ; 0661 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0666 _ 83. C4, 10
        jmp     ?_001                                   ; 0669 _ E9, FFFFFD67

?_007:  ; Local function
        sub     esp, 12                                 ; 066E _ 83. EC, 0C
        push    timerfifo1                              ; 0671 _ 68, 00000218(d)
        call    fifo8_status                            ; 0676 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 067B _ 83. C4, 10
        test    eax, eax                                ; 067E _ 85. C0
        je      ?_001                                   ; 0680 _ 0F 84, FFFFFD4F
        call    io_sti                                  ; 0686 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 068B _ 83. EC, 0C
        push    timerfifo1                              ; 068E _ 68, 00000218(d)
        call    fifo8_get                               ; 0693 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0698 _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 069B _ 89. 45, F0
        cmp     dword [ebp-10H], 10                     ; 069E _ 83. 7D, F0, 0A
        jnz     ?_008                                   ; 06A2 _ 75, 25
        mov     edx, dword [sht_back]                   ; 06A4 _ 8B. 15, 0000027C(d)
        mov     eax, dword [shtctl]                     ; 06AA _ A1, 00000284(d)
        sub     esp, 8                                  ; 06AF _ 83. EC, 08
        push    ?_161                                   ; 06B2 _ 68, 00000009(d)
        push    7                                       ; 06B7 _ 6A, 07
        push    32                                      ; 06B9 _ 6A, 20
        push    0                                       ; 06BB _ 6A, 00
        push    edx                                     ; 06BD _ 52
        push    eax                                     ; 06BE _ 50
        call    showString                              ; 06BF _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 06C4 _ 83. C4, 20
        jmp     ?_011                                   ; 06C7 _ EB, 75

?_008:  cmp     dword [ebp-10H], 2                      ; 06C9 _ 83. 7D, F0, 02
        jnz     ?_009                                   ; 06CD _ 75, 25
        mov     edx, dword [sht_back]                   ; 06CF _ 8B. 15, 0000027C(d)
        mov     eax, dword [shtctl]                     ; 06D5 _ A1, 00000284(d)
        sub     esp, 8                                  ; 06DA _ 83. EC, 08
        push    ?_162                                   ; 06DD _ 68, 00000014(d)
        push    7                                       ; 06E2 _ 6A, 07
        push    16                                      ; 06E4 _ 6A, 10
        push    0                                       ; 06E6 _ 6A, 00
        push    edx                                     ; 06E8 _ 52
        push    eax                                     ; 06E9 _ 50
        call    showString                              ; 06EA _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 06EF _ 83. C4, 20
        jmp     ?_011                                   ; 06F2 _ EB, 4A

?_009:  cmp     dword [ebp-10H], 1                      ; 06F4 _ 83. 7D, F0, 01
        jnz     ?_010                                   ; 06F8 _ 75, 23
        mov     edx, dword [timer3]                     ; 06FA _ 8B. 15, 00000214(d)
        mov     eax, dword [timerctl]                   ; 0700 _ A1, 00000208(d)
        sub     esp, 4                                  ; 0705 _ 83. EC, 04
        push    0                                       ; 0708 _ 6A, 00
        push    edx                                     ; 070A _ 52
        push    eax                                     ; 070B _ 50
        call    timer_setdata                           ; 070C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0711 _ 83. C4, 10
        mov     dword [ebp-34H], 0                      ; 0714 _ C7. 45, CC, 00000000
        jmp     ?_011                                   ; 071B _ EB, 21

?_010:  mov     edx, dword [timer3]                     ; 071D _ 8B. 15, 00000214(d)
        mov     eax, dword [timerctl]                   ; 0723 _ A1, 00000208(d)
        sub     esp, 4                                  ; 0728 _ 83. EC, 04
        push    1                                       ; 072B _ 6A, 01
        push    edx                                     ; 072D _ 52
        push    eax                                     ; 072E _ 50
        call    timer_setdata                           ; 072F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0734 _ 83. C4, 10
        mov     dword [ebp-34H], 7                      ; 0737 _ C7. 45, CC, 00000007
?_011:  cmp     dword [ebp-10H], 1                      ; 073E _ 83. 7D, F0, 01
        jz      ?_012                                   ; 0742 _ 74, 0A
        cmp     dword [ebp-10H], 0                      ; 0744 _ 83. 7D, F0, 00
        jne     ?_001                                   ; 0748 _ 0F 85, FFFFFC87
?_012:  mov     edx, dword [timer3]                     ; 074E _ 8B. 15, 00000214(d)
        mov     eax, dword [timerctl]                   ; 0754 _ A1, 00000208(d)
        sub     esp, 4                                  ; 0759 _ 83. EC, 04
        push    50                                      ; 075C _ 6A, 32
        push    edx                                     ; 075E _ 52
        push    eax                                     ; 075F _ 50
        call    timer_settime                           ; 0760 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0765 _ 83. C4, 10
        mov     eax, dword [ebp-38H]                    ; 0768 _ 8B. 45, C8
        lea     ebx, [eax+7H]                           ; 076B _ 8D. 58, 07
        mov     eax, dword [ebp-34H]                    ; 076E _ 8B. 45, CC
        movzx   ecx, al                                 ; 0771 _ 0F B6. C8
        mov     eax, dword [shtMsgBox]                  ; 0774 _ A1, 00000278(d)
        mov     edx, dword [eax+4H]                     ; 0779 _ 8B. 50, 04
        mov     eax, dword [shtMsgBox]                  ; 077C _ A1, 00000278(d)
        mov     eax, dword [eax]                        ; 0781 _ 8B. 00
        sub     esp, 4                                  ; 0783 _ 83. EC, 04
        push    43                                      ; 0786 _ 6A, 2B
        push    ebx                                     ; 0788 _ 53
        push    28                                      ; 0789 _ 6A, 1C
        push    dword [ebp-38H]                         ; 078B _ FF. 75, C8
        push    ecx                                     ; 078E _ 51
        push    edx                                     ; 078F _ 52
        push    eax                                     ; 0790 _ 50
        call    boxfill8                                ; 0791 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0796 _ 83. C4, 20
        mov     eax, dword [ebp-38H]                    ; 0799 _ 8B. 45, C8
        lea     ecx, [eax+8H]                           ; 079C _ 8D. 48, 08
        mov     edx, dword [shtMsgBox]                  ; 079F _ 8B. 15, 00000278(d)
        mov     eax, dword [shtctl]                     ; 07A5 _ A1, 00000284(d)
        sub     esp, 8                                  ; 07AA _ 83. EC, 08
        push    44                                      ; 07AD _ 6A, 2C
        push    ecx                                     ; 07AF _ 51
        push    28                                      ; 07B0 _ 6A, 1C
        push    dword [ebp-38H]                         ; 07B2 _ FF. 75, C8
        push    edx                                     ; 07B5 _ 52
        push    eax                                     ; 07B6 _ 50
        call    sheet_refresh                           ; 07B7 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 07BC _ 83. C4, 20
        jmp     ?_001                                   ; 07BF _ E9, FFFFFC11

initBootInfo:; Function begin
        push    ebp                                     ; 07C4 _ 55
        mov     ebp, esp                                ; 07C5 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 07C7 _ 8B. 45, 08
        mov     dword [eax], -402653184                 ; 07CA _ C7. 00, E8000000
        mov     eax, dword [ebp+8H]                     ; 07D0 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 1280                     ; 07D3 _ 66: C7. 40, 04, 0500
        mov     eax, dword [ebp+8H]                     ; 07D9 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 1024                     ; 07DC _ 66: C7. 40, 06, 0400
        nop                                             ; 07E2 _ 90
        pop     ebp                                     ; 07E3 _ 5D
        ret                                             ; 07E4 _ C3
; initBootInfo End of function

init_palette:; Function begin
        push    ebp                                     ; 07E5 _ 55
        mov     ebp, esp                                ; 07E6 _ 89. E5
        sub     esp, 8                                  ; 07E8 _ 83. EC, 08
        sub     esp, 4                                  ; 07EB _ 83. EC, 04
        push    table_rgb.1762                          ; 07EE _ 68, 00000080(d)
        push    15                                      ; 07F3 _ 6A, 0F
        push    0                                       ; 07F5 _ 6A, 00
        call    set_palette                             ; 07F7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 07FC _ 83. C4, 10
        nop                                             ; 07FF _ 90
        leave                                           ; 0800 _ C9
        ret                                             ; 0801 _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 0802 _ 55
        mov     ebp, esp                                ; 0803 _ 89. E5
        sub     esp, 24                                 ; 0805 _ 83. EC, 18
        call    io_load_eflags                          ; 0808 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 080D _ 89. 45, F4
        call    io_cli                                  ; 0810 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0815 _ 83. EC, 08
        push    dword [ebp+8H]                          ; 0818 _ FF. 75, 08
        push    968                                     ; 081B _ 68, 000003C8
        call    io_out8                                 ; 0820 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0825 _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 0828 _ 8B. 45, 08
        mov     dword [ebp-10H], eax                    ; 082B _ 89. 45, F0
        jmp     ?_014                                   ; 082E _ EB, 65

?_013:  mov     eax, dword [ebp+10H]                    ; 0830 _ 8B. 45, 10
        movzx   eax, byte [eax]                         ; 0833 _ 0F B6. 00
        shr     al, 2                                   ; 0836 _ C0. E8, 02
        movzx   eax, al                                 ; 0839 _ 0F B6. C0
        sub     esp, 8                                  ; 083C _ 83. EC, 08
        push    eax                                     ; 083F _ 50
        push    969                                     ; 0840 _ 68, 000003C9
        call    io_out8                                 ; 0845 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 084A _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 084D _ 8B. 45, 10
        add     eax, 1                                  ; 0850 _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 0853 _ 0F B6. 00
        shr     al, 2                                   ; 0856 _ C0. E8, 02
        movzx   eax, al                                 ; 0859 _ 0F B6. C0
        sub     esp, 8                                  ; 085C _ 83. EC, 08
        push    eax                                     ; 085F _ 50
        push    969                                     ; 0860 _ 68, 000003C9
        call    io_out8                                 ; 0865 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 086A _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 086D _ 8B. 45, 10
        add     eax, 2                                  ; 0870 _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 0873 _ 0F B6. 00
        shr     al, 2                                   ; 0876 _ C0. E8, 02
        movzx   eax, al                                 ; 0879 _ 0F B6. C0
        sub     esp, 8                                  ; 087C _ 83. EC, 08
        push    eax                                     ; 087F _ 50
        push    969                                     ; 0880 _ 68, 000003C9
        call    io_out8                                 ; 0885 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 088A _ 83. C4, 10
        add     dword [ebp+10H], 3                      ; 088D _ 83. 45, 10, 03
        add     dword [ebp-10H], 1                      ; 0891 _ 83. 45, F0, 01
?_014:  mov     eax, dword [ebp-10H]                    ; 0895 _ 8B. 45, F0
        cmp     eax, dword [ebp+0CH]                    ; 0898 _ 3B. 45, 0C
        jle     ?_013                                   ; 089B _ 7E, 93
        sub     esp, 12                                 ; 089D _ 83. EC, 0C
        push    dword [ebp-0CH]                         ; 08A0 _ FF. 75, F4
        call    io_store_eflags                         ; 08A3 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 08A8 _ 83. C4, 10
        nop                                             ; 08AB _ 90
        leave                                           ; 08AC _ C9
        ret                                             ; 08AD _ C3
; set_palette End of function

boxfill8:; Function begin
        push    ebp                                     ; 08AE _ 55
        mov     ebp, esp                                ; 08AF _ 89. E5
        sub     esp, 20                                 ; 08B1 _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 08B4 _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 08B7 _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 08BA _ 8B. 45, 18
        mov     dword [ebp-4H], eax                     ; 08BD _ 89. 45, FC
        jmp     ?_018                                   ; 08C0 _ EB, 33

?_015:  mov     eax, dword [ebp+14H]                    ; 08C2 _ 8B. 45, 14
        mov     dword [ebp-8H], eax                     ; 08C5 _ 89. 45, F8
        jmp     ?_017                                   ; 08C8 _ EB, 1F

?_016:  mov     eax, dword [ebp-4H]                     ; 08CA _ 8B. 45, FC
        imul    eax, dword [ebp+0CH]                    ; 08CD _ 0F AF. 45, 0C
        mov     edx, eax                                ; 08D1 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 08D3 _ 8B. 45, F8
        add     eax, edx                                ; 08D6 _ 01. D0
        mov     edx, eax                                ; 08D8 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 08DA _ 8B. 45, 08
        add     edx, eax                                ; 08DD _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 08DF _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 08E3 _ 88. 02
        add     dword [ebp-8H], 1                       ; 08E5 _ 83. 45, F8, 01
?_017:  mov     eax, dword [ebp-8H]                     ; 08E9 _ 8B. 45, F8
        cmp     eax, dword [ebp+1CH]                    ; 08EC _ 3B. 45, 1C
        jle     ?_016                                   ; 08EF _ 7E, D9
        add     dword [ebp-4H], 1                       ; 08F1 _ 83. 45, FC, 01
?_018:  mov     eax, dword [ebp-4H]                     ; 08F5 _ 8B. 45, FC
        cmp     eax, dword [ebp+20H]                    ; 08F8 _ 3B. 45, 20
        jle     ?_015                                   ; 08FB _ 7E, C5
        nop                                             ; 08FD _ 90
        leave                                           ; 08FE _ C9
        ret                                             ; 08FF _ C3
; boxfill8 End of function

showString:; Function begin
        push    ebp                                     ; 0900 _ 55
        mov     ebp, esp                                ; 0901 _ 89. E5
        push    ebx                                     ; 0903 _ 53
        sub     esp, 36                                 ; 0904 _ 83. EC, 24
        mov     eax, dword [ebp+18H]                    ; 0907 _ 8B. 45, 18
        mov     byte [ebp-1CH], al                      ; 090A _ 88. 45, E4
        mov     eax, dword [ebp+10H]                    ; 090D _ 8B. 45, 10
        mov     dword [ebp-0CH], eax                    ; 0910 _ 89. 45, F4
        jmp     ?_020                                   ; 0913 _ EB, 3E

?_019:  mov     eax, dword [ebp+1CH]                    ; 0915 _ 8B. 45, 1C
        movzx   eax, byte [eax]                         ; 0918 _ 0F B6. 00
        movzx   eax, al                                 ; 091B _ 0F B6. C0
        shl     eax, 4                                  ; 091E _ C1. E0, 04
        lea     ebx, [systemFont+eax]                   ; 0921 _ 8D. 98, 00000000(d)
        movsx   ecx, byte [ebp-1CH]                     ; 0927 _ 0F BE. 4D, E4
        mov     eax, dword [ebp+0CH]                    ; 092B _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 092E _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 0931 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 0934 _ 8B. 00
        sub     esp, 8                                  ; 0936 _ 83. EC, 08
        push    ebx                                     ; 0939 _ 53
        push    ecx                                     ; 093A _ 51
        push    dword [ebp+14H]                         ; 093B _ FF. 75, 14
        push    dword [ebp+10H]                         ; 093E _ FF. 75, 10
        push    edx                                     ; 0941 _ 52
        push    eax                                     ; 0942 _ 50
        call    showChar8                               ; 0943 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0948 _ 83. C4, 20
        add     dword [ebp+1CH], 1                      ; 094B _ 83. 45, 1C, 01
        add     dword [ebp+10H], 8                      ; 094F _ 83. 45, 10, 08
?_020:  mov     eax, dword [ebp+1CH]                    ; 0953 _ 8B. 45, 1C
        movzx   eax, byte [eax]                         ; 0956 _ 0F B6. 00
        test    al, al                                  ; 0959 _ 84. C0
        jnz     ?_019                                   ; 095B _ 75, B8
        mov     eax, dword [ebp+14H]                    ; 095D _ 8B. 45, 14
        add     eax, 16                                 ; 0960 _ 83. C0, 10
        sub     esp, 8                                  ; 0963 _ 83. EC, 08
        push    eax                                     ; 0966 _ 50
        push    dword [ebp+10H]                         ; 0967 _ FF. 75, 10
        push    dword [ebp+14H]                         ; 096A _ FF. 75, 14
        push    dword [ebp-0CH]                         ; 096D _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 0970 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0973 _ FF. 75, 08
        call    sheet_refresh                           ; 0976 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 097B _ 83. C4, 20
        nop                                             ; 097E _ 90
        mov     ebx, dword [ebp-4H]                     ; 097F _ 8B. 5D, FC
        leave                                           ; 0982 _ C9
        ret                                             ; 0983 _ C3
; showString End of function

showChar8:; Function begin
        push    ebp                                     ; 0984 _ 55
        mov     ebp, esp                                ; 0985 _ 89. E5
        sub     esp, 20                                 ; 0987 _ 83. EC, 14
        mov     eax, dword [ebp+18H]                    ; 098A _ 8B. 45, 18
        mov     byte [ebp-14H], al                      ; 098D _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 0990 _ C7. 45, FC, 00000000
        jmp     ?_030                                   ; 0997 _ E9, 0000016C

?_021:  mov     edx, dword [ebp-4H]                     ; 099C _ 8B. 55, FC
        mov     eax, dword [ebp+1CH]                    ; 099F _ 8B. 45, 1C
        add     eax, edx                                ; 09A2 _ 01. D0
        movzx   eax, byte [eax]                         ; 09A4 _ 0F B6. 00
        mov     byte [ebp-5H], al                       ; 09A7 _ 88. 45, FB
        cmp     byte [ebp-5H], 0                        ; 09AA _ 80. 7D, FB, 00
        jns     ?_022                                   ; 09AE _ 79, 20
        mov     edx, dword [ebp+14H]                    ; 09B0 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 09B3 _ 8B. 45, FC
        add     eax, edx                                ; 09B6 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 09B8 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 09BC _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 09BE _ 8B. 45, 10
        add     eax, edx                                ; 09C1 _ 01. D0
        mov     edx, eax                                ; 09C3 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 09C5 _ 8B. 45, 08
        add     edx, eax                                ; 09C8 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 09CA _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 09CE _ 88. 02
?_022:  movsx   eax, byte [ebp-5H]                      ; 09D0 _ 0F BE. 45, FB
        and     eax, 40H                                ; 09D4 _ 83. E0, 40
        test    eax, eax                                ; 09D7 _ 85. C0
        jz      ?_023                                   ; 09D9 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 09DB _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 09DE _ 8B. 45, FC
        add     eax, edx                                ; 09E1 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 09E3 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 09E7 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 09E9 _ 8B. 45, 10
        add     eax, edx                                ; 09EC _ 01. D0
        lea     edx, [eax+1H]                           ; 09EE _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 09F1 _ 8B. 45, 08
        add     edx, eax                                ; 09F4 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 09F6 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 09FA _ 88. 02
?_023:  movsx   eax, byte [ebp-5H]                      ; 09FC _ 0F BE. 45, FB
        and     eax, 20H                                ; 0A00 _ 83. E0, 20
        test    eax, eax                                ; 0A03 _ 85. C0
        jz      ?_024                                   ; 0A05 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 0A07 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0A0A _ 8B. 45, FC
        add     eax, edx                                ; 0A0D _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0A0F _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0A13 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0A15 _ 8B. 45, 10
        add     eax, edx                                ; 0A18 _ 01. D0
        lea     edx, [eax+2H]                           ; 0A1A _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 0A1D _ 8B. 45, 08
        add     edx, eax                                ; 0A20 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0A22 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0A26 _ 88. 02
?_024:  movsx   eax, byte [ebp-5H]                      ; 0A28 _ 0F BE. 45, FB
        and     eax, 10H                                ; 0A2C _ 83. E0, 10
        test    eax, eax                                ; 0A2F _ 85. C0
        jz      ?_025                                   ; 0A31 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 0A33 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0A36 _ 8B. 45, FC
        add     eax, edx                                ; 0A39 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0A3B _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0A3F _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0A41 _ 8B. 45, 10
        add     eax, edx                                ; 0A44 _ 01. D0
        lea     edx, [eax+3H]                           ; 0A46 _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 0A49 _ 8B. 45, 08
        add     edx, eax                                ; 0A4C _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0A4E _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0A52 _ 88. 02
?_025:  movsx   eax, byte [ebp-5H]                      ; 0A54 _ 0F BE. 45, FB
        and     eax, 08H                                ; 0A58 _ 83. E0, 08
        test    eax, eax                                ; 0A5B _ 85. C0
        jz      ?_026                                   ; 0A5D _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 0A5F _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0A62 _ 8B. 45, FC
        add     eax, edx                                ; 0A65 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0A67 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0A6B _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0A6D _ 8B. 45, 10
        add     eax, edx                                ; 0A70 _ 01. D0
        lea     edx, [eax+4H]                           ; 0A72 _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0A75 _ 8B. 45, 08
        add     edx, eax                                ; 0A78 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0A7A _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0A7E _ 88. 02
?_026:  movsx   eax, byte [ebp-5H]                      ; 0A80 _ 0F BE. 45, FB
        and     eax, 04H                                ; 0A84 _ 83. E0, 04
        test    eax, eax                                ; 0A87 _ 85. C0
        jz      ?_027                                   ; 0A89 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 0A8B _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0A8E _ 8B. 45, FC
        add     eax, edx                                ; 0A91 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0A93 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0A97 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0A99 _ 8B. 45, 10
        add     eax, edx                                ; 0A9C _ 01. D0
        lea     edx, [eax+5H]                           ; 0A9E _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 0AA1 _ 8B. 45, 08
        add     edx, eax                                ; 0AA4 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0AA6 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0AAA _ 88. 02
?_027:  movsx   eax, byte [ebp-5H]                      ; 0AAC _ 0F BE. 45, FB
        and     eax, 02H                                ; 0AB0 _ 83. E0, 02
        test    eax, eax                                ; 0AB3 _ 85. C0
        jz      ?_028                                   ; 0AB5 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 0AB7 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0ABA _ 8B. 45, FC
        add     eax, edx                                ; 0ABD _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0ABF _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0AC3 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0AC5 _ 8B. 45, 10
        add     eax, edx                                ; 0AC8 _ 01. D0
        lea     edx, [eax+6H]                           ; 0ACA _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 0ACD _ 8B. 45, 08
        add     edx, eax                                ; 0AD0 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0AD2 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0AD6 _ 88. 02
?_028:  movsx   eax, byte [ebp-5H]                      ; 0AD8 _ 0F BE. 45, FB
        and     eax, 01H                                ; 0ADC _ 83. E0, 01
        test    eax, eax                                ; 0ADF _ 85. C0
        jz      ?_029                                   ; 0AE1 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 0AE3 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0AE6 _ 8B. 45, FC
        add     eax, edx                                ; 0AE9 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0AEB _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0AEF _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0AF1 _ 8B. 45, 10
        add     eax, edx                                ; 0AF4 _ 01. D0
        lea     edx, [eax+7H]                           ; 0AF6 _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 0AF9 _ 8B. 45, 08
        add     edx, eax                                ; 0AFC _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0AFE _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0B02 _ 88. 02
?_029:  add     dword [ebp-4H], 1                       ; 0B04 _ 83. 45, FC, 01
?_030:  cmp     dword [ebp-4H], 15                      ; 0B08 _ 83. 7D, FC, 0F
        jle     ?_021                                   ; 0B0C _ 0F 8E, FFFFFE8A
        nop                                             ; 0B12 _ 90
        leave                                           ; 0B13 _ C9
        ret                                             ; 0B14 _ C3
; showChar8 End of function

init_mouse_cursor:; Function begin
        push    ebp                                     ; 0B15 _ 55
        mov     ebp, esp                                ; 0B16 _ 89. E5
        sub     esp, 20                                 ; 0B18 _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 0B1B _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 0B1E _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 0B21 _ C7. 45, FC, 00000000
        jmp     ?_037                                   ; 0B28 _ E9, 000000B5

?_031:  mov     dword [ebp-8H], 0                       ; 0B2D _ C7. 45, F8, 00000000
        jmp     ?_036                                   ; 0B34 _ E9, 0000009B

?_032:  mov     eax, dword [ebp-4H]                     ; 0B39 _ 8B. 45, FC
        shl     eax, 4                                  ; 0B3C _ C1. E0, 04
        mov     edx, eax                                ; 0B3F _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0B41 _ 8B. 45, F8
        add     eax, edx                                ; 0B44 _ 01. D0
        add     eax, cursor.1819                        ; 0B46 _ 05, 000000C0(d)
        movzx   eax, byte [eax]                         ; 0B4B _ 0F B6. 00
        cmp     al, 42                                  ; 0B4E _ 3C, 2A
        jnz     ?_033                                   ; 0B50 _ 75, 19
        mov     eax, dword [ebp-4H]                     ; 0B52 _ 8B. 45, FC
        shl     eax, 4                                  ; 0B55 _ C1. E0, 04
        mov     edx, eax                                ; 0B58 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0B5A _ 8B. 45, F8
        add     eax, edx                                ; 0B5D _ 01. D0
        mov     edx, eax                                ; 0B5F _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0B61 _ 8B. 45, 08
        add     eax, edx                                ; 0B64 _ 01. D0
        mov     byte [eax], 0                           ; 0B66 _ C6. 00, 00
        jmp     ?_035                                   ; 0B69 _ EB, 65

?_033:  mov     eax, dword [ebp-4H]                     ; 0B6B _ 8B. 45, FC
        shl     eax, 4                                  ; 0B6E _ C1. E0, 04
        mov     edx, eax                                ; 0B71 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0B73 _ 8B. 45, F8
        add     eax, edx                                ; 0B76 _ 01. D0
        add     eax, cursor.1819                        ; 0B78 _ 05, 000000C0(d)
        movzx   eax, byte [eax]                         ; 0B7D _ 0F B6. 00
        cmp     al, 79                                  ; 0B80 _ 3C, 4F
        jnz     ?_034                                   ; 0B82 _ 75, 19
        mov     eax, dword [ebp-4H]                     ; 0B84 _ 8B. 45, FC
        shl     eax, 4                                  ; 0B87 _ C1. E0, 04
        mov     edx, eax                                ; 0B8A _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0B8C _ 8B. 45, F8
        add     eax, edx                                ; 0B8F _ 01. D0
        mov     edx, eax                                ; 0B91 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0B93 _ 8B. 45, 08
        add     eax, edx                                ; 0B96 _ 01. D0
        mov     byte [eax], 7                           ; 0B98 _ C6. 00, 07
        jmp     ?_035                                   ; 0B9B _ EB, 33

?_034:  mov     eax, dword [ebp-4H]                     ; 0B9D _ 8B. 45, FC
        shl     eax, 4                                  ; 0BA0 _ C1. E0, 04
        mov     edx, eax                                ; 0BA3 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0BA5 _ 8B. 45, F8
        add     eax, edx                                ; 0BA8 _ 01. D0
        add     eax, cursor.1819                        ; 0BAA _ 05, 000000C0(d)
        movzx   eax, byte [eax]                         ; 0BAF _ 0F B6. 00
        cmp     al, 46                                  ; 0BB2 _ 3C, 2E
        jnz     ?_035                                   ; 0BB4 _ 75, 1A
        mov     eax, dword [ebp-4H]                     ; 0BB6 _ 8B. 45, FC
        shl     eax, 4                                  ; 0BB9 _ C1. E0, 04
        mov     edx, eax                                ; 0BBC _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0BBE _ 8B. 45, F8
        add     eax, edx                                ; 0BC1 _ 01. D0
        mov     edx, eax                                ; 0BC3 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0BC5 _ 8B. 45, 08
        add     edx, eax                                ; 0BC8 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0BCA _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0BCE _ 88. 02
?_035:  add     dword [ebp-8H], 1                       ; 0BD0 _ 83. 45, F8, 01
?_036:  cmp     dword [ebp-8H], 15                      ; 0BD4 _ 83. 7D, F8, 0F
        jle     ?_032                                   ; 0BD8 _ 0F 8E, FFFFFF5B
        add     dword [ebp-4H], 1                       ; 0BDE _ 83. 45, FC, 01
?_037:  cmp     dword [ebp-4H], 15                      ; 0BE2 _ 83. 7D, FC, 0F
        jle     ?_031                                   ; 0BE6 _ 0F 8E, FFFFFF41
        nop                                             ; 0BEC _ 90
        leave                                           ; 0BED _ C9
        ret                                             ; 0BEE _ C3
; init_mouse_cursor End of function

putblock:; Function begin
        push    ebp                                     ; 0BEF _ 55
        mov     ebp, esp                                ; 0BF0 _ 89. E5
        push    ebx                                     ; 0BF2 _ 53
        sub     esp, 16                                 ; 0BF3 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 0BF6 _ C7. 45, F8, 00000000
        jmp     ?_041                                   ; 0BFD _ EB, 50

?_038:  mov     dword [ebp-0CH], 0                      ; 0BFF _ C7. 45, F4, 00000000
        jmp     ?_040                                   ; 0C06 _ EB, 3B

?_039:  mov     eax, dword [ebp-8H]                     ; 0C08 _ 8B. 45, F8
        imul    eax, dword [ebp+24H]                    ; 0C0B _ 0F AF. 45, 24
        mov     edx, eax                                ; 0C0F _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 0C11 _ 8B. 45, F4
        add     eax, edx                                ; 0C14 _ 01. D0
        mov     edx, eax                                ; 0C16 _ 89. C2
        mov     eax, dword [ebp+20H]                    ; 0C18 _ 8B. 45, 20
        add     eax, edx                                ; 0C1B _ 01. D0
        mov     ecx, dword [ebp+1CH]                    ; 0C1D _ 8B. 4D, 1C
        mov     edx, dword [ebp-8H]                     ; 0C20 _ 8B. 55, F8
        add     edx, ecx                                ; 0C23 _ 01. CA
        imul    edx, dword [ebp+0CH]                    ; 0C25 _ 0F AF. 55, 0C
        mov     ebx, dword [ebp+18H]                    ; 0C29 _ 8B. 5D, 18
        mov     ecx, dword [ebp-0CH]                    ; 0C2C _ 8B. 4D, F4
        add     ecx, ebx                                ; 0C2F _ 01. D9
        add     edx, ecx                                ; 0C31 _ 01. CA
        mov     ecx, edx                                ; 0C33 _ 89. D1
        mov     edx, dword [ebp+8H]                     ; 0C35 _ 8B. 55, 08
        add     edx, ecx                                ; 0C38 _ 01. CA
        movzx   eax, byte [eax]                         ; 0C3A _ 0F B6. 00
        mov     byte [edx], al                          ; 0C3D _ 88. 02
        add     dword [ebp-0CH], 1                      ; 0C3F _ 83. 45, F4, 01
?_040:  mov     eax, dword [ebp-0CH]                    ; 0C43 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 0C46 _ 3B. 45, 10
        jl      ?_039                                   ; 0C49 _ 7C, BD
        add     dword [ebp-8H], 1                       ; 0C4B _ 83. 45, F8, 01
?_041:  mov     eax, dword [ebp-8H]                     ; 0C4F _ 8B. 45, F8
        cmp     eax, dword [ebp+14H]                    ; 0C52 _ 3B. 45, 14
        jl      ?_038                                   ; 0C55 _ 7C, A8
        nop                                             ; 0C57 _ 90
        add     esp, 16                                 ; 0C58 _ 83. C4, 10
        pop     ebx                                     ; 0C5B _ 5B
        pop     ebp                                     ; 0C5C _ 5D
        ret                                             ; 0C5D _ C3
; putblock End of function

intHandlerFromC:; Function begin
        push    ebp                                     ; 0C5E _ 55
        mov     ebp, esp                                ; 0C5F _ 89. E5
        sub     esp, 24                                 ; 0C61 _ 83. EC, 18
        mov     eax, dword [bootInfo]                   ; 0C64 _ A1, 00000000(d)
        mov     dword [ebp-14H], eax                    ; 0C69 _ 89. 45, EC
        movzx   eax, word [?_172]                       ; 0C6C _ 0F B7. 05, 00000004(d)
        cwde                                            ; 0C73 _ 98
        mov     dword [ebp-10H], eax                    ; 0C74 _ 89. 45, F0
        movzx   eax, word [?_173]                       ; 0C77 _ 0F B7. 05, 00000006(d)
        cwde                                            ; 0C7E _ 98
        mov     dword [ebp-0CH], eax                    ; 0C7F _ 89. 45, F4
        sub     esp, 8                                  ; 0C82 _ 83. EC, 08
        push    32                                      ; 0C85 _ 6A, 20
        push    32                                      ; 0C87 _ 6A, 20
        call    io_out8                                 ; 0C89 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0C8E _ 83. C4, 10
        mov     byte [ebp-15H], 0                       ; 0C91 _ C6. 45, EB, 00
        sub     esp, 12                                 ; 0C95 _ 83. EC, 0C
        push    96                                      ; 0C98 _ 6A, 60
        call    io_in8                                  ; 0C9A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0C9F _ 83. C4, 10
        mov     byte [ebp-15H], al                      ; 0CA2 _ 88. 45, EB
        movzx   eax, byte [ebp-15H]                     ; 0CA5 _ 0F B6. 45, EB
        sub     esp, 8                                  ; 0CA9 _ 83. EC, 08
        push    eax                                     ; 0CAC _ 50
        push    keyinfo                                 ; 0CAD _ 68, 00000020(d)
        call    fifo8_put                               ; 0CB2 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0CB7 _ 83. C4, 10
        nop                                             ; 0CBA _ 90
        leave                                           ; 0CBB _ C9
        ret                                             ; 0CBC _ C3
; intHandlerFromC End of function

charToHexVal:; Function begin
        push    ebp                                     ; 0CBD _ 55
        mov     ebp, esp                                ; 0CBE _ 89. E5
        sub     esp, 4                                  ; 0CC0 _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 0CC3 _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 0CC6 _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 0CC9 _ 80. 7D, FC, 09
        jle     ?_042                                   ; 0CCD _ 7E, 09
        movzx   eax, byte [ebp-4H]                      ; 0CCF _ 0F B6. 45, FC
        add     eax, 55                                 ; 0CD3 _ 83. C0, 37
        jmp     ?_043                                   ; 0CD6 _ EB, 07

?_042:  movzx   eax, byte [ebp-4H]                      ; 0CD8 _ 0F B6. 45, FC
        add     eax, 48                                 ; 0CDC _ 83. C0, 30
?_043:  leave                                           ; 0CDF _ C9
        ret                                             ; 0CE0 _ C3
; charToHexVal End of function

charToHexStr:; Function begin
        push    ebp                                     ; 0CE1 _ 55
        mov     ebp, esp                                ; 0CE2 _ 89. E5
        sub     esp, 20                                 ; 0CE4 _ 83. EC, 14
        mov     eax, dword [ebp+8H]                     ; 0CE7 _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 0CEA _ 88. 45, EC
        movzx   eax, byte [ebp-14H]                     ; 0CED _ 0F B6. 45, EC
        and     eax, 0FH                                ; 0CF1 _ 83. E0, 0F
        mov     byte [ebp-1H], al                       ; 0CF4 _ 88. 45, FF
        movsx   eax, byte [ebp-1H]                      ; 0CF7 _ 0F BE. 45, FF
        push    eax                                     ; 0CFB _ 50
        call    charToHexVal                            ; 0CFC _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 0D01 _ 83. C4, 04
        mov     byte [?_171], al                        ; 0D04 _ A2, 00000003(d)
        shr     byte [ebp-14H], 4                       ; 0D09 _ C0. 6D, EC, 04
        movzx   eax, byte [ebp-14H]                     ; 0D0D _ 0F B6. 45, EC
        movsx   eax, al                                 ; 0D11 _ 0F BE. C0
        push    eax                                     ; 0D14 _ 50
        call    charToHexVal                            ; 0D15 _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 0D1A _ 83. C4, 04
        mov     byte [?_170], al                        ; 0D1D _ A2, 00000002(d)
        mov     eax, keyval                             ; 0D22 _ B8, 00000000(d)
        leave                                           ; 0D27 _ C9
        ret                                             ; 0D28 _ C3
; charToHexStr End of function

intToHexStr:; Function begin
        push    ebp                                     ; 0D29 _ 55
        mov     ebp, esp                                ; 0D2A _ 89. E5
        sub     esp, 16                                 ; 0D2C _ 83. EC, 10
        mov     byte [str.1863], 48                     ; 0D2F _ C6. 05, 0000028C(d), 30
        mov     byte [?_176], 88                        ; 0D36 _ C6. 05, 0000028D(d), 58
        mov     byte [?_177], 0                         ; 0D3D _ C6. 05, 00000296(d), 00
        mov     dword [ebp-8H], 2                       ; 0D44 _ C7. 45, F8, 00000002
        mov     dword [ebp-0CH], 7                      ; 0D4B _ C7. 45, F4, 00000007
        jmp     ?_047                                   ; 0D52 _ EB, 45

?_044:  mov     eax, dword [ebp+8H]                     ; 0D54 _ 8B. 45, 08
        and     eax, 0FH                                ; 0D57 _ 83. E0, 0F
        mov     dword [ebp-4H], eax                     ; 0D5A _ 89. 45, FC
        cmp     dword [ebp-4H], 9                       ; 0D5D _ 83. 7D, FC, 09
        jg      ?_045                                   ; 0D61 _ 7F, 18
        mov     eax, dword [ebp-4H]                     ; 0D63 _ 8B. 45, FC
        lea     ecx, [eax+30H]                          ; 0D66 _ 8D. 48, 30
        mov     edx, dword [ebp-8H]                     ; 0D69 _ 8B. 55, F8
        mov     eax, dword [ebp-0CH]                    ; 0D6C _ 8B. 45, F4
        add     eax, edx                                ; 0D6F _ 01. D0
        mov     edx, ecx                                ; 0D71 _ 89. CA
        mov     byte [str.1863+eax], dl                 ; 0D73 _ 88. 90, 0000028C(d)
        jmp     ?_046                                   ; 0D79 _ EB, 16

?_045:  mov     eax, dword [ebp-4H]                     ; 0D7B _ 8B. 45, FC
        lea     ecx, [eax+37H]                          ; 0D7E _ 8D. 48, 37
        mov     edx, dword [ebp-8H]                     ; 0D81 _ 8B. 55, F8
        mov     eax, dword [ebp-0CH]                    ; 0D84 _ 8B. 45, F4
        add     eax, edx                                ; 0D87 _ 01. D0
        mov     edx, ecx                                ; 0D89 _ 89. CA
        mov     byte [str.1863+eax], dl                 ; 0D8B _ 88. 90, 0000028C(d)
?_046:  shr     dword [ebp+8H], 4                       ; 0D91 _ C1. 6D, 08, 04
        sub     dword [ebp-0CH], 1                      ; 0D95 _ 83. 6D, F4, 01
?_047:  cmp     dword [ebp-0CH], 0                      ; 0D99 _ 83. 7D, F4, 00
        jns     ?_044                                   ; 0D9D _ 79, B5
        mov     eax, str.1863                           ; 0D9F _ B8, 0000028C(d)
        leave                                           ; 0DA4 _ C9
        ret                                             ; 0DA5 _ C3
; intToHexStr End of function

wait_KBC_sendReady:; Function begin
        push    ebp                                     ; 0DA6 _ 55
        mov     ebp, esp                                ; 0DA7 _ 89. E5
        sub     esp, 8                                  ; 0DA9 _ 83. EC, 08
?_048:  sub     esp, 12                                 ; 0DAC _ 83. EC, 0C
        push    100                                     ; 0DAF _ 6A, 64
        call    io_in8                                  ; 0DB1 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0DB6 _ 83. C4, 10
        and     eax, 02H                                ; 0DB9 _ 83. E0, 02
        test    eax, eax                                ; 0DBC _ 85. C0
        jz      ?_049                                   ; 0DBE _ 74, 02
        jmp     ?_048                                   ; 0DC0 _ EB, EA
; wait_KBC_sendReady End of function

?_049:  ; Local function
        nop                                             ; 0DC2 _ 90
        nop                                             ; 0DC3 _ 90
        leave                                           ; 0DC4 _ C9
        ret                                             ; 0DC5 _ C3

init_keyboard:; Function begin
        push    ebp                                     ; 0DC6 _ 55
        mov     ebp, esp                                ; 0DC7 _ 89. E5
        sub     esp, 8                                  ; 0DC9 _ 83. EC, 08
        call    wait_KBC_sendReady                      ; 0DCC _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0DD1 _ 83. EC, 08
        push    96                                      ; 0DD4 _ 6A, 60
        push    100                                     ; 0DD6 _ 6A, 64
        call    io_out8                                 ; 0DD8 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0DDD _ 83. C4, 10
        call    wait_KBC_sendReady                      ; 0DE0 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0DE5 _ 83. EC, 08
        push    71                                      ; 0DE8 _ 6A, 47
        push    96                                      ; 0DEA _ 6A, 60
        call    io_out8                                 ; 0DEC _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0DF1 _ 83. C4, 10
        nop                                             ; 0DF4 _ 90
        leave                                           ; 0DF5 _ C9
        ret                                             ; 0DF6 _ C3
; init_keyboard End of function

enable_mouse:; Function begin
        push    ebp                                     ; 0DF7 _ 55
        mov     ebp, esp                                ; 0DF8 _ 89. E5
        sub     esp, 8                                  ; 0DFA _ 83. EC, 08
        call    wait_KBC_sendReady                      ; 0DFD _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0E02 _ 83. EC, 08
        push    212                                     ; 0E05 _ 68, 000000D4
        push    100                                     ; 0E0A _ 6A, 64
        call    io_out8                                 ; 0E0C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0E11 _ 83. C4, 10
        call    wait_KBC_sendReady                      ; 0E14 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0E19 _ 83. EC, 08
        push    244                                     ; 0E1C _ 68, 000000F4
        push    96                                      ; 0E21 _ 6A, 60
        call    io_out8                                 ; 0E23 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0E28 _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 0E2B _ 8B. 45, 08
        mov     byte [eax+3H], 0                        ; 0E2E _ C6. 40, 03, 00
        nop                                             ; 0E32 _ 90
        leave                                           ; 0E33 _ C9
        ret                                             ; 0E34 _ C3
; enable_mouse End of function

intHandlerFromMouse:; Function begin
        push    ebp                                     ; 0E35 _ 55
        mov     ebp, esp                                ; 0E36 _ 89. E5
        sub     esp, 24                                 ; 0E38 _ 83. EC, 18
        sub     esp, 8                                  ; 0E3B _ 83. EC, 08
        push    32                                      ; 0E3E _ 6A, 20
        push    160                                     ; 0E40 _ 68, 000000A0
        call    io_out8                                 ; 0E45 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0E4A _ 83. C4, 10
        sub     esp, 8                                  ; 0E4D _ 83. EC, 08
        push    32                                      ; 0E50 _ 6A, 20
        push    32                                      ; 0E52 _ 6A, 20
        call    io_out8                                 ; 0E54 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0E59 _ 83. C4, 10
        sub     esp, 12                                 ; 0E5C _ 83. EC, 0C
        push    96                                      ; 0E5F _ 6A, 60
        call    io_in8                                  ; 0E61 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0E66 _ 83. C4, 10
        mov     byte [ebp-9H], al                       ; 0E69 _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 0E6C _ 0F B6. 45, F7
        sub     esp, 8                                  ; 0E70 _ 83. EC, 08
        push    eax                                     ; 0E73 _ 50
        push    mouseinfo                               ; 0E74 _ 68, 00000008(d)
        call    fifo8_put                               ; 0E79 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0E7E _ 83. C4, 10
        nop                                             ; 0E81 _ 90
        leave                                           ; 0E82 _ C9
        ret                                             ; 0E83 _ C3
; intHandlerFromMouse End of function

mouse_decode:; Function begin
        push    ebp                                     ; 0E84 _ 55
        mov     ebp, esp                                ; 0E85 _ 89. E5
        sub     esp, 4                                  ; 0E87 _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 0E8A _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 0E8D _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0E90 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 0E93 _ 0F B6. 40, 03
        test    al, al                                  ; 0E97 _ 84. C0
        jnz     ?_051                                   ; 0E99 _ 75, 17
        cmp     byte [ebp-4H], -6                       ; 0E9B _ 80. 7D, FC, FA
        jnz     ?_050                                   ; 0E9F _ 75, 07
        mov     eax, dword [ebp+8H]                     ; 0EA1 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 0EA4 _ C6. 40, 03, 01
?_050:  mov     eax, 0                                  ; 0EA8 _ B8, 00000000
        jmp     ?_058                                   ; 0EAD _ E9, 0000010F

?_051:  mov     eax, dword [ebp+8H]                     ; 0EB2 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 0EB5 _ 0F B6. 40, 03
        cmp     al, 1                                   ; 0EB9 _ 3C, 01
        jnz     ?_053                                   ; 0EBB _ 75, 28
        movzx   eax, byte [ebp-4H]                      ; 0EBD _ 0F B6. 45, FC
        and     eax, 0C8H                               ; 0EC1 _ 25, 000000C8
        cmp     eax, 8                                  ; 0EC6 _ 83. F8, 08
        jnz     ?_052                                   ; 0EC9 _ 75, 10
        mov     eax, dword [ebp+8H]                     ; 0ECB _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 0ECE _ 0F B6. 55, FC
        mov     byte [eax], dl                          ; 0ED2 _ 88. 10
        mov     eax, dword [ebp+8H]                     ; 0ED4 _ 8B. 45, 08
        mov     byte [eax+3H], 2                        ; 0ED7 _ C6. 40, 03, 02
?_052:  mov     eax, 0                                  ; 0EDB _ B8, 00000000
        jmp     ?_058                                   ; 0EE0 _ E9, 000000DC

?_053:  mov     eax, dword [ebp+8H]                     ; 0EE5 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 0EE8 _ 0F B6. 40, 03
        cmp     al, 2                                   ; 0EEC _ 3C, 02
        jnz     ?_054                                   ; 0EEE _ 75, 1B
        mov     eax, dword [ebp+8H]                     ; 0EF0 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 0EF3 _ 0F B6. 55, FC
        mov     byte [eax+1H], dl                       ; 0EF7 _ 88. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0EFA _ 8B. 45, 08
        mov     byte [eax+3H], 3                        ; 0EFD _ C6. 40, 03, 03
        mov     eax, 0                                  ; 0F01 _ B8, 00000000
        jmp     ?_058                                   ; 0F06 _ E9, 000000B6

?_054:  mov     eax, dword [ebp+8H]                     ; 0F0B _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 0F0E _ 0F B6. 40, 03
        cmp     al, 3                                   ; 0F12 _ 3C, 03
        jne     ?_057                                   ; 0F14 _ 0F 85, 000000A2
        mov     eax, dword [ebp+8H]                     ; 0F1A _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 0F1D _ 0F B6. 55, FC
        mov     byte [eax+2H], dl                       ; 0F21 _ 88. 50, 02
        mov     eax, dword [ebp+8H]                     ; 0F24 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 0F27 _ C6. 40, 03, 01
        mov     eax, dword [ebp+8H]                     ; 0F2B _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 0F2E _ 0F B6. 00
        movzx   eax, al                                 ; 0F31 _ 0F B6. C0
        and     eax, 07H                                ; 0F34 _ 83. E0, 07
        mov     edx, eax                                ; 0F37 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0F39 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 0F3C _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 0F3F _ 8B. 45, 08
        movzx   eax, byte [eax+1H]                      ; 0F42 _ 0F B6. 40, 01
        movzx   edx, al                                 ; 0F46 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 0F49 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 0F4C _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0F4F _ 8B. 45, 08
        movzx   eax, byte [eax+2H]                      ; 0F52 _ 0F B6. 40, 02
        movzx   edx, al                                 ; 0F56 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 0F59 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0F5C _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 0F5F _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 0F62 _ 0F B6. 00
        movzx   eax, al                                 ; 0F65 _ 0F B6. C0
        and     eax, 10H                                ; 0F68 _ 83. E0, 10
        test    eax, eax                                ; 0F6B _ 85. C0
        jz      ?_055                                   ; 0F6D _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 0F6F _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0F72 _ 8B. 40, 04
        or      eax, 0FFFFFF00H                         ; 0F75 _ 0D, FFFFFF00
        mov     edx, eax                                ; 0F7A _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0F7C _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 0F7F _ 89. 50, 04
?_055:  mov     eax, dword [ebp+8H]                     ; 0F82 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 0F85 _ 0F B6. 00
        movzx   eax, al                                 ; 0F88 _ 0F B6. C0
        and     eax, 20H                                ; 0F8B _ 83. E0, 20
        test    eax, eax                                ; 0F8E _ 85. C0
        jz      ?_056                                   ; 0F90 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 0F92 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0F95 _ 8B. 40, 08
        or      eax, 0FFFFFF00H                         ; 0F98 _ 0D, FFFFFF00
        mov     edx, eax                                ; 0F9D _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0F9F _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0FA2 _ 89. 50, 08
?_056:  mov     eax, dword [ebp+8H]                     ; 0FA5 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0FA8 _ 8B. 40, 08
        neg     eax                                     ; 0FAB _ F7. D8
        mov     edx, eax                                ; 0FAD _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0FAF _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0FB2 _ 89. 50, 08
        mov     eax, 1                                  ; 0FB5 _ B8, 00000001
        jmp     ?_058                                   ; 0FBA _ EB, 05

?_057:  mov     eax, 4294967295                         ; 0FBC _ B8, FFFFFFFF
?_058:  leave                                           ; 0FC1 _ C9
        ret                                             ; 0FC2 _ C3
; mouse_decode End of function

computeMousePosition:; Function begin
        push    ebp                                     ; 0FC3 _ 55
        mov     ebp, esp                                ; 0FC4 _ 89. E5
        sub     esp, 24                                 ; 0FC6 _ 83. EC, 18
        movzx   eax, word [?_172]                       ; 0FC9 _ 0F B7. 05, 00000004(d)
        cwde                                            ; 0FD0 _ 98
        mov     dword [ebp-14H], eax                    ; 0FD1 _ 89. 45, EC
        movzx   eax, word [?_173]                       ; 0FD4 _ 0F B7. 05, 00000006(d)
        cwde                                            ; 0FDB _ 98
        mov     dword [ebp-10H], eax                    ; 0FDC _ 89. 45, F0
        mov     eax, dword [ebp+10H]                    ; 0FDF _ 8B. 45, 10
        mov     dword [eax+4H], 16                      ; 0FE2 _ C7. 40, 04, 00000010
        mov     eax, dword [ebp+10H]                    ; 0FE9 _ 8B. 45, 10
        mov     dword [eax+8H], 16                      ; 0FEC _ C7. 40, 08, 00000010
        mov     eax, dword [ebp+14H]                    ; 0FF3 _ 8B. 45, 14
        mov     edx, dword [eax+4H]                     ; 0FF6 _ 8B. 50, 04
        mov     eax, dword [mx]                         ; 0FF9 _ A1, 000000F0(d)
        add     eax, edx                                ; 0FFE _ 01. D0
        mov     dword [mx], eax                         ; 1000 _ A3, 000000F0(d)
        mov     eax, dword [ebp+14H]                    ; 1005 _ 8B. 45, 14
        mov     edx, dword [eax+8H]                     ; 1008 _ 8B. 50, 08
        mov     eax, dword [my]                         ; 100B _ A1, 000000F4(d)
        add     eax, edx                                ; 1010 _ 01. D0
        mov     dword [my], eax                         ; 1012 _ A3, 000000F4(d)
        mov     eax, dword [mx]                         ; 1017 _ A1, 000000F0(d)
        test    eax, eax                                ; 101C _ 85. C0
        jns     ?_059                                   ; 101E _ 79, 0A
        mov     dword [mx], 0                           ; 1020 _ C7. 05, 000000F0(d), 00000000
?_059:  mov     eax, dword [my]                         ; 102A _ A1, 000000F4(d)
        test    eax, eax                                ; 102F _ 85. C0
        jns     ?_060                                   ; 1031 _ 79, 0A
        mov     dword [my], 0                           ; 1033 _ C7. 05, 000000F4(d), 00000000
?_060:  mov     eax, dword [ebp-10H]                    ; 103D _ 8B. 45, F0
        lea     edx, [eax-10H]                          ; 1040 _ 8D. 50, F0
        mov     eax, dword [my]                         ; 1043 _ A1, 000000F4(d)
        cmp     edx, eax                                ; 1048 _ 39. C2
        jge     ?_061                                   ; 104A _ 7D, 10
        mov     eax, dword [my]                         ; 104C _ A1, 000000F4(d)
        mov     edx, dword [ebp-10H]                    ; 1051 _ 8B. 55, F0
        sub     edx, eax                                ; 1054 _ 29. C2
        mov     eax, dword [ebp+10H]                    ; 1056 _ 8B. 45, 10
        mov     dword [eax+8H], edx                     ; 1059 _ 89. 50, 08
?_061:  mov     dword [ebp-0CH], 1                      ; 105C _ C7. 45, F4, 00000001
        mov     eax, dword [ebp-14H]                    ; 1063 _ 8B. 45, EC
        sub     eax, dword [ebp-0CH]                    ; 1066 _ 2B. 45, F4
        mov     edx, eax                                ; 1069 _ 89. C2
        mov     eax, dword [mx]                         ; 106B _ A1, 000000F0(d)
        cmp     edx, eax                                ; 1070 _ 39. C2
        jge     ?_062                                   ; 1072 _ 7D, 14
        mov     eax, dword [ebp-14H]                    ; 1074 _ 8B. 45, EC
        sub     eax, dword [ebp-0CH]                    ; 1077 _ 2B. 45, F4
        mov     dword [mx], eax                         ; 107A _ A3, 000000F0(d)
        mov     eax, dword [ebp+10H]                    ; 107F _ 8B. 45, 10
        mov     edx, dword [ebp-0CH]                    ; 1082 _ 8B. 55, F4
        mov     dword [eax+4H], edx                     ; 1085 _ 89. 50, 04
?_062:  mov     eax, dword [ebp-10H]                    ; 1088 _ 8B. 45, F0
        sub     eax, dword [ebp-0CH]                    ; 108B _ 2B. 45, F4
        mov     edx, eax                                ; 108E _ 89. C2
        mov     eax, dword [my]                         ; 1090 _ A1, 000000F4(d)
        cmp     edx, eax                                ; 1095 _ 39. C2
        jge     ?_063                                   ; 1097 _ 7D, 14
        mov     eax, dword [ebp-10H]                    ; 1099 _ 8B. 45, F0
        sub     eax, dword [ebp-0CH]                    ; 109C _ 2B. 45, F4
        mov     dword [my], eax                         ; 109F _ A3, 000000F4(d)
        mov     eax, dword [ebp+10H]                    ; 10A4 _ 8B. 45, 10
        mov     edx, dword [ebp-0CH]                    ; 10A7 _ 8B. 55, F4
        mov     dword [eax+8H], edx                     ; 10AA _ 89. 50, 08
?_063:  sub     esp, 8                                  ; 10AD _ 83. EC, 08
        push    ?_163                                   ; 10B0 _ 68, 0000001C(d)
        push    7                                       ; 10B5 _ 6A, 07
        push    0                                       ; 10B7 _ 6A, 00
        push    0                                       ; 10B9 _ 6A, 00
        push    dword [ebp+0CH]                         ; 10BB _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 10BE _ FF. 75, 08
        call    showString                              ; 10C1 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 10C6 _ 83. C4, 20
        nop                                             ; 10C9 _ 90
        leave                                           ; 10CA _ C9
        ret                                             ; 10CB _ C3
; computeMousePosition End of function

show_mouse_info:; Function begin
        push    ebp                                     ; 10CC _ 55
        mov     ebp, esp                                ; 10CD _ 89. E5
        sub     esp, 24                                 ; 10CF _ 83. EC, 18
        mov     eax, dword [buf_back]                   ; 10D2 _ A1, 000000F8(d)
        mov     dword [ebp-0CH], eax                    ; 10D7 _ 89. 45, F4
        mov     byte [ebp-0DH], 0                       ; 10DA _ C6. 45, F3, 00
        call    io_sti                                  ; 10DE _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 10E3 _ 83. EC, 0C
        push    mouseinfo                               ; 10E6 _ 68, 00000008(d)
        call    fifo8_get                               ; 10EB _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 10F0 _ 83. C4, 10
        mov     byte [ebp-0DH], al                      ; 10F3 _ 88. 45, F3
        movzx   eax, byte [ebp-0DH]                     ; 10F6 _ 0F B6. 45, F3
        sub     esp, 8                                  ; 10FA _ 83. EC, 08
        push    eax                                     ; 10FD _ 50
        push    mdec                                    ; 10FE _ 68, 000000E0(d)
        call    mouse_decode                            ; 1103 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1108 _ 83. C4, 10
        cmp     eax, 1                                  ; 110B _ 83. F8, 01
        jnz     ?_065                                   ; 110E _ 75, 7A
        push    mdec                                    ; 1110 _ 68, 000000E0(d)
        push    dword [ebp+10H]                         ; 1115 _ FF. 75, 10
        push    dword [ebp+0CH]                         ; 1118 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 111B _ FF. 75, 08
        call    computeMousePosition                    ; 111E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1123 _ 83. C4, 10
        mov     eax, dword [?_174]                      ; 1126 _ A1, 000000EC(d)
        and     eax, 01H                                ; 112B _ 83. E0, 01
        test    eax, eax                                ; 112E _ 85. C0
        jz      ?_064                                   ; 1130 _ 74, 3D
        mov     edx, dword [mx]                         ; 1132 _ 8B. 15, 000000F0(d)
        mov     eax, dword [ebp+10H]                    ; 1138 _ 8B. 45, 10
        mov     dword [eax+0CH], edx                    ; 113B _ 89. 50, 0C
        mov     edx, dword [my]                         ; 113E _ 8B. 15, 000000F4(d)
        mov     eax, dword [ebp+10H]                    ; 1144 _ 8B. 45, 10
        mov     dword [eax+10H], edx                    ; 1147 _ 89. 50, 10
        mov     eax, dword [my]                         ; 114A _ A1, 000000F4(d)
        lea     ecx, [eax-8H]                           ; 114F _ 8D. 48, F8
        mov     eax, dword [mx]                         ; 1152 _ A1, 000000F0(d)
        lea     edx, [eax-50H]                          ; 1157 _ 8D. 50, B0
        mov     eax, dword [shtMsgBox]                  ; 115A _ A1, 00000278(d)
        push    ecx                                     ; 115F _ 51
        push    edx                                     ; 1160 _ 52
        push    eax                                     ; 1161 _ 50
        push    dword [ebp+8H]                          ; 1162 _ FF. 75, 08
        call    sheet_slide                             ; 1165 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 116A _ 83. C4, 10
        jmp     ?_065                                   ; 116D _ EB, 1B

?_064:  mov     edx, dword [my]                         ; 116F _ 8B. 15, 000000F4(d)
        mov     eax, dword [mx]                         ; 1175 _ A1, 000000F0(d)
        push    edx                                     ; 117A _ 52
        push    eax                                     ; 117B _ 50
        push    dword [ebp+10H]                         ; 117C _ FF. 75, 10
        push    dword [ebp+8H]                          ; 117F _ FF. 75, 08
        call    sheet_slide_mouse                       ; 1182 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1187 _ 83. C4, 10
?_065:  nop                                             ; 118A _ 90
        leave                                           ; 118B _ C9
        ret                                             ; 118C _ C3
; show_mouse_info End of function

showMemoryInfo:; Function begin
        push    ebp                                     ; 118D _ 55
        mov     ebp, esp                                ; 118E _ 89. E5
        sub     esp, 56                                 ; 1190 _ 83. EC, 38
        mov     dword [ebp-30H], 0                      ; 1193 _ C7. 45, D0, 00000000
        mov     dword [ebp-2CH], 0                      ; 119A _ C7. 45, D4, 00000000
        mov     dword [ebp-28H], 104                    ; 11A1 _ C7. 45, D8, 00000068
        mov     dword [ebp-24H], 80                     ; 11A8 _ C7. 45, DC, 00000050
        mov     edx, dword [ysize]                      ; 11AF _ 8B. 15, 00000204(d)
        mov     eax, dword [ebp+0CH]                    ; 11B5 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 11B8 _ 8B. 00
        sub     esp, 4                                  ; 11BA _ 83. EC, 04
        push    edx                                     ; 11BD _ 52
        push    dword [ebp+1CH]                         ; 11BE _ FF. 75, 1C
        push    eax                                     ; 11C1 _ 50
        call    init_screen8                            ; 11C2 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 11C7 _ 83. C4, 10
        mov     eax, dword [ebp+20H]                    ; 11CA _ 8B. 45, 20
        movsx   eax, al                                 ; 11CD _ 0F BE. C0
        sub     esp, 8                                  ; 11D0 _ 83. EC, 08
        push    ?_164                                   ; 11D3 _ 68, 00000034(d)
        push    eax                                     ; 11D8 _ 50
        push    dword [ebp-2CH]                         ; 11D9 _ FF. 75, D4
        push    dword [ebp-30H]                         ; 11DC _ FF. 75, D0
        push    dword [ebp+0CH]                         ; 11DF _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 11E2 _ FF. 75, 08
        call    showString                              ; 11E5 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 11EA _ 83. C4, 20
        mov     eax, dword [ebp+18H]                    ; 11ED _ 8B. 45, 18
        sub     esp, 12                                 ; 11F0 _ 83. EC, 0C
        push    eax                                     ; 11F3 _ 50
        call    intToHexStr                             ; 11F4 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 11F9 _ 83. C4, 10
        mov     dword [ebp-20H], eax                    ; 11FC _ 89. 45, E0
        mov     eax, dword [ebp+20H]                    ; 11FF _ 8B. 45, 20
        movsx   eax, al                                 ; 1202 _ 0F BE. C0
        sub     esp, 8                                  ; 1205 _ 83. EC, 08
        push    dword [ebp-20H]                         ; 1208 _ FF. 75, E0
        push    eax                                     ; 120B _ 50
        push    dword [ebp-2CH]                         ; 120C _ FF. 75, D4
        push    dword [ebp-28H]                         ; 120F _ FF. 75, D8
        push    dword [ebp+0CH]                         ; 1212 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1215 _ FF. 75, 08
        call    showString                              ; 1218 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 121D _ 83. C4, 20
        add     dword [ebp-2CH], 16                     ; 1220 _ 83. 45, D4, 10
        mov     eax, dword [ebp+20H]                    ; 1224 _ 8B. 45, 20
        movsx   eax, al                                 ; 1227 _ 0F BE. C0
        sub     esp, 8                                  ; 122A _ 83. EC, 08
        push    ?_165                                   ; 122D _ 68, 0000003E(d)
        push    eax                                     ; 1232 _ 50
        push    dword [ebp-2CH]                         ; 1233 _ FF. 75, D4
        push    dword [ebp-30H]                         ; 1236 _ FF. 75, D0
        push    dword [ebp+0CH]                         ; 1239 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 123C _ FF. 75, 08
        call    showString                              ; 123F _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1244 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 1247 _ 8B. 45, 10
        mov     eax, dword [eax]                        ; 124A _ 8B. 00
        sub     esp, 12                                 ; 124C _ 83. EC, 0C
        push    eax                                     ; 124F _ 50
        call    intToHexStr                             ; 1250 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1255 _ 83. C4, 10
        mov     dword [ebp-1CH], eax                    ; 1258 _ 89. 45, E4
        mov     eax, dword [ebp+20H]                    ; 125B _ 8B. 45, 20
        movsx   eax, al                                 ; 125E _ 0F BE. C0
        sub     esp, 8                                  ; 1261 _ 83. EC, 08
        push    dword [ebp-1CH]                         ; 1264 _ FF. 75, E4
        push    eax                                     ; 1267 _ 50
        push    dword [ebp-2CH]                         ; 1268 _ FF. 75, D4
        push    dword [ebp-28H]                         ; 126B _ FF. 75, D8
        push    dword [ebp+0CH]                         ; 126E _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1271 _ FF. 75, 08
        call    showString                              ; 1274 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1279 _ 83. C4, 20
        add     dword [ebp-2CH], 16                     ; 127C _ 83. 45, D4, 10
        mov     eax, dword [ebp+20H]                    ; 1280 _ 8B. 45, 20
        movsx   eax, al                                 ; 1283 _ 0F BE. C0
        sub     esp, 8                                  ; 1286 _ 83. EC, 08
        push    ?_166                                   ; 1289 _ 68, 0000004A(d)
        push    eax                                     ; 128E _ 50
        push    dword [ebp-2CH]                         ; 128F _ FF. 75, D4
        push    dword [ebp-30H]                         ; 1292 _ FF. 75, D0
        push    dword [ebp+0CH]                         ; 1295 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1298 _ FF. 75, 08
        call    showString                              ; 129B _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 12A0 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 12A3 _ 8B. 45, 10
        mov     eax, dword [eax+4H]                     ; 12A6 _ 8B. 40, 04
        sub     esp, 12                                 ; 12A9 _ 83. EC, 0C
        push    eax                                     ; 12AC _ 50
        call    intToHexStr                             ; 12AD _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 12B2 _ 83. C4, 10
        mov     dword [ebp-18H], eax                    ; 12B5 _ 89. 45, E8
        mov     eax, dword [ebp+20H]                    ; 12B8 _ 8B. 45, 20
        movsx   eax, al                                 ; 12BB _ 0F BE. C0
        sub     esp, 8                                  ; 12BE _ 83. EC, 08
        push    dword [ebp-18H]                         ; 12C1 _ FF. 75, E8
        push    eax                                     ; 12C4 _ 50
        push    dword [ebp-2CH]                         ; 12C5 _ FF. 75, D4
        push    dword [ebp-28H]                         ; 12C8 _ FF. 75, D8
        push    dword [ebp+0CH]                         ; 12CB _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 12CE _ FF. 75, 08
        call    showString                              ; 12D1 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 12D6 _ 83. C4, 20
        add     dword [ebp-2CH], 16                     ; 12D9 _ 83. 45, D4, 10
        mov     eax, dword [ebp+20H]                    ; 12DD _ 8B. 45, 20
        movsx   eax, al                                 ; 12E0 _ 0F BE. C0
        sub     esp, 8                                  ; 12E3 _ 83. EC, 08
        push    ?_167                                   ; 12E6 _ 68, 00000056(d)
        push    eax                                     ; 12EB _ 50
        push    dword [ebp-2CH]                         ; 12EC _ FF. 75, D4
        push    dword [ebp-30H]                         ; 12EF _ FF. 75, D0
        push    dword [ebp+0CH]                         ; 12F2 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 12F5 _ FF. 75, 08
        call    showString                              ; 12F8 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 12FD _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 1300 _ 8B. 45, 10
        mov     eax, dword [eax+8H]                     ; 1303 _ 8B. 40, 08
        sub     esp, 12                                 ; 1306 _ 83. EC, 0C
        push    eax                                     ; 1309 _ 50
        call    intToHexStr                             ; 130A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 130F _ 83. C4, 10
        mov     dword [ebp-14H], eax                    ; 1312 _ 89. 45, EC
        mov     eax, dword [ebp+20H]                    ; 1315 _ 8B. 45, 20
        movsx   eax, al                                 ; 1318 _ 0F BE. C0
        sub     esp, 8                                  ; 131B _ 83. EC, 08
        push    dword [ebp-14H]                         ; 131E _ FF. 75, EC
        push    eax                                     ; 1321 _ 50
        push    dword [ebp-2CH]                         ; 1322 _ FF. 75, D4
        push    dword [ebp-28H]                         ; 1325 _ FF. 75, D8
        push    dword [ebp+0CH]                         ; 1328 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 132B _ FF. 75, 08
        call    showString                              ; 132E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1333 _ 83. C4, 20
        add     dword [ebp-2CH], 16                     ; 1336 _ 83. 45, D4, 10
        mov     eax, dword [ebp+20H]                    ; 133A _ 8B. 45, 20
        movsx   eax, al                                 ; 133D _ 0F BE. C0
        sub     esp, 8                                  ; 1340 _ 83. EC, 08
        push    ?_168                                   ; 1343 _ 68, 00000062(d)
        push    eax                                     ; 1348 _ 50
        push    dword [ebp-2CH]                         ; 1349 _ FF. 75, D4
        push    dword [ebp-30H]                         ; 134C _ FF. 75, D0
        push    dword [ebp+0CH]                         ; 134F _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1352 _ FF. 75, 08
        call    showString                              ; 1355 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 135A _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 135D _ 8B. 45, 10
        mov     eax, dword [eax+0CH]                    ; 1360 _ 8B. 40, 0C
        sub     esp, 12                                 ; 1363 _ 83. EC, 0C
        push    eax                                     ; 1366 _ 50
        call    intToHexStr                             ; 1367 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 136C _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 136F _ 89. 45, F0
        mov     eax, dword [ebp+20H]                    ; 1372 _ 8B. 45, 20
        movsx   eax, al                                 ; 1375 _ 0F BE. C0
        sub     esp, 8                                  ; 1378 _ 83. EC, 08
        push    dword [ebp-10H]                         ; 137B _ FF. 75, F0
        push    eax                                     ; 137E _ 50
        push    dword [ebp-2CH]                         ; 137F _ FF. 75, D4
        push    dword [ebp-28H]                         ; 1382 _ FF. 75, D8
        push    dword [ebp+0CH]                         ; 1385 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1388 _ FF. 75, 08
        call    showString                              ; 138B _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1390 _ 83. C4, 20
        add     dword [ebp-2CH], 16                     ; 1393 _ 83. 45, D4, 10
        mov     eax, dword [ebp+20H]                    ; 1397 _ 8B. 45, 20
        movsx   eax, al                                 ; 139A _ 0F BE. C0
        sub     esp, 8                                  ; 139D _ 83. EC, 08
        push    ?_169                                   ; 13A0 _ 68, 0000006F(d)
        push    eax                                     ; 13A5 _ 50
        push    dword [ebp-2CH]                         ; 13A6 _ FF. 75, D4
        push    dword [ebp-30H]                         ; 13A9 _ FF. 75, D0
        push    dword [ebp+0CH]                         ; 13AC _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 13AF _ FF. 75, 08
        call    showString                              ; 13B2 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 13B7 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 13BA _ 8B. 45, 10
        mov     eax, dword [eax+10H]                    ; 13BD _ 8B. 40, 10
        sub     esp, 12                                 ; 13C0 _ 83. EC, 0C
        push    eax                                     ; 13C3 _ 50
        call    intToHexStr                             ; 13C4 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 13C9 _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 13CC _ 89. 45, F4
        mov     eax, dword [ebp+20H]                    ; 13CF _ 8B. 45, 20
        movsx   eax, al                                 ; 13D2 _ 0F BE. C0
        sub     esp, 8                                  ; 13D5 _ 83. EC, 08
        push    dword [ebp-0CH]                         ; 13D8 _ FF. 75, F4
        push    eax                                     ; 13DB _ 50
        push    dword [ebp-2CH]                         ; 13DC _ FF. 75, D4
        push    dword [ebp-28H]                         ; 13DF _ FF. 75, D8
        push    dword [ebp+0CH]                         ; 13E2 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 13E5 _ FF. 75, 08
        call    showString                              ; 13E8 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 13ED _ 83. C4, 20
        nop                                             ; 13F0 _ 90
        leave                                           ; 13F1 _ C9
        ret                                             ; 13F2 _ C3
; showMemoryInfo End of function

init_screen8:; Function begin
        push    ebp                                     ; 13F3 _ 55
        mov     ebp, esp                                ; 13F4 _ 89. E5
        push    ebx                                     ; 13F6 _ 53
        mov     eax, dword [ebp+10H]                    ; 13F7 _ 8B. 45, 10
        lea     edx, [eax-1DH]                          ; 13FA _ 8D. 50, E3
        mov     eax, dword [ebp+0CH]                    ; 13FD _ 8B. 45, 0C
        sub     eax, 1                                  ; 1400 _ 83. E8, 01
        push    edx                                     ; 1403 _ 52
        push    eax                                     ; 1404 _ 50
        push    0                                       ; 1405 _ 6A, 00
        push    0                                       ; 1407 _ 6A, 00
        push    14                                      ; 1409 _ 6A, 0E
        push    dword [ebp+0CH]                         ; 140B _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 140E _ FF. 75, 08
        call    boxfill8                                ; 1411 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1416 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 1419 _ 8B. 45, 10
        lea     ecx, [eax-1CH]                          ; 141C _ 8D. 48, E4
        mov     eax, dword [ebp+0CH]                    ; 141F _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 1422 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 1425 _ 8B. 45, 10
        sub     eax, 28                                 ; 1428 _ 83. E8, 1C
        push    ecx                                     ; 142B _ 51
        push    edx                                     ; 142C _ 52
        push    eax                                     ; 142D _ 50
        push    0                                       ; 142E _ 6A, 00
        push    8                                       ; 1430 _ 6A, 08
        push    dword [ebp+0CH]                         ; 1432 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1435 _ FF. 75, 08
        call    boxfill8                                ; 1438 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 143D _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 1440 _ 8B. 45, 10
        lea     ecx, [eax-1BH]                          ; 1443 _ 8D. 48, E5
        mov     eax, dword [ebp+0CH]                    ; 1446 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 1449 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 144C _ 8B. 45, 10
        sub     eax, 27                                 ; 144F _ 83. E8, 1B
        push    ecx                                     ; 1452 _ 51
        push    edx                                     ; 1453 _ 52
        push    eax                                     ; 1454 _ 50
        push    0                                       ; 1455 _ 6A, 00
        push    7                                       ; 1457 _ 6A, 07
        push    dword [ebp+0CH]                         ; 1459 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 145C _ FF. 75, 08
        call    boxfill8                                ; 145F _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1464 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 1467 _ 8B. 45, 10
        lea     ecx, [eax-1H]                           ; 146A _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 146D _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 1470 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 1473 _ 8B. 45, 10
        sub     eax, 26                                 ; 1476 _ 83. E8, 1A
        push    ecx                                     ; 1479 _ 51
        push    edx                                     ; 147A _ 52
        push    eax                                     ; 147B _ 50
        push    0                                       ; 147C _ 6A, 00
        push    8                                       ; 147E _ 6A, 08
        push    dword [ebp+0CH]                         ; 1480 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1483 _ FF. 75, 08
        call    boxfill8                                ; 1486 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 148B _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 148E _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 1491 _ 8D. 50, E8
        mov     eax, dword [ebp+10H]                    ; 1494 _ 8B. 45, 10
        sub     eax, 24                                 ; 1497 _ 83. E8, 18
        push    edx                                     ; 149A _ 52
        push    59                                      ; 149B _ 6A, 3B
        push    eax                                     ; 149D _ 50
        push    3                                       ; 149E _ 6A, 03
        push    7                                       ; 14A0 _ 6A, 07
        push    dword [ebp+0CH]                         ; 14A2 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 14A5 _ FF. 75, 08
        call    boxfill8                                ; 14A8 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 14AD _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 14B0 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 14B3 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 14B6 _ 8B. 45, 10
        sub     eax, 24                                 ; 14B9 _ 83. E8, 18
        push    edx                                     ; 14BC _ 52
        push    2                                       ; 14BD _ 6A, 02
        push    eax                                     ; 14BF _ 50
        push    2                                       ; 14C0 _ 6A, 02
        push    7                                       ; 14C2 _ 6A, 07
        push    dword [ebp+0CH]                         ; 14C4 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 14C7 _ FF. 75, 08
        call    boxfill8                                ; 14CA _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 14CF _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 14D2 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 14D5 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 14D8 _ 8B. 45, 10
        sub     eax, 4                                  ; 14DB _ 83. E8, 04
        push    edx                                     ; 14DE _ 52
        push    59                                      ; 14DF _ 6A, 3B
        push    eax                                     ; 14E1 _ 50
        push    3                                       ; 14E2 _ 6A, 03
        push    15                                      ; 14E4 _ 6A, 0F
        push    dword [ebp+0CH]                         ; 14E6 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 14E9 _ FF. 75, 08
        call    boxfill8                                ; 14EC _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 14F1 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 14F4 _ 8B. 45, 10
        lea     edx, [eax-5H]                           ; 14F7 _ 8D. 50, FB
        mov     eax, dword [ebp+10H]                    ; 14FA _ 8B. 45, 10
        sub     eax, 23                                 ; 14FD _ 83. E8, 17
        push    edx                                     ; 1500 _ 52
        push    59                                      ; 1501 _ 6A, 3B
        push    eax                                     ; 1503 _ 50
        push    59                                      ; 1504 _ 6A, 3B
        push    15                                      ; 1506 _ 6A, 0F
        push    dword [ebp+0CH]                         ; 1508 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 150B _ FF. 75, 08
        call    boxfill8                                ; 150E _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1513 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 1516 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 1519 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 151C _ 8B. 45, 10
        sub     eax, 3                                  ; 151F _ 83. E8, 03
        push    edx                                     ; 1522 _ 52
        push    59                                      ; 1523 _ 6A, 3B
        push    eax                                     ; 1525 _ 50
        push    2                                       ; 1526 _ 6A, 02
        push    0                                       ; 1528 _ 6A, 00
        push    dword [ebp+0CH]                         ; 152A _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 152D _ FF. 75, 08
        call    boxfill8                                ; 1530 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1535 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 1538 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 153B _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 153E _ 8B. 45, 10
        sub     eax, 24                                 ; 1541 _ 83. E8, 18
        push    edx                                     ; 1544 _ 52
        push    60                                      ; 1545 _ 6A, 3C
        push    eax                                     ; 1547 _ 50
        push    60                                      ; 1548 _ 6A, 3C
        push    0                                       ; 154A _ 6A, 00
        push    dword [ebp+0CH]                         ; 154C _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 154F _ FF. 75, 08
        call    boxfill8                                ; 1552 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1557 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 155A _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 155D _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 1560 _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 1563 _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 1566 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 1569 _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 156C _ 8B. 45, 0C
        sub     eax, 47                                 ; 156F _ 83. E8, 2F
        push    ebx                                     ; 1572 _ 53
        push    ecx                                     ; 1573 _ 51
        push    edx                                     ; 1574 _ 52
        push    eax                                     ; 1575 _ 50
        push    7                                       ; 1576 _ 6A, 07
        push    dword [ebp+0CH]                         ; 1578 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 157B _ FF. 75, 08
        call    boxfill8                                ; 157E _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1583 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 1586 _ 8B. 45, 10
        lea     ebx, [eax-4H]                           ; 1589 _ 8D. 58, FC
        mov     eax, dword [ebp+0CH]                    ; 158C _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 158F _ 8D. 48, FD
        mov     eax, dword [ebp+10H]                    ; 1592 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 1595 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 1598 _ 8B. 45, 0C
        sub     eax, 3                                  ; 159B _ 83. E8, 03
        push    ebx                                     ; 159E _ 53
        push    ecx                                     ; 159F _ 51
        push    edx                                     ; 15A0 _ 52
        push    eax                                     ; 15A1 _ 50
        push    7                                       ; 15A2 _ 6A, 07
        push    dword [ebp+0CH]                         ; 15A4 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 15A7 _ FF. 75, 08
        call    boxfill8                                ; 15AA _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 15AF _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 15B2 _ 8B. 45, 10
        lea     ebx, [eax-18H]                          ; 15B5 _ 8D. 58, E8
        mov     eax, dword [ebp+0CH]                    ; 15B8 _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 15BB _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 15BE _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 15C1 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 15C4 _ 8B. 45, 0C
        sub     eax, 47                                 ; 15C7 _ 83. E8, 2F
        push    ebx                                     ; 15CA _ 53
        push    ecx                                     ; 15CB _ 51
        push    edx                                     ; 15CC _ 52
        push    eax                                     ; 15CD _ 50
        push    15                                      ; 15CE _ 6A, 0F
        push    dword [ebp+0CH]                         ; 15D0 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 15D3 _ FF. 75, 08
        call    boxfill8                                ; 15D6 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 15DB _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 15DE _ 8B. 45, 10
        lea     ebx, [eax-4H]                           ; 15E1 _ 8D. 58, FC
        mov     eax, dword [ebp+0CH]                    ; 15E4 _ 8B. 45, 0C
        lea     ecx, [eax-2FH]                          ; 15E7 _ 8D. 48, D1
        mov     eax, dword [ebp+10H]                    ; 15EA _ 8B. 45, 10
        lea     edx, [eax-17H]                          ; 15ED _ 8D. 50, E9
        mov     eax, dword [ebp+0CH]                    ; 15F0 _ 8B. 45, 0C
        sub     eax, 47                                 ; 15F3 _ 83. E8, 2F
        push    ebx                                     ; 15F6 _ 53
        push    ecx                                     ; 15F7 _ 51
        push    edx                                     ; 15F8 _ 52
        push    eax                                     ; 15F9 _ 50
        push    15                                      ; 15FA _ 6A, 0F
        push    dword [ebp+0CH]                         ; 15FC _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 15FF _ FF. 75, 08
        call    boxfill8                                ; 1602 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1607 _ 83. C4, 1C
        nop                                             ; 160A _ 90
        mov     ebx, dword [ebp-4H]                     ; 160B _ 8B. 5D, FC
        leave                                           ; 160E _ C9
        ret                                             ; 160F _ C3
; init_screen8 End of function

make_window8:; Function begin
        push    ebp                                     ; 1610 _ 55
        mov     ebp, esp                                ; 1611 _ 89. E5
        push    ebx                                     ; 1613 _ 53
        sub     esp, 36                                 ; 1614 _ 83. EC, 24
        mov     eax, dword [ebp+0CH]                    ; 1617 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 161A _ 8B. 40, 04
        mov     dword [ebp-10H], eax                    ; 161D _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 1620 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 1623 _ 8B. 40, 08
        mov     dword [ebp-0CH], eax                    ; 1626 _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 1629 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 162C _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 162F _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1632 _ 8B. 00
        push    0                                       ; 1634 _ 6A, 00
        push    edx                                     ; 1636 _ 52
        push    0                                       ; 1637 _ 6A, 00
        push    0                                       ; 1639 _ 6A, 00
        push    8                                       ; 163B _ 6A, 08
        push    dword [ebp-10H]                         ; 163D _ FF. 75, F0
        push    eax                                     ; 1640 _ 50
        call    boxfill8                                ; 1641 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1646 _ 83. C4, 1C
        mov     eax, dword [ebp-10H]                    ; 1649 _ 8B. 45, F0
        lea     edx, [eax-2H]                           ; 164C _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 164F _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1652 _ 8B. 00
        push    1                                       ; 1654 _ 6A, 01
        push    edx                                     ; 1656 _ 52
        push    1                                       ; 1657 _ 6A, 01
        push    1                                       ; 1659 _ 6A, 01
        push    7                                       ; 165B _ 6A, 07
        push    dword [ebp-10H]                         ; 165D _ FF. 75, F0
        push    eax                                     ; 1660 _ 50
        call    boxfill8                                ; 1661 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1666 _ 83. C4, 1C
        mov     eax, dword [ebp-0CH]                    ; 1669 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 166C _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 166F _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1672 _ 8B. 00
        push    edx                                     ; 1674 _ 52
        push    0                                       ; 1675 _ 6A, 00
        push    0                                       ; 1677 _ 6A, 00
        push    0                                       ; 1679 _ 6A, 00
        push    8                                       ; 167B _ 6A, 08
        push    dword [ebp-10H]                         ; 167D _ FF. 75, F0
        push    eax                                     ; 1680 _ 50
        call    boxfill8                                ; 1681 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1686 _ 83. C4, 1C
        mov     eax, dword [ebp-0CH]                    ; 1689 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 168C _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 168F _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1692 _ 8B. 00
        push    edx                                     ; 1694 _ 52
        push    1                                       ; 1695 _ 6A, 01
        push    1                                       ; 1697 _ 6A, 01
        push    1                                       ; 1699 _ 6A, 01
        push    8                                       ; 169B _ 6A, 08
        push    dword [ebp-10H]                         ; 169D _ FF. 75, F0
        push    eax                                     ; 16A0 _ 50
        call    boxfill8                                ; 16A1 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 16A6 _ 83. C4, 1C
        mov     eax, dword [ebp-0CH]                    ; 16A9 _ 8B. 45, F4
        lea     ebx, [eax-2H]                           ; 16AC _ 8D. 58, FE
        mov     eax, dword [ebp-10H]                    ; 16AF _ 8B. 45, F0
        lea     ecx, [eax-2H]                           ; 16B2 _ 8D. 48, FE
        mov     eax, dword [ebp-10H]                    ; 16B5 _ 8B. 45, F0
        lea     edx, [eax-2H]                           ; 16B8 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 16BB _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 16BE _ 8B. 00
        push    ebx                                     ; 16C0 _ 53
        push    ecx                                     ; 16C1 _ 51
        push    1                                       ; 16C2 _ 6A, 01
        push    edx                                     ; 16C4 _ 52
        push    15                                      ; 16C5 _ 6A, 0F
        push    dword [ebp-10H]                         ; 16C7 _ FF. 75, F0
        push    eax                                     ; 16CA _ 50
        call    boxfill8                                ; 16CB _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 16D0 _ 83. C4, 1C
        mov     eax, dword [ebp-0CH]                    ; 16D3 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 16D6 _ 8D. 58, FF
        mov     eax, dword [ebp-10H]                    ; 16D9 _ 8B. 45, F0
        lea     ecx, [eax-1H]                           ; 16DC _ 8D. 48, FF
        mov     eax, dword [ebp-10H]                    ; 16DF _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 16E2 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 16E5 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 16E8 _ 8B. 00
        push    ebx                                     ; 16EA _ 53
        push    ecx                                     ; 16EB _ 51
        push    0                                       ; 16EC _ 6A, 00
        push    edx                                     ; 16EE _ 52
        push    0                                       ; 16EF _ 6A, 00
        push    dword [ebp-10H]                         ; 16F1 _ FF. 75, F0
        push    eax                                     ; 16F4 _ 50
        call    boxfill8                                ; 16F5 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 16FA _ 83. C4, 1C
        mov     eax, dword [ebp-0CH]                    ; 16FD _ 8B. 45, F4
        lea     ecx, [eax-3H]                           ; 1700 _ 8D. 48, FD
        mov     eax, dword [ebp-10H]                    ; 1703 _ 8B. 45, F0
        lea     edx, [eax-3H]                           ; 1706 _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 1709 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 170C _ 8B. 00
        push    ecx                                     ; 170E _ 51
        push    edx                                     ; 170F _ 52
        push    2                                       ; 1710 _ 6A, 02
        push    2                                       ; 1712 _ 6A, 02
        push    8                                       ; 1714 _ 6A, 08
        push    dword [ebp-10H]                         ; 1716 _ FF. 75, F0
        push    eax                                     ; 1719 _ 50
        call    boxfill8                                ; 171A _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 171F _ 83. C4, 1C
        mov     eax, dword [ebp-10H]                    ; 1722 _ 8B. 45, F0
        lea     edx, [eax-4H]                           ; 1725 _ 8D. 50, FC
        mov     eax, dword [ebp+0CH]                    ; 1728 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 172B _ 8B. 00
        push    20                                      ; 172D _ 6A, 14
        push    edx                                     ; 172F _ 52
        push    3                                       ; 1730 _ 6A, 03
        push    3                                       ; 1732 _ 6A, 03
        push    12                                      ; 1734 _ 6A, 0C
        push    dword [ebp-10H]                         ; 1736 _ FF. 75, F0
        push    eax                                     ; 1739 _ 50
        call    boxfill8                                ; 173A _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 173F _ 83. C4, 1C
        mov     eax, dword [ebp-0CH]                    ; 1742 _ 8B. 45, F4
        lea     ebx, [eax-2H]                           ; 1745 _ 8D. 58, FE
        mov     eax, dword [ebp-10H]                    ; 1748 _ 8B. 45, F0
        lea     ecx, [eax-2H]                           ; 174B _ 8D. 48, FE
        mov     eax, dword [ebp-0CH]                    ; 174E _ 8B. 45, F4
        lea     edx, [eax-2H]                           ; 1751 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 1754 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1757 _ 8B. 00
        push    ebx                                     ; 1759 _ 53
        push    ecx                                     ; 175A _ 51
        push    edx                                     ; 175B _ 52
        push    1                                       ; 175C _ 6A, 01
        push    15                                      ; 175E _ 6A, 0F
        push    dword [ebp-10H]                         ; 1760 _ FF. 75, F0
        push    eax                                     ; 1763 _ 50
        call    boxfill8                                ; 1764 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1769 _ 83. C4, 1C
        mov     eax, dword [ebp-0CH]                    ; 176C _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 176F _ 8D. 58, FF
        mov     eax, dword [ebp-10H]                    ; 1772 _ 8B. 45, F0
        lea     ecx, [eax-1H]                           ; 1775 _ 8D. 48, FF
        mov     eax, dword [ebp-0CH]                    ; 1778 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 177B _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 177E _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1781 _ 8B. 00
        push    ebx                                     ; 1783 _ 53
        push    ecx                                     ; 1784 _ 51
        push    edx                                     ; 1785 _ 52
        push    0                                       ; 1786 _ 6A, 00
        push    0                                       ; 1788 _ 6A, 00
        push    dword [ebp-10H]                         ; 178A _ FF. 75, F0
        push    eax                                     ; 178D _ 50
        call    boxfill8                                ; 178E _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1793 _ 83. C4, 1C
        sub     esp, 8                                  ; 1796 _ 83. EC, 08
        push    dword [ebp+10H]                         ; 1799 _ FF. 75, 10
        push    7                                       ; 179C _ 6A, 07
        push    4                                       ; 179E _ 6A, 04
        push    24                                      ; 17A0 _ 6A, 18
        push    dword [ebp+0CH]                         ; 17A2 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 17A5 _ FF. 75, 08
        call    showString                              ; 17A8 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 17AD _ 83. C4, 20
        mov     dword [ebp-14H], 0                      ; 17B0 _ C7. 45, EC, 00000000
        jmp     ?_073                                   ; 17B7 _ E9, 00000083

?_066:  mov     dword [ebp-18H], 0                      ; 17BC _ C7. 45, E8, 00000000
        jmp     ?_072                                   ; 17C3 _ EB, 70

?_067:  mov     eax, dword [ebp-14H]                    ; 17C5 _ 8B. 45, EC
        shl     eax, 4                                  ; 17C8 _ C1. E0, 04
        mov     edx, eax                                ; 17CB _ 89. C2
        mov     eax, dword [ebp-18H]                    ; 17CD _ 8B. 45, E8
        add     eax, edx                                ; 17D0 _ 01. D0
        add     eax, closebtn.1934                      ; 17D2 _ 05, 000001C0(d)
        movzx   eax, byte [eax]                         ; 17D7 _ 0F B6. 00
        mov     byte [ebp-19H], al                      ; 17DA _ 88. 45, E7
        cmp     byte [ebp-19H], 64                      ; 17DD _ 80. 7D, E7, 40
        jnz     ?_068                                   ; 17E1 _ 75, 06
        mov     byte [ebp-19H], 0                       ; 17E3 _ C6. 45, E7, 00
        jmp     ?_071                                   ; 17E7 _ EB, 1C

?_068:  cmp     byte [ebp-19H], 36                      ; 17E9 _ 80. 7D, E7, 24
        jnz     ?_069                                   ; 17ED _ 75, 06
        mov     byte [ebp-19H], 15                      ; 17EF _ C6. 45, E7, 0F
        jmp     ?_071                                   ; 17F3 _ EB, 10

?_069:  cmp     byte [ebp-19H], 81                      ; 17F5 _ 80. 7D, E7, 51
        jnz     ?_070                                   ; 17F9 _ 75, 06
        mov     byte [ebp-19H], 8                       ; 17FB _ C6. 45, E7, 08
        jmp     ?_071                                   ; 17FF _ EB, 04

?_070:  mov     byte [ebp-19H], 7                       ; 1801 _ C6. 45, E7, 07
?_071:  mov     eax, dword [ebp+0CH]                    ; 1805 _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 1808 _ 8B. 10
        mov     eax, dword [ebp-14H]                    ; 180A _ 8B. 45, EC
        lea     ecx, [eax+5H]                           ; 180D _ 8D. 48, 05
        mov     eax, dword [ebp+0CH]                    ; 1810 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1813 _ 8B. 40, 04
        imul    ecx, eax                                ; 1816 _ 0F AF. C8
        mov     eax, dword [ebp+0CH]                    ; 1819 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 181C _ 8B. 40, 04
        lea     ebx, [eax-15H]                          ; 181F _ 8D. 58, EB
        mov     eax, dword [ebp-18H]                    ; 1822 _ 8B. 45, E8
        add     eax, ebx                                ; 1825 _ 01. D8
        add     eax, ecx                                ; 1827 _ 01. C8
        add     edx, eax                                ; 1829 _ 01. C2
        movzx   eax, byte [ebp-19H]                     ; 182B _ 0F B6. 45, E7
        mov     byte [edx], al                          ; 182F _ 88. 02
        add     dword [ebp-18H], 1                      ; 1831 _ 83. 45, E8, 01
?_072:  cmp     dword [ebp-18H], 15                     ; 1835 _ 83. 7D, E8, 0F
        jle     ?_067                                   ; 1839 _ 7E, 8A
        add     dword [ebp-14H], 1                      ; 183B _ 83. 45, EC, 01
?_073:  cmp     dword [ebp-14H], 13                     ; 183F _ 83. 7D, EC, 0D
        jle     ?_066                                   ; 1843 _ 0F 8E, FFFFFF73
        nop                                             ; 1849 _ 90
        mov     ebx, dword [ebp-4H]                     ; 184A _ 8B. 5D, FC
        leave                                           ; 184D _ C9
        ret                                             ; 184E _ C3
; make_window8 End of function

intHandlerFromTimer:; Function begin
        push    ebp                                     ; 184F _ 55
        mov     ebp, esp                                ; 1850 _ 89. E5
        sub     esp, 24                                 ; 1852 _ 83. EC, 18
        sub     esp, 8                                  ; 1855 _ 83. EC, 08
        push    96                                      ; 1858 _ 6A, 60
        push    32                                      ; 185A _ 6A, 20
        call    io_out8                                 ; 185C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1861 _ 83. C4, 10
        mov     eax, dword [timerctl]                   ; 1864 _ A1, 00000208(d)
        mov     edx, dword [eax]                        ; 1869 _ 8B. 10
        add     edx, 1                                  ; 186B _ 83. C2, 01
        mov     dword [eax], edx                        ; 186E _ 89. 10
        mov     dword [ebp-0CH], 0                      ; 1870 _ C7. 45, F4, 00000000
        jmp     ?_076                                   ; 1877 _ E9, 00000088

?_074:  mov     eax, dword [timerctl]                   ; 187C _ A1, 00000208(d)
        mov     edx, dword [ebp-0CH]                    ; 1881 _ 8B. 55, F4
        shl     edx, 4                                  ; 1884 _ C1. E2, 04
        add     eax, edx                                ; 1887 _ 01. D0
        add     eax, 4                                  ; 1889 _ 83. C0, 04
        mov     eax, dword [eax]                        ; 188C _ 8B. 00
        cmp     eax, 2                                  ; 188E _ 83. F8, 02
        jnz     ?_075                                   ; 1891 _ 75, 6D
        mov     eax, dword [timerctl]                   ; 1893 _ A1, 00000208(d)
        mov     edx, dword [ebp-0CH]                    ; 1898 _ 8B. 55, F4
        shl     edx, 4                                  ; 189B _ C1. E2, 04
        add     edx, eax                                ; 189E _ 01. C2
        add     edx, 8                                  ; 18A0 _ 83. C2, 08
        mov     edx, dword [edx]                        ; 18A3 _ 8B. 12
        sub     edx, 1                                  ; 18A5 _ 83. EA, 01
        mov     ecx, dword [ebp-0CH]                    ; 18A8 _ 8B. 4D, F4
        shl     ecx, 4                                  ; 18AB _ C1. E1, 04
        add     eax, ecx                                ; 18AE _ 01. C8
        add     eax, 8                                  ; 18B0 _ 83. C0, 08
        mov     dword [eax], edx                        ; 18B3 _ 89. 10
        mov     eax, dword [timerctl]                   ; 18B5 _ A1, 00000208(d)
        mov     edx, dword [ebp-0CH]                    ; 18BA _ 8B. 55, F4
        shl     edx, 4                                  ; 18BD _ C1. E2, 04
        add     eax, edx                                ; 18C0 _ 01. D0
        add     eax, 8                                  ; 18C2 _ 83. C0, 08
        mov     eax, dword [eax]                        ; 18C5 _ 8B. 00
        test    eax, eax                                ; 18C7 _ 85. C0
        jnz     ?_075                                   ; 18C9 _ 75, 35
        mov     eax, dword [timerctl]                   ; 18CB _ A1, 00000208(d)
        mov     edx, dword [ebp-0CH]                    ; 18D0 _ 8B. 55, F4
        shl     edx, 4                                  ; 18D3 _ C1. E2, 04
        add     eax, edx                                ; 18D6 _ 01. D0
        add     eax, 16                                 ; 18D8 _ 83. C0, 10
        movzx   eax, byte [eax]                         ; 18DB _ 0F B6. 00
        movzx   edx, al                                 ; 18DE _ 0F B6. D0
        mov     eax, dword [timerctl]                   ; 18E1 _ A1, 00000208(d)
        mov     ecx, dword [ebp-0CH]                    ; 18E6 _ 8B. 4D, F4
        shl     ecx, 4                                  ; 18E9 _ C1. E1, 04
        add     eax, ecx                                ; 18EC _ 01. C8
        add     eax, 12                                 ; 18EE _ 83. C0, 0C
        mov     eax, dword [eax]                        ; 18F1 _ 8B. 00
        sub     esp, 8                                  ; 18F3 _ 83. EC, 08
        push    edx                                     ; 18F6 _ 52
        push    eax                                     ; 18F7 _ 50
        call    fifo8_put                               ; 18F8 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 18FD _ 83. C4, 10
?_075:  add     dword [ebp-0CH], 1                      ; 1900 _ 83. 45, F4, 01
?_076:  cmp     dword [ebp-0CH], 499                    ; 1904 _ 81. 7D, F4, 000001F3
        jle     ?_074                                   ; 190B _ 0F 8E, FFFFFF6B
        nop                                             ; 1911 _ 90
        leave                                           ; 1912 _ C9
        ret                                             ; 1913 _ C3
; intHandlerFromTimer End of function

make_textbox8:; Function begin
        push    ebp                                     ; 1914 _ 55
        mov     ebp, esp                                ; 1915 _ 89. E5
        push    edi                                     ; 1917 _ 57
        push    esi                                     ; 1918 _ 56
        push    ebx                                     ; 1919 _ 53
        sub     esp, 16                                 ; 191A _ 83. EC, 10
        mov     edx, dword [ebp+0CH]                    ; 191D _ 8B. 55, 0C
        mov     eax, dword [ebp+14H]                    ; 1920 _ 8B. 45, 14
        add     eax, edx                                ; 1923 _ 01. D0
        mov     dword [ebp-14H], eax                    ; 1925 _ 89. 45, EC
        mov     edx, dword [ebp+10H]                    ; 1928 _ 8B. 55, 10
        mov     eax, dword [ebp+18H]                    ; 192B _ 8B. 45, 18
        add     eax, edx                                ; 192E _ 01. D0
        mov     dword [ebp-10H], eax                    ; 1930 _ 89. 45, F0
        mov     eax, dword [ebp+10H]                    ; 1933 _ 8B. 45, 10
        lea     edi, [eax-3H]                           ; 1936 _ 8D. 78, FD
        mov     eax, dword [ebp-14H]                    ; 1939 _ 8B. 45, EC
        lea     esi, [eax+1H]                           ; 193C _ 8D. 70, 01
        mov     eax, dword [ebp+10H]                    ; 193F _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 1942 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 1945 _ 8B. 45, 0C
        lea     ecx, [eax-2H]                           ; 1948 _ 8D. 48, FE
        mov     eax, dword [ebp+8H]                     ; 194B _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 194E _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1951 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1954 _ 8B. 00
        push    edi                                     ; 1956 _ 57
        push    esi                                     ; 1957 _ 56
        push    ebx                                     ; 1958 _ 53
        push    ecx                                     ; 1959 _ 51
        push    15                                      ; 195A _ 6A, 0F
        push    edx                                     ; 195C _ 52
        push    eax                                     ; 195D _ 50
        call    boxfill8                                ; 195E _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1963 _ 83. C4, 1C
        mov     eax, dword [ebp-10H]                    ; 1966 _ 8B. 45, F0
        lea     edi, [eax+1H]                           ; 1969 _ 8D. 78, 01
        mov     eax, dword [ebp+0CH]                    ; 196C _ 8B. 45, 0C
        lea     esi, [eax-3H]                           ; 196F _ 8D. 70, FD
        mov     eax, dword [ebp+10H]                    ; 1972 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 1975 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 1978 _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 197B _ 8D. 48, FD
        mov     eax, dword [ebp+8H]                     ; 197E _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1981 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1984 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1987 _ 8B. 00
        push    edi                                     ; 1989 _ 57
        push    esi                                     ; 198A _ 56
        push    ebx                                     ; 198B _ 53
        push    ecx                                     ; 198C _ 51
        push    15                                      ; 198D _ 6A, 0F
        push    edx                                     ; 198F _ 52
        push    eax                                     ; 1990 _ 50
        call    boxfill8                                ; 1991 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1996 _ 83. C4, 1C
        mov     eax, dword [ebp-10H]                    ; 1999 _ 8B. 45, F0
        lea     edi, [eax+2H]                           ; 199C _ 8D. 78, 02
        mov     eax, dword [ebp-14H]                    ; 199F _ 8B. 45, EC
        lea     esi, [eax+1H]                           ; 19A2 _ 8D. 70, 01
        mov     eax, dword [ebp-10H]                    ; 19A5 _ 8B. 45, F0
        lea     ebx, [eax+2H]                           ; 19A8 _ 8D. 58, 02
        mov     eax, dword [ebp+0CH]                    ; 19AB _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 19AE _ 8D. 48, FD
        mov     eax, dword [ebp+8H]                     ; 19B1 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 19B4 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 19B7 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 19BA _ 8B. 00
        push    edi                                     ; 19BC _ 57
        push    esi                                     ; 19BD _ 56
        push    ebx                                     ; 19BE _ 53
        push    ecx                                     ; 19BF _ 51
        push    7                                       ; 19C0 _ 6A, 07
        push    edx                                     ; 19C2 _ 52
        push    eax                                     ; 19C3 _ 50
        call    boxfill8                                ; 19C4 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 19C9 _ 83. C4, 1C
        mov     eax, dword [ebp-10H]                    ; 19CC _ 8B. 45, F0
        lea     edi, [eax+2H]                           ; 19CF _ 8D. 78, 02
        mov     eax, dword [ebp-14H]                    ; 19D2 _ 8B. 45, EC
        lea     esi, [eax+2H]                           ; 19D5 _ 8D. 70, 02
        mov     eax, dword [ebp+10H]                    ; 19D8 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 19DB _ 8D. 58, FD
        mov     eax, dword [ebp-14H]                    ; 19DE _ 8B. 45, EC
        lea     ecx, [eax+2H]                           ; 19E1 _ 8D. 48, 02
        mov     eax, dword [ebp+8H]                     ; 19E4 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 19E7 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 19EA _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 19ED _ 8B. 00
        push    edi                                     ; 19EF _ 57
        push    esi                                     ; 19F0 _ 56
        push    ebx                                     ; 19F1 _ 53
        push    ecx                                     ; 19F2 _ 51
        push    7                                       ; 19F3 _ 6A, 07
        push    edx                                     ; 19F5 _ 52
        push    eax                                     ; 19F6 _ 50
        call    boxfill8                                ; 19F7 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 19FC _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 19FF _ 8B. 45, 10
        lea     esi, [eax-2H]                           ; 1A02 _ 8D. 70, FE
        mov     eax, dword [ebp+10H]                    ; 1A05 _ 8B. 45, 10
        lea     ebx, [eax-2H]                           ; 1A08 _ 8D. 58, FE
        mov     eax, dword [ebp+0CH]                    ; 1A0B _ 8B. 45, 0C
        lea     ecx, [eax-1H]                           ; 1A0E _ 8D. 48, FF
        mov     eax, dword [ebp+8H]                     ; 1A11 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1A14 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1A17 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1A1A _ 8B. 00
        push    esi                                     ; 1A1C _ 56
        push    dword [ebp-14H]                         ; 1A1D _ FF. 75, EC
        push    ebx                                     ; 1A20 _ 53
        push    ecx                                     ; 1A21 _ 51
        push    0                                       ; 1A22 _ 6A, 00
        push    edx                                     ; 1A24 _ 52
        push    eax                                     ; 1A25 _ 50
        call    boxfill8                                ; 1A26 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1A2B _ 83. C4, 1C
        mov     eax, dword [ebp+0CH]                    ; 1A2E _ 8B. 45, 0C
        lea     esi, [eax-2H]                           ; 1A31 _ 8D. 70, FE
        mov     eax, dword [ebp+10H]                    ; 1A34 _ 8B. 45, 10
        lea     ebx, [eax-2H]                           ; 1A37 _ 8D. 58, FE
        mov     eax, dword [ebp+0CH]                    ; 1A3A _ 8B. 45, 0C
        lea     ecx, [eax-2H]                           ; 1A3D _ 8D. 48, FE
        mov     eax, dword [ebp+8H]                     ; 1A40 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1A43 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1A46 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1A49 _ 8B. 00
        push    dword [ebp-10H]                         ; 1A4B _ FF. 75, F0
        push    esi                                     ; 1A4E _ 56
        push    ebx                                     ; 1A4F _ 53
        push    ecx                                     ; 1A50 _ 51
        push    0                                       ; 1A51 _ 6A, 00
        push    edx                                     ; 1A53 _ 52
        push    eax                                     ; 1A54 _ 50
        call    boxfill8                                ; 1A55 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1A5A _ 83. C4, 1C
        mov     eax, dword [ebp-10H]                    ; 1A5D _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 1A60 _ 8D. 70, 01
        mov     eax, dword [ebp-10H]                    ; 1A63 _ 8B. 45, F0
        lea     ebx, [eax+1H]                           ; 1A66 _ 8D. 58, 01
        mov     eax, dword [ebp+0CH]                    ; 1A69 _ 8B. 45, 0C
        lea     ecx, [eax-2H]                           ; 1A6C _ 8D. 48, FE
        mov     eax, dword [ebp+8H]                     ; 1A6F _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1A72 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1A75 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1A78 _ 8B. 00
        push    esi                                     ; 1A7A _ 56
        push    dword [ebp-14H]                         ; 1A7B _ FF. 75, EC
        push    ebx                                     ; 1A7E _ 53
        push    ecx                                     ; 1A7F _ 51
        push    8                                       ; 1A80 _ 6A, 08
        push    edx                                     ; 1A82 _ 52
        push    eax                                     ; 1A83 _ 50
        call    boxfill8                                ; 1A84 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1A89 _ 83. C4, 1C
        mov     eax, dword [ebp-10H]                    ; 1A8C _ 8B. 45, F0
        lea     edi, [eax+1H]                           ; 1A8F _ 8D. 78, 01
        mov     eax, dword [ebp-14H]                    ; 1A92 _ 8B. 45, EC
        lea     esi, [eax+1H]                           ; 1A95 _ 8D. 70, 01
        mov     eax, dword [ebp+10H]                    ; 1A98 _ 8B. 45, 10
        lea     ebx, [eax-2H]                           ; 1A9B _ 8D. 58, FE
        mov     eax, dword [ebp-14H]                    ; 1A9E _ 8B. 45, EC
        lea     ecx, [eax+1H]                           ; 1AA1 _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 1AA4 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1AA7 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1AAA _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1AAD _ 8B. 00
        push    edi                                     ; 1AAF _ 57
        push    esi                                     ; 1AB0 _ 56
        push    ebx                                     ; 1AB1 _ 53
        push    ecx                                     ; 1AB2 _ 51
        push    8                                       ; 1AB3 _ 6A, 08
        push    edx                                     ; 1AB5 _ 52
        push    eax                                     ; 1AB6 _ 50
        call    boxfill8                                ; 1AB7 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1ABC _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 1ABF _ 8B. 45, 10
        lea     esi, [eax-1H]                           ; 1AC2 _ 8D. 70, FF
        mov     eax, dword [ebp+0CH]                    ; 1AC5 _ 8B. 45, 0C
        lea     ebx, [eax-1H]                           ; 1AC8 _ 8D. 58, FF
        mov     eax, dword [ebp+1CH]                    ; 1ACB _ 8B. 45, 1C
        movzx   ecx, al                                 ; 1ACE _ 0F B6. C8
        mov     eax, dword [ebp+8H]                     ; 1AD1 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1AD4 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1AD7 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1ADA _ 8B. 00
        push    dword [ebp-10H]                         ; 1ADC _ FF. 75, F0
        push    dword [ebp-14H]                         ; 1ADF _ FF. 75, EC
        push    esi                                     ; 1AE2 _ 56
        push    ebx                                     ; 1AE3 _ 53
        push    ecx                                     ; 1AE4 _ 51
        push    edx                                     ; 1AE5 _ 52
        push    eax                                     ; 1AE6 _ 50
        call    boxfill8                                ; 1AE7 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1AEC _ 83. C4, 1C
        nop                                             ; 1AEF _ 90
        lea     esp, [ebp-0CH]                          ; 1AF0 _ 8D. 65, F4
        pop     ebx                                     ; 1AF3 _ 5B
        pop     esi                                     ; 1AF4 _ 5E
        pop     edi                                     ; 1AF5 _ 5F
        pop     ebp                                     ; 1AF6 _ 5D
        ret                                             ; 1AF7 _ C3
; make_textbox8 End of function

message_box:; Function begin
        push    ebp                                     ; 1AF8 _ 55
        mov     ebp, esp                                ; 1AF9 _ 89. E5
        sub     esp, 24                                 ; 1AFB _ 83. EC, 18
        sub     esp, 12                                 ; 1AFE _ 83. EC, 0C
        push    dword [ebp+8H]                          ; 1B01 _ FF. 75, 08
        call    sheet_alloc                             ; 1B04 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1B09 _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 1B0C _ 89. 45, F0
        mov     eax, dword [memman]                     ; 1B0F _ A1, 00000008(d)
        sub     esp, 8                                  ; 1B14 _ 83. EC, 08
        push    10880                                   ; 1B17 _ 68, 00002A80
        push    eax                                     ; 1B1C _ 50
        call    memman_alloc_4k                         ; 1B1D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1B22 _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 1B25 _ 89. 45, F4
        sub     esp, 12                                 ; 1B28 _ 83. EC, 0C
        push    -1                                      ; 1B2B _ 6A, FF
        push    68                                      ; 1B2D _ 6A, 44
        push    160                                     ; 1B2F _ 68, 000000A0
        push    dword [ebp-0CH]                         ; 1B34 _ FF. 75, F4
        push    dword [ebp-10H]                         ; 1B37 _ FF. 75, F0
        call    sheet_setbuf                            ; 1B3A _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1B3F _ 83. C4, 20
        sub     esp, 4                                  ; 1B42 _ 83. EC, 04
        push    dword [ebp+0CH]                         ; 1B45 _ FF. 75, 0C
        push    dword [ebp-10H]                         ; 1B48 _ FF. 75, F0
        push    dword [ebp+8H]                          ; 1B4B _ FF. 75, 08
        call    make_window8                            ; 1B4E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1B53 _ 83. C4, 10
        sub     esp, 8                                  ; 1B56 _ 83. EC, 08
        push    7                                       ; 1B59 _ 6A, 07
        push    16                                      ; 1B5B _ 6A, 10
        push    144                                     ; 1B5D _ 68, 00000090
        push    28                                      ; 1B62 _ 6A, 1C
        push    8                                       ; 1B64 _ 6A, 08
        push    dword [ebp-10H]                         ; 1B66 _ FF. 75, F0
        call    make_textbox8                           ; 1B69 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1B6E _ 83. C4, 20
        push    72                                      ; 1B71 _ 6A, 48
        push    80                                      ; 1B73 _ 6A, 50
        push    dword [ebp-10H]                         ; 1B75 _ FF. 75, F0
        push    dword [ebp+8H]                          ; 1B78 _ FF. 75, 08
        call    sheet_slide                             ; 1B7B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1B80 _ 83. C4, 10
        sub     esp, 4                                  ; 1B83 _ 83. EC, 04
        push    1                                       ; 1B86 _ 6A, 01
        push    dword [ebp-10H]                         ; 1B88 _ FF. 75, F0
        push    dword [ebp+8H]                          ; 1B8B _ FF. 75, 08
        call    sheet_updown                            ; 1B8E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1B93 _ 83. C4, 10
        mov     eax, dword [ebp-10H]                    ; 1B96 _ 8B. 45, F0
        leave                                           ; 1B99 _ C9
        ret                                             ; 1B9A _ C3
; message_box End of function

memman_init:; Function begin
        push    ebp                                     ; 1B9B _ 55
        mov     ebp, esp                                ; 1B9C _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 1B9E _ 8B. 45, 08
        mov     dword [eax], 0                          ; 1BA1 _ C7. 00, 00000000
        mov     eax, dword [ebp+8H]                     ; 1BA7 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 1BAA _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 1BB1 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 1BB4 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 1BBB _ 8B. 45, 08
        mov     dword [eax+0CH], 0                      ; 1BBE _ C7. 40, 0C, 00000000
        nop                                             ; 1BC5 _ 90
        pop     ebp                                     ; 1BC6 _ 5D
        ret                                             ; 1BC7 _ C3
; memman_init End of function

memman_total:; Function begin
        push    ebp                                     ; 1BC8 _ 55
        mov     ebp, esp                                ; 1BC9 _ 89. E5
        sub     esp, 16                                 ; 1BCB _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 1BCE _ C7. 45, FC, 00000000
        mov     dword [ebp-8H], 0                       ; 1BD5 _ C7. 45, F8, 00000000
        jmp     ?_078                                   ; 1BDC _ EB, 14

?_077:  mov     eax, dword [ebp+8H]                     ; 1BDE _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1BE1 _ 8B. 55, F8
        add     edx, 2                                  ; 1BE4 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 1BE7 _ 8B. 44 D0, 04
        add     dword [ebp-4H], eax                     ; 1BEB _ 01. 45, FC
        add     dword [ebp-8H], 1                       ; 1BEE _ 83. 45, F8, 01
?_078:  mov     eax, dword [ebp+8H]                     ; 1BF2 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1BF5 _ 8B. 00
        cmp     dword [ebp-8H], eax                     ; 1BF7 _ 39. 45, F8
        jc      ?_077                                   ; 1BFA _ 72, E2
        mov     eax, dword [ebp-4H]                     ; 1BFC _ 8B. 45, FC
        leave                                           ; 1BFF _ C9
        ret                                             ; 1C00 _ C3
; memman_total End of function

memman_alloc:; Function begin
        push    ebp                                     ; 1C01 _ 55
        mov     ebp, esp                                ; 1C02 _ 89. E5
        sub     esp, 16                                 ; 1C04 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 1C07 _ C7. 45, F8, 00000000
        jmp     ?_082                                   ; 1C0E _ E9, 00000085

?_079:  mov     eax, dword [ebp+8H]                     ; 1C13 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1C16 _ 8B. 55, F8
        add     edx, 2                                  ; 1C19 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 1C1C _ 8B. 44 D0, 04
        cmp     dword [ebp+0CH], eax                    ; 1C20 _ 39. 45, 0C
        ja      ?_081                                   ; 1C23 _ 77, 6F
        mov     eax, dword [ebp+8H]                     ; 1C25 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1C28 _ 8B. 55, F8
        add     edx, 2                                  ; 1C2B _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 1C2E _ 8B. 04 D0
        mov     dword [ebp-4H], eax                     ; 1C31 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 1C34 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1C37 _ 8B. 55, F8
        add     edx, 2                                  ; 1C3A _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 1C3D _ 8B. 14 D0
        mov     eax, dword [ebp+0CH]                    ; 1C40 _ 8B. 45, 0C
        lea     ecx, [edx+eax]                          ; 1C43 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1C46 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1C49 _ 8B. 55, F8
        add     edx, 2                                  ; 1C4C _ 83. C2, 02
        mov     dword [eax+edx*8], ecx                  ; 1C4F _ 89. 0C D0
        mov     eax, dword [ebp+8H]                     ; 1C52 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1C55 _ 8B. 55, F8
        add     edx, 2                                  ; 1C58 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 1C5B _ 8B. 44 D0, 04
        sub     eax, dword [ebp+0CH]                    ; 1C5F _ 2B. 45, 0C
        mov     edx, eax                                ; 1C62 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1C64 _ 8B. 45, 08
        mov     ecx, dword [ebp-8H]                     ; 1C67 _ 8B. 4D, F8
        add     ecx, 2                                  ; 1C6A _ 83. C1, 02
        mov     dword [eax+ecx*8+4H], edx               ; 1C6D _ 89. 54 C8, 04
        mov     eax, dword [ebp+8H]                     ; 1C71 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1C74 _ 8B. 55, F8
        add     edx, 2                                  ; 1C77 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 1C7A _ 8B. 44 D0, 04
        test    eax, eax                                ; 1C7E _ 85. C0
        jnz     ?_080                                   ; 1C80 _ 75, 0D
        mov     eax, dword [ebp+8H]                     ; 1C82 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1C85 _ 8B. 00
        lea     edx, [eax-1H]                           ; 1C87 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1C8A _ 8B. 45, 08
        mov     dword [eax], edx                        ; 1C8D _ 89. 10
?_080:  mov     eax, dword [ebp-4H]                     ; 1C8F _ 8B. 45, FC
        jmp     ?_083                                   ; 1C92 _ EB, 17

?_081:  add     dword [ebp-8H], 1                       ; 1C94 _ 83. 45, F8, 01
?_082:  mov     eax, dword [ebp+8H]                     ; 1C98 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1C9B _ 8B. 00
        cmp     dword [ebp-8H], eax                     ; 1C9D _ 39. 45, F8
        jc      ?_079                                   ; 1CA0 _ 0F 82, FFFFFF6D
        mov     eax, 0                                  ; 1CA6 _ B8, 00000000
?_083:  leave                                           ; 1CAB _ C9
        ret                                             ; 1CAC _ C3
; memman_alloc End of function

memman_free:; Function begin
        push    ebp                                     ; 1CAD _ 55
        mov     ebp, esp                                ; 1CAE _ 89. E5
        push    ebx                                     ; 1CB0 _ 53
        sub     esp, 16                                 ; 1CB1 _ 83. EC, 10
        mov     dword [ebp-0CH], 0                      ; 1CB4 _ C7. 45, F4, 00000000
        jmp     ?_085                                   ; 1CBB _ EB, 15

?_084:  mov     eax, dword [ebp+8H]                     ; 1CBD _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1CC0 _ 8B. 55, F4
        add     edx, 2                                  ; 1CC3 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 1CC6 _ 8B. 04 D0
        cmp     dword [ebp+0CH], eax                    ; 1CC9 _ 39. 45, 0C
        jc      ?_086                                   ; 1CCC _ 72, 10
        add     dword [ebp-0CH], 1                      ; 1CCE _ 83. 45, F4, 01
?_085:  mov     eax, dword [ebp+8H]                     ; 1CD2 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1CD5 _ 8B. 00
        cmp     dword [ebp-0CH], eax                    ; 1CD7 _ 39. 45, F4
        jl      ?_084                                   ; 1CDA _ 7C, E1
        jmp     ?_087                                   ; 1CDC _ EB, 01

?_086:  nop                                             ; 1CDE _ 90
?_087:  cmp     dword [ebp-0CH], 0                      ; 1CDF _ 83. 7D, F4, 00
        jle     ?_089                                   ; 1CE3 _ 0F 8E, 000000B9
        mov     eax, dword [ebp-0CH]                    ; 1CE9 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1CEC _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1CEF _ 8B. 45, 08
        add     edx, 2                                  ; 1CF2 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 1CF5 _ 8B. 14 D0
        mov     eax, dword [ebp-0CH]                    ; 1CF8 _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 1CFB _ 8D. 48, FF
        mov     eax, dword [ebp+8H]                     ; 1CFE _ 8B. 45, 08
        add     ecx, 2                                  ; 1D01 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 1D04 _ 8B. 44 C8, 04
        add     eax, edx                                ; 1D08 _ 01. D0
        cmp     dword [ebp+0CH], eax                    ; 1D0A _ 39. 45, 0C
        jne     ?_089                                   ; 1D0D _ 0F 85, 0000008F
        mov     eax, dword [ebp-0CH]                    ; 1D13 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1D16 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1D19 _ 8B. 45, 08
        add     edx, 2                                  ; 1D1C _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 1D1F _ 8B. 54 D0, 04
        mov     eax, dword [ebp-0CH]                    ; 1D23 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 1D26 _ 8D. 58, FF
        mov     eax, dword [ebp+10H]                    ; 1D29 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 1D2C _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1D2F _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 1D32 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 1D35 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 1D39 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1D3C _ 8B. 00
        test    eax, eax                                ; 1D3E _ 85. C0
        jle     ?_088                                   ; 1D40 _ 7E, 56
        mov     edx, dword [ebp+0CH]                    ; 1D42 _ 8B. 55, 0C
        mov     eax, dword [ebp+10H]                    ; 1D45 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 1D48 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1D4B _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1D4E _ 8B. 55, F4
        add     edx, 2                                  ; 1D51 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 1D54 _ 8B. 04 D0
        cmp     ecx, eax                                ; 1D57 _ 39. C1
        jnz     ?_088                                   ; 1D59 _ 75, 3D
        mov     eax, dword [ebp-0CH]                    ; 1D5B _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1D5E _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1D61 _ 8B. 45, 08
        add     edx, 2                                  ; 1D64 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 1D67 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+8H]                     ; 1D6B _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 1D6E _ 8B. 4D, F4
        add     ecx, 2                                  ; 1D71 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 1D74 _ 8B. 44 C8, 04
        mov     ecx, dword [ebp-0CH]                    ; 1D78 _ 8B. 4D, F4
        lea     ebx, [ecx-1H]                           ; 1D7B _ 8D. 59, FF
        lea     ecx, [edx+eax]                          ; 1D7E _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1D81 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 1D84 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 1D87 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 1D8B _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1D8E _ 8B. 00
        lea     edx, [eax-1H]                           ; 1D90 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1D93 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 1D96 _ 89. 10
?_088:  mov     eax, 0                                  ; 1D98 _ B8, 00000000
        jmp     ?_095                                   ; 1D9D _ E9, 0000011B

?_089:  mov     eax, dword [ebp+8H]                     ; 1DA2 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1DA5 _ 8B. 00
        test    eax, eax                                ; 1DA7 _ 85. C0
        jle     ?_090                                   ; 1DA9 _ 7E, 52
        mov     edx, dword [ebp+0CH]                    ; 1DAB _ 8B. 55, 0C
        mov     eax, dword [ebp+10H]                    ; 1DAE _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 1DB1 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1DB4 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1DB7 _ 8B. 55, F4
        add     edx, 2                                  ; 1DBA _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 1DBD _ 8B. 04 D0
        cmp     ecx, eax                                ; 1DC0 _ 39. C1
        jnz     ?_090                                   ; 1DC2 _ 75, 39
        mov     eax, dword [ebp+8H]                     ; 1DC4 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1DC7 _ 8B. 55, F4
        add     edx, 2                                  ; 1DCA _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 1DCD _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 1DD1 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 1DD4 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1DD7 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1DDA _ 8B. 55, F4
        add     edx, 2                                  ; 1DDD _ 83. C2, 02
        mov     dword [eax+edx*8+4H], ecx               ; 1DE0 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 1DE4 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1DE7 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 1DEA _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 1DED _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 1DF0 _ 89. 14 C8
        mov     eax, 0                                  ; 1DF3 _ B8, 00000000
        jmp     ?_095                                   ; 1DF8 _ E9, 000000C0

?_090:  mov     eax, dword [ebp+8H]                     ; 1DFD _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1E00 _ 8B. 00
        cmp     eax, 4095                               ; 1E02 _ 3D, 00000FFF
        jg      ?_094                                   ; 1E07 _ 0F 8F, 00000087
        mov     eax, dword [ebp+8H]                     ; 1E0D _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1E10 _ 8B. 00
        lea     edx, [eax+1H]                           ; 1E12 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1E15 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 1E18 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 1E1A _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1E1D _ 8B. 00
        mov     dword [ebp-8H], eax                     ; 1E1F _ 89. 45, F8
        jmp     ?_092                                   ; 1E22 _ EB, 28

?_091:  mov     eax, dword [ebp-8H]                     ; 1E24 _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 1E27 _ 8D. 50, FF
        mov     ecx, dword [ebp+8H]                     ; 1E2A _ 8B. 4D, 08
        mov     eax, dword [ebp-8H]                     ; 1E2D _ 8B. 45, F8
        lea     ebx, [eax+2H]                           ; 1E30 _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 1E33 _ 8B. 45, 08
        add     edx, 2                                  ; 1E36 _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 1E39 _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 1E3C _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 1E3E _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 1E41 _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 1E44 _ 89. 54 D9, 04
        sub     dword [ebp-8H], 1                       ; 1E48 _ 83. 6D, F8, 01
?_092:  mov     eax, dword [ebp-8H]                     ; 1E4C _ 8B. 45, F8
        cmp     eax, dword [ebp-0CH]                    ; 1E4F _ 3B. 45, F4
        jg      ?_091                                   ; 1E52 _ 7F, D0
        mov     eax, dword [ebp+8H]                     ; 1E54 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1E57 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1E5A _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1E5D _ 8B. 00
        cmp     edx, eax                                ; 1E5F _ 39. C2
        jge     ?_093                                   ; 1E61 _ 7D, 0B
        mov     eax, dword [ebp+8H]                     ; 1E63 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 1E66 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 1E68 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 1E6B _ 89. 50, 04
?_093:  mov     eax, dword [ebp+8H]                     ; 1E6E _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1E71 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 1E74 _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 1E77 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 1E7A _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 1E7D _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1E80 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 1E83 _ 8D. 4A, 02
        mov     edx, dword [ebp+10H]                    ; 1E86 _ 8B. 55, 10
        mov     dword [eax+ecx*8+4H], edx               ; 1E89 _ 89. 54 C8, 04
        mov     eax, 0                                  ; 1E8D _ B8, 00000000
        jmp     ?_095                                   ; 1E92 _ EB, 29

?_094:  mov     eax, dword [ebp+8H]                     ; 1E94 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1E97 _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 1E9A _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1E9D _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 1EA0 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 1EA3 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 1EA6 _ 8B. 40, 08
        mov     edx, eax                                ; 1EA9 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 1EAB _ 8B. 45, 10
        add     eax, edx                                ; 1EAE _ 01. D0
        mov     edx, eax                                ; 1EB0 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1EB2 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 1EB5 _ 89. 50, 08
        mov     eax, 4294967295                         ; 1EB8 _ B8, FFFFFFFF
?_095:  add     esp, 16                                 ; 1EBD _ 83. C4, 10
        pop     ebx                                     ; 1EC0 _ 5B
        pop     ebp                                     ; 1EC1 _ 5D
        ret                                             ; 1EC2 _ C3
; memman_free End of function

memman_alloc_4k:; Function begin
        push    ebp                                     ; 1EC3 _ 55
        mov     ebp, esp                                ; 1EC4 _ 89. E5
        sub     esp, 16                                 ; 1EC6 _ 83. EC, 10
        mov     eax, dword [ebp+0CH]                    ; 1EC9 _ 8B. 45, 0C
        add     eax, 4095                               ; 1ECC _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 1ED1 _ 25, FFFFF000
        mov     dword [ebp+0CH], eax                    ; 1ED6 _ 89. 45, 0C
        push    dword [ebp+0CH]                         ; 1ED9 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1EDC _ FF. 75, 08
        call    memman_alloc                            ; 1EDF _ E8, FFFFFFFC(rel)
        add     esp, 8                                  ; 1EE4 _ 83. C4, 08
        mov     dword [ebp-4H], eax                     ; 1EE7 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 1EEA _ 8B. 45, FC
        leave                                           ; 1EED _ C9
        ret                                             ; 1EEE _ C3
; memman_alloc_4k End of function

memman_free_4k:; Function begin
        push    ebp                                     ; 1EEF _ 55
        mov     ebp, esp                                ; 1EF0 _ 89. E5
        sub     esp, 16                                 ; 1EF2 _ 83. EC, 10
        mov     eax, dword [ebp+10H]                    ; 1EF5 _ 8B. 45, 10
        add     eax, 4095                               ; 1EF8 _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 1EFD _ 25, FFFFF000
        mov     dword [ebp+10H], eax                    ; 1F02 _ 89. 45, 10
        push    dword [ebp+10H]                         ; 1F05 _ FF. 75, 10
        push    dword [ebp+0CH]                         ; 1F08 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1F0B _ FF. 75, 08
        call    memman_free                             ; 1F0E _ E8, FFFFFFFC(rel)
        add     esp, 12                                 ; 1F13 _ 83. C4, 0C
        mov     dword [ebp-4H], eax                     ; 1F16 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 1F19 _ 8B. 45, FC
        leave                                           ; 1F1C _ C9
        ret                                             ; 1F1D _ C3
; memman_free_4k End of function

shtctl_init:; Function begin
        push    ebp                                     ; 1F1E _ 55
        mov     ebp, esp                                ; 1F1F _ 89. E5
        sub     esp, 24                                 ; 1F21 _ 83. EC, 18
        sub     esp, 8                                  ; 1F24 _ 83. EC, 08
        push    9232                                    ; 1F27 _ 68, 00002410
        push    dword [ebp+8H]                          ; 1F2C _ FF. 75, 08
        call    memman_alloc_4k                         ; 1F2F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1F34 _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 1F37 _ 89. 45, F4
        cmp     dword [ebp-0CH], 0                      ; 1F3A _ 83. 7D, F4, 00
        jnz     ?_096                                   ; 1F3E _ 75, 0A
        mov     eax, 0                                  ; 1F40 _ B8, 00000000
        jmp     ?_100                                   ; 1F45 _ E9, 0000009A

?_096:  mov     eax, dword [ebp-0CH]                    ; 1F4A _ 8B. 45, F4
        mov     edx, dword [ebp+0CH]                    ; 1F4D _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 1F50 _ 89. 10
        mov     eax, dword [ebp-0CH]                    ; 1F52 _ 8B. 45, F4
        mov     edx, dword [ebp+10H]                    ; 1F55 _ 8B. 55, 10
        mov     dword [eax+8H], edx                     ; 1F58 _ 89. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 1F5B _ 8B. 45, F4
        mov     edx, dword [ebp+14H]                    ; 1F5E _ 8B. 55, 14
        mov     dword [eax+0CH], edx                    ; 1F61 _ 89. 50, 0C
        mov     eax, dword [ebp-0CH]                    ; 1F64 _ 8B. 45, F4
        mov     dword [eax+10H], -1                     ; 1F67 _ C7. 40, 10, FFFFFFFF
        mov     dword [ebp-10H], 0                      ; 1F6E _ C7. 45, F0, 00000000
        jmp     ?_098                                   ; 1F75 _ EB, 1B

?_097:  mov     eax, dword [ebp-0CH]                    ; 1F77 _ 8B. 45, F4
        mov     edx, dword [ebp-10H]                    ; 1F7A _ 8B. 55, F0
        add     edx, 33                                 ; 1F7D _ 83. C2, 21
        shl     edx, 5                                  ; 1F80 _ C1. E2, 05
        add     eax, edx                                ; 1F83 _ 01. D0
        add     eax, 16                                 ; 1F85 _ 83. C0, 10
        mov     dword [eax], 0                          ; 1F88 _ C7. 00, 00000000
        add     dword [ebp-10H], 1                      ; 1F8E _ 83. 45, F0, 01
?_098:  cmp     dword [ebp-10H], 255                    ; 1F92 _ 81. 7D, F0, 000000FF
        jle     ?_097                                   ; 1F99 _ 7E, DC
        mov     eax, dword [ebp+10H]                    ; 1F9B _ 8B. 45, 10
        imul    eax, dword [ebp+14H]                    ; 1F9E _ 0F AF. 45, 14
        sub     esp, 8                                  ; 1FA2 _ 83. EC, 08
        push    eax                                     ; 1FA5 _ 50
        push    dword [ebp+8H]                          ; 1FA6 _ FF. 75, 08
        call    memman_alloc_4k                         ; 1FA9 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1FAE _ 83. C4, 10
        mov     edx, eax                                ; 1FB1 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 1FB3 _ 8B. 45, F4
        mov     dword [eax+4H], edx                     ; 1FB6 _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 1FB9 _ 8B. 45, F4
        mov     eax, dword [eax+4H]                     ; 1FBC _ 8B. 40, 04
        test    eax, eax                                ; 1FBF _ 85. C0
        jnz     ?_099                                   ; 1FC1 _ 75, 1E
        mov     eax, dword [ebp-0CH]                    ; 1FC3 _ 8B. 45, F4
        sub     esp, 4                                  ; 1FC6 _ 83. EC, 04
        push    9232                                    ; 1FC9 _ 68, 00002410
        push    eax                                     ; 1FCE _ 50
        push    dword [ebp+8H]                          ; 1FCF _ FF. 75, 08
        call    memman_free_4k                          ; 1FD2 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1FD7 _ 83. C4, 10
        mov     eax, 0                                  ; 1FDA _ B8, 00000000
        jmp     ?_100                                   ; 1FDF _ EB, 03

?_099:  mov     eax, dword [ebp-0CH]                    ; 1FE1 _ 8B. 45, F4
?_100:  leave                                           ; 1FE4 _ C9
        ret                                             ; 1FE5 _ C3
; shtctl_init End of function

sheet_alloc:; Function begin
        push    ebp                                     ; 1FE6 _ 55
        mov     ebp, esp                                ; 1FE7 _ 89. E5
        sub     esp, 16                                 ; 1FE9 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 1FEC _ C7. 45, F8, 00000000
        jmp     ?_103                                   ; 1FF3 _ EB, 5B

?_101:  mov     eax, dword [ebp+8H]                     ; 1FF5 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1FF8 _ 8B. 55, F8
        add     edx, 33                                 ; 1FFB _ 83. C2, 21
        shl     edx, 5                                  ; 1FFE _ C1. E2, 05
        add     eax, edx                                ; 2001 _ 01. D0
        add     eax, 16                                 ; 2003 _ 83. C0, 10
        mov     eax, dword [eax]                        ; 2006 _ 8B. 00
        test    eax, eax                                ; 2008 _ 85. C0
        jnz     ?_102                                   ; 200A _ 75, 40
        mov     eax, dword [ebp-8H]                     ; 200C _ 8B. 45, F8
        shl     eax, 5                                  ; 200F _ C1. E0, 05
        lea     edx, [eax+410H]                         ; 2012 _ 8D. 90, 00000410
        mov     eax, dword [ebp+8H]                     ; 2018 _ 8B. 45, 08
        add     eax, edx                                ; 201B _ 01. D0
        add     eax, 4                                  ; 201D _ 83. C0, 04
        mov     dword [ebp-4H], eax                     ; 2020 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 2023 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2026 _ 8B. 55, F8
        lea     ecx, [edx+4H]                           ; 2029 _ 8D. 4A, 04
        mov     edx, dword [ebp-4H]                     ; 202C _ 8B. 55, FC
        mov     dword [eax+ecx*4+4H], edx               ; 202F _ 89. 54 88, 04
        mov     eax, dword [ebp-4H]                     ; 2033 _ 8B. 45, FC
        mov     dword [eax+1CH], 1                      ; 2036 _ C7. 40, 1C, 00000001
        mov     eax, dword [ebp-4H]                     ; 203D _ 8B. 45, FC
        mov     dword [eax+18H], -1                     ; 2040 _ C7. 40, 18, FFFFFFFF
        mov     eax, dword [ebp-4H]                     ; 2047 _ 8B. 45, FC
        jmp     ?_104                                   ; 204A _ EB, 12

?_102:  add     dword [ebp-8H], 1                       ; 204C _ 83. 45, F8, 01
?_103:  cmp     dword [ebp-8H], 255                     ; 2050 _ 81. 7D, F8, 000000FF
        jle     ?_101                                   ; 2057 _ 7E, 9C
        mov     eax, 0                                  ; 2059 _ B8, 00000000
?_104:  leave                                           ; 205E _ C9
        ret                                             ; 205F _ C3
; sheet_alloc End of function

sheet_setbuf:; Function begin
        push    ebp                                     ; 2060 _ 55
        mov     ebp, esp                                ; 2061 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 2063 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 2066 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 2069 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 206B _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 206E _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 2071 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 2074 _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 2077 _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 207A _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 207D _ 8B. 45, 08
        mov     edx, dword [ebp+18H]                    ; 2080 _ 8B. 55, 18
        mov     dword [eax+14H], edx                    ; 2083 _ 89. 50, 14
        nop                                             ; 2086 _ 90
        pop     ebp                                     ; 2087 _ 5D
        ret                                             ; 2088 _ C3
; sheet_setbuf End of function

sheet_updown:; Function begin
        push    ebp                                     ; 2089 _ 55
        mov     ebp, esp                                ; 208A _ 89. E5
        push    esi                                     ; 208C _ 56
        push    ebx                                     ; 208D _ 53
        sub     esp, 16                                 ; 208E _ 83. EC, 10
        mov     eax, dword [ebp+0CH]                    ; 2091 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 2094 _ 8B. 40, 18
        mov     dword [ebp-0CH], eax                    ; 2097 _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 209A _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 209D _ 8B. 40, 10
        add     eax, 1                                  ; 20A0 _ 83. C0, 01
        cmp     dword [ebp+10H], eax                    ; 20A3 _ 39. 45, 10
        jle     ?_105                                   ; 20A6 _ 7E, 0C
        mov     eax, dword [ebp+8H]                     ; 20A8 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 20AB _ 8B. 40, 10
        add     eax, 1                                  ; 20AE _ 83. C0, 01
        mov     dword [ebp+10H], eax                    ; 20B1 _ 89. 45, 10
?_105:  cmp     dword [ebp+10H], -1                     ; 20B4 _ 83. 7D, 10, FF
        jge     ?_106                                   ; 20B8 _ 7D, 07
        mov     dword [ebp+10H], -1                     ; 20BA _ C7. 45, 10, FFFFFFFF
?_106:  mov     eax, dword [ebp+0CH]                    ; 20C1 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 20C4 _ 8B. 55, 10
        mov     dword [eax+18H], edx                    ; 20C7 _ 89. 50, 18
        mov     eax, dword [ebp-0CH]                    ; 20CA _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 20CD _ 3B. 45, 10
        jle     ?_113                                   ; 20D0 _ 0F 8E, 000001CB
        cmp     dword [ebp+10H], 0                      ; 20D6 _ 83. 7D, 10, 00
        js      ?_109                                   ; 20DA _ 0F 88, 000000DF
        mov     eax, dword [ebp-0CH]                    ; 20E0 _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 20E3 _ 89. 45, F0
        jmp     ?_108                                   ; 20E6 _ EB, 34

?_107:  mov     eax, dword [ebp-10H]                    ; 20E8 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 20EB _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 20EE _ 8B. 45, 08
        add     edx, 4                                  ; 20F1 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 20F4 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 20F8 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 20FB _ 8B. 4D, F0
        add     ecx, 4                                  ; 20FE _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 2101 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 2105 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 2108 _ 8B. 55, F0
        add     edx, 4                                  ; 210B _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 210E _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 2112 _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 2115 _ 89. 50, 18
        sub     dword [ebp-10H], 1                      ; 2118 _ 83. 6D, F0, 01
?_108:  mov     eax, dword [ebp-10H]                    ; 211C _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 211F _ 3B. 45, 10
        jg      ?_107                                   ; 2122 _ 7F, C4
        mov     eax, dword [ebp+8H]                     ; 2124 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 2127 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 212A _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 212D _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 2130 _ 89. 54 88, 04
        mov     eax, dword [ebp+10H]                    ; 2134 _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 2137 _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 213A _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 213D _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2140 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 2143 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 2146 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 2149 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 214C _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 214F _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2152 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 2155 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 2158 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 215B _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 215E _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2161 _ 8B. 40, 0C
        sub     esp, 8                                  ; 2164 _ 83. EC, 08
        push    esi                                     ; 2167 _ 56
        push    ebx                                     ; 2168 _ 53
        push    ecx                                     ; 2169 _ 51
        push    edx                                     ; 216A _ 52
        push    eax                                     ; 216B _ 50
        push    dword [ebp+8H]                          ; 216C _ FF. 75, 08
        call    sheet_refreshmap                        ; 216F _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2174 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 2177 _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 217A _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 217D _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2180 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2183 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 2186 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 2189 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 218C _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 218F _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2192 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2195 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 2198 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 219B _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 219E _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 21A1 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 21A4 _ 8B. 40, 0C
        sub     esp, 8                                  ; 21A7 _ 83. EC, 08
        push    esi                                     ; 21AA _ 56
        push    ebx                                     ; 21AB _ 53
        push    ecx                                     ; 21AC _ 51
        push    edx                                     ; 21AD _ 52
        push    eax                                     ; 21AE _ 50
        push    dword [ebp+8H]                          ; 21AF _ FF. 75, 08
        call    sheet_refreshsub                        ; 21B2 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 21B7 _ 83. C4, 20
        jmp     ?_120                                   ; 21BA _ E9, 00000238

?_109:  mov     eax, dword [ebp+8H]                     ; 21BF _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 21C2 _ 8B. 40, 10
        cmp     dword [ebp-0CH], eax                    ; 21C5 _ 39. 45, F4
        jge     ?_112                                   ; 21C8 _ 7D, 47
        mov     eax, dword [ebp-0CH]                    ; 21CA _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 21CD _ 89. 45, F0
        jmp     ?_111                                   ; 21D0 _ EB, 34

?_110:  mov     eax, dword [ebp-10H]                    ; 21D2 _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 21D5 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 21D8 _ 8B. 45, 08
        add     edx, 4                                  ; 21DB _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 21DE _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 21E2 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 21E5 _ 8B. 4D, F0
        add     ecx, 4                                  ; 21E8 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 21EB _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 21EF _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 21F2 _ 8B. 55, F0
        add     edx, 4                                  ; 21F5 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 21F8 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 21FC _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 21FF _ 89. 50, 18
        add     dword [ebp-10H], 1                      ; 2202 _ 83. 45, F0, 01
?_111:  mov     eax, dword [ebp+8H]                     ; 2206 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2209 _ 8B. 40, 10
        cmp     dword [ebp-10H], eax                    ; 220C _ 39. 45, F0
        jl      ?_110                                   ; 220F _ 7C, C1
?_112:  mov     eax, dword [ebp+8H]                     ; 2211 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2214 _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 2217 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 221A _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 221D _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2220 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2223 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2226 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 2229 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 222C _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 222F _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 2232 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2235 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2238 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 223B _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 223E _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2241 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2244 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2247 _ 8B. 40, 0C
        sub     esp, 8                                  ; 224A _ 83. EC, 08
        push    0                                       ; 224D _ 6A, 00
        push    ebx                                     ; 224F _ 53
        push    ecx                                     ; 2250 _ 51
        push    edx                                     ; 2251 _ 52
        push    eax                                     ; 2252 _ 50
        push    dword [ebp+8H]                          ; 2253 _ FF. 75, 08
        call    sheet_refreshmap                        ; 2256 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 225B _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 225E _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2261 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2264 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 2267 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 226A _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 226D _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 2270 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2273 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2276 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 2279 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 227C _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 227F _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2282 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2285 _ 8B. 40, 0C
        sub     esp, 8                                  ; 2288 _ 83. EC, 08
        push    0                                       ; 228B _ 6A, 00
        push    ebx                                     ; 228D _ 53
        push    ecx                                     ; 228E _ 51
        push    edx                                     ; 228F _ 52
        push    eax                                     ; 2290 _ 50
        push    dword [ebp+8H]                          ; 2291 _ FF. 75, 08
        call    sheet_refreshsub                        ; 2294 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2299 _ 83. C4, 20
        jmp     ?_120                                   ; 229C _ E9, 00000156

?_113:  mov     eax, dword [ebp-0CH]                    ; 22A1 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 22A4 _ 3B. 45, 10
        jge     ?_120                                   ; 22A7 _ 0F 8D, 0000014A
        cmp     dword [ebp-0CH], 0                      ; 22AD _ 83. 7D, F4, 00
        js      ?_116                                   ; 22B1 _ 78, 56
        mov     eax, dword [ebp-0CH]                    ; 22B3 _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 22B6 _ 89. 45, F0
        jmp     ?_115                                   ; 22B9 _ EB, 34

?_114:  mov     eax, dword [ebp-10H]                    ; 22BB _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 22BE _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 22C1 _ 8B. 45, 08
        add     edx, 4                                  ; 22C4 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 22C7 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 22CB _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 22CE _ 8B. 4D, F0
        add     ecx, 4                                  ; 22D1 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 22D4 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 22D8 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 22DB _ 8B. 55, F0
        add     edx, 4                                  ; 22DE _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 22E1 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 22E5 _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 22E8 _ 89. 50, 18
        add     dword [ebp-10H], 1                      ; 22EB _ 83. 45, F0, 01
?_115:  mov     eax, dword [ebp-10H]                    ; 22EF _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 22F2 _ 3B. 45, 10
        jl      ?_114                                   ; 22F5 _ 7C, C4
        mov     eax, dword [ebp+8H]                     ; 22F7 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 22FA _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 22FD _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 2300 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 2303 _ 89. 54 88, 04
        jmp     ?_119                                   ; 2307 _ EB, 6C

?_116:  mov     eax, dword [ebp+8H]                     ; 2309 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 230C _ 8B. 40, 10
        mov     dword [ebp-10H], eax                    ; 230F _ 89. 45, F0
        jmp     ?_118                                   ; 2312 _ EB, 3A

?_117:  mov     eax, dword [ebp-10H]                    ; 2314 _ 8B. 45, F0
        lea     ecx, [eax+1H]                           ; 2317 _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 231A _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 231D _ 8B. 55, F0
        add     edx, 4                                  ; 2320 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 2323 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 2327 _ 8B. 45, 08
        add     ecx, 4                                  ; 232A _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 232D _ 89. 54 88, 04
        mov     eax, dword [ebp-10H]                    ; 2331 _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 2334 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2337 _ 8B. 45, 08
        add     edx, 4                                  ; 233A _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 233D _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 2341 _ 8B. 55, F0
        add     edx, 1                                  ; 2344 _ 83. C2, 01
        mov     dword [eax+18H], edx                    ; 2347 _ 89. 50, 18
        sub     dword [ebp-10H], 1                      ; 234A _ 83. 6D, F0, 01
?_118:  mov     eax, dword [ebp-10H]                    ; 234E _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 2351 _ 3B. 45, 10
        jge     ?_117                                   ; 2354 _ 7D, BE
        mov     eax, dword [ebp+8H]                     ; 2356 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 2359 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 235C _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 235F _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 2362 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 2366 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2369 _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 236C _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 236F _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 2372 _ 89. 50, 10
?_119:  mov     eax, dword [ebp+0CH]                    ; 2375 _ 8B. 45, 0C
        mov     ecx, dword [eax+18H]                    ; 2378 _ 8B. 48, 18
        mov     eax, dword [ebp+0CH]                    ; 237B _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 237E _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2381 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 2384 _ 8B. 40, 08
        lea     esi, [edx+eax]                          ; 2387 _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 238A _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 238D _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2390 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2393 _ 8B. 40, 04
        lea     ebx, [edx+eax]                          ; 2396 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 2399 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 239C _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 239F _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 23A2 _ 8B. 40, 0C
        sub     esp, 8                                  ; 23A5 _ 83. EC, 08
        push    ecx                                     ; 23A8 _ 51
        push    esi                                     ; 23A9 _ 56
        push    ebx                                     ; 23AA _ 53
        push    edx                                     ; 23AB _ 52
        push    eax                                     ; 23AC _ 50
        push    dword [ebp+8H]                          ; 23AD _ FF. 75, 08
        call    sheet_refreshmap                        ; 23B0 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 23B5 _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 23B8 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 23BB _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 23BE _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 23C1 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 23C4 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 23C7 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 23CA _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 23CD _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 23D0 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 23D3 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 23D6 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 23D9 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 23DC _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 23DF _ 8B. 40, 0C
        sub     esp, 8                                  ; 23E2 _ 83. EC, 08
        push    dword [ebp+10H]                         ; 23E5 _ FF. 75, 10
        push    ebx                                     ; 23E8 _ 53
        push    ecx                                     ; 23E9 _ 51
        push    edx                                     ; 23EA _ 52
        push    eax                                     ; 23EB _ 50
        push    dword [ebp+8H]                          ; 23EC _ FF. 75, 08
        call    sheet_refreshsub                        ; 23EF _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 23F4 _ 83. C4, 20
?_120:  nop                                             ; 23F7 _ 90
        lea     esp, [ebp-8H]                           ; 23F8 _ 8D. 65, F8
        pop     ebx                                     ; 23FB _ 5B
        pop     esi                                     ; 23FC _ 5E
        pop     ebp                                     ; 23FD _ 5D
        ret                                             ; 23FE _ C3
; sheet_updown End of function

sheet_refresh:; Function begin
        push    ebp                                     ; 23FF _ 55
        mov     ebp, esp                                ; 2400 _ 89. E5
        push    edi                                     ; 2402 _ 57
        push    esi                                     ; 2403 _ 56
        push    ebx                                     ; 2404 _ 53
        sub     esp, 12                                 ; 2405 _ 83. EC, 0C
        mov     eax, dword [ebp+0CH]                    ; 2408 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 240B _ 8B. 40, 18
        test    eax, eax                                ; 240E _ 85. C0
        js      ?_121                                   ; 2410 _ 78, 47
        mov     eax, dword [ebp+0CH]                    ; 2412 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 2415 _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 2418 _ 8B. 55, 0C
        mov     ecx, dword [edx+10H]                    ; 241B _ 8B. 4A, 10
        mov     edx, dword [ebp+1CH]                    ; 241E _ 8B. 55, 1C
        lea     esi, [ecx+edx]                          ; 2421 _ 8D. 34 11
        mov     edx, dword [ebp+0CH]                    ; 2424 _ 8B. 55, 0C
        mov     ecx, dword [edx+0CH]                    ; 2427 _ 8B. 4A, 0C
        mov     edx, dword [ebp+18H]                    ; 242A _ 8B. 55, 18
        lea     ebx, [ecx+edx]                          ; 242D _ 8D. 1C 11
        mov     edx, dword [ebp+0CH]                    ; 2430 _ 8B. 55, 0C
        mov     ecx, dword [edx+10H]                    ; 2433 _ 8B. 4A, 10
        mov     edx, dword [ebp+14H]                    ; 2436 _ 8B. 55, 14
        add     ecx, edx                                ; 2439 _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 243B _ 8B. 55, 0C
        mov     edi, dword [edx+0CH]                    ; 243E _ 8B. 7A, 0C
        mov     edx, dword [ebp+10H]                    ; 2441 _ 8B. 55, 10
        add     edx, edi                                ; 2444 _ 01. FA
        sub     esp, 8                                  ; 2446 _ 83. EC, 08
        push    eax                                     ; 2449 _ 50
        push    esi                                     ; 244A _ 56
        push    ebx                                     ; 244B _ 53
        push    ecx                                     ; 244C _ 51
        push    edx                                     ; 244D _ 52
        push    dword [ebp+8H]                          ; 244E _ FF. 75, 08
        call    sheet_refreshsub                        ; 2451 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2456 _ 83. C4, 20
?_121:  mov     eax, 0                                  ; 2459 _ B8, 00000000
        lea     esp, [ebp-0CH]                          ; 245E _ 8D. 65, F4
        pop     ebx                                     ; 2461 _ 5B
        pop     esi                                     ; 2462 _ 5E
        pop     edi                                     ; 2463 _ 5F
        pop     ebp                                     ; 2464 _ 5D
        ret                                             ; 2465 _ C3
; sheet_refresh End of function

sheet_slide_mouse:; Function begin
        push    ebp                                     ; 2466 _ 55
        mov     ebp, esp                                ; 2467 _ 89. E5
        push    ebx                                     ; 2469 _ 53
        sub     esp, 20                                 ; 246A _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 246D _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2470 _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 2473 _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 2476 _ 8B. 45, 0C
        mov     eax, dword [eax+10H]                    ; 2479 _ 8B. 40, 10
        mov     dword [ebp-0CH], eax                    ; 247C _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 247F _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 2482 _ 8B. 55, 10
        mov     dword [eax+0CH], edx                    ; 2485 _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2488 _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 248B _ 8B. 55, 14
        mov     dword [eax+10H], edx                    ; 248E _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2491 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 2494 _ 8B. 40, 18
        test    eax, eax                                ; 2497 _ 85. C0
        js      ?_122                                   ; 2499 _ 0F 88, 000000AE
        mov     eax, dword [ebp-0CH]                    ; 249F _ 8B. 45, F4
        lea     edx, [eax+10H]                          ; 24A2 _ 8D. 50, 10
        mov     eax, dword [ebp-10H]                    ; 24A5 _ 8B. 45, F0
        add     eax, 16                                 ; 24A8 _ 83. C0, 10
        sub     esp, 8                                  ; 24AB _ 83. EC, 08
        push    0                                       ; 24AE _ 6A, 00
        push    edx                                     ; 24B0 _ 52
        push    eax                                     ; 24B1 _ 50
        push    dword [ebp-0CH]                         ; 24B2 _ FF. 75, F4
        push    dword [ebp-10H]                         ; 24B5 _ FF. 75, F0
        push    dword [ebp+8H]                          ; 24B8 _ FF. 75, 08
        call    sheet_refreshmap                        ; 24BB _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 24C0 _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 24C3 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 24C6 _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 24C9 _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 24CC _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 24CF _ 8B. 55, 14
        add     ecx, edx                                ; 24D2 _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 24D4 _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 24D7 _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 24DA _ 8B. 55, 10
        add     edx, ebx                                ; 24DD _ 01. DA
        sub     esp, 8                                  ; 24DF _ 83. EC, 08
        push    eax                                     ; 24E2 _ 50
        push    ecx                                     ; 24E3 _ 51
        push    edx                                     ; 24E4 _ 52
        push    dword [ebp+14H]                         ; 24E5 _ FF. 75, 14
        push    dword [ebp+10H]                         ; 24E8 _ FF. 75, 10
        push    dword [ebp+8H]                          ; 24EB _ FF. 75, 08
        call    sheet_refreshmap                        ; 24EE _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 24F3 _ 83. C4, 20
        mov     eax, dword [ebp-0CH]                    ; 24F6 _ 8B. 45, F4
        lea     edx, [eax+10H]                          ; 24F9 _ 8D. 50, 10
        mov     eax, dword [ebp-10H]                    ; 24FC _ 8B. 45, F0
        add     eax, 16                                 ; 24FF _ 83. C0, 10
        sub     esp, 8                                  ; 2502 _ 83. EC, 08
        push    0                                       ; 2505 _ 6A, 00
        push    edx                                     ; 2507 _ 52
        push    eax                                     ; 2508 _ 50
        push    dword [ebp-0CH]                         ; 2509 _ FF. 75, F4
        push    dword [ebp-10H]                         ; 250C _ FF. 75, F0
        push    dword [ebp+8H]                          ; 250F _ FF. 75, 08
        call    sheet_refreshsub                        ; 2512 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2517 _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 251A _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 251D _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 2520 _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 2523 _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 2526 _ 8B. 55, 14
        add     ecx, edx                                ; 2529 _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 252B _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 252E _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 2531 _ 8B. 55, 10
        add     edx, ebx                                ; 2534 _ 01. DA
        sub     esp, 8                                  ; 2536 _ 83. EC, 08
        push    eax                                     ; 2539 _ 50
        push    ecx                                     ; 253A _ 51
        push    edx                                     ; 253B _ 52
        push    dword [ebp+14H]                         ; 253C _ FF. 75, 14
        push    dword [ebp+10H]                         ; 253F _ FF. 75, 10
        push    dword [ebp+8H]                          ; 2542 _ FF. 75, 08
        call    sheet_refreshsub                        ; 2545 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 254A _ 83. C4, 20
?_122:  nop                                             ; 254D _ 90
        mov     ebx, dword [ebp-4H]                     ; 254E _ 8B. 5D, FC
        leave                                           ; 2551 _ C9
        ret                                             ; 2552 _ C3
; sheet_slide_mouse End of function

sheet_slide:; Function begin
        push    ebp                                     ; 2553 _ 55
        mov     ebp, esp                                ; 2554 _ 89. E5
        push    ebx                                     ; 2556 _ 53
        sub     esp, 20                                 ; 2557 _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 255A _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 255D _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 2560 _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 2563 _ 8B. 45, 0C
        mov     eax, dword [eax+10H]                    ; 2566 _ 8B. 40, 10
        mov     dword [ebp-0CH], eax                    ; 2569 _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 256C _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 256F _ 8B. 55, 10
        mov     dword [eax+0CH], edx                    ; 2572 _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2575 _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 2578 _ 8B. 55, 14
        mov     dword [eax+10H], edx                    ; 257B _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 257E _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 2581 _ 8B. 40, 18
        test    eax, eax                                ; 2584 _ 85. C0
        js      ?_123                                   ; 2586 _ 0F 88, 000000C2
        mov     eax, dword [ebp+0CH]                    ; 258C _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 258F _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 2592 _ 8B. 45, F4
        add     edx, eax                                ; 2595 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 2597 _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 259A _ 8B. 48, 04
        mov     eax, dword [ebp-10H]                    ; 259D _ 8B. 45, F0
        add     eax, ecx                                ; 25A0 _ 01. C8
        sub     esp, 8                                  ; 25A2 _ 83. EC, 08
        push    0                                       ; 25A5 _ 6A, 00
        push    edx                                     ; 25A7 _ 52
        push    eax                                     ; 25A8 _ 50
        push    dword [ebp-0CH]                         ; 25A9 _ FF. 75, F4
        push    dword [ebp-10H]                         ; 25AC _ FF. 75, F0
        push    dword [ebp+8H]                          ; 25AF _ FF. 75, 08
        call    sheet_refreshmap                        ; 25B2 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 25B7 _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 25BA _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 25BD _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 25C0 _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 25C3 _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 25C6 _ 8B. 55, 14
        add     ecx, edx                                ; 25C9 _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 25CB _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 25CE _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 25D1 _ 8B. 55, 10
        add     edx, ebx                                ; 25D4 _ 01. DA
        sub     esp, 8                                  ; 25D6 _ 83. EC, 08
        push    eax                                     ; 25D9 _ 50
        push    ecx                                     ; 25DA _ 51
        push    edx                                     ; 25DB _ 52
        push    dword [ebp+14H]                         ; 25DC _ FF. 75, 14
        push    dword [ebp+10H]                         ; 25DF _ FF. 75, 10
        push    dword [ebp+8H]                          ; 25E2 _ FF. 75, 08
        call    sheet_refreshmap                        ; 25E5 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 25EA _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 25ED _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 25F0 _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 25F3 _ 8B. 45, F4
        add     edx, eax                                ; 25F6 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 25F8 _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 25FB _ 8B. 48, 04
        mov     eax, dword [ebp-10H]                    ; 25FE _ 8B. 45, F0
        add     eax, ecx                                ; 2601 _ 01. C8
        sub     esp, 8                                  ; 2603 _ 83. EC, 08
        push    0                                       ; 2606 _ 6A, 00
        push    edx                                     ; 2608 _ 52
        push    eax                                     ; 2609 _ 50
        push    dword [ebp-0CH]                         ; 260A _ FF. 75, F4
        push    dword [ebp-10H]                         ; 260D _ FF. 75, F0
        push    dword [ebp+8H]                          ; 2610 _ FF. 75, 08
        call    sheet_refreshsub                        ; 2613 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2618 _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 261B _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 261E _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 2621 _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 2624 _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 2627 _ 8B. 55, 14
        add     ecx, edx                                ; 262A _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 262C _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 262F _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 2632 _ 8B. 55, 10
        add     edx, ebx                                ; 2635 _ 01. DA
        sub     esp, 8                                  ; 2637 _ 83. EC, 08
        push    eax                                     ; 263A _ 50
        push    ecx                                     ; 263B _ 51
        push    edx                                     ; 263C _ 52
        push    dword [ebp+14H]                         ; 263D _ FF. 75, 14
        push    dword [ebp+10H]                         ; 2640 _ FF. 75, 10
        push    dword [ebp+8H]                          ; 2643 _ FF. 75, 08
        call    sheet_refreshsub                        ; 2646 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 264B _ 83. C4, 20
?_123:  nop                                             ; 264E _ 90
        mov     ebx, dword [ebp-4H]                     ; 264F _ 8B. 5D, FC
        leave                                           ; 2652 _ C9
        ret                                             ; 2653 _ C3
; sheet_slide End of function

sheet_refreshsub:; Function begin
        push    ebp                                     ; 2654 _ 55
        mov     ebp, esp                                ; 2655 _ 89. E5
        sub     esp, 48                                 ; 2657 _ 83. EC, 30
        mov     eax, dword [ebp+8H]                     ; 265A _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 265D _ 8B. 00
        mov     dword [ebp-18H], eax                    ; 265F _ 89. 45, E8
        mov     eax, dword [ebp+8H]                     ; 2662 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2665 _ 8B. 40, 04
        mov     dword [ebp-14H], eax                    ; 2668 _ 89. 45, EC
        mov     eax, dword [ebp+1CH]                    ; 266B _ 8B. 45, 1C
        mov     dword [ebp-24H], eax                    ; 266E _ 89. 45, DC
        jmp     ?_130                                   ; 2671 _ E9, 00000118

?_124:  mov     eax, dword [ebp+8H]                     ; 2676 _ 8B. 45, 08
        mov     edx, dword [ebp-24H]                    ; 2679 _ 8B. 55, DC
        add     edx, 4                                  ; 267C _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 267F _ 8B. 44 90, 04
        mov     dword [ebp-10H], eax                    ; 2683 _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 2686 _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 2689 _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 268B _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 268E _ 8B. 45, F0
        mov     edx, dword [ebp+8H]                     ; 2691 _ 8B. 55, 08
        add     edx, 1044                               ; 2694 _ 81. C2, 00000414
        sub     eax, edx                                ; 269A _ 29. D0
        sar     eax, 5                                  ; 269C _ C1. F8, 05
        mov     byte [ebp-26H], al                      ; 269F _ 88. 45, DA
        mov     dword [ebp-1CH], 0                      ; 26A2 _ C7. 45, E4, 00000000
        jmp     ?_129                                   ; 26A9 _ E9, 000000CD

?_125:  mov     eax, dword [ebp-10H]                    ; 26AE _ 8B. 45, F0
        mov     edx, dword [eax+10H]                    ; 26B1 _ 8B. 50, 10
        mov     eax, dword [ebp-1CH]                    ; 26B4 _ 8B. 45, E4
        add     eax, edx                                ; 26B7 _ 01. D0
        mov     dword [ebp-8H], eax                     ; 26B9 _ 89. 45, F8
        mov     dword [ebp-20H], 0                      ; 26BC _ C7. 45, E0, 00000000
        jmp     ?_128                                   ; 26C3 _ E9, 000000A0

?_126:  mov     eax, dword [ebp-10H]                    ; 26C8 _ 8B. 45, F0
        mov     edx, dword [eax+0CH]                    ; 26CB _ 8B. 50, 0C
        mov     eax, dword [ebp-20H]                    ; 26CE _ 8B. 45, E0
        add     eax, edx                                ; 26D1 _ 01. D0
        mov     dword [ebp-4H], eax                     ; 26D3 _ 89. 45, FC
        mov     eax, dword [ebp+0CH]                    ; 26D6 _ 8B. 45, 0C
        cmp     eax, dword [ebp-4H]                     ; 26D9 _ 3B. 45, FC
        jg      ?_127                                   ; 26DC _ 0F 8F, 00000082
        mov     eax, dword [ebp-4H]                     ; 26E2 _ 8B. 45, FC
        cmp     eax, dword [ebp+14H]                    ; 26E5 _ 3B. 45, 14
        jge     ?_127                                   ; 26E8 _ 7D, 7A
        mov     eax, dword [ebp+10H]                    ; 26EA _ 8B. 45, 10
        cmp     eax, dword [ebp-8H]                     ; 26ED _ 3B. 45, F8
        jg      ?_127                                   ; 26F0 _ 7F, 72
        mov     eax, dword [ebp-8H]                     ; 26F2 _ 8B. 45, F8
        cmp     eax, dword [ebp+18H]                    ; 26F5 _ 3B. 45, 18
        jge     ?_127                                   ; 26F8 _ 7D, 6A
        mov     eax, dword [ebp-10H]                    ; 26FA _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 26FD _ 8B. 40, 04
        imul    eax, dword [ebp-1CH]                    ; 2700 _ 0F AF. 45, E4
        mov     edx, eax                                ; 2704 _ 89. C2
        mov     eax, dword [ebp-20H]                    ; 2706 _ 8B. 45, E0
        add     eax, edx                                ; 2709 _ 01. D0
        mov     edx, eax                                ; 270B _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 270D _ 8B. 45, F4
        add     eax, edx                                ; 2710 _ 01. D0
        movzx   eax, byte [eax]                         ; 2712 _ 0F B6. 00
        mov     byte [ebp-25H], al                      ; 2715 _ 88. 45, DB
        mov     eax, dword [ebp+8H]                     ; 2718 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 271B _ 8B. 40, 08
        imul    eax, dword [ebp-8H]                     ; 271E _ 0F AF. 45, F8
        mov     edx, eax                                ; 2722 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 2724 _ 8B. 45, FC
        add     eax, edx                                ; 2727 _ 01. D0
        mov     edx, eax                                ; 2729 _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 272B _ 8B. 45, EC
        add     eax, edx                                ; 272E _ 01. D0
        movzx   eax, byte [eax]                         ; 2730 _ 0F B6. 00
        cmp     byte [ebp-26H], al                      ; 2733 _ 38. 45, DA
        jnz     ?_127                                   ; 2736 _ 75, 2C
        movzx   edx, byte [ebp-25H]                     ; 2738 _ 0F B6. 55, DB
        mov     eax, dword [ebp-10H]                    ; 273C _ 8B. 45, F0
        mov     eax, dword [eax+14H]                    ; 273F _ 8B. 40, 14
        cmp     edx, eax                                ; 2742 _ 39. C2
        jz      ?_127                                   ; 2744 _ 74, 1E
        mov     eax, dword [ebp+8H]                     ; 2746 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2749 _ 8B. 40, 08
        imul    eax, dword [ebp-8H]                     ; 274C _ 0F AF. 45, F8
        mov     edx, eax                                ; 2750 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 2752 _ 8B. 45, FC
        add     eax, edx                                ; 2755 _ 01. D0
        mov     edx, eax                                ; 2757 _ 89. C2
        mov     eax, dword [ebp-18H]                    ; 2759 _ 8B. 45, E8
        add     edx, eax                                ; 275C _ 01. C2
        movzx   eax, byte [ebp-25H]                     ; 275E _ 0F B6. 45, DB
        mov     byte [edx], al                          ; 2762 _ 88. 02
?_127:  add     dword [ebp-20H], 1                      ; 2764 _ 83. 45, E0, 01
?_128:  mov     eax, dword [ebp-10H]                    ; 2768 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 276B _ 8B. 40, 04
        cmp     dword [ebp-20H], eax                    ; 276E _ 39. 45, E0
        jl      ?_126                                   ; 2771 _ 0F 8C, FFFFFF51
        add     dword [ebp-1CH], 1                      ; 2777 _ 83. 45, E4, 01
?_129:  mov     eax, dword [ebp-10H]                    ; 277B _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 277E _ 8B. 40, 08
        cmp     dword [ebp-1CH], eax                    ; 2781 _ 39. 45, E4
        jl      ?_125                                   ; 2784 _ 0F 8C, FFFFFF24
        add     dword [ebp-24H], 1                      ; 278A _ 83. 45, DC, 01
?_130:  mov     eax, dword [ebp+8H]                     ; 278E _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2791 _ 8B. 40, 10
        cmp     dword [ebp-24H], eax                    ; 2794 _ 39. 45, DC
        jle     ?_124                                   ; 2797 _ 0F 8E, FFFFFED9
        nop                                             ; 279D _ 90
        leave                                           ; 279E _ C9
        ret                                             ; 279F _ C3
; sheet_refreshsub End of function

sheet_refreshmap:; Function begin
        push    ebp                                     ; 27A0 _ 55
        mov     ebp, esp                                ; 27A1 _ 89. E5
        sub     esp, 64                                 ; 27A3 _ 83. EC, 40
        mov     eax, dword [ebp+8H]                     ; 27A6 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 27A9 _ 8B. 40, 04
        mov     dword [ebp-14H], eax                    ; 27AC _ 89. 45, EC
        cmp     dword [ebp+0CH], 0                      ; 27AF _ 83. 7D, 0C, 00
        jns     ?_131                                   ; 27B3 _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 27B5 _ C7. 45, 0C, 00000000
?_131:  cmp     dword [ebp+10H], 0                      ; 27BC _ 83. 7D, 10, 00
        jns     ?_132                                   ; 27C0 _ 79, 07
        mov     dword [ebp+10H], 0                      ; 27C2 _ C7. 45, 10, 00000000
?_132:  mov     eax, dword [ebp+8H]                     ; 27C9 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 27CC _ 8B. 40, 08
        cmp     dword [ebp+14H], eax                    ; 27CF _ 39. 45, 14
        jle     ?_133                                   ; 27D2 _ 7E, 09
        mov     eax, dword [ebp+8H]                     ; 27D4 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 27D7 _ 8B. 40, 08
        mov     dword [ebp+14H], eax                    ; 27DA _ 89. 45, 14
?_133:  mov     eax, dword [ebp+8H]                     ; 27DD _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 27E0 _ 8B. 40, 0C
        cmp     dword [ebp+18H], eax                    ; 27E3 _ 39. 45, 18
        jle     ?_134                                   ; 27E6 _ 7E, 09
        mov     eax, dword [ebp+8H]                     ; 27E8 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 27EB _ 8B. 40, 0C
        mov     dword [ebp+18H], eax                    ; 27EE _ 89. 45, 18
?_134:  mov     eax, dword [ebp+1CH]                    ; 27F1 _ 8B. 45, 1C
        mov     dword [ebp-30H], eax                    ; 27F4 _ 89. 45, D0
        jmp     ?_145                                   ; 27F7 _ E9, 00000140

?_135:  mov     eax, dword [ebp+8H]                     ; 27FC _ 8B. 45, 08
        mov     edx, dword [ebp-30H]                    ; 27FF _ 8B. 55, D0
        add     edx, 4                                  ; 2802 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 2805 _ 8B. 44 90, 04
        mov     dword [ebp-10H], eax                    ; 2809 _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 280C _ 8B. 45, F0
        mov     edx, dword [ebp+8H]                     ; 280F _ 8B. 55, 08
        add     edx, 1044                               ; 2812 _ 81. C2, 00000414
        sub     eax, edx                                ; 2818 _ 29. D0
        sar     eax, 5                                  ; 281A _ C1. F8, 05
        mov     byte [ebp-31H], al                      ; 281D _ 88. 45, CF
        mov     eax, dword [ebp-10H]                    ; 2820 _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 2823 _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 2825 _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 2828 _ 8B. 45, F0
        mov     eax, dword [eax+0CH]                    ; 282B _ 8B. 40, 0C
        mov     edx, dword [ebp+0CH]                    ; 282E _ 8B. 55, 0C
        sub     edx, eax                                ; 2831 _ 29. C2
        mov     eax, edx                                ; 2833 _ 89. D0
        mov     dword [ebp-24H], eax                    ; 2835 _ 89. 45, DC
        mov     eax, dword [ebp-10H]                    ; 2838 _ 8B. 45, F0
        mov     eax, dword [eax+10H]                    ; 283B _ 8B. 40, 10
        mov     edx, dword [ebp+10H]                    ; 283E _ 8B. 55, 10
        sub     edx, eax                                ; 2841 _ 29. C2
        mov     eax, edx                                ; 2843 _ 89. D0
        mov     dword [ebp-20H], eax                    ; 2845 _ 89. 45, E0
        mov     eax, dword [ebp-10H]                    ; 2848 _ 8B. 45, F0
        mov     eax, dword [eax+0CH]                    ; 284B _ 8B. 40, 0C
        mov     edx, dword [ebp+14H]                    ; 284E _ 8B. 55, 14
        sub     edx, eax                                ; 2851 _ 29. C2
        mov     eax, edx                                ; 2853 _ 89. D0
        mov     dword [ebp-1CH], eax                    ; 2855 _ 89. 45, E4
        mov     eax, dword [ebp-10H]                    ; 2858 _ 8B. 45, F0
        mov     eax, dword [eax+10H]                    ; 285B _ 8B. 40, 10
        mov     edx, dword [ebp+18H]                    ; 285E _ 8B. 55, 18
        sub     edx, eax                                ; 2861 _ 29. C2
        mov     eax, edx                                ; 2863 _ 89. D0
        mov     dword [ebp-18H], eax                    ; 2865 _ 89. 45, E8
        cmp     dword [ebp-24H], 0                      ; 2868 _ 83. 7D, DC, 00
        jns     ?_136                                   ; 286C _ 79, 07
        mov     dword [ebp-24H], 0                      ; 286E _ C7. 45, DC, 00000000
?_136:  cmp     dword [ebp-20H], 0                      ; 2875 _ 83. 7D, E0, 00
        jns     ?_137                                   ; 2879 _ 79, 07
        mov     dword [ebp-20H], 0                      ; 287B _ C7. 45, E0, 00000000
?_137:  mov     eax, dword [ebp-10H]                    ; 2882 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 2885 _ 8B. 40, 04
        cmp     dword [ebp-1CH], eax                    ; 2888 _ 39. 45, E4
        jle     ?_138                                   ; 288B _ 7E, 09
        mov     eax, dword [ebp-10H]                    ; 288D _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 2890 _ 8B. 40, 04
        mov     dword [ebp-1CH], eax                    ; 2893 _ 89. 45, E4
?_138:  mov     eax, dword [ebp-10H]                    ; 2896 _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 2899 _ 8B. 40, 08
        cmp     dword [ebp-18H], eax                    ; 289C _ 39. 45, E8
        jle     ?_139                                   ; 289F _ 7E, 09
        mov     eax, dword [ebp-10H]                    ; 28A1 _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 28A4 _ 8B. 40, 08
        mov     dword [ebp-18H], eax                    ; 28A7 _ 89. 45, E8
?_139:  mov     eax, dword [ebp-20H]                    ; 28AA _ 8B. 45, E0
        mov     dword [ebp-28H], eax                    ; 28AD _ 89. 45, D8
        jmp     ?_144                                   ; 28B0 _ EB, 7A

?_140:  mov     eax, dword [ebp-10H]                    ; 28B2 _ 8B. 45, F0
        mov     edx, dword [eax+10H]                    ; 28B5 _ 8B. 50, 10
        mov     eax, dword [ebp-28H]                    ; 28B8 _ 8B. 45, D8
        add     eax, edx                                ; 28BB _ 01. D0
        mov     dword [ebp-8H], eax                     ; 28BD _ 89. 45, F8
        mov     eax, dword [ebp-24H]                    ; 28C0 _ 8B. 45, DC
        mov     dword [ebp-2CH], eax                    ; 28C3 _ 89. 45, D4
        jmp     ?_143                                   ; 28C6 _ EB, 58

?_141:  mov     eax, dword [ebp-10H]                    ; 28C8 _ 8B. 45, F0
        mov     edx, dword [eax+0CH]                    ; 28CB _ 8B. 50, 0C
        mov     eax, dword [ebp-2CH]                    ; 28CE _ 8B. 45, D4
        add     eax, edx                                ; 28D1 _ 01. D0
        mov     dword [ebp-4H], eax                     ; 28D3 _ 89. 45, FC
        mov     eax, dword [ebp-10H]                    ; 28D6 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 28D9 _ 8B. 40, 04
        imul    eax, dword [ebp-28H]                    ; 28DC _ 0F AF. 45, D8
        mov     edx, eax                                ; 28E0 _ 89. C2
        mov     eax, dword [ebp-2CH]                    ; 28E2 _ 8B. 45, D4
        add     eax, edx                                ; 28E5 _ 01. D0
        mov     edx, eax                                ; 28E7 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 28E9 _ 8B. 45, F4
        add     eax, edx                                ; 28EC _ 01. D0
        movzx   eax, byte [eax]                         ; 28EE _ 0F B6. 00
        movzx   edx, al                                 ; 28F1 _ 0F B6. D0
        mov     eax, dword [ebp-10H]                    ; 28F4 _ 8B. 45, F0
        mov     eax, dword [eax+14H]                    ; 28F7 _ 8B. 40, 14
        cmp     edx, eax                                ; 28FA _ 39. C2
        jz      ?_142                                   ; 28FC _ 74, 1E
        mov     eax, dword [ebp+8H]                     ; 28FE _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2901 _ 8B. 40, 08
        imul    eax, dword [ebp-8H]                     ; 2904 _ 0F AF. 45, F8
        mov     edx, eax                                ; 2908 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 290A _ 8B. 45, FC
        add     eax, edx                                ; 290D _ 01. D0
        mov     edx, eax                                ; 290F _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 2911 _ 8B. 45, EC
        add     edx, eax                                ; 2914 _ 01. C2
        movzx   eax, byte [ebp-31H]                     ; 2916 _ 0F B6. 45, CF
        mov     byte [edx], al                          ; 291A _ 88. 02
?_142:  add     dword [ebp-2CH], 1                      ; 291C _ 83. 45, D4, 01
?_143:  mov     eax, dword [ebp-2CH]                    ; 2920 _ 8B. 45, D4
        cmp     eax, dword [ebp-1CH]                    ; 2923 _ 3B. 45, E4
        jl      ?_141                                   ; 2926 _ 7C, A0
        add     dword [ebp-28H], 1                      ; 2928 _ 83. 45, D8, 01
?_144:  mov     eax, dword [ebp-28H]                    ; 292C _ 8B. 45, D8
        cmp     eax, dword [ebp-18H]                    ; 292F _ 3B. 45, E8
        jl      ?_140                                   ; 2932 _ 0F 8C, FFFFFF7A
        add     dword [ebp-30H], 1                      ; 2938 _ 83. 45, D0, 01
?_145:  mov     eax, dword [ebp+8H]                     ; 293C _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 293F _ 8B. 40, 10
        cmp     dword [ebp-30H], eax                    ; 2942 _ 39. 45, D0
        jle     ?_135                                   ; 2945 _ 0F 8E, FFFFFEB1
        nop                                             ; 294B _ 90
        leave                                           ; 294C _ C9
        ret                                             ; 294D _ C3
; sheet_refreshmap End of function

init_pit:; Function begin
        push    ebp                                     ; 294E _ 55
        mov     ebp, esp                                ; 294F _ 89. E5
        sub     esp, 24                                 ; 2951 _ 83. EC, 18
        sub     esp, 8                                  ; 2954 _ 83. EC, 08
        push    52                                      ; 2957 _ 6A, 34
        push    67                                      ; 2959 _ 6A, 43
        call    io_out8                                 ; 295B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2960 _ 83. C4, 10
        sub     esp, 8                                  ; 2963 _ 83. EC, 08
        push    156                                     ; 2966 _ 68, 0000009C
        push    64                                      ; 296B _ 6A, 40
        call    io_out8                                 ; 296D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2972 _ 83. C4, 10
        sub     esp, 8                                  ; 2975 _ 83. EC, 08
        push    46                                      ; 2978 _ 6A, 2E
        push    64                                      ; 297A _ 6A, 40
        call    io_out8                                 ; 297C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2981 _ 83. C4, 10
        sub     esp, 8                                  ; 2984 _ 83. EC, 08
        push    8000                                    ; 2987 _ 68, 00001F40
        push    dword [ebp+8H]                          ; 298C _ FF. 75, 08
        call    memman_alloc_4k                         ; 298F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2994 _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 2997 _ 89. 45, F4
        cmp     dword [ebp-0CH], 0                      ; 299A _ 83. 7D, F4, 00
        jnz     ?_146                                   ; 299E _ 75, 07
        mov     eax, 0                                  ; 29A0 _ B8, 00000000
        jmp     ?_149                                   ; 29A5 _ EB, 36

?_146:  mov     eax, dword [ebp-0CH]                    ; 29A7 _ 8B. 45, F4
        mov     dword [eax], 0                          ; 29AA _ C7. 00, 00000000
        mov     dword [ebp-10H], 0                      ; 29B0 _ C7. 45, F0, 00000000
        jmp     ?_148                                   ; 29B7 _ EB, 18

?_147:  mov     eax, dword [ebp-0CH]                    ; 29B9 _ 8B. 45, F4
        mov     edx, dword [ebp-10H]                    ; 29BC _ 8B. 55, F0
        shl     edx, 4                                  ; 29BF _ C1. E2, 04
        add     eax, edx                                ; 29C2 _ 01. D0
        add     eax, 4                                  ; 29C4 _ 83. C0, 04
        mov     dword [eax], 0                          ; 29C7 _ C7. 00, 00000000
        add     dword [ebp-10H], 1                      ; 29CD _ 83. 45, F0, 01
?_148:  cmp     dword [ebp-10H], 499                    ; 29D1 _ 81. 7D, F0, 000001F3
        jle     ?_147                                   ; 29D8 _ 7E, DF
        mov     eax, dword [ebp-0CH]                    ; 29DA _ 8B. 45, F4
?_149:  leave                                           ; 29DD _ C9
        ret                                             ; 29DE _ C3
; init_pit End of function

timer_alloc:; Function begin
        push    ebp                                     ; 29DF _ 55
        mov     ebp, esp                                ; 29E0 _ 89. E5
        sub     esp, 16                                 ; 29E2 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 29E5 _ C7. 45, FC, 00000000
        jmp     ?_152                                   ; 29EC _ EB, 3E

?_150:  mov     eax, dword [ebp+8H]                     ; 29EE _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 29F1 _ 8B. 55, FC
        shl     edx, 4                                  ; 29F4 _ C1. E2, 04
        add     eax, edx                                ; 29F7 _ 01. D0
        add     eax, 4                                  ; 29F9 _ 83. C0, 04
        mov     eax, dword [eax]                        ; 29FC _ 8B. 00
        test    eax, eax                                ; 29FE _ 85. C0
        jnz     ?_151                                   ; 2A00 _ 75, 26
        mov     eax, dword [ebp+8H]                     ; 2A02 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 2A05 _ 8B. 55, FC
        shl     edx, 4                                  ; 2A08 _ C1. E2, 04
        add     eax, edx                                ; 2A0B _ 01. D0
        add     eax, 4                                  ; 2A0D _ 83. C0, 04
        mov     dword [eax], 1                          ; 2A10 _ C7. 00, 00000001
        mov     eax, dword [ebp-4H]                     ; 2A16 _ 8B. 45, FC
        shl     eax, 4                                  ; 2A19 _ C1. E0, 04
        mov     edx, eax                                ; 2A1C _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2A1E _ 8B. 45, 08
        add     eax, edx                                ; 2A21 _ 01. D0
        add     eax, 4                                  ; 2A23 _ 83. C0, 04
        jmp     ?_153                                   ; 2A26 _ EB, 12

?_151:  add     dword [ebp-4H], 1                       ; 2A28 _ 83. 45, FC, 01
?_152:  cmp     dword [ebp-4H], 499                     ; 2A2C _ 81. 7D, FC, 000001F3
        jle     ?_150                                   ; 2A33 _ 7E, B9
        mov     eax, 0                                  ; 2A35 _ B8, 00000000
?_153:  leave                                           ; 2A3A _ C9
        ret                                             ; 2A3B _ C3
; timer_alloc End of function

timer_free:; Function begin
        push    ebp                                     ; 2A3C _ 55
        mov     ebp, esp                                ; 2A3D _ 89. E5
        mov     eax, dword [ebp+0CH]                    ; 2A3F _ 8B. 45, 0C
        mov     dword [eax], 0                          ; 2A42 _ C7. 00, 00000000
        nop                                             ; 2A48 _ 90
        pop     ebp                                     ; 2A49 _ 5D
        ret                                             ; 2A4A _ C3
; timer_free End of function

timer_init:; Function begin
        push    ebp                                     ; 2A4B _ 55
        mov     ebp, esp                                ; 2A4C _ 89. E5
        sub     esp, 4                                  ; 2A4E _ 83. EC, 04
        mov     eax, dword [ebp+14H]                    ; 2A51 _ 8B. 45, 14
        mov     byte [ebp-4H], al                       ; 2A54 _ 88. 45, FC
        mov     eax, dword [ebp+0CH]                    ; 2A57 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 2A5A _ 8B. 55, 10
        mov     dword [eax+8H], edx                     ; 2A5D _ 89. 50, 08
        mov     eax, dword [ebp+0CH]                    ; 2A60 _ 8B. 45, 0C
        movzx   edx, byte [ebp-4H]                      ; 2A63 _ 0F B6. 55, FC
        mov     byte [eax+0CH], dl                      ; 2A67 _ 88. 50, 0C
        nop                                             ; 2A6A _ 90
        leave                                           ; 2A6B _ C9
        ret                                             ; 2A6C _ C3
; timer_init End of function

timer_setdata:; Function begin
        push    ebp                                     ; 2A6D _ 55
        mov     ebp, esp                                ; 2A6E _ 89. E5
        sub     esp, 4                                  ; 2A70 _ 83. EC, 04
        mov     eax, dword [ebp+10H]                    ; 2A73 _ 8B. 45, 10
        mov     byte [ebp-4H], al                       ; 2A76 _ 88. 45, FC
        mov     eax, dword [ebp+0CH]                    ; 2A79 _ 8B. 45, 0C
        movzx   edx, byte [ebp-4H]                      ; 2A7C _ 0F B6. 55, FC
        mov     byte [eax+0CH], dl                      ; 2A80 _ 88. 50, 0C
        nop                                             ; 2A83 _ 90
        leave                                           ; 2A84 _ C9
        ret                                             ; 2A85 _ C3
; timer_setdata End of function

timer_settime:; Function begin
        push    ebp                                     ; 2A86 _ 55
        mov     ebp, esp                                ; 2A87 _ 89. E5
        mov     eax, dword [ebp+0CH]                    ; 2A89 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 2A8C _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 2A8F _ 89. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 2A92 _ 8B. 45, 0C
        mov     dword [eax], 2                          ; 2A95 _ C7. 00, 00000002
        nop                                             ; 2A9B _ 90
        pop     ebp                                     ; 2A9C _ 5D
        ret                                             ; 2A9D _ C3
; timer_settime End of function

fifo8_init:; Function begin
        push    ebp                                     ; 2A9E _ 55
        mov     ebp, esp                                ; 2A9F _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 2AA1 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 2AA4 _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 2AA7 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 2AAA _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 2AAD _ 8B. 55, 10
        mov     dword [eax], edx                        ; 2AB0 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 2AB2 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 2AB5 _ 8B. 55, 0C
        mov     dword [eax+10H], edx                    ; 2AB8 _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 2ABB _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 2ABE _ C7. 40, 14, 00000000
        mov     eax, dword [ebp+8H]                     ; 2AC5 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 2AC8 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 2ACF _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 2AD2 _ C7. 40, 08, 00000000
        nop                                             ; 2AD9 _ 90
        pop     ebp                                     ; 2ADA _ 5D
        ret                                             ; 2ADB _ C3
; fifo8_init End of function

fifo8_put:; Function begin
        push    ebp                                     ; 2ADC _ 55
        mov     ebp, esp                                ; 2ADD _ 89. E5
        sub     esp, 4                                  ; 2ADF _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 2AE2 _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 2AE5 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 2AE8 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2AEB _ 8B. 40, 10
        test    eax, eax                                ; 2AEE _ 85. C0
        jnz     ?_154                                   ; 2AF0 _ 75, 18
        mov     eax, dword [ebp+8H]                     ; 2AF2 _ 8B. 45, 08
        mov     eax, dword [eax+14H]                    ; 2AF5 _ 8B. 40, 14
        or      eax, 01H                                ; 2AF8 _ 83. C8, 01
        mov     edx, eax                                ; 2AFB _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2AFD _ 8B. 45, 08
        mov     dword [eax+14H], edx                    ; 2B00 _ 89. 50, 14
        mov     eax, 4294967295                         ; 2B03 _ B8, FFFFFFFF
        jmp     ?_156                                   ; 2B08 _ EB, 50

?_154:  mov     eax, dword [ebp+8H]                     ; 2B0A _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 2B0D _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 2B0F _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2B12 _ 8B. 40, 04
        add     edx, eax                                ; 2B15 _ 01. C2
        movzx   eax, byte [ebp-4H]                      ; 2B17 _ 0F B6. 45, FC
        mov     byte [edx], al                          ; 2B1B _ 88. 02
        mov     eax, dword [ebp+8H]                     ; 2B1D _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2B20 _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 2B23 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2B26 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 2B29 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 2B2C _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 2B2F _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 2B32 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2B35 _ 8B. 40, 0C
        cmp     edx, eax                                ; 2B38 _ 39. C2
        jnz     ?_155                                   ; 2B3A _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 2B3C _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 2B3F _ C7. 40, 04, 00000000
?_155:  mov     eax, dword [ebp+8H]                     ; 2B46 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2B49 _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 2B4C _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 2B4F _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 2B52 _ 89. 50, 10
        mov     eax, 0                                  ; 2B55 _ B8, 00000000
?_156:  leave                                           ; 2B5A _ C9
        ret                                             ; 2B5B _ C3
; fifo8_put End of function

fifo8_get:; Function begin
        push    ebp                                     ; 2B5C _ 55
        mov     ebp, esp                                ; 2B5D _ 89. E5
        sub     esp, 16                                 ; 2B5F _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 2B62 _ 8B. 45, 08
        mov     edx, dword [eax+10H]                    ; 2B65 _ 8B. 50, 10
        mov     eax, dword [ebp+8H]                     ; 2B68 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2B6B _ 8B. 40, 0C
        cmp     edx, eax                                ; 2B6E _ 39. C2
        jnz     ?_157                                   ; 2B70 _ 75, 07
        mov     eax, 4294967295                         ; 2B72 _ B8, FFFFFFFF
        jmp     ?_159                                   ; 2B77 _ EB, 51

?_157:  mov     eax, dword [ebp+8H]                     ; 2B79 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 2B7C _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 2B7E _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2B81 _ 8B. 40, 08
        add     eax, edx                                ; 2B84 _ 01. D0
        movzx   eax, byte [eax]                         ; 2B86 _ 0F B6. 00
        movzx   eax, al                                 ; 2B89 _ 0F B6. C0
        mov     dword [ebp-4H], eax                     ; 2B8C _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 2B8F _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2B92 _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 2B95 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2B98 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 2B9B _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 2B9E _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 2BA1 _ 8B. 50, 08
        mov     eax, dword [ebp+8H]                     ; 2BA4 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2BA7 _ 8B. 40, 0C
        cmp     edx, eax                                ; 2BAA _ 39. C2
        jnz     ?_158                                   ; 2BAC _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 2BAE _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 2BB1 _ C7. 40, 08, 00000000
?_158:  mov     eax, dword [ebp+8H]                     ; 2BB8 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2BBB _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 2BBE _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2BC1 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 2BC4 _ 89. 50, 10
        mov     eax, dword [ebp-4H]                     ; 2BC7 _ 8B. 45, FC
?_159:  leave                                           ; 2BCA _ C9
        ret                                             ; 2BCB _ C3
; fifo8_get End of function

fifo8_status:; Function begin
        push    ebp                                     ; 2BCC _ 55
        mov     ebp, esp                                ; 2BCD _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 2BCF _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 2BD2 _ 8B. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 2BD5 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2BD8 _ 8B. 40, 10
        sub     edx, eax                                ; 2BDB _ 29. C2
        mov     eax, edx                                ; 2BDD _ 89. D0
        pop     ebp                                     ; 2BDF _ 5D
        ret                                             ; 2BE0 _ C3
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
        db 32H, 33H, 30H, 2EH, 00H, 00H, 00H, 00H       ; 0070 _ 230.....
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0078 _ ........

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

sht_back: resd  1                                       ; 027C

sht_mouse:                                              ; dword
        resd    1                                       ; 0280

shtctl: resd    1                                       ; 0284

charData.1749:                                          ; word
        resb    1                                       ; 0288

?_175:  resb    3                                       ; 0289

str.1863:                                               ; byte
        resb    1                                       ; 028C

?_176:  resb    9                                       ; 028D

?_177:  resb    1                                       ; 0296


