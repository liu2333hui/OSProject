
CMain:  ; Function begin
        push    ebp                                     ; 0000 _ 55
        mov     ebp, esp                                ; 0001 _ 89. E5
        push    ebx                                     ; 0003 _ 53
        sub     esp, 52                                 ; 0004 _ 83. EC, 34
        sub     esp, 12                                 ; 0007 _ 83. EC, 0C
        push    bootInfo                                ; 000A _ 68, 00000000(d)
        call    initBootInfo                            ; 000F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0014 _ 83. C4, 10
        mov     eax, dword [bootInfo]                   ; 0017 _ A1, 00000000(d)
        mov     dword [ebp-30H], eax                    ; 001C _ 89. 45, D0
        movzx   eax, word [?_154]                       ; 001F _ 0F B7. 05, 00000004(d)
        cwde                                            ; 0026 _ 98
        mov     dword [xsize], eax                      ; 0027 _ A3, 00000200(d)
        movzx   eax, word [?_155]                       ; 002C _ 0F B7. 05, 00000006(d)
        cwde                                            ; 0033 _ 98
        mov     dword [ysize], eax                      ; 0034 _ A3, 00000204(d)
        mov     eax, dword [bootInfo]                   ; 0039 _ A1, 00000000(d)
        mov     dword [ebp-2CH], eax                    ; 003E _ 89. 45, D4
        mov     dword [ebp-28H], 0                      ; 0041 _ C7. 45, D8, 00000000
        mov     dword [ebp-24H], 0                      ; 0048 _ C7. 45, DC, 00000000
        sub     esp, 12                                 ; 004F _ 83. EC, 0C
        push    timerctl                                ; 0052 _ 68, 00000228(d)
        call    init_pit                                ; 0057 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 005C _ 83. C4, 10
        sub     esp, 4                                  ; 005F _ 83. EC, 04
        push    timerbuf                                ; 0062 _ 68, 00000220(d)
        push    8                                       ; 0067 _ 6A, 08
        push    timerinfo                               ; 0069 _ 68, 00000208(d)
        call    fifo8_init                              ; 006E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0073 _ 83. C4, 10
        push    1                                       ; 0076 _ 6A, 01
        push    timerinfo                               ; 0078 _ 68, 00000208(d)
        push    500                                     ; 007D _ 68, 000001F4
        push    timerctl                                ; 0082 _ 68, 00000228(d)
        call    setTimer                                ; 0087 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 008C _ 83. C4, 10
        sub     esp, 4                                  ; 008F _ 83. EC, 04
        push    mousebuf                                ; 0092 _ 68, 00000040(d)
        push    128                                     ; 0097 _ 68, 00000080
        push    mouseinfo                               ; 009C _ 68, 00000008(d)
        call    fifo8_init                              ; 00A1 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00A6 _ 83. C4, 10
        sub     esp, 4                                  ; 00A9 _ 83. EC, 04
        push    keybuf                                  ; 00AC _ 68, 000000C0(d)
        push    32                                      ; 00B1 _ 6A, 20
        push    keyinfo                                 ; 00B3 _ 68, 00000020(d)
        call    fifo8_init                              ; 00B8 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00BD _ 83. C4, 10
        call    init_palette                            ; 00C0 _ E8, FFFFFFFC(rel)
        call    init_keyboard                           ; 00C5 _ E8, FFFFFFFC(rel)
        call    get_memory_block_count                  ; 00CA _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 00CF _ 89. 45, E0
        call    get_adr_buffer                          ; 00D2 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 00D7 _ 89. 45, E4
        mov     eax, dword [memman]                     ; 00DA _ A1, 00000000(d)
        sub     esp, 12                                 ; 00DF _ 83. EC, 0C
        push    eax                                     ; 00E2 _ 50
        call    memman_init                             ; 00E3 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00E8 _ 83. C4, 10
        mov     eax, dword [memman]                     ; 00EB _ A1, 00000000(d)
        sub     esp, 4                                  ; 00F0 _ 83. EC, 04
        push    534609920                               ; 00F3 _ 68, 1FDD8000
        push    1081344                                 ; 00F8 _ 68, 00108000
        push    eax                                     ; 00FD _ 50
        call    memman_free                             ; 00FE _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0103 _ 83. C4, 10
        mov     ecx, dword [ysize]                      ; 0106 _ 8B. 0D, 00000204(d)
        mov     edx, dword [xsize]                      ; 010C _ 8B. 15, 00000200(d)
        mov     eax, dword [memman]                     ; 0112 _ A1, 00000000(d)
        push    ecx                                     ; 0117 _ 51
        push    edx                                     ; 0118 _ 52
        push    dword [ebp-30H]                         ; 0119 _ FF. 75, D0
        push    eax                                     ; 011C _ 50
        call    shtctl_init                             ; 011D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0122 _ 83. C4, 10
        mov     dword [ebp-18H], eax                    ; 0125 _ 89. 45, E8
        sub     esp, 12                                 ; 0128 _ 83. EC, 0C
        push    dword [ebp-18H]                         ; 012B _ FF. 75, E8
        call    sheet_alloc                             ; 012E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0133 _ 83. C4, 10
        mov     dword [ebp-28H], eax                    ; 0136 _ 89. 45, D8
        sub     esp, 12                                 ; 0139 _ 83. EC, 0C
        push    dword [ebp-18H]                         ; 013C _ FF. 75, E8
        call    sheet_alloc                             ; 013F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0144 _ 83. C4, 10
        mov     dword [ebp-24H], eax                    ; 0147 _ 89. 45, DC
        mov     edx, dword [xsize]                      ; 014A _ 8B. 15, 00000200(d)
        mov     eax, dword [ysize]                      ; 0150 _ A1, 00000204(d)
        imul    eax, edx                                ; 0155 _ 0F AF. C2
        mov     edx, eax                                ; 0158 _ 89. C2
        mov     eax, dword [memman]                     ; 015A _ A1, 00000000(d)
        sub     esp, 8                                  ; 015F _ 83. EC, 08
        push    edx                                     ; 0162 _ 52
        push    eax                                     ; 0163 _ 50
        call    memman_alloc_4k                         ; 0164 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0169 _ 83. C4, 10
        mov     dword [buf_back], eax                   ; 016C _ A3, 000000F8(d)
        mov     ecx, dword [ysize]                      ; 0171 _ 8B. 0D, 00000204(d)
        mov     edx, dword [xsize]                      ; 0177 _ 8B. 15, 00000200(d)
        mov     eax, dword [buf_back]                   ; 017D _ A1, 000000F8(d)
        sub     esp, 12                                 ; 0182 _ 83. EC, 0C
        push    99                                      ; 0185 _ 6A, 63
        push    ecx                                     ; 0187 _ 51
        push    edx                                     ; 0188 _ 52
        push    eax                                     ; 0189 _ 50
        push    dword [ebp-28H]                         ; 018A _ FF. 75, D8
        call    sheet_setbuf                            ; 018D _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0192 _ 83. C4, 20
        sub     esp, 12                                 ; 0195 _ 83. EC, 0C
        push    99                                      ; 0198 _ 6A, 63
        push    16                                      ; 019A _ 6A, 10
        push    16                                      ; 019C _ 6A, 10
        push    buf_mouse                               ; 019E _ 68, 00000100(d)
        push    dword [ebp-24H]                         ; 01A3 _ FF. 75, DC
        call    sheet_setbuf                            ; 01A6 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 01AB _ 83. C4, 20
        mov     ecx, dword [ysize]                      ; 01AE _ 8B. 0D, 00000204(d)
        mov     edx, dword [xsize]                      ; 01B4 _ 8B. 15, 00000200(d)
        mov     eax, dword [buf_back]                   ; 01BA _ A1, 000000F8(d)
        sub     esp, 4                                  ; 01BF _ 83. EC, 04
        push    ecx                                     ; 01C2 _ 51
        push    edx                                     ; 01C3 _ 52
        push    eax                                     ; 01C4 _ 50
        call    init_screen8                            ; 01C5 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 01CA _ 83. C4, 10
        sub     esp, 8                                  ; 01CD _ 83. EC, 08
        push    99                                      ; 01D0 _ 6A, 63
        push    buf_mouse                               ; 01D2 _ 68, 00000100(d)
        call    init_mouse_cursor                       ; 01D7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 01DC _ 83. C4, 10
        push    0                                       ; 01DF _ 6A, 00
        push    0                                       ; 01E1 _ 6A, 00
        push    dword [ebp-28H]                         ; 01E3 _ FF. 75, D8
        push    dword [ebp-18H]                         ; 01E6 _ FF. 75, E8
        call    sheet_slide                             ; 01E9 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 01EE _ 83. C4, 10
        mov     eax, dword [xsize]                      ; 01F1 _ A1, 00000200(d)
        sub     eax, 16                                 ; 01F6 _ 83. E8, 10
        mov     edx, eax                                ; 01F9 _ 89. C2
        shr     edx, 31                                 ; 01FB _ C1. EA, 1F
        add     eax, edx                                ; 01FE _ 01. D0
        sar     eax, 1                                  ; 0200 _ D1. F8
        mov     dword [mx], eax                         ; 0202 _ A3, 000000F0(d)
        mov     eax, dword [ysize]                      ; 0207 _ A1, 00000204(d)
        sub     eax, 44                                 ; 020C _ 83. E8, 2C
        mov     edx, eax                                ; 020F _ 89. C2
        shr     edx, 31                                 ; 0211 _ C1. EA, 1F
        add     eax, edx                                ; 0214 _ 01. D0
        sar     eax, 1                                  ; 0216 _ D1. F8
        mov     dword [my], eax                         ; 0218 _ A3, 000000F4(d)
        mov     edx, dword [my]                         ; 021D _ 8B. 15, 000000F4(d)
        mov     eax, dword [mx]                         ; 0223 _ A1, 000000F0(d)
        push    edx                                     ; 0228 _ 52
        push    eax                                     ; 0229 _ 50
        push    dword [ebp-24H]                         ; 022A _ FF. 75, DC
        push    dword [ebp-18H]                         ; 022D _ FF. 75, E8
        call    sheet_slide                             ; 0230 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0235 _ 83. C4, 10
        sub     esp, 8                                  ; 0238 _ 83. EC, 08
        push    ?_141                                   ; 023B _ 68, 00000000(d)
        push    dword [ebp-18H]                         ; 0240 _ FF. 75, E8
        call    message_box                             ; 0243 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0248 _ 83. C4, 10
        mov     dword [ebp-14H], eax                    ; 024B _ 89. 45, EC
        sub     esp, 4                                  ; 024E _ 83. EC, 04
        push    0                                       ; 0251 _ 6A, 00
        push    dword [ebp-28H]                         ; 0253 _ FF. 75, D8
        push    dword [ebp-18H]                         ; 0256 _ FF. 75, E8
        call    sheet_updown                            ; 0259 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 025E _ 83. C4, 10
        sub     esp, 4                                  ; 0261 _ 83. EC, 04
        push    100                                     ; 0264 _ 6A, 64
        push    dword [ebp-24H]                         ; 0266 _ FF. 75, DC
        push    dword [ebp-18H]                         ; 0269 _ FF. 75, E8
        call    sheet_updown                            ; 026C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0271 _ 83. C4, 10
        call    io_sti                                  ; 0274 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 0279 _ 83. EC, 0C
        push    mdec                                    ; 027C _ 68, 000000E0(d)
        call    enable_mouse                            ; 0281 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0286 _ 83. C4, 10
        mov     dword [ebp-10H], 0                      ; 0289 _ C7. 45, F0, 00000000
        mov     dword [ebp-38H], 0                      ; 0290 _ C7. 45, C8, 00000000
        mov     dword [ebp-34H], 0                      ; 0297 _ C7. 45, CC, 00000000
?_001:  mov     eax, dword [timerctl]                   ; 029E _ A1, 00000228(d)
        sub     esp, 12                                 ; 02A3 _ 83. EC, 0C
        push    eax                                     ; 02A6 _ 50
        call    intToHexStr                             ; 02A7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 02AC _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 02AF _ 89. 45, F4
        add     dword [ebp-34H], 1                      ; 02B2 _ 83. 45, CC, 01
        mov     eax, dword [ebp-14H]                    ; 02B6 _ 8B. 45, EC
        mov     eax, dword [eax]                        ; 02B9 _ 8B. 00
        sub     esp, 4                                  ; 02BB _ 83. EC, 04
        push    43                                      ; 02BE _ 6A, 2B
        push    119                                     ; 02C0 _ 6A, 77
        push    28                                      ; 02C2 _ 6A, 1C
        push    40                                      ; 02C4 _ 6A, 28
        push    8                                       ; 02C6 _ 6A, 08
        push    160                                     ; 02C8 _ 68, 000000A0
        push    eax                                     ; 02CD _ 50
        call    boxfill8                                ; 02CE _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 02D3 _ 83. C4, 20
        sub     esp, 8                                  ; 02D6 _ 83. EC, 08
        push    dword [ebp-0CH]                         ; 02D9 _ FF. 75, F4
        push    0                                       ; 02DC _ 6A, 00
        push    28                                      ; 02DE _ 6A, 1C
        push    40                                      ; 02E0 _ 6A, 28
        push    dword [ebp-14H]                         ; 02E2 _ FF. 75, EC
        push    dword [ebp-18H]                         ; 02E5 _ FF. 75, E8
        call    showString                              ; 02E8 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 02ED _ 83. C4, 20
        call    io_cli                                  ; 02F0 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 02F5 _ 83. EC, 0C
        push    keyinfo                                 ; 02F8 _ 68, 00000020(d)
        call    fifo8_status                            ; 02FD _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0302 _ 83. C4, 10
        mov     ebx, eax                                ; 0305 _ 89. C3
        sub     esp, 12                                 ; 0307 _ 83. EC, 0C
        push    mouseinfo                               ; 030A _ 68, 00000008(d)
        call    fifo8_status                            ; 030F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0314 _ 83. C4, 10
        add     ebx, eax                                ; 0317 _ 01. C3
        sub     esp, 12                                 ; 0319 _ 83. EC, 0C
        push    timerinfo                               ; 031C _ 68, 00000208(d)
        call    fifo8_status                            ; 0321 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0326 _ 83. C4, 10
        add     eax, ebx                                ; 0329 _ 01. D8
        test    eax, eax                                ; 032B _ 85. C0
        jnz     ?_002                                   ; 032D _ 75, 0A
        call    io_sti                                  ; 032F _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 0334 _ E9, FFFFFF65
; CMain End of function

?_002:  ; Local function
        sub     esp, 12                                 ; 0339 _ 83. EC, 0C
        push    keyinfo                                 ; 033C _ 68, 00000020(d)
        call    fifo8_status                            ; 0341 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0346 _ 83. C4, 10
        test    eax, eax                                ; 0349 _ 85. C0
        jz      ?_003                                   ; 034B _ 74, 77
        call    io_sti                                  ; 034D _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 0352 _ 83. EC, 0C
        push    keyinfo                                 ; 0355 _ 68, 00000020(d)
        call    fifo8_get                               ; 035A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 035F _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 0362 _ 89. 45, F0
        cmp     dword [ebp-10H], 28                     ; 0365 _ 83. 7D, F0, 1C
        jne     ?_001                                   ; 0369 _ 0F 85, FFFFFF2F
        mov     ebx, dword [xsize]                      ; 036F _ 8B. 1D, 00000200(d)
        mov     ecx, dword [buf_back]                   ; 0375 _ 8B. 0D, 000000F8(d)
        mov     edx, dword [ebp-38H]                    ; 037B _ 8B. 55, C8
        mov     eax, edx                                ; 037E _ 89. D0
        shl     eax, 2                                  ; 0380 _ C1. E0, 02
        add     eax, edx                                ; 0383 _ 01. D0
        shl     eax, 2                                  ; 0385 _ C1. E0, 02
        mov     edx, eax                                ; 0388 _ 89. C2
        mov     eax, dword [ebp-1CH]                    ; 038A _ 8B. 45, E4
        add     eax, edx                                ; 038D _ 01. D0
        sub     esp, 4                                  ; 038F _ 83. EC, 04
        push    7                                       ; 0392 _ 6A, 07
        push    ebx                                     ; 0394 _ 53
        push    dword [ebp-38H]                         ; 0395 _ FF. 75, C8
        push    ecx                                     ; 0398 _ 51
        push    eax                                     ; 0399 _ 50
        push    dword [ebp-28H]                         ; 039A _ FF. 75, D8
        push    dword [ebp-18H]                         ; 039D _ FF. 75, E8
        call    showMemoryInfo                          ; 03A0 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 03A5 _ 83. C4, 20
        add     dword [ebp-38H], 1                      ; 03A8 _ 83. 45, C8, 01
        mov     eax, dword [ebp-38H]                    ; 03AC _ 8B. 45, C8
        cmp     eax, dword [ebp-20H]                    ; 03AF _ 3B. 45, E0
        jle     ?_001                                   ; 03B2 _ 0F 8E, FFFFFEE6
        mov     dword [ebp-38H], 0                      ; 03B8 _ C7. 45, C8, 00000000
        jmp     ?_001                                   ; 03BF _ E9, FFFFFEDA

?_003:  ; Local function
        sub     esp, 12                                 ; 03C4 _ 83. EC, 0C
        push    mouseinfo                               ; 03C7 _ 68, 00000008(d)
        call    fifo8_status                            ; 03CC _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03D1 _ 83. C4, 10
        test    eax, eax                                ; 03D4 _ 85. C0
        jz      ?_004                                   ; 03D6 _ 74, 19
        sub     esp, 4                                  ; 03D8 _ 83. EC, 04
        push    dword [ebp-24H]                         ; 03DB _ FF. 75, DC
        push    dword [ebp-28H]                         ; 03DE _ FF. 75, D8
        push    dword [ebp-18H]                         ; 03E1 _ FF. 75, E8
        call    show_mouse_info                         ; 03E4 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03E9 _ 83. C4, 10
        jmp     ?_001                                   ; 03EC _ E9, FFFFFEAD

?_004:  ; Local function
        sub     esp, 12                                 ; 03F1 _ 83. EC, 0C
        push    timerinfo                               ; 03F4 _ 68, 00000208(d)
        call    fifo8_status                            ; 03F9 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03FE _ 83. C4, 10
        test    eax, eax                                ; 0401 _ 85. C0
        je      ?_001                                   ; 0403 _ 0F 84, FFFFFE95
        call    io_sti                                  ; 0409 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 040E _ 83. EC, 08
        push    ?_142                                   ; 0411 _ 68, 00000009(d)
        push    7                                       ; 0416 _ 6A, 07
        push    0                                       ; 0418 _ 6A, 00
        push    0                                       ; 041A _ 6A, 00
        push    dword [ebp-28H]                         ; 041C _ FF. 75, D8
        push    dword [ebp-18H]                         ; 041F _ FF. 75, E8
        call    showString                              ; 0422 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0427 _ 83. C4, 20
        jmp     ?_001                                   ; 042A _ E9, FFFFFE6F

initBootInfo:; Function begin
        push    ebp                                     ; 042F _ 55
        mov     ebp, esp                                ; 0430 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 0432 _ 8B. 45, 08
        mov     dword [eax], 655360                     ; 0435 _ C7. 00, 000A0000
        mov     eax, dword [ebp+8H]                     ; 043B _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 320                      ; 043E _ 66: C7. 40, 04, 0140
        mov     eax, dword [ebp+8H]                     ; 0444 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 200                      ; 0447 _ 66: C7. 40, 06, 00C8
        nop                                             ; 044D _ 90
        pop     ebp                                     ; 044E _ 5D
        ret                                             ; 044F _ C3
; initBootInfo End of function

init_palette:; Function begin
        push    ebp                                     ; 0450 _ 55
        mov     ebp, esp                                ; 0451 _ 89. E5
        sub     esp, 8                                  ; 0453 _ 83. EC, 08
        sub     esp, 4                                  ; 0456 _ 83. EC, 04
        push    table_rgb.1703                          ; 0459 _ 68, 00000020(d)
        push    15                                      ; 045E _ 6A, 0F
        push    0                                       ; 0460 _ 6A, 00
        call    set_palette                             ; 0462 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0467 _ 83. C4, 10
        nop                                             ; 046A _ 90
        leave                                           ; 046B _ C9
        ret                                             ; 046C _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 046D _ 55
        mov     ebp, esp                                ; 046E _ 89. E5
        sub     esp, 24                                 ; 0470 _ 83. EC, 18
        call    io_load_eflags                          ; 0473 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 0478 _ 89. 45, F4
        call    io_cli                                  ; 047B _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0480 _ 83. EC, 08
        push    dword [ebp+8H]                          ; 0483 _ FF. 75, 08
        push    968                                     ; 0486 _ 68, 000003C8
        call    io_out8                                 ; 048B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0490 _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 0493 _ 8B. 45, 08
        mov     dword [ebp-10H], eax                    ; 0496 _ 89. 45, F0
        jmp     ?_006                                   ; 0499 _ EB, 65

?_005:  mov     eax, dword [ebp+10H]                    ; 049B _ 8B. 45, 10
        movzx   eax, byte [eax]                         ; 049E _ 0F B6. 00
        shr     al, 2                                   ; 04A1 _ C0. E8, 02
        movzx   eax, al                                 ; 04A4 _ 0F B6. C0
        sub     esp, 8                                  ; 04A7 _ 83. EC, 08
        push    eax                                     ; 04AA _ 50
        push    969                                     ; 04AB _ 68, 000003C9
        call    io_out8                                 ; 04B0 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 04B5 _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 04B8 _ 8B. 45, 10
        add     eax, 1                                  ; 04BB _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 04BE _ 0F B6. 00
        shr     al, 2                                   ; 04C1 _ C0. E8, 02
        movzx   eax, al                                 ; 04C4 _ 0F B6. C0
        sub     esp, 8                                  ; 04C7 _ 83. EC, 08
        push    eax                                     ; 04CA _ 50
        push    969                                     ; 04CB _ 68, 000003C9
        call    io_out8                                 ; 04D0 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 04D5 _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 04D8 _ 8B. 45, 10
        add     eax, 2                                  ; 04DB _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 04DE _ 0F B6. 00
        shr     al, 2                                   ; 04E1 _ C0. E8, 02
        movzx   eax, al                                 ; 04E4 _ 0F B6. C0
        sub     esp, 8                                  ; 04E7 _ 83. EC, 08
        push    eax                                     ; 04EA _ 50
        push    969                                     ; 04EB _ 68, 000003C9
        call    io_out8                                 ; 04F0 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 04F5 _ 83. C4, 10
        add     dword [ebp+10H], 3                      ; 04F8 _ 83. 45, 10, 03
        add     dword [ebp-10H], 1                      ; 04FC _ 83. 45, F0, 01
?_006:  mov     eax, dword [ebp-10H]                    ; 0500 _ 8B. 45, F0
        cmp     eax, dword [ebp+0CH]                    ; 0503 _ 3B. 45, 0C
        jle     ?_005                                   ; 0506 _ 7E, 93
        sub     esp, 12                                 ; 0508 _ 83. EC, 0C
        push    dword [ebp-0CH]                         ; 050B _ FF. 75, F4
        call    io_store_eflags                         ; 050E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0513 _ 83. C4, 10
        nop                                             ; 0516 _ 90
        leave                                           ; 0517 _ C9
        ret                                             ; 0518 _ C3
; set_palette End of function

boxfill8:; Function begin
        push    ebp                                     ; 0519 _ 55
        mov     ebp, esp                                ; 051A _ 89. E5
        sub     esp, 20                                 ; 051C _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 051F _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 0522 _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 0525 _ 8B. 45, 18
        mov     dword [ebp-4H], eax                     ; 0528 _ 89. 45, FC
        jmp     ?_010                                   ; 052B _ EB, 33

?_007:  mov     eax, dword [ebp+14H]                    ; 052D _ 8B. 45, 14
        mov     dword [ebp-8H], eax                     ; 0530 _ 89. 45, F8
        jmp     ?_009                                   ; 0533 _ EB, 1F

?_008:  mov     eax, dword [ebp-4H]                     ; 0535 _ 8B. 45, FC
        imul    eax, dword [ebp+0CH]                    ; 0538 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 053C _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 053E _ 8B. 45, F8
        add     eax, edx                                ; 0541 _ 01. D0
        mov     edx, eax                                ; 0543 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0545 _ 8B. 45, 08
        add     edx, eax                                ; 0548 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 054A _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 054E _ 88. 02
        add     dword [ebp-8H], 1                       ; 0550 _ 83. 45, F8, 01
