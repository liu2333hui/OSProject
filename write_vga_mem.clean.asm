CMain:  ; Function begin
        push    ebp                                     ; 0000 _ 55
        mov     ebp, esp                                ; 0001 _ 89. E5
        push    ebx                                     ; 0003 _ 53
        sub     esp, 52                                 ; 0004 _ 83. EC, 34
        sub     esp, 12                                 ; 0007 _ 83. EC, 0C
        push    bootInfo                                ; 000A _ 68, 00000100(d)
        call    initBootInfo                            ; 000F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0014 _ 83. C4, 10
        mov     eax, dword [bootInfo]                   ; 0017 _ A1, 00000100(d)
        mov     dword [ebp-2CH], eax                    ; 001C _ 89. 45, D4
        movzx   eax, word [?_063]                       ; 001F _ 0F B7. 05, 00000104(d)
        cwde                                            ; 0026 _ 98
        mov     dword [ebp-28H], eax                    ; 0027 _ 89. 45, D8
        movzx   eax, word [?_064]                       ; 002A _ 0F B7. 05, 00000106(d)
        cwde                                            ; 0031 _ 98
        mov     dword [ebp-24H], eax                    ; 0032 _ 89. 45, DC
        call    init_palette                            ; 0035 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-24H]                    ; 003A _ 8B. 45, DC
        lea     edx, [eax-1DH]                          ; 003D _ 8D. 50, E3
        mov     eax, dword [ebp-28H]                    ; 0040 _ 8B. 45, D8
        sub     eax, 1                                  ; 0043 _ 83. E8, 01
        sub     esp, 4                                  ; 0046 _ 83. EC, 04
        push    edx                                     ; 0049 _ 52
        push    eax                                     ; 004A _ 50
        push    0                                       ; 004B _ 6A, 00
        push    0                                       ; 004D _ 6A, 00
        push    14                                      ; 004F _ 6A, 0E
        push    dword [ebp-28H]                         ; 0051 _ FF. 75, D8
        push    dword [ebp-2CH]                         ; 0054 _ FF. 75, D4
        call    boxfill8                                ; 0057 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 005C _ 83. C4, 20
        mov     eax, dword [ebp-24H]                    ; 005F _ 8B. 45, DC
        lea     ecx, [eax-1CH]                          ; 0062 _ 8D. 48, E4
        mov     eax, dword [ebp-28H]                    ; 0065 _ 8B. 45, D8
        lea     edx, [eax-1H]                           ; 0068 _ 8D. 50, FF
        mov     eax, dword [ebp-24H]                    ; 006B _ 8B. 45, DC
        sub     eax, 28                                 ; 006E _ 83. E8, 1C
        sub     esp, 4                                  ; 0071 _ 83. EC, 04
        push    ecx                                     ; 0074 _ 51
        push    edx                                     ; 0075 _ 52
        push    eax                                     ; 0076 _ 50
        push    0                                       ; 0077 _ 6A, 00
        push    8                                       ; 0079 _ 6A, 08
        push    dword [ebp-28H]                         ; 007B _ FF. 75, D8
        push    dword [ebp-2CH]                         ; 007E _ FF. 75, D4
        call    boxfill8                                ; 0081 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0086 _ 83. C4, 20
        mov     eax, dword [ebp-24H]                    ; 0089 _ 8B. 45, DC
        lea     ecx, [eax-1BH]                          ; 008C _ 8D. 48, E5
        mov     eax, dword [ebp-28H]                    ; 008F _ 8B. 45, D8
        lea     edx, [eax-1H]                           ; 0092 _ 8D. 50, FF
        mov     eax, dword [ebp-24H]                    ; 0095 _ 8B. 45, DC
        sub     eax, 27                                 ; 0098 _ 83. E8, 1B
        sub     esp, 4                                  ; 009B _ 83. EC, 04
        push    ecx                                     ; 009E _ 51
        push    edx                                     ; 009F _ 52
        push    eax                                     ; 00A0 _ 50
        push    0                                       ; 00A1 _ 6A, 00
        push    7                                       ; 00A3 _ 6A, 07
        push    dword [ebp-28H]                         ; 00A5 _ FF. 75, D8
        push    dword [ebp-2CH]                         ; 00A8 _ FF. 75, D4
        call    boxfill8                                ; 00AB _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 00B0 _ 83. C4, 20
        mov     eax, dword [ebp-24H]                    ; 00B3 _ 8B. 45, DC
        lea     ecx, [eax-1H]                           ; 00B6 _ 8D. 48, FF
        mov     eax, dword [ebp-28H]                    ; 00B9 _ 8B. 45, D8
        lea     edx, [eax-1H]                           ; 00BC _ 8D. 50, FF
        mov     eax, dword [ebp-24H]                    ; 00BF _ 8B. 45, DC
        sub     eax, 26                                 ; 00C2 _ 83. E8, 1A
        sub     esp, 4                                  ; 00C5 _ 83. EC, 04
        push    ecx                                     ; 00C8 _ 51
        push    edx                                     ; 00C9 _ 52
        push    eax                                     ; 00CA _ 50
        push    0                                       ; 00CB _ 6A, 00
        push    8                                       ; 00CD _ 6A, 08
        push    dword [ebp-28H]                         ; 00CF _ FF. 75, D8
        push    dword [ebp-2CH]                         ; 00D2 _ FF. 75, D4
        call    boxfill8                                ; 00D5 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 00DA _ 83. C4, 20
        mov     eax, dword [ebp-24H]                    ; 00DD _ 8B. 45, DC
        lea     edx, [eax-18H]                          ; 00E0 _ 8D. 50, E8
        mov     eax, dword [ebp-24H]                    ; 00E3 _ 8B. 45, DC
        sub     eax, 24                                 ; 00E6 _ 83. E8, 18
        sub     esp, 4                                  ; 00E9 _ 83. EC, 04
        push    edx                                     ; 00EC _ 52
        push    59                                      ; 00ED _ 6A, 3B
        push    eax                                     ; 00EF _ 50
        push    3                                       ; 00F0 _ 6A, 03
        push    7                                       ; 00F2 _ 6A, 07
        push    dword [ebp-28H]                         ; 00F4 _ FF. 75, D8
        push    dword [ebp-2CH]                         ; 00F7 _ FF. 75, D4
        call    boxfill8                                ; 00FA _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 00FF _ 83. C4, 20
        mov     eax, dword [ebp-24H]                    ; 0102 _ 8B. 45, DC
        lea     edx, [eax-4H]                           ; 0105 _ 8D. 50, FC
        mov     eax, dword [ebp-24H]                    ; 0108 _ 8B. 45, DC
        sub     eax, 24                                 ; 010B _ 83. E8, 18
        sub     esp, 4                                  ; 010E _ 83. EC, 04
        push    edx                                     ; 0111 _ 52
        push    2                                       ; 0112 _ 6A, 02
        push    eax                                     ; 0114 _ 50
        push    2                                       ; 0115 _ 6A, 02
        push    7                                       ; 0117 _ 6A, 07
        push    dword [ebp-28H]                         ; 0119 _ FF. 75, D8
        push    dword [ebp-2CH]                         ; 011C _ FF. 75, D4
        call    boxfill8                                ; 011F _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0124 _ 83. C4, 20
        mov     eax, dword [ebp-24H]                    ; 0127 _ 8B. 45, DC
        lea     edx, [eax-4H]                           ; 012A _ 8D. 50, FC
        mov     eax, dword [ebp-24H]                    ; 012D _ 8B. 45, DC
        sub     eax, 4                                  ; 0130 _ 83. E8, 04
        sub     esp, 4                                  ; 0133 _ 83. EC, 04
        push    edx                                     ; 0136 _ 52
        push    59                                      ; 0137 _ 6A, 3B
        push    eax                                     ; 0139 _ 50
        push    3                                       ; 013A _ 6A, 03
        push    15                                      ; 013C _ 6A, 0F
        push    dword [ebp-28H]                         ; 013E _ FF. 75, D8
        push    dword [ebp-2CH]                         ; 0141 _ FF. 75, D4
        call    boxfill8                                ; 0144 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0149 _ 83. C4, 20
        mov     eax, dword [ebp-24H]                    ; 014C _ 8B. 45, DC
        lea     edx, [eax-5H]                           ; 014F _ 8D. 50, FB
        mov     eax, dword [ebp-24H]                    ; 0152 _ 8B. 45, DC
        sub     eax, 23                                 ; 0155 _ 83. E8, 17
        sub     esp, 4                                  ; 0158 _ 83. EC, 04
        push    edx                                     ; 015B _ 52
        push    59                                      ; 015C _ 6A, 3B
        push    eax                                     ; 015E _ 50
        push    59                                      ; 015F _ 6A, 3B
        push    15                                      ; 0161 _ 6A, 0F
        push    dword [ebp-28H]                         ; 0163 _ FF. 75, D8
        push    dword [ebp-2CH]                         ; 0166 _ FF. 75, D4
        call    boxfill8                                ; 0169 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 016E _ 83. C4, 20
        mov     eax, dword [ebp-24H]                    ; 0171 _ 8B. 45, DC
        lea     edx, [eax-3H]                           ; 0174 _ 8D. 50, FD
        mov     eax, dword [ebp-24H]                    ; 0177 _ 8B. 45, DC
        sub     eax, 3                                  ; 017A _ 83. E8, 03
        sub     esp, 4                                  ; 017D _ 83. EC, 04
        push    edx                                     ; 0180 _ 52
        push    59                                      ; 0181 _ 6A, 3B
        push    eax                                     ; 0183 _ 50
        push    2                                       ; 0184 _ 6A, 02
        push    0                                       ; 0186 _ 6A, 00
        push    dword [ebp-28H]                         ; 0188 _ FF. 75, D8
        push    dword [ebp-2CH]                         ; 018B _ FF. 75, D4
        call    boxfill8                                ; 018E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0193 _ 83. C4, 20
        mov     eax, dword [ebp-24H]                    ; 0196 _ 8B. 45, DC
        lea     edx, [eax-3H]                           ; 0199 _ 8D. 50, FD
        mov     eax, dword [ebp-24H]                    ; 019C _ 8B. 45, DC
        sub     eax, 24                                 ; 019F _ 83. E8, 18
        sub     esp, 4                                  ; 01A2 _ 83. EC, 04
        push    edx                                     ; 01A5 _ 52
        push    60                                      ; 01A6 _ 6A, 3C
        push    eax                                     ; 01A8 _ 50
        push    60                                      ; 01A9 _ 6A, 3C
        push    0                                       ; 01AB _ 6A, 00
        push    dword [ebp-28H]                         ; 01AD _ FF. 75, D8
        push    dword [ebp-2CH]                         ; 01B0 _ FF. 75, D4
        call    boxfill8                                ; 01B3 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 01B8 _ 83. C4, 20
        mov     eax, dword [ebp-24H]                    ; 01BB _ 8B. 45, DC
        lea     ebx, [eax-3H]                           ; 01BE _ 8D. 58, FD
        mov     eax, dword [ebp-28H]                    ; 01C1 _ 8B. 45, D8
        lea     ecx, [eax-4H]                           ; 01C4 _ 8D. 48, FC
        mov     eax, dword [ebp-24H]                    ; 01C7 _ 8B. 45, DC
        lea     edx, [eax-3H]                           ; 01CA _ 8D. 50, FD
        mov     eax, dword [ebp-28H]                    ; 01CD _ 8B. 45, D8
        sub     eax, 47                                 ; 01D0 _ 83. E8, 2F
        sub     esp, 4                                  ; 01D3 _ 83. EC, 04
        push    ebx                                     ; 01D6 _ 53
        push    ecx                                     ; 01D7 _ 51
        push    edx                                     ; 01D8 _ 52
        push    eax                                     ; 01D9 _ 50
        push    7                                       ; 01DA _ 6A, 07
        push    dword [ebp-28H]                         ; 01DC _ FF. 75, D8
        push    dword [ebp-2CH]                         ; 01DF _ FF. 75, D4
        call    boxfill8                                ; 01E2 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 01E7 _ 83. C4, 20
        mov     eax, dword [ebp-24H]                    ; 01EA _ 8B. 45, DC
        lea     ebx, [eax-4H]                           ; 01ED _ 8D. 58, FC
        mov     eax, dword [ebp-28H]                    ; 01F0 _ 8B. 45, D8
        lea     ecx, [eax-3H]                           ; 01F3 _ 8D. 48, FD
        mov     eax, dword [ebp-24H]                    ; 01F6 _ 8B. 45, DC
        lea     edx, [eax-18H]                          ; 01F9 _ 8D. 50, E8
        mov     eax, dword [ebp-28H]                    ; 01FC _ 8B. 45, D8
        sub     eax, 3                                  ; 01FF _ 83. E8, 03
        sub     esp, 4                                  ; 0202 _ 83. EC, 04
        push    ebx                                     ; 0205 _ 53
        push    ecx                                     ; 0206 _ 51
        push    edx                                     ; 0207 _ 52
        push    eax                                     ; 0208 _ 50
        push    7                                       ; 0209 _ 6A, 07
        push    dword [ebp-28H]                         ; 020B _ FF. 75, D8
        push    dword [ebp-2CH]                         ; 020E _ FF. 75, D4
        call    boxfill8                                ; 0211 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0216 _ 83. C4, 20
        mov     eax, dword [ebp-24H]                    ; 0219 _ 8B. 45, DC
        lea     ebx, [eax-18H]                          ; 021C _ 8D. 58, E8
        mov     eax, dword [ebp-28H]                    ; 021F _ 8B. 45, D8
        lea     ecx, [eax-4H]                           ; 0222 _ 8D. 48, FC
        mov     eax, dword [ebp-24H]                    ; 0225 _ 8B. 45, DC
        lea     edx, [eax-18H]                          ; 0228 _ 8D. 50, E8
        mov     eax, dword [ebp-28H]                    ; 022B _ 8B. 45, D8
        sub     eax, 47                                 ; 022E _ 83. E8, 2F
        sub     esp, 4                                  ; 0231 _ 83. EC, 04
        push    ebx                                     ; 0234 _ 53
        push    ecx                                     ; 0235 _ 51
        push    edx                                     ; 0236 _ 52
        push    eax                                     ; 0237 _ 50
        push    15                                      ; 0238 _ 6A, 0F
        push    dword [ebp-28H]                         ; 023A _ FF. 75, D8
        push    dword [ebp-2CH]                         ; 023D _ FF. 75, D4
        call    boxfill8                                ; 0240 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0245 _ 83. C4, 20
        mov     eax, dword [ebp-24H]                    ; 0248 _ 8B. 45, DC
        lea     ebx, [eax-4H]                           ; 024B _ 8D. 58, FC
        mov     eax, dword [ebp-28H]                    ; 024E _ 8B. 45, D8
        lea     ecx, [eax-2FH]                          ; 0251 _ 8D. 48, D1
        mov     eax, dword [ebp-24H]                    ; 0254 _ 8B. 45, DC
        lea     edx, [eax-17H]                          ; 0257 _ 8D. 50, E9
        mov     eax, dword [ebp-28H]                    ; 025A _ 8B. 45, D8
        sub     eax, 47                                 ; 025D _ 83. E8, 2F
        sub     esp, 4                                  ; 0260 _ 83. EC, 04
        push    ebx                                     ; 0263 _ 53
        push    ecx                                     ; 0264 _ 51
        push    edx                                     ; 0265 _ 52
        push    eax                                     ; 0266 _ 50
        push    15                                      ; 0267 _ 6A, 0F
        push    dword [ebp-28H]                         ; 0269 _ FF. 75, D8
        push    dword [ebp-2CH]                         ; 026C _ FF. 75, D4
        call    boxfill8                                ; 026F _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0274 _ 83. C4, 20
        call    get_memory_block_count                  ; 0277 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 027C _ 89. 45, E0
        mov     eax, dword [ebp-20H]                    ; 027F _ 8B. 45, E0
        movzx   eax, al                                 ; 0282 _ 0F B6. C0
        sub     esp, 12                                 ; 0285 _ 83. EC, 0C
        push    eax                                     ; 0288 _ 50
        call    intToHexStr                             ; 0289 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 028E _ 83. C4, 10
        mov     dword [ebp-1CH], eax                    ; 0291 _ 89. 45, E4
        sub     esp, 8                                  ; 0294 _ 83. EC, 08
        push    dword [ebp-1CH]                         ; 0297 _ FF. 75, E4
        push    7                                       ; 029A _ 6A, 07
        push    40                                      ; 029C _ 6A, 28
        push    48                                      ; 029E _ 6A, 30
        push    dword [ebp-28H]                         ; 02A0 _ FF. 75, D8
        push    dword [ebp-2CH]                         ; 02A3 _ FF. 75, D4
        call    showString                              ; 02A6 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 02AB _ 83. C4, 20
        mov     eax, dword [ebp-28H]                    ; 02AE _ 8B. 45, D8
        sub     eax, 16                                 ; 02B1 _ 83. E8, 10
        mov     edx, eax                                ; 02B4 _ 89. C2
        shr     edx, 31                                 ; 02B6 _ C1. EA, 1F
        add     eax, edx                                ; 02B9 _ 01. D0
        sar     eax, 1                                  ; 02BB _ D1. F8
        mov     dword [mx], eax                         ; 02BD _ A3, 000001F0(d)
        mov     eax, dword [ebp-24H]                    ; 02C2 _ 8B. 45, DC
        sub     eax, 44                                 ; 02C5 _ 83. E8, 2C
        mov     edx, eax                                ; 02C8 _ 89. C2
        shr     edx, 31                                 ; 02CA _ C1. EA, 1F
        add     eax, edx                                ; 02CD _ 01. D0
        sar     eax, 1                                  ; 02CF _ D1. F8
        mov     dword [mx], eax                         ; 02D1 _ A3, 000001F0(d)
        sub     esp, 8                                  ; 02D6 _ 83. EC, 08
        push    14                                      ; 02D9 _ 6A, 0E
        push    mcursor                                 ; 02DB _ 68, 00000000(d)
        call    init_mouse_cursor                       ; 02E0 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 02E5 _ 83. C4, 10
        mov     edx, dword [my]                         ; 02E8 _ 8B. 15, 000001F4(d)
        mov     eax, dword [mx]                         ; 02EE _ A1, 000001F0(d)
        push    16                                      ; 02F3 _ 6A, 10
        push    mcursor                                 ; 02F5 _ 68, 00000000(d)
        push    edx                                     ; 02FA _ 52
        push    eax                                     ; 02FB _ 50
        push    16                                      ; 02FC _ 6A, 10
        push    16                                      ; 02FE _ 6A, 10
        push    dword [ebp-28H]                         ; 0300 _ FF. 75, D8
        push    dword [ebp-2CH]                         ; 0303 _ FF. 75, D4
        call    putblock                                ; 0306 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 030B _ 83. C4, 20
        sub     esp, 4                                  ; 030E _ 83. EC, 04
        push    mousebuf                                ; 0311 _ 68, 00000140(d)
        push    128                                     ; 0316 _ 68, 00000080
        push    mouseinfo                               ; 031B _ 68, 00000108(d)
        call    fifo8_init                              ; 0320 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0325 _ 83. C4, 10
        sub     esp, 4                                  ; 0328 _ 83. EC, 04
        push    keybuf                                  ; 032B _ 68, 000001C0(d)
        push    32                                      ; 0330 _ 6A, 20
        push    keyinfo                                 ; 0332 _ 68, 00000120(d)
        call    fifo8_init                              ; 0337 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 033C _ 83. C4, 10
        call    init_keyboard                           ; 033F _ E8, FFFFFFFC(rel)
        call    enable_mouse                            ; 0344 _ E8, FFFFFFFC(rel)
        call    get_adr_buffer                          ; 0349 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 034E _ 89. 45, E8
        call    io_sti                                  ; 0351 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], 0                      ; 0356 _ C7. 45, EC, 00000000
        mov     dword [ebp-10H], 0                      ; 035D _ C7. 45, F0, 00000000
