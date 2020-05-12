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
        mov     dword [ebp-1CH], eax                    ; 001C _ 89. 45, E4
        movzx   eax, word [?_059]                       ; 001F _ 0F B7. 05, 00000104(d)
        cwde                                            ; 0026 _ 98
        mov     dword [ebp-18H], eax                    ; 0027 _ 89. 45, E8
        movzx   eax, word [?_060]                       ; 002A _ 0F B7. 05, 00000106(d)
        cwde                                            ; 0031 _ 98
        mov     dword [ebp-14H], eax                    ; 0032 _ 89. 45, EC
        call    init_palette                            ; 0035 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 003A _ 8B. 45, EC
        lea     edx, [eax-1DH]                          ; 003D _ 8D. 50, E3
        mov     eax, dword [ebp-18H]                    ; 0040 _ 8B. 45, E8
        sub     eax, 1                                  ; 0043 _ 83. E8, 01
        sub     esp, 4                                  ; 0046 _ 83. EC, 04
        push    edx                                     ; 0049 _ 52
        push    eax                                     ; 004A _ 50
        push    0                                       ; 004B _ 6A, 00
        push    0                                       ; 004D _ 6A, 00
        push    14                                      ; 004F _ 6A, 0E
        push    dword [ebp-18H]                         ; 0051 _ FF. 75, E8
        push    dword [ebp-1CH]                         ; 0054 _ FF. 75, E4
        call    boxfill8                                ; 0057 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 005C _ 83. C4, 20
        mov     eax, dword [ebp-14H]                    ; 005F _ 8B. 45, EC
        lea     ecx, [eax-1CH]                          ; 0062 _ 8D. 48, E4
        mov     eax, dword [ebp-18H]                    ; 0065 _ 8B. 45, E8
        lea     edx, [eax-1H]                           ; 0068 _ 8D. 50, FF
        mov     eax, dword [ebp-14H]                    ; 006B _ 8B. 45, EC
        sub     eax, 28                                 ; 006E _ 83. E8, 1C
        sub     esp, 4                                  ; 0071 _ 83. EC, 04
        push    ecx                                     ; 0074 _ 51
        push    edx                                     ; 0075 _ 52
        push    eax                                     ; 0076 _ 50
        push    0                                       ; 0077 _ 6A, 00
        push    8                                       ; 0079 _ 6A, 08
        push    dword [ebp-18H]                         ; 007B _ FF. 75, E8
        push    dword [ebp-1CH]                         ; 007E _ FF. 75, E4
        call    boxfill8                                ; 0081 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0086 _ 83. C4, 20
        mov     eax, dword [ebp-14H]                    ; 0089 _ 8B. 45, EC
        lea     ecx, [eax-1BH]                          ; 008C _ 8D. 48, E5
        mov     eax, dword [ebp-18H]                    ; 008F _ 8B. 45, E8
        lea     edx, [eax-1H]                           ; 0092 _ 8D. 50, FF
        mov     eax, dword [ebp-14H]                    ; 0095 _ 8B. 45, EC
        sub     eax, 27                                 ; 0098 _ 83. E8, 1B
        sub     esp, 4                                  ; 009B _ 83. EC, 04
        push    ecx                                     ; 009E _ 51
        push    edx                                     ; 009F _ 52
        push    eax                                     ; 00A0 _ 50
        push    0                                       ; 00A1 _ 6A, 00
        push    7                                       ; 00A3 _ 6A, 07
        push    dword [ebp-18H]                         ; 00A5 _ FF. 75, E8
        push    dword [ebp-1CH]                         ; 00A8 _ FF. 75, E4
        call    boxfill8                                ; 00AB _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 00B0 _ 83. C4, 20
        mov     eax, dword [ebp-14H]                    ; 00B3 _ 8B. 45, EC
        lea     ecx, [eax-1H]                           ; 00B6 _ 8D. 48, FF
        mov     eax, dword [ebp-18H]                    ; 00B9 _ 8B. 45, E8
        lea     edx, [eax-1H]                           ; 00BC _ 8D. 50, FF
        mov     eax, dword [ebp-14H]                    ; 00BF _ 8B. 45, EC
        sub     eax, 26                                 ; 00C2 _ 83. E8, 1A
        sub     esp, 4                                  ; 00C5 _ 83. EC, 04
        push    ecx                                     ; 00C8 _ 51
        push    edx                                     ; 00C9 _ 52
        push    eax                                     ; 00CA _ 50
        push    0                                       ; 00CB _ 6A, 00
        push    8                                       ; 00CD _ 6A, 08
        push    dword [ebp-18H]                         ; 00CF _ FF. 75, E8
        push    dword [ebp-1CH]                         ; 00D2 _ FF. 75, E4
        call    boxfill8                                ; 00D5 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 00DA _ 83. C4, 20
        mov     eax, dword [ebp-14H]                    ; 00DD _ 8B. 45, EC
        lea     edx, [eax-18H]                          ; 00E0 _ 8D. 50, E8
        mov     eax, dword [ebp-14H]                    ; 00E3 _ 8B. 45, EC
        sub     eax, 24                                 ; 00E6 _ 83. E8, 18
        sub     esp, 4                                  ; 00E9 _ 83. EC, 04
        push    edx                                     ; 00EC _ 52
        push    59                                      ; 00ED _ 6A, 3B
        push    eax                                     ; 00EF _ 50
        push    3                                       ; 00F0 _ 6A, 03
        push    7                                       ; 00F2 _ 6A, 07
        push    dword [ebp-18H]                         ; 00F4 _ FF. 75, E8
        push    dword [ebp-1CH]                         ; 00F7 _ FF. 75, E4
        call    boxfill8                                ; 00FA _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 00FF _ 83. C4, 20
        mov     eax, dword [ebp-14H]                    ; 0102 _ 8B. 45, EC
        lea     edx, [eax-4H]                           ; 0105 _ 8D. 50, FC
        mov     eax, dword [ebp-14H]                    ; 0108 _ 8B. 45, EC
        sub     eax, 24                                 ; 010B _ 83. E8, 18
        sub     esp, 4                                  ; 010E _ 83. EC, 04
        push    edx                                     ; 0111 _ 52
        push    2                                       ; 0112 _ 6A, 02
        push    eax                                     ; 0114 _ 50
        push    2                                       ; 0115 _ 6A, 02
        push    7                                       ; 0117 _ 6A, 07
        push    dword [ebp-18H]                         ; 0119 _ FF. 75, E8
        push    dword [ebp-1CH]                         ; 011C _ FF. 75, E4
        call    boxfill8                                ; 011F _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0124 _ 83. C4, 20
        mov     eax, dword [ebp-14H]                    ; 0127 _ 8B. 45, EC
        lea     edx, [eax-4H]                           ; 012A _ 8D. 50, FC
        mov     eax, dword [ebp-14H]                    ; 012D _ 8B. 45, EC
        sub     eax, 4                                  ; 0130 _ 83. E8, 04
        sub     esp, 4                                  ; 0133 _ 83. EC, 04
        push    edx                                     ; 0136 _ 52
        push    59                                      ; 0137 _ 6A, 3B
        push    eax                                     ; 0139 _ 50
        push    3                                       ; 013A _ 6A, 03
        push    15                                      ; 013C _ 6A, 0F
        push    dword [ebp-18H]                         ; 013E _ FF. 75, E8
        push    dword [ebp-1CH]                         ; 0141 _ FF. 75, E4
        call    boxfill8                                ; 0144 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0149 _ 83. C4, 20
        mov     eax, dword [ebp-14H]                    ; 014C _ 8B. 45, EC
        lea     edx, [eax-5H]                           ; 014F _ 8D. 50, FB
        mov     eax, dword [ebp-14H]                    ; 0152 _ 8B. 45, EC
        sub     eax, 23                                 ; 0155 _ 83. E8, 17
        sub     esp, 4                                  ; 0158 _ 83. EC, 04
        push    edx                                     ; 015B _ 52
        push    59                                      ; 015C _ 6A, 3B
        push    eax                                     ; 015E _ 50
        push    59                                      ; 015F _ 6A, 3B
        push    15                                      ; 0161 _ 6A, 0F
        push    dword [ebp-18H]                         ; 0163 _ FF. 75, E8
        push    dword [ebp-1CH]                         ; 0166 _ FF. 75, E4
        call    boxfill8                                ; 0169 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 016E _ 83. C4, 20
        mov     eax, dword [ebp-14H]                    ; 0171 _ 8B. 45, EC
        lea     edx, [eax-3H]                           ; 0174 _ 8D. 50, FD
        mov     eax, dword [ebp-14H]                    ; 0177 _ 8B. 45, EC
        sub     eax, 3                                  ; 017A _ 83. E8, 03
        sub     esp, 4                                  ; 017D _ 83. EC, 04
        push    edx                                     ; 0180 _ 52
        push    59                                      ; 0181 _ 6A, 3B
        push    eax                                     ; 0183 _ 50
        push    2                                       ; 0184 _ 6A, 02
        push    0                                       ; 0186 _ 6A, 00
        push    dword [ebp-18H]                         ; 0188 _ FF. 75, E8
        push    dword [ebp-1CH]                         ; 018B _ FF. 75, E4
        call    boxfill8                                ; 018E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0193 _ 83. C4, 20
        mov     eax, dword [ebp-14H]                    ; 0196 _ 8B. 45, EC
        lea     edx, [eax-3H]                           ; 0199 _ 8D. 50, FD
        mov     eax, dword [ebp-14H]                    ; 019C _ 8B. 45, EC
        sub     eax, 24                                 ; 019F _ 83. E8, 18
        sub     esp, 4                                  ; 01A2 _ 83. EC, 04
        push    edx                                     ; 01A5 _ 52
        push    60                                      ; 01A6 _ 6A, 3C
        push    eax                                     ; 01A8 _ 50
        push    60                                      ; 01A9 _ 6A, 3C
        push    0                                       ; 01AB _ 6A, 00
        push    dword [ebp-18H]                         ; 01AD _ FF. 75, E8
        push    dword [ebp-1CH]                         ; 01B0 _ FF. 75, E4
        call    boxfill8                                ; 01B3 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 01B8 _ 83. C4, 20
        mov     eax, dword [ebp-14H]                    ; 01BB _ 8B. 45, EC
        lea     ebx, [eax-3H]                           ; 01BE _ 8D. 58, FD
        mov     eax, dword [ebp-18H]                    ; 01C1 _ 8B. 45, E8
        lea     ecx, [eax-4H]                           ; 01C4 _ 8D. 48, FC
        mov     eax, dword [ebp-14H]                    ; 01C7 _ 8B. 45, EC
        lea     edx, [eax-3H]                           ; 01CA _ 8D. 50, FD
        mov     eax, dword [ebp-18H]                    ; 01CD _ 8B. 45, E8
        sub     eax, 47                                 ; 01D0 _ 83. E8, 2F
        sub     esp, 4                                  ; 01D3 _ 83. EC, 04
        push    ebx                                     ; 01D6 _ 53
        push    ecx                                     ; 01D7 _ 51
        push    edx                                     ; 01D8 _ 52
        push    eax                                     ; 01D9 _ 50
        push    7                                       ; 01DA _ 6A, 07
        push    dword [ebp-18H]                         ; 01DC _ FF. 75, E8
        push    dword [ebp-1CH]                         ; 01DF _ FF. 75, E4
        call    boxfill8                                ; 01E2 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 01E7 _ 83. C4, 20
        mov     eax, dword [ebp-14H]                    ; 01EA _ 8B. 45, EC
        lea     ebx, [eax-4H]                           ; 01ED _ 8D. 58, FC
        mov     eax, dword [ebp-18H]                    ; 01F0 _ 8B. 45, E8
        lea     ecx, [eax-3H]                           ; 01F3 _ 8D. 48, FD
        mov     eax, dword [ebp-14H]                    ; 01F6 _ 8B. 45, EC
        lea     edx, [eax-18H]                          ; 01F9 _ 8D. 50, E8
        mov     eax, dword [ebp-18H]                    ; 01FC _ 8B. 45, E8
        sub     eax, 3                                  ; 01FF _ 83. E8, 03
        sub     esp, 4                                  ; 0202 _ 83. EC, 04
        push    ebx                                     ; 0205 _ 53
        push    ecx                                     ; 0206 _ 51
        push    edx                                     ; 0207 _ 52
        push    eax                                     ; 0208 _ 50
        push    7                                       ; 0209 _ 6A, 07
        push    dword [ebp-18H]                         ; 020B _ FF. 75, E8
        push    dword [ebp-1CH]                         ; 020E _ FF. 75, E4
        call    boxfill8                                ; 0211 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0216 _ 83. C4, 20
        mov     eax, dword [ebp-14H]                    ; 0219 _ 8B. 45, EC
        lea     ebx, [eax-18H]                          ; 021C _ 8D. 58, E8
        mov     eax, dword [ebp-18H]                    ; 021F _ 8B. 45, E8
        lea     ecx, [eax-4H]                           ; 0222 _ 8D. 48, FC
        mov     eax, dword [ebp-14H]                    ; 0225 _ 8B. 45, EC
        lea     edx, [eax-18H]                          ; 0228 _ 8D. 50, E8
        mov     eax, dword [ebp-18H]                    ; 022B _ 8B. 45, E8
        sub     eax, 47                                 ; 022E _ 83. E8, 2F
        sub     esp, 4                                  ; 0231 _ 83. EC, 04
        push    ebx                                     ; 0234 _ 53
        push    ecx                                     ; 0235 _ 51
        push    edx                                     ; 0236 _ 52
        push    eax                                     ; 0237 _ 50
        push    15                                      ; 0238 _ 6A, 0F
        push    dword [ebp-18H]                         ; 023A _ FF. 75, E8
        push    dword [ebp-1CH]                         ; 023D _ FF. 75, E4
        call    boxfill8                                ; 0240 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0245 _ 83. C4, 20
        mov     eax, dword [ebp-14H]                    ; 0248 _ 8B. 45, EC
        lea     ebx, [eax-4H]                           ; 024B _ 8D. 58, FC
        mov     eax, dword [ebp-18H]                    ; 024E _ 8B. 45, E8
        lea     ecx, [eax-2FH]                          ; 0251 _ 8D. 48, D1
        mov     eax, dword [ebp-14H]                    ; 0254 _ 8B. 45, EC
        lea     edx, [eax-17H]                          ; 0257 _ 8D. 50, E9
        mov     eax, dword [ebp-18H]                    ; 025A _ 8B. 45, E8
        sub     eax, 47                                 ; 025D _ 83. E8, 2F
        sub     esp, 4                                  ; 0260 _ 83. EC, 04
        push    ebx                                     ; 0263 _ 53
        push    ecx                                     ; 0264 _ 51
        push    edx                                     ; 0265 _ 52
        push    eax                                     ; 0266 _ 50
        push    15                                      ; 0267 _ 6A, 0F
        push    dword [ebp-18H]                         ; 0269 _ FF. 75, E8
        push    dword [ebp-1CH]                         ; 026C _ FF. 75, E4
        call    boxfill8                                ; 026F _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0274 _ 83. C4, 20
        mov     eax, dword [ebp-18H]                    ; 0277 _ 8B. 45, E8
        sub     eax, 16                                 ; 027A _ 83. E8, 10
        mov     edx, eax                                ; 027D _ 89. C2
        shr     edx, 31                                 ; 027F _ C1. EA, 1F
        add     eax, edx                                ; 0282 _ 01. D0
        sar     eax, 1                                  ; 0284 _ D1. F8
        mov     dword [mx], eax                         ; 0286 _ A3, 000001F0(d)
        mov     eax, dword [ebp-14H]                    ; 028B _ 8B. 45, EC
        sub     eax, 44                                 ; 028E _ 83. E8, 2C
        mov     edx, eax                                ; 0291 _ 89. C2
        shr     edx, 31                                 ; 0293 _ C1. EA, 1F
        add     eax, edx                                ; 0296 _ 01. D0
        sar     eax, 1                                  ; 0298 _ D1. F8
        mov     dword [mx], eax                         ; 029A _ A3, 000001F0(d)
        sub     esp, 8                                  ; 029F _ 83. EC, 08
        push    14                                      ; 02A2 _ 6A, 0E
        push    mcursor                                 ; 02A4 _ 68, 00000000(d)
        call    init_mouse_cursor                       ; 02A9 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 02AE _ 83. C4, 10
        mov     edx, dword [my]                         ; 02B1 _ 8B. 15, 000001F4(d)
        mov     eax, dword [mx]                         ; 02B7 _ A1, 000001F0(d)
        push    16                                      ; 02BC _ 6A, 10
        push    mcursor                                 ; 02BE _ 68, 00000000(d)
        push    edx                                     ; 02C3 _ 52
        push    eax                                     ; 02C4 _ 50
        push    16                                      ; 02C5 _ 6A, 10
        push    16                                      ; 02C7 _ 6A, 10
        push    dword [ebp-18H]                         ; 02C9 _ FF. 75, E8
        push    dword [ebp-1CH]                         ; 02CC _ FF. 75, E4
        call    putblock                                ; 02CF _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 02D4 _ 83. C4, 20
        sub     esp, 4                                  ; 02D7 _ 83. EC, 04
        push    mousebuf                                ; 02DA _ 68, 00000140(d)
        push    128                                     ; 02DF _ 68, 00000080
        push    mouseinfo                               ; 02E4 _ 68, 00000108(d)
        call    fifo8_init                              ; 02E9 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 02EE _ 83. C4, 10
        sub     esp, 4                                  ; 02F1 _ 83. EC, 04
        push    keybuf                                  ; 02F4 _ 68, 000001C0(d)
        push    32                                      ; 02F9 _ 6A, 20
        push    keyinfo                                 ; 02FB _ 68, 00000120(d)
        call    fifo8_init                              ; 0300 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0305 _ 83. C4, 10
        call    init_keyboard                           ; 0308 _ E8, FFFFFFFC(rel)
        call    enable_mouse                            ; 030D _ E8, FFFFFFFC(rel)
        call    io_sti                                  ; 0312 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], 0                      ; 0317 _ C7. 45, F0, 00000000
