CMain:  ; Function begin
        push    ebp                                     ; 0000 _ 55
        mov     ebp, esp                                ; 0001 _ 89. E5
        push    ebx                                     ; 0003 _ 53
        sub     esp, 36                                 ; 0004 _ 83. EC, 24
        sub     esp, 12                                 ; 0007 _ 83. EC, 0C
        push    bootInfo                                ; 000A _ 68, 00000100(d)
        call    initBootInfo                            ; 000F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0014 _ 83. C4, 10
        mov     eax, dword [bootInfo]                   ; 0017 _ A1, 00000100(d)
        mov     dword [ebp-20H], eax                    ; 001C _ 89. 45, E0
        movzx   eax, word [?_045]                       ; 001F _ 0F B7. 05, 00000104(d)
        cwde                                            ; 0026 _ 98
        mov     dword [ebp-1CH], eax                    ; 0027 _ 89. 45, E4
        movzx   eax, word [?_046]                       ; 002A _ 0F B7. 05, 00000106(d)
        cwde                                            ; 0031 _ 98
        mov     dword [ebp-18H], eax                    ; 0032 _ 89. 45, E8
        call    init_palette                            ; 0035 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-18H]                    ; 003A _ 8B. 45, E8
        lea     edx, [eax-1DH]                          ; 003D _ 8D. 50, E3
        mov     eax, dword [ebp-1CH]                    ; 0040 _ 8B. 45, E4
        sub     eax, 1                                  ; 0043 _ 83. E8, 01
        sub     esp, 4                                  ; 0046 _ 83. EC, 04
        push    edx                                     ; 0049 _ 52
        push    eax                                     ; 004A _ 50
        push    0                                       ; 004B _ 6A, 00
        push    0                                       ; 004D _ 6A, 00
        push    14                                      ; 004F _ 6A, 0E
        push    dword [ebp-1CH]                         ; 0051 _ FF. 75, E4
        push    dword [ebp-20H]                         ; 0054 _ FF. 75, E0
        call    boxfill8                                ; 0057 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 005C _ 83. C4, 20
        mov     eax, dword [ebp-18H]                    ; 005F _ 8B. 45, E8
        lea     ecx, [eax-1CH]                          ; 0062 _ 8D. 48, E4
        mov     eax, dword [ebp-1CH]                    ; 0065 _ 8B. 45, E4
        lea     edx, [eax-1H]                           ; 0068 _ 8D. 50, FF
        mov     eax, dword [ebp-18H]                    ; 006B _ 8B. 45, E8
        sub     eax, 28                                 ; 006E _ 83. E8, 1C
        sub     esp, 4                                  ; 0071 _ 83. EC, 04
        push    ecx                                     ; 0074 _ 51
        push    edx                                     ; 0075 _ 52
        push    eax                                     ; 0076 _ 50
        push    0                                       ; 0077 _ 6A, 00
        push    8                                       ; 0079 _ 6A, 08
        push    dword [ebp-1CH]                         ; 007B _ FF. 75, E4
        push    dword [ebp-20H]                         ; 007E _ FF. 75, E0
        call    boxfill8                                ; 0081 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0086 _ 83. C4, 20
        mov     eax, dword [ebp-18H]                    ; 0089 _ 8B. 45, E8
        lea     ecx, [eax-1BH]                          ; 008C _ 8D. 48, E5
        mov     eax, dword [ebp-1CH]                    ; 008F _ 8B. 45, E4
        lea     edx, [eax-1H]                           ; 0092 _ 8D. 50, FF
        mov     eax, dword [ebp-18H]                    ; 0095 _ 8B. 45, E8
        sub     eax, 27                                 ; 0098 _ 83. E8, 1B
        sub     esp, 4                                  ; 009B _ 83. EC, 04
        push    ecx                                     ; 009E _ 51
        push    edx                                     ; 009F _ 52
        push    eax                                     ; 00A0 _ 50
        push    0                                       ; 00A1 _ 6A, 00
        push    7                                       ; 00A3 _ 6A, 07
        push    dword [ebp-1CH]                         ; 00A5 _ FF. 75, E4
        push    dword [ebp-20H]                         ; 00A8 _ FF. 75, E0
        call    boxfill8                                ; 00AB _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 00B0 _ 83. C4, 20
        mov     eax, dword [ebp-18H]                    ; 00B3 _ 8B. 45, E8
        lea     ecx, [eax-1H]                           ; 00B6 _ 8D. 48, FF
        mov     eax, dword [ebp-1CH]                    ; 00B9 _ 8B. 45, E4
        lea     edx, [eax-1H]                           ; 00BC _ 8D. 50, FF
        mov     eax, dword [ebp-18H]                    ; 00BF _ 8B. 45, E8
        sub     eax, 26                                 ; 00C2 _ 83. E8, 1A
        sub     esp, 4                                  ; 00C5 _ 83. EC, 04
        push    ecx                                     ; 00C8 _ 51
        push    edx                                     ; 00C9 _ 52
        push    eax                                     ; 00CA _ 50
        push    0                                       ; 00CB _ 6A, 00
        push    8                                       ; 00CD _ 6A, 08
        push    dword [ebp-1CH]                         ; 00CF _ FF. 75, E4
        push    dword [ebp-20H]                         ; 00D2 _ FF. 75, E0
        call    boxfill8                                ; 00D5 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 00DA _ 83. C4, 20
        mov     eax, dword [ebp-18H]                    ; 00DD _ 8B. 45, E8
        lea     edx, [eax-18H]                          ; 00E0 _ 8D. 50, E8
        mov     eax, dword [ebp-18H]                    ; 00E3 _ 8B. 45, E8
        sub     eax, 24                                 ; 00E6 _ 83. E8, 18
        sub     esp, 4                                  ; 00E9 _ 83. EC, 04
        push    edx                                     ; 00EC _ 52
        push    59                                      ; 00ED _ 6A, 3B
        push    eax                                     ; 00EF _ 50
        push    3                                       ; 00F0 _ 6A, 03
        push    7                                       ; 00F2 _ 6A, 07
        push    dword [ebp-1CH]                         ; 00F4 _ FF. 75, E4
        push    dword [ebp-20H]                         ; 00F7 _ FF. 75, E0
        call    boxfill8                                ; 00FA _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 00FF _ 83. C4, 20
        mov     eax, dword [ebp-18H]                    ; 0102 _ 8B. 45, E8
        lea     edx, [eax-4H]                           ; 0105 _ 8D. 50, FC
        mov     eax, dword [ebp-18H]                    ; 0108 _ 8B. 45, E8
        sub     eax, 24                                 ; 010B _ 83. E8, 18
        sub     esp, 4                                  ; 010E _ 83. EC, 04
        push    edx                                     ; 0111 _ 52
        push    2                                       ; 0112 _ 6A, 02
        push    eax                                     ; 0114 _ 50
        push    2                                       ; 0115 _ 6A, 02
        push    7                                       ; 0117 _ 6A, 07
        push    dword [ebp-1CH]                         ; 0119 _ FF. 75, E4
        push    dword [ebp-20H]                         ; 011C _ FF. 75, E0
        call    boxfill8                                ; 011F _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0124 _ 83. C4, 20
        mov     eax, dword [ebp-18H]                    ; 0127 _ 8B. 45, E8
        lea     edx, [eax-4H]                           ; 012A _ 8D. 50, FC
        mov     eax, dword [ebp-18H]                    ; 012D _ 8B. 45, E8
        sub     eax, 4                                  ; 0130 _ 83. E8, 04
        sub     esp, 4                                  ; 0133 _ 83. EC, 04
        push    edx                                     ; 0136 _ 52
        push    59                                      ; 0137 _ 6A, 3B
        push    eax                                     ; 0139 _ 50
        push    3                                       ; 013A _ 6A, 03
        push    15                                      ; 013C _ 6A, 0F
        push    dword [ebp-1CH]                         ; 013E _ FF. 75, E4
        push    dword [ebp-20H]                         ; 0141 _ FF. 75, E0
        call    boxfill8                                ; 0144 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0149 _ 83. C4, 20
        mov     eax, dword [ebp-18H]                    ; 014C _ 8B. 45, E8
        lea     edx, [eax-5H]                           ; 014F _ 8D. 50, FB
        mov     eax, dword [ebp-18H]                    ; 0152 _ 8B. 45, E8
        sub     eax, 23                                 ; 0155 _ 83. E8, 17
        sub     esp, 4                                  ; 0158 _ 83. EC, 04
        push    edx                                     ; 015B _ 52
        push    59                                      ; 015C _ 6A, 3B
        push    eax                                     ; 015E _ 50
        push    59                                      ; 015F _ 6A, 3B
        push    15                                      ; 0161 _ 6A, 0F
        push    dword [ebp-1CH]                         ; 0163 _ FF. 75, E4
        push    dword [ebp-20H]                         ; 0166 _ FF. 75, E0
        call    boxfill8                                ; 0169 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 016E _ 83. C4, 20
        mov     eax, dword [ebp-18H]                    ; 0171 _ 8B. 45, E8
        lea     edx, [eax-3H]                           ; 0174 _ 8D. 50, FD
        mov     eax, dword [ebp-18H]                    ; 0177 _ 8B. 45, E8
        sub     eax, 3                                  ; 017A _ 83. E8, 03
        sub     esp, 4                                  ; 017D _ 83. EC, 04
        push    edx                                     ; 0180 _ 52
        push    59                                      ; 0181 _ 6A, 3B
        push    eax                                     ; 0183 _ 50
        push    2                                       ; 0184 _ 6A, 02
        push    0                                       ; 0186 _ 6A, 00
        push    dword [ebp-1CH]                         ; 0188 _ FF. 75, E4
        push    dword [ebp-20H]                         ; 018B _ FF. 75, E0
        call    boxfill8                                ; 018E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0193 _ 83. C4, 20
        mov     eax, dword [ebp-18H]                    ; 0196 _ 8B. 45, E8
        lea     edx, [eax-3H]                           ; 0199 _ 8D. 50, FD
        mov     eax, dword [ebp-18H]                    ; 019C _ 8B. 45, E8
        sub     eax, 24                                 ; 019F _ 83. E8, 18
        sub     esp, 4                                  ; 01A2 _ 83. EC, 04
        push    edx                                     ; 01A5 _ 52
        push    60                                      ; 01A6 _ 6A, 3C
        push    eax                                     ; 01A8 _ 50
        push    60                                      ; 01A9 _ 6A, 3C
        push    0                                       ; 01AB _ 6A, 00
        push    dword [ebp-1CH]                         ; 01AD _ FF. 75, E4
        push    dword [ebp-20H]                         ; 01B0 _ FF. 75, E0
        call    boxfill8                                ; 01B3 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 01B8 _ 83. C4, 20
        mov     eax, dword [ebp-18H]                    ; 01BB _ 8B. 45, E8
        lea     ebx, [eax-3H]                           ; 01BE _ 8D. 58, FD
        mov     eax, dword [ebp-1CH]                    ; 01C1 _ 8B. 45, E4
        lea     ecx, [eax-4H]                           ; 01C4 _ 8D. 48, FC
        mov     eax, dword [ebp-18H]                    ; 01C7 _ 8B. 45, E8
        lea     edx, [eax-3H]                           ; 01CA _ 8D. 50, FD
        mov     eax, dword [ebp-1CH]                    ; 01CD _ 8B. 45, E4
        sub     eax, 47                                 ; 01D0 _ 83. E8, 2F
        sub     esp, 4                                  ; 01D3 _ 83. EC, 04
        push    ebx                                     ; 01D6 _ 53
        push    ecx                                     ; 01D7 _ 51
        push    edx                                     ; 01D8 _ 52
        push    eax                                     ; 01D9 _ 50
        push    7                                       ; 01DA _ 6A, 07
        push    dword [ebp-1CH]                         ; 01DC _ FF. 75, E4
        push    dword [ebp-20H]                         ; 01DF _ FF. 75, E0
        call    boxfill8                                ; 01E2 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 01E7 _ 83. C4, 20
        mov     eax, dword [ebp-18H]                    ; 01EA _ 8B. 45, E8
        lea     ebx, [eax-4H]                           ; 01ED _ 8D. 58, FC
        mov     eax, dword [ebp-1CH]                    ; 01F0 _ 8B. 45, E4
        lea     ecx, [eax-3H]                           ; 01F3 _ 8D. 48, FD
        mov     eax, dword [ebp-18H]                    ; 01F6 _ 8B. 45, E8
        lea     edx, [eax-18H]                          ; 01F9 _ 8D. 50, E8
        mov     eax, dword [ebp-1CH]                    ; 01FC _ 8B. 45, E4
        sub     eax, 3                                  ; 01FF _ 83. E8, 03
        sub     esp, 4                                  ; 0202 _ 83. EC, 04
        push    ebx                                     ; 0205 _ 53
        push    ecx                                     ; 0206 _ 51
        push    edx                                     ; 0207 _ 52
        push    eax                                     ; 0208 _ 50
        push    7                                       ; 0209 _ 6A, 07
        push    dword [ebp-1CH]                         ; 020B _ FF. 75, E4
        push    dword [ebp-20H]                         ; 020E _ FF. 75, E0
        call    boxfill8                                ; 0211 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0216 _ 83. C4, 20
        mov     eax, dword [ebp-18H]                    ; 0219 _ 8B. 45, E8
        lea     ebx, [eax-18H]                          ; 021C _ 8D. 58, E8
        mov     eax, dword [ebp-1CH]                    ; 021F _ 8B. 45, E4
        lea     ecx, [eax-4H]                           ; 0222 _ 8D. 48, FC
        mov     eax, dword [ebp-18H]                    ; 0225 _ 8B. 45, E8
        lea     edx, [eax-18H]                          ; 0228 _ 8D. 50, E8
        mov     eax, dword [ebp-1CH]                    ; 022B _ 8B. 45, E4
        sub     eax, 47                                 ; 022E _ 83. E8, 2F
        sub     esp, 4                                  ; 0231 _ 83. EC, 04
        push    ebx                                     ; 0234 _ 53
        push    ecx                                     ; 0235 _ 51
        push    edx                                     ; 0236 _ 52
        push    eax                                     ; 0237 _ 50
        push    15                                      ; 0238 _ 6A, 0F
        push    dword [ebp-1CH]                         ; 023A _ FF. 75, E4
        push    dword [ebp-20H]                         ; 023D _ FF. 75, E0
        call    boxfill8                                ; 0240 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0245 _ 83. C4, 20
        mov     eax, dword [ebp-18H]                    ; 0248 _ 8B. 45, E8
        lea     ebx, [eax-4H]                           ; 024B _ 8D. 58, FC
        mov     eax, dword [ebp-1CH]                    ; 024E _ 8B. 45, E4
        lea     ecx, [eax-2FH]                          ; 0251 _ 8D. 48, D1
        mov     eax, dword [ebp-18H]                    ; 0254 _ 8B. 45, E8
        lea     edx, [eax-17H]                          ; 0257 _ 8D. 50, E9
        mov     eax, dword [ebp-1CH]                    ; 025A _ 8B. 45, E4
        sub     eax, 47                                 ; 025D _ 83. E8, 2F
        sub     esp, 4                                  ; 0260 _ 83. EC, 04
        push    ebx                                     ; 0263 _ 53
        push    ecx                                     ; 0264 _ 51
        push    edx                                     ; 0265 _ 52
        push    eax                                     ; 0266 _ 50
        push    15                                      ; 0267 _ 6A, 0F
        push    dword [ebp-1CH]                         ; 0269 _ FF. 75, E4
        push    dword [ebp-20H]                         ; 026C _ FF. 75, E0
        call    boxfill8                                ; 026F _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0274 _ 83. C4, 20
        sub     esp, 8                                  ; 0277 _ 83. EC, 08
        push    14                                      ; 027A _ 6A, 0E
        push    mcursor                                 ; 027C _ 68, 00000000(d)
        call    init_mouse_cursor                       ; 0281 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0286 _ 83. C4, 10
        push    16                                      ; 0289 _ 6A, 10
        push    mcursor                                 ; 028B _ 68, 00000000(d)
        push    80                                      ; 0290 _ 6A, 50
        push    80                                      ; 0292 _ 6A, 50
        push    16                                      ; 0294 _ 6A, 10
        push    16                                      ; 0296 _ 6A, 10
        push    dword [ebp-1CH]                         ; 0298 _ FF. 75, E4
        push    dword [ebp-20H]                         ; 029B _ FF. 75, E0
        call    putblock                                ; 029E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 02A3 _ 83. C4, 20
        sub     esp, 4                                  ; 02A6 _ 83. EC, 04
        push    mousebuf                                ; 02A9 _ 68, 00000140(d)
        push    128                                     ; 02AE _ 68, 00000080
        push    mouseinfo                               ; 02B3 _ 68, 00000108(d)
        call    fifo8_init                              ; 02B8 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 02BD _ 83. C4, 10
        sub     esp, 4                                  ; 02C0 _ 83. EC, 04
        push    keybuf                                  ; 02C3 _ 68, 000001C0(d)
        push    32                                      ; 02C8 _ 6A, 20
        push    keyinfo                                 ; 02CA _ 68, 00000120(d)
        call    fifo8_init                              ; 02CF _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 02D4 _ 83. C4, 10
        call    init_keyboard                           ; 02D7 _ E8, FFFFFFFC(rel)
        call    enable_mouse                            ; 02DC _ E8, FFFFFFFC(rel)
        call    io_sti                                  ; 02E1 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], 0                      ; 02E6 _ C7. 45, EC, 00000000