?_001:  sub     esp, 12                                 ; 0364 _ 83. EC, 0C
        push    keyinfo                                 ; 0367 _ 68, 00000120(d)
        call    fifo8_status                            ; 036C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0371 _ 83. C4, 10
        mov     ebx, eax                                ; 0374 _ 89. C3
        sub     esp, 12                                 ; 0376 _ 83. EC, 0C
        push    mouseinfo                               ; 0379 _ 68, 00000108(d)
        call    fifo8_status                            ; 037E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0383 _ 83. C4, 10
        add     eax, ebx                                ; 0386 _ 01. D8
        test    eax, eax                                ; 0388 _ 85. C0
        jnz     ?_002                                   ; 038A _ 75, 07
        call    io_hlt                                  ; 038C _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 0391 _ EB, D1
; CMain End of function

?_002:  ; Local function
        sub     esp, 12                                 ; 0393 _ 83. EC, 0C
        push    keyinfo                                 ; 0396 _ 68, 00000120(d)
        call    fifo8_status                            ; 039B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03A0 _ 83. C4, 10
        test    eax, eax                                ; 03A3 _ 85. C0
        jz      ?_003                                   ; 03A5 _ 74, 58
        sub     esp, 12                                 ; 03A7 _ 83. EC, 0C
        push    keyinfo                                 ; 03AA _ 68, 00000120(d)
        call    fifo8_get                               ; 03AF _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03B4 _ 83. C4, 10
        mov     dword [ebp-14H], eax                    ; 03B7 _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 03BA _ 8B. 45, EC
        movzx   eax, al                                 ; 03BD _ 0F B6. C0
        sub     esp, 12                                 ; 03C0 _ 83. EC, 0C
        push    eax                                     ; 03C3 _ 50
        call    charToHexStr                            ; 03C4 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03C9 _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 03CC _ 89. 45, F4
        mov     eax, dword [showPos.1564]               ; 03CF _ A1, 000001F8(d)
        sub     esp, 8                                  ; 03D4 _ 83. EC, 08
        push    dword [ebp-0CH]                         ; 03D7 _ FF. 75, F4
        push    7                                       ; 03DA _ 6A, 07
        push    0                                       ; 03DC _ 6A, 00
        push    eax                                     ; 03DE _ 50
        push    dword [ebp-28H]                         ; 03DF _ FF. 75, D8
        push    dword [ebp-2CH]                         ; 03E2 _ FF. 75, D4
        call    showString                              ; 03E5 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 03EA _ 83. C4, 20
        mov     eax, dword [showPos.1564]               ; 03ED _ A1, 000001F8(d)
        add     eax, 32                                 ; 03F2 _ 83. C0, 20
        mov     dword [showPos.1564], eax               ; 03F5 _ A3, 000001F8(d)
        jmp     ?_001                                   ; 03FA _ E9, FFFFFF65