?_001:  sub     esp, 12                                 ; 031E _ 83. EC, 0C
        push    keyinfo                                 ; 0321 _ 68, 00000120(d)
        call    fifo8_status                            ; 0326 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 032B _ 83. C4, 10
        mov     ebx, eax                                ; 032E _ 89. C3
        sub     esp, 12                                 ; 0330 _ 83. EC, 0C
        push    mouseinfo                               ; 0333 _ 68, 00000108(d)
        call    fifo8_status                            ; 0338 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 033D _ 83. C4, 10
        add     eax, ebx                                ; 0340 _ 01. D8
        test    eax, eax                                ; 0342 _ 85. C0
        jnz     ?_002                                   ; 0344 _ 75, 07
        call    io_hlt                                  ; 0346 _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 034B _ EB, D1
; CMain End of function

?_002:  ; Local function
        sub     esp, 12                                 ; 034D _ 83. EC, 0C
        push    keyinfo                                 ; 0350 _ 68, 00000120(d)
        call    fifo8_status                            ; 0355 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 035A _ 83. C4, 10
        test    eax, eax                                ; 035D _ 85. C0
        jz      ?_003                                   ; 035F _ 74, 58
        sub     esp, 12                                 ; 0361 _ 83. EC, 0C
        push    keyinfo                                 ; 0364 _ 68, 00000120(d)
        call    fifo8_get                               ; 0369 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 036E _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 0371 _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 0374 _ 8B. 45, F0
        movzx   eax, al                                 ; 0377 _ 0F B6. C0
        sub     esp, 12                                 ; 037A _ 83. EC, 0C
        push    eax                                     ; 037D _ 50
        call    charToHexStr                            ; 037E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0383 _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 0386 _ 89. 45, F4
        mov     eax, dword [showPos.1543]               ; 0389 _ A1, 000001F8(d)
        sub     esp, 8                                  ; 038E _ 83. EC, 08
        push    dword [ebp-0CH]                         ; 0391 _ FF. 75, F4
        push    7                                       ; 0394 _ 6A, 07
        push    0                                       ; 0396 _ 6A, 00
        push    eax                                     ; 0398 _ 50
        push    dword [ebp-18H]                         ; 0399 _ FF. 75, E8
        push    dword [ebp-1CH]                         ; 039C _ FF. 75, E4
        call    showString                              ; 039F _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 03A4 _ 83. C4, 20
        mov     eax, dword [showPos.1543]               ; 03A7 _ A1, 000001F8(d)
        add     eax, 32                                 ; 03AC _ 83. C0, 20
        mov     dword [showPos.1543], eax               ; 03AF _ A3, 000001F8(d)
        jmp     ?_001                                   ; 03B4 _ E9, FFFFFF65