?_001:  sub     esp, 12                                 ; 02ED _ 83. EC, 0C
        push    keyinfo                                 ; 02F0 _ 68, 00000120(d)
        call    fifo8_status                            ; 02F5 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 02FA _ 83. C4, 10
        mov     ebx, eax                                ; 02FD _ 89. C3
        sub     esp, 12                                 ; 02FF _ 83. EC, 0C
        push    mouseinfo                               ; 0302 _ 68, 00000108(d)
        call    fifo8_status                            ; 0307 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 030C _ 83. C4, 10
        add     eax, ebx                                ; 030F _ 01. D8
        test    eax, eax                                ; 0311 _ 85. C0
        jnz     ?_002                                   ; 0313 _ 75, 07
        call    io_hlt                                  ; 0315 _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 031A _ EB, D1
; CMain End of function

?_002:  ; Local function
        sub     esp, 12                                 ; 031C _ 83. EC, 0C
        push    keyinfo                                 ; 031F _ 68, 00000120(d)
        call    fifo8_status                            ; 0324 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0329 _ 83. C4, 10
        test    eax, eax                                ; 032C _ 85. C0
        jz      ?_003                                   ; 032E _ 74, 58
        sub     esp, 12                                 ; 0330 _ 83. EC, 0C
        push    keyinfo                                 ; 0333 _ 68, 00000120(d)
        call    fifo8_get                               ; 0338 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 033D _ 83. C4, 10
        mov     dword [ebp-14H], eax                    ; 0340 _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 0343 _ 8B. 45, EC
        movzx   eax, al                                 ; 0346 _ 0F B6. C0
        sub     esp, 12                                 ; 0349 _ 83. EC, 0C
        push    eax                                     ; 034C _ 50
        call    charToHexStr                            ; 034D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0352 _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 0355 _ 89. 45, F4
        mov     eax, dword [showPos.1523]               ; 0358 _ A1, 000001E0(d)
        sub     esp, 8                                  ; 035D _ 83. EC, 08
        push    dword [ebp-0CH]                         ; 0360 _ FF. 75, F4
        push    7                                       ; 0363 _ 6A, 07
        push    0                                       ; 0365 _ 6A, 00
        push    eax                                     ; 0367 _ 50
        push    dword [ebp-1CH]                         ; 0368 _ FF. 75, E4
        push    dword [ebp-20H]                         ; 036B _ FF. 75, E0
        call    showString                              ; 036E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0373 _ 83. C4, 20
        mov     eax, dword [showPos.1523]               ; 0376 _ A1, 000001E0(d)
        add     eax, 32                                 ; 037B _ 83. C0, 20
        mov     dword [showPos.1523], eax               ; 037E _ A3, 000001E0(d)
        jmp     ?_001                                   ; 0383 _ E9, FFFFFF65