?_003:  ; Local function
        sub     esp, 12                                 ; 03FF _ 83. EC, 0C
        push    mouseinfo                               ; 0402 _ 68, 00000108(d)
        call    fifo8_status                            ; 0407 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 040C _ 83. C4, 10
        test    eax, eax                                ; 040F _ 85. C0
        je      ?_001                                   ; 0411 _ 0F 84, FFFFFF4D
        call    show_mouse_info                         ; 0417 _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 041C _ E9, FFFFFF43

initBootInfo:; Function begin
        push    ebp                                     ; 0421 _ 55
        mov     ebp, esp                                ; 0422 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 0424 _ 8B. 45, 08
        mov     dword [eax], 655360                     ; 0427 _ C7. 00, 000A0000
        mov     eax, dword [ebp+8H]                     ; 042D _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 320                      ; 0430 _ 66: C7. 40, 04, 0140
        mov     eax, dword [ebp+8H]                     ; 0436 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 200                      ; 0439 _ 66: C7. 40, 06, 00C8
        nop                                             ; 043F _ 90
        pop     ebp                                     ; 0440 _ 5D
        ret                                             ; 0441 _ C3
; initBootInfo End of function

init_palette:; Function begin
        push    ebp                                     ; 0442 _ 55
        mov     ebp, esp                                ; 0443 _ 89. E5
        sub     esp, 8                                  ; 0445 _ 83. EC, 08
        sub     esp, 4                                  ; 0448 _ 83. EC, 04
        push    table_rgb.1573                          ; 044B _ 68, 00000020(d)
        push    15                                      ; 0450 _ 6A, 0F
        push    0                                       ; 0452 _ 6A, 00
        call    set_palette                             ; 0454 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0459 _ 83. C4, 10
        nop                                             ; 045C _ 90
        leave                                           ; 045D _ C9
        ret                                             ; 045E _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 045F _ 55
        mov     ebp, esp                                ; 0460 _ 89. E5
        sub     esp, 24                                 ; 0462 _ 83. EC, 18
        call    io_load_eflags                          ; 0465 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 046A _ 89. 45, F4
        call    io_cli                                  ; 046D _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0472 _ 83. EC, 08
        push    dword [ebp+8H]                          ; 0475 _ FF. 75, 08
        push    968                                     ; 0478 _ 68, 000003C8
        call    io_out8                                 ; 047D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0482 _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 0485 _ 8B. 45, 08
        mov     dword [ebp-10H], eax                    ; 0488 _ 89. 45, F0
        jmp     ?_005                                   ; 048B _ EB, 65

?_004:  mov     eax, dword [ebp+10H]                    ; 048D _ 8B. 45, 10
        movzx   eax, byte [eax]                         ; 0490 _ 0F B6. 00
        shr     al, 2                                   ; 0493 _ C0. E8, 02
        movzx   eax, al                                 ; 0496 _ 0F B6. C0
        sub     esp, 8                                  ; 0499 _ 83. EC, 08
        push    eax                                     ; 049C _ 50
        push    969                                     ; 049D _ 68, 000003C9
        call    io_out8                                 ; 04A2 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 04A7 _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 04AA _ 8B. 45, 10
        add     eax, 1                                  ; 04AD _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 04B0 _ 0F B6. 00
        shr     al, 2                                   ; 04B3 _ C0. E8, 02
        movzx   eax, al                                 ; 04B6 _ 0F B6. C0
        sub     esp, 8                                  ; 04B9 _ 83. EC, 08
        push    eax                                     ; 04BC _ 50
        push    969                                     ; 04BD _ 68, 000003C9
        call    io_out8                                 ; 04C2 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 04C7 _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 04CA _ 8B. 45, 10
        add     eax, 2                                  ; 04CD _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 04D0 _ 0F B6. 00
        shr     al, 2                                   ; 04D3 _ C0. E8, 02
        movzx   eax, al                                 ; 04D6 _ 0F B6. C0
        sub     esp, 8                                  ; 04D9 _ 83. EC, 08
        push    eax                                     ; 04DC _ 50
        push    969                                     ; 04DD _ 68, 000003C9
        call    io_out8                                 ; 04E2 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 04E7 _ 83. C4, 10
        add     dword [ebp+10H], 3                      ; 04EA _ 83. 45, 10, 03
        add     dword [ebp-10H], 1                      ; 04EE _ 83. 45, F0, 01
?_005:  mov     eax, dword [ebp-10H]                    ; 04F2 _ 8B. 45, F0
        cmp     eax, dword [ebp+0CH]                    ; 04F5 _ 3B. 45, 0C
        jle     ?_004                                   ; 04F8 _ 7E, 93
        sub     esp, 12                                 ; 04FA _ 83. EC, 0C
        push    dword [ebp-0CH]                         ; 04FD _ FF. 75, F4
        call    io_store_eflags                         ; 0500 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0505 _ 83. C4, 10
        nop                                             ; 0508 _ 90
        leave                                           ; 0509 _ C9
        ret                                             ; 050A _ C3
; set_palette End of function

boxfill8:; Function begin
        push    ebp                                     ; 050B _ 55
        mov     ebp, esp                                ; 050C _ 89. E5
        sub     esp, 20                                 ; 050E _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 0511 _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 0514 _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 0517 _ 8B. 45, 18
        mov     dword [ebp-4H], eax                     ; 051A _ 89. 45, FC
        jmp     ?_009                                   ; 051D _ EB, 33

?_006:  mov     eax, dword [ebp+14H]                    ; 051F _ 8B. 45, 14
        mov     dword [ebp-8H], eax                     ; 0522 _ 89. 45, F8
        jmp     ?_008                                   ; 0525 _ EB, 1F

?_007:  mov     eax, dword [ebp-4H]                     ; 0527 _ 8B. 45, FC
        imul    eax, dword [ebp+0CH]                    ; 052A _ 0F AF. 45, 0C
        mov     edx, eax                                ; 052E _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0530 _ 8B. 45, F8
        add     eax, edx                                ; 0533 _ 01. D0
        mov     edx, eax                                ; 0535 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0537 _ 8B. 45, 08
        add     edx, eax                                ; 053A _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 053C _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0540 _ 88. 02
        add     dword [ebp-8H], 1                       ; 0542 _ 83. 45, F8, 01
?_008:  mov     eax, dword [ebp-8H]                     ; 0546 _ 8B. 45, F8
        cmp     eax, dword [ebp+1CH]                    ; 0549 _ 3B. 45, 1C
        jle     ?_007                                   ; 054C _ 7E, D9
        add     dword [ebp-4H], 1                       ; 054E _ 83. 45, FC, 01
?_009:  mov     eax, dword [ebp-4H]                     ; 0552 _ 8B. 45, FC
        cmp     eax, dword [ebp+20H]                    ; 0555 _ 3B. 45, 20
        jle     ?_006                                   ; 0558 _ 7E, C5
        nop                                             ; 055A _ 90
        leave                                           ; 055B _ C9
        ret                                             ; 055C _ C3
; boxfill8 End of function

showString:; Function begin
        push    ebp                                     ; 055D _ 55
        mov     ebp, esp                                ; 055E _ 89. E5
        sub     esp, 24                                 ; 0560 _ 83. EC, 18
        mov     eax, dword [ebp+18H]                    ; 0563 _ 8B. 45, 18
        mov     byte [ebp-0CH], al                      ; 0566 _ 88. 45, F4
        jmp     ?_011                                   ; 0569 _ EB, 37