?_003:  ; Local function
        sub     esp, 12                                 ; 03B9 _ 83. EC, 0C
        push    mouseinfo                               ; 03BC _ 68, 00000108(d)
        call    fifo8_status                            ; 03C1 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03C6 _ 83. C4, 10
        test    eax, eax                                ; 03C9 _ 85. C0
        je      ?_001                                   ; 03CB _ 0F 84, FFFFFF4D
        call    show_mouse_info                         ; 03D1 _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 03D6 _ E9, FFFFFF43

initBootInfo:; Function begin
        push    ebp                                     ; 03DB _ 55
        mov     ebp, esp                                ; 03DC _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 03DE _ 8B. 45, 08
        mov     dword [eax], 655360                     ; 03E1 _ C7. 00, 000A0000
        mov     eax, dword [ebp+8H]                     ; 03E7 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 320                      ; 03EA _ 66: C7. 40, 04, 0140
        mov     eax, dword [ebp+8H]                     ; 03F0 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 200                      ; 03F3 _ 66: C7. 40, 06, 00C8
        nop                                             ; 03F9 _ 90
        pop     ebp                                     ; 03FA _ 5D
        ret                                             ; 03FB _ C3
; initBootInfo End of function

init_palette:; Function begin
        push    ebp                                     ; 03FC _ 55
        mov     ebp, esp                                ; 03FD _ 89. E5
        sub     esp, 8                                  ; 03FF _ 83. EC, 08
        sub     esp, 4                                  ; 0402 _ 83. EC, 04
        push    table_rgb.1551                          ; 0405 _ 68, 00000020(d)
        push    15                                      ; 040A _ 6A, 0F
        push    0                                       ; 040C _ 6A, 00
        call    set_palette                             ; 040E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0413 _ 83. C4, 10
        nop                                             ; 0416 _ 90
        leave                                           ; 0417 _ C9
        ret                                             ; 0418 _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 0419 _ 55
        mov     ebp, esp                                ; 041A _ 89. E5
        sub     esp, 24                                 ; 041C _ 83. EC, 18
        call    io_load_eflags                          ; 041F _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 0424 _ 89. 45, F4
        call    io_cli                                  ; 0427 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 042C _ 83. EC, 08
        push    dword [ebp+8H]                          ; 042F _ FF. 75, 08
        push    968                                     ; 0432 _ 68, 000003C8
        call    io_out8                                 ; 0437 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 043C _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 043F _ 8B. 45, 08
        mov     dword [ebp-10H], eax                    ; 0442 _ 89. 45, F0
        jmp     ?_005                                   ; 0445 _ EB, 65

?_004:  mov     eax, dword [ebp+10H]                    ; 0447 _ 8B. 45, 10
        movzx   eax, byte [eax]                         ; 044A _ 0F B6. 00
        shr     al, 2                                   ; 044D _ C0. E8, 02
        movzx   eax, al                                 ; 0450 _ 0F B6. C0
        sub     esp, 8                                  ; 0453 _ 83. EC, 08
        push    eax                                     ; 0456 _ 50
        push    969                                     ; 0457 _ 68, 000003C9
        call    io_out8                                 ; 045C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0461 _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 0464 _ 8B. 45, 10
        add     eax, 1                                  ; 0467 _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 046A _ 0F B6. 00
        shr     al, 2                                   ; 046D _ C0. E8, 02
        movzx   eax, al                                 ; 0470 _ 0F B6. C0
        sub     esp, 8                                  ; 0473 _ 83. EC, 08
        push    eax                                     ; 0476 _ 50
        push    969                                     ; 0477 _ 68, 000003C9
        call    io_out8                                 ; 047C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0481 _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 0484 _ 8B. 45, 10
        add     eax, 2                                  ; 0487 _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 048A _ 0F B6. 00
        shr     al, 2                                   ; 048D _ C0. E8, 02
        movzx   eax, al                                 ; 0490 _ 0F B6. C0
        sub     esp, 8                                  ; 0493 _ 83. EC, 08
        push    eax                                     ; 0496 _ 50
        push    969                                     ; 0497 _ 68, 000003C9
        call    io_out8                                 ; 049C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 04A1 _ 83. C4, 10
        add     dword [ebp+10H], 3                      ; 04A4 _ 83. 45, 10, 03
        add     dword [ebp-10H], 1                      ; 04A8 _ 83. 45, F0, 01
?_005:  mov     eax, dword [ebp-10H]                    ; 04AC _ 8B. 45, F0
        cmp     eax, dword [ebp+0CH]                    ; 04AF _ 3B. 45, 0C
        jle     ?_004                                   ; 04B2 _ 7E, 93
        sub     esp, 12                                 ; 04B4 _ 83. EC, 0C
        push    dword [ebp-0CH]                         ; 04B7 _ FF. 75, F4
        call    io_store_eflags                         ; 04BA _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 04BF _ 83. C4, 10
        nop                                             ; 04C2 _ 90
        leave                                           ; 04C3 _ C9
        ret                                             ; 04C4 _ C3
; set_palette End of function

boxfill8:; Function begin
        push    ebp                                     ; 04C5 _ 55
        mov     ebp, esp                                ; 04C6 _ 89. E5
        sub     esp, 20                                 ; 04C8 _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 04CB _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 04CE _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 04D1 _ 8B. 45, 18
        mov     dword [ebp-4H], eax                     ; 04D4 _ 89. 45, FC
        jmp     ?_009                                   ; 04D7 _ EB, 33

?_006:  mov     eax, dword [ebp+14H]                    ; 04D9 _ 8B. 45, 14
        mov     dword [ebp-8H], eax                     ; 04DC _ 89. 45, F8
        jmp     ?_008                                   ; 04DF _ EB, 1F

?_007:  mov     eax, dword [ebp-4H]                     ; 04E1 _ 8B. 45, FC
        imul    eax, dword [ebp+0CH]                    ; 04E4 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 04E8 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 04EA _ 8B. 45, F8
        add     eax, edx                                ; 04ED _ 01. D0
        mov     edx, eax                                ; 04EF _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 04F1 _ 8B. 45, 08
        add     edx, eax                                ; 04F4 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 04F6 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 04FA _ 88. 02
        add     dword [ebp-8H], 1                       ; 04FC _ 83. 45, F8, 01
?_008:  mov     eax, dword [ebp-8H]                     ; 0500 _ 8B. 45, F8
        cmp     eax, dword [ebp+1CH]                    ; 0503 _ 3B. 45, 1C
        jle     ?_007                                   ; 0506 _ 7E, D9
        add     dword [ebp-4H], 1                       ; 0508 _ 83. 45, FC, 01
?_009:  mov     eax, dword [ebp-4H]                     ; 050C _ 8B. 45, FC
        cmp     eax, dword [ebp+20H]                    ; 050F _ 3B. 45, 20
        jle     ?_006                                   ; 0512 _ 7E, C5
        nop                                             ; 0514 _ 90
        leave                                           ; 0515 _ C9
        ret                                             ; 0516 _ C3
; boxfill8 End of function