?_003:  ; Local function
        sub     esp, 12                                 ; 0388 _ 83. EC, 0C
        push    mouseinfo                               ; 038B _ 68, 00000108(d)
        call    fifo8_status                            ; 0390 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0395 _ 83. C4, 10
        test    eax, eax                                ; 0398 _ 85. C0
        je      ?_001                                   ; 039A _ 0F 84, FFFFFF4D
        sub     esp, 12                                 ; 03A0 _ 83. EC, 0C
        push    mouseinfo                               ; 03A3 _ 68, 00000108(d)
        call    fifo8_get                               ; 03A8 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03AD _ 83. C4, 10
        mov     dword [ebp-14H], eax                    ; 03B0 _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 03B3 _ 8B. 45, EC
        movzx   eax, al                                 ; 03B6 _ 0F B6. C0
        sub     esp, 12                                 ; 03B9 _ 83. EC, 0C
        push    eax                                     ; 03BC _ 50
        call    charToHexStr                            ; 03BD _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03C2 _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 03C5 _ 89. 45, F0
        mov     eax, dword [showPosMouse.1525]          ; 03C8 _ A1, 000001E4(d)
        sub     esp, 8                                  ; 03CD _ 83. EC, 08
        push    dword [ebp-10H]                         ; 03D0 _ FF. 75, F0
        push    7                                       ; 03D3 _ 6A, 07
        push    32                                      ; 03D5 _ 6A, 20
        push    eax                                     ; 03D7 _ 50
        push    dword [ebp-1CH]                         ; 03D8 _ FF. 75, E4
        push    dword [ebp-20H]                         ; 03DB _ FF. 75, E0
        call    showString                              ; 03DE _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 03E3 _ 83. C4, 20
        mov     eax, dword [showPosMouse.1525]          ; 03E6 _ A1, 000001E4(d)
        add     eax, 32                                 ; 03EB _ 83. C0, 20
        mov     dword [showPosMouse.1525], eax          ; 03EE _ A3, 000001E4(d)
        jmp     ?_001                                   ; 03F3 _ E9, FFFFFEF5

initBootInfo:; Function begin
        push    ebp                                     ; 03F8 _ 55
        mov     ebp, esp                                ; 03F9 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 03FB _ 8B. 45, 08
        mov     dword [eax], 655360                     ; 03FE _ C7. 00, 000A0000
        mov     eax, dword [ebp+8H]                     ; 0404 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 320                      ; 0407 _ 66: C7. 40, 04, 0140
        mov     eax, dword [ebp+8H]                     ; 040D _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 200                      ; 0410 _ 66: C7. 40, 06, 00C8
        nop                                             ; 0416 _ 90
        pop     ebp                                     ; 0417 _ 5D
        ret                                             ; 0418 _ C3