?_009:  mov     eax, dword [ebp-8H]                     ; 0554 _ 8B. 45, F8
        cmp     eax, dword [ebp+1CH]                    ; 0557 _ 3B. 45, 1C
        jle     ?_008                                   ; 055A _ 7E, D9
        add     dword [ebp-4H], 1                       ; 055C _ 83. 45, FC, 01
?_010:  mov     eax, dword [ebp-4H]                     ; 0560 _ 8B. 45, FC
        cmp     eax, dword [ebp+20H]                    ; 0563 _ 3B. 45, 20
        jle     ?_007                                   ; 0566 _ 7E, C5
        nop                                             ; 0568 _ 90
        leave                                           ; 0569 _ C9
        ret                                             ; 056A _ C3
; boxfill8 End of function

showString:; Function begin
        push    ebp                                     ; 056B _ 55
        mov     ebp, esp                                ; 056C _ 89. E5
        push    ebx                                     ; 056E _ 53
        sub     esp, 36                                 ; 056F _ 83. EC, 24
        mov     eax, dword [ebp+18H]                    ; 0572 _ 8B. 45, 18
        mov     byte [ebp-1CH], al                      ; 0575 _ 88. 45, E4
        mov     eax, dword [ebp+10H]                    ; 0578 _ 8B. 45, 10
        mov     dword [ebp-0CH], eax                    ; 057B _ 89. 45, F4
        jmp     ?_012                                   ; 057E _ EB, 3E

?_011:  mov     eax, dword [ebp+1CH]                    ; 0580 _ 8B. 45, 1C
        movzx   eax, byte [eax]                         ; 0583 _ 0F B6. 00
        movzx   eax, al                                 ; 0586 _ 0F B6. C0
        shl     eax, 4                                  ; 0589 _ C1. E0, 04
        lea     ebx, [systemFont+eax]                   ; 058C _ 8D. 98, 00000000(d)
        movsx   ecx, byte [ebp-1CH]                     ; 0592 _ 0F BE. 4D, E4
        mov     eax, dword [ebp+0CH]                    ; 0596 _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 0599 _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 059C _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 059F _ 8B. 00
        sub     esp, 8                                  ; 05A1 _ 83. EC, 08
        push    ebx                                     ; 05A4 _ 53
        push    ecx                                     ; 05A5 _ 51
        push    dword [ebp+14H]                         ; 05A6 _ FF. 75, 14
        push    dword [ebp+10H]                         ; 05A9 _ FF. 75, 10
        push    edx                                     ; 05AC _ 52
        push    eax                                     ; 05AD _ 50
        call    showChar8                               ; 05AE _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 05B3 _ 83. C4, 20
        add     dword [ebp+1CH], 1                      ; 05B6 _ 83. 45, 1C, 01
        add     dword [ebp+10H], 8                      ; 05BA _ 83. 45, 10, 08
?_012:  mov     eax, dword [ebp+1CH]                    ; 05BE _ 8B. 45, 1C
        movzx   eax, byte [eax]                         ; 05C1 _ 0F B6. 00
        test    al, al                                  ; 05C4 _ 84. C0
        jnz     ?_011                                   ; 05C6 _ 75, B8
        mov     eax, dword [ebp+14H]                    ; 05C8 _ 8B. 45, 14
        add     eax, 16                                 ; 05CB _ 83. C0, 10
        sub     esp, 8                                  ; 05CE _ 83. EC, 08
        push    eax                                     ; 05D1 _ 50
        push    dword [ebp+10H]                         ; 05D2 _ FF. 75, 10
        push    dword [ebp+14H]                         ; 05D5 _ FF. 75, 14
        push    dword [ebp-0CH]                         ; 05D8 _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 05DB _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 05DE _ FF. 75, 08
        call    sheet_refresh                           ; 05E1 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 05E6 _ 83. C4, 20
        nop                                             ; 05E9 _ 90
        mov     ebx, dword [ebp-4H]                     ; 05EA _ 8B. 5D, FC
        leave                                           ; 05ED _ C9
        ret                                             ; 05EE _ C3
; showString End of function

showChar8:; Function begin
        push    ebp                                     ; 05EF _ 55
        mov     ebp, esp                                ; 05F0 _ 89. E5
        sub     esp, 20                                 ; 05F2 _ 83. EC, 14
        mov     eax, dword [ebp+18H]                    ; 05F5 _ 8B. 45, 18
        mov     byte [ebp-14H], al                      ; 05F8 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 05FB _ C7. 45, FC, 00000000
        jmp     ?_022                                   ; 0602 _ E9, 0000016C

?_013:  mov     edx, dword [ebp-4H]                     ; 0607 _ 8B. 55, FC
        mov     eax, dword [ebp+1CH]                    ; 060A _ 8B. 45, 1C
        add     eax, edx                                ; 060D _ 01. D0
        movzx   eax, byte [eax]                         ; 060F _ 0F B6. 00
        mov     byte [ebp-5H], al                       ; 0612 _ 88. 45, FB
        cmp     byte [ebp-5H], 0                        ; 0615 _ 80. 7D, FB, 00
        jns     ?_014                                   ; 0619 _ 79, 20
        mov     edx, dword [ebp+14H]                    ; 061B _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 061E _ 8B. 45, FC
        add     eax, edx                                ; 0621 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0623 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0627 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0629 _ 8B. 45, 10
        add     eax, edx                                ; 062C _ 01. D0
        mov     edx, eax                                ; 062E _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0630 _ 8B. 45, 08
        add     edx, eax                                ; 0633 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0635 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0639 _ 88. 02
?_014:  movsx   eax, byte [ebp-5H]                      ; 063B _ 0F BE. 45, FB
        and     eax, 40H                                ; 063F _ 83. E0, 40
        test    eax, eax                                ; 0642 _ 85. C0
        jz      ?_015                                   ; 0644 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 0646 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0649 _ 8B. 45, FC
        add     eax, edx                                ; 064C _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 064E _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0652 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0654 _ 8B. 45, 10
        add     eax, edx                                ; 0657 _ 01. D0
        lea     edx, [eax+1H]                           ; 0659 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 065C _ 8B. 45, 08
        add     edx, eax                                ; 065F _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0661 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0665 _ 88. 02
?_015:  movsx   eax, byte [ebp-5H]                      ; 0667 _ 0F BE. 45, FB
        and     eax, 20H                                ; 066B _ 83. E0, 20
        test    eax, eax                                ; 066E _ 85. C0
        jz      ?_016                                   ; 0670 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 0672 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0675 _ 8B. 45, FC
        add     eax, edx                                ; 0678 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 067A _ 0F AF. 45, 0C
        mov     edx, eax                                ; 067E _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0680 _ 8B. 45, 10
        add     eax, edx                                ; 0683 _ 01. D0
        lea     edx, [eax+2H]                           ; 0685 _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 0688 _ 8B. 45, 08
        add     edx, eax                                ; 068B _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 068D _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0691 _ 88. 02
?_016:  movsx   eax, byte [ebp-5H]                      ; 0693 _ 0F BE. 45, FB
        and     eax, 10H                                ; 0697 _ 83. E0, 10
        test    eax, eax                                ; 069A _ 85. C0
        jz      ?_017                                   ; 069C _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 069E _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 06A1 _ 8B. 45, FC
        add     eax, edx                                ; 06A4 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 06A6 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 06AA _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 06AC _ 8B. 45, 10
        add     eax, edx                                ; 06AF _ 01. D0
        lea     edx, [eax+3H]                           ; 06B1 _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 06B4 _ 8B. 45, 08
        add     edx, eax                                ; 06B7 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 06B9 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 06BD _ 88. 02
?_017:  movsx   eax, byte [ebp-5H]                      ; 06BF _ 0F BE. 45, FB
        and     eax, 08H                                ; 06C3 _ 83. E0, 08
        test    eax, eax                                ; 06C6 _ 85. C0
        jz      ?_018                                   ; 06C8 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 06CA _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 06CD _ 8B. 45, FC
        add     eax, edx                                ; 06D0 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 06D2 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 06D6 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 06D8 _ 8B. 45, 10
        add     eax, edx                                ; 06DB _ 01. D0
        lea     edx, [eax+4H]                           ; 06DD _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 06E0 _ 8B. 45, 08
        add     edx, eax                                ; 06E3 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 06E5 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 06E9 _ 88. 02
?_018:  movsx   eax, byte [ebp-5H]                      ; 06EB _ 0F BE. 45, FB
        and     eax, 04H                                ; 06EF _ 83. E0, 04
        test    eax, eax                                ; 06F2 _ 85. C0
        jz      ?_019                                   ; 06F4 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 06F6 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 06F9 _ 8B. 45, FC
        add     eax, edx                                ; 06FC _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 06FE _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0702 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0704 _ 8B. 45, 10
        add     eax, edx                                ; 0707 _ 01. D0
        lea     edx, [eax+5H]                           ; 0709 _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 070C _ 8B. 45, 08
        add     edx, eax                                ; 070F _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0711 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0715 _ 88. 02
?_019:  movsx   eax, byte [ebp-5H]                      ; 0717 _ 0F BE. 45, FB
        and     eax, 02H                                ; 071B _ 83. E0, 02
        test    eax, eax                                ; 071E _ 85. C0
        jz      ?_020                                   ; 0720 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 0722 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0725 _ 8B. 45, FC
        add     eax, edx                                ; 0728 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 072A _ 0F AF. 45, 0C
        mov     edx, eax                                ; 072E _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0730 _ 8B. 45, 10
        add     eax, edx                                ; 0733 _ 01. D0
        lea     edx, [eax+6H]                           ; 0735 _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 0738 _ 8B. 45, 08
        add     edx, eax                                ; 073B _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 073D _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0741 _ 88. 02
?_020:  movsx   eax, byte [ebp-5H]                      ; 0743 _ 0F BE. 45, FB
        and     eax, 01H                                ; 0747 _ 83. E0, 01
        test    eax, eax                                ; 074A _ 85. C0
        jz      ?_021                                   ; 074C _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 074E _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0751 _ 8B. 45, FC
        add     eax, edx                                ; 0754 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0756 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 075A _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 075C _ 8B. 45, 10
        add     eax, edx                                ; 075F _ 01. D0
        lea     edx, [eax+7H]                           ; 0761 _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 0764 _ 8B. 45, 08
        add     edx, eax                                ; 0767 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0769 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 076D _ 88. 02
?_021:  add     dword [ebp-4H], 1                       ; 076F _ 83. 45, FC, 01
?_022:  cmp     dword [ebp-4H], 15                      ; 0773 _ 83. 7D, FC, 0F
        jle     ?_013                                   ; 0777 _ 0F 8E, FFFFFE8A
        nop                                             ; 077D _ 90
        leave                                           ; 077E _ C9
        ret                                             ; 077F _ C3
; showChar8 End of function

init_mouse_cursor:; Function begin
        push    ebp                                     ; 0780 _ 55
        mov     ebp, esp                                ; 0781 _ 89. E5
        sub     esp, 20                                 ; 0783 _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 0786 _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 0789 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 078C _ C7. 45, FC, 00000000
        jmp     ?_029                                   ; 0793 _ E9, 000000B5

?_023:  mov     dword [ebp-8H], 0                       ; 0798 _ C7. 45, F8, 00000000
        jmp     ?_028                                   ; 079F _ E9, 0000009B

?_024:  mov     eax, dword [ebp-4H]                     ; 07A4 _ 8B. 45, FC
        shl     eax, 4                                  ; 07A7 _ C1. E0, 04
        mov     edx, eax                                ; 07AA _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 07AC _ 8B. 45, F8
        add     eax, edx                                ; 07AF _ 01. D0
        add     eax, cursor.1760                        ; 07B1 _ 05, 00000060(d)
        movzx   eax, byte [eax]                         ; 07B6 _ 0F B6. 00
        cmp     al, 42                                  ; 07B9 _ 3C, 2A
        jnz     ?_025                                   ; 07BB _ 75, 19
        mov     eax, dword [ebp-4H]                     ; 07BD _ 8B. 45, FC
        shl     eax, 4                                  ; 07C0 _ C1. E0, 04
        mov     edx, eax                                ; 07C3 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 07C5 _ 8B. 45, F8
        add     eax, edx                                ; 07C8 _ 01. D0
        mov     edx, eax                                ; 07CA _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 07CC _ 8B. 45, 08
        add     eax, edx                                ; 07CF _ 01. D0
        mov     byte [eax], 0                           ; 07D1 _ C6. 00, 00
        jmp     ?_027                                   ; 07D4 _ EB, 65

?_025:  mov     eax, dword [ebp-4H]                     ; 07D6 _ 8B. 45, FC
        shl     eax, 4                                  ; 07D9 _ C1. E0, 04
        mov     edx, eax                                ; 07DC _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 07DE _ 8B. 45, F8
        add     eax, edx                                ; 07E1 _ 01. D0
        add     eax, cursor.1760                        ; 07E3 _ 05, 00000060(d)
        movzx   eax, byte [eax]                         ; 07E8 _ 0F B6. 00
        cmp     al, 79                                  ; 07EB _ 3C, 4F
        jnz     ?_026                                   ; 07ED _ 75, 19
        mov     eax, dword [ebp-4H]                     ; 07EF _ 8B. 45, FC
        shl     eax, 4                                  ; 07F2 _ C1. E0, 04
        mov     edx, eax                                ; 07F5 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 07F7 _ 8B. 45, F8
        add     eax, edx                                ; 07FA _ 01. D0
        mov     edx, eax                                ; 07FC _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 07FE _ 8B. 45, 08
        add     eax, edx                                ; 0801 _ 01. D0
        mov     byte [eax], 7                           ; 0803 _ C6. 00, 07
        jmp     ?_027                                   ; 0806 _ EB, 33

?_026:  mov     eax, dword [ebp-4H]                     ; 0808 _ 8B. 45, FC
        shl     eax, 4                                  ; 080B _ C1. E0, 04
        mov     edx, eax                                ; 080E _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0810 _ 8B. 45, F8
        add     eax, edx                                ; 0813 _ 01. D0
        add     eax, cursor.1760                        ; 0815 _ 05, 00000060(d)
        movzx   eax, byte [eax]                         ; 081A _ 0F B6. 00
        cmp     al, 46                                  ; 081D _ 3C, 2E
        jnz     ?_027                                   ; 081F _ 75, 1A
        mov     eax, dword [ebp-4H]                     ; 0821 _ 8B. 45, FC
        shl     eax, 4                                  ; 0824 _ C1. E0, 04
        mov     edx, eax                                ; 0827 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0829 _ 8B. 45, F8
        add     eax, edx                                ; 082C _ 01. D0
        mov     edx, eax                                ; 082E _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0830 _ 8B. 45, 08
        add     edx, eax                                ; 0833 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0835 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0839 _ 88. 02
?_027:  add     dword [ebp-8H], 1                       ; 083B _ 83. 45, F8, 01
?_028:  cmp     dword [ebp-8H], 15                      ; 083F _ 83. 7D, F8, 0F
        jle     ?_024                                   ; 0843 _ 0F 8E, FFFFFF5B
        add     dword [ebp-4H], 1                       ; 0849 _ 83. 45, FC, 01
?_029:  cmp     dword [ebp-4H], 15                      ; 084D _ 83. 7D, FC, 0F
        jle     ?_023                                   ; 0851 _ 0F 8E, FFFFFF41
        nop                                             ; 0857 _ 90
        leave                                           ; 0858 _ C9
        ret                                             ; 0859 _ C3
; init_mouse_cursor End of function

putblock:; Function begin
        push    ebp                                     ; 085A _ 55
        mov     ebp, esp                                ; 085B _ 89. E5
        push    ebx                                     ; 085D _ 53
        sub     esp, 16                                 ; 085E _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 0861 _ C7. 45, F8, 00000000
        jmp     ?_033                                   ; 0868 _ EB, 50

?_030:  mov     dword [ebp-0CH], 0                      ; 086A _ C7. 45, F4, 00000000
        jmp     ?_032                                   ; 0871 _ EB, 3B

?_031:  mov     eax, dword [ebp-8H]                     ; 0873 _ 8B. 45, F8
        imul    eax, dword [ebp+24H]                    ; 0876 _ 0F AF. 45, 24
        mov     edx, eax                                ; 087A _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 087C _ 8B. 45, F4
        add     eax, edx                                ; 087F _ 01. D0
        mov     edx, eax                                ; 0881 _ 89. C2
        mov     eax, dword [ebp+20H]                    ; 0883 _ 8B. 45, 20
        add     eax, edx                                ; 0886 _ 01. D0
        mov     ecx, dword [ebp+1CH]                    ; 0888 _ 8B. 4D, 1C
        mov     edx, dword [ebp-8H]                     ; 088B _ 8B. 55, F8
        add     edx, ecx                                ; 088E _ 01. CA
        imul    edx, dword [ebp+0CH]                    ; 0890 _ 0F AF. 55, 0C
        mov     ebx, dword [ebp+18H]                    ; 0894 _ 8B. 5D, 18
        mov     ecx, dword [ebp-0CH]                    ; 0897 _ 8B. 4D, F4
        add     ecx, ebx                                ; 089A _ 01. D9
        add     edx, ecx                                ; 089C _ 01. CA
        mov     ecx, edx                                ; 089E _ 89. D1
        mov     edx, dword [ebp+8H]                     ; 08A0 _ 8B. 55, 08
        add     edx, ecx                                ; 08A3 _ 01. CA
        movzx   eax, byte [eax]                         ; 08A5 _ 0F B6. 00
        mov     byte [edx], al                          ; 08A8 _ 88. 02
        add     dword [ebp-0CH], 1                      ; 08AA _ 83. 45, F4, 01
?_032:  mov     eax, dword [ebp-0CH]                    ; 08AE _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 08B1 _ 3B. 45, 10
        jl      ?_031                                   ; 08B4 _ 7C, BD
        add     dword [ebp-8H], 1                       ; 08B6 _ 83. 45, F8, 01
?_033:  mov     eax, dword [ebp-8H]                     ; 08BA _ 8B. 45, F8
        cmp     eax, dword [ebp+14H]                    ; 08BD _ 3B. 45, 14
        jl      ?_030                                   ; 08C0 _ 7C, A8
        nop                                             ; 08C2 _ 90
        add     esp, 16                                 ; 08C3 _ 83. C4, 10
        pop     ebx                                     ; 08C6 _ 5B
        pop     ebp                                     ; 08C7 _ 5D
        ret                                             ; 08C8 _ C3
; putblock End of function

intHandlerFromC:; Function begin
        push    ebp                                     ; 08C9 _ 55
        mov     ebp, esp                                ; 08CA _ 89. E5
        sub     esp, 24                                 ; 08CC _ 83. EC, 18
        mov     eax, dword [bootInfo]                   ; 08CF _ A1, 00000000(d)
        mov     dword [ebp-14H], eax                    ; 08D4 _ 89. 45, EC
        movzx   eax, word [?_154]                       ; 08D7 _ 0F B7. 05, 00000004(d)
        cwde                                            ; 08DE _ 98
        mov     dword [ebp-10H], eax                    ; 08DF _ 89. 45, F0
        movzx   eax, word [?_155]                       ; 08E2 _ 0F B7. 05, 00000006(d)
        cwde                                            ; 08E9 _ 98
        mov     dword [ebp-0CH], eax                    ; 08EA _ 89. 45, F4
        sub     esp, 8                                  ; 08ED _ 83. EC, 08
        push    32                                      ; 08F0 _ 6A, 20
        push    32                                      ; 08F2 _ 6A, 20
        call    io_out8                                 ; 08F4 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 08F9 _ 83. C4, 10
        mov     byte [ebp-15H], 0                       ; 08FC _ C6. 45, EB, 00
        sub     esp, 12                                 ; 0900 _ 83. EC, 0C
        push    96                                      ; 0903 _ 6A, 60
        call    io_in8                                  ; 0905 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 090A _ 83. C4, 10
        mov     byte [ebp-15H], al                      ; 090D _ 88. 45, EB
        movzx   eax, byte [ebp-15H]                     ; 0910 _ 0F B6. 45, EB
        sub     esp, 8                                  ; 0914 _ 83. EC, 08
        push    eax                                     ; 0917 _ 50
        push    keyinfo                                 ; 0918 _ 68, 00000020(d)
        call    fifo8_put                               ; 091D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0922 _ 83. C4, 10
        nop                                             ; 0925 _ 90
        leave                                           ; 0926 _ C9
        ret                                             ; 0927 _ C3
; intHandlerFromC End of function

charToHexVal:; Function begin
        push    ebp                                     ; 0928 _ 55
        mov     ebp, esp                                ; 0929 _ 89. E5
        sub     esp, 4                                  ; 092B _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 092E _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 0931 _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 0934 _ 80. 7D, FC, 09
        jle     ?_034                                   ; 0938 _ 7E, 09
        movzx   eax, byte [ebp-4H]                      ; 093A _ 0F B6. 45, FC
        add     eax, 55                                 ; 093E _ 83. C0, 37
        jmp     ?_035                                   ; 0941 _ EB, 07

?_034:  movzx   eax, byte [ebp-4H]                      ; 0943 _ 0F B6. 45, FC
        add     eax, 48                                 ; 0947 _ 83. C0, 30
?_035:  leave                                           ; 094A _ C9
        ret                                             ; 094B _ C3
; charToHexVal End of function

charToHexStr:; Function begin
        push    ebp                                     ; 094C _ 55
        mov     ebp, esp                                ; 094D _ 89. E5
        sub     esp, 20                                 ; 094F _ 83. EC, 14
        mov     eax, dword [ebp+8H]                     ; 0952 _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 0955 _ 88. 45, EC
        movzx   eax, byte [ebp-14H]                     ; 0958 _ 0F B6. 45, EC
        and     eax, 0FH                                ; 095C _ 83. E0, 0F
        mov     byte [ebp-1H], al                       ; 095F _ 88. 45, FF
        movsx   eax, byte [ebp-1H]                      ; 0962 _ 0F BE. 45, FF
        push    eax                                     ; 0966 _ 50
        call    charToHexVal                            ; 0967 _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 096C _ 83. C4, 04
        mov     byte [?_153], al                        ; 096F _ A2, 00000003(d)
        shr     byte [ebp-14H], 4                       ; 0974 _ C0. 6D, EC, 04
        movzx   eax, byte [ebp-14H]                     ; 0978 _ 0F B6. 45, EC
        movsx   eax, al                                 ; 097C _ 0F BE. C0
        push    eax                                     ; 097F _ 50
        call    charToHexVal                            ; 0980 _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 0985 _ 83. C4, 04
        mov     byte [?_152], al                        ; 0988 _ A2, 00000002(d)
        mov     eax, keyval                             ; 098D _ B8, 00000000(d)
        leave                                           ; 0992 _ C9
        ret                                             ; 0993 _ C3
; charToHexStr End of function

intToHexStr:; Function begin
        push    ebp                                     ; 0994 _ 55
        mov     ebp, esp                                ; 0995 _ 89. E5
        sub     esp, 16                                 ; 0997 _ 83. EC, 10
        mov     byte [str.1804], 48                     ; 099A _ C6. 05, 00000238(d), 30
        mov     byte [?_159], 88                        ; 09A1 _ C6. 05, 00000239(d), 58
        mov     byte [?_160], 0                         ; 09A8 _ C6. 05, 00000242(d), 00
        mov     dword [ebp-8H], 2                       ; 09AF _ C7. 45, F8, 00000002
        mov     dword [ebp-0CH], 7                      ; 09B6 _ C7. 45, F4, 00000007
        jmp     ?_039                                   ; 09BD _ EB, 45