?_010:  mov     eax, dword [ebp+1CH]                    ; 056B _ 8B. 45, 1C
        movzx   eax, byte [eax]                         ; 056E _ 0F B6. 00
        movzx   eax, al                                 ; 0571 _ 0F B6. C0
        shl     eax, 4                                  ; 0574 _ C1. E0, 04
        lea     edx, [systemFont+eax]                   ; 0577 _ 8D. 90, 00000000(d)
        movsx   eax, byte [ebp-0CH]                     ; 057D _ 0F BE. 45, F4
        sub     esp, 8                                  ; 0581 _ 83. EC, 08
        push    edx                                     ; 0584 _ 52
        push    eax                                     ; 0585 _ 50
        push    dword [ebp+14H]                         ; 0586 _ FF. 75, 14
        push    dword [ebp+10H]                         ; 0589 _ FF. 75, 10
        push    dword [ebp+0CH]                         ; 058C _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 058F _ FF. 75, 08
        call    showChar8                               ; 0592 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0597 _ 83. C4, 20
        add     dword [ebp+1CH], 1                      ; 059A _ 83. 45, 1C, 01
        add     dword [ebp+10H], 8                      ; 059E _ 83. 45, 10, 08
?_011:  mov     eax, dword [ebp+1CH]                    ; 05A2 _ 8B. 45, 1C
        movzx   eax, byte [eax]                         ; 05A5 _ 0F B6. 00
        test    al, al                                  ; 05A8 _ 84. C0
        jnz     ?_010                                   ; 05AA _ 75, BF
        nop                                             ; 05AC _ 90
        leave                                           ; 05AD _ C9
        ret                                             ; 05AE _ C3
; showString End of function

showChar8:; Function begin
        push    ebp                                     ; 05AF _ 55
        mov     ebp, esp                                ; 05B0 _ 89. E5
        sub     esp, 20                                 ; 05B2 _ 83. EC, 14
        mov     eax, dword [ebp+18H]                    ; 05B5 _ 8B. 45, 18
        mov     byte [ebp-14H], al                      ; 05B8 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 05BB _ C7. 45, FC, 00000000
        jmp     ?_021                                   ; 05C2 _ E9, 0000016C

?_012:  mov     edx, dword [ebp-4H]                     ; 05C7 _ 8B. 55, FC
        mov     eax, dword [ebp+1CH]                    ; 05CA _ 8B. 45, 1C
        add     eax, edx                                ; 05CD _ 01. D0
        movzx   eax, byte [eax]                         ; 05CF _ 0F B6. 00
        mov     byte [ebp-5H], al                       ; 05D2 _ 88. 45, FB
        cmp     byte [ebp-5H], 0                        ; 05D5 _ 80. 7D, FB, 00
        jns     ?_013                                   ; 05D9 _ 79, 20
        mov     edx, dword [ebp+14H]                    ; 05DB _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 05DE _ 8B. 45, FC
        add     eax, edx                                ; 05E1 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 05E3 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 05E7 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 05E9 _ 8B. 45, 10
        add     eax, edx                                ; 05EC _ 01. D0
        mov     edx, eax                                ; 05EE _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 05F0 _ 8B. 45, 08
        add     edx, eax                                ; 05F3 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 05F5 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 05F9 _ 88. 02
?_013:  movsx   eax, byte [ebp-5H]                      ; 05FB _ 0F BE. 45, FB
        and     eax, 40H                                ; 05FF _ 83. E0, 40
        test    eax, eax                                ; 0602 _ 85. C0
        jz      ?_014                                   ; 0604 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 0606 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0609 _ 8B. 45, FC
        add     eax, edx                                ; 060C _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 060E _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0612 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0614 _ 8B. 45, 10
        add     eax, edx                                ; 0617 _ 01. D0
        lea     edx, [eax+1H]                           ; 0619 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 061C _ 8B. 45, 08
        add     edx, eax                                ; 061F _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0621 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0625 _ 88. 02
?_014:  movsx   eax, byte [ebp-5H]                      ; 0627 _ 0F BE. 45, FB
        and     eax, 20H                                ; 062B _ 83. E0, 20
        test    eax, eax                                ; 062E _ 85. C0
        jz      ?_015                                   ; 0630 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 0632 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0635 _ 8B. 45, FC
        add     eax, edx                                ; 0638 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 063A _ 0F AF. 45, 0C
        mov     edx, eax                                ; 063E _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0640 _ 8B. 45, 10
        add     eax, edx                                ; 0643 _ 01. D0
        lea     edx, [eax+2H]                           ; 0645 _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 0648 _ 8B. 45, 08
        add     edx, eax                                ; 064B _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 064D _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0651 _ 88. 02
?_015:  movsx   eax, byte [ebp-5H]                      ; 0653 _ 0F BE. 45, FB
        and     eax, 10H                                ; 0657 _ 83. E0, 10
        test    eax, eax                                ; 065A _ 85. C0
        jz      ?_016                                   ; 065C _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 065E _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0661 _ 8B. 45, FC
        add     eax, edx                                ; 0664 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0666 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 066A _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 066C _ 8B. 45, 10
        add     eax, edx                                ; 066F _ 01. D0
        lea     edx, [eax+3H]                           ; 0671 _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 0674 _ 8B. 45, 08
        add     edx, eax                                ; 0677 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0679 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 067D _ 88. 02
?_016:  movsx   eax, byte [ebp-5H]                      ; 067F _ 0F BE. 45, FB
        and     eax, 08H                                ; 0683 _ 83. E0, 08
        test    eax, eax                                ; 0686 _ 85. C0
        jz      ?_017                                   ; 0688 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 068A _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 068D _ 8B. 45, FC
        add     eax, edx                                ; 0690 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0692 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0696 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0698 _ 8B. 45, 10
        add     eax, edx                                ; 069B _ 01. D0
        lea     edx, [eax+4H]                           ; 069D _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 06A0 _ 8B. 45, 08
        add     edx, eax                                ; 06A3 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 06A5 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 06A9 _ 88. 02
?_017:  movsx   eax, byte [ebp-5H]                      ; 06AB _ 0F BE. 45, FB
        and     eax, 04H                                ; 06AF _ 83. E0, 04
        test    eax, eax                                ; 06B2 _ 85. C0
        jz      ?_018                                   ; 06B4 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 06B6 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 06B9 _ 8B. 45, FC
        add     eax, edx                                ; 06BC _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 06BE _ 0F AF. 45, 0C
        mov     edx, eax                                ; 06C2 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 06C4 _ 8B. 45, 10
        add     eax, edx                                ; 06C7 _ 01. D0
        lea     edx, [eax+5H]                           ; 06C9 _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 06CC _ 8B. 45, 08
        add     edx, eax                                ; 06CF _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 06D1 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 06D5 _ 88. 02
?_018:  movsx   eax, byte [ebp-5H]                      ; 06D7 _ 0F BE. 45, FB
        and     eax, 02H                                ; 06DB _ 83. E0, 02
        test    eax, eax                                ; 06DE _ 85. C0
        jz      ?_019                                   ; 06E0 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 06E2 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 06E5 _ 8B. 45, FC
        add     eax, edx                                ; 06E8 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 06EA _ 0F AF. 45, 0C
        mov     edx, eax                                ; 06EE _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 06F0 _ 8B. 45, 10
        add     eax, edx                                ; 06F3 _ 01. D0
        lea     edx, [eax+6H]                           ; 06F5 _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 06F8 _ 8B. 45, 08
        add     edx, eax                                ; 06FB _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 06FD _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0701 _ 88. 02
?_019:  movsx   eax, byte [ebp-5H]                      ; 0703 _ 0F BE. 45, FB
        and     eax, 01H                                ; 0707 _ 83. E0, 01
        test    eax, eax                                ; 070A _ 85. C0
        jz      ?_020                                   ; 070C _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 070E _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0711 _ 8B. 45, FC
        add     eax, edx                                ; 0714 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0716 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 071A _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 071C _ 8B. 45, 10
        add     eax, edx                                ; 071F _ 01. D0
        lea     edx, [eax+7H]                           ; 0721 _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 0724 _ 8B. 45, 08
        add     edx, eax                                ; 0727 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0729 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 072D _ 88. 02
?_020:  add     dword [ebp-4H], 1                       ; 072F _ 83. 45, FC, 01
?_021:  cmp     dword [ebp-4H], 15                      ; 0733 _ 83. 7D, FC, 0F
        jle     ?_012                                   ; 0737 _ 0F 8E, FFFFFE8A
        nop                                             ; 073D _ 90
        leave                                           ; 073E _ C9
        ret                                             ; 073F _ C3
; showChar8 End of function

init_mouse_cursor:; Function begin
        push    ebp                                     ; 0740 _ 55
        mov     ebp, esp                                ; 0741 _ 89. E5
        sub     esp, 20                                 ; 0743 _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 0746 _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 0749 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 074C _ C7. 45, FC, 00000000
        jmp     ?_028                                   ; 0753 _ E9, 000000B5

?_022:  mov     dword [ebp-8H], 0                       ; 0758 _ C7. 45, F8, 00000000
        jmp     ?_027                                   ; 075F _ E9, 0000009B

?_023:  mov     eax, dword [ebp-4H]                     ; 0764 _ 8B. 45, FC
        shl     eax, 4                                  ; 0767 _ C1. E0, 04
        mov     edx, eax                                ; 076A _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 076C _ 8B. 45, F8
        add     eax, edx                                ; 076F _ 01. D0
        add     eax, cursor.1631                        ; 0771 _ 05, 00000060(d)
        movzx   eax, byte [eax]                         ; 0776 _ 0F B6. 00
        cmp     al, 42                                  ; 0779 _ 3C, 2A
        jnz     ?_024                                   ; 077B _ 75, 19
        mov     eax, dword [ebp-4H]                     ; 077D _ 8B. 45, FC
        shl     eax, 4                                  ; 0780 _ C1. E0, 04
        mov     edx, eax                                ; 0783 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0785 _ 8B. 45, F8
        add     eax, edx                                ; 0788 _ 01. D0
        mov     edx, eax                                ; 078A _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 078C _ 8B. 45, 08
        add     eax, edx                                ; 078F _ 01. D0
        mov     byte [eax], 0                           ; 0791 _ C6. 00, 00
        jmp     ?_026                                   ; 0794 _ EB, 65