; initBootInfo End of function

init_palette:; Function begin
        push    ebp                                     ; 0419 _ 55
        mov     ebp, esp                                ; 041A _ 89. E5
        sub     esp, 8                                  ; 041C _ 83. EC, 08
        sub     esp, 4                                  ; 041F _ 83. EC, 04
        push    table_rgb.1533                          ; 0422 _ 68, 00000020(d)
        push    15                                      ; 0427 _ 6A, 0F
        push    0                                       ; 0429 _ 6A, 00
        call    set_palette                             ; 042B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0430 _ 83. C4, 10
        nop                                             ; 0433 _ 90
        leave                                           ; 0434 _ C9
        ret                                             ; 0435 _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 0436 _ 55
        mov     ebp, esp                                ; 0437 _ 89. E5
        sub     esp, 24                                 ; 0439 _ 83. EC, 18
        call    io_load_eflags                          ; 043C _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 0441 _ 89. 45, F4
        call    io_cli                                  ; 0444 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0449 _ 83. EC, 08
        push    dword [ebp+8H]                          ; 044C _ FF. 75, 08
        push    968                                     ; 044F _ 68, 000003C8
        call    io_out8                                 ; 0454 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0459 _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 045C _ 8B. 45, 08
        mov     dword [ebp-10H], eax                    ; 045F _ 89. 45, F0
        jmp     ?_005                                   ; 0462 _ EB, 65

?_004:  mov     eax, dword [ebp+10H]                    ; 0464 _ 8B. 45, 10
        movzx   eax, byte [eax]                         ; 0467 _ 0F B6. 00
        shr     al, 2                                   ; 046A _ C0. E8, 02
        movzx   eax, al                                 ; 046D _ 0F B6. C0
        sub     esp, 8                                  ; 0470 _ 83. EC, 08
        push    eax                                     ; 0473 _ 50
        push    969                                     ; 0474 _ 68, 000003C9
        call    io_out8                                 ; 0479 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 047E _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 0481 _ 8B. 45, 10
        add     eax, 1                                  ; 0484 _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 0487 _ 0F B6. 00
        shr     al, 2                                   ; 048A _ C0. E8, 02
        movzx   eax, al                                 ; 048D _ 0F B6. C0
        sub     esp, 8                                  ; 0490 _ 83. EC, 08
        push    eax                                     ; 0493 _ 50
        push    969                                     ; 0494 _ 68, 000003C9
        call    io_out8                                 ; 0499 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 049E _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 04A1 _ 8B. 45, 10
        add     eax, 2                                  ; 04A4 _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 04A7 _ 0F B6. 00
        shr     al, 2                                   ; 04AA _ C0. E8, 02
        movzx   eax, al                                 ; 04AD _ 0F B6. C0
        sub     esp, 8                                  ; 04B0 _ 83. EC, 08
        push    eax                                     ; 04B3 _ 50
        push    969                                     ; 04B4 _ 68, 000003C9
        call    io_out8                                 ; 04B9 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 04BE _ 83. C4, 10
        add     dword [ebp+10H], 3                      ; 04C1 _ 83. 45, 10, 03
        add     dword [ebp-10H], 1                      ; 04C5 _ 83. 45, F0, 01
?_005:  mov     eax, dword [ebp-10H]                    ; 04C9 _ 8B. 45, F0
        cmp     eax, dword [ebp+0CH]                    ; 04CC _ 3B. 45, 0C
        jle     ?_004                                   ; 04CF _ 7E, 93
        sub     esp, 12                                 ; 04D1 _ 83. EC, 0C
        push    dword [ebp-0CH]                         ; 04D4 _ FF. 75, F4
        call    io_store_eflags                         ; 04D7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 04DC _ 83. C4, 10
        nop                                             ; 04DF _ 90
        leave                                           ; 04E0 _ C9
        ret                                             ; 04E1 _ C3
; set_palette End of function

boxfill8:; Function begin
        push    ebp                                     ; 04E2 _ 55
        mov     ebp, esp                                ; 04E3 _ 89. E5
        sub     esp, 20                                 ; 04E5 _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 04E8 _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 04EB _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 04EE _ 8B. 45, 18
        mov     dword [ebp-4H], eax                     ; 04F1 _ 89. 45, FC
        jmp     ?_009                                   ; 04F4 _ EB, 33

?_006:  mov     eax, dword [ebp+14H]                    ; 04F6 _ 8B. 45, 14
        mov     dword [ebp-8H], eax                     ; 04F9 _ 89. 45, F8
        jmp     ?_008                                   ; 04FC _ EB, 1F

?_007:  mov     eax, dword [ebp-4H]                     ; 04FE _ 8B. 45, FC
        imul    eax, dword [ebp+0CH]                    ; 0501 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0505 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0507 _ 8B. 45, F8
        add     eax, edx                                ; 050A _ 01. D0
        mov     edx, eax                                ; 050C _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 050E _ 8B. 45, 08
        add     edx, eax                                ; 0511 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0513 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0517 _ 88. 02
        add     dword [ebp-8H], 1                       ; 0519 _ 83. 45, F8, 01
?_008:  mov     eax, dword [ebp-8H]                     ; 051D _ 8B. 45, F8
        cmp     eax, dword [ebp+1CH]                    ; 0520 _ 3B. 45, 1C
        jle     ?_007                                   ; 0523 _ 7E, D9
        add     dword [ebp-4H], 1                       ; 0525 _ 83. 45, FC, 01
?_009:  mov     eax, dword [ebp-4H]                     ; 0529 _ 8B. 45, FC
        cmp     eax, dword [ebp+20H]                    ; 052C _ 3B. 45, 20
        jle     ?_006                                   ; 052F _ 7E, C5
        nop                                             ; 0531 _ 90
        leave                                           ; 0532 _ C9
        ret                                             ; 0533 _ C3
; boxfill8 End of function

showString:; Function begin
        push    ebp                                     ; 0534 _ 55
        mov     ebp, esp                                ; 0535 _ 89. E5
        sub     esp, 24                                 ; 0537 _ 83. EC, 18
        mov     eax, dword [ebp+18H]                    ; 053A _ 8B. 45, 18
        mov     byte [ebp-0CH], al                      ; 053D _ 88. 45, F4
        jmp     ?_011                                   ; 0540 _ EB, 37

?_010:  mov     eax, dword [ebp+1CH]                    ; 0542 _ 8B. 45, 1C
        movzx   eax, byte [eax]                         ; 0545 _ 0F B6. 00
        movzx   eax, al                                 ; 0548 _ 0F B6. C0
        shl     eax, 4                                  ; 054B _ C1. E0, 04
        lea     edx, [systemFont+eax]                   ; 054E _ 8D. 90, 00000000(d)
        movsx   eax, byte [ebp-0CH]                     ; 0554 _ 0F BE. 45, F4
        sub     esp, 8                                  ; 0558 _ 83. EC, 08
        push    edx                                     ; 055B _ 52
        push    eax                                     ; 055C _ 50
        push    dword [ebp+14H]                         ; 055D _ FF. 75, 14
        push    dword [ebp+10H]                         ; 0560 _ FF. 75, 10
        push    dword [ebp+0CH]                         ; 0563 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0566 _ FF. 75, 08
        call    showChar8                               ; 0569 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 056E _ 83. C4, 20
        add     dword [ebp+1CH], 1                      ; 0571 _ 83. 45, 1C, 01
        add     dword [ebp+10H], 8                      ; 0575 _ 83. 45, 10, 08