showString:; Function begin
        push    ebp                                     ; 0517 _ 55
        mov     ebp, esp                                ; 0518 _ 89. E5
        sub     esp, 24                                 ; 051A _ 83. EC, 18
        mov     eax, dword [ebp+18H]                    ; 051D _ 8B. 45, 18
        mov     byte [ebp-0CH], al                      ; 0520 _ 88. 45, F4
        jmp     ?_011                                   ; 0523 _ EB, 37

?_010:  mov     eax, dword [ebp+1CH]                    ; 0525 _ 8B. 45, 1C
        movzx   eax, byte [eax]                         ; 0528 _ 0F B6. 00
        movzx   eax, al                                 ; 052B _ 0F B6. C0
        shl     eax, 4                                  ; 052E _ C1. E0, 04
        lea     edx, [systemFont+eax]                   ; 0531 _ 8D. 90, 00000000(d)
        movsx   eax, byte [ebp-0CH]                     ; 0537 _ 0F BE. 45, F4
        sub     esp, 8                                  ; 053B _ 83. EC, 08
        push    edx                                     ; 053E _ 52
        push    eax                                     ; 053F _ 50
        push    dword [ebp+14H]                         ; 0540 _ FF. 75, 14
        push    dword [ebp+10H]                         ; 0543 _ FF. 75, 10
        push    dword [ebp+0CH]                         ; 0546 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0549 _ FF. 75, 08
        call    showChar8                               ; 054C _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0551 _ 83. C4, 20
        add     dword [ebp+1CH], 1                      ; 0554 _ 83. 45, 1C, 01
        add     dword [ebp+10H], 8                      ; 0558 _ 83. 45, 10, 08
?_011:  mov     eax, dword [ebp+1CH]                    ; 055C _ 8B. 45, 1C
        movzx   eax, byte [eax]                         ; 055F _ 0F B6. 00
        test    al, al                                  ; 0562 _ 84. C0
        jnz     ?_010                                   ; 0564 _ 75, BF
        nop                                             ; 0566 _ 90
        leave                                           ; 0567 _ C9
        ret                                             ; 0568 _ C3
; showString End of function

showChar8:; Function begin
        push    ebp                                     ; 0569 _ 55
        mov     ebp, esp                                ; 056A _ 89. E5
        sub     esp, 20                                 ; 056C _ 83. EC, 14
        mov     eax, dword [ebp+18H]                    ; 056F _ 8B. 45, 18
        mov     byte [ebp-14H], al                      ; 0572 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 0575 _ C7. 45, FC, 00000000
        jmp     ?_021                                   ; 057C _ E9, 0000016C

?_012:  mov     edx, dword [ebp-4H]                     ; 0581 _ 8B. 55, FC
        mov     eax, dword [ebp+1CH]                    ; 0584 _ 8B. 45, 1C
        add     eax, edx                                ; 0587 _ 01. D0
        movzx   eax, byte [eax]                         ; 0589 _ 0F B6. 00
        mov     byte [ebp-5H], al                       ; 058C _ 88. 45, FB
        cmp     byte [ebp-5H], 0                        ; 058F _ 80. 7D, FB, 00
        jns     ?_013                                   ; 0593 _ 79, 20
        mov     edx, dword [ebp+14H]                    ; 0595 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0598 _ 8B. 45, FC
        add     eax, edx                                ; 059B _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 059D _ 0F AF. 45, 0C
        mov     edx, eax                                ; 05A1 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 05A3 _ 8B. 45, 10
        add     eax, edx                                ; 05A6 _ 01. D0
        mov     edx, eax                                ; 05A8 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 05AA _ 8B. 45, 08
        add     edx, eax                                ; 05AD _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 05AF _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 05B3 _ 88. 02
?_013:  movsx   eax, byte [ebp-5H]                      ; 05B5 _ 0F BE. 45, FB
        and     eax, 40H                                ; 05B9 _ 83. E0, 40
        test    eax, eax                                ; 05BC _ 85. C0
        jz      ?_014                                   ; 05BE _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 05C0 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 05C3 _ 8B. 45, FC
        add     eax, edx                                ; 05C6 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 05C8 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 05CC _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 05CE _ 8B. 45, 10
        add     eax, edx                                ; 05D1 _ 01. D0
        lea     edx, [eax+1H]                           ; 05D3 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 05D6 _ 8B. 45, 08
        add     edx, eax                                ; 05D9 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 05DB _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 05DF _ 88. 02
?_014:  movsx   eax, byte [ebp-5H]                      ; 05E1 _ 0F BE. 45, FB
        and     eax, 20H                                ; 05E5 _ 83. E0, 20
        test    eax, eax                                ; 05E8 _ 85. C0
        jz      ?_015                                   ; 05EA _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 05EC _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 05EF _ 8B. 45, FC
        add     eax, edx                                ; 05F2 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 05F4 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 05F8 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 05FA _ 8B. 45, 10
        add     eax, edx                                ; 05FD _ 01. D0
        lea     edx, [eax+2H]                           ; 05FF _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 0602 _ 8B. 45, 08
        add     edx, eax                                ; 0605 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0607 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 060B _ 88. 02
?_015:  movsx   eax, byte [ebp-5H]                      ; 060D _ 0F BE. 45, FB
        and     eax, 10H                                ; 0611 _ 83. E0, 10
        test    eax, eax                                ; 0614 _ 85. C0
        jz      ?_016                                   ; 0616 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 0618 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 061B _ 8B. 45, FC
        add     eax, edx                                ; 061E _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0620 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0624 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0626 _ 8B. 45, 10
        add     eax, edx                                ; 0629 _ 01. D0
        lea     edx, [eax+3H]                           ; 062B _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 062E _ 8B. 45, 08
        add     edx, eax                                ; 0631 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0633 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0637 _ 88. 02
?_016:  movsx   eax, byte [ebp-5H]                      ; 0639 _ 0F BE. 45, FB
        and     eax, 08H                                ; 063D _ 83. E0, 08
        test    eax, eax                                ; 0640 _ 85. C0
        jz      ?_017                                   ; 0642 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 0644 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0647 _ 8B. 45, FC
        add     eax, edx                                ; 064A _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 064C _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0650 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0652 _ 8B. 45, 10
        add     eax, edx                                ; 0655 _ 01. D0
        lea     edx, [eax+4H]                           ; 0657 _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 065A _ 8B. 45, 08
        add     edx, eax                                ; 065D _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 065F _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0663 _ 88. 02
?_017:  movsx   eax, byte [ebp-5H]                      ; 0665 _ 0F BE. 45, FB
        and     eax, 04H                                ; 0669 _ 83. E0, 04
        test    eax, eax                                ; 066C _ 85. C0
        jz      ?_018                                   ; 066E _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 0670 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0673 _ 8B. 45, FC
        add     eax, edx                                ; 0676 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0678 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 067C _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 067E _ 8B. 45, 10
        add     eax, edx                                ; 0681 _ 01. D0
        lea     edx, [eax+5H]                           ; 0683 _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 0686 _ 8B. 45, 08
        add     edx, eax                                ; 0689 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 068B _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 068F _ 88. 02
?_018:  movsx   eax, byte [ebp-5H]                      ; 0691 _ 0F BE. 45, FB
        and     eax, 02H                                ; 0695 _ 83. E0, 02
        test    eax, eax                                ; 0698 _ 85. C0
        jz      ?_019                                   ; 069A _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 069C _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 069F _ 8B. 45, FC
        add     eax, edx                                ; 06A2 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 06A4 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 06A8 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 06AA _ 8B. 45, 10
        add     eax, edx                                ; 06AD _ 01. D0
        lea     edx, [eax+6H]                           ; 06AF _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 06B2 _ 8B. 45, 08
        add     edx, eax                                ; 06B5 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 06B7 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 06BB _ 88. 02
?_019:  movsx   eax, byte [ebp-5H]                      ; 06BD _ 0F BE. 45, FB
        and     eax, 01H                                ; 06C1 _ 83. E0, 01
        test    eax, eax                                ; 06C4 _ 85. C0
        jz      ?_020                                   ; 06C6 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 06C8 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 06CB _ 8B. 45, FC
        add     eax, edx                                ; 06CE _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 06D0 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 06D4 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 06D6 _ 8B. 45, 10
        add     eax, edx                                ; 06D9 _ 01. D0
        lea     edx, [eax+7H]                           ; 06DB _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 06DE _ 8B. 45, 08
        add     edx, eax                                ; 06E1 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 06E3 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 06E7 _ 88. 02
?_020:  add     dword [ebp-4H], 1                       ; 06E9 _ 83. 45, FC, 01
?_021:  cmp     dword [ebp-4H], 15                      ; 06ED _ 83. 7D, FC, 0F
        jle     ?_012                                   ; 06F1 _ 0F 8E, FFFFFE8A
        nop                                             ; 06F7 _ 90
        leave                                           ; 06F8 _ C9
        ret                                             ; 06F9 _ C3
; showChar8 End of function

init_mouse_cursor:; Function begin
        push    ebp                                     ; 06FA _ 55
        mov     ebp, esp                                ; 06FB _ 89. E5
        sub     esp, 20                                 ; 06FD _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 0700 _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 0703 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 0706 _ C7. 45, FC, 00000000
        jmp     ?_028                                   ; 070D _ E9, 000000B5

?_022:  mov     dword [ebp-8H], 0                       ; 0712 _ C7. 45, F8, 00000000
        jmp     ?_027                                   ; 0719 _ E9, 0000009B