?_024:  mov     eax, dword [ebp-4H]                     ; 0796 _ 8B. 45, FC
        shl     eax, 4                                  ; 0799 _ C1. E0, 04
        mov     edx, eax                                ; 079C _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 079E _ 8B. 45, F8
        add     eax, edx                                ; 07A1 _ 01. D0
        add     eax, cursor.1631                        ; 07A3 _ 05, 00000060(d)
        movzx   eax, byte [eax]                         ; 07A8 _ 0F B6. 00
        cmp     al, 79                                  ; 07AB _ 3C, 4F
        jnz     ?_025                                   ; 07AD _ 75, 19
        mov     eax, dword [ebp-4H]                     ; 07AF _ 8B. 45, FC
        shl     eax, 4                                  ; 07B2 _ C1. E0, 04
        mov     edx, eax                                ; 07B5 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 07B7 _ 8B. 45, F8
        add     eax, edx                                ; 07BA _ 01. D0
        mov     edx, eax                                ; 07BC _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 07BE _ 8B. 45, 08
        add     eax, edx                                ; 07C1 _ 01. D0
        mov     byte [eax], 7                           ; 07C3 _ C6. 00, 07
        jmp     ?_026                                   ; 07C6 _ EB, 33

?_025:  mov     eax, dword [ebp-4H]                     ; 07C8 _ 8B. 45, FC
        shl     eax, 4                                  ; 07CB _ C1. E0, 04
        mov     edx, eax                                ; 07CE _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 07D0 _ 8B. 45, F8
        add     eax, edx                                ; 07D3 _ 01. D0
        add     eax, cursor.1631                        ; 07D5 _ 05, 00000060(d)
        movzx   eax, byte [eax]                         ; 07DA _ 0F B6. 00
        cmp     al, 46                                  ; 07DD _ 3C, 2E
        jnz     ?_026                                   ; 07DF _ 75, 1A
        mov     eax, dword [ebp-4H]                     ; 07E1 _ 8B. 45, FC
        shl     eax, 4                                  ; 07E4 _ C1. E0, 04
        mov     edx, eax                                ; 07E7 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 07E9 _ 8B. 45, F8
        add     eax, edx                                ; 07EC _ 01. D0
        mov     edx, eax                                ; 07EE _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 07F0 _ 8B. 45, 08
        add     edx, eax                                ; 07F3 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 07F5 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 07F9 _ 88. 02
?_026:  add     dword [ebp-8H], 1                       ; 07FB _ 83. 45, F8, 01
?_027:  cmp     dword [ebp-8H], 15                      ; 07FF _ 83. 7D, F8, 0F
        jle     ?_023                                   ; 0803 _ 0F 8E, FFFFFF5B
        add     dword [ebp-4H], 1                       ; 0809 _ 83. 45, FC, 01
?_028:  cmp     dword [ebp-4H], 15                      ; 080D _ 83. 7D, FC, 0F
        jle     ?_022                                   ; 0811 _ 0F 8E, FFFFFF41
        nop                                             ; 0817 _ 90
        leave                                           ; 0818 _ C9
        ret                                             ; 0819 _ C3
; init_mouse_cursor End of function

putblock:; Function begin
        push    ebp                                     ; 081A _ 55
        mov     ebp, esp                                ; 081B _ 89. E5
        push    ebx                                     ; 081D _ 53
        sub     esp, 16                                 ; 081E _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 0821 _ C7. 45, F8, 00000000
        jmp     ?_032                                   ; 0828 _ EB, 50

?_029:  mov     dword [ebp-0CH], 0                      ; 082A _ C7. 45, F4, 00000000
        jmp     ?_031                                   ; 0831 _ EB, 3B

?_030:  mov     eax, dword [ebp-8H]                     ; 0833 _ 8B. 45, F8
        imul    eax, dword [ebp+24H]                    ; 0836 _ 0F AF. 45, 24
        mov     edx, eax                                ; 083A _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 083C _ 8B. 45, F4
        add     eax, edx                                ; 083F _ 01. D0
        mov     edx, eax                                ; 0841 _ 89. C2
        mov     eax, dword [ebp+20H]                    ; 0843 _ 8B. 45, 20
        add     eax, edx                                ; 0846 _ 01. D0
        mov     ecx, dword [ebp+1CH]                    ; 0848 _ 8B. 4D, 1C
        mov     edx, dword [ebp-8H]                     ; 084B _ 8B. 55, F8
        add     edx, ecx                                ; 084E _ 01. CA
        imul    edx, dword [ebp+0CH]                    ; 0850 _ 0F AF. 55, 0C
        mov     ebx, dword [ebp+18H]                    ; 0854 _ 8B. 5D, 18
        mov     ecx, dword [ebp-0CH]                    ; 0857 _ 8B. 4D, F4
        add     ecx, ebx                                ; 085A _ 01. D9
        add     edx, ecx                                ; 085C _ 01. CA
        mov     ecx, edx                                ; 085E _ 89. D1
        mov     edx, dword [ebp+8H]                     ; 0860 _ 8B. 55, 08
        add     edx, ecx                                ; 0863 _ 01. CA
        movzx   eax, byte [eax]                         ; 0865 _ 0F B6. 00
        mov     byte [edx], al                          ; 0868 _ 88. 02
        add     dword [ebp-0CH], 1                      ; 086A _ 83. 45, F4, 01
?_031:  mov     eax, dword [ebp-0CH]                    ; 086E _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 0871 _ 3B. 45, 10
        jl      ?_030                                   ; 0874 _ 7C, BD
        add     dword [ebp-8H], 1                       ; 0876 _ 83. 45, F8, 01
?_032:  mov     eax, dword [ebp-8H]                     ; 087A _ 8B. 45, F8
        cmp     eax, dword [ebp+14H]                    ; 087D _ 3B. 45, 14
        jl      ?_029                                   ; 0880 _ 7C, A8
        nop                                             ; 0882 _ 90
        add     esp, 16                                 ; 0883 _ 83. C4, 10
        pop     ebx                                     ; 0886 _ 5B
        pop     ebp                                     ; 0887 _ 5D
        ret                                             ; 0888 _ C3
; putblock End of function

intHandlerFromC:; Function begin
        push    ebp                                     ; 0889 _ 55
        mov     ebp, esp                                ; 088A _ 89. E5
        sub     esp, 24                                 ; 088C _ 83. EC, 18
        mov     eax, dword [bootInfo]                   ; 088F _ A1, 00000100(d)
        mov     dword [ebp-14H], eax                    ; 0894 _ 89. 45, EC
        movzx   eax, word [?_063]                       ; 0897 _ 0F B7. 05, 00000104(d)
        cwde                                            ; 089E _ 98
        mov     dword [ebp-10H], eax                    ; 089F _ 89. 45, F0
        movzx   eax, word [?_064]                       ; 08A2 _ 0F B7. 05, 00000106(d)
        cwde                                            ; 08A9 _ 98
        mov     dword [ebp-0CH], eax                    ; 08AA _ 89. 45, F4
        sub     esp, 8                                  ; 08AD _ 83. EC, 08
        push    33                                      ; 08B0 _ 6A, 21
        push    32                                      ; 08B2 _ 6A, 20
        call    io_out8                                 ; 08B4 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 08B9 _ 83. C4, 10
        mov     byte [ebp-15H], 0                       ; 08BC _ C6. 45, EB, 00
        sub     esp, 12                                 ; 08C0 _ 83. EC, 0C
        push    96                                      ; 08C3 _ 6A, 60
        call    io_in8                                  ; 08C5 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 08CA _ 83. C4, 10
        mov     byte [ebp-15H], al                      ; 08CD _ 88. 45, EB
        movzx   eax, byte [ebp-15H]                     ; 08D0 _ 0F B6. 45, EB
        sub     esp, 8                                  ; 08D4 _ 83. EC, 08
        push    eax                                     ; 08D7 _ 50
        push    keyinfo                                 ; 08D8 _ 68, 00000120(d)
        call    fifo8_put                               ; 08DD _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 08E2 _ 83. C4, 10
        nop                                             ; 08E5 _ 90
        leave                                           ; 08E6 _ C9
        ret                                             ; 08E7 _ C3
; intHandlerFromC End of function

charToHexVal:; Function begin
        push    ebp                                     ; 08E8 _ 55
        mov     ebp, esp                                ; 08E9 _ 89. E5
        sub     esp, 4                                  ; 08EB _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 08EE _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 08F1 _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 08F4 _ 80. 7D, FC, 09
        jle     ?_033                                   ; 08F8 _ 7E, 09
        movzx   eax, byte [ebp-4H]                      ; 08FA _ 0F B6. 45, FC
        add     eax, 55                                 ; 08FE _ 83. C0, 37
        jmp     ?_034                                   ; 0901 _ EB, 07

?_033:  movzx   eax, byte [ebp-4H]                      ; 0903 _ 0F B6. 45, FC
        add     eax, 48                                 ; 0907 _ 83. C0, 30
?_034:  leave                                           ; 090A _ C9
        ret                                             ; 090B _ C3
; charToHexVal End of function

charToHexStr:; Function begin
        push    ebp                                     ; 090C _ 55
        mov     ebp, esp                                ; 090D _ 89. E5
        sub     esp, 20                                 ; 090F _ 83. EC, 14
        mov     eax, dword [ebp+8H]                     ; 0912 _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 0915 _ 88. 45, EC
        movzx   eax, byte [ebp-14H]                     ; 0918 _ 0F B6. 45, EC
        and     eax, 0FH                                ; 091C _ 83. E0, 0F
        mov     byte [ebp-1H], al                       ; 091F _ 88. 45, FF
        movsx   eax, byte [ebp-1H]                      ; 0922 _ 0F BE. 45, FF
        push    eax                                     ; 0926 _ 50
        call    charToHexVal                            ; 0927 _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 092C _ 83. C4, 04
        mov     byte [?_062], al                        ; 092F _ A2, 00000003(d)
        shr     byte [ebp-14H], 4                       ; 0934 _ C0. 6D, EC, 04
        movzx   eax, byte [ebp-14H]                     ; 0938 _ 0F B6. 45, EC
        movsx   eax, al                                 ; 093C _ 0F BE. C0
        push    eax                                     ; 093F _ 50
        call    charToHexVal                            ; 0940 _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 0945 _ 83. C4, 04
        mov     byte [?_061], al                        ; 0948 _ A2, 00000002(d)
        mov     eax, keyval                             ; 094D _ B8, 00000000(d)
        leave                                           ; 0952 _ C9
        ret                                             ; 0953 _ C3