?_011:  mov     eax, dword [ebp+1CH]                    ; 0579 _ 8B. 45, 1C
        movzx   eax, byte [eax]                         ; 057C _ 0F B6. 00
        test    al, al                                  ; 057F _ 84. C0
        jnz     ?_010                                   ; 0581 _ 75, BF
        nop                                             ; 0583 _ 90
        leave                                           ; 0584 _ C9
        ret                                             ; 0585 _ C3
; showString End of function

showChar8:; Function begin
        push    ebp                                     ; 0586 _ 55
        mov     ebp, esp                                ; 0587 _ 89. E5
        sub     esp, 20                                 ; 0589 _ 83. EC, 14
        mov     eax, dword [ebp+18H]                    ; 058C _ 8B. 45, 18
        mov     byte [ebp-14H], al                      ; 058F _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 0592 _ C7. 45, FC, 00000000
        jmp     ?_021                                   ; 0599 _ E9, 0000016C

?_012:  mov     edx, dword [ebp-4H]                     ; 059E _ 8B. 55, FC
        mov     eax, dword [ebp+1CH]                    ; 05A1 _ 8B. 45, 1C
        add     eax, edx                                ; 05A4 _ 01. D0
        movzx   eax, byte [eax]                         ; 05A6 _ 0F B6. 00
        mov     byte [ebp-5H], al                       ; 05A9 _ 88. 45, FB
        cmp     byte [ebp-5H], 0                        ; 05AC _ 80. 7D, FB, 00
        jns     ?_013                                   ; 05B0 _ 79, 20
        mov     edx, dword [ebp+14H]                    ; 05B2 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 05B5 _ 8B. 45, FC
        add     eax, edx                                ; 05B8 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 05BA _ 0F AF. 45, 0C
        mov     edx, eax                                ; 05BE _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 05C0 _ 8B. 45, 10
        add     eax, edx                                ; 05C3 _ 01. D0
        mov     edx, eax                                ; 05C5 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 05C7 _ 8B. 45, 08
        add     edx, eax                                ; 05CA _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 05CC _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 05D0 _ 88. 02
?_013:  movsx   eax, byte [ebp-5H]                      ; 05D2 _ 0F BE. 45, FB
        and     eax, 40H                                ; 05D6 _ 83. E0, 40
        test    eax, eax                                ; 05D9 _ 85. C0
        jz      ?_014                                   ; 05DB _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 05DD _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 05E0 _ 8B. 45, FC
        add     eax, edx                                ; 05E3 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 05E5 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 05E9 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 05EB _ 8B. 45, 10
        add     eax, edx                                ; 05EE _ 01. D0
        lea     edx, [eax+1H]                           ; 05F0 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 05F3 _ 8B. 45, 08
        add     edx, eax                                ; 05F6 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 05F8 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 05FC _ 88. 02
?_014:  movsx   eax, byte [ebp-5H]                      ; 05FE _ 0F BE. 45, FB
        and     eax, 20H                                ; 0602 _ 83. E0, 20
        test    eax, eax                                ; 0605 _ 85. C0
        jz      ?_015                                   ; 0607 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 0609 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 060C _ 8B. 45, FC
        add     eax, edx                                ; 060F _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0611 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0615 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0617 _ 8B. 45, 10
        add     eax, edx                                ; 061A _ 01. D0
        lea     edx, [eax+2H]                           ; 061C _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 061F _ 8B. 45, 08
        add     edx, eax                                ; 0622 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0624 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0628 _ 88. 02
?_015:  movsx   eax, byte [ebp-5H]                      ; 062A _ 0F BE. 45, FB
        and     eax, 10H                                ; 062E _ 83. E0, 10
        test    eax, eax                                ; 0631 _ 85. C0
        jz      ?_016                                   ; 0633 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 0635 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0638 _ 8B. 45, FC
        add     eax, edx                                ; 063B _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 063D _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0641 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0643 _ 8B. 45, 10
        add     eax, edx                                ; 0646 _ 01. D0
        lea     edx, [eax+3H]                           ; 0648 _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 064B _ 8B. 45, 08
        add     edx, eax                                ; 064E _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0650 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0654 _ 88. 02
?_016:  movsx   eax, byte [ebp-5H]                      ; 0656 _ 0F BE. 45, FB
        and     eax, 08H                                ; 065A _ 83. E0, 08
        test    eax, eax                                ; 065D _ 85. C0
        jz      ?_017                                   ; 065F _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 0661 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0664 _ 8B. 45, FC
        add     eax, edx                                ; 0667 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0669 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 066D _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 066F _ 8B. 45, 10
        add     eax, edx                                ; 0672 _ 01. D0
        lea     edx, [eax+4H]                           ; 0674 _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0677 _ 8B. 45, 08
        add     edx, eax                                ; 067A _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 067C _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0680 _ 88. 02
?_017:  movsx   eax, byte [ebp-5H]                      ; 0682 _ 0F BE. 45, FB
        and     eax, 04H                                ; 0686 _ 83. E0, 04
        test    eax, eax                                ; 0689 _ 85. C0
        jz      ?_018                                   ; 068B _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 068D _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0690 _ 8B. 45, FC
        add     eax, edx                                ; 0693 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0695 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0699 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 069B _ 8B. 45, 10
        add     eax, edx                                ; 069E _ 01. D0
        lea     edx, [eax+5H]                           ; 06A0 _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 06A3 _ 8B. 45, 08
        add     edx, eax                                ; 06A6 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 06A8 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 06AC _ 88. 02
?_018:  movsx   eax, byte [ebp-5H]                      ; 06AE _ 0F BE. 45, FB
        and     eax, 02H                                ; 06B2 _ 83. E0, 02
        test    eax, eax                                ; 06B5 _ 85. C0
        jz      ?_019                                   ; 06B7 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 06B9 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 06BC _ 8B. 45, FC
        add     eax, edx                                ; 06BF _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 06C1 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 06C5 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 06C7 _ 8B. 45, 10
        add     eax, edx                                ; 06CA _ 01. D0
        lea     edx, [eax+6H]                           ; 06CC _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 06CF _ 8B. 45, 08
        add     edx, eax                                ; 06D2 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 06D4 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 06D8 _ 88. 02
?_019:  movsx   eax, byte [ebp-5H]                      ; 06DA _ 0F BE. 45, FB
        and     eax, 01H                                ; 06DE _ 83. E0, 01
        test    eax, eax                                ; 06E1 _ 85. C0
        jz      ?_020                                   ; 06E3 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 06E5 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 06E8 _ 8B. 45, FC
        add     eax, edx                                ; 06EB _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 06ED _ 0F AF. 45, 0C
        mov     edx, eax                                ; 06F1 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 06F3 _ 8B. 45, 10
        add     eax, edx                                ; 06F6 _ 01. D0
        lea     edx, [eax+7H]                           ; 06F8 _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 06FB _ 8B. 45, 08
        add     edx, eax                                ; 06FE _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0700 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0704 _ 88. 02
?_020:  add     dword [ebp-4H], 1                       ; 0706 _ 83. 45, FC, 01
?_021:  cmp     dword [ebp-4H], 15                      ; 070A _ 83. 7D, FC, 0F
        jle     ?_012                                   ; 070E _ 0F 8E, FFFFFE8A
        nop                                             ; 0714 _ 90
        leave                                           ; 0715 _ C9
        ret                                             ; 0716 _ C3
; showChar8 End of function

init_mouse_cursor:; Function begin
        push    ebp                                     ; 0717 _ 55
        mov     ebp, esp                                ; 0718 _ 89. E5
        sub     esp, 20                                 ; 071A _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 071D _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 0720 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 0723 _ C7. 45, FC, 00000000
        jmp     ?_028                                   ; 072A _ E9, 000000B5