?_023:  mov     eax, dword [ebp-4H]                     ; 071E _ 8B. 45, FC
        shl     eax, 4                                  ; 0721 _ C1. E0, 04
        mov     edx, eax                                ; 0724 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0726 _ 8B. 45, F8
        add     eax, edx                                ; 0729 _ 01. D0
        add     eax, cursor.1609                        ; 072B _ 05, 00000060(d)
        movzx   eax, byte [eax]                         ; 0730 _ 0F B6. 00
        cmp     al, 42                                  ; 0733 _ 3C, 2A
        jnz     ?_024                                   ; 0735 _ 75, 19
        mov     eax, dword [ebp-4H]                     ; 0737 _ 8B. 45, FC
        shl     eax, 4                                  ; 073A _ C1. E0, 04
        mov     edx, eax                                ; 073D _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 073F _ 8B. 45, F8
        add     eax, edx                                ; 0742 _ 01. D0
        mov     edx, eax                                ; 0744 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0746 _ 8B. 45, 08
        add     eax, edx                                ; 0749 _ 01. D0
        mov     byte [eax], 0                           ; 074B _ C6. 00, 00
        jmp     ?_026                                   ; 074E _ EB, 65

?_024:  mov     eax, dword [ebp-4H]                     ; 0750 _ 8B. 45, FC
        shl     eax, 4                                  ; 0753 _ C1. E0, 04
        mov     edx, eax                                ; 0756 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0758 _ 8B. 45, F8
        add     eax, edx                                ; 075B _ 01. D0
        add     eax, cursor.1609                        ; 075D _ 05, 00000060(d)
        movzx   eax, byte [eax]                         ; 0762 _ 0F B6. 00
        cmp     al, 79                                  ; 0765 _ 3C, 4F
        jnz     ?_025                                   ; 0767 _ 75, 19
        mov     eax, dword [ebp-4H]                     ; 0769 _ 8B. 45, FC
        shl     eax, 4                                  ; 076C _ C1. E0, 04
        mov     edx, eax                                ; 076F _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0771 _ 8B. 45, F8
        add     eax, edx                                ; 0774 _ 01. D0
        mov     edx, eax                                ; 0776 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0778 _ 8B. 45, 08
        add     eax, edx                                ; 077B _ 01. D0
        mov     byte [eax], 7                           ; 077D _ C6. 00, 07
        jmp     ?_026                                   ; 0780 _ EB, 33

?_025:  mov     eax, dword [ebp-4H]                     ; 0782 _ 8B. 45, FC
        shl     eax, 4                                  ; 0785 _ C1. E0, 04
        mov     edx, eax                                ; 0788 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 078A _ 8B. 45, F8
        add     eax, edx                                ; 078D _ 01. D0
        add     eax, cursor.1609                        ; 078F _ 05, 00000060(d)
        movzx   eax, byte [eax]                         ; 0794 _ 0F B6. 00
        cmp     al, 46                                  ; 0797 _ 3C, 2E
        jnz     ?_026                                   ; 0799 _ 75, 1A
        mov     eax, dword [ebp-4H]                     ; 079B _ 8B. 45, FC
        shl     eax, 4                                  ; 079E _ C1. E0, 04
        mov     edx, eax                                ; 07A1 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 07A3 _ 8B. 45, F8
        add     eax, edx                                ; 07A6 _ 01. D0
        mov     edx, eax                                ; 07A8 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 07AA _ 8B. 45, 08
        add     edx, eax                                ; 07AD _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 07AF _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 07B3 _ 88. 02
?_026:  add     dword [ebp-8H], 1                       ; 07B5 _ 83. 45, F8, 01
?_027:  cmp     dword [ebp-8H], 15                      ; 07B9 _ 83. 7D, F8, 0F
        jle     ?_023                                   ; 07BD _ 0F 8E, FFFFFF5B
        add     dword [ebp-4H], 1                       ; 07C3 _ 83. 45, FC, 01
?_028:  cmp     dword [ebp-4H], 15                      ; 07C7 _ 83. 7D, FC, 0F
        jle     ?_022                                   ; 07CB _ 0F 8E, FFFFFF41
        nop                                             ; 07D1 _ 90
        leave                                           ; 07D2 _ C9
        ret                                             ; 07D3 _ C3
; init_mouse_cursor End of function

putblock:; Function begin
        push    ebp                                     ; 07D4 _ 55
        mov     ebp, esp                                ; 07D5 _ 89. E5
        push    ebx                                     ; 07D7 _ 53
        sub     esp, 16                                 ; 07D8 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 07DB _ C7. 45, F8, 00000000
        jmp     ?_032                                   ; 07E2 _ EB, 50

?_029:  mov     dword [ebp-0CH], 0                      ; 07E4 _ C7. 45, F4, 00000000
        jmp     ?_031                                   ; 07EB _ EB, 3B

?_030:  mov     eax, dword [ebp-8H]                     ; 07ED _ 8B. 45, F8
        imul    eax, dword [ebp+24H]                    ; 07F0 _ 0F AF. 45, 24
        mov     edx, eax                                ; 07F4 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 07F6 _ 8B. 45, F4
        add     eax, edx                                ; 07F9 _ 01. D0
        mov     edx, eax                                ; 07FB _ 89. C2
        mov     eax, dword [ebp+20H]                    ; 07FD _ 8B. 45, 20
        add     eax, edx                                ; 0800 _ 01. D0
        mov     ecx, dword [ebp+1CH]                    ; 0802 _ 8B. 4D, 1C
        mov     edx, dword [ebp-8H]                     ; 0805 _ 8B. 55, F8
        add     edx, ecx                                ; 0808 _ 01. CA
        imul    edx, dword [ebp+0CH]                    ; 080A _ 0F AF. 55, 0C
        mov     ebx, dword [ebp+18H]                    ; 080E _ 8B. 5D, 18
        mov     ecx, dword [ebp-0CH]                    ; 0811 _ 8B. 4D, F4
        add     ecx, ebx                                ; 0814 _ 01. D9
        add     edx, ecx                                ; 0816 _ 01. CA
        mov     ecx, edx                                ; 0818 _ 89. D1
        mov     edx, dword [ebp+8H]                     ; 081A _ 8B. 55, 08
        add     edx, ecx                                ; 081D _ 01. CA
        movzx   eax, byte [eax]                         ; 081F _ 0F B6. 00
        mov     byte [edx], al                          ; 0822 _ 88. 02
        add     dword [ebp-0CH], 1                      ; 0824 _ 83. 45, F4, 01
?_031:  mov     eax, dword [ebp-0CH]                    ; 0828 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 082B _ 3B. 45, 10
        jl      ?_030                                   ; 082E _ 7C, BD
        add     dword [ebp-8H], 1                       ; 0830 _ 83. 45, F8, 01
?_032:  mov     eax, dword [ebp-8H]                     ; 0834 _ 8B. 45, F8
        cmp     eax, dword [ebp+14H]                    ; 0837 _ 3B. 45, 14
        jl      ?_029                                   ; 083A _ 7C, A8
        nop                                             ; 083C _ 90
        add     esp, 16                                 ; 083D _ 83. C4, 10
        pop     ebx                                     ; 0840 _ 5B
        pop     ebp                                     ; 0841 _ 5D
        ret                                             ; 0842 _ C3
; putblock End of function

intHandlerFromC:; Function begin
        push    ebp                                     ; 0843 _ 55
        mov     ebp, esp                                ; 0844 _ 89. E5
        sub     esp, 24                                 ; 0846 _ 83. EC, 18
        mov     eax, dword [bootInfo]                   ; 0849 _ A1, 00000100(d)
        mov     dword [ebp-14H], eax                    ; 084E _ 89. 45, EC
        movzx   eax, word [?_059]                       ; 0851 _ 0F B7. 05, 00000104(d)
        cwde                                            ; 0858 _ 98
        mov     dword [ebp-10H], eax                    ; 0859 _ 89. 45, F0
        movzx   eax, word [?_060]                       ; 085C _ 0F B7. 05, 00000106(d)
        cwde                                            ; 0863 _ 98
        mov     dword [ebp-0CH], eax                    ; 0864 _ 89. 45, F4
        sub     esp, 8                                  ; 0867 _ 83. EC, 08
        push    33                                      ; 086A _ 6A, 21
        push    32                                      ; 086C _ 6A, 20
        call    io_out8                                 ; 086E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0873 _ 83. C4, 10
        mov     byte [ebp-15H], 0                       ; 0876 _ C6. 45, EB, 00
        sub     esp, 12                                 ; 087A _ 83. EC, 0C
        push    96                                      ; 087D _ 6A, 60
        call    io_in8                                  ; 087F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0884 _ 83. C4, 10
        mov     byte [ebp-15H], al                      ; 0887 _ 88. 45, EB
        movzx   eax, byte [ebp-15H]                     ; 088A _ 0F B6. 45, EB
        sub     esp, 8                                  ; 088E _ 83. EC, 08
        push    eax                                     ; 0891 _ 50
        push    keyinfo                                 ; 0892 _ 68, 00000120(d)
        call    fifo8_put                               ; 0897 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 089C _ 83. C4, 10
        nop                                             ; 089F _ 90
        leave                                           ; 08A0 _ C9
        ret                                             ; 08A1 _ C3
; intHandlerFromC End of function