?_036:  mov     eax, dword [ebp+8H]                     ; 09BF _ 8B. 45, 08
        and     eax, 0FH                                ; 09C2 _ 83. E0, 0F
        mov     dword [ebp-4H], eax                     ; 09C5 _ 89. 45, FC
        cmp     dword [ebp-4H], 9                       ; 09C8 _ 83. 7D, FC, 09
        jg      ?_037                                   ; 09CC _ 7F, 18
        mov     eax, dword [ebp-4H]                     ; 09CE _ 8B. 45, FC
        lea     ecx, [eax+30H]                          ; 09D1 _ 8D. 48, 30
        mov     edx, dword [ebp-8H]                     ; 09D4 _ 8B. 55, F8
        mov     eax, dword [ebp-0CH]                    ; 09D7 _ 8B. 45, F4
        add     eax, edx                                ; 09DA _ 01. D0
        mov     edx, ecx                                ; 09DC _ 89. CA
        mov     byte [str.1804+eax], dl                 ; 09DE _ 88. 90, 00000238(d)
        jmp     ?_038                                   ; 09E4 _ EB, 16

?_037:  mov     eax, dword [ebp-4H]                     ; 09E6 _ 8B. 45, FC
        lea     ecx, [eax+37H]                          ; 09E9 _ 8D. 48, 37
        mov     edx, dword [ebp-8H]                     ; 09EC _ 8B. 55, F8
        mov     eax, dword [ebp-0CH]                    ; 09EF _ 8B. 45, F4
        add     eax, edx                                ; 09F2 _ 01. D0
        mov     edx, ecx                                ; 09F4 _ 89. CA
        mov     byte [str.1804+eax], dl                 ; 09F6 _ 88. 90, 00000238(d)
?_038:  shr     dword [ebp+8H], 4                       ; 09FC _ C1. 6D, 08, 04
        sub     dword [ebp-0CH], 1                      ; 0A00 _ 83. 6D, F4, 01
?_039:  cmp     dword [ebp-0CH], 0                      ; 0A04 _ 83. 7D, F4, 00
        jns     ?_036                                   ; 0A08 _ 79, B5
        mov     eax, str.1804                           ; 0A0A _ B8, 00000238(d)
        leave                                           ; 0A0F _ C9
        ret                                             ; 0A10 _ C3
; intToHexStr End of function

wait_KBC_sendReady:; Function begin
        push    ebp                                     ; 0A11 _ 55
        mov     ebp, esp                                ; 0A12 _ 89. E5
        sub     esp, 8                                  ; 0A14 _ 83. EC, 08
?_040:  sub     esp, 12                                 ; 0A17 _ 83. EC, 0C
        push    100                                     ; 0A1A _ 6A, 64
        call    io_in8                                  ; 0A1C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0A21 _ 83. C4, 10
        and     eax, 02H                                ; 0A24 _ 83. E0, 02
        test    eax, eax                                ; 0A27 _ 85. C0
        jz      ?_041                                   ; 0A29 _ 74, 02
        jmp     ?_040                                   ; 0A2B _ EB, EA
; wait_KBC_sendReady End of function

?_041:  ; Local function
        nop                                             ; 0A2D _ 90
        nop                                             ; 0A2E _ 90
        leave                                           ; 0A2F _ C9
        ret                                             ; 0A30 _ C3

init_keyboard:; Function begin
        push    ebp                                     ; 0A31 _ 55
        mov     ebp, esp                                ; 0A32 _ 89. E5
        sub     esp, 8                                  ; 0A34 _ 83. EC, 08
        call    wait_KBC_sendReady                      ; 0A37 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0A3C _ 83. EC, 08
        push    96                                      ; 0A3F _ 6A, 60
        push    100                                     ; 0A41 _ 6A, 64
        call    io_out8                                 ; 0A43 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0A48 _ 83. C4, 10
        call    wait_KBC_sendReady                      ; 0A4B _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0A50 _ 83. EC, 08
        push    71                                      ; 0A53 _ 6A, 47
        push    96                                      ; 0A55 _ 6A, 60
        call    io_out8                                 ; 0A57 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0A5C _ 83. C4, 10
        nop                                             ; 0A5F _ 90
        leave                                           ; 0A60 _ C9
        ret                                             ; 0A61 _ C3
; init_keyboard End of function

enable_mouse:; Function begin
        push    ebp                                     ; 0A62 _ 55
        mov     ebp, esp                                ; 0A63 _ 89. E5
        sub     esp, 8                                  ; 0A65 _ 83. EC, 08
        call    wait_KBC_sendReady                      ; 0A68 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0A6D _ 83. EC, 08
        push    212                                     ; 0A70 _ 68, 000000D4
        push    100                                     ; 0A75 _ 6A, 64
        call    io_out8                                 ; 0A77 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0A7C _ 83. C4, 10
        call    wait_KBC_sendReady                      ; 0A7F _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0A84 _ 83. EC, 08
        push    244                                     ; 0A87 _ 68, 000000F4
        push    96                                      ; 0A8C _ 6A, 60
        call    io_out8                                 ; 0A8E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0A93 _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 0A96 _ 8B. 45, 08
        mov     byte [eax+3H], 0                        ; 0A99 _ C6. 40, 03, 00
        nop                                             ; 0A9D _ 90
        leave                                           ; 0A9E _ C9
        ret                                             ; 0A9F _ C3
; enable_mouse End of function

intHandlerFromMouse:; Function begin
        push    ebp                                     ; 0AA0 _ 55
        mov     ebp, esp                                ; 0AA1 _ 89. E5
        sub     esp, 24                                 ; 0AA3 _ 83. EC, 18
        sub     esp, 8                                  ; 0AA6 _ 83. EC, 08
        push    32                                      ; 0AA9 _ 6A, 20
        push    160                                     ; 0AAB _ 68, 000000A0
        call    io_out8                                 ; 0AB0 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0AB5 _ 83. C4, 10
        sub     esp, 8                                  ; 0AB8 _ 83. EC, 08
        push    32                                      ; 0ABB _ 6A, 20
        push    32                                      ; 0ABD _ 6A, 20
        call    io_out8                                 ; 0ABF _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0AC4 _ 83. C4, 10
        sub     esp, 12                                 ; 0AC7 _ 83. EC, 0C
        push    96                                      ; 0ACA _ 6A, 60
        call    io_in8                                  ; 0ACC _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0AD1 _ 83. C4, 10
        mov     byte [ebp-9H], al                       ; 0AD4 _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 0AD7 _ 0F B6. 45, F7
        sub     esp, 8                                  ; 0ADB _ 83. EC, 08
        push    eax                                     ; 0ADE _ 50
        push    mouseinfo                               ; 0ADF _ 68, 00000008(d)
        call    fifo8_put                               ; 0AE4 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0AE9 _ 83. C4, 10
        nop                                             ; 0AEC _ 90
        leave                                           ; 0AED _ C9
        ret                                             ; 0AEE _ C3
; intHandlerFromMouse End of function

mouse_decode:; Function begin
        push    ebp                                     ; 0AEF _ 55
        mov     ebp, esp                                ; 0AF0 _ 89. E5
        sub     esp, 4                                  ; 0AF2 _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 0AF5 _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 0AF8 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0AFB _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 0AFE _ 0F B6. 40, 03
        test    al, al                                  ; 0B02 _ 84. C0
        jnz     ?_043                                   ; 0B04 _ 75, 17
        cmp     byte [ebp-4H], -6                       ; 0B06 _ 80. 7D, FC, FA
        jnz     ?_042                                   ; 0B0A _ 75, 07
        mov     eax, dword [ebp+8H]                     ; 0B0C _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 0B0F _ C6. 40, 03, 01
?_042:  mov     eax, 0                                  ; 0B13 _ B8, 00000000
        jmp     ?_050                                   ; 0B18 _ E9, 0000010F

?_043:  mov     eax, dword [ebp+8H]                     ; 0B1D _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 0B20 _ 0F B6. 40, 03
        cmp     al, 1                                   ; 0B24 _ 3C, 01
        jnz     ?_045                                   ; 0B26 _ 75, 28
        movzx   eax, byte [ebp-4H]                      ; 0B28 _ 0F B6. 45, FC
        and     eax, 0C8H                               ; 0B2C _ 25, 000000C8
        cmp     eax, 8                                  ; 0B31 _ 83. F8, 08
        jnz     ?_044                                   ; 0B34 _ 75, 10
        mov     eax, dword [ebp+8H]                     ; 0B36 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 0B39 _ 0F B6. 55, FC
        mov     byte [eax], dl                          ; 0B3D _ 88. 10
        mov     eax, dword [ebp+8H]                     ; 0B3F _ 8B. 45, 08
        mov     byte [eax+3H], 2                        ; 0B42 _ C6. 40, 03, 02
?_044:  mov     eax, 0                                  ; 0B46 _ B8, 00000000
        jmp     ?_050                                   ; 0B4B _ E9, 000000DC

?_045:  mov     eax, dword [ebp+8H]                     ; 0B50 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 0B53 _ 0F B6. 40, 03
        cmp     al, 2                                   ; 0B57 _ 3C, 02
        jnz     ?_046                                   ; 0B59 _ 75, 1B
        mov     eax, dword [ebp+8H]                     ; 0B5B _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 0B5E _ 0F B6. 55, FC
        mov     byte [eax+1H], dl                       ; 0B62 _ 88. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0B65 _ 8B. 45, 08
        mov     byte [eax+3H], 3                        ; 0B68 _ C6. 40, 03, 03
        mov     eax, 0                                  ; 0B6C _ B8, 00000000
        jmp     ?_050                                   ; 0B71 _ E9, 000000B6

?_046:  mov     eax, dword [ebp+8H]                     ; 0B76 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 0B79 _ 0F B6. 40, 03
        cmp     al, 3                                   ; 0B7D _ 3C, 03
        jne     ?_049                                   ; 0B7F _ 0F 85, 000000A2
        mov     eax, dword [ebp+8H]                     ; 0B85 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 0B88 _ 0F B6. 55, FC
        mov     byte [eax+2H], dl                       ; 0B8C _ 88. 50, 02
        mov     eax, dword [ebp+8H]                     ; 0B8F _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 0B92 _ C6. 40, 03, 01
        mov     eax, dword [ebp+8H]                     ; 0B96 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 0B99 _ 0F B6. 00
        movzx   eax, al                                 ; 0B9C _ 0F B6. C0
        and     eax, 07H                                ; 0B9F _ 83. E0, 07
        mov     edx, eax                                ; 0BA2 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0BA4 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 0BA7 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 0BAA _ 8B. 45, 08
        movzx   eax, byte [eax+1H]                      ; 0BAD _ 0F B6. 40, 01
        movzx   edx, al                                 ; 0BB1 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 0BB4 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 0BB7 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0BBA _ 8B. 45, 08
        movzx   eax, byte [eax+2H]                      ; 0BBD _ 0F B6. 40, 02
        movzx   edx, al                                 ; 0BC1 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 0BC4 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0BC7 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 0BCA _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 0BCD _ 0F B6. 00
        movzx   eax, al                                 ; 0BD0 _ 0F B6. C0
        and     eax, 10H                                ; 0BD3 _ 83. E0, 10
        test    eax, eax                                ; 0BD6 _ 85. C0
        jz      ?_047                                   ; 0BD8 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 0BDA _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0BDD _ 8B. 40, 04
        or      eax, 0FFFFFF00H                         ; 0BE0 _ 0D, FFFFFF00
        mov     edx, eax                                ; 0BE5 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0BE7 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 0BEA _ 89. 50, 04
?_047:  mov     eax, dword [ebp+8H]                     ; 0BED _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 0BF0 _ 0F B6. 00
        movzx   eax, al                                 ; 0BF3 _ 0F B6. C0
        and     eax, 20H                                ; 0BF6 _ 83. E0, 20
        test    eax, eax                                ; 0BF9 _ 85. C0
        jz      ?_048                                   ; 0BFB _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 0BFD _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0C00 _ 8B. 40, 08
        or      eax, 0FFFFFF00H                         ; 0C03 _ 0D, FFFFFF00
        mov     edx, eax                                ; 0C08 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0C0A _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0C0D _ 89. 50, 08
?_048:  mov     eax, dword [ebp+8H]                     ; 0C10 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0C13 _ 8B. 40, 08
        neg     eax                                     ; 0C16 _ F7. D8
        mov     edx, eax                                ; 0C18 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0C1A _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0C1D _ 89. 50, 08
        mov     eax, 1                                  ; 0C20 _ B8, 00000001
        jmp     ?_050                                   ; 0C25 _ EB, 05

?_049:  mov     eax, 4294967295                         ; 0C27 _ B8, FFFFFFFF
?_050:  leave                                           ; 0C2C _ C9
        ret                                             ; 0C2D _ C3
; mouse_decode End of function

computeMousePosition:; Function begin
        push    ebp                                     ; 0C2E _ 55
        mov     ebp, esp                                ; 0C2F _ 89. E5
        sub     esp, 24                                 ; 0C31 _ 83. EC, 18
        movzx   eax, word [?_154]                       ; 0C34 _ 0F B7. 05, 00000004(d)
        cwde                                            ; 0C3B _ 98
        mov     dword [ebp-14H], eax                    ; 0C3C _ 89. 45, EC
        movzx   eax, word [?_155]                       ; 0C3F _ 0F B7. 05, 00000006(d)
        cwde                                            ; 0C46 _ 98
        mov     dword [ebp-10H], eax                    ; 0C47 _ 89. 45, F0
        mov     eax, dword [ebp+10H]                    ; 0C4A _ 8B. 45, 10
        mov     dword [eax+4H], 16                      ; 0C4D _ C7. 40, 04, 00000010
        mov     eax, dword [ebp+10H]                    ; 0C54 _ 8B. 45, 10
        mov     dword [eax+8H], 16                      ; 0C57 _ C7. 40, 08, 00000010
        mov     eax, dword [ebp+14H]                    ; 0C5E _ 8B. 45, 14
        mov     edx, dword [eax+4H]                     ; 0C61 _ 8B. 50, 04
        mov     eax, dword [mx]                         ; 0C64 _ A1, 000000F0(d)
        add     eax, edx                                ; 0C69 _ 01. D0
        mov     dword [mx], eax                         ; 0C6B _ A3, 000000F0(d)
        mov     eax, dword [ebp+14H]                    ; 0C70 _ 8B. 45, 14
        mov     edx, dword [eax+8H]                     ; 0C73 _ 8B. 50, 08
        mov     eax, dword [my]                         ; 0C76 _ A1, 000000F4(d)
        add     eax, edx                                ; 0C7B _ 01. D0
        mov     dword [my], eax                         ; 0C7D _ A3, 000000F4(d)
        mov     eax, dword [mx]                         ; 0C82 _ A1, 000000F0(d)
        test    eax, eax                                ; 0C87 _ 85. C0
        jns     ?_051                                   ; 0C89 _ 79, 0A
        mov     dword [mx], 0                           ; 0C8B _ C7. 05, 000000F0(d), 00000000
?_051:  mov     eax, dword [my]                         ; 0C95 _ A1, 000000F4(d)
        test    eax, eax                                ; 0C9A _ 85. C0
        jns     ?_052                                   ; 0C9C _ 79, 0A
        mov     dword [my], 0                           ; 0C9E _ C7. 05, 000000F4(d), 00000000
?_052:  mov     eax, dword [ebp-10H]                    ; 0CA8 _ 8B. 45, F0
        lea     edx, [eax-10H]                          ; 0CAB _ 8D. 50, F0
        mov     eax, dword [my]                         ; 0CAE _ A1, 000000F4(d)
        cmp     edx, eax                                ; 0CB3 _ 39. C2
        jge     ?_053                                   ; 0CB5 _ 7D, 10
        mov     eax, dword [my]                         ; 0CB7 _ A1, 000000F4(d)
        mov     edx, dword [ebp-10H]                    ; 0CBC _ 8B. 55, F0
        sub     edx, eax                                ; 0CBF _ 29. C2
        mov     eax, dword [ebp+10H]                    ; 0CC1 _ 8B. 45, 10
        mov     dword [eax+8H], edx                     ; 0CC4 _ 89. 50, 08
?_053:  mov     dword [ebp-0CH], 1                      ; 0CC7 _ C7. 45, F4, 00000001
        mov     eax, dword [ebp-14H]                    ; 0CCE _ 8B. 45, EC
        sub     eax, dword [ebp-0CH]                    ; 0CD1 _ 2B. 45, F4
        mov     edx, eax                                ; 0CD4 _ 89. C2
        mov     eax, dword [mx]                         ; 0CD6 _ A1, 000000F0(d)
        cmp     edx, eax                                ; 0CDB _ 39. C2
        jge     ?_054                                   ; 0CDD _ 7D, 14
        mov     eax, dword [ebp-14H]                    ; 0CDF _ 8B. 45, EC
        sub     eax, dword [ebp-0CH]                    ; 0CE2 _ 2B. 45, F4
        mov     dword [mx], eax                         ; 0CE5 _ A3, 000000F0(d)
        mov     eax, dword [ebp+10H]                    ; 0CEA _ 8B. 45, 10
        mov     edx, dword [ebp-0CH]                    ; 0CED _ 8B. 55, F4
        mov     dword [eax+4H], edx                     ; 0CF0 _ 89. 50, 04
?_054:  mov     eax, dword [ebp-10H]                    ; 0CF3 _ 8B. 45, F0
        sub     eax, dword [ebp-0CH]                    ; 0CF6 _ 2B. 45, F4
        mov     edx, eax                                ; 0CF9 _ 89. C2
        mov     eax, dword [my]                         ; 0CFB _ A1, 000000F4(d)
        cmp     edx, eax                                ; 0D00 _ 39. C2
        jge     ?_055                                   ; 0D02 _ 7D, 14
        mov     eax, dword [ebp-10H]                    ; 0D04 _ 8B. 45, F0
        sub     eax, dword [ebp-0CH]                    ; 0D07 _ 2B. 45, F4
        mov     dword [my], eax                         ; 0D0A _ A3, 000000F4(d)
        mov     eax, dword [ebp+10H]                    ; 0D0F _ 8B. 45, 10
        mov     edx, dword [ebp-0CH]                    ; 0D12 _ 8B. 55, F4
        mov     dword [eax+8H], edx                     ; 0D15 _ 89. 50, 08
?_055:  sub     esp, 8                                  ; 0D18 _ 83. EC, 08
        push    ?_143                                   ; 0D1B _ 68, 00000010(d)
        push    7                                       ; 0D20 _ 6A, 07
        push    0                                       ; 0D22 _ 6A, 00
        push    0                                       ; 0D24 _ 6A, 00
        push    dword [ebp+0CH]                         ; 0D26 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0D29 _ FF. 75, 08
        call    showString                              ; 0D2C _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0D31 _ 83. C4, 20
        nop                                             ; 0D34 _ 90
        leave                                           ; 0D35 _ C9
        ret                                             ; 0D36 _ C3
; computeMousePosition End of function

show_mouse_info:; Function begin
        push    ebp                                     ; 0D37 _ 55
        mov     ebp, esp                                ; 0D38 _ 89. E5
        sub     esp, 24                                 ; 0D3A _ 83. EC, 18
        mov     eax, dword [buf_back]                   ; 0D3D _ A1, 000000F8(d)
        mov     dword [ebp-0CH], eax                    ; 0D42 _ 89. 45, F4
        mov     byte [ebp-0DH], 0                       ; 0D45 _ C6. 45, F3, 00
        call    io_sti                                  ; 0D49 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 0D4E _ 83. EC, 0C
        push    mouseinfo                               ; 0D51 _ 68, 00000008(d)
        call    fifo8_get                               ; 0D56 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0D5B _ 83. C4, 10
        mov     byte [ebp-0DH], al                      ; 0D5E _ 88. 45, F3
        movzx   eax, byte [ebp-0DH]                     ; 0D61 _ 0F B6. 45, F3
        sub     esp, 8                                  ; 0D65 _ 83. EC, 08
        push    eax                                     ; 0D68 _ 50
        push    mdec                                    ; 0D69 _ 68, 000000E0(d)
        call    mouse_decode                            ; 0D6E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0D73 _ 83. C4, 10
        cmp     eax, 1                                  ; 0D76 _ 83. F8, 01
        jnz     ?_056                                   ; 0D79 _ 75, 31
        push    mdec                                    ; 0D7B _ 68, 000000E0(d)
        push    dword [ebp+10H]                         ; 0D80 _ FF. 75, 10
        push    dword [ebp+0CH]                         ; 0D83 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0D86 _ FF. 75, 08
        call    computeMousePosition                    ; 0D89 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0D8E _ 83. C4, 10
        mov     edx, dword [my]                         ; 0D91 _ 8B. 15, 000000F4(d)
        mov     eax, dword [mx]                         ; 0D97 _ A1, 000000F0(d)
        push    edx                                     ; 0D9C _ 52
        push    eax                                     ; 0D9D _ 50
        push    dword [ebp+10H]                         ; 0D9E _ FF. 75, 10
        push    dword [ebp+8H]                          ; 0DA1 _ FF. 75, 08
        call    sheet_slide_mouse                       ; 0DA4 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0DA9 _ 83. C4, 10
?_056:  nop                                             ; 0DAC _ 90
        leave                                           ; 0DAD _ C9
        ret                                             ; 0DAE _ C3
; show_mouse_info End of function