; charToHexStr End of function

intToHexStr:; Function begin
        push    ebp                                     ; 0954 _ 55
        mov     ebp, esp                                ; 0955 _ 89. E5
        sub     esp, 20                                 ; 0957 _ 83. EC, 14
        mov     eax, dword [ebp+8H]                     ; 095A _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 095D _ 88. 45, EC
        mov     byte [str.1678], 48                     ; 0960 _ C6. 05, 000001FC(d), 30
        mov     byte [?_065], 88                        ; 0967 _ C6. 05, 000001FD(d), 58
        mov     byte [?_066], 0                         ; 096E _ C6. 05, 00000206(d), 00
        mov     dword [ebp-8H], 2                       ; 0975 _ C7. 45, F8, 00000002
        mov     dword [ebp-0CH], 7                      ; 097C _ C7. 45, F4, 00000007
        jmp     ?_038                                   ; 0983 _ EB, 46

?_035:  movzx   eax, byte [ebp-14H]                     ; 0985 _ 0F B6. 45, EC
        and     eax, 0FH                                ; 0989 _ 83. E0, 0F
        mov     dword [ebp-4H], eax                     ; 098C _ 89. 45, FC
        cmp     dword [ebp-4H], 9                       ; 098F _ 83. 7D, FC, 09
        jg      ?_036                                   ; 0993 _ 7F, 18
        mov     eax, dword [ebp-4H]                     ; 0995 _ 8B. 45, FC
        lea     ecx, [eax+30H]                          ; 0998 _ 8D. 48, 30
        mov     edx, dword [ebp-8H]                     ; 099B _ 8B. 55, F8
        mov     eax, dword [ebp-0CH]                    ; 099E _ 8B. 45, F4
        add     eax, edx                                ; 09A1 _ 01. D0
        mov     edx, ecx                                ; 09A3 _ 89. CA
        mov     byte [str.1678+eax], dl                 ; 09A5 _ 88. 90, 000001FC(d)
        jmp     ?_037                                   ; 09AB _ EB, 16

?_036:  mov     eax, dword [ebp-4H]                     ; 09AD _ 8B. 45, FC
        lea     ecx, [eax+37H]                          ; 09B0 _ 8D. 48, 37
        mov     edx, dword [ebp-8H]                     ; 09B3 _ 8B. 55, F8
        mov     eax, dword [ebp-0CH]                    ; 09B6 _ 8B. 45, F4
        add     eax, edx                                ; 09B9 _ 01. D0
        mov     edx, ecx                                ; 09BB _ 89. CA
        mov     byte [str.1678+eax], dl                 ; 09BD _ 88. 90, 000001FC(d)
?_037:  shr     byte [ebp-14H], 4                       ; 09C3 _ C0. 6D, EC, 04
        sub     dword [ebp-0CH], 1                      ; 09C7 _ 83. 6D, F4, 01
?_038:  cmp     dword [ebp-0CH], 0                      ; 09CB _ 83. 7D, F4, 00
        jns     ?_035                                   ; 09CF _ 79, B4
        mov     eax, str.1678                           ; 09D1 _ B8, 000001FC(d)
        leave                                           ; 09D6 _ C9
        ret                                             ; 09D7 _ C3
; intToHexStr End of function

wait_KBC_sendReady:; Function begin
        push    ebp                                     ; 09D8 _ 55
        mov     ebp, esp                                ; 09D9 _ 89. E5
        sub     esp, 8                                  ; 09DB _ 83. EC, 08
?_039:  sub     esp, 12                                 ; 09DE _ 83. EC, 0C
        push    100                                     ; 09E1 _ 6A, 64
        call    io_in8                                  ; 09E3 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 09E8 _ 83. C4, 10
        and     eax, 02H                                ; 09EB _ 83. E0, 02
        test    eax, eax                                ; 09EE _ 85. C0
        jz      ?_040                                   ; 09F0 _ 74, 02
        jmp     ?_039                                   ; 09F2 _ EB, EA
; wait_KBC_sendReady End of function

?_040:  ; Local function
        nop                                             ; 09F4 _ 90
        nop                                             ; 09F5 _ 90
        leave                                           ; 09F6 _ C9
        ret                                             ; 09F7 _ C3

init_keyboard:; Function begin
        push    ebp                                     ; 09F8 _ 55
        mov     ebp, esp                                ; 09F9 _ 89. E5
        sub     esp, 8                                  ; 09FB _ 83. EC, 08
        call    wait_KBC_sendReady                      ; 09FE _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0A03 _ 83. EC, 08
        push    96                                      ; 0A06 _ 6A, 60
        push    100                                     ; 0A08 _ 6A, 64
        call    io_out8                                 ; 0A0A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0A0F _ 83. C4, 10
        call    wait_KBC_sendReady                      ; 0A12 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0A17 _ 83. EC, 08
        push    71                                      ; 0A1A _ 6A, 47
        push    96                                      ; 0A1C _ 6A, 60
        call    io_out8                                 ; 0A1E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0A23 _ 83. C4, 10
        nop                                             ; 0A26 _ 90
        leave                                           ; 0A27 _ C9
        ret                                             ; 0A28 _ C3
; init_keyboard End of function

enable_mouse:; Function begin
        push    ebp                                     ; 0A29 _ 55
        mov     ebp, esp                                ; 0A2A _ 89. E5
        sub     esp, 8                                  ; 0A2C _ 83. EC, 08
        call    wait_KBC_sendReady                      ; 0A2F _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0A34 _ 83. EC, 08
        push    212                                     ; 0A37 _ 68, 000000D4
        push    100                                     ; 0A3C _ 6A, 64
        call    io_out8                                 ; 0A3E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0A43 _ 83. C4, 10
        call    wait_KBC_sendReady                      ; 0A46 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0A4B _ 83. EC, 08
        push    244                                     ; 0A4E _ 68, 000000F4
        push    96                                      ; 0A53 _ 6A, 60
        call    io_out8                                 ; 0A55 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0A5A _ 83. C4, 10
        nop                                             ; 0A5D _ 90
        leave                                           ; 0A5E _ C9
        ret                                             ; 0A5F _ C3
; enable_mouse End of function

intHandlerFromMouse:; Function begin
        push    ebp                                     ; 0A60 _ 55
        mov     ebp, esp                                ; 0A61 _ 89. E5
        sub     esp, 24                                 ; 0A63 _ 83. EC, 18
        sub     esp, 8                                  ; 0A66 _ 83. EC, 08
        push    32                                      ; 0A69 _ 6A, 20
        push    160                                     ; 0A6B _ 68, 000000A0
        call    io_out8                                 ; 0A70 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0A75 _ 83. C4, 10
        sub     esp, 8                                  ; 0A78 _ 83. EC, 08
        push    32                                      ; 0A7B _ 6A, 20
        push    32                                      ; 0A7D _ 6A, 20
        call    io_out8                                 ; 0A7F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0A84 _ 83. C4, 10
        sub     esp, 12                                 ; 0A87 _ 83. EC, 0C
        push    96                                      ; 0A8A _ 6A, 60
        call    io_in8                                  ; 0A8C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0A91 _ 83. C4, 10
        mov     byte [ebp-9H], al                       ; 0A94 _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 0A97 _ 0F B6. 45, F7
        sub     esp, 8                                  ; 0A9B _ 83. EC, 08
        push    eax                                     ; 0A9E _ 50
        push    mouseinfo                               ; 0A9F _ 68, 00000108(d)
        call    fifo8_put                               ; 0AA4 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0AA9 _ 83. C4, 10
        nop                                             ; 0AAC _ 90
        leave                                           ; 0AAD _ C9
        ret                                             ; 0AAE _ C3
; intHandlerFromMouse End of function

fifo8_init:; Function begin
        push    ebp                                     ; 0AAF _ 55
        mov     ebp, esp                                ; 0AB0 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 0AB2 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 0AB5 _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 0AB8 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 0ABB _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 0ABE _ 8B. 55, 10
        mov     dword [eax], edx                        ; 0AC1 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 0AC3 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 0AC6 _ 8B. 55, 0C
        mov     dword [eax+10H], edx                    ; 0AC9 _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 0ACC _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 0ACF _ C7. 40, 14, 00000000
        mov     eax, dword [ebp+8H]                     ; 0AD6 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 0AD9 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 0AE0 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 0AE3 _ C7. 40, 08, 00000000
        nop                                             ; 0AEA _ 90
        pop     ebp                                     ; 0AEB _ 5D
        ret                                             ; 0AEC _ C3
; fifo8_init End of function

fifo8_put:; Function begin
        push    ebp                                     ; 0AED _ 55
        mov     ebp, esp                                ; 0AEE _ 89. E5
        sub     esp, 4                                  ; 0AF0 _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 0AF3 _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 0AF6 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0AF9 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0AFC _ 8B. 40, 10
        test    eax, eax                                ; 0AFF _ 85. C0
        jnz     ?_041                                   ; 0B01 _ 75, 18
        mov     eax, dword [ebp+8H]                     ; 0B03 _ 8B. 45, 08
        mov     eax, dword [eax+14H]                    ; 0B06 _ 8B. 40, 14
        or      eax, 01H                                ; 0B09 _ 83. C8, 01
        mov     edx, eax                                ; 0B0C _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0B0E _ 8B. 45, 08
        mov     dword [eax+14H], edx                    ; 0B11 _ 89. 50, 14
        mov     eax, 4294967295                         ; 0B14 _ B8, FFFFFFFF
        jmp     ?_043                                   ; 0B19 _ EB, 50