?_022:  mov     dword [ebp-8H], 0                       ; 072F _ C7. 45, F8, 00000000
        jmp     ?_027                                   ; 0736 _ E9, 0000009B

?_023:  mov     eax, dword [ebp-4H]                     ; 073B _ 8B. 45, FC
        shl     eax, 4                                  ; 073E _ C1. E0, 04
        mov     edx, eax                                ; 0741 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0743 _ 8B. 45, F8
        add     eax, edx                                ; 0746 _ 01. D0
        add     eax, cursor.1591                        ; 0748 _ 05, 00000060(d)
        movzx   eax, byte [eax]                         ; 074D _ 0F B6. 00
        cmp     al, 42                                  ; 0750 _ 3C, 2A
        jnz     ?_024                                   ; 0752 _ 75, 19
        mov     eax, dword [ebp-4H]                     ; 0754 _ 8B. 45, FC
        shl     eax, 4                                  ; 0757 _ C1. E0, 04
        mov     edx, eax                                ; 075A _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 075C _ 8B. 45, F8
        add     eax, edx                                ; 075F _ 01. D0
        mov     edx, eax                                ; 0761 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0763 _ 8B. 45, 08
        add     eax, edx                                ; 0766 _ 01. D0
        mov     byte [eax], 0                           ; 0768 _ C6. 00, 00
        jmp     ?_026                                   ; 076B _ EB, 65

?_024:  mov     eax, dword [ebp-4H]                     ; 076D _ 8B. 45, FC
        shl     eax, 4                                  ; 0770 _ C1. E0, 04
        mov     edx, eax                                ; 0773 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0775 _ 8B. 45, F8
        add     eax, edx                                ; 0778 _ 01. D0
        add     eax, cursor.1591                        ; 077A _ 05, 00000060(d)
        movzx   eax, byte [eax]                         ; 077F _ 0F B6. 00
        cmp     al, 79                                  ; 0782 _ 3C, 4F
        jnz     ?_025                                   ; 0784 _ 75, 19
        mov     eax, dword [ebp-4H]                     ; 0786 _ 8B. 45, FC
        shl     eax, 4                                  ; 0789 _ C1. E0, 04
        mov     edx, eax                                ; 078C _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 078E _ 8B. 45, F8
        add     eax, edx                                ; 0791 _ 01. D0
        mov     edx, eax                                ; 0793 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0795 _ 8B. 45, 08
        add     eax, edx                                ; 0798 _ 01. D0
        mov     byte [eax], 7                           ; 079A _ C6. 00, 07
        jmp     ?_026                                   ; 079D _ EB, 33

?_025:  mov     eax, dword [ebp-4H]                     ; 079F _ 8B. 45, FC
        shl     eax, 4                                  ; 07A2 _ C1. E0, 04
        mov     edx, eax                                ; 07A5 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 07A7 _ 8B. 45, F8
        add     eax, edx                                ; 07AA _ 01. D0
        add     eax, cursor.1591                        ; 07AC _ 05, 00000060(d)
        movzx   eax, byte [eax]                         ; 07B1 _ 0F B6. 00
        cmp     al, 46                                  ; 07B4 _ 3C, 2E
        jnz     ?_026                                   ; 07B6 _ 75, 1A
        mov     eax, dword [ebp-4H]                     ; 07B8 _ 8B. 45, FC
        shl     eax, 4                                  ; 07BB _ C1. E0, 04
        mov     edx, eax                                ; 07BE _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 07C0 _ 8B. 45, F8
        add     eax, edx                                ; 07C3 _ 01. D0
        mov     edx, eax                                ; 07C5 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 07C7 _ 8B. 45, 08
        add     edx, eax                                ; 07CA _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 07CC _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 07D0 _ 88. 02
?_026:  add     dword [ebp-8H], 1                       ; 07D2 _ 83. 45, F8, 01
?_027:  cmp     dword [ebp-8H], 15                      ; 07D6 _ 83. 7D, F8, 0F
        jle     ?_023                                   ; 07DA _ 0F 8E, FFFFFF5B
        add     dword [ebp-4H], 1                       ; 07E0 _ 83. 45, FC, 01
?_028:  cmp     dword [ebp-4H], 15                      ; 07E4 _ 83. 7D, FC, 0F
        jle     ?_022                                   ; 07E8 _ 0F 8E, FFFFFF41
        nop                                             ; 07EE _ 90
        leave                                           ; 07EF _ C9
        ret                                             ; 07F0 _ C3
; init_mouse_cursor End of function

putblock:; Function begin
        push    ebp                                     ; 07F1 _ 55
        mov     ebp, esp                                ; 07F2 _ 89. E5
        push    ebx                                     ; 07F4 _ 53
        sub     esp, 16                                 ; 07F5 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 07F8 _ C7. 45, F8, 00000000
        jmp     ?_032                                   ; 07FF _ EB, 50

?_029:  mov     dword [ebp-0CH], 0                      ; 0801 _ C7. 45, F4, 00000000
        jmp     ?_031                                   ; 0808 _ EB, 3B

?_030:  mov     eax, dword [ebp-8H]                     ; 080A _ 8B. 45, F8
        imul    eax, dword [ebp+24H]                    ; 080D _ 0F AF. 45, 24
        mov     edx, eax                                ; 0811 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 0813 _ 8B. 45, F4
        add     eax, edx                                ; 0816 _ 01. D0
        mov     edx, eax                                ; 0818 _ 89. C2
        mov     eax, dword [ebp+20H]                    ; 081A _ 8B. 45, 20
        add     eax, edx                                ; 081D _ 01. D0
        mov     ecx, dword [ebp+1CH]                    ; 081F _ 8B. 4D, 1C
        mov     edx, dword [ebp-8H]                     ; 0822 _ 8B. 55, F8
        add     edx, ecx                                ; 0825 _ 01. CA
        imul    edx, dword [ebp+0CH]                    ; 0827 _ 0F AF. 55, 0C
        mov     ebx, dword [ebp+18H]                    ; 082B _ 8B. 5D, 18
        mov     ecx, dword [ebp-0CH]                    ; 082E _ 8B. 4D, F4
        add     ecx, ebx                                ; 0831 _ 01. D9
        add     edx, ecx                                ; 0833 _ 01. CA
        mov     ecx, edx                                ; 0835 _ 89. D1
        mov     edx, dword [ebp+8H]                     ; 0837 _ 8B. 55, 08
        add     edx, ecx                                ; 083A _ 01. CA
        movzx   eax, byte [eax]                         ; 083C _ 0F B6. 00
        mov     byte [edx], al                          ; 083F _ 88. 02
        add     dword [ebp-0CH], 1                      ; 0841 _ 83. 45, F4, 01
?_031:  mov     eax, dword [ebp-0CH]                    ; 0845 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 0848 _ 3B. 45, 10
        jl      ?_030                                   ; 084B _ 7C, BD
        add     dword [ebp-8H], 1                       ; 084D _ 83. 45, F8, 01
?_032:  mov     eax, dword [ebp-8H]                     ; 0851 _ 8B. 45, F8
        cmp     eax, dword [ebp+14H]                    ; 0854 _ 3B. 45, 14
        jl      ?_029                                   ; 0857 _ 7C, A8
        nop                                             ; 0859 _ 90
        add     esp, 16                                 ; 085A _ 83. C4, 10
        pop     ebx                                     ; 085D _ 5B
        pop     ebp                                     ; 085E _ 5D
        ret                                             ; 085F _ C3
; putblock End of function