showMemoryInfo:; Function begin
        push    ebp                                     ; 0DAF _ 55
        mov     ebp, esp                                ; 0DB0 _ 89. E5
        sub     esp, 56                                 ; 0DB2 _ 83. EC, 38
        mov     dword [ebp-30H], 0                      ; 0DB5 _ C7. 45, D0, 00000000
        mov     dword [ebp-2CH], 0                      ; 0DBC _ C7. 45, D4, 00000000
        mov     dword [ebp-28H], 104                    ; 0DC3 _ C7. 45, D8, 00000068
        mov     dword [ebp-24H], 80                     ; 0DCA _ C7. 45, DC, 00000050
        mov     edx, dword [ysize]                      ; 0DD1 _ 8B. 15, 00000204(d)
        mov     eax, dword [ebp+0CH]                    ; 0DD7 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 0DDA _ 8B. 00
        sub     esp, 4                                  ; 0DDC _ 83. EC, 04
        push    edx                                     ; 0DDF _ 52
        push    dword [ebp+1CH]                         ; 0DE0 _ FF. 75, 1C
        push    eax                                     ; 0DE3 _ 50
        call    init_screen8                            ; 0DE4 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0DE9 _ 83. C4, 10
        mov     eax, dword [ebp+20H]                    ; 0DEC _ 8B. 45, 20
        movsx   eax, al                                 ; 0DEF _ 0F BE. C0
        sub     esp, 8                                  ; 0DF2 _ 83. EC, 08
        push    ?_144                                   ; 0DF5 _ 68, 00000028(d)
        push    eax                                     ; 0DFA _ 50
        push    dword [ebp-2CH]                         ; 0DFB _ FF. 75, D4
        push    dword [ebp-30H]                         ; 0DFE _ FF. 75, D0
        push    dword [ebp+0CH]                         ; 0E01 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0E04 _ FF. 75, 08
        call    showString                              ; 0E07 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0E0C _ 83. C4, 20
        mov     eax, dword [ebp+18H]                    ; 0E0F _ 8B. 45, 18
        sub     esp, 12                                 ; 0E12 _ 83. EC, 0C
        push    eax                                     ; 0E15 _ 50
        call    intToHexStr                             ; 0E16 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0E1B _ 83. C4, 10
        mov     dword [ebp-20H], eax                    ; 0E1E _ 89. 45, E0
        mov     eax, dword [ebp+20H]                    ; 0E21 _ 8B. 45, 20
        movsx   eax, al                                 ; 0E24 _ 0F BE. C0
        sub     esp, 8                                  ; 0E27 _ 83. EC, 08
        push    dword [ebp-20H]                         ; 0E2A _ FF. 75, E0
        push    eax                                     ; 0E2D _ 50
        push    dword [ebp-2CH]                         ; 0E2E _ FF. 75, D4
        push    dword [ebp-28H]                         ; 0E31 _ FF. 75, D8
        push    dword [ebp+0CH]                         ; 0E34 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0E37 _ FF. 75, 08
        call    showString                              ; 0E3A _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0E3F _ 83. C4, 20
        add     dword [ebp-2CH], 16                     ; 0E42 _ 83. 45, D4, 10
        mov     eax, dword [ebp+20H]                    ; 0E46 _ 8B. 45, 20
        movsx   eax, al                                 ; 0E49 _ 0F BE. C0
        sub     esp, 8                                  ; 0E4C _ 83. EC, 08
        push    ?_145                                   ; 0E4F _ 68, 00000032(d)
        push    eax                                     ; 0E54 _ 50
        push    dword [ebp-2CH]                         ; 0E55 _ FF. 75, D4
        push    dword [ebp-30H]                         ; 0E58 _ FF. 75, D0
        push    dword [ebp+0CH]                         ; 0E5B _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0E5E _ FF. 75, 08
        call    showString                              ; 0E61 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0E66 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0E69 _ 8B. 45, 10
        mov     eax, dword [eax]                        ; 0E6C _ 8B. 00
        sub     esp, 12                                 ; 0E6E _ 83. EC, 0C
        push    eax                                     ; 0E71 _ 50
        call    intToHexStr                             ; 0E72 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0E77 _ 83. C4, 10
        mov     dword [ebp-1CH], eax                    ; 0E7A _ 89. 45, E4
        mov     eax, dword [ebp+20H]                    ; 0E7D _ 8B. 45, 20
        movsx   eax, al                                 ; 0E80 _ 0F BE. C0
        sub     esp, 8                                  ; 0E83 _ 83. EC, 08
        push    dword [ebp-1CH]                         ; 0E86 _ FF. 75, E4
        push    eax                                     ; 0E89 _ 50
        push    dword [ebp-2CH]                         ; 0E8A _ FF. 75, D4
        push    dword [ebp-28H]                         ; 0E8D _ FF. 75, D8
        push    dword [ebp+0CH]                         ; 0E90 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0E93 _ FF. 75, 08
        call    showString                              ; 0E96 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0E9B _ 83. C4, 20
        add     dword [ebp-2CH], 16                     ; 0E9E _ 83. 45, D4, 10
        mov     eax, dword [ebp+20H]                    ; 0EA2 _ 8B. 45, 20
        movsx   eax, al                                 ; 0EA5 _ 0F BE. C0
        sub     esp, 8                                  ; 0EA8 _ 83. EC, 08
        push    ?_146                                   ; 0EAB _ 68, 0000003E(d)
        push    eax                                     ; 0EB0 _ 50
        push    dword [ebp-2CH]                         ; 0EB1 _ FF. 75, D4
        push    dword [ebp-30H]                         ; 0EB4 _ FF. 75, D0
        push    dword [ebp+0CH]                         ; 0EB7 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0EBA _ FF. 75, 08
        call    showString                              ; 0EBD _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0EC2 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0EC5 _ 8B. 45, 10
        mov     eax, dword [eax+4H]                     ; 0EC8 _ 8B. 40, 04
        sub     esp, 12                                 ; 0ECB _ 83. EC, 0C
        push    eax                                     ; 0ECE _ 50
        call    intToHexStr                             ; 0ECF _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0ED4 _ 83. C4, 10
        mov     dword [ebp-18H], eax                    ; 0ED7 _ 89. 45, E8
        mov     eax, dword [ebp+20H]                    ; 0EDA _ 8B. 45, 20
        movsx   eax, al                                 ; 0EDD _ 0F BE. C0
        sub     esp, 8                                  ; 0EE0 _ 83. EC, 08
        push    dword [ebp-18H]                         ; 0EE3 _ FF. 75, E8
        push    eax                                     ; 0EE6 _ 50
        push    dword [ebp-2CH]                         ; 0EE7 _ FF. 75, D4
        push    dword [ebp-28H]                         ; 0EEA _ FF. 75, D8
        push    dword [ebp+0CH]                         ; 0EED _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0EF0 _ FF. 75, 08
        call    showString                              ; 0EF3 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0EF8 _ 83. C4, 20
        add     dword [ebp-2CH], 16                     ; 0EFB _ 83. 45, D4, 10
        mov     eax, dword [ebp+20H]                    ; 0EFF _ 8B. 45, 20
        movsx   eax, al                                 ; 0F02 _ 0F BE. C0
        sub     esp, 8                                  ; 0F05 _ 83. EC, 08
        push    ?_147                                   ; 0F08 _ 68, 0000004A(d)
        push    eax                                     ; 0F0D _ 50
        push    dword [ebp-2CH]                         ; 0F0E _ FF. 75, D4
        push    dword [ebp-30H]                         ; 0F11 _ FF. 75, D0
        push    dword [ebp+0CH]                         ; 0F14 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0F17 _ FF. 75, 08
        call    showString                              ; 0F1A _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0F1F _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0F22 _ 8B. 45, 10
        mov     eax, dword [eax+8H]                     ; 0F25 _ 8B. 40, 08
        sub     esp, 12                                 ; 0F28 _ 83. EC, 0C
        push    eax                                     ; 0F2B _ 50
        call    intToHexStr                             ; 0F2C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0F31 _ 83. C4, 10
        mov     dword [ebp-14H], eax                    ; 0F34 _ 89. 45, EC
        mov     eax, dword [ebp+20H]                    ; 0F37 _ 8B. 45, 20
        movsx   eax, al                                 ; 0F3A _ 0F BE. C0
        sub     esp, 8                                  ; 0F3D _ 83. EC, 08
        push    dword [ebp-14H]                         ; 0F40 _ FF. 75, EC
        push    eax                                     ; 0F43 _ 50
        push    dword [ebp-2CH]                         ; 0F44 _ FF. 75, D4
        push    dword [ebp-28H]                         ; 0F47 _ FF. 75, D8
        push    dword [ebp+0CH]                         ; 0F4A _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0F4D _ FF. 75, 08
        call    showString                              ; 0F50 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0F55 _ 83. C4, 20
        add     dword [ebp-2CH], 16                     ; 0F58 _ 83. 45, D4, 10
        mov     eax, dword [ebp+20H]                    ; 0F5C _ 8B. 45, 20
        movsx   eax, al                                 ; 0F5F _ 0F BE. C0
        sub     esp, 8                                  ; 0F62 _ 83. EC, 08
        push    ?_148                                   ; 0F65 _ 68, 00000056(d)
        push    eax                                     ; 0F6A _ 50
        push    dword [ebp-2CH]                         ; 0F6B _ FF. 75, D4
        push    dword [ebp-30H]                         ; 0F6E _ FF. 75, D0
        push    dword [ebp+0CH]                         ; 0F71 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0F74 _ FF. 75, 08
        call    showString                              ; 0F77 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0F7C _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0F7F _ 8B. 45, 10
        mov     eax, dword [eax+0CH]                    ; 0F82 _ 8B. 40, 0C
        sub     esp, 12                                 ; 0F85 _ 83. EC, 0C
        push    eax                                     ; 0F88 _ 50
        call    intToHexStr                             ; 0F89 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0F8E _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 0F91 _ 89. 45, F0
        mov     eax, dword [ebp+20H]                    ; 0F94 _ 8B. 45, 20
        movsx   eax, al                                 ; 0F97 _ 0F BE. C0
        sub     esp, 8                                  ; 0F9A _ 83. EC, 08
        push    dword [ebp-10H]                         ; 0F9D _ FF. 75, F0
        push    eax                                     ; 0FA0 _ 50
        push    dword [ebp-2CH]                         ; 0FA1 _ FF. 75, D4
        push    dword [ebp-28H]                         ; 0FA4 _ FF. 75, D8
        push    dword [ebp+0CH]                         ; 0FA7 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0FAA _ FF. 75, 08
        call    showString                              ; 0FAD _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0FB2 _ 83. C4, 20
        add     dword [ebp-2CH], 16                     ; 0FB5 _ 83. 45, D4, 10
        mov     eax, dword [ebp+20H]                    ; 0FB9 _ 8B. 45, 20
        movsx   eax, al                                 ; 0FBC _ 0F BE. C0
        sub     esp, 8                                  ; 0FBF _ 83. EC, 08
        push    ?_149                                   ; 0FC2 _ 68, 00000063(d)
        push    eax                                     ; 0FC7 _ 50
        push    dword [ebp-2CH]                         ; 0FC8 _ FF. 75, D4
        push    dword [ebp-30H]                         ; 0FCB _ FF. 75, D0
        push    dword [ebp+0CH]                         ; 0FCE _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0FD1 _ FF. 75, 08
        call    showString                              ; 0FD4 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0FD9 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0FDC _ 8B. 45, 10
        mov     eax, dword [eax+10H]                    ; 0FDF _ 8B. 40, 10
        sub     esp, 12                                 ; 0FE2 _ 83. EC, 0C
        push    eax                                     ; 0FE5 _ 50
        call    intToHexStr                             ; 0FE6 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0FEB _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 0FEE _ 89. 45, F4
        mov     eax, dword [ebp+20H]                    ; 0FF1 _ 8B. 45, 20
        movsx   eax, al                                 ; 0FF4 _ 0F BE. C0
        sub     esp, 8                                  ; 0FF7 _ 83. EC, 08
        push    dword [ebp-0CH]                         ; 0FFA _ FF. 75, F4
        push    eax                                     ; 0FFD _ 50
        push    dword [ebp-2CH]                         ; 0FFE _ FF. 75, D4
        push    dword [ebp-28H]                         ; 1001 _ FF. 75, D8
        push    dword [ebp+0CH]                         ; 1004 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1007 _ FF. 75, 08
        call    showString                              ; 100A _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 100F _ 83. C4, 20
        nop                                             ; 1012 _ 90
        leave                                           ; 1013 _ C9
        ret                                             ; 1014 _ C3
; showMemoryInfo End of function

init_screen8:; Function begin
        push    ebp                                     ; 1015 _ 55
        mov     ebp, esp                                ; 1016 _ 89. E5
        push    ebx                                     ; 1018 _ 53
        mov     eax, dword [ebp+10H]                    ; 1019 _ 8B. 45, 10
        lea     edx, [eax-1DH]                          ; 101C _ 8D. 50, E3
        mov     eax, dword [ebp+0CH]                    ; 101F _ 8B. 45, 0C
        sub     eax, 1                                  ; 1022 _ 83. E8, 01
        push    edx                                     ; 1025 _ 52
        push    eax                                     ; 1026 _ 50
        push    0                                       ; 1027 _ 6A, 00
        push    0                                       ; 1029 _ 6A, 00
        push    14                                      ; 102B _ 6A, 0E
        push    dword [ebp+0CH]                         ; 102D _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1030 _ FF. 75, 08
        call    boxfill8                                ; 1033 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1038 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 103B _ 8B. 45, 10
        lea     ecx, [eax-1CH]                          ; 103E _ 8D. 48, E4
        mov     eax, dword [ebp+0CH]                    ; 1041 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 1044 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 1047 _ 8B. 45, 10
        sub     eax, 28                                 ; 104A _ 83. E8, 1C
        push    ecx                                     ; 104D _ 51
        push    edx                                     ; 104E _ 52
        push    eax                                     ; 104F _ 50
        push    0                                       ; 1050 _ 6A, 00
        push    8                                       ; 1052 _ 6A, 08
        push    dword [ebp+0CH]                         ; 1054 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1057 _ FF. 75, 08
        call    boxfill8                                ; 105A _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 105F _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 1062 _ 8B. 45, 10
        lea     ecx, [eax-1BH]                          ; 1065 _ 8D. 48, E5
        mov     eax, dword [ebp+0CH]                    ; 1068 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 106B _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 106E _ 8B. 45, 10
        sub     eax, 27                                 ; 1071 _ 83. E8, 1B
        push    ecx                                     ; 1074 _ 51
        push    edx                                     ; 1075 _ 52
        push    eax                                     ; 1076 _ 50
        push    0                                       ; 1077 _ 6A, 00
        push    7                                       ; 1079 _ 6A, 07
        push    dword [ebp+0CH]                         ; 107B _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 107E _ FF. 75, 08
        call    boxfill8                                ; 1081 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1086 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 1089 _ 8B. 45, 10
        lea     ecx, [eax-1H]                           ; 108C _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 108F _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 1092 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 1095 _ 8B. 45, 10
        sub     eax, 26                                 ; 1098 _ 83. E8, 1A
        push    ecx                                     ; 109B _ 51
        push    edx                                     ; 109C _ 52
        push    eax                                     ; 109D _ 50
        push    0                                       ; 109E _ 6A, 00
        push    8                                       ; 10A0 _ 6A, 08
        push    dword [ebp+0CH]                         ; 10A2 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 10A5 _ FF. 75, 08
        call    boxfill8                                ; 10A8 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 10AD _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 10B0 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 10B3 _ 8D. 50, E8
        mov     eax, dword [ebp+10H]                    ; 10B6 _ 8B. 45, 10
        sub     eax, 24                                 ; 10B9 _ 83. E8, 18
        push    edx                                     ; 10BC _ 52
        push    59                                      ; 10BD _ 6A, 3B
        push    eax                                     ; 10BF _ 50
        push    3                                       ; 10C0 _ 6A, 03
        push    7                                       ; 10C2 _ 6A, 07
        push    dword [ebp+0CH]                         ; 10C4 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 10C7 _ FF. 75, 08
        call    boxfill8                                ; 10CA _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 10CF _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 10D2 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 10D5 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 10D8 _ 8B. 45, 10
        sub     eax, 24                                 ; 10DB _ 83. E8, 18
        push    edx                                     ; 10DE _ 52
        push    2                                       ; 10DF _ 6A, 02
        push    eax                                     ; 10E1 _ 50
        push    2                                       ; 10E2 _ 6A, 02
        push    7                                       ; 10E4 _ 6A, 07
        push    dword [ebp+0CH]                         ; 10E6 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 10E9 _ FF. 75, 08
        call    boxfill8                                ; 10EC _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 10F1 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 10F4 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 10F7 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 10FA _ 8B. 45, 10
        sub     eax, 4                                  ; 10FD _ 83. E8, 04
        push    edx                                     ; 1100 _ 52
        push    59                                      ; 1101 _ 6A, 3B
        push    eax                                     ; 1103 _ 50
        push    3                                       ; 1104 _ 6A, 03
        push    15                                      ; 1106 _ 6A, 0F
        push    dword [ebp+0CH]                         ; 1108 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 110B _ FF. 75, 08
        call    boxfill8                                ; 110E _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1113 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 1116 _ 8B. 45, 10
        lea     edx, [eax-5H]                           ; 1119 _ 8D. 50, FB
        mov     eax, dword [ebp+10H]                    ; 111C _ 8B. 45, 10
        sub     eax, 23                                 ; 111F _ 83. E8, 17
        push    edx                                     ; 1122 _ 52
        push    59                                      ; 1123 _ 6A, 3B
        push    eax                                     ; 1125 _ 50
        push    59                                      ; 1126 _ 6A, 3B
        push    15                                      ; 1128 _ 6A, 0F
        push    dword [ebp+0CH]                         ; 112A _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 112D _ FF. 75, 08
        call    boxfill8                                ; 1130 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1135 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 1138 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 113B _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 113E _ 8B. 45, 10
        sub     eax, 3                                  ; 1141 _ 83. E8, 03
        push    edx                                     ; 1144 _ 52
        push    59                                      ; 1145 _ 6A, 3B
        push    eax                                     ; 1147 _ 50
        push    2                                       ; 1148 _ 6A, 02
        push    0                                       ; 114A _ 6A, 00
        push    dword [ebp+0CH]                         ; 114C _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 114F _ FF. 75, 08
        call    boxfill8                                ; 1152 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1157 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 115A _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 115D _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 1160 _ 8B. 45, 10
        sub     eax, 24                                 ; 1163 _ 83. E8, 18
        push    edx                                     ; 1166 _ 52
        push    60                                      ; 1167 _ 6A, 3C
        push    eax                                     ; 1169 _ 50
        push    60                                      ; 116A _ 6A, 3C
        push    0                                       ; 116C _ 6A, 00
        push    dword [ebp+0CH]                         ; 116E _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1171 _ FF. 75, 08
        call    boxfill8                                ; 1174 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1179 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 117C _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 117F _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 1182 _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 1185 _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 1188 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 118B _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 118E _ 8B. 45, 0C
        sub     eax, 47                                 ; 1191 _ 83. E8, 2F
        push    ebx                                     ; 1194 _ 53
        push    ecx                                     ; 1195 _ 51
        push    edx                                     ; 1196 _ 52
        push    eax                                     ; 1197 _ 50
        push    7                                       ; 1198 _ 6A, 07
        push    dword [ebp+0CH]                         ; 119A _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 119D _ FF. 75, 08
        call    boxfill8                                ; 11A0 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 11A5 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 11A8 _ 8B. 45, 10
        lea     ebx, [eax-4H]                           ; 11AB _ 8D. 58, FC
        mov     eax, dword [ebp+0CH]                    ; 11AE _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 11B1 _ 8D. 48, FD
        mov     eax, dword [ebp+10H]                    ; 11B4 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 11B7 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 11BA _ 8B. 45, 0C
        sub     eax, 3                                  ; 11BD _ 83. E8, 03
        push    ebx                                     ; 11C0 _ 53
        push    ecx                                     ; 11C1 _ 51
        push    edx                                     ; 11C2 _ 52
        push    eax                                     ; 11C3 _ 50
        push    7                                       ; 11C4 _ 6A, 07
        push    dword [ebp+0CH]                         ; 11C6 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 11C9 _ FF. 75, 08
        call    boxfill8                                ; 11CC _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 11D1 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 11D4 _ 8B. 45, 10
        lea     ebx, [eax-18H]                          ; 11D7 _ 8D. 58, E8
        mov     eax, dword [ebp+0CH]                    ; 11DA _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 11DD _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 11E0 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 11E3 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 11E6 _ 8B. 45, 0C
        sub     eax, 47                                 ; 11E9 _ 83. E8, 2F
        push    ebx                                     ; 11EC _ 53
        push    ecx                                     ; 11ED _ 51
        push    edx                                     ; 11EE _ 52
        push    eax                                     ; 11EF _ 50
        push    15                                      ; 11F0 _ 6A, 0F
        push    dword [ebp+0CH]                         ; 11F2 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 11F5 _ FF. 75, 08
        call    boxfill8                                ; 11F8 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 11FD _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 1200 _ 8B. 45, 10
        lea     ebx, [eax-4H]                           ; 1203 _ 8D. 58, FC
        mov     eax, dword [ebp+0CH]                    ; 1206 _ 8B. 45, 0C
        lea     ecx, [eax-2FH]                          ; 1209 _ 8D. 48, D1
        mov     eax, dword [ebp+10H]                    ; 120C _ 8B. 45, 10
        lea     edx, [eax-17H]                          ; 120F _ 8D. 50, E9
        mov     eax, dword [ebp+0CH]                    ; 1212 _ 8B. 45, 0C
        sub     eax, 47                                 ; 1215 _ 83. E8, 2F
        push    ebx                                     ; 1218 _ 53
        push    ecx                                     ; 1219 _ 51
        push    edx                                     ; 121A _ 52
        push    eax                                     ; 121B _ 50
        push    15                                      ; 121C _ 6A, 0F
        push    dword [ebp+0CH]                         ; 121E _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1221 _ FF. 75, 08
        call    boxfill8                                ; 1224 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1229 _ 83. C4, 1C
        nop                                             ; 122C _ 90
        mov     ebx, dword [ebp-4H]                     ; 122D _ 8B. 5D, FC
        leave                                           ; 1230 _ C9
        ret                                             ; 1231 _ C3
; init_screen8 End of function

make_window8:; Function begin
        push    ebp                                     ; 1232 _ 55
        mov     ebp, esp                                ; 1233 _ 89. E5
        push    ebx                                     ; 1235 _ 53
        sub     esp, 36                                 ; 1236 _ 83. EC, 24
        mov     eax, dword [ebp+0CH]                    ; 1239 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 123C _ 8B. 40, 04
        mov     dword [ebp-10H], eax                    ; 123F _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 1242 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 1245 _ 8B. 40, 08
        mov     dword [ebp-0CH], eax                    ; 1248 _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 124B _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 124E _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1251 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1254 _ 8B. 00
        push    0                                       ; 1256 _ 6A, 00
        push    edx                                     ; 1258 _ 52
        push    0                                       ; 1259 _ 6A, 00
        push    0                                       ; 125B _ 6A, 00
        push    8                                       ; 125D _ 6A, 08
        push    dword [ebp-10H]                         ; 125F _ FF. 75, F0
        push    eax                                     ; 1262 _ 50
        call    boxfill8                                ; 1263 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1268 _ 83. C4, 1C
        mov     eax, dword [ebp-10H]                    ; 126B _ 8B. 45, F0
        lea     edx, [eax-2H]                           ; 126E _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 1271 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1274 _ 8B. 00
        push    1                                       ; 1276 _ 6A, 01
        push    edx                                     ; 1278 _ 52
        push    1                                       ; 1279 _ 6A, 01
        push    1                                       ; 127B _ 6A, 01
        push    7                                       ; 127D _ 6A, 07
        push    dword [ebp-10H]                         ; 127F _ FF. 75, F0
        push    eax                                     ; 1282 _ 50
        call    boxfill8                                ; 1283 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1288 _ 83. C4, 1C
        mov     eax, dword [ebp-0CH]                    ; 128B _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 128E _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1291 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1294 _ 8B. 00
        push    edx                                     ; 1296 _ 52
        push    0                                       ; 1297 _ 6A, 00
        push    0                                       ; 1299 _ 6A, 00
        push    0                                       ; 129B _ 6A, 00
        push    8                                       ; 129D _ 6A, 08
        push    dword [ebp-10H]                         ; 129F _ FF. 75, F0
        push    eax                                     ; 12A2 _ 50
        call    boxfill8                                ; 12A3 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 12A8 _ 83. C4, 1C
        mov     eax, dword [ebp-0CH]                    ; 12AB _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 12AE _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 12B1 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 12B4 _ 8B. 00
        push    edx                                     ; 12B6 _ 52
        push    1                                       ; 12B7 _ 6A, 01
        push    1                                       ; 12B9 _ 6A, 01
        push    1                                       ; 12BB _ 6A, 01
        push    8                                       ; 12BD _ 6A, 08
        push    dword [ebp-10H]                         ; 12BF _ FF. 75, F0
        push    eax                                     ; 12C2 _ 50
        call    boxfill8                                ; 12C3 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 12C8 _ 83. C4, 1C
        mov     eax, dword [ebp-0CH]                    ; 12CB _ 8B. 45, F4
        lea     ebx, [eax-2H]                           ; 12CE _ 8D. 58, FE
        mov     eax, dword [ebp-10H]                    ; 12D1 _ 8B. 45, F0
        lea     ecx, [eax-2H]                           ; 12D4 _ 8D. 48, FE
        mov     eax, dword [ebp-10H]                    ; 12D7 _ 8B. 45, F0
        lea     edx, [eax-2H]                           ; 12DA _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 12DD _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 12E0 _ 8B. 00
        push    ebx                                     ; 12E2 _ 53
        push    ecx                                     ; 12E3 _ 51
        push    1                                       ; 12E4 _ 6A, 01
        push    edx                                     ; 12E6 _ 52
        push    15                                      ; 12E7 _ 6A, 0F
        push    dword [ebp-10H]                         ; 12E9 _ FF. 75, F0
        push    eax                                     ; 12EC _ 50
        call    boxfill8                                ; 12ED _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 12F2 _ 83. C4, 1C
        mov     eax, dword [ebp-0CH]                    ; 12F5 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 12F8 _ 8D. 58, FF
        mov     eax, dword [ebp-10H]                    ; 12FB _ 8B. 45, F0
        lea     ecx, [eax-1H]                           ; 12FE _ 8D. 48, FF
        mov     eax, dword [ebp-10H]                    ; 1301 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 1304 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1307 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 130A _ 8B. 00
        push    ebx                                     ; 130C _ 53
        push    ecx                                     ; 130D _ 51
        push    0                                       ; 130E _ 6A, 00
        push    edx                                     ; 1310 _ 52
        push    0                                       ; 1311 _ 6A, 00
        push    dword [ebp-10H]                         ; 1313 _ FF. 75, F0
        push    eax                                     ; 1316 _ 50
        call    boxfill8                                ; 1317 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 131C _ 83. C4, 1C
        mov     eax, dword [ebp-0CH]                    ; 131F _ 8B. 45, F4
        lea     ecx, [eax-3H]                           ; 1322 _ 8D. 48, FD
        mov     eax, dword [ebp-10H]                    ; 1325 _ 8B. 45, F0
        lea     edx, [eax-3H]                           ; 1328 _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 132B _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 132E _ 8B. 00
        push    ecx                                     ; 1330 _ 51
        push    edx                                     ; 1331 _ 52
        push    2                                       ; 1332 _ 6A, 02
        push    2                                       ; 1334 _ 6A, 02
        push    8                                       ; 1336 _ 6A, 08
        push    dword [ebp-10H]                         ; 1338 _ FF. 75, F0
        push    eax                                     ; 133B _ 50
        call    boxfill8                                ; 133C _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1341 _ 83. C4, 1C
        mov     eax, dword [ebp-10H]                    ; 1344 _ 8B. 45, F0
        lea     edx, [eax-4H]                           ; 1347 _ 8D. 50, FC
        mov     eax, dword [ebp+0CH]                    ; 134A _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 134D _ 8B. 00
        push    20                                      ; 134F _ 6A, 14
        push    edx                                     ; 1351 _ 52
        push    3                                       ; 1352 _ 6A, 03
        push    3                                       ; 1354 _ 6A, 03
        push    12                                      ; 1356 _ 6A, 0C
        push    dword [ebp-10H]                         ; 1358 _ FF. 75, F0
        push    eax                                     ; 135B _ 50
        call    boxfill8                                ; 135C _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1361 _ 83. C4, 1C
        mov     eax, dword [ebp-0CH]                    ; 1364 _ 8B. 45, F4
        lea     ebx, [eax-2H]                           ; 1367 _ 8D. 58, FE
        mov     eax, dword [ebp-10H]                    ; 136A _ 8B. 45, F0
        lea     ecx, [eax-2H]                           ; 136D _ 8D. 48, FE
        mov     eax, dword [ebp-0CH]                    ; 1370 _ 8B. 45, F4
        lea     edx, [eax-2H]                           ; 1373 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 1376 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1379 _ 8B. 00
        push    ebx                                     ; 137B _ 53
        push    ecx                                     ; 137C _ 51
        push    edx                                     ; 137D _ 52
        push    1                                       ; 137E _ 6A, 01
        push    15                                      ; 1380 _ 6A, 0F
        push    dword [ebp-10H]                         ; 1382 _ FF. 75, F0
        push    eax                                     ; 1385 _ 50
        call    boxfill8                                ; 1386 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 138B _ 83. C4, 1C
        mov     eax, dword [ebp-0CH]                    ; 138E _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 1391 _ 8D. 58, FF
        mov     eax, dword [ebp-10H]                    ; 1394 _ 8B. 45, F0
        lea     ecx, [eax-1H]                           ; 1397 _ 8D. 48, FF
        mov     eax, dword [ebp-0CH]                    ; 139A _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 139D _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 13A0 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 13A3 _ 8B. 00
        push    ebx                                     ; 13A5 _ 53
        push    ecx                                     ; 13A6 _ 51
        push    edx                                     ; 13A7 _ 52
        push    0                                       ; 13A8 _ 6A, 00
        push    0                                       ; 13AA _ 6A, 00
        push    dword [ebp-10H]                         ; 13AC _ FF. 75, F0
        push    eax                                     ; 13AF _ 50
        call    boxfill8                                ; 13B0 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 13B5 _ 83. C4, 1C
        sub     esp, 8                                  ; 13B8 _ 83. EC, 08
        push    dword [ebp+10H]                         ; 13BB _ FF. 75, 10
        push    7                                       ; 13BE _ 6A, 07
        push    4                                       ; 13C0 _ 6A, 04
        push    24                                      ; 13C2 _ 6A, 18
        push    dword [ebp+0CH]                         ; 13C4 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 13C7 _ FF. 75, 08
        call    showString                              ; 13CA _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 13CF _ 83. C4, 20
        mov     dword [ebp-14H], 0                      ; 13D2 _ C7. 45, EC, 00000000
        jmp     ?_064                                   ; 13D9 _ E9, 00000083