charToHexVal:; Function begin
        push    ebp                                     ; 08A2 _ 55
        mov     ebp, esp                                ; 08A3 _ 89. E5
        sub     esp, 4                                  ; 08A5 _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 08A8 _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 08AB _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 08AE _ 80. 7D, FC, 09
        jle     ?_033                                   ; 08B2 _ 7E, 09
        movzx   eax, byte [ebp-4H]                      ; 08B4 _ 0F B6. 45, FC
        add     eax, 55                                 ; 08B8 _ 83. C0, 37
        jmp     ?_034                                   ; 08BB _ EB, 07

?_033:  movzx   eax, byte [ebp-4H]                      ; 08BD _ 0F B6. 45, FC
        add     eax, 48                                 ; 08C1 _ 83. C0, 30
?_034:  leave                                           ; 08C4 _ C9
        ret                                             ; 08C5 _ C3
; charToHexVal End of function

charToHexStr:; Function begin
        push    ebp                                     ; 08C6 _ 55
        mov     ebp, esp                                ; 08C7 _ 89. E5
        sub     esp, 20                                 ; 08C9 _ 83. EC, 14
        mov     eax, dword [ebp+8H]                     ; 08CC _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 08CF _ 88. 45, EC
        movzx   eax, byte [ebp-14H]                     ; 08D2 _ 0F B6. 45, EC
        and     eax, 0FH                                ; 08D6 _ 83. E0, 0F
        mov     byte [ebp-1H], al                       ; 08D9 _ 88. 45, FF
        movsx   eax, byte [ebp-1H]                      ; 08DC _ 0F BE. 45, FF
        push    eax                                     ; 08E0 _ 50
        call    charToHexVal                            ; 08E1 _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 08E6 _ 83. C4, 04
        mov     byte [?_058], al                        ; 08E9 _ A2, 00000003(d)
        shr     byte [ebp-14H], 4                       ; 08EE _ C0. 6D, EC, 04
        movzx   eax, byte [ebp-14H]                     ; 08F2 _ 0F B6. 45, EC
        movsx   eax, al                                 ; 08F6 _ 0F BE. C0
        push    eax                                     ; 08F9 _ 50
        call    charToHexVal                            ; 08FA _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 08FF _ 83. C4, 04
        mov     byte [?_057], al                        ; 0902 _ A2, 00000002(d)
        mov     eax, keyval                             ; 0907 _ B8, 00000000(d)
        leave                                           ; 090C _ C9
        ret                                             ; 090D _ C3
; charToHexStr End of function

wait_KBC_sendReady:; Function begin
        push    ebp                                     ; 090E _ 55
        mov     ebp, esp                                ; 090F _ 89. E5
        sub     esp, 8                                  ; 0911 _ 83. EC, 08
?_035:  sub     esp, 12                                 ; 0914 _ 83. EC, 0C
        push    100                                     ; 0917 _ 6A, 64
        call    io_in8                                  ; 0919 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 091E _ 83. C4, 10
        and     eax, 02H                                ; 0921 _ 83. E0, 02
        test    eax, eax                                ; 0924 _ 85. C0
        jz      ?_036                                   ; 0926 _ 74, 02
        jmp     ?_035                                   ; 0928 _ EB, EA
; wait_KBC_sendReady End of function

?_036:  ; Local function
        nop                                             ; 092A _ 90
        nop                                             ; 092B _ 90
        leave                                           ; 092C _ C9
        ret                                             ; 092D _ C3

init_keyboard:; Function begin
        push    ebp                                     ; 092E _ 55
        mov     ebp, esp                                ; 092F _ 89. E5
        sub     esp, 8                                  ; 0931 _ 83. EC, 08
        call    wait_KBC_sendReady                      ; 0934 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0939 _ 83. EC, 08
        push    96                                      ; 093C _ 6A, 60
        push    100                                     ; 093E _ 6A, 64
        call    io_out8                                 ; 0940 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0945 _ 83. C4, 10
        call    wait_KBC_sendReady                      ; 0948 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 094D _ 83. EC, 08
        push    71                                      ; 0950 _ 6A, 47
        push    96                                      ; 0952 _ 6A, 60
        call    io_out8                                 ; 0954 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0959 _ 83. C4, 10
        nop                                             ; 095C _ 90
        leave                                           ; 095D _ C9
        ret                                             ; 095E _ C3
; init_keyboard End of function

enable_mouse:; Function begin
        push    ebp                                     ; 095F _ 55
        mov     ebp, esp                                ; 0960 _ 89. E5
        sub     esp, 8                                  ; 0962 _ 83. EC, 08
        call    wait_KBC_sendReady                      ; 0965 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 096A _ 83. EC, 08
        push    212                                     ; 096D _ 68, 000000D4
        push    100                                     ; 0972 _ 6A, 64
        call    io_out8                                 ; 0974 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0979 _ 83. C4, 10
        call    wait_KBC_sendReady                      ; 097C _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0981 _ 83. EC, 08
        push    244                                     ; 0984 _ 68, 000000F4
        push    96                                      ; 0989 _ 6A, 60
        call    io_out8                                 ; 098B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0990 _ 83. C4, 10
        nop                                             ; 0993 _ 90
        leave                                           ; 0994 _ C9
        ret                                             ; 0995 _ C3
; enable_mouse End of function

intHandlerFromMouse:; Function begin
        push    ebp                                     ; 0996 _ 55
        mov     ebp, esp                                ; 0997 _ 89. E5
        sub     esp, 24                                 ; 0999 _ 83. EC, 18
        sub     esp, 8                                  ; 099C _ 83. EC, 08
        push    32                                      ; 099F _ 6A, 20
        push    160                                     ; 09A1 _ 68, 000000A0
        call    io_out8                                 ; 09A6 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 09AB _ 83. C4, 10
        sub     esp, 8                                  ; 09AE _ 83. EC, 08
        push    32                                      ; 09B1 _ 6A, 20
        push    32                                      ; 09B3 _ 6A, 20
        call    io_out8                                 ; 09B5 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 09BA _ 83. C4, 10
        sub     esp, 12                                 ; 09BD _ 83. EC, 0C
        push    96                                      ; 09C0 _ 6A, 60
        call    io_in8                                  ; 09C2 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 09C7 _ 83. C4, 10
        mov     byte [ebp-9H], al                       ; 09CA _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 09CD _ 0F B6. 45, F7
        sub     esp, 8                                  ; 09D1 _ 83. EC, 08
        push    eax                                     ; 09D4 _ 50
        push    mouseinfo                               ; 09D5 _ 68, 00000108(d)
        call    fifo8_put                               ; 09DA _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 09DF _ 83. C4, 10
        nop                                             ; 09E2 _ 90
        leave                                           ; 09E3 _ C9
        ret                                             ; 09E4 _ C3
; intHandlerFromMouse End of function

fifo8_init:; Function begin
        push    ebp                                     ; 09E5 _ 55
        mov     ebp, esp                                ; 09E6 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 09E8 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 09EB _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 09EE _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 09F1 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 09F4 _ 8B. 55, 10
        mov     dword [eax], edx                        ; 09F7 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 09F9 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 09FC _ 8B. 55, 0C
        mov     dword [eax+10H], edx                    ; 09FF _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 0A02 _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 0A05 _ C7. 40, 14, 00000000
        mov     eax, dword [ebp+8H]                     ; 0A0C _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 0A0F _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 0A16 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 0A19 _ C7. 40, 08, 00000000
        nop                                             ; 0A20 _ 90
        pop     ebp                                     ; 0A21 _ 5D
        ret                                             ; 0A22 _ C3
; fifo8_init End of function

fifo8_put:; Function begin
        push    ebp                                     ; 0A23 _ 55
        mov     ebp, esp                                ; 0A24 _ 89. E5
        sub     esp, 4                                  ; 0A26 _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 0A29 _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 0A2C _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0A2F _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0A32 _ 8B. 40, 10
        test    eax, eax                                ; 0A35 _ 85. C0
        jnz     ?_037                                   ; 0A37 _ 75, 18
        mov     eax, dword [ebp+8H]                     ; 0A39 _ 8B. 45, 08
        mov     eax, dword [eax+14H]                    ; 0A3C _ 8B. 40, 14
        or      eax, 01H                                ; 0A3F _ 83. C8, 01
        mov     edx, eax                                ; 0A42 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0A44 _ 8B. 45, 08
        mov     dword [eax+14H], edx                    ; 0A47 _ 89. 50, 14
        mov     eax, 4294967295                         ; 0A4A _ B8, FFFFFFFF
        jmp     ?_039                                   ; 0A4F _ EB, 50

?_037:  mov     eax, dword [ebp+8H]                     ; 0A51 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 0A54 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 0A56 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0A59 _ 8B. 40, 04
        add     edx, eax                                ; 0A5C _ 01. C2
        movzx   eax, byte [ebp-4H]                      ; 0A5E _ 0F B6. 45, FC
        mov     byte [edx], al                          ; 0A62 _ 88. 02
        mov     eax, dword [ebp+8H]                     ; 0A64 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0A67 _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 0A6A _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0A6D _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 0A70 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0A73 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 0A76 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0A79 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0A7C _ 8B. 40, 0C
        cmp     edx, eax                                ; 0A7F _ 39. C2
        jnz     ?_038                                   ; 0A81 _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 0A83 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 0A86 _ C7. 40, 04, 00000000