?_041:  mov     eax, dword [ebp+8H]                     ; 0B1B _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 0B1E _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 0B20 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0B23 _ 8B. 40, 04
        add     edx, eax                                ; 0B26 _ 01. C2
        movzx   eax, byte [ebp-4H]                      ; 0B28 _ 0F B6. 45, FC
        mov     byte [edx], al                          ; 0B2C _ 88. 02
        mov     eax, dword [ebp+8H]                     ; 0B2E _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0B31 _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 0B34 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0B37 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 0B3A _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0B3D _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 0B40 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0B43 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0B46 _ 8B. 40, 0C
        cmp     edx, eax                                ; 0B49 _ 39. C2
        jnz     ?_042                                   ; 0B4B _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 0B4D _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 0B50 _ C7. 40, 04, 00000000
?_042:  mov     eax, dword [ebp+8H]                     ; 0B57 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0B5A _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 0B5D _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 0B60 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 0B63 _ 89. 50, 10
        mov     eax, 0                                  ; 0B66 _ B8, 00000000
?_043:  leave                                           ; 0B6B _ C9
        ret                                             ; 0B6C _ C3
; fifo8_put End of function

fifo8_get:; Function begin
        push    ebp                                     ; 0B6D _ 55
        mov     ebp, esp                                ; 0B6E _ 89. E5
        sub     esp, 16                                 ; 0B70 _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 0B73 _ 8B. 45, 08
        mov     edx, dword [eax+10H]                    ; 0B76 _ 8B. 50, 10
        mov     eax, dword [ebp+8H]                     ; 0B79 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0B7C _ 8B. 40, 0C
        cmp     edx, eax                                ; 0B7F _ 39. C2
        jnz     ?_044                                   ; 0B81 _ 75, 07
        mov     eax, 4294967295                         ; 0B83 _ B8, FFFFFFFF
        jmp     ?_046                                   ; 0B88 _ EB, 51

?_044:  mov     eax, dword [ebp+8H]                     ; 0B8A _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 0B8D _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 0B8F _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0B92 _ 8B. 40, 08
        add     eax, edx                                ; 0B95 _ 01. D0
        movzx   eax, byte [eax]                         ; 0B97 _ 0F B6. 00
        movzx   eax, al                                 ; 0B9A _ 0F B6. C0
        mov     dword [ebp-4H], eax                     ; 0B9D _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0BA0 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0BA3 _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 0BA6 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0BA9 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0BAC _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 0BAF _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 0BB2 _ 8B. 50, 08
        mov     eax, dword [ebp+8H]                     ; 0BB5 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0BB8 _ 8B. 40, 0C
        cmp     edx, eax                                ; 0BBB _ 39. C2
        jnz     ?_045                                   ; 0BBD _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 0BBF _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 0BC2 _ C7. 40, 08, 00000000
?_045:  mov     eax, dword [ebp+8H]                     ; 0BC9 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0BCC _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 0BCF _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0BD2 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 0BD5 _ 89. 50, 10
        mov     eax, dword [ebp-4H]                     ; 0BD8 _ 8B. 45, FC
?_046:  leave                                           ; 0BDB _ C9
        ret                                             ; 0BDC _ C3
; fifo8_get End of function

fifo8_status:; Function begin
        push    ebp                                     ; 0BDD _ 55
        mov     ebp, esp                                ; 0BDE _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 0BE0 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 0BE3 _ 8B. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 0BE6 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0BE9 _ 8B. 40, 10
        sub     edx, eax                                ; 0BEC _ 29. C2
        mov     eax, edx                                ; 0BEE _ 89. D0
        pop     ebp                                     ; 0BF0 _ 5D
        ret                                             ; 0BF1 _ C3
; fifo8_status End of function

mouse_decode:; Function begin
        push    ebp                                     ; 0BF2 _ 55
        mov     ebp, esp                                ; 0BF3 _ 89. E5
        sub     esp, 4                                  ; 0BF5 _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 0BF8 _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 0BFB _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0BFE _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 0C01 _ 0F B6. 40, 03
        test    al, al                                  ; 0C05 _ 84. C0
        jnz     ?_048                                   ; 0C07 _ 75, 17
        cmp     byte [ebp-4H], -6                       ; 0C09 _ 80. 7D, FC, FA
        jnz     ?_047                                   ; 0C0D _ 75, 07
        mov     eax, dword [ebp+8H]                     ; 0C0F _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 0C12 _ C6. 40, 03, 01
?_047:  mov     eax, 0                                  ; 0C16 _ B8, 00000000
        jmp     ?_055                                   ; 0C1B _ E9, 0000010F

?_048:  mov     eax, dword [ebp+8H]                     ; 0C20 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 0C23 _ 0F B6. 40, 03
        cmp     al, 1                                   ; 0C27 _ 3C, 01
        jnz     ?_050                                   ; 0C29 _ 75, 28
        movzx   eax, byte [ebp-4H]                      ; 0C2B _ 0F B6. 45, FC
        and     eax, 0C8H                               ; 0C2F _ 25, 000000C8
        cmp     eax, 8                                  ; 0C34 _ 83. F8, 08
        jnz     ?_049                                   ; 0C37 _ 75, 10
        mov     eax, dword [ebp+8H]                     ; 0C39 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 0C3C _ 0F B6. 55, FC
        mov     byte [eax], dl                          ; 0C40 _ 88. 10
        mov     eax, dword [ebp+8H]                     ; 0C42 _ 8B. 45, 08
        mov     byte [eax+3H], 2                        ; 0C45 _ C6. 40, 03, 02
?_049:  mov     eax, 0                                  ; 0C49 _ B8, 00000000
        jmp     ?_055                                   ; 0C4E _ E9, 000000DC

?_050:  mov     eax, dword [ebp+8H]                     ; 0C53 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 0C56 _ 0F B6. 40, 03
        cmp     al, 2                                   ; 0C5A _ 3C, 02
        jnz     ?_051                                   ; 0C5C _ 75, 1B
        mov     eax, dword [ebp+8H]                     ; 0C5E _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 0C61 _ 0F B6. 55, FC
        mov     byte [eax+1H], dl                       ; 0C65 _ 88. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0C68 _ 8B. 45, 08
        mov     byte [eax+3H], 3                        ; 0C6B _ C6. 40, 03, 03
        mov     eax, 0                                  ; 0C6F _ B8, 00000000
        jmp     ?_055                                   ; 0C74 _ E9, 000000B6

?_051:  mov     eax, dword [ebp+8H]                     ; 0C79 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 0C7C _ 0F B6. 40, 03
        cmp     al, 3                                   ; 0C80 _ 3C, 03
        jne     ?_054                                   ; 0C82 _ 0F 85, 000000A2
        mov     eax, dword [ebp+8H]                     ; 0C88 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 0C8B _ 0F B6. 55, FC
        mov     byte [eax+2H], dl                       ; 0C8F _ 88. 50, 02
        mov     eax, dword [ebp+8H]                     ; 0C92 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 0C95 _ C6. 40, 03, 01
        mov     eax, dword [ebp+8H]                     ; 0C99 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 0C9C _ 0F B6. 00
        movzx   eax, al                                 ; 0C9F _ 0F B6. C0
        and     eax, 07H                                ; 0CA2 _ 83. E0, 07
        mov     edx, eax                                ; 0CA5 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0CA7 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 0CAA _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 0CAD _ 8B. 45, 08
        movzx   eax, byte [eax+1H]                      ; 0CB0 _ 0F B6. 40, 01
        movzx   edx, al                                 ; 0CB4 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 0CB7 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 0CBA _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0CBD _ 8B. 45, 08
        movzx   eax, byte [eax+2H]                      ; 0CC0 _ 0F B6. 40, 02
        movzx   edx, al                                 ; 0CC4 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 0CC7 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0CCA _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 0CCD _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 0CD0 _ 0F B6. 00
        movzx   eax, al                                 ; 0CD3 _ 0F B6. C0
        and     eax, 10H                                ; 0CD6 _ 83. E0, 10
        test    eax, eax                                ; 0CD9 _ 85. C0
        jz      ?_052                                   ; 0CDB _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 0CDD _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0CE0 _ 8B. 40, 04
        or      eax, 0FFFFFF00H                         ; 0CE3 _ 0D, FFFFFF00
        mov     edx, eax                                ; 0CE8 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0CEA _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 0CED _ 89. 50, 04
?_052:  mov     eax, dword [ebp+8H]                     ; 0CF0 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 0CF3 _ 0F B6. 00
        movzx   eax, al                                 ; 0CF6 _ 0F B6. C0
        and     eax, 20H                                ; 0CF9 _ 83. E0, 20
        test    eax, eax                                ; 0CFC _ 85. C0
        jz      ?_053                                   ; 0CFE _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 0D00 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0D03 _ 8B. 40, 08
        or      eax, 0FFFFFF00H                         ; 0D06 _ 0D, FFFFFF00
        mov     edx, eax                                ; 0D0B _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0D0D _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0D10 _ 89. 50, 08
?_053:  mov     eax, dword [ebp+8H]                     ; 0D13 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0D16 _ 8B. 40, 08
        neg     eax                                     ; 0D19 _ F7. D8
        mov     edx, eax                                ; 0D1B _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0D1D _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0D20 _ 89. 50, 08
        mov     eax, 1                                  ; 0D23 _ B8, 00000001
        jmp     ?_055                                   ; 0D28 _ EB, 05

?_054:  mov     eax, 4294967295                         ; 0D2A _ B8, FFFFFFFF
?_055:  leave                                           ; 0D2F _ C9
        ret                                             ; 0D30 _ C3
; mouse_decode End of function