?_057:  mov     dword [ebp-18H], 0                      ; 13DE _ C7. 45, E8, 00000000
        jmp     ?_063                                   ; 13E5 _ EB, 70

?_058:  mov     eax, dword [ebp-14H]                    ; 13E7 _ 8B. 45, EC
        shl     eax, 4                                  ; 13EA _ C1. E0, 04
        mov     edx, eax                                ; 13ED _ 89. C2
        mov     eax, dword [ebp-18H]                    ; 13EF _ 8B. 45, E8
        add     eax, edx                                ; 13F2 _ 01. D0
        add     eax, closebtn.1875                      ; 13F4 _ 05, 00000160(d)
        movzx   eax, byte [eax]                         ; 13F9 _ 0F B6. 00
        mov     byte [ebp-19H], al                      ; 13FC _ 88. 45, E7
        cmp     byte [ebp-19H], 64                      ; 13FF _ 80. 7D, E7, 40
        jnz     ?_059                                   ; 1403 _ 75, 06
        mov     byte [ebp-19H], 0                       ; 1405 _ C6. 45, E7, 00
        jmp     ?_062                                   ; 1409 _ EB, 1C

?_059:  cmp     byte [ebp-19H], 36                      ; 140B _ 80. 7D, E7, 24
        jnz     ?_060                                   ; 140F _ 75, 06
        mov     byte [ebp-19H], 15                      ; 1411 _ C6. 45, E7, 0F
        jmp     ?_062                                   ; 1415 _ EB, 10

?_060:  cmp     byte [ebp-19H], 81                      ; 1417 _ 80. 7D, E7, 51
        jnz     ?_061                                   ; 141B _ 75, 06
        mov     byte [ebp-19H], 8                       ; 141D _ C6. 45, E7, 08
        jmp     ?_062                                   ; 1421 _ EB, 04

?_061:  mov     byte [ebp-19H], 7                       ; 1423 _ C6. 45, E7, 07
?_062:  mov     eax, dword [ebp+0CH]                    ; 1427 _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 142A _ 8B. 10
        mov     eax, dword [ebp-14H]                    ; 142C _ 8B. 45, EC
        lea     ecx, [eax+5H]                           ; 142F _ 8D. 48, 05
        mov     eax, dword [ebp+0CH]                    ; 1432 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1435 _ 8B. 40, 04
        imul    ecx, eax                                ; 1438 _ 0F AF. C8
        mov     eax, dword [ebp+0CH]                    ; 143B _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 143E _ 8B. 40, 04
        lea     ebx, [eax-15H]                          ; 1441 _ 8D. 58, EB
        mov     eax, dword [ebp-18H]                    ; 1444 _ 8B. 45, E8
        add     eax, ebx                                ; 1447 _ 01. D8
        add     eax, ecx                                ; 1449 _ 01. C8
        add     edx, eax                                ; 144B _ 01. C2
        movzx   eax, byte [ebp-19H]                     ; 144D _ 0F B6. 45, E7
        mov     byte [edx], al                          ; 1451 _ 88. 02
        add     dword [ebp-18H], 1                      ; 1453 _ 83. 45, E8, 01
?_063:  cmp     dword [ebp-18H], 15                     ; 1457 _ 83. 7D, E8, 0F
        jle     ?_058                                   ; 145B _ 7E, 8A
        add     dword [ebp-14H], 1                      ; 145D _ 83. 45, EC, 01
?_064:  cmp     dword [ebp-14H], 13                     ; 1461 _ 83. 7D, EC, 0D
        jle     ?_057                                   ; 1465 _ 0F 8E, FFFFFF73
        nop                                             ; 146B _ 90
        mov     ebx, dword [ebp-4H]                     ; 146C _ 8B. 5D, FC
        leave                                           ; 146F _ C9
        ret                                             ; 1470 _ C3
; make_window8 End of function

message_box:; Function begin
        push    ebp                                     ; 1471 _ 55
        mov     ebp, esp                                ; 1472 _ 89. E5
        sub     esp, 24                                 ; 1474 _ 83. EC, 18
        sub     esp, 12                                 ; 1477 _ 83. EC, 0C
        push    dword [ebp+8H]                          ; 147A _ FF. 75, 08
        call    sheet_alloc                             ; 147D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1482 _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 1485 _ 89. 45, F0
        mov     eax, dword [memman]                     ; 1488 _ A1, 00000000(d)
        sub     esp, 8                                  ; 148D _ 83. EC, 08
        push    10880                                   ; 1490 _ 68, 00002A80
        push    eax                                     ; 1495 _ 50
        call    memman_alloc_4k                         ; 1496 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 149B _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 149E _ 89. 45, F4
        sub     esp, 12                                 ; 14A1 _ 83. EC, 0C
        push    -1                                      ; 14A4 _ 6A, FF
        push    68                                      ; 14A6 _ 6A, 44
        push    160                                     ; 14A8 _ 68, 000000A0
        push    dword [ebp-0CH]                         ; 14AD _ FF. 75, F4
        push    dword [ebp-10H]                         ; 14B0 _ FF. 75, F0
        call    sheet_setbuf                            ; 14B3 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 14B8 _ 83. C4, 20
        sub     esp, 4                                  ; 14BB _ 83. EC, 04
        push    dword [ebp+0CH]                         ; 14BE _ FF. 75, 0C
        push    dword [ebp-10H]                         ; 14C1 _ FF. 75, F0
        push    dword [ebp+8H]                          ; 14C4 _ FF. 75, 08
        call    make_window8                            ; 14C7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 14CC _ 83. C4, 10
        sub     esp, 8                                  ; 14CF _ 83. EC, 08
        push    ?_150                                   ; 14D2 _ 68, 0000006A(d)
        push    0                                       ; 14D7 _ 6A, 00
        push    28                                      ; 14D9 _ 6A, 1C
        push    24                                      ; 14DB _ 6A, 18
        push    dword [ebp-10H]                         ; 14DD _ FF. 75, F0
        push    dword [ebp+8H]                          ; 14E0 _ FF. 75, 08
        call    showString                              ; 14E3 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 14E8 _ 83. C4, 20
        sub     esp, 8                                  ; 14EB _ 83. EC, 08
        push    ?_151                                   ; 14EE _ 68, 00000076(d)
        push    0                                       ; 14F3 _ 6A, 00
        push    44                                      ; 14F5 _ 6A, 2C
        push    24                                      ; 14F7 _ 6A, 18
        push    dword [ebp-10H]                         ; 14F9 _ FF. 75, F0
        push    dword [ebp+8H]                          ; 14FC _ FF. 75, 08
        call    showString                              ; 14FF _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1504 _ 83. C4, 20
        push    72                                      ; 1507 _ 6A, 48
        push    80                                      ; 1509 _ 6A, 50
        push    dword [ebp-10H]                         ; 150B _ FF. 75, F0
        push    dword [ebp+8H]                          ; 150E _ FF. 75, 08
        call    sheet_slide                             ; 1511 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1516 _ 83. C4, 10
        sub     esp, 4                                  ; 1519 _ 83. EC, 04
        push    1                                       ; 151C _ 6A, 01
        push    dword [ebp-10H]                         ; 151E _ FF. 75, F0
        push    dword [ebp+8H]                          ; 1521 _ FF. 75, 08
        call    sheet_updown                            ; 1524 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1529 _ 83. C4, 10
        mov     eax, dword [ebp-10H]                    ; 152C _ 8B. 45, F0
        leave                                           ; 152F _ C9
        ret                                             ; 1530 _ C3
; message_box End of function

intHandlerFromTimer:; Function begin
        push    ebp                                     ; 1531 _ 55
        mov     ebp, esp                                ; 1532 _ 89. E5
        sub     esp, 8                                  ; 1534 _ 83. EC, 08
        sub     esp, 8                                  ; 1537 _ 83. EC, 08
        push    96                                      ; 153A _ 6A, 60
        push    32                                      ; 153C _ 6A, 20
        call    io_out8                                 ; 153E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1543 _ 83. C4, 10
        mov     eax, dword [timerctl]                   ; 1546 _ A1, 00000228(d)
        add     eax, 1                                  ; 154B _ 83. C0, 01
        mov     dword [timerctl], eax                   ; 154E _ A3, 00000228(d)
        mov     eax, dword [?_156]                      ; 1553 _ A1, 0000022C(d)
        test    eax, eax                                ; 1558 _ 85. C0
        jz      ?_065                                   ; 155A _ 74, 33
        mov     eax, dword [?_156]                      ; 155C _ A1, 0000022C(d)
        sub     eax, 1                                  ; 1561 _ 83. E8, 01
        mov     dword [?_156], eax                      ; 1564 _ A3, 0000022C(d)
        mov     eax, dword [?_156]                      ; 1569 _ A1, 0000022C(d)
        test    eax, eax                                ; 156E _ 85. C0
        jnz     ?_065                                   ; 1570 _ 75, 1D
        movzx   eax, byte [?_158]                       ; 1572 _ 0F B6. 05, 00000234(d)
        movzx   edx, al                                 ; 1579 _ 0F B6. D0
        mov     eax, dword [?_157]                      ; 157C _ A1, 00000230(d)
        sub     esp, 8                                  ; 1581 _ 83. EC, 08
        push    edx                                     ; 1584 _ 52
        push    eax                                     ; 1585 _ 50
        call    fifo8_put                               ; 1586 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 158B _ 83. C4, 10
        nop                                             ; 158E _ 90
?_065:  nop                                             ; 158F _ 90
        leave                                           ; 1590 _ C9
        ret                                             ; 1591 _ C3
; intHandlerFromTimer End of function

memman_init:; Function begin
        push    ebp                                     ; 1592 _ 55
        mov     ebp, esp                                ; 1593 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 1595 _ 8B. 45, 08
        mov     dword [eax], 0                          ; 1598 _ C7. 00, 00000000
        mov     eax, dword [ebp+8H]                     ; 159E _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 15A1 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 15A8 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 15AB _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 15B2 _ 8B. 45, 08
        mov     dword [eax+0CH], 0                      ; 15B5 _ C7. 40, 0C, 00000000
        nop                                             ; 15BC _ 90
        pop     ebp                                     ; 15BD _ 5D
        ret                                             ; 15BE _ C3
; memman_init End of function

memman_total:; Function begin
        push    ebp                                     ; 15BF _ 55
        mov     ebp, esp                                ; 15C0 _ 89. E5
        sub     esp, 16                                 ; 15C2 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 15C5 _ C7. 45, FC, 00000000
        mov     dword [ebp-8H], 0                       ; 15CC _ C7. 45, F8, 00000000
        jmp     ?_067                                   ; 15D3 _ EB, 14

?_066:  mov     eax, dword [ebp+8H]                     ; 15D5 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 15D8 _ 8B. 55, F8
        add     edx, 2                                  ; 15DB _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 15DE _ 8B. 44 D0, 04
        add     dword [ebp-4H], eax                     ; 15E2 _ 01. 45, FC
        add     dword [ebp-8H], 1                       ; 15E5 _ 83. 45, F8, 01
?_067:  mov     eax, dword [ebp+8H]                     ; 15E9 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 15EC _ 8B. 00
        cmp     dword [ebp-8H], eax                     ; 15EE _ 39. 45, F8
        jc      ?_066                                   ; 15F1 _ 72, E2
        mov     eax, dword [ebp-4H]                     ; 15F3 _ 8B. 45, FC
        leave                                           ; 15F6 _ C9
        ret                                             ; 15F7 _ C3
; memman_total End of function

memman_alloc:; Function begin
        push    ebp                                     ; 15F8 _ 55
        mov     ebp, esp                                ; 15F9 _ 89. E5
        sub     esp, 16                                 ; 15FB _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 15FE _ C7. 45, F8, 00000000
        jmp     ?_071                                   ; 1605 _ E9, 00000085

?_068:  mov     eax, dword [ebp+8H]                     ; 160A _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 160D _ 8B. 55, F8
        add     edx, 2                                  ; 1610 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 1613 _ 8B. 44 D0, 04
        cmp     dword [ebp+0CH], eax                    ; 1617 _ 39. 45, 0C
        ja      ?_070                                   ; 161A _ 77, 6F
        mov     eax, dword [ebp+8H]                     ; 161C _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 161F _ 8B. 55, F8
        add     edx, 2                                  ; 1622 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 1625 _ 8B. 04 D0
        mov     dword [ebp-4H], eax                     ; 1628 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 162B _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 162E _ 8B. 55, F8
        add     edx, 2                                  ; 1631 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 1634 _ 8B. 14 D0
        mov     eax, dword [ebp+0CH]                    ; 1637 _ 8B. 45, 0C
        lea     ecx, [edx+eax]                          ; 163A _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 163D _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1640 _ 8B. 55, F8
        add     edx, 2                                  ; 1643 _ 83. C2, 02
        mov     dword [eax+edx*8], ecx                  ; 1646 _ 89. 0C D0
        mov     eax, dword [ebp+8H]                     ; 1649 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 164C _ 8B. 55, F8
        add     edx, 2                                  ; 164F _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 1652 _ 8B. 44 D0, 04
        sub     eax, dword [ebp+0CH]                    ; 1656 _ 2B. 45, 0C
        mov     edx, eax                                ; 1659 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 165B _ 8B. 45, 08
        mov     ecx, dword [ebp-8H]                     ; 165E _ 8B. 4D, F8
        add     ecx, 2                                  ; 1661 _ 83. C1, 02
        mov     dword [eax+ecx*8+4H], edx               ; 1664 _ 89. 54 C8, 04
        mov     eax, dword [ebp+8H]                     ; 1668 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 166B _ 8B. 55, F8
        add     edx, 2                                  ; 166E _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 1671 _ 8B. 44 D0, 04
        test    eax, eax                                ; 1675 _ 85. C0
        jnz     ?_069                                   ; 1677 _ 75, 0D
        mov     eax, dword [ebp+8H]                     ; 1679 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 167C _ 8B. 00
        lea     edx, [eax-1H]                           ; 167E _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1681 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 1684 _ 89. 10
?_069:  mov     eax, dword [ebp-4H]                     ; 1686 _ 8B. 45, FC
        jmp     ?_072                                   ; 1689 _ EB, 17

?_070:  add     dword [ebp-8H], 1                       ; 168B _ 83. 45, F8, 01
?_071:  mov     eax, dword [ebp+8H]                     ; 168F _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1692 _ 8B. 00
        cmp     dword [ebp-8H], eax                     ; 1694 _ 39. 45, F8
        jc      ?_068                                   ; 1697 _ 0F 82, FFFFFF6D
        mov     eax, 0                                  ; 169D _ B8, 00000000
?_072:  leave                                           ; 16A2 _ C9
        ret                                             ; 16A3 _ C3
; memman_alloc End of function

memman_free:; Function begin
        push    ebp                                     ; 16A4 _ 55
        mov     ebp, esp                                ; 16A5 _ 89. E5
        push    ebx                                     ; 16A7 _ 53
        sub     esp, 16                                 ; 16A8 _ 83. EC, 10
        mov     dword [ebp-0CH], 0                      ; 16AB _ C7. 45, F4, 00000000
        jmp     ?_074                                   ; 16B2 _ EB, 15

?_073:  mov     eax, dword [ebp+8H]                     ; 16B4 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 16B7 _ 8B. 55, F4
        add     edx, 2                                  ; 16BA _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 16BD _ 8B. 04 D0
        cmp     dword [ebp+0CH], eax                    ; 16C0 _ 39. 45, 0C
        jc      ?_075                                   ; 16C3 _ 72, 10
        add     dword [ebp-0CH], 1                      ; 16C5 _ 83. 45, F4, 01
?_074:  mov     eax, dword [ebp+8H]                     ; 16C9 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 16CC _ 8B. 00
        cmp     dword [ebp-0CH], eax                    ; 16CE _ 39. 45, F4
        jl      ?_073                                   ; 16D1 _ 7C, E1
        jmp     ?_076                                   ; 16D3 _ EB, 01

?_075:  nop                                             ; 16D5 _ 90
?_076:  cmp     dword [ebp-0CH], 0                      ; 16D6 _ 83. 7D, F4, 00
        jle     ?_078                                   ; 16DA _ 0F 8E, 000000B9
        mov     eax, dword [ebp-0CH]                    ; 16E0 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 16E3 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 16E6 _ 8B. 45, 08
        add     edx, 2                                  ; 16E9 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 16EC _ 8B. 14 D0
        mov     eax, dword [ebp-0CH]                    ; 16EF _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 16F2 _ 8D. 48, FF
        mov     eax, dword [ebp+8H]                     ; 16F5 _ 8B. 45, 08
        add     ecx, 2                                  ; 16F8 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 16FB _ 8B. 44 C8, 04
        add     eax, edx                                ; 16FF _ 01. D0
        cmp     dword [ebp+0CH], eax                    ; 1701 _ 39. 45, 0C
        jne     ?_078                                   ; 1704 _ 0F 85, 0000008F
        mov     eax, dword [ebp-0CH]                    ; 170A _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 170D _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1710 _ 8B. 45, 08
        add     edx, 2                                  ; 1713 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 1716 _ 8B. 54 D0, 04
        mov     eax, dword [ebp-0CH]                    ; 171A _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 171D _ 8D. 58, FF
        mov     eax, dword [ebp+10H]                    ; 1720 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 1723 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1726 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 1729 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 172C _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 1730 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1733 _ 8B. 00
        test    eax, eax                                ; 1735 _ 85. C0
        jle     ?_077                                   ; 1737 _ 7E, 56
        mov     edx, dword [ebp+0CH]                    ; 1739 _ 8B. 55, 0C
        mov     eax, dword [ebp+10H]                    ; 173C _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 173F _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1742 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1745 _ 8B. 55, F4
        add     edx, 2                                  ; 1748 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 174B _ 8B. 04 D0
        cmp     ecx, eax                                ; 174E _ 39. C1
        jnz     ?_077                                   ; 1750 _ 75, 3D
        mov     eax, dword [ebp-0CH]                    ; 1752 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1755 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1758 _ 8B. 45, 08
        add     edx, 2                                  ; 175B _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 175E _ 8B. 54 D0, 04
        mov     eax, dword [ebp+8H]                     ; 1762 _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 1765 _ 8B. 4D, F4
        add     ecx, 2                                  ; 1768 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 176B _ 8B. 44 C8, 04
        mov     ecx, dword [ebp-0CH]                    ; 176F _ 8B. 4D, F4
        lea     ebx, [ecx-1H]                           ; 1772 _ 8D. 59, FF
        lea     ecx, [edx+eax]                          ; 1775 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1778 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 177B _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 177E _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 1782 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1785 _ 8B. 00
        lea     edx, [eax-1H]                           ; 1787 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 178A _ 8B. 45, 08
        mov     dword [eax], edx                        ; 178D _ 89. 10
?_077:  mov     eax, 0                                  ; 178F _ B8, 00000000
        jmp     ?_084                                   ; 1794 _ E9, 0000011B

?_078:  mov     eax, dword [ebp+8H]                     ; 1799 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 179C _ 8B. 00
        test    eax, eax                                ; 179E _ 85. C0
        jle     ?_079                                   ; 17A0 _ 7E, 52
        mov     edx, dword [ebp+0CH]                    ; 17A2 _ 8B. 55, 0C
        mov     eax, dword [ebp+10H]                    ; 17A5 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 17A8 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 17AB _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 17AE _ 8B. 55, F4
        add     edx, 2                                  ; 17B1 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 17B4 _ 8B. 04 D0
        cmp     ecx, eax                                ; 17B7 _ 39. C1
        jnz     ?_079                                   ; 17B9 _ 75, 39
        mov     eax, dword [ebp+8H]                     ; 17BB _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 17BE _ 8B. 55, F4
        add     edx, 2                                  ; 17C1 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 17C4 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 17C8 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 17CB _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 17CE _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 17D1 _ 8B. 55, F4
        add     edx, 2                                  ; 17D4 _ 83. C2, 02
        mov     dword [eax+edx*8+4H], ecx               ; 17D7 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 17DB _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 17DE _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 17E1 _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 17E4 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 17E7 _ 89. 14 C8
        mov     eax, 0                                  ; 17EA _ B8, 00000000
        jmp     ?_084                                   ; 17EF _ E9, 000000C0

?_079:  mov     eax, dword [ebp+8H]                     ; 17F4 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 17F7 _ 8B. 00
        cmp     eax, 4095                               ; 17F9 _ 3D, 00000FFF
        jg      ?_083                                   ; 17FE _ 0F 8F, 00000087
        mov     eax, dword [ebp+8H]                     ; 1804 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1807 _ 8B. 00
        lea     edx, [eax+1H]                           ; 1809 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 180C _ 8B. 45, 08
        mov     dword [eax], edx                        ; 180F _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 1811 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1814 _ 8B. 00
        mov     dword [ebp-8H], eax                     ; 1816 _ 89. 45, F8
        jmp     ?_081                                   ; 1819 _ EB, 28