?_038:  mov     eax, dword [ebp+8H]                     ; 0A8D _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0A90 _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 0A93 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 0A96 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 0A99 _ 89. 50, 10
        mov     eax, 0                                  ; 0A9C _ B8, 00000000
?_039:  leave                                           ; 0AA1 _ C9
        ret                                             ; 0AA2 _ C3
; fifo8_put End of function

fifo8_get:; Function begin
        push    ebp                                     ; 0AA3 _ 55
        mov     ebp, esp                                ; 0AA4 _ 89. E5
        sub     esp, 16                                 ; 0AA6 _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 0AA9 _ 8B. 45, 08
        mov     edx, dword [eax+10H]                    ; 0AAC _ 8B. 50, 10
        mov     eax, dword [ebp+8H]                     ; 0AAF _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0AB2 _ 8B. 40, 0C
        cmp     edx, eax                                ; 0AB5 _ 39. C2
        jnz     ?_040                                   ; 0AB7 _ 75, 07
        mov     eax, 4294967295                         ; 0AB9 _ B8, FFFFFFFF
        jmp     ?_042                                   ; 0ABE _ EB, 51

?_040:  mov     eax, dword [ebp+8H]                     ; 0AC0 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 0AC3 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 0AC5 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0AC8 _ 8B. 40, 08
        add     eax, edx                                ; 0ACB _ 01. D0
        movzx   eax, byte [eax]                         ; 0ACD _ 0F B6. 00
        movzx   eax, al                                 ; 0AD0 _ 0F B6. C0
        mov     dword [ebp-4H], eax                     ; 0AD3 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0AD6 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0AD9 _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 0ADC _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0ADF _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0AE2 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 0AE5 _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 0AE8 _ 8B. 50, 08
        mov     eax, dword [ebp+8H]                     ; 0AEB _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0AEE _ 8B. 40, 0C
        cmp     edx, eax                                ; 0AF1 _ 39. C2
        jnz     ?_041                                   ; 0AF3 _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 0AF5 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 0AF8 _ C7. 40, 08, 00000000
?_041:  mov     eax, dword [ebp+8H]                     ; 0AFF _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0B02 _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 0B05 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0B08 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 0B0B _ 89. 50, 10
        mov     eax, dword [ebp-4H]                     ; 0B0E _ 8B. 45, FC
?_042:  leave                                           ; 0B11 _ C9
        ret                                             ; 0B12 _ C3
; fifo8_get End of function

fifo8_status:; Function begin
        push    ebp                                     ; 0B13 _ 55
        mov     ebp, esp                                ; 0B14 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 0B16 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 0B19 _ 8B. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 0B1C _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0B1F _ 8B. 40, 10
        sub     edx, eax                                ; 0B22 _ 29. C2
        mov     eax, edx                                ; 0B24 _ 89. D0
        pop     ebp                                     ; 0B26 _ 5D
        ret                                             ; 0B27 _ C3
; fifo8_status End of function

mouse_decode:; Function begin
        push    ebp                                     ; 0B28 _ 55
        mov     ebp, esp                                ; 0B29 _ 89. E5
        sub     esp, 4                                  ; 0B2B _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 0B2E _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 0B31 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0B34 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 0B37 _ 0F B6. 40, 03
        test    al, al                                  ; 0B3B _ 84. C0
        jnz     ?_044                                   ; 0B3D _ 75, 17
        cmp     byte [ebp-4H], -6                       ; 0B3F _ 80. 7D, FC, FA
        jnz     ?_043                                   ; 0B43 _ 75, 07
        mov     eax, dword [ebp+8H]                     ; 0B45 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 0B48 _ C6. 40, 03, 01
?_043:  mov     eax, 0                                  ; 0B4C _ B8, 00000000
        jmp     ?_051                                   ; 0B51 _ E9, 0000010F

?_044:  mov     eax, dword [ebp+8H]                     ; 0B56 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 0B59 _ 0F B6. 40, 03
        cmp     al, 1                                   ; 0B5D _ 3C, 01
        jnz     ?_046                                   ; 0B5F _ 75, 28
        movzx   eax, byte [ebp-4H]                      ; 0B61 _ 0F B6. 45, FC
        and     eax, 0C8H                               ; 0B65 _ 25, 000000C8
        cmp     eax, 8                                  ; 0B6A _ 83. F8, 08
        jnz     ?_045                                   ; 0B6D _ 75, 10
        mov     eax, dword [ebp+8H]                     ; 0B6F _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 0B72 _ 0F B6. 55, FC
        mov     byte [eax], dl                          ; 0B76 _ 88. 10
        mov     eax, dword [ebp+8H]                     ; 0B78 _ 8B. 45, 08
        mov     byte [eax+3H], 2                        ; 0B7B _ C6. 40, 03, 02
?_045:  mov     eax, 0                                  ; 0B7F _ B8, 00000000
        jmp     ?_051                                   ; 0B84 _ E9, 000000DC

?_046:  mov     eax, dword [ebp+8H]                     ; 0B89 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 0B8C _ 0F B6. 40, 03
        cmp     al, 2                                   ; 0B90 _ 3C, 02
        jnz     ?_047                                   ; 0B92 _ 75, 1B
        mov     eax, dword [ebp+8H]                     ; 0B94 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 0B97 _ 0F B6. 55, FC
        mov     byte [eax+1H], dl                       ; 0B9B _ 88. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0B9E _ 8B. 45, 08
        mov     byte [eax+3H], 3                        ; 0BA1 _ C6. 40, 03, 03
        mov     eax, 0                                  ; 0BA5 _ B8, 00000000
        jmp     ?_051                                   ; 0BAA _ E9, 000000B6

?_047:  mov     eax, dword [ebp+8H]                     ; 0BAF _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 0BB2 _ 0F B6. 40, 03
        cmp     al, 3                                   ; 0BB6 _ 3C, 03
        jne     ?_050                                   ; 0BB8 _ 0F 85, 000000A2
        mov     eax, dword [ebp+8H]                     ; 0BBE _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 0BC1 _ 0F B6. 55, FC
        mov     byte [eax+2H], dl                       ; 0BC5 _ 88. 50, 02
        mov     eax, dword [ebp+8H]                     ; 0BC8 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 0BCB _ C6. 40, 03, 01
        mov     eax, dword [ebp+8H]                     ; 0BCF _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 0BD2 _ 0F B6. 00
        movzx   eax, al                                 ; 0BD5 _ 0F B6. C0
        and     eax, 07H                                ; 0BD8 _ 83. E0, 07
        mov     edx, eax                                ; 0BDB _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0BDD _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 0BE0 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 0BE3 _ 8B. 45, 08
        movzx   eax, byte [eax+1H]                      ; 0BE6 _ 0F B6. 40, 01
        movzx   edx, al                                 ; 0BEA _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 0BED _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 0BF0 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0BF3 _ 8B. 45, 08
        movzx   eax, byte [eax+2H]                      ; 0BF6 _ 0F B6. 40, 02
        movzx   edx, al                                 ; 0BFA _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 0BFD _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0C00 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 0C03 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 0C06 _ 0F B6. 00
        movzx   eax, al                                 ; 0C09 _ 0F B6. C0
        and     eax, 10H                                ; 0C0C _ 83. E0, 10
        test    eax, eax                                ; 0C0F _ 85. C0
        jz      ?_048                                   ; 0C11 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 0C13 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0C16 _ 8B. 40, 04
        or      eax, 0FFFFFF00H                         ; 0C19 _ 0D, FFFFFF00
        mov     edx, eax                                ; 0C1E _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0C20 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 0C23 _ 89. 50, 04
?_048:  mov     eax, dword [ebp+8H]                     ; 0C26 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 0C29 _ 0F B6. 00
        movzx   eax, al                                 ; 0C2C _ 0F B6. C0
        and     eax, 20H                                ; 0C2F _ 83. E0, 20
        test    eax, eax                                ; 0C32 _ 85. C0
        jz      ?_049                                   ; 0C34 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 0C36 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0C39 _ 8B. 40, 08
        or      eax, 0FFFFFF00H                         ; 0C3C _ 0D, FFFFFF00
        mov     edx, eax                                ; 0C41 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0C43 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0C46 _ 89. 50, 08
?_049:  mov     eax, dword [ebp+8H]                     ; 0C49 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0C4C _ 8B. 40, 08
        neg     eax                                     ; 0C4F _ F7. D8
        mov     edx, eax                                ; 0C51 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0C53 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0C56 _ 89. 50, 08
        mov     eax, 1                                  ; 0C59 _ B8, 00000001
        jmp     ?_051                                   ; 0C5E _ EB, 05

?_050:  mov     eax, 4294967295                         ; 0C60 _ B8, FFFFFFFF
?_051:  leave                                           ; 0C65 _ C9
        ret                                             ; 0C66 _ C3
; mouse_decode End of function