intHandlerFromC:; Function begin
        push    ebp                                     ; 0860 _ 55
        mov     ebp, esp                                ; 0861 _ 89. E5
        sub     esp, 24                                 ; 0863 _ 83. EC, 18
        mov     eax, dword [bootInfo]                   ; 0866 _ A1, 00000100(d)
        mov     dword [ebp-14H], eax                    ; 086B _ 89. 45, EC
        movzx   eax, word [?_045]                       ; 086E _ 0F B7. 05, 00000104(d)
        cwde                                            ; 0875 _ 98
        mov     dword [ebp-10H], eax                    ; 0876 _ 89. 45, F0
        movzx   eax, word [?_046]                       ; 0879 _ 0F B7. 05, 00000106(d)
        cwde                                            ; 0880 _ 98
        mov     dword [ebp-0CH], eax                    ; 0881 _ 89. 45, F4
        sub     esp, 8                                  ; 0884 _ 83. EC, 08
        push    33                                      ; 0887 _ 6A, 21
        push    32                                      ; 0889 _ 6A, 20
        call    io_out8                                 ; 088B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0890 _ 83. C4, 10
        mov     byte [ebp-15H], 0                       ; 0893 _ C6. 45, EB, 00
        sub     esp, 12                                 ; 0897 _ 83. EC, 0C
        push    96                                      ; 089A _ 6A, 60
        call    io_in8                                  ; 089C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 08A1 _ 83. C4, 10
        mov     byte [ebp-15H], al                      ; 08A4 _ 88. 45, EB
        movzx   eax, byte [ebp-15H]                     ; 08A7 _ 0F B6. 45, EB
        sub     esp, 8                                  ; 08AB _ 83. EC, 08
        push    eax                                     ; 08AE _ 50
        push    keyinfo                                 ; 08AF _ 68, 00000120(d)
        call    fifo8_put                               ; 08B4 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 08B9 _ 83. C4, 10
        nop                                             ; 08BC _ 90
        leave                                           ; 08BD _ C9
        ret                                             ; 08BE _ C3
; intHandlerFromC End of function

charToHexVal:; Function begin
        push    ebp                                     ; 08BF _ 55
        mov     ebp, esp                                ; 08C0 _ 89. E5
        sub     esp, 4                                  ; 08C2 _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 08C5 _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 08C8 _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 08CB _ 80. 7D, FC, 09
        jle     ?_033                                   ; 08CF _ 7E, 09
        movzx   eax, byte [ebp-4H]                      ; 08D1 _ 0F B6. 45, FC
        add     eax, 55                                 ; 08D5 _ 83. C0, 37
        jmp     ?_034                                   ; 08D8 _ EB, 07

?_033:  movzx   eax, byte [ebp-4H]                      ; 08DA _ 0F B6. 45, FC
        add     eax, 48                                 ; 08DE _ 83. C0, 30
?_034:  leave                                           ; 08E1 _ C9
        ret                                             ; 08E2 _ C3
; charToHexVal End of function

charToHexStr:; Function begin
        push    ebp                                     ; 08E3 _ 55
        mov     ebp, esp                                ; 08E4 _ 89. E5
        sub     esp, 20                                 ; 08E6 _ 83. EC, 14
        mov     eax, dword [ebp+8H]                     ; 08E9 _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 08EC _ 88. 45, EC
        movzx   eax, byte [ebp-14H]                     ; 08EF _ 0F B6. 45, EC
        and     eax, 0FH                                ; 08F3 _ 83. E0, 0F
        mov     byte [ebp-1H], al                       ; 08F6 _ 88. 45, FF
        movsx   eax, byte [ebp-1H]                      ; 08F9 _ 0F BE. 45, FF
        push    eax                                     ; 08FD _ 50
        call    charToHexVal                            ; 08FE _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 0903 _ 83. C4, 04
        mov     byte [?_044], al                        ; 0906 _ A2, 00000003(d)
        shr     byte [ebp-14H], 4                       ; 090B _ C0. 6D, EC, 04
        movzx   eax, byte [ebp-14H]                     ; 090F _ 0F B6. 45, EC
        movsx   eax, al                                 ; 0913 _ 0F BE. C0
        push    eax                                     ; 0916 _ 50
        call    charToHexVal                            ; 0917 _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 091C _ 83. C4, 04
        mov     byte [?_043], al                        ; 091F _ A2, 00000002(d)
        mov     eax, keyval                             ; 0924 _ B8, 00000000(d)
        leave                                           ; 0929 _ C9
        ret                                             ; 092A _ C3
; charToHexStr End of function

wait_KBC_sendReady:; Function begin
        push    ebp                                     ; 092B _ 55
        mov     ebp, esp                                ; 092C _ 89. E5
        sub     esp, 8                                  ; 092E _ 83. EC, 08
?_035:  sub     esp, 12                                 ; 0931 _ 83. EC, 0C
        push    100                                     ; 0934 _ 6A, 64
        call    io_in8                                  ; 0936 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 093B _ 83. C4, 10
        and     eax, 02H                                ; 093E _ 83. E0, 02
        test    eax, eax                                ; 0941 _ 85. C0
        jz      ?_036                                   ; 0943 _ 74, 02
        jmp     ?_035                                   ; 0945 _ EB, EA
; wait_KBC_sendReady End of function

?_036:  ; Local function
        nop                                             ; 0947 _ 90
        nop                                             ; 0948 _ 90
        leave                                           ; 0949 _ C9
        ret                                             ; 094A _ C3

init_keyboard:; Function begin
        push    ebp                                     ; 094B _ 55
        mov     ebp, esp                                ; 094C _ 89. E5
        sub     esp, 8                                  ; 094E _ 83. EC, 08
        call    wait_KBC_sendReady                      ; 0951 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0956 _ 83. EC, 08
        push    96                                      ; 0959 _ 6A, 60
        push    100                                     ; 095B _ 6A, 64
        call    io_out8                                 ; 095D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0962 _ 83. C4, 10
        call    wait_KBC_sendReady                      ; 0965 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 096A _ 83. EC, 08
        push    71                                      ; 096D _ 6A, 47
        push    96                                      ; 096F _ 6A, 60
        call    io_out8                                 ; 0971 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0976 _ 83. C4, 10
        nop                                             ; 0979 _ 90
        leave                                           ; 097A _ C9
        ret                                             ; 097B _ C3
; init_keyboard End of function

enable_mouse:; Function begin
        push    ebp                                     ; 097C _ 55
        mov     ebp, esp                                ; 097D _ 89. E5
        sub     esp, 8                                  ; 097F _ 83. EC, 08
        call    wait_KBC_sendReady                      ; 0982 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0987 _ 83. EC, 08
        push    212                                     ; 098A _ 68, 000000D4
        push    100                                     ; 098F _ 6A, 64
        call    io_out8                                 ; 0991 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0996 _ 83. C4, 10
        call    wait_KBC_sendReady                      ; 0999 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 099E _ 83. EC, 08
        push    244                                     ; 09A1 _ 68, 000000F4
        push    96                                      ; 09A6 _ 6A, 60
        call    io_out8                                 ; 09A8 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 09AD _ 83. C4, 10
        nop                                             ; 09B0 _ 90
        leave                                           ; 09B1 _ C9
        ret                                             ; 09B2 _ C3
; enable_mouse End of function