?_080:  mov     eax, dword [ebp-8H]                     ; 181B _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 181E _ 8D. 50, FF
        mov     ecx, dword [ebp+8H]                     ; 1821 _ 8B. 4D, 08
        mov     eax, dword [ebp-8H]                     ; 1824 _ 8B. 45, F8
        lea     ebx, [eax+2H]                           ; 1827 _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 182A _ 8B. 45, 08
        add     edx, 2                                  ; 182D _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 1830 _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 1833 _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 1835 _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 1838 _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 183B _ 89. 54 D9, 04
        sub     dword [ebp-8H], 1                       ; 183F _ 83. 6D, F8, 01
?_081:  mov     eax, dword [ebp-8H]                     ; 1843 _ 8B. 45, F8
        cmp     eax, dword [ebp-0CH]                    ; 1846 _ 3B. 45, F4
        jg      ?_080                                   ; 1849 _ 7F, D0
        mov     eax, dword [ebp+8H]                     ; 184B _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 184E _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1851 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1854 _ 8B. 00
        cmp     edx, eax                                ; 1856 _ 39. C2
        jge     ?_082                                   ; 1858 _ 7D, 0B
        mov     eax, dword [ebp+8H]                     ; 185A _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 185D _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 185F _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 1862 _ 89. 50, 04
?_082:  mov     eax, dword [ebp+8H]                     ; 1865 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1868 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 186B _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 186E _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 1871 _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 1874 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1877 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 187A _ 8D. 4A, 02
        mov     edx, dword [ebp+10H]                    ; 187D _ 8B. 55, 10
        mov     dword [eax+ecx*8+4H], edx               ; 1880 _ 89. 54 C8, 04
        mov     eax, 0                                  ; 1884 _ B8, 00000000
        jmp     ?_084                                   ; 1889 _ EB, 29

?_083:  mov     eax, dword [ebp+8H]                     ; 188B _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 188E _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 1891 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1894 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 1897 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 189A _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 189D _ 8B. 40, 08
        mov     edx, eax                                ; 18A0 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 18A2 _ 8B. 45, 10
        add     eax, edx                                ; 18A5 _ 01. D0
        mov     edx, eax                                ; 18A7 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 18A9 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 18AC _ 89. 50, 08
        mov     eax, 4294967295                         ; 18AF _ B8, FFFFFFFF
?_084:  add     esp, 16                                 ; 18B4 _ 83. C4, 10
        pop     ebx                                     ; 18B7 _ 5B
        pop     ebp                                     ; 18B8 _ 5D
        ret                                             ; 18B9 _ C3
; memman_free End of function

memman_alloc_4k:; Function begin
        push    ebp                                     ; 18BA _ 55
        mov     ebp, esp                                ; 18BB _ 89. E5
        sub     esp, 16                                 ; 18BD _ 83. EC, 10
        mov     eax, dword [ebp+0CH]                    ; 18C0 _ 8B. 45, 0C
        add     eax, 4095                               ; 18C3 _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 18C8 _ 25, FFFFF000
        mov     dword [ebp+0CH], eax                    ; 18CD _ 89. 45, 0C
        push    dword [ebp+0CH]                         ; 18D0 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 18D3 _ FF. 75, 08
        call    memman_alloc                            ; 18D6 _ E8, FFFFFFFC(rel)
        add     esp, 8                                  ; 18DB _ 83. C4, 08
        mov     dword [ebp-4H], eax                     ; 18DE _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 18E1 _ 8B. 45, FC
        leave                                           ; 18E4 _ C9
        ret                                             ; 18E5 _ C3
; memman_alloc_4k End of function

memman_free_4k:; Function begin
        push    ebp                                     ; 18E6 _ 55
        mov     ebp, esp                                ; 18E7 _ 89. E5
        sub     esp, 16                                 ; 18E9 _ 83. EC, 10
        mov     eax, dword [ebp+10H]                    ; 18EC _ 8B. 45, 10
        add     eax, 4095                               ; 18EF _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 18F4 _ 25, FFFFF000
        mov     dword [ebp+10H], eax                    ; 18F9 _ 89. 45, 10
        push    dword [ebp+10H]                         ; 18FC _ FF. 75, 10
        push    dword [ebp+0CH]                         ; 18FF _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1902 _ FF. 75, 08
        call    memman_free                             ; 1905 _ E8, FFFFFFFC(rel)
        add     esp, 12                                 ; 190A _ 83. C4, 0C
        mov     dword [ebp-4H], eax                     ; 190D _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 1910 _ 8B. 45, FC
        leave                                           ; 1913 _ C9
        ret                                             ; 1914 _ C3
; memman_free_4k End of function

shtctl_init:; Function begin
        push    ebp                                     ; 1915 _ 55
        mov     ebp, esp                                ; 1916 _ 89. E5
        sub     esp, 24                                 ; 1918 _ 83. EC, 18
        sub     esp, 8                                  ; 191B _ 83. EC, 08
        push    9232                                    ; 191E _ 68, 00002410
        push    dword [ebp+8H]                          ; 1923 _ FF. 75, 08
        call    memman_alloc_4k                         ; 1926 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 192B _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 192E _ 89. 45, F4
        cmp     dword [ebp-0CH], 0                      ; 1931 _ 83. 7D, F4, 00
        jnz     ?_085                                   ; 1935 _ 75, 0A
        mov     eax, 0                                  ; 1937 _ B8, 00000000
        jmp     ?_089                                   ; 193C _ E9, 0000009A

?_085:  mov     eax, dword [ebp-0CH]                    ; 1941 _ 8B. 45, F4
        mov     edx, dword [ebp+0CH]                    ; 1944 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 1947 _ 89. 10
        mov     eax, dword [ebp-0CH]                    ; 1949 _ 8B. 45, F4
        mov     edx, dword [ebp+10H]                    ; 194C _ 8B. 55, 10
        mov     dword [eax+8H], edx                     ; 194F _ 89. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 1952 _ 8B. 45, F4
        mov     edx, dword [ebp+14H]                    ; 1955 _ 8B. 55, 14
        mov     dword [eax+0CH], edx                    ; 1958 _ 89. 50, 0C
        mov     eax, dword [ebp-0CH]                    ; 195B _ 8B. 45, F4
        mov     dword [eax+10H], -1                     ; 195E _ C7. 40, 10, FFFFFFFF
        mov     dword [ebp-10H], 0                      ; 1965 _ C7. 45, F0, 00000000
        jmp     ?_087                                   ; 196C _ EB, 1B

?_086:  mov     eax, dword [ebp-0CH]                    ; 196E _ 8B. 45, F4
        mov     edx, dword [ebp-10H]                    ; 1971 _ 8B. 55, F0
        add     edx, 33                                 ; 1974 _ 83. C2, 21
        shl     edx, 5                                  ; 1977 _ C1. E2, 05
        add     eax, edx                                ; 197A _ 01. D0
        add     eax, 16                                 ; 197C _ 83. C0, 10
        mov     dword [eax], 0                          ; 197F _ C7. 00, 00000000
        add     dword [ebp-10H], 1                      ; 1985 _ 83. 45, F0, 01
?_087:  cmp     dword [ebp-10H], 255                    ; 1989 _ 81. 7D, F0, 000000FF
        jle     ?_086                                   ; 1990 _ 7E, DC
        mov     eax, dword [ebp+10H]                    ; 1992 _ 8B. 45, 10
        imul    eax, dword [ebp+14H]                    ; 1995 _ 0F AF. 45, 14
        sub     esp, 8                                  ; 1999 _ 83. EC, 08
        push    eax                                     ; 199C _ 50
        push    dword [ebp+8H]                          ; 199D _ FF. 75, 08
        call    memman_alloc_4k                         ; 19A0 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 19A5 _ 83. C4, 10
        mov     edx, eax                                ; 19A8 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 19AA _ 8B. 45, F4
        mov     dword [eax+4H], edx                     ; 19AD _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 19B0 _ 8B. 45, F4
        mov     eax, dword [eax+4H]                     ; 19B3 _ 8B. 40, 04
        test    eax, eax                                ; 19B6 _ 85. C0
        jnz     ?_088                                   ; 19B8 _ 75, 1E
        mov     eax, dword [ebp-0CH]                    ; 19BA _ 8B. 45, F4
        sub     esp, 4                                  ; 19BD _ 83. EC, 04
        push    9232                                    ; 19C0 _ 68, 00002410
        push    eax                                     ; 19C5 _ 50
        push    dword [ebp+8H]                          ; 19C6 _ FF. 75, 08
        call    memman_free_4k                          ; 19C9 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 19CE _ 83. C4, 10
        mov     eax, 0                                  ; 19D1 _ B8, 00000000
        jmp     ?_089                                   ; 19D6 _ EB, 03

?_088:  mov     eax, dword [ebp-0CH]                    ; 19D8 _ 8B. 45, F4
?_089:  leave                                           ; 19DB _ C9
        ret                                             ; 19DC _ C3
; shtctl_init End of function

sheet_alloc:; Function begin
        push    ebp                                     ; 19DD _ 55
        mov     ebp, esp                                ; 19DE _ 89. E5
        sub     esp, 16                                 ; 19E0 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 19E3 _ C7. 45, F8, 00000000
        jmp     ?_092                                   ; 19EA _ EB, 5B

?_090:  mov     eax, dword [ebp+8H]                     ; 19EC _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 19EF _ 8B. 55, F8
        add     edx, 33                                 ; 19F2 _ 83. C2, 21
        shl     edx, 5                                  ; 19F5 _ C1. E2, 05
        add     eax, edx                                ; 19F8 _ 01. D0
        add     eax, 16                                 ; 19FA _ 83. C0, 10
        mov     eax, dword [eax]                        ; 19FD _ 8B. 00
        test    eax, eax                                ; 19FF _ 85. C0
        jnz     ?_091                                   ; 1A01 _ 75, 40
        mov     eax, dword [ebp-8H]                     ; 1A03 _ 8B. 45, F8
        shl     eax, 5                                  ; 1A06 _ C1. E0, 05
        lea     edx, [eax+410H]                         ; 1A09 _ 8D. 90, 00000410
        mov     eax, dword [ebp+8H]                     ; 1A0F _ 8B. 45, 08
        add     eax, edx                                ; 1A12 _ 01. D0
        add     eax, 4                                  ; 1A14 _ 83. C0, 04
        mov     dword [ebp-4H], eax                     ; 1A17 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 1A1A _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1A1D _ 8B. 55, F8
        lea     ecx, [edx+4H]                           ; 1A20 _ 8D. 4A, 04
        mov     edx, dword [ebp-4H]                     ; 1A23 _ 8B. 55, FC
        mov     dword [eax+ecx*4+4H], edx               ; 1A26 _ 89. 54 88, 04
        mov     eax, dword [ebp-4H]                     ; 1A2A _ 8B. 45, FC
        mov     dword [eax+1CH], 1                      ; 1A2D _ C7. 40, 1C, 00000001
        mov     eax, dword [ebp-4H]                     ; 1A34 _ 8B. 45, FC
        mov     dword [eax+18H], -1                     ; 1A37 _ C7. 40, 18, FFFFFFFF
        mov     eax, dword [ebp-4H]                     ; 1A3E _ 8B. 45, FC
        jmp     ?_093                                   ; 1A41 _ EB, 12

?_091:  add     dword [ebp-8H], 1                       ; 1A43 _ 83. 45, F8, 01
?_092:  cmp     dword [ebp-8H], 255                     ; 1A47 _ 81. 7D, F8, 000000FF
        jle     ?_090                                   ; 1A4E _ 7E, 9C
        mov     eax, 0                                  ; 1A50 _ B8, 00000000
?_093:  leave                                           ; 1A55 _ C9
        ret                                             ; 1A56 _ C3
; sheet_alloc End of function

sheet_setbuf:; Function begin
        push    ebp                                     ; 1A57 _ 55
        mov     ebp, esp                                ; 1A58 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 1A5A _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 1A5D _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 1A60 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 1A62 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 1A65 _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 1A68 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1A6B _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 1A6E _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 1A71 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 1A74 _ 8B. 45, 08
        mov     edx, dword [ebp+18H]                    ; 1A77 _ 8B. 55, 18
        mov     dword [eax+14H], edx                    ; 1A7A _ 89. 50, 14
        nop                                             ; 1A7D _ 90
        pop     ebp                                     ; 1A7E _ 5D
        ret                                             ; 1A7F _ C3
; sheet_setbuf End of function

sheet_updown:; Function begin
        push    ebp                                     ; 1A80 _ 55
        mov     ebp, esp                                ; 1A81 _ 89. E5
        push    esi                                     ; 1A83 _ 56
        push    ebx                                     ; 1A84 _ 53
        sub     esp, 16                                 ; 1A85 _ 83. EC, 10
        mov     eax, dword [ebp+0CH]                    ; 1A88 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 1A8B _ 8B. 40, 18
        mov     dword [ebp-0CH], eax                    ; 1A8E _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 1A91 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 1A94 _ 8B. 40, 10
        add     eax, 1                                  ; 1A97 _ 83. C0, 01
        cmp     dword [ebp+10H], eax                    ; 1A9A _ 39. 45, 10
        jle     ?_094                                   ; 1A9D _ 7E, 0C
        mov     eax, dword [ebp+8H]                     ; 1A9F _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 1AA2 _ 8B. 40, 10
        add     eax, 1                                  ; 1AA5 _ 83. C0, 01
        mov     dword [ebp+10H], eax                    ; 1AA8 _ 89. 45, 10
?_094:  cmp     dword [ebp+10H], -1                     ; 1AAB _ 83. 7D, 10, FF
        jge     ?_095                                   ; 1AAF _ 7D, 07
        mov     dword [ebp+10H], -1                     ; 1AB1 _ C7. 45, 10, FFFFFFFF
?_095:  mov     eax, dword [ebp+0CH]                    ; 1AB8 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 1ABB _ 8B. 55, 10
        mov     dword [eax+18H], edx                    ; 1ABE _ 89. 50, 18
        mov     eax, dword [ebp-0CH]                    ; 1AC1 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 1AC4 _ 3B. 45, 10
        jle     ?_102                                   ; 1AC7 _ 0F 8E, 000001CB
        cmp     dword [ebp+10H], 0                      ; 1ACD _ 83. 7D, 10, 00
        js      ?_098                                   ; 1AD1 _ 0F 88, 000000DF
        mov     eax, dword [ebp-0CH]                    ; 1AD7 _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 1ADA _ 89. 45, F0
        jmp     ?_097                                   ; 1ADD _ EB, 34

?_096:  mov     eax, dword [ebp-10H]                    ; 1ADF _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 1AE2 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1AE5 _ 8B. 45, 08
        add     edx, 4                                  ; 1AE8 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 1AEB _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 1AEF _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 1AF2 _ 8B. 4D, F0
        add     ecx, 4                                  ; 1AF5 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 1AF8 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 1AFC _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 1AFF _ 8B. 55, F0
        add     edx, 4                                  ; 1B02 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 1B05 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 1B09 _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 1B0C _ 89. 50, 18
        sub     dword [ebp-10H], 1                      ; 1B0F _ 83. 6D, F0, 01
?_097:  mov     eax, dword [ebp-10H]                    ; 1B13 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 1B16 _ 3B. 45, 10
        jg      ?_096                                   ; 1B19 _ 7F, C4
        mov     eax, dword [ebp+8H]                     ; 1B1B _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 1B1E _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 1B21 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 1B24 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 1B27 _ 89. 54 88, 04
        mov     eax, dword [ebp+10H]                    ; 1B2B _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 1B2E _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 1B31 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1B34 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1B37 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 1B3A _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 1B3D _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 1B40 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 1B43 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 1B46 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1B49 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 1B4C _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 1B4F _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1B52 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1B55 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 1B58 _ 8B. 40, 0C
        sub     esp, 8                                  ; 1B5B _ 83. EC, 08
        push    esi                                     ; 1B5E _ 56
        push    ebx                                     ; 1B5F _ 53
        push    ecx                                     ; 1B60 _ 51
        push    edx                                     ; 1B61 _ 52
        push    eax                                     ; 1B62 _ 50
        push    dword [ebp+8H]                          ; 1B63 _ FF. 75, 08
        call    sheet_refreshmap                        ; 1B66 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1B6B _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 1B6E _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 1B71 _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 1B74 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1B77 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1B7A _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 1B7D _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 1B80 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 1B83 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 1B86 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 1B89 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1B8C _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 1B8F _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 1B92 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1B95 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1B98 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 1B9B _ 8B. 40, 0C
        sub     esp, 8                                  ; 1B9E _ 83. EC, 08
        push    esi                                     ; 1BA1 _ 56
        push    ebx                                     ; 1BA2 _ 53
        push    ecx                                     ; 1BA3 _ 51
        push    edx                                     ; 1BA4 _ 52
        push    eax                                     ; 1BA5 _ 50
        push    dword [ebp+8H]                          ; 1BA6 _ FF. 75, 08
        call    sheet_refreshsub                        ; 1BA9 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1BAE _ 83. C4, 20
        jmp     ?_109                                   ; 1BB1 _ E9, 00000238

?_098:  mov     eax, dword [ebp+8H]                     ; 1BB6 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 1BB9 _ 8B. 40, 10
        cmp     dword [ebp-0CH], eax                    ; 1BBC _ 39. 45, F4
        jge     ?_101                                   ; 1BBF _ 7D, 47
        mov     eax, dword [ebp-0CH]                    ; 1BC1 _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 1BC4 _ 89. 45, F0
        jmp     ?_100                                   ; 1BC7 _ EB, 34

?_099:  mov     eax, dword [ebp-10H]                    ; 1BC9 _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 1BCC _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1BCF _ 8B. 45, 08
        add     edx, 4                                  ; 1BD2 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 1BD5 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 1BD9 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 1BDC _ 8B. 4D, F0
        add     ecx, 4                                  ; 1BDF _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 1BE2 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 1BE6 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 1BE9 _ 8B. 55, F0
        add     edx, 4                                  ; 1BEC _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 1BEF _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 1BF3 _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 1BF6 _ 89. 50, 18
        add     dword [ebp-10H], 1                      ; 1BF9 _ 83. 45, F0, 01
?_100:  mov     eax, dword [ebp+8H]                     ; 1BFD _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 1C00 _ 8B. 40, 10
        cmp     dword [ebp-10H], eax                    ; 1C03 _ 39. 45, F0
        jl      ?_099                                   ; 1C06 _ 7C, C1
?_101:  mov     eax, dword [ebp+8H]                     ; 1C08 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 1C0B _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 1C0E _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1C11 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 1C14 _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1C17 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1C1A _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1C1D _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 1C20 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 1C23 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 1C26 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 1C29 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 1C2C _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1C2F _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 1C32 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 1C35 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1C38 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1C3B _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 1C3E _ 8B. 40, 0C
        sub     esp, 8                                  ; 1C41 _ 83. EC, 08
        push    0                                       ; 1C44 _ 6A, 00
        push    ebx                                     ; 1C46 _ 53
        push    ecx                                     ; 1C47 _ 51
        push    edx                                     ; 1C48 _ 52
        push    eax                                     ; 1C49 _ 50
        push    dword [ebp+8H]                          ; 1C4A _ FF. 75, 08
        call    sheet_refreshmap                        ; 1C4D _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1C52 _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 1C55 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1C58 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1C5B _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 1C5E _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 1C61 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 1C64 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 1C67 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 1C6A _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1C6D _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 1C70 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 1C73 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1C76 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1C79 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 1C7C _ 8B. 40, 0C
        sub     esp, 8                                  ; 1C7F _ 83. EC, 08
        push    0                                       ; 1C82 _ 6A, 00
        push    ebx                                     ; 1C84 _ 53
        push    ecx                                     ; 1C85 _ 51
        push    edx                                     ; 1C86 _ 52
        push    eax                                     ; 1C87 _ 50
        push    dword [ebp+8H]                          ; 1C88 _ FF. 75, 08
        call    sheet_refreshsub                        ; 1C8B _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1C90 _ 83. C4, 20
        jmp     ?_109                                   ; 1C93 _ E9, 00000156

?_102:  mov     eax, dword [ebp-0CH]                    ; 1C98 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 1C9B _ 3B. 45, 10
        jge     ?_109                                   ; 1C9E _ 0F 8D, 0000014A
        cmp     dword [ebp-0CH], 0                      ; 1CA4 _ 83. 7D, F4, 00
        js      ?_105                                   ; 1CA8 _ 78, 56
        mov     eax, dword [ebp-0CH]                    ; 1CAA _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 1CAD _ 89. 45, F0
        jmp     ?_104                                   ; 1CB0 _ EB, 34

?_103:  mov     eax, dword [ebp-10H]                    ; 1CB2 _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 1CB5 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1CB8 _ 8B. 45, 08
        add     edx, 4                                  ; 1CBB _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 1CBE _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 1CC2 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 1CC5 _ 8B. 4D, F0
        add     ecx, 4                                  ; 1CC8 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 1CCB _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 1CCF _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 1CD2 _ 8B. 55, F0
        add     edx, 4                                  ; 1CD5 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 1CD8 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 1CDC _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 1CDF _ 89. 50, 18
        add     dword [ebp-10H], 1                      ; 1CE2 _ 83. 45, F0, 01
?_104:  mov     eax, dword [ebp-10H]                    ; 1CE6 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 1CE9 _ 3B. 45, 10
        jl      ?_103                                   ; 1CEC _ 7C, C4
        mov     eax, dword [ebp+8H]                     ; 1CEE _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 1CF1 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 1CF4 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 1CF7 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 1CFA _ 89. 54 88, 04
        jmp     ?_108                                   ; 1CFE _ EB, 6C

?_105:  mov     eax, dword [ebp+8H]                     ; 1D00 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 1D03 _ 8B. 40, 10
        mov     dword [ebp-10H], eax                    ; 1D06 _ 89. 45, F0
        jmp     ?_107                                   ; 1D09 _ EB, 3A

?_106:  mov     eax, dword [ebp-10H]                    ; 1D0B _ 8B. 45, F0
        lea     ecx, [eax+1H]                           ; 1D0E _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 1D11 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 1D14 _ 8B. 55, F0
        add     edx, 4                                  ; 1D17 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 1D1A _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 1D1E _ 8B. 45, 08
        add     ecx, 4                                  ; 1D21 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 1D24 _ 89. 54 88, 04
        mov     eax, dword [ebp-10H]                    ; 1D28 _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 1D2B _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1D2E _ 8B. 45, 08
        add     edx, 4                                  ; 1D31 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 1D34 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 1D38 _ 8B. 55, F0
        add     edx, 1                                  ; 1D3B _ 83. C2, 01
        mov     dword [eax+18H], edx                    ; 1D3E _ 89. 50, 18
        sub     dword [ebp-10H], 1                      ; 1D41 _ 83. 6D, F0, 01
?_107:  mov     eax, dword [ebp-10H]                    ; 1D45 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 1D48 _ 3B. 45, 10
        jge     ?_106                                   ; 1D4B _ 7D, BE
        mov     eax, dword [ebp+8H]                     ; 1D4D _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 1D50 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 1D53 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 1D56 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 1D59 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 1D5D _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 1D60 _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 1D63 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1D66 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 1D69 _ 89. 50, 10
?_108:  mov     eax, dword [ebp+0CH]                    ; 1D6C _ 8B. 45, 0C
        mov     ecx, dword [eax+18H]                    ; 1D6F _ 8B. 48, 18
        mov     eax, dword [ebp+0CH]                    ; 1D72 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1D75 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1D78 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 1D7B _ 8B. 40, 08
        lea     esi, [edx+eax]                          ; 1D7E _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 1D81 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 1D84 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 1D87 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1D8A _ 8B. 40, 04
        lea     ebx, [edx+eax]                          ; 1D8D _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 1D90 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1D93 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1D96 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 1D99 _ 8B. 40, 0C
        sub     esp, 8                                  ; 1D9C _ 83. EC, 08
        push    ecx                                     ; 1D9F _ 51
        push    esi                                     ; 1DA0 _ 56
        push    ebx                                     ; 1DA1 _ 53
        push    edx                                     ; 1DA2 _ 52
        push    eax                                     ; 1DA3 _ 50
        push    dword [ebp+8H]                          ; 1DA4 _ FF. 75, 08
        call    sheet_refreshmap                        ; 1DA7 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1DAC _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 1DAF _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1DB2 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1DB5 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 1DB8 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 1DBB _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 1DBE _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 1DC1 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 1DC4 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1DC7 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 1DCA _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 1DCD _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1DD0 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1DD3 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 1DD6 _ 8B. 40, 0C
        sub     esp, 8                                  ; 1DD9 _ 83. EC, 08
        push    dword [ebp+10H]                         ; 1DDC _ FF. 75, 10
        push    ebx                                     ; 1DDF _ 53
        push    ecx                                     ; 1DE0 _ 51
        push    edx                                     ; 1DE1 _ 52
        push    eax                                     ; 1DE2 _ 50
        push    dword [ebp+8H]                          ; 1DE3 _ FF. 75, 08
        call    sheet_refreshsub                        ; 1DE6 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1DEB _ 83. C4, 20