computeMousePosition:; Function begin
        push    ebp                                     ; 0D31 _ 55
        mov     ebp, esp                                ; 0D32 _ 89. E5
        sub     esp, 16                                 ; 0D34 _ 83. EC, 10
        movzx   eax, word [?_063]                       ; 0D37 _ 0F B7. 05, 00000104(d)
        cwde                                            ; 0D3E _ 98
        mov     dword [ebp-8H], eax                     ; 0D3F _ 89. 45, F8
        movzx   eax, word [?_064]                       ; 0D42 _ 0F B7. 05, 00000106(d)
        cwde                                            ; 0D49 _ 98
        mov     dword [ebp-4H], eax                     ; 0D4A _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0D4D _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 0D50 _ 8B. 50, 04
        mov     eax, dword [mx]                         ; 0D53 _ A1, 000001F0(d)
        add     eax, edx                                ; 0D58 _ 01. D0
        mov     dword [mx], eax                         ; 0D5A _ A3, 000001F0(d)
        mov     eax, dword [ebp+8H]                     ; 0D5F _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 0D62 _ 8B. 50, 08
        mov     eax, dword [my]                         ; 0D65 _ A1, 000001F4(d)
        add     eax, edx                                ; 0D6A _ 01. D0
        mov     dword [my], eax                         ; 0D6C _ A3, 000001F4(d)
        mov     eax, dword [mx]                         ; 0D71 _ A1, 000001F0(d)
        test    eax, eax                                ; 0D76 _ 85. C0
        jns     ?_056                                   ; 0D78 _ 79, 0A
        mov     dword [mx], 0                           ; 0D7A _ C7. 05, 000001F0(d), 00000000
?_056:  mov     eax, dword [my]                         ; 0D84 _ A1, 000001F4(d)
        test    eax, eax                                ; 0D89 _ 85. C0
        jns     ?_057                                   ; 0D8B _ 79, 0A
        mov     dword [my], 0                           ; 0D8D _ C7. 05, 000001F4(d), 00000000
?_057:  mov     eax, dword [ebp-8H]                     ; 0D97 _ 8B. 45, F8
        lea     edx, [eax-10H]                          ; 0D9A _ 8D. 50, F0
        mov     eax, dword [mx]                         ; 0D9D _ A1, 000001F0(d)
        cmp     edx, eax                                ; 0DA2 _ 39. C2
        jge     ?_058                                   ; 0DA4 _ 7D, 0B
        mov     eax, dword [ebp-8H]                     ; 0DA6 _ 8B. 45, F8
        sub     eax, 16                                 ; 0DA9 _ 83. E8, 10
        mov     dword [mx], eax                         ; 0DAC _ A3, 000001F0(d)
?_058:  mov     eax, dword [ebp-4H]                     ; 0DB1 _ 8B. 45, FC
        lea     edx, [eax-10H]                          ; 0DB4 _ 8D. 50, F0
        mov     eax, dword [my]                         ; 0DB7 _ A1, 000001F4(d)
        cmp     edx, eax                                ; 0DBC _ 39. C2
        jge     ?_059                                   ; 0DBE _ 7D, 0B
        mov     eax, dword [ebp-4H]                     ; 0DC0 _ 8B. 45, FC
        sub     eax, 16                                 ; 0DC3 _ 83. E8, 10
        mov     dword [my], eax                         ; 0DC6 _ A3, 000001F4(d)
?_059:  nop                                             ; 0DCB _ 90
        leave                                           ; 0DCC _ C9
        ret                                             ; 0DCD _ C3
; computeMousePosition End of function

eraseMouse:; Function begin
        push    ebp                                     ; 0DCE _ 55
        mov     ebp, esp                                ; 0DCF _ 89. E5
        push    ebx                                     ; 0DD1 _ 53
        sub     esp, 16                                 ; 0DD2 _ 83. EC, 10
        movzx   eax, word [?_063]                       ; 0DD5 _ 0F B7. 05, 00000104(d)
        cwde                                            ; 0DDC _ 98
        mov     dword [ebp-0CH], eax                    ; 0DDD _ 89. 45, F4
        movzx   eax, word [?_064]                       ; 0DE0 _ 0F B7. 05, 00000106(d)
        cwde                                            ; 0DE7 _ 98
        mov     dword [ebp-8H], eax                     ; 0DE8 _ 89. 45, F8
        mov     eax, dword [my]                         ; 0DEB _ A1, 000001F4(d)
        lea     ebx, [eax+0FH]                          ; 0DF0 _ 8D. 58, 0F
        mov     eax, dword [mx]                         ; 0DF3 _ A1, 000001F0(d)
        lea     ecx, [eax+0FH]                          ; 0DF8 _ 8D. 48, 0F
        mov     edx, dword [my]                         ; 0DFB _ 8B. 15, 000001F4(d)
        mov     eax, dword [mx]                         ; 0E01 _ A1, 000001F0(d)
        push    ebx                                     ; 0E06 _ 53
        push    ecx                                     ; 0E07 _ 51
        push    edx                                     ; 0E08 _ 52
        push    eax                                     ; 0E09 _ 50
        push    14                                      ; 0E0A _ 6A, 0E
        push    dword [ebp-0CH]                         ; 0E0C _ FF. 75, F4
        push    dword [ebp+8H]                          ; 0E0F _ FF. 75, 08
        call    boxfill8                                ; 0E12 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 0E17 _ 83. C4, 1C
        nop                                             ; 0E1A _ 90
        mov     ebx, dword [ebp-4H]                     ; 0E1B _ 8B. 5D, FC
        leave                                           ; 0E1E _ C9
        ret                                             ; 0E1F _ C3
; eraseMouse End of function

drawMouse:; Function begin
        push    ebp                                     ; 0E20 _ 55
        mov     ebp, esp                                ; 0E21 _ 89. E5
        sub     esp, 16                                 ; 0E23 _ 83. EC, 10
        movzx   eax, word [?_063]                       ; 0E26 _ 0F B7. 05, 00000104(d)
        cwde                                            ; 0E2D _ 98
        mov     dword [ebp-8H], eax                     ; 0E2E _ 89. 45, F8
        movzx   eax, word [?_064]                       ; 0E31 _ 0F B7. 05, 00000106(d)
        cwde                                            ; 0E38 _ 98
        mov     dword [ebp-4H], eax                     ; 0E39 _ 89. 45, FC
        mov     edx, dword [my]                         ; 0E3C _ 8B. 15, 000001F4(d)
        mov     eax, dword [mx]                         ; 0E42 _ A1, 000001F0(d)
        push    16                                      ; 0E47 _ 6A, 10
        push    mcursor                                 ; 0E49 _ 68, 00000000(d)
        push    edx                                     ; 0E4E _ 52
        push    eax                                     ; 0E4F _ 50
        push    16                                      ; 0E50 _ 6A, 10
        push    16                                      ; 0E52 _ 6A, 10
        push    dword [ebp-8H]                          ; 0E54 _ FF. 75, F8
        push    dword [ebp+8H]                          ; 0E57 _ FF. 75, 08
        call    putblock                                ; 0E5A _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0E5F _ 83. C4, 20
        nop                                             ; 0E62 _ 90
        leave                                           ; 0E63 _ C9
        ret                                             ; 0E64 _ C3
; drawMouse End of function

show_mouse_info:; Function begin
        push    ebp                                     ; 0E65 _ 55
        mov     ebp, esp                                ; 0E66 _ 89. E5
        sub     esp, 16                                 ; 0E68 _ 83. EC, 10
        mov     eax, dword [bootInfo]                   ; 0E6B _ A1, 00000100(d)
        mov     dword [ebp-4H], eax                     ; 0E70 _ 89. 45, FC
        mov     byte [ebp-5H], 0                        ; 0E73 _ C6. 45, FB, 00
        push    mouseinfo                               ; 0E77 _ 68, 00000108(d)
        call    fifo8_get                               ; 0E7C _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 0E81 _ 83. C4, 04
        mov     byte [ebp-5H], al                       ; 0E84 _ 88. 45, FB
        movzx   eax, byte [ebp-5H]                      ; 0E87 _ 0F B6. 45, FB
        push    eax                                     ; 0E8B _ 50
        push    mdec                                    ; 0E8C _ 68, 000001E0(d)
        call    mouse_decode                            ; 0E91 _ E8, FFFFFFFC(rel)
        add     esp, 8                                  ; 0E96 _ 83. C4, 08
        cmp     eax, 1                                  ; 0E99 _ 83. F8, 01
        jnz     ?_060                                   ; 0E9C _ 75, 23
        push    dword [ebp-4H]                          ; 0E9E _ FF. 75, FC
        call    eraseMouse                              ; 0EA1 _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 0EA6 _ 83. C4, 04
        push    mdec                                    ; 0EA9 _ 68, 000001E0(d)
        call    computeMousePosition                    ; 0EAE _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 0EB3 _ 83. C4, 04
        push    dword [ebp-4H]                          ; 0EB6 _ FF. 75, FC
        call    drawMouse                               ; 0EB9 _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 0EBE _ 83. C4, 04
?_060:  nop                                             ; 0EC1 _ 90
        leave                                           ; 0EC2 _ C9
        ret                                             ; 0EC3 _ C3
; show_mouse_info End of function

showMemoryInfo:; Function begin
        push    ebp                                     ; 0EC4 _ 55
        mov     ebp, esp                                ; 0EC5 _ 89. E5
        nop                                             ; 0EC7 _ 90
        pop     ebp                                     ; 0EC8 _ 5D
        ret                                             ; 0EC9 _ C3
; showMemoryInfo End of function



keyval:                                                 ; byte
        db 30H, 78H                                     ; 0000 _ 0x

?_061:  db 00H                                          ; 0002 _ .

?_062:  db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0003 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 000B _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0013 _ ........
        db 00H, 00H, 00H, 00H, 00H                      ; 001B _ .....

table_rgb.1573:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 00H, 0FFH     ; 0020 _ ........
        db 00H, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH   ; 0028 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0030 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0038 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 0040 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 0048 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0050 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0058 _ ........

cursor.1631:                                            ; byte
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



mcursor:                                                ; byte
        resb    256                                     ; 0000

bootInfo:                                               ; qword
        resb    4                                       ; 0100

?_063:  resw    1                                       ; 0104

?_064:  resw    1                                       ; 0106

mouseinfo:                                              ; byte
        resb    24                                      ; 0108

keyinfo:                                                ; byte
        resb    32                                      ; 0120

mousebuf:                                               ; byte
        resb    128                                     ; 0140

keybuf:                                                 ; yword
        resb    32                                      ; 01C0

mdec:                                                   ; oword
        resb    16                                      ; 01E0

mx:     resd    1                                       ; 01F0

my:     resd    1                                       ; 01F4

showPos.1564:                                           ; dword
        resd    1                                       ; 01F8

str.1678:                                               ; byte
        resb    1                                       ; 01FC

?_065:  resb    9                                       ; 01FD

?_066:  resb    1                                       ; 0206