computeMousePosition:; Function begin
        push    ebp                                     ; 0C67 _ 55
        mov     ebp, esp                                ; 0C68 _ 89. E5
        sub     esp, 16                                 ; 0C6A _ 83. EC, 10
        movzx   eax, word [?_059]                       ; 0C6D _ 0F B7. 05, 00000104(d)
        cwde                                            ; 0C74 _ 98
        mov     dword [ebp-8H], eax                     ; 0C75 _ 89. 45, F8
        movzx   eax, word [?_060]                       ; 0C78 _ 0F B7. 05, 00000106(d)
        cwde                                            ; 0C7F _ 98
        mov     dword [ebp-4H], eax                     ; 0C80 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0C83 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 0C86 _ 8B. 50, 04
        mov     eax, dword [mx]                         ; 0C89 _ A1, 000001F0(d)
        add     eax, edx                                ; 0C8E _ 01. D0
        mov     dword [mx], eax                         ; 0C90 _ A3, 000001F0(d)
        mov     eax, dword [ebp+8H]                     ; 0C95 _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 0C98 _ 8B. 50, 08
        mov     eax, dword [my]                         ; 0C9B _ A1, 000001F4(d)
        add     eax, edx                                ; 0CA0 _ 01. D0
        mov     dword [my], eax                         ; 0CA2 _ A3, 000001F4(d)
        mov     eax, dword [mx]                         ; 0CA7 _ A1, 000001F0(d)
        test    eax, eax                                ; 0CAC _ 85. C0
        jns     ?_052                                   ; 0CAE _ 79, 0A
        mov     dword [mx], 0                           ; 0CB0 _ C7. 05, 000001F0(d), 00000000
?_052:  mov     eax, dword [my]                         ; 0CBA _ A1, 000001F4(d)
        test    eax, eax                                ; 0CBF _ 85. C0
        jns     ?_053                                   ; 0CC1 _ 79, 0A
        mov     dword [my], 0                           ; 0CC3 _ C7. 05, 000001F4(d), 00000000
?_053:  mov     eax, dword [ebp-8H]                     ; 0CCD _ 8B. 45, F8
        lea     edx, [eax-10H]                          ; 0CD0 _ 8D. 50, F0
        mov     eax, dword [mx]                         ; 0CD3 _ A1, 000001F0(d)
        cmp     edx, eax                                ; 0CD8 _ 39. C2
        jge     ?_054                                   ; 0CDA _ 7D, 0B
        mov     eax, dword [ebp-8H]                     ; 0CDC _ 8B. 45, F8
        sub     eax, 16                                 ; 0CDF _ 83. E8, 10
        mov     dword [mx], eax                         ; 0CE2 _ A3, 000001F0(d)
?_054:  mov     eax, dword [ebp-4H]                     ; 0CE7 _ 8B. 45, FC
        lea     edx, [eax-10H]                          ; 0CEA _ 8D. 50, F0
        mov     eax, dword [my]                         ; 0CED _ A1, 000001F4(d)
        cmp     edx, eax                                ; 0CF2 _ 39. C2
        jge     ?_055                                   ; 0CF4 _ 7D, 0B
        mov     eax, dword [ebp-4H]                     ; 0CF6 _ 8B. 45, FC
        sub     eax, 16                                 ; 0CF9 _ 83. E8, 10
        mov     dword [my], eax                         ; 0CFC _ A3, 000001F4(d)
?_055:  nop                                             ; 0D01 _ 90
        leave                                           ; 0D02 _ C9
        ret                                             ; 0D03 _ C3
; computeMousePosition End of function

eraseMouse:; Function begin
        push    ebp                                     ; 0D04 _ 55
        mov     ebp, esp                                ; 0D05 _ 89. E5
        push    ebx                                     ; 0D07 _ 53
        sub     esp, 16                                 ; 0D08 _ 83. EC, 10
        movzx   eax, word [?_059]                       ; 0D0B _ 0F B7. 05, 00000104(d)
        cwde                                            ; 0D12 _ 98
        mov     dword [ebp-0CH], eax                    ; 0D13 _ 89. 45, F4
        movzx   eax, word [?_060]                       ; 0D16 _ 0F B7. 05, 00000106(d)
        cwde                                            ; 0D1D _ 98
        mov     dword [ebp-8H], eax                     ; 0D1E _ 89. 45, F8
        mov     eax, dword [my]                         ; 0D21 _ A1, 000001F4(d)
        lea     ebx, [eax+0FH]                          ; 0D26 _ 8D. 58, 0F
        mov     eax, dword [mx]                         ; 0D29 _ A1, 000001F0(d)
        lea     ecx, [eax+0FH]                          ; 0D2E _ 8D. 48, 0F
        mov     edx, dword [my]                         ; 0D31 _ 8B. 15, 000001F4(d)
        mov     eax, dword [mx]                         ; 0D37 _ A1, 000001F0(d)
        push    ebx                                     ; 0D3C _ 53
        push    ecx                                     ; 0D3D _ 51
        push    edx                                     ; 0D3E _ 52
        push    eax                                     ; 0D3F _ 50
        push    14                                      ; 0D40 _ 6A, 0E
        push    dword [ebp-0CH]                         ; 0D42 _ FF. 75, F4
        push    dword [ebp+8H]                          ; 0D45 _ FF. 75, 08
        call    boxfill8                                ; 0D48 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 0D4D _ 83. C4, 1C
        nop                                             ; 0D50 _ 90
        mov     ebx, dword [ebp-4H]                     ; 0D51 _ 8B. 5D, FC
        leave                                           ; 0D54 _ C9
        ret                                             ; 0D55 _ C3
; eraseMouse End of function

drawMouse:; Function begin
        push    ebp                                     ; 0D56 _ 55
        mov     ebp, esp                                ; 0D57 _ 89. E5
        sub     esp, 16                                 ; 0D59 _ 83. EC, 10
        movzx   eax, word [?_059]                       ; 0D5C _ 0F B7. 05, 00000104(d)
        cwde                                            ; 0D63 _ 98
        mov     dword [ebp-8H], eax                     ; 0D64 _ 89. 45, F8
        movzx   eax, word [?_060]                       ; 0D67 _ 0F B7. 05, 00000106(d)
        cwde                                            ; 0D6E _ 98
        mov     dword [ebp-4H], eax                     ; 0D6F _ 89. 45, FC
        mov     edx, dword [my]                         ; 0D72 _ 8B. 15, 000001F4(d)
        mov     eax, dword [mx]                         ; 0D78 _ A1, 000001F0(d)
        push    16                                      ; 0D7D _ 6A, 10
        push    mcursor                                 ; 0D7F _ 68, 00000000(d)
        push    edx                                     ; 0D84 _ 52
        push    eax                                     ; 0D85 _ 50
        push    16                                      ; 0D86 _ 6A, 10
        push    16                                      ; 0D88 _ 6A, 10
        push    dword [ebp-8H]                          ; 0D8A _ FF. 75, F8
        push    dword [ebp+8H]                          ; 0D8D _ FF. 75, 08
        call    putblock                                ; 0D90 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0D95 _ 83. C4, 20
        nop                                             ; 0D98 _ 90
        leave                                           ; 0D99 _ C9
        ret                                             ; 0D9A _ C3
; drawMouse End of function

show_mouse_info:; Function begin
        push    ebp                                     ; 0D9B _ 55
        mov     ebp, esp                                ; 0D9C _ 89. E5
        sub     esp, 16                                 ; 0D9E _ 83. EC, 10
        mov     eax, dword [bootInfo]                   ; 0DA1 _ A1, 00000100(d)
        mov     dword [ebp-4H], eax                     ; 0DA6 _ 89. 45, FC
        mov     byte [ebp-5H], 0                        ; 0DA9 _ C6. 45, FB, 00
        push    mouseinfo                               ; 0DAD _ 68, 00000108(d)
        call    fifo8_get                               ; 0DB2 _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 0DB7 _ 83. C4, 04
        mov     byte [ebp-5H], al                       ; 0DBA _ 88. 45, FB
        movzx   eax, byte [ebp-5H]                      ; 0DBD _ 0F B6. 45, FB
        push    eax                                     ; 0DC1 _ 50
        push    mdec                                    ; 0DC2 _ 68, 000001E0(d)
        call    mouse_decode                            ; 0DC7 _ E8, FFFFFFFC(rel)
        add     esp, 8                                  ; 0DCC _ 83. C4, 08
        cmp     eax, 1                                  ; 0DCF _ 83. F8, 01
        jnz     ?_056                                   ; 0DD2 _ 75, 23
        push    dword [ebp-4H]                          ; 0DD4 _ FF. 75, FC
        call    eraseMouse                              ; 0DD7 _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 0DDC _ 83. C4, 04
        push    mdec                                    ; 0DDF _ 68, 000001E0(d)
        call    computeMousePosition                    ; 0DE4 _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 0DE9 _ 83. C4, 04
        push    dword [ebp-4H]                          ; 0DEC _ FF. 75, FC
        call    drawMouse                               ; 0DEF _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 0DF4 _ 83. C4, 04
?_056:  nop                                             ; 0DF7 _ 90
        leave                                           ; 0DF8 _ C9
        ret                                             ; 0DF9 _ C3
; show_mouse_info End of function



keyval:                                                 ; byte
        db 30H, 78H                                     ; 0000 _ 0x

?_057:  db 00H                                          ; 0002 _ .

?_058:  db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0003 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 000B _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0013 _ ........
        db 00H, 00H, 00H, 00H, 00H                      ; 001B _ .....

table_rgb.1551:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 00H, 0FFH     ; 0020 _ ........
        db 00H, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH   ; 0028 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0030 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0038 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 0040 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 0048 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0050 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0058 _ ........

cursor.1609:                                            ; byte
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

?_059:  resw    1                                       ; 0104

?_060:  resw    1                                       ; 0106

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

showPos.1543:                                           ; dword
        resd    1                                       ; 01F8