?_109:  nop                                             ; 1DEE _ 90
        lea     esp, [ebp-8H]                           ; 1DEF _ 8D. 65, F8
        pop     ebx                                     ; 1DF2 _ 5B
        pop     esi                                     ; 1DF3 _ 5E
        pop     ebp                                     ; 1DF4 _ 5D
        ret                                             ; 1DF5 _ C3
; sheet_updown End of function

sheet_refresh:; Function begin
        push    ebp                                     ; 1DF6 _ 55
        mov     ebp, esp                                ; 1DF7 _ 89. E5
        push    edi                                     ; 1DF9 _ 57
        push    esi                                     ; 1DFA _ 56
        push    ebx                                     ; 1DFB _ 53
        sub     esp, 12                                 ; 1DFC _ 83. EC, 0C
        mov     eax, dword [ebp+0CH]                    ; 1DFF _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 1E02 _ 8B. 40, 18
        test    eax, eax                                ; 1E05 _ 85. C0
        js      ?_110                                   ; 1E07 _ 78, 47
        mov     eax, dword [ebp+0CH]                    ; 1E09 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 1E0C _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 1E0F _ 8B. 55, 0C
        mov     ecx, dword [edx+10H]                    ; 1E12 _ 8B. 4A, 10
        mov     edx, dword [ebp+1CH]                    ; 1E15 _ 8B. 55, 1C
        lea     esi, [ecx+edx]                          ; 1E18 _ 8D. 34 11
        mov     edx, dword [ebp+0CH]                    ; 1E1B _ 8B. 55, 0C
        mov     ecx, dword [edx+0CH]                    ; 1E1E _ 8B. 4A, 0C
        mov     edx, dword [ebp+18H]                    ; 1E21 _ 8B. 55, 18
        lea     ebx, [ecx+edx]                          ; 1E24 _ 8D. 1C 11
        mov     edx, dword [ebp+0CH]                    ; 1E27 _ 8B. 55, 0C
        mov     ecx, dword [edx+10H]                    ; 1E2A _ 8B. 4A, 10
        mov     edx, dword [ebp+14H]                    ; 1E2D _ 8B. 55, 14
        add     ecx, edx                                ; 1E30 _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 1E32 _ 8B. 55, 0C
        mov     edi, dword [edx+0CH]                    ; 1E35 _ 8B. 7A, 0C
        mov     edx, dword [ebp+10H]                    ; 1E38 _ 8B. 55, 10
        add     edx, edi                                ; 1E3B _ 01. FA
        sub     esp, 8                                  ; 1E3D _ 83. EC, 08
        push    eax                                     ; 1E40 _ 50
        push    esi                                     ; 1E41 _ 56
        push    ebx                                     ; 1E42 _ 53
        push    ecx                                     ; 1E43 _ 51
        push    edx                                     ; 1E44 _ 52
        push    dword [ebp+8H]                          ; 1E45 _ FF. 75, 08
        call    sheet_refreshsub                        ; 1E48 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1E4D _ 83. C4, 20
?_110:  mov     eax, 0                                  ; 1E50 _ B8, 00000000
        lea     esp, [ebp-0CH]                          ; 1E55 _ 8D. 65, F4
        pop     ebx                                     ; 1E58 _ 5B
        pop     esi                                     ; 1E59 _ 5E
        pop     edi                                     ; 1E5A _ 5F
        pop     ebp                                     ; 1E5B _ 5D
        ret                                             ; 1E5C _ C3
; sheet_refresh End of function

sheet_slide_mouse:; Function begin
        push    ebp                                     ; 1E5D _ 55
        mov     ebp, esp                                ; 1E5E _ 89. E5
        push    ebx                                     ; 1E60 _ 53
        sub     esp, 20                                 ; 1E61 _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 1E64 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 1E67 _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 1E6A _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 1E6D _ 8B. 45, 0C
        mov     eax, dword [eax+10H]                    ; 1E70 _ 8B. 40, 10
        mov     dword [ebp-0CH], eax                    ; 1E73 _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 1E76 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 1E79 _ 8B. 55, 10
        mov     dword [eax+0CH], edx                    ; 1E7C _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 1E7F _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 1E82 _ 8B. 55, 14
        mov     dword [eax+10H], edx                    ; 1E85 _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1E88 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 1E8B _ 8B. 40, 18
        test    eax, eax                                ; 1E8E _ 85. C0
        js      ?_111                                   ; 1E90 _ 0F 88, 000000AE
        mov     eax, dword [ebp-0CH]                    ; 1E96 _ 8B. 45, F4
        lea     edx, [eax+10H]                          ; 1E99 _ 8D. 50, 10
        mov     eax, dword [ebp-10H]                    ; 1E9C _ 8B. 45, F0
        add     eax, 16                                 ; 1E9F _ 83. C0, 10
        sub     esp, 8                                  ; 1EA2 _ 83. EC, 08
        push    0                                       ; 1EA5 _ 6A, 00
        push    edx                                     ; 1EA7 _ 52
        push    eax                                     ; 1EA8 _ 50
        push    dword [ebp-0CH]                         ; 1EA9 _ FF. 75, F4
        push    dword [ebp-10H]                         ; 1EAC _ FF. 75, F0
        push    dword [ebp+8H]                          ; 1EAF _ FF. 75, 08
        call    sheet_refreshmap                        ; 1EB2 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1EB7 _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 1EBA _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 1EBD _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 1EC0 _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 1EC3 _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 1EC6 _ 8B. 55, 14
        add     ecx, edx                                ; 1EC9 _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 1ECB _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 1ECE _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 1ED1 _ 8B. 55, 10
        add     edx, ebx                                ; 1ED4 _ 01. DA
        sub     esp, 8                                  ; 1ED6 _ 83. EC, 08
        push    eax                                     ; 1ED9 _ 50
        push    ecx                                     ; 1EDA _ 51
        push    edx                                     ; 1EDB _ 52
        push    dword [ebp+14H]                         ; 1EDC _ FF. 75, 14
        push    dword [ebp+10H]                         ; 1EDF _ FF. 75, 10
        push    dword [ebp+8H]                          ; 1EE2 _ FF. 75, 08
        call    sheet_refreshmap                        ; 1EE5 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1EEA _ 83. C4, 20
        mov     eax, dword [ebp-0CH]                    ; 1EED _ 8B. 45, F4
        lea     edx, [eax+10H]                          ; 1EF0 _ 8D. 50, 10
        mov     eax, dword [ebp-10H]                    ; 1EF3 _ 8B. 45, F0
        add     eax, 16                                 ; 1EF6 _ 83. C0, 10
        sub     esp, 8                                  ; 1EF9 _ 83. EC, 08
        push    0                                       ; 1EFC _ 6A, 00
        push    edx                                     ; 1EFE _ 52
        push    eax                                     ; 1EFF _ 50
        push    dword [ebp-0CH]                         ; 1F00 _ FF. 75, F4
        push    dword [ebp-10H]                         ; 1F03 _ FF. 75, F0
        push    dword [ebp+8H]                          ; 1F06 _ FF. 75, 08
        call    sheet_refreshsub                        ; 1F09 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1F0E _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 1F11 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 1F14 _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 1F17 _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 1F1A _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 1F1D _ 8B. 55, 14
        add     ecx, edx                                ; 1F20 _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 1F22 _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 1F25 _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 1F28 _ 8B. 55, 10
        add     edx, ebx                                ; 1F2B _ 01. DA
        sub     esp, 8                                  ; 1F2D _ 83. EC, 08
        push    eax                                     ; 1F30 _ 50
        push    ecx                                     ; 1F31 _ 51
        push    edx                                     ; 1F32 _ 52
        push    dword [ebp+14H]                         ; 1F33 _ FF. 75, 14
        push    dword [ebp+10H]                         ; 1F36 _ FF. 75, 10
        push    dword [ebp+8H]                          ; 1F39 _ FF. 75, 08
        call    sheet_refreshsub                        ; 1F3C _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1F41 _ 83. C4, 20
?_111:  nop                                             ; 1F44 _ 90
        mov     ebx, dword [ebp-4H]                     ; 1F45 _ 8B. 5D, FC
        leave                                           ; 1F48 _ C9
        ret                                             ; 1F49 _ C3
; sheet_slide_mouse End of function

sheet_slide:; Function begin
        push    ebp                                     ; 1F4A _ 55
        mov     ebp, esp                                ; 1F4B _ 89. E5
        push    ebx                                     ; 1F4D _ 53
        sub     esp, 20                                 ; 1F4E _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 1F51 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 1F54 _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 1F57 _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 1F5A _ 8B. 45, 0C
        mov     eax, dword [eax+10H]                    ; 1F5D _ 8B. 40, 10
        mov     dword [ebp-0CH], eax                    ; 1F60 _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 1F63 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 1F66 _ 8B. 55, 10
        mov     dword [eax+0CH], edx                    ; 1F69 _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 1F6C _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 1F6F _ 8B. 55, 14
        mov     dword [eax+10H], edx                    ; 1F72 _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1F75 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 1F78 _ 8B. 40, 18
        test    eax, eax                                ; 1F7B _ 85. C0
        js      ?_112                                   ; 1F7D _ 0F 88, 000000C2
        mov     eax, dword [ebp+0CH]                    ; 1F83 _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 1F86 _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 1F89 _ 8B. 45, F4
        add     edx, eax                                ; 1F8C _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 1F8E _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 1F91 _ 8B. 48, 04
        mov     eax, dword [ebp-10H]                    ; 1F94 _ 8B. 45, F0
        add     eax, ecx                                ; 1F97 _ 01. C8
        sub     esp, 8                                  ; 1F99 _ 83. EC, 08
        push    0                                       ; 1F9C _ 6A, 00
        push    edx                                     ; 1F9E _ 52
        push    eax                                     ; 1F9F _ 50
        push    dword [ebp-0CH]                         ; 1FA0 _ FF. 75, F4
        push    dword [ebp-10H]                         ; 1FA3 _ FF. 75, F0
        push    dword [ebp+8H]                          ; 1FA6 _ FF. 75, 08
        call    sheet_refreshmap                        ; 1FA9 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1FAE _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 1FB1 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 1FB4 _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 1FB7 _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 1FBA _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 1FBD _ 8B. 55, 14
        add     ecx, edx                                ; 1FC0 _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 1FC2 _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 1FC5 _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 1FC8 _ 8B. 55, 10
        add     edx, ebx                                ; 1FCB _ 01. DA
        sub     esp, 8                                  ; 1FCD _ 83. EC, 08
        push    eax                                     ; 1FD0 _ 50
        push    ecx                                     ; 1FD1 _ 51
        push    edx                                     ; 1FD2 _ 52
        push    dword [ebp+14H]                         ; 1FD3 _ FF. 75, 14
        push    dword [ebp+10H]                         ; 1FD6 _ FF. 75, 10
        push    dword [ebp+8H]                          ; 1FD9 _ FF. 75, 08
        call    sheet_refreshmap                        ; 1FDC _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1FE1 _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 1FE4 _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 1FE7 _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 1FEA _ 8B. 45, F4
        add     edx, eax                                ; 1FED _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 1FEF _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 1FF2 _ 8B. 48, 04
        mov     eax, dword [ebp-10H]                    ; 1FF5 _ 8B. 45, F0
        add     eax, ecx                                ; 1FF8 _ 01. C8
        sub     esp, 8                                  ; 1FFA _ 83. EC, 08
        push    0                                       ; 1FFD _ 6A, 00
        push    edx                                     ; 1FFF _ 52
        push    eax                                     ; 2000 _ 50
        push    dword [ebp-0CH]                         ; 2001 _ FF. 75, F4
        push    dword [ebp-10H]                         ; 2004 _ FF. 75, F0
        push    dword [ebp+8H]                          ; 2007 _ FF. 75, 08
        call    sheet_refreshsub                        ; 200A _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 200F _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 2012 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 2015 _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 2018 _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 201B _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 201E _ 8B. 55, 14
        add     ecx, edx                                ; 2021 _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 2023 _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 2026 _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 2029 _ 8B. 55, 10
        add     edx, ebx                                ; 202C _ 01. DA
        sub     esp, 8                                  ; 202E _ 83. EC, 08
        push    eax                                     ; 2031 _ 50
        push    ecx                                     ; 2032 _ 51
        push    edx                                     ; 2033 _ 52
        push    dword [ebp+14H]                         ; 2034 _ FF. 75, 14
        push    dword [ebp+10H]                         ; 2037 _ FF. 75, 10
        push    dword [ebp+8H]                          ; 203A _ FF. 75, 08
        call    sheet_refreshsub                        ; 203D _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2042 _ 83. C4, 20
?_112:  nop                                             ; 2045 _ 90
        mov     ebx, dword [ebp-4H]                     ; 2046 _ 8B. 5D, FC
        leave                                           ; 2049 _ C9
        ret                                             ; 204A _ C3
; sheet_slide End of function

sheet_refreshsub:; Function begin
        push    ebp                                     ; 204B _ 55
        mov     ebp, esp                                ; 204C _ 89. E5
        sub     esp, 48                                 ; 204E _ 83. EC, 30
        mov     eax, dword [ebp+8H]                     ; 2051 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2054 _ 8B. 00
        mov     dword [ebp-18H], eax                    ; 2056 _ 89. 45, E8
        mov     eax, dword [ebp+8H]                     ; 2059 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 205C _ 8B. 40, 04
        mov     dword [ebp-14H], eax                    ; 205F _ 89. 45, EC
        mov     eax, dword [ebp+1CH]                    ; 2062 _ 8B. 45, 1C
        mov     dword [ebp-24H], eax                    ; 2065 _ 89. 45, DC
        jmp     ?_119                                   ; 2068 _ E9, 00000118

?_113:  mov     eax, dword [ebp+8H]                     ; 206D _ 8B. 45, 08
        mov     edx, dword [ebp-24H]                    ; 2070 _ 8B. 55, DC
        add     edx, 4                                  ; 2073 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 2076 _ 8B. 44 90, 04
        mov     dword [ebp-10H], eax                    ; 207A _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 207D _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 2080 _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 2082 _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 2085 _ 8B. 45, F0
        mov     edx, dword [ebp+8H]                     ; 2088 _ 8B. 55, 08
        add     edx, 1044                               ; 208B _ 81. C2, 00000414
        sub     eax, edx                                ; 2091 _ 29. D0
        sar     eax, 5                                  ; 2093 _ C1. F8, 05
        mov     byte [ebp-26H], al                      ; 2096 _ 88. 45, DA
        mov     dword [ebp-1CH], 0                      ; 2099 _ C7. 45, E4, 00000000
        jmp     ?_118                                   ; 20A0 _ E9, 000000CD

?_114:  mov     eax, dword [ebp-10H]                    ; 20A5 _ 8B. 45, F0
        mov     edx, dword [eax+10H]                    ; 20A8 _ 8B. 50, 10
        mov     eax, dword [ebp-1CH]                    ; 20AB _ 8B. 45, E4
        add     eax, edx                                ; 20AE _ 01. D0
        mov     dword [ebp-8H], eax                     ; 20B0 _ 89. 45, F8
        mov     dword [ebp-20H], 0                      ; 20B3 _ C7. 45, E0, 00000000
        jmp     ?_117                                   ; 20BA _ E9, 000000A0

?_115:  mov     eax, dword [ebp-10H]                    ; 20BF _ 8B. 45, F0
        mov     edx, dword [eax+0CH]                    ; 20C2 _ 8B. 50, 0C
        mov     eax, dword [ebp-20H]                    ; 20C5 _ 8B. 45, E0
        add     eax, edx                                ; 20C8 _ 01. D0
        mov     dword [ebp-4H], eax                     ; 20CA _ 89. 45, FC
        mov     eax, dword [ebp+0CH]                    ; 20CD _ 8B. 45, 0C
        cmp     eax, dword [ebp-4H]                     ; 20D0 _ 3B. 45, FC
        jg      ?_116                                   ; 20D3 _ 0F 8F, 00000082
        mov     eax, dword [ebp-4H]                     ; 20D9 _ 8B. 45, FC
        cmp     eax, dword [ebp+14H]                    ; 20DC _ 3B. 45, 14
        jge     ?_116                                   ; 20DF _ 7D, 7A
        mov     eax, dword [ebp+10H]                    ; 20E1 _ 8B. 45, 10
        cmp     eax, dword [ebp-8H]                     ; 20E4 _ 3B. 45, F8
        jg      ?_116                                   ; 20E7 _ 7F, 72
        mov     eax, dword [ebp-8H]                     ; 20E9 _ 8B. 45, F8
        cmp     eax, dword [ebp+18H]                    ; 20EC _ 3B. 45, 18
        jge     ?_116                                   ; 20EF _ 7D, 6A
        mov     eax, dword [ebp-10H]                    ; 20F1 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 20F4 _ 8B. 40, 04
        imul    eax, dword [ebp-1CH]                    ; 20F7 _ 0F AF. 45, E4
        mov     edx, eax                                ; 20FB _ 89. C2
        mov     eax, dword [ebp-20H]                    ; 20FD _ 8B. 45, E0
        add     eax, edx                                ; 2100 _ 01. D0
        mov     edx, eax                                ; 2102 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 2104 _ 8B. 45, F4
        add     eax, edx                                ; 2107 _ 01. D0
        movzx   eax, byte [eax]                         ; 2109 _ 0F B6. 00
        mov     byte [ebp-25H], al                      ; 210C _ 88. 45, DB
        mov     eax, dword [ebp+8H]                     ; 210F _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2112 _ 8B. 40, 08
        imul    eax, dword [ebp-8H]                     ; 2115 _ 0F AF. 45, F8
        mov     edx, eax                                ; 2119 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 211B _ 8B. 45, FC
        add     eax, edx                                ; 211E _ 01. D0
        mov     edx, eax                                ; 2120 _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 2122 _ 8B. 45, EC
        add     eax, edx                                ; 2125 _ 01. D0
        movzx   eax, byte [eax]                         ; 2127 _ 0F B6. 00
        cmp     byte [ebp-26H], al                      ; 212A _ 38. 45, DA
        jnz     ?_116                                   ; 212D _ 75, 2C
        movzx   edx, byte [ebp-25H]                     ; 212F _ 0F B6. 55, DB
        mov     eax, dword [ebp-10H]                    ; 2133 _ 8B. 45, F0
        mov     eax, dword [eax+14H]                    ; 2136 _ 8B. 40, 14
        cmp     edx, eax                                ; 2139 _ 39. C2
        jz      ?_116                                   ; 213B _ 74, 1E
        mov     eax, dword [ebp+8H]                     ; 213D _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2140 _ 8B. 40, 08
        imul    eax, dword [ebp-8H]                     ; 2143 _ 0F AF. 45, F8
        mov     edx, eax                                ; 2147 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 2149 _ 8B. 45, FC
        add     eax, edx                                ; 214C _ 01. D0
        mov     edx, eax                                ; 214E _ 89. C2
        mov     eax, dword [ebp-18H]                    ; 2150 _ 8B. 45, E8
        add     edx, eax                                ; 2153 _ 01. C2
        movzx   eax, byte [ebp-25H]                     ; 2155 _ 0F B6. 45, DB
        mov     byte [edx], al                          ; 2159 _ 88. 02
?_116:  add     dword [ebp-20H], 1                      ; 215B _ 83. 45, E0, 01
?_117:  mov     eax, dword [ebp-10H]                    ; 215F _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 2162 _ 8B. 40, 04
        cmp     dword [ebp-20H], eax                    ; 2165 _ 39. 45, E0
        jl      ?_115                                   ; 2168 _ 0F 8C, FFFFFF51
        add     dword [ebp-1CH], 1                      ; 216E _ 83. 45, E4, 01
?_118:  mov     eax, dword [ebp-10H]                    ; 2172 _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 2175 _ 8B. 40, 08
        cmp     dword [ebp-1CH], eax                    ; 2178 _ 39. 45, E4
        jl      ?_114                                   ; 217B _ 0F 8C, FFFFFF24
        add     dword [ebp-24H], 1                      ; 2181 _ 83. 45, DC, 01
?_119:  mov     eax, dword [ebp+8H]                     ; 2185 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2188 _ 8B. 40, 10
        cmp     dword [ebp-24H], eax                    ; 218B _ 39. 45, DC
        jle     ?_113                                   ; 218E _ 0F 8E, FFFFFED9
        nop                                             ; 2194 _ 90
        leave                                           ; 2195 _ C9
        ret                                             ; 2196 _ C3
; sheet_refreshsub End of function

sheet_refreshmap:; Function begin
        push    ebp                                     ; 2197 _ 55
        mov     ebp, esp                                ; 2198 _ 89. E5
        sub     esp, 64                                 ; 219A _ 83. EC, 40
        mov     eax, dword [ebp+8H]                     ; 219D _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 21A0 _ 8B. 40, 04
        mov     dword [ebp-14H], eax                    ; 21A3 _ 89. 45, EC
        cmp     dword [ebp+0CH], 0                      ; 21A6 _ 83. 7D, 0C, 00
        jns     ?_120                                   ; 21AA _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 21AC _ C7. 45, 0C, 00000000
?_120:  cmp     dword [ebp+10H], 0                      ; 21B3 _ 83. 7D, 10, 00
        jns     ?_121                                   ; 21B7 _ 79, 07
        mov     dword [ebp+10H], 0                      ; 21B9 _ C7. 45, 10, 00000000
?_121:  mov     eax, dword [ebp+8H]                     ; 21C0 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 21C3 _ 8B. 40, 08
        cmp     dword [ebp+14H], eax                    ; 21C6 _ 39. 45, 14
        jle     ?_122                                   ; 21C9 _ 7E, 09
        mov     eax, dword [ebp+8H]                     ; 21CB _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 21CE _ 8B. 40, 08
        mov     dword [ebp+14H], eax                    ; 21D1 _ 89. 45, 14
?_122:  mov     eax, dword [ebp+8H]                     ; 21D4 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 21D7 _ 8B. 40, 0C
        cmp     dword [ebp+18H], eax                    ; 21DA _ 39. 45, 18
        jle     ?_123                                   ; 21DD _ 7E, 09
        mov     eax, dword [ebp+8H]                     ; 21DF _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 21E2 _ 8B. 40, 0C
        mov     dword [ebp+18H], eax                    ; 21E5 _ 89. 45, 18
?_123:  mov     eax, dword [ebp+1CH]                    ; 21E8 _ 8B. 45, 1C
        mov     dword [ebp-30H], eax                    ; 21EB _ 89. 45, D0
        jmp     ?_134                                   ; 21EE _ E9, 00000140