intHandlerFromMouse:; Function begin
        push    ebp                                     ; 09B3 _ 55
        mov     ebp, esp                                ; 09B4 _ 89. E5
        sub     esp, 24                                 ; 09B6 _ 83. EC, 18
        sub     esp, 8                                  ; 09B9 _ 83. EC, 08
        push    32                                      ; 09BC _ 6A, 20
        push    160                                     ; 09BE _ 68, 000000A0
        call    io_out8                                 ; 09C3 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 09C8 _ 83. C4, 10
        sub     esp, 8                                  ; 09CB _ 83. EC, 08
        push    32                                      ; 09CE _ 6A, 20
        push    32                                      ; 09D0 _ 6A, 20
        call    io_out8                                 ; 09D2 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 09D7 _ 83. C4, 10
        sub     esp, 12                                 ; 09DA _ 83. EC, 0C
        push    96                                      ; 09DD _ 6A, 60
        call    io_in8                                  ; 09DF _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 09E4 _ 83. C4, 10
        mov     byte [ebp-9H], al                       ; 09E7 _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 09EA _ 0F B6. 45, F7
        sub     esp, 8                                  ; 09EE _ 83. EC, 08
        push    eax                                     ; 09F1 _ 50
        push    mouseinfo                               ; 09F2 _ 68, 00000108(d)
        call    fifo8_put                               ; 09F7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 09FC _ 83. C4, 10
        nop                                             ; 09FF _ 90
        leave                                           ; 0A00 _ C9
        ret                                             ; 0A01 _ C3
; intHandlerFromMouse End of function

fifo8_init:; Function begin
        push    ebp                                     ; 0A02 _ 55
        mov     ebp, esp                                ; 0A03 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 0A05 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 0A08 _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 0A0B _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 0A0E _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 0A11 _ 8B. 55, 10
        mov     dword [eax], edx                        ; 0A14 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 0A16 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 0A19 _ 8B. 55, 0C
        mov     dword [eax+10H], edx                    ; 0A1C _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 0A1F _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 0A22 _ C7. 40, 14, 00000000
        mov     eax, dword [ebp+8H]                     ; 0A29 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 0A2C _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 0A33 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 0A36 _ C7. 40, 08, 00000000
        nop                                             ; 0A3D _ 90
        pop     ebp                                     ; 0A3E _ 5D
        ret                                             ; 0A3F _ C3
; fifo8_init End of function

fifo8_put:; Function begin
        push    ebp                                     ; 0A40 _ 55
        mov     ebp, esp                                ; 0A41 _ 89. E5
        sub     esp, 4                                  ; 0A43 _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 0A46 _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 0A49 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0A4C _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0A4F _ 8B. 40, 10
        test    eax, eax                                ; 0A52 _ 85. C0
        jnz     ?_037                                   ; 0A54 _ 75, 18
        mov     eax, dword [ebp+8H]                     ; 0A56 _ 8B. 45, 08
        mov     eax, dword [eax+14H]                    ; 0A59 _ 8B. 40, 14
        or      eax, 01H                                ; 0A5C _ 83. C8, 01
        mov     edx, eax                                ; 0A5F _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0A61 _ 8B. 45, 08
        mov     dword [eax+14H], edx                    ; 0A64 _ 89. 50, 14
        mov     eax, 4294967295                         ; 0A67 _ B8, FFFFFFFF
        jmp     ?_039                                   ; 0A6C _ EB, 50

?_037:  mov     eax, dword [ebp+8H]                     ; 0A6E _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 0A71 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 0A73 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0A76 _ 8B. 40, 04
        add     edx, eax                                ; 0A79 _ 01. C2
        movzx   eax, byte [ebp-4H]                      ; 0A7B _ 0F B6. 45, FC
        mov     byte [edx], al                          ; 0A7F _ 88. 02
        mov     eax, dword [ebp+8H]                     ; 0A81 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0A84 _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 0A87 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0A8A _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 0A8D _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0A90 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 0A93 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0A96 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0A99 _ 8B. 40, 0C
        cmp     edx, eax                                ; 0A9C _ 39. C2
        jnz     ?_038                                   ; 0A9E _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 0AA0 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 0AA3 _ C7. 40, 04, 00000000
?_038:  mov     eax, dword [ebp+8H]                     ; 0AAA _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0AAD _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 0AB0 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 0AB3 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 0AB6 _ 89. 50, 10
        mov     eax, 0                                  ; 0AB9 _ B8, 00000000
?_039:  leave                                           ; 0ABE _ C9
        ret                                             ; 0ABF _ C3
; fifo8_put End of function

fifo8_get:; Function begin
        push    ebp                                     ; 0AC0 _ 55
        mov     ebp, esp                                ; 0AC1 _ 89. E5
        sub     esp, 16                                 ; 0AC3 _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 0AC6 _ 8B. 45, 08
        mov     edx, dword [eax+10H]                    ; 0AC9 _ 8B. 50, 10
        mov     eax, dword [ebp+8H]                     ; 0ACC _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0ACF _ 8B. 40, 0C
        cmp     edx, eax                                ; 0AD2 _ 39. C2
        jnz     ?_040                                   ; 0AD4 _ 75, 07
        mov     eax, 4294967295                         ; 0AD6 _ B8, FFFFFFFF
        jmp     ?_042                                   ; 0ADB _ EB, 51

?_040:  mov     eax, dword [ebp+8H]                     ; 0ADD _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 0AE0 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 0AE2 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0AE5 _ 8B. 40, 08
        add     eax, edx                                ; 0AE8 _ 01. D0
        movzx   eax, byte [eax]                         ; 0AEA _ 0F B6. 00
        movzx   eax, al                                 ; 0AED _ 0F B6. C0
        mov     dword [ebp-4H], eax                     ; 0AF0 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0AF3 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0AF6 _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 0AF9 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0AFC _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0AFF _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 0B02 _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 0B05 _ 8B. 50, 08
        mov     eax, dword [ebp+8H]                     ; 0B08 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0B0B _ 8B. 40, 0C
        cmp     edx, eax                                ; 0B0E _ 39. C2
        jnz     ?_041                                   ; 0B10 _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 0B12 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 0B15 _ C7. 40, 08, 00000000
?_041:  mov     eax, dword [ebp+8H]                     ; 0B1C _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0B1F _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 0B22 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0B25 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 0B28 _ 89. 50, 10
        mov     eax, dword [ebp-4H]                     ; 0B2B _ 8B. 45, FC
?_042:  leave                                           ; 0B2E _ C9
        ret                                             ; 0B2F _ C3
; fifo8_get End of function

fifo8_status:; Function begin
        push    ebp                                     ; 0B30 _ 55
        mov     ebp, esp                                ; 0B31 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 0B33 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 0B36 _ 8B. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 0B39 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0B3C _ 8B. 40, 10
        sub     edx, eax                                ; 0B3F _ 29. C2
        mov     eax, edx                                ; 0B41 _ 89. D0
        pop     ebp                                     ; 0B43 _ 5D
        ret                                             ; 0B44 _ C3
; fifo8_status End of function



keyval:                                                 ; byte
        db 30H, 78H                                     ; 0000 _ 0x

?_043:  db 00H                                          ; 0002 _ .

?_044:  db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0003 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 000B _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0013 _ ........
        db 00H, 00H, 00H, 00H, 00H                      ; 001B _ .....

table_rgb.1533:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 00H, 0FFH     ; 0020 _ ........
        db 00H, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH   ; 0028 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0030 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0038 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 0040 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 0048 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0050 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0058 _ ........

cursor.1591:                                            ; byte
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

?_045:  resw    1                                       ; 0104

?_046:  resw    1                                       ; 0106

mouseinfo:                                              ; byte
        resb    24                                      ; 0108

keyinfo:                                                ; byte
        resb    32                                      ; 0120

mousebuf:                                               ; byte
        resb    128                                     ; 0140

keybuf:                                                 ; yword
        resb    32                                      ; 01C0

showPos.1523:                                           ; dword
        resd    1                                       ; 01E0

showPosMouse.1525:                                      ; dword
        resd    1                                       ; 01E4