?_124:  mov     eax, dword [ebp+8H]                     ; 21F3 _ 8B. 45, 08
        mov     edx, dword [ebp-30H]                    ; 21F6 _ 8B. 55, D0
        add     edx, 4                                  ; 21F9 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 21FC _ 8B. 44 90, 04
        mov     dword [ebp-10H], eax                    ; 2200 _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 2203 _ 8B. 45, F0
        mov     edx, dword [ebp+8H]                     ; 2206 _ 8B. 55, 08
        add     edx, 1044                               ; 2209 _ 81. C2, 00000414
        sub     eax, edx                                ; 220F _ 29. D0
        sar     eax, 5                                  ; 2211 _ C1. F8, 05
        mov     byte [ebp-31H], al                      ; 2214 _ 88. 45, CF
        mov     eax, dword [ebp-10H]                    ; 2217 _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 221A _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 221C _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 221F _ 8B. 45, F0
        mov     eax, dword [eax+0CH]                    ; 2222 _ 8B. 40, 0C
        mov     edx, dword [ebp+0CH]                    ; 2225 _ 8B. 55, 0C
        sub     edx, eax                                ; 2228 _ 29. C2
        mov     eax, edx                                ; 222A _ 89. D0
        mov     dword [ebp-24H], eax                    ; 222C _ 89. 45, DC
        mov     eax, dword [ebp-10H]                    ; 222F _ 8B. 45, F0
        mov     eax, dword [eax+10H]                    ; 2232 _ 8B. 40, 10
        mov     edx, dword [ebp+10H]                    ; 2235 _ 8B. 55, 10
        sub     edx, eax                                ; 2238 _ 29. C2
        mov     eax, edx                                ; 223A _ 89. D0
        mov     dword [ebp-20H], eax                    ; 223C _ 89. 45, E0
        mov     eax, dword [ebp-10H]                    ; 223F _ 8B. 45, F0
        mov     eax, dword [eax+0CH]                    ; 2242 _ 8B. 40, 0C
        mov     edx, dword [ebp+14H]                    ; 2245 _ 8B. 55, 14
        sub     edx, eax                                ; 2248 _ 29. C2
        mov     eax, edx                                ; 224A _ 89. D0
        mov     dword [ebp-1CH], eax                    ; 224C _ 89. 45, E4
        mov     eax, dword [ebp-10H]                    ; 224F _ 8B. 45, F0
        mov     eax, dword [eax+10H]                    ; 2252 _ 8B. 40, 10
        mov     edx, dword [ebp+18H]                    ; 2255 _ 8B. 55, 18
        sub     edx, eax                                ; 2258 _ 29. C2
        mov     eax, edx                                ; 225A _ 89. D0
        mov     dword [ebp-18H], eax                    ; 225C _ 89. 45, E8
        cmp     dword [ebp-24H], 0                      ; 225F _ 83. 7D, DC, 00
        jns     ?_125                                   ; 2263 _ 79, 07
        mov     dword [ebp-24H], 0                      ; 2265 _ C7. 45, DC, 00000000
?_125:  cmp     dword [ebp-20H], 0                      ; 226C _ 83. 7D, E0, 00
        jns     ?_126                                   ; 2270 _ 79, 07
        mov     dword [ebp-20H], 0                      ; 2272 _ C7. 45, E0, 00000000
?_126:  mov     eax, dword [ebp-10H]                    ; 2279 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 227C _ 8B. 40, 04
        cmp     dword [ebp-1CH], eax                    ; 227F _ 39. 45, E4
        jle     ?_127                                   ; 2282 _ 7E, 09
        mov     eax, dword [ebp-10H]                    ; 2284 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 2287 _ 8B. 40, 04
        mov     dword [ebp-1CH], eax                    ; 228A _ 89. 45, E4
?_127:  mov     eax, dword [ebp-10H]                    ; 228D _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 2290 _ 8B. 40, 08
        cmp     dword [ebp-18H], eax                    ; 2293 _ 39. 45, E8
        jle     ?_128                                   ; 2296 _ 7E, 09
        mov     eax, dword [ebp-10H]                    ; 2298 _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 229B _ 8B. 40, 08
        mov     dword [ebp-18H], eax                    ; 229E _ 89. 45, E8
?_128:  mov     eax, dword [ebp-20H]                    ; 22A1 _ 8B. 45, E0
        mov     dword [ebp-28H], eax                    ; 22A4 _ 89. 45, D8
        jmp     ?_133                                   ; 22A7 _ EB, 7A

?_129:  mov     eax, dword [ebp-10H]                    ; 22A9 _ 8B. 45, F0
        mov     edx, dword [eax+10H]                    ; 22AC _ 8B. 50, 10
        mov     eax, dword [ebp-28H]                    ; 22AF _ 8B. 45, D8
        add     eax, edx                                ; 22B2 _ 01. D0
        mov     dword [ebp-8H], eax                     ; 22B4 _ 89. 45, F8
        mov     eax, dword [ebp-24H]                    ; 22B7 _ 8B. 45, DC
        mov     dword [ebp-2CH], eax                    ; 22BA _ 89. 45, D4
        jmp     ?_132                                   ; 22BD _ EB, 58

?_130:  mov     eax, dword [ebp-10H]                    ; 22BF _ 8B. 45, F0
        mov     edx, dword [eax+0CH]                    ; 22C2 _ 8B. 50, 0C
        mov     eax, dword [ebp-2CH]                    ; 22C5 _ 8B. 45, D4
        add     eax, edx                                ; 22C8 _ 01. D0
        mov     dword [ebp-4H], eax                     ; 22CA _ 89. 45, FC
        mov     eax, dword [ebp-10H]                    ; 22CD _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 22D0 _ 8B. 40, 04
        imul    eax, dword [ebp-28H]                    ; 22D3 _ 0F AF. 45, D8
        mov     edx, eax                                ; 22D7 _ 89. C2
        mov     eax, dword [ebp-2CH]                    ; 22D9 _ 8B. 45, D4
        add     eax, edx                                ; 22DC _ 01. D0
        mov     edx, eax                                ; 22DE _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 22E0 _ 8B. 45, F4
        add     eax, edx                                ; 22E3 _ 01. D0
        movzx   eax, byte [eax]                         ; 22E5 _ 0F B6. 00
        movzx   edx, al                                 ; 22E8 _ 0F B6. D0
        mov     eax, dword [ebp-10H]                    ; 22EB _ 8B. 45, F0
        mov     eax, dword [eax+14H]                    ; 22EE _ 8B. 40, 14
        cmp     edx, eax                                ; 22F1 _ 39. C2
        jz      ?_131                                   ; 22F3 _ 74, 1E
        mov     eax, dword [ebp+8H]                     ; 22F5 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 22F8 _ 8B. 40, 08
        imul    eax, dword [ebp-8H]                     ; 22FB _ 0F AF. 45, F8
        mov     edx, eax                                ; 22FF _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 2301 _ 8B. 45, FC
        add     eax, edx                                ; 2304 _ 01. D0
        mov     edx, eax                                ; 2306 _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 2308 _ 8B. 45, EC
        add     edx, eax                                ; 230B _ 01. C2
        movzx   eax, byte [ebp-31H]                     ; 230D _ 0F B6. 45, CF
        mov     byte [edx], al                          ; 2311 _ 88. 02
?_131:  add     dword [ebp-2CH], 1                      ; 2313 _ 83. 45, D4, 01
?_132:  mov     eax, dword [ebp-2CH]                    ; 2317 _ 8B. 45, D4
        cmp     eax, dword [ebp-1CH]                    ; 231A _ 3B. 45, E4
        jl      ?_130                                   ; 231D _ 7C, A0
        add     dword [ebp-28H], 1                      ; 231F _ 83. 45, D8, 01
?_133:  mov     eax, dword [ebp-28H]                    ; 2323 _ 8B. 45, D8
        cmp     eax, dword [ebp-18H]                    ; 2326 _ 3B. 45, E8
        jl      ?_129                                   ; 2329 _ 0F 8C, FFFFFF7A
        add     dword [ebp-30H], 1                      ; 232F _ 83. 45, D0, 01
?_134:  mov     eax, dword [ebp+8H]                     ; 2333 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2336 _ 8B. 40, 10
        cmp     dword [ebp-30H], eax                    ; 2339 _ 39. 45, D0
        jle     ?_124                                   ; 233C _ 0F 8E, FFFFFEB1
        nop                                             ; 2342 _ 90
        leave                                           ; 2343 _ C9
        ret                                             ; 2344 _ C3
; sheet_refreshmap End of function

init_pit:; Function begin
        push    ebp                                     ; 2345 _ 55
        mov     ebp, esp                                ; 2346 _ 89. E5
        sub     esp, 24                                 ; 2348 _ 83. EC, 18
        call    io_load_eflags                          ; 234B _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 2350 _ 89. 45, F4
        call    io_cli                                  ; 2353 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 2358 _ 83. EC, 08
        push    52                                      ; 235B _ 6A, 34
        push    67                                      ; 235D _ 6A, 43
        call    io_out8                                 ; 235F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2364 _ 83. C4, 10
        sub     esp, 8                                  ; 2367 _ 83. EC, 08
        push    156                                     ; 236A _ 68, 0000009C
        push    64                                      ; 236F _ 6A, 40
        call    io_out8                                 ; 2371 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2376 _ 83. C4, 10
        sub     esp, 8                                  ; 2379 _ 83. EC, 08
        push    46                                      ; 237C _ 6A, 2E
        push    64                                      ; 237E _ 6A, 40
        call    io_out8                                 ; 2380 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2385 _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 2388 _ 8B. 45, 08
        mov     dword [eax], 0                          ; 238B _ C7. 00, 00000000
        mov     eax, dword [ebp+8H]                     ; 2391 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 2394 _ C7. 40, 04, 00000000
        sub     esp, 12                                 ; 239B _ 83. EC, 0C
        push    dword [ebp-0CH]                         ; 239E _ FF. 75, F4
        call    io_store_eflags                         ; 23A1 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 23A6 _ 83. C4, 10
        call    io_sti                                  ; 23A9 _ E8, FFFFFFFC(rel)
        nop                                             ; 23AE _ 90
        leave                                           ; 23AF _ C9
        ret                                             ; 23B0 _ C3
; init_pit End of function

setTimer:; Function begin
        push    ebp                                     ; 23B1 _ 55
        mov     ebp, esp                                ; 23B2 _ 89. E5
        sub     esp, 40                                 ; 23B4 _ 83. EC, 28
        mov     eax, dword [ebp+14H]                    ; 23B7 _ 8B. 45, 14
        mov     byte [ebp-1CH], al                      ; 23BA _ 88. 45, E4
        call    io_load_eflags                          ; 23BD _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 23C2 _ 89. 45, F4
        call    io_cli                                  ; 23C5 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 23CA _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 23CD _ 8B. 55, 0C
        mov     dword [eax+4H], edx                     ; 23D0 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 23D3 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 23D6 _ 8B. 55, 10
        mov     dword [eax+8H], edx                     ; 23D9 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 23DC _ 8B. 45, 08
        movzx   edx, byte [ebp-1CH]                     ; 23DF _ 0F B6. 55, E4
        mov     byte [eax+0CH], dl                      ; 23E3 _ 88. 50, 0C
        sub     esp, 12                                 ; 23E6 _ 83. EC, 0C
        push    dword [ebp-0CH]                         ; 23E9 _ FF. 75, F4
        call    io_store_eflags                         ; 23EC _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 23F1 _ 83. C4, 10
        nop                                             ; 23F4 _ 90
        leave                                           ; 23F5 _ C9
        ret                                             ; 23F6 _ C3
; setTimer End of function

fifo8_init:; Function begin
        push    ebp                                     ; 23F7 _ 55
        mov     ebp, esp                                ; 23F8 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 23FA _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 23FD _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 2400 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 2403 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 2406 _ 8B. 55, 10
        mov     dword [eax], edx                        ; 2409 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 240B _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 240E _ 8B. 55, 0C
        mov     dword [eax+10H], edx                    ; 2411 _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 2414 _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 2417 _ C7. 40, 14, 00000000
        mov     eax, dword [ebp+8H]                     ; 241E _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 2421 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 2428 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 242B _ C7. 40, 08, 00000000
        nop                                             ; 2432 _ 90
        pop     ebp                                     ; 2433 _ 5D
        ret                                             ; 2434 _ C3
; fifo8_init End of function

fifo8_put:; Function begin
        push    ebp                                     ; 2435 _ 55
        mov     ebp, esp                                ; 2436 _ 89. E5
        sub     esp, 4                                  ; 2438 _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 243B _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 243E _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 2441 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2444 _ 8B. 40, 10
        test    eax, eax                                ; 2447 _ 85. C0
        jnz     ?_135                                   ; 2449 _ 75, 18
        mov     eax, dword [ebp+8H]                     ; 244B _ 8B. 45, 08
        mov     eax, dword [eax+14H]                    ; 244E _ 8B. 40, 14
        or      eax, 01H                                ; 2451 _ 83. C8, 01
        mov     edx, eax                                ; 2454 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2456 _ 8B. 45, 08
        mov     dword [eax+14H], edx                    ; 2459 _ 89. 50, 14
        mov     eax, 4294967295                         ; 245C _ B8, FFFFFFFF
        jmp     ?_137                                   ; 2461 _ EB, 50

?_135:  mov     eax, dword [ebp+8H]                     ; 2463 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 2466 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 2468 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 246B _ 8B. 40, 04
        add     edx, eax                                ; 246E _ 01. C2
        movzx   eax, byte [ebp-4H]                      ; 2470 _ 0F B6. 45, FC
        mov     byte [edx], al                          ; 2474 _ 88. 02
        mov     eax, dword [ebp+8H]                     ; 2476 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2479 _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 247C _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 247F _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 2482 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 2485 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 2488 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 248B _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 248E _ 8B. 40, 0C
        cmp     edx, eax                                ; 2491 _ 39. C2
        jnz     ?_136                                   ; 2493 _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 2495 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 2498 _ C7. 40, 04, 00000000
?_136:  mov     eax, dword [ebp+8H]                     ; 249F _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 24A2 _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 24A5 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 24A8 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 24AB _ 89. 50, 10
        mov     eax, 0                                  ; 24AE _ B8, 00000000
?_137:  leave                                           ; 24B3 _ C9
        ret                                             ; 24B4 _ C3
; fifo8_put End of function

fifo8_get:; Function begin
        push    ebp                                     ; 24B5 _ 55
        mov     ebp, esp                                ; 24B6 _ 89. E5
        sub     esp, 16                                 ; 24B8 _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 24BB _ 8B. 45, 08
        mov     edx, dword [eax+10H]                    ; 24BE _ 8B. 50, 10
        mov     eax, dword [ebp+8H]                     ; 24C1 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 24C4 _ 8B. 40, 0C
        cmp     edx, eax                                ; 24C7 _ 39. C2
        jnz     ?_138                                   ; 24C9 _ 75, 07
        mov     eax, 4294967295                         ; 24CB _ B8, FFFFFFFF
        jmp     ?_140                                   ; 24D0 _ EB, 51

?_138:  mov     eax, dword [ebp+8H]                     ; 24D2 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 24D5 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 24D7 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 24DA _ 8B. 40, 08
        add     eax, edx                                ; 24DD _ 01. D0
        movzx   eax, byte [eax]                         ; 24DF _ 0F B6. 00
        movzx   eax, al                                 ; 24E2 _ 0F B6. C0
        mov     dword [ebp-4H], eax                     ; 24E5 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 24E8 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 24EB _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 24EE _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 24F1 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 24F4 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 24F7 _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 24FA _ 8B. 50, 08
        mov     eax, dword [ebp+8H]                     ; 24FD _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2500 _ 8B. 40, 0C
        cmp     edx, eax                                ; 2503 _ 39. C2
        jnz     ?_139                                   ; 2505 _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 2507 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 250A _ C7. 40, 08, 00000000
?_139:  mov     eax, dword [ebp+8H]                     ; 2511 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2514 _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 2517 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 251A _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 251D _ 89. 50, 10
        mov     eax, dword [ebp-4H]                     ; 2520 _ 8B. 45, FC
?_140:  leave                                           ; 2523 _ C9
        ret                                             ; 2524 _ C3
; fifo8_get End of function

fifo8_status:; Function begin
        push    ebp                                     ; 2525 _ 55
        mov     ebp, esp                                ; 2526 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 2528 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 252B _ 8B. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 252E _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2531 _ 8B. 40, 10
        sub     edx, eax                                ; 2534 _ 29. C2
        mov     eax, edx                                ; 2536 _ 89. D0
        pop     ebp                                     ; 2538 _ 5D
        ret                                             ; 2539 _ C3
; fifo8_status End of function



?_141:                                                  ; byte
        db 77H, 69H, 6EH, 64H, 64H, 6FH, 77H, 6EH       ; 0000 _ winddown
        db 00H                                          ; 0008 _ .

?_142:                                                  ; byte
        db 35H, 5BH, 73H, 65H, 63H, 5DH, 00H            ; 0009 _ 5[sec].

?_143:                                                  ; byte
        db 69H, 6DH, 70H, 72H, 6FH, 76H, 65H, 20H       ; 0010 _ improve 
        db 73H, 74H, 72H, 69H, 6EH, 67H, 20H, 73H       ; 0018 _ string s
        db 68H, 6FH, 77H, 69H, 6EH, 67H, 21H, 00H       ; 0020 _ howing!.

?_144:                                                  ; byte
        db 70H, 61H, 67H, 65H, 20H, 69H, 73H, 3AH       ; 0028 _ page is:
        db 20H, 00H                                     ; 0030 _  .

?_145:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0032 _ BaseAddr
        db 4CH, 3AH, 20H, 00H                           ; 003A _ L: .

?_146:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 003E _ BaseAddr
        db 48H, 3AH, 20H, 00H                           ; 0046 _ H: .

?_147:                                                  ; byte
        db 4CH, 65H, 6EH, 67H, 74H, 68H, 4CH, 6FH       ; 004A _ LengthLo
        db 77H, 3AH, 20H, 00H                           ; 0052 _ w: .

?_148:                                                  ; byte
        db 4CH, 65H, 6EH, 67H, 74H, 68H, 48H, 69H       ; 0056 _ LengthHi
        db 67H, 68H, 3AH, 20H, 00H                      ; 005E _ gh: .

?_149:                                                  ; byte
        db 54H, 79H, 70H, 65H, 3AH, 20H, 00H            ; 0063 _ Type: .

?_150:                                                  ; byte
        db 57H, 65H, 6CH, 65H, 63H, 6FH, 6DH, 65H       ; 006A _ Welecome
        db 20H, 74H, 6FH, 00H                           ; 0072 _  to.

?_151:                                                  ; byte
        db 6DH, 79H, 4FH, 53H, 00H                      ; 0076 _ myOS.



keyval:                                                 ; byte
        db 30H, 78H                                     ; 0000 _ 0x

?_152:  db 00H                                          ; 0002 _ .

?_153:  db 00H, 00H, 00H, 00H, 00H                      ; 0003 _ .....

memman: dd 00100000H, 00000000H                         ; 0008 _ 1048576 0 
        dd 00000000H, 00000000H                         ; 0010 _ 0 0 
        dd 00000000H, 00000000H                         ; 0018 _ 0 0 

table_rgb.1703:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 00H, 0FFH     ; 0020 _ ........
        db 00H, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH   ; 0028 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0030 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0038 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 0040 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 0048 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0050 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0058 _ ........

cursor.1760:                                            ; byte
        db 2AH, 2AH, 2AH, 2AH, 2AH, 2AH, 2AH, 2AH       ; 0060 _ ********
        db 2AH, 2AH, 2AH, 2AH, 2AH, 2AH, 2EH, 2EH       ; 0068 _ ******..
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 0070 _ *OOOOOOO
        db 4FH, 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH       ; 0078 _ OOOO*...
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 0080 _ *OOOOOOO
        db 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH       ; 0088 _ OOO*....
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 0090 _ *OOOOOOO
        db 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0098 _ OO*.....
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 00A0 _ *OOOOOOO
        db 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 00A8 _ O*......
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 00B0 _ *OOOOOOO
        db 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 00B8 _ *.......
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 00C0 _ *OOOOOOO
        db 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 00C8 _ *.......
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 00D0 _ *OOOOOOO
        db 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 00D8 _ O*......
        db 2AH, 4FH, 4FH, 4FH, 4FH, 2AH, 2AH, 4FH       ; 00E0 _ *OOOO**O
        db 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 00E8 _ OO*.....
        db 2AH, 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2AH       ; 00F0 _ *OOO*..*
        db 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH       ; 00F8 _ OOO*....
        db 2AH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH       ; 0100 _ *OO*....
        db 2AH, 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH       ; 0108 _ *OOO*...
        db 2AH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0110 _ *O*.....
        db 2EH, 2AH, 4FH, 4FH, 4FH, 2AH, 2EH, 2EH       ; 0118 _ .*OOO*..
        db 2AH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0120 _ **......
        db 2EH, 2EH, 2AH, 4FH, 4FH, 4FH, 2AH, 2EH       ; 0128 _ ..*OOO*.
        db 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0130 _ *.......
        db 2EH, 2EH, 2EH, 2AH, 4FH, 4FH, 4FH, 2AH       ; 0138 _ ...*OOO*
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0140 _ ........
        db 2EH, 2EH, 2EH, 2EH, 2AH, 4FH, 4FH, 2AH       ; 0148 _ ....*OO*
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0150 _ ........
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2AH, 2AH, 2AH       ; 0158 _ .....***

closebtn.1875:                                          ; byte
        db 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 0160 _ OOOOOOOO
        db 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 40H       ; 0168 _ OOOOOOO@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 51H       ; 0170 _ OQQQQQQQ
        db 51H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 0178 _ QQQQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 51H       ; 0180 _ OQQQQQQQ
        db 51H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 0188 _ QQQQQQ$@
        db 4FH, 51H, 51H, 51H, 40H, 40H, 51H, 51H       ; 0190 _ OQQQ@@QQ
        db 51H, 51H, 40H, 40H, 51H, 51H, 24H, 40H       ; 0198 _ QQ@@QQ$@
        db 4FH, 51H, 51H, 51H, 51H, 40H, 40H, 51H       ; 01A0 _ OQQQQ@@Q
        db 51H, 40H, 40H, 51H, 51H, 51H, 24H, 40H       ; 01A8 _ Q@@QQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 40H, 40H       ; 01B0 _ OQQQQQ@@
        db 40H, 40H, 51H, 51H, 51H, 51H, 24H, 40H       ; 01B8 _ @@QQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 40H       ; 01C0 _ OQQQQQQ@
        db 40H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 01C8 _ @QQQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 40H, 40H       ; 01D0 _ OQQQQQ@@
        db 40H, 40H, 51H, 51H, 51H, 51H, 24H, 40H       ; 01D8 _ @@QQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 40H, 40H, 51H       ; 01E0 _ OQQQQ@@Q
        db 51H, 40H, 40H, 51H, 51H, 51H, 24H, 40H       ; 01E8 _ Q@@QQQ$@
        db 4FH, 51H, 51H, 51H, 40H, 40H, 51H, 51H       ; 01F0 _ OQQQ@@QQ
        db 51H, 51H, 40H, 40H, 51H, 51H, 24H, 40H       ; 01F8 _ QQ@@QQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 51H       ; 0200 _ OQQQQQQQ
        db 51H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 0208 _ QQQQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 51H       ; 0210 _ OQQQQQQQ
        db 51H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 0218 _ QQQQQQ$@
        db 4FH, 24H, 24H, 24H, 24H, 24H, 24H, 24H       ; 0220 _ O$$$$$$$
        db 24H, 24H, 24H, 24H, 24H, 24H, 24H, 40H       ; 0228 _ $$$$$$$@
        db 40H, 40H, 40H, 40H, 40H, 40H, 40H, 40H       ; 0230 _ @@@@@@@@
        db 40H, 40H, 40H, 40H, 40H, 40H, 40H, 40H       ; 0238 _ @@@@@@@@



bootInfo:                                               ; qword
        resb    4                                       ; 0000

?_154:  resw    1                                       ; 0004

?_155:  resw    1                                       ; 0006

mouseinfo:                                              ; byte
        resb    24                                      ; 0008

keyinfo:                                                ; byte
        resb    32                                      ; 0020

mousebuf:                                               ; byte
        resb    128                                     ; 0040

keybuf:                                                 ; yword
        resb    32                                      ; 00C0

mdec:                                                   ; oword
        resb    16                                      ; 00E0

mx:     resd    1                                       ; 00F0

my:     resd    1                                       ; 00F4

buf_back: resd  2                                       ; 00F8

buf_mouse:                                              ; byte
        resb    256                                     ; 0100

xsize:  resd    1                                       ; 0200

ysize:  resd    1                                       ; 0204

timerinfo:                                              ; byte
        resb    24                                      ; 0208

timerbuf: resq  1                                       ; 0220

timerctl:                                               ; oword
        resd    1                                       ; 0228

?_156:  resd    1                                       ; 022C

?_157:  resd    1                                       ; 0230

?_158:  resb    4                                       ; 0234

str.1804:                                               ; byte
        resb    1                                       ; 0238

?_159:  resb    9                                       ; 0239

?_160:  resb    1                                       ; 0242


