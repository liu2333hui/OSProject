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
        movzx   eax, word [?_064]                       ; 001F _ 0F B7. 05, 00000104(d)
        cwde                                            ; 0026 _ 98
        mov     dword [ebp-28H], eax                    ; 0027 _ 89. 45, D8
        movzx   eax, word [?_065]                       ; 002A _ 0F B7. 05, 00000106(d)
        cwde                                            ; 0031 _ 98
        mov     dword [ebp-24H], eax                    ; 0032 _ 89. 45, DC
        mov     eax, dword [bootInfo]                   ; 0035 _ A1, 00000100(d)
        mov     dword [ebp-20H], eax                    ; 003A _ 89. 45, E0
        call    init_palette                            ; 003D _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-24H]                    ; 0042 _ 8B. 45, DC
        lea     edx, [eax-1DH]                          ; 0045 _ 8D. 50, E3
        mov     eax, dword [ebp-28H]                    ; 0048 _ 8B. 45, D8
        sub     eax, 1                                  ; 004B _ 83. E8, 01
        sub     esp, 4                                  ; 004E _ 83. EC, 04
        push    edx                                     ; 0051 _ 52
        push    eax                                     ; 0052 _ 50
        push    0                                       ; 0053 _ 6A, 00
        push    0                                       ; 0055 _ 6A, 00
        push    14                                      ; 0057 _ 6A, 0E
        push    dword [ebp-28H]                         ; 0059 _ FF. 75, D8
        push    dword [ebp-2CH]                         ; 005C _ FF. 75, D4
        call    boxfill8                                ; 005F _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0064 _ 83. C4, 20
        mov     eax, dword [ebp-24H]                    ; 0067 _ 8B. 45, DC
        lea     ecx, [eax-1CH]                          ; 006A _ 8D. 48, E4
        mov     eax, dword [ebp-28H]                    ; 006D _ 8B. 45, D8
        lea     edx, [eax-1H]                           ; 0070 _ 8D. 50, FF
        mov     eax, dword [ebp-24H]                    ; 0073 _ 8B. 45, DC
        sub     eax, 28                                 ; 0076 _ 83. E8, 1C
        sub     esp, 4                                  ; 0079 _ 83. EC, 04
        push    ecx                                     ; 007C _ 51
        push    edx                                     ; 007D _ 52
        push    eax                                     ; 007E _ 50
        push    0                                       ; 007F _ 6A, 00
        push    8                                       ; 0081 _ 6A, 08
        push    dword [ebp-28H]                         ; 0083 _ FF. 75, D8
        push    dword [ebp-2CH]                         ; 0086 _ FF. 75, D4
        call    boxfill8                                ; 0089 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 008E _ 83. C4, 20
        mov     eax, dword [ebp-24H]                    ; 0091 _ 8B. 45, DC
        lea     ecx, [eax-1BH]                          ; 0094 _ 8D. 48, E5
        mov     eax, dword [ebp-28H]                    ; 0097 _ 8B. 45, D8
        lea     edx, [eax-1H]                           ; 009A _ 8D. 50, FF
        mov     eax, dword [ebp-24H]                    ; 009D _ 8B. 45, DC
        sub     eax, 27                                 ; 00A0 _ 83. E8, 1B
        sub     esp, 4                                  ; 00A3 _ 83. EC, 04
        push    ecx                                     ; 00A6 _ 51
        push    edx                                     ; 00A7 _ 52
        push    eax                                     ; 00A8 _ 50
        push    0                                       ; 00A9 _ 6A, 00
        push    7                                       ; 00AB _ 6A, 07
        push    dword [ebp-28H]                         ; 00AD _ FF. 75, D8
        push    dword [ebp-2CH]                         ; 00B0 _ FF. 75, D4
        call    boxfill8                                ; 00B3 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 00B8 _ 83. C4, 20
        mov     eax, dword [ebp-24H]                    ; 00BB _ 8B. 45, DC
        lea     ecx, [eax-1H]                           ; 00BE _ 8D. 48, FF
        mov     eax, dword [ebp-28H]                    ; 00C1 _ 8B. 45, D8
        lea     edx, [eax-1H]                           ; 00C4 _ 8D. 50, FF
        mov     eax, dword [ebp-24H]                    ; 00C7 _ 8B. 45, DC
        sub     eax, 26                                 ; 00CA _ 83. E8, 1A
        sub     esp, 4                                  ; 00CD _ 83. EC, 04
        push    ecx                                     ; 00D0 _ 51
        push    edx                                     ; 00D1 _ 52
        push    eax                                     ; 00D2 _ 50
        push    0                                       ; 00D3 _ 6A, 00
        push    8                                       ; 00D5 _ 6A, 08
        push    dword [ebp-28H]                         ; 00D7 _ FF. 75, D8
        push    dword [ebp-2CH]                         ; 00DA _ FF. 75, D4
        call    boxfill8                                ; 00DD _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 00E2 _ 83. C4, 20
        mov     eax, dword [ebp-24H]                    ; 00E5 _ 8B. 45, DC
        lea     edx, [eax-18H]                          ; 00E8 _ 8D. 50, E8
        mov     eax, dword [ebp-24H]                    ; 00EB _ 8B. 45, DC
        sub     eax, 24                                 ; 00EE _ 83. E8, 18
        sub     esp, 4                                  ; 00F1 _ 83. EC, 04
        push    edx                                     ; 00F4 _ 52
        push    59                                      ; 00F5 _ 6A, 3B
        push    eax                                     ; 00F7 _ 50
        push    3                                       ; 00F8 _ 6A, 03
        push    7                                       ; 00FA _ 6A, 07
        push    dword [ebp-28H]                         ; 00FC _ FF. 75, D8
        push    dword [ebp-2CH]                         ; 00FF _ FF. 75, D4
        call    boxfill8                                ; 0102 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0107 _ 83. C4, 20
        mov     eax, dword [ebp-24H]                    ; 010A _ 8B. 45, DC
        lea     edx, [eax-4H]                           ; 010D _ 8D. 50, FC
        mov     eax, dword [ebp-24H]                    ; 0110 _ 8B. 45, DC
        sub     eax, 24                                 ; 0113 _ 83. E8, 18
        sub     esp, 4                                  ; 0116 _ 83. EC, 04
        push    edx                                     ; 0119 _ 52
        push    2                                       ; 011A _ 6A, 02
        push    eax                                     ; 011C _ 50
        push    2                                       ; 011D _ 6A, 02
        push    7                                       ; 011F _ 6A, 07
        push    dword [ebp-28H]                         ; 0121 _ FF. 75, D8
        push    dword [ebp-2CH]                         ; 0124 _ FF. 75, D4
        call    boxfill8                                ; 0127 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 012C _ 83. C4, 20
        mov     eax, dword [ebp-24H]                    ; 012F _ 8B. 45, DC
        lea     edx, [eax-4H]                           ; 0132 _ 8D. 50, FC
        mov     eax, dword [ebp-24H]                    ; 0135 _ 8B. 45, DC
        sub     eax, 4                                  ; 0138 _ 83. E8, 04
        sub     esp, 4                                  ; 013B _ 83. EC, 04
        push    edx                                     ; 013E _ 52
        push    59                                      ; 013F _ 6A, 3B
        push    eax                                     ; 0141 _ 50
        push    3                                       ; 0142 _ 6A, 03
        push    15                                      ; 0144 _ 6A, 0F
        push    dword [ebp-28H]                         ; 0146 _ FF. 75, D8
        push    dword [ebp-2CH]                         ; 0149 _ FF. 75, D4
        call    boxfill8                                ; 014C _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0151 _ 83. C4, 20
        mov     eax, dword [ebp-24H]                    ; 0154 _ 8B. 45, DC
        lea     edx, [eax-5H]                           ; 0157 _ 8D. 50, FB
        mov     eax, dword [ebp-24H]                    ; 015A _ 8B. 45, DC
        sub     eax, 23                                 ; 015D _ 83. E8, 17
        sub     esp, 4                                  ; 0160 _ 83. EC, 04
        push    edx                                     ; 0163 _ 52
        push    59                                      ; 0164 _ 6A, 3B
        push    eax                                     ; 0166 _ 50
        push    59                                      ; 0167 _ 6A, 3B
        push    15                                      ; 0169 _ 6A, 0F
        push    dword [ebp-28H]                         ; 016B _ FF. 75, D8
        push    dword [ebp-2CH]                         ; 016E _ FF. 75, D4
        call    boxfill8                                ; 0171 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0176 _ 83. C4, 20
        mov     eax, dword [ebp-24H]                    ; 0179 _ 8B. 45, DC
        lea     edx, [eax-3H]                           ; 017C _ 8D. 50, FD
        mov     eax, dword [ebp-24H]                    ; 017F _ 8B. 45, DC
        sub     eax, 3                                  ; 0182 _ 83. E8, 03
        sub     esp, 4                                  ; 0185 _ 83. EC, 04
        push    edx                                     ; 0188 _ 52
        push    59                                      ; 0189 _ 6A, 3B
        push    eax                                     ; 018B _ 50
        push    2                                       ; 018C _ 6A, 02
        push    0                                       ; 018E _ 6A, 00
        push    dword [ebp-28H]                         ; 0190 _ FF. 75, D8
        push    dword [ebp-2CH]                         ; 0193 _ FF. 75, D4
        call    boxfill8                                ; 0196 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 019B _ 83. C4, 20
        mov     eax, dword [ebp-24H]                    ; 019E _ 8B. 45, DC
        lea     edx, [eax-3H]                           ; 01A1 _ 8D. 50, FD
        mov     eax, dword [ebp-24H]                    ; 01A4 _ 8B. 45, DC
        sub     eax, 24                                 ; 01A7 _ 83. E8, 18
        sub     esp, 4                                  ; 01AA _ 83. EC, 04
        push    edx                                     ; 01AD _ 52
        push    60                                      ; 01AE _ 6A, 3C
        push    eax                                     ; 01B0 _ 50
        push    60                                      ; 01B1 _ 6A, 3C
        push    0                                       ; 01B3 _ 6A, 00
        push    dword [ebp-28H]                         ; 01B5 _ FF. 75, D8
        push    dword [ebp-2CH]                         ; 01B8 _ FF. 75, D4
        call    boxfill8                                ; 01BB _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 01C0 _ 83. C4, 20
        mov     eax, dword [ebp-24H]                    ; 01C3 _ 8B. 45, DC
        lea     ebx, [eax-3H]                           ; 01C6 _ 8D. 58, FD
        mov     eax, dword [ebp-28H]                    ; 01C9 _ 8B. 45, D8
        lea     ecx, [eax-4H]                           ; 01CC _ 8D. 48, FC
        mov     eax, dword [ebp-24H]                    ; 01CF _ 8B. 45, DC
        lea     edx, [eax-3H]                           ; 01D2 _ 8D. 50, FD
        mov     eax, dword [ebp-28H]                    ; 01D5 _ 8B. 45, D8
        sub     eax, 47                                 ; 01D8 _ 83. E8, 2F
        sub     esp, 4                                  ; 01DB _ 83. EC, 04
        push    ebx                                     ; 01DE _ 53
        push    ecx                                     ; 01DF _ 51
        push    edx                                     ; 01E0 _ 52
        push    eax                                     ; 01E1 _ 50
        push    7                                       ; 01E2 _ 6A, 07
        push    dword [ebp-28H]                         ; 01E4 _ FF. 75, D8
        push    dword [ebp-2CH]                         ; 01E7 _ FF. 75, D4
        call    boxfill8                                ; 01EA _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 01EF _ 83. C4, 20
        mov     eax, dword [ebp-24H]                    ; 01F2 _ 8B. 45, DC
        lea     ebx, [eax-4H]                           ; 01F5 _ 8D. 58, FC
        mov     eax, dword [ebp-28H]                    ; 01F8 _ 8B. 45, D8
        lea     ecx, [eax-3H]                           ; 01FB _ 8D. 48, FD
        mov     eax, dword [ebp-24H]                    ; 01FE _ 8B. 45, DC
        lea     edx, [eax-18H]                          ; 0201 _ 8D. 50, E8
        mov     eax, dword [ebp-28H]                    ; 0204 _ 8B. 45, D8
        sub     eax, 3                                  ; 0207 _ 83. E8, 03
        sub     esp, 4                                  ; 020A _ 83. EC, 04
        push    ebx                                     ; 020D _ 53
        push    ecx                                     ; 020E _ 51
        push    edx                                     ; 020F _ 52
        push    eax                                     ; 0210 _ 50
        push    7                                       ; 0211 _ 6A, 07
        push    dword [ebp-28H]                         ; 0213 _ FF. 75, D8
        push    dword [ebp-2CH]                         ; 0216 _ FF. 75, D4
        call    boxfill8                                ; 0219 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 021E _ 83. C4, 20
        mov     eax, dword [ebp-24H]                    ; 0221 _ 8B. 45, DC
        lea     ebx, [eax-18H]                          ; 0224 _ 8D. 58, E8
        mov     eax, dword [ebp-28H]                    ; 0227 _ 8B. 45, D8
        lea     ecx, [eax-4H]                           ; 022A _ 8D. 48, FC
        mov     eax, dword [ebp-24H]                    ; 022D _ 8B. 45, DC
        lea     edx, [eax-18H]                          ; 0230 _ 8D. 50, E8
        mov     eax, dword [ebp-28H]                    ; 0233 _ 8B. 45, D8
        sub     eax, 47                                 ; 0236 _ 83. E8, 2F
        sub     esp, 4                                  ; 0239 _ 83. EC, 04
        push    ebx                                     ; 023C _ 53
        push    ecx                                     ; 023D _ 51
        push    edx                                     ; 023E _ 52
        push    eax                                     ; 023F _ 50
        push    15                                      ; 0240 _ 6A, 0F
        push    dword [ebp-28H]                         ; 0242 _ FF. 75, D8
        push    dword [ebp-2CH]                         ; 0245 _ FF. 75, D4
        call    boxfill8                                ; 0248 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 024D _ 83. C4, 20
        mov     eax, dword [ebp-24H]                    ; 0250 _ 8B. 45, DC
        lea     ebx, [eax-4H]                           ; 0253 _ 8D. 58, FC
        mov     eax, dword [ebp-28H]                    ; 0256 _ 8B. 45, D8
        lea     ecx, [eax-2FH]                          ; 0259 _ 8D. 48, D1
        mov     eax, dword [ebp-24H]                    ; 025C _ 8B. 45, DC
        lea     edx, [eax-17H]                          ; 025F _ 8D. 50, E9
        mov     eax, dword [ebp-28H]                    ; 0262 _ 8B. 45, D8
        sub     eax, 47                                 ; 0265 _ 83. E8, 2F
        sub     esp, 4                                  ; 0268 _ 83. EC, 04
        push    ebx                                     ; 026B _ 53
        push    ecx                                     ; 026C _ 51
        push    edx                                     ; 026D _ 52
        push    eax                                     ; 026E _ 50
        push    15                                      ; 026F _ 6A, 0F
        push    dword [ebp-28H]                         ; 0271 _ FF. 75, D8
        push    dword [ebp-2CH]                         ; 0274 _ FF. 75, D4
        call    boxfill8                                ; 0277 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 027C _ 83. C4, 20
        call    get_memory_block_count                  ; 027F _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 0284 _ 89. 45, E4
        mov     eax, dword [ebp-1CH]                    ; 0287 _ 8B. 45, E4
        sub     esp, 12                                 ; 028A _ 83. EC, 0C
        push    eax                                     ; 028D _ 50
        call    intToHexStr                             ; 028E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0293 _ 83. C4, 10
        mov     dword [ebp-18H], eax                    ; 0296 _ 89. 45, E8
        sub     esp, 8                                  ; 0299 _ 83. EC, 08
        push    dword [ebp-18H]                         ; 029C _ FF. 75, E8
        push    7                                       ; 029F _ 6A, 07
        push    40                                      ; 02A1 _ 6A, 28
        push    48                                      ; 02A3 _ 6A, 30
        push    dword [ebp-28H]                         ; 02A5 _ FF. 75, D8
        push    dword [ebp-2CH]                         ; 02A8 _ FF. 75, D4
        call    showString                              ; 02AB _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 02B0 _ 83. C4, 20
        mov     eax, dword [ebp-28H]                    ; 02B3 _ 8B. 45, D8
        sub     eax, 16                                 ; 02B6 _ 83. E8, 10
        mov     edx, eax                                ; 02B9 _ 89. C2
        shr     edx, 31                                 ; 02BB _ C1. EA, 1F
        add     eax, edx                                ; 02BE _ 01. D0
        sar     eax, 1                                  ; 02C0 _ D1. F8
        mov     dword [mx], eax                         ; 02C2 _ A3, 000001F0(d)
        mov     eax, dword [ebp-24H]                    ; 02C7 _ 8B. 45, DC
        sub     eax, 44                                 ; 02CA _ 83. E8, 2C
        mov     edx, eax                                ; 02CD _ 89. C2
        shr     edx, 31                                 ; 02CF _ C1. EA, 1F
        add     eax, edx                                ; 02D2 _ 01. D0
        sar     eax, 1                                  ; 02D4 _ D1. F8
        mov     dword [mx], eax                         ; 02D6 _ A3, 000001F0(d)
        sub     esp, 8                                  ; 02DB _ 83. EC, 08
        push    14                                      ; 02DE _ 6A, 0E
        push    mcursor                                 ; 02E0 _ 68, 00000000(d)
        call    init_mouse_cursor                       ; 02E5 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 02EA _ 83. C4, 10
        mov     edx, dword [my]                         ; 02ED _ 8B. 15, 000001F4(d)
        mov     eax, dword [mx]                         ; 02F3 _ A1, 000001F0(d)
        push    16                                      ; 02F8 _ 6A, 10
        push    mcursor                                 ; 02FA _ 68, 00000000(d)
        push    edx                                     ; 02FF _ 52
        push    eax                                     ; 0300 _ 50
        push    16                                      ; 0301 _ 6A, 10
        push    16                                      ; 0303 _ 6A, 10
        push    dword [ebp-28H]                         ; 0305 _ FF. 75, D8
        push    dword [ebp-2CH]                         ; 0308 _ FF. 75, D4
        call    putblock                                ; 030B _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0310 _ 83. C4, 20
        sub     esp, 4                                  ; 0313 _ 83. EC, 04
        push    mousebuf                                ; 0316 _ 68, 00000140(d)
        push    128                                     ; 031B _ 68, 00000080
        push    mouseinfo                               ; 0320 _ 68, 00000108(d)
        call    fifo8_init                              ; 0325 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 032A _ 83. C4, 10
        sub     esp, 4                                  ; 032D _ 83. EC, 04
        push    keybuf                                  ; 0330 _ 68, 000001C0(d)
        push    32                                      ; 0335 _ 6A, 20
        push    keyinfo                                 ; 0337 _ 68, 00000120(d)
        call    fifo8_init                              ; 033C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0341 _ 83. C4, 10
        call    init_keyboard                           ; 0344 _ E8, FFFFFFFC(rel)
        call    enable_mouse                            ; 0349 _ E8, FFFFFFFC(rel)
        call    get_adr_buffer                          ; 034E _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 0353 _ 89. 45, EC
        call    io_sti                                  ; 0356 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], 0                      ; 035B _ C7. 45, F0, 00000000
        mov     dword [ebp-30H], 0                      ; 0362 _ C7. 45, D0, 00000000
?_001:  sub     esp, 12                                 ; 0369 _ 83. EC, 0C
        push    keyinfo                                 ; 036C _ 68, 00000120(d)
        call    fifo8_status                            ; 0371 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0376 _ 83. C4, 10
        mov     ebx, eax                                ; 0379 _ 89. C3
        sub     esp, 12                                 ; 037B _ 83. EC, 0C
        push    mouseinfo                               ; 037E _ 68, 00000108(d)
        call    fifo8_status                            ; 0383 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0388 _ 83. C4, 10
        add     eax, ebx                                ; 038B _ 01. D8
        test    eax, eax                                ; 038D _ 85. C0
        jnz     ?_002                                   ; 038F _ 75, 07
        call    io_hlt                                  ; 0391 _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 0396 _ EB, D1
; CMain End of function

?_002:  ; Local function
        sub     esp, 12                                 ; 0398 _ 83. EC, 0C
        push    keyinfo                                 ; 039B _ 68, 00000120(d)
        call    fifo8_status                            ; 03A0 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03A5 _ 83. C4, 10
        test    eax, eax                                ; 03A8 _ 85. C0
        jz      ?_004                                   ; 03AA _ 74, 7E
        sub     esp, 12                                 ; 03AC _ 83. EC, 0C
        push    keyinfo                                 ; 03AF _ 68, 00000120(d)
        call    fifo8_get                               ; 03B4 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03B9 _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 03BC _ 89. 45, F0
        cmp     dword [ebp-10H], 28                     ; 03BF _ 83. 7D, F0, 1C
        jnz     ?_003                                   ; 03C3 _ 75, 3E
        mov     edx, dword [ebp-30H]                    ; 03C5 _ 8B. 55, D0
        mov     eax, edx                                ; 03C8 _ 89. D0
        shl     eax, 2                                  ; 03CA _ C1. E0, 02
        add     eax, edx                                ; 03CD _ 01. D0
        shl     eax, 2                                  ; 03CF _ C1. E0, 02
        mov     edx, eax                                ; 03D2 _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 03D4 _ 8B. 45, EC
        add     eax, edx                                ; 03D7 _ 01. D0
        sub     esp, 12                                 ; 03D9 _ 83. EC, 0C
        push    7                                       ; 03DC _ 6A, 07
        push    dword [ebp-28H]                         ; 03DE _ FF. 75, D8
        push    dword [ebp-30H]                         ; 03E1 _ FF. 75, D0
        push    dword [ebp-2CH]                         ; 03E4 _ FF. 75, D4
        push    eax                                     ; 03E7 _ 50
        call    showMemoryInfo                          ; 03E8 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 03ED _ 83. C4, 20
        add     dword [ebp-30H], 1                      ; 03F0 _ 83. 45, D0, 01
        mov     eax, dword [ebp-30H]                    ; 03F4 _ 8B. 45, D0
        cmp     eax, dword [ebp-1CH]                    ; 03F7 _ 3B. 45, E4
        jle     ?_003                                   ; 03FA _ 7E, 07
        mov     dword [ebp-30H], 0                      ; 03FC _ C7. 45, D0, 00000000
?_003:  mov     eax, dword [ebp-10H]                    ; 0403 _ 8B. 45, F0
        movzx   eax, al                                 ; 0406 _ 0F B6. C0
        sub     esp, 12                                 ; 0409 _ 83. EC, 0C
        push    eax                                     ; 040C _ 50
        call    charToHexStr                            ; 040D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0412 _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 0415 _ 89. 45, F4
        mov     eax, dword [showPos.1565]               ; 0418 _ A1, 000001F8(d)
        add     eax, 32                                 ; 041D _ 83. C0, 20
        mov     dword [showPos.1565], eax               ; 0420 _ A3, 000001F8(d)
        jmp     ?_001                                   ; 0425 _ E9, FFFFFF3F

?_004:  ; Local function
        sub     esp, 12                                 ; 042A _ 83. EC, 0C
        push    mouseinfo                               ; 042D _ 68, 00000108(d)
        call    fifo8_status                            ; 0432 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0437 _ 83. C4, 10
        test    eax, eax                                ; 043A _ 85. C0
        je      ?_001                                   ; 043C _ 0F 84, FFFFFF27
        call    show_mouse_info                         ; 0442 _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 0447 _ E9, FFFFFF1D

initBootInfo:; Function begin
        push    ebp                                     ; 044C _ 55
        mov     ebp, esp                                ; 044D _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 044F _ 8B. 45, 08
        mov     dword [eax], 655360                     ; 0452 _ C7. 00, 000A0000
        mov     eax, dword [ebp+8H]                     ; 0458 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 320                      ; 045B _ 66: C7. 40, 04, 0140
        mov     eax, dword [ebp+8H]                     ; 0461 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 200                      ; 0464 _ 66: C7. 40, 06, 00C8
        nop                                             ; 046A _ 90
        pop     ebp                                     ; 046B _ 5D
        ret                                             ; 046C _ C3
; initBootInfo End of function

init_palette:; Function begin
        push    ebp                                     ; 046D _ 55
        mov     ebp, esp                                ; 046E _ 89. E5
        sub     esp, 8                                  ; 0470 _ 83. EC, 08
        sub     esp, 4                                  ; 0473 _ 83. EC, 04
        push    table_rgb.1574                          ; 0476 _ 68, 00000020(d)
        push    15                                      ; 047B _ 6A, 0F
        push    0                                       ; 047D _ 6A, 00
        call    set_palette                             ; 047F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0484 _ 83. C4, 10
        nop                                             ; 0487 _ 90
        leave                                           ; 0488 _ C9
        ret                                             ; 0489 _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 048A _ 55
        mov     ebp, esp                                ; 048B _ 89. E5
        sub     esp, 24                                 ; 048D _ 83. EC, 18
        call    io_load_eflags                          ; 0490 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 0495 _ 89. 45, F4
        call    io_cli                                  ; 0498 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 049D _ 83. EC, 08
        push    dword [ebp+8H]                          ; 04A0 _ FF. 75, 08
        push    968                                     ; 04A3 _ 68, 000003C8
        call    io_out8                                 ; 04A8 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 04AD _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 04B0 _ 8B. 45, 08
        mov     dword [ebp-10H], eax                    ; 04B3 _ 89. 45, F0
        jmp     ?_006                                   ; 04B6 _ EB, 65

?_005:  mov     eax, dword [ebp+10H]                    ; 04B8 _ 8B. 45, 10
        movzx   eax, byte [eax]                         ; 04BB _ 0F B6. 00
        shr     al, 2                                   ; 04BE _ C0. E8, 02
        movzx   eax, al                                 ; 04C1 _ 0F B6. C0
        sub     esp, 8                                  ; 04C4 _ 83. EC, 08
        push    eax                                     ; 04C7 _ 50
        push    969                                     ; 04C8 _ 68, 000003C9
        call    io_out8                                 ; 04CD _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 04D2 _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 04D5 _ 8B. 45, 10
        add     eax, 1                                  ; 04D8 _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 04DB _ 0F B6. 00
        shr     al, 2                                   ; 04DE _ C0. E8, 02
        movzx   eax, al                                 ; 04E1 _ 0F B6. C0
        sub     esp, 8                                  ; 04E4 _ 83. EC, 08
        push    eax                                     ; 04E7 _ 50
        push    969                                     ; 04E8 _ 68, 000003C9
        call    io_out8                                 ; 04ED _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 04F2 _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 04F5 _ 8B. 45, 10
        add     eax, 2                                  ; 04F8 _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 04FB _ 0F B6. 00
        shr     al, 2                                   ; 04FE _ C0. E8, 02
        movzx   eax, al                                 ; 0501 _ 0F B6. C0
        sub     esp, 8                                  ; 0504 _ 83. EC, 08
        push    eax                                     ; 0507 _ 50
        push    969                                     ; 0508 _ 68, 000003C9
        call    io_out8                                 ; 050D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0512 _ 83. C4, 10
        add     dword [ebp+10H], 3                      ; 0515 _ 83. 45, 10, 03
        add     dword [ebp-10H], 1                      ; 0519 _ 83. 45, F0, 01
?_006:  mov     eax, dword [ebp-10H]                    ; 051D _ 8B. 45, F0
        cmp     eax, dword [ebp+0CH]                    ; 0520 _ 3B. 45, 0C
        jle     ?_005                                   ; 0523 _ 7E, 93
        sub     esp, 12                                 ; 0525 _ 83. EC, 0C
        push    dword [ebp-0CH]                         ; 0528 _ FF. 75, F4
        call    io_store_eflags                         ; 052B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0530 _ 83. C4, 10
        nop                                             ; 0533 _ 90
        leave                                           ; 0534 _ C9
        ret                                             ; 0535 _ C3
; set_palette End of function

boxfill8:; Function begin
        push    ebp                                     ; 0536 _ 55
        mov     ebp, esp                                ; 0537 _ 89. E5
        sub     esp, 20                                 ; 0539 _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 053C _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 053F _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 0542 _ 8B. 45, 18
        mov     dword [ebp-4H], eax                     ; 0545 _ 89. 45, FC
        jmp     ?_010                                   ; 0548 _ EB, 33

?_007:  mov     eax, dword [ebp+14H]                    ; 054A _ 8B. 45, 14
        mov     dword [ebp-8H], eax                     ; 054D _ 89. 45, F8
        jmp     ?_009                                   ; 0550 _ EB, 1F

?_008:  mov     eax, dword [ebp-4H]                     ; 0552 _ 8B. 45, FC
        imul    eax, dword [ebp+0CH]                    ; 0555 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0559 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 055B _ 8B. 45, F8
        add     eax, edx                                ; 055E _ 01. D0
        mov     edx, eax                                ; 0560 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0562 _ 8B. 45, 08
        add     edx, eax                                ; 0565 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0567 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 056B _ 88. 02
        add     dword [ebp-8H], 1                       ; 056D _ 83. 45, F8, 01
?_009:  mov     eax, dword [ebp-8H]                     ; 0571 _ 8B. 45, F8
        cmp     eax, dword [ebp+1CH]                    ; 0574 _ 3B. 45, 1C
        jle     ?_008                                   ; 0577 _ 7E, D9
        add     dword [ebp-4H], 1                       ; 0579 _ 83. 45, FC, 01
?_010:  mov     eax, dword [ebp-4H]                     ; 057D _ 8B. 45, FC
        cmp     eax, dword [ebp+20H]                    ; 0580 _ 3B. 45, 20
        jle     ?_007                                   ; 0583 _ 7E, C5
        nop                                             ; 0585 _ 90
        leave                                           ; 0586 _ C9
        ret                                             ; 0587 _ C3
; boxfill8 End of function

showString:; Function begin
        push    ebp                                     ; 0588 _ 55
        mov     ebp, esp                                ; 0589 _ 89. E5
        sub     esp, 24                                 ; 058B _ 83. EC, 18
        mov     eax, dword [ebp+18H]                    ; 058E _ 8B. 45, 18
        mov     byte [ebp-0CH], al                      ; 0591 _ 88. 45, F4
        jmp     ?_012                                   ; 0594 _ EB, 37

?_011:  mov     eax, dword [ebp+1CH]                    ; 0596 _ 8B. 45, 1C
        movzx   eax, byte [eax]                         ; 0599 _ 0F B6. 00
        movzx   eax, al                                 ; 059C _ 0F B6. C0
        shl     eax, 4                                  ; 059F _ C1. E0, 04
        lea     edx, [systemFont+eax]                   ; 05A2 _ 8D. 90, 00000000(d)
        movsx   eax, byte [ebp-0CH]                     ; 05A8 _ 0F BE. 45, F4
        sub     esp, 8                                  ; 05AC _ 83. EC, 08
        push    edx                                     ; 05AF _ 52
        push    eax                                     ; 05B0 _ 50
        push    dword [ebp+14H]                         ; 05B1 _ FF. 75, 14
        push    dword [ebp+10H]                         ; 05B4 _ FF. 75, 10
        push    dword [ebp+0CH]                         ; 05B7 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 05BA _ FF. 75, 08
        call    showChar8                               ; 05BD _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 05C2 _ 83. C4, 20
        add     dword [ebp+1CH], 1                      ; 05C5 _ 83. 45, 1C, 01
        add     dword [ebp+10H], 8                      ; 05C9 _ 83. 45, 10, 08
?_012:  mov     eax, dword [ebp+1CH]                    ; 05CD _ 8B. 45, 1C
        movzx   eax, byte [eax]                         ; 05D0 _ 0F B6. 00
        test    al, al                                  ; 05D3 _ 84. C0
        jnz     ?_011                                   ; 05D5 _ 75, BF
        nop                                             ; 05D7 _ 90
        leave                                           ; 05D8 _ C9
        ret                                             ; 05D9 _ C3
; showString End of function

showChar8:; Function begin
        push    ebp                                     ; 05DA _ 55
        mov     ebp, esp                                ; 05DB _ 89. E5
        sub     esp, 20                                 ; 05DD _ 83. EC, 14
        mov     eax, dword [ebp+18H]                    ; 05E0 _ 8B. 45, 18
        mov     byte [ebp-14H], al                      ; 05E3 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 05E6 _ C7. 45, FC, 00000000
        jmp     ?_022                                   ; 05ED _ E9, 0000016C

?_013:  mov     edx, dword [ebp-4H]                     ; 05F2 _ 8B. 55, FC
        mov     eax, dword [ebp+1CH]                    ; 05F5 _ 8B. 45, 1C
        add     eax, edx                                ; 05F8 _ 01. D0
        movzx   eax, byte [eax]                         ; 05FA _ 0F B6. 00
        mov     byte [ebp-5H], al                       ; 05FD _ 88. 45, FB
        cmp     byte [ebp-5H], 0                        ; 0600 _ 80. 7D, FB, 00
        jns     ?_014                                   ; 0604 _ 79, 20
        mov     edx, dword [ebp+14H]                    ; 0606 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0609 _ 8B. 45, FC
        add     eax, edx                                ; 060C _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 060E _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0612 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0614 _ 8B. 45, 10
        add     eax, edx                                ; 0617 _ 01. D0
        mov     edx, eax                                ; 0619 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 061B _ 8B. 45, 08
        add     edx, eax                                ; 061E _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0620 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0624 _ 88. 02
?_014:  movsx   eax, byte [ebp-5H]                      ; 0626 _ 0F BE. 45, FB
        and     eax, 40H                                ; 062A _ 83. E0, 40
        test    eax, eax                                ; 062D _ 85. C0
        jz      ?_015                                   ; 062F _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 0631 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0634 _ 8B. 45, FC
        add     eax, edx                                ; 0637 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0639 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 063D _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 063F _ 8B. 45, 10
        add     eax, edx                                ; 0642 _ 01. D0
        lea     edx, [eax+1H]                           ; 0644 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0647 _ 8B. 45, 08
        add     edx, eax                                ; 064A _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 064C _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0650 _ 88. 02
?_015:  movsx   eax, byte [ebp-5H]                      ; 0652 _ 0F BE. 45, FB
        and     eax, 20H                                ; 0656 _ 83. E0, 20
        test    eax, eax                                ; 0659 _ 85. C0
        jz      ?_016                                   ; 065B _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 065D _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0660 _ 8B. 45, FC
        add     eax, edx                                ; 0663 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0665 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0669 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 066B _ 8B. 45, 10
        add     eax, edx                                ; 066E _ 01. D0
        lea     edx, [eax+2H]                           ; 0670 _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 0673 _ 8B. 45, 08
        add     edx, eax                                ; 0676 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0678 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 067C _ 88. 02
?_016:  movsx   eax, byte [ebp-5H]                      ; 067E _ 0F BE. 45, FB
        and     eax, 10H                                ; 0682 _ 83. E0, 10
        test    eax, eax                                ; 0685 _ 85. C0
        jz      ?_017                                   ; 0687 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 0689 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 068C _ 8B. 45, FC
        add     eax, edx                                ; 068F _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0691 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0695 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0697 _ 8B. 45, 10
        add     eax, edx                                ; 069A _ 01. D0
        lea     edx, [eax+3H]                           ; 069C _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 069F _ 8B. 45, 08
        add     edx, eax                                ; 06A2 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 06A4 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 06A8 _ 88. 02
?_017:  movsx   eax, byte [ebp-5H]                      ; 06AA _ 0F BE. 45, FB
        and     eax, 08H                                ; 06AE _ 83. E0, 08
        test    eax, eax                                ; 06B1 _ 85. C0
        jz      ?_018                                   ; 06B3 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 06B5 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 06B8 _ 8B. 45, FC
        add     eax, edx                                ; 06BB _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 06BD _ 0F AF. 45, 0C
        mov     edx, eax                                ; 06C1 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 06C3 _ 8B. 45, 10
        add     eax, edx                                ; 06C6 _ 01. D0
        lea     edx, [eax+4H]                           ; 06C8 _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 06CB _ 8B. 45, 08
        add     edx, eax                                ; 06CE _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 06D0 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 06D4 _ 88. 02
?_018:  movsx   eax, byte [ebp-5H]                      ; 06D6 _ 0F BE. 45, FB
        and     eax, 04H                                ; 06DA _ 83. E0, 04
        test    eax, eax                                ; 06DD _ 85. C0
        jz      ?_019                                   ; 06DF _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 06E1 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 06E4 _ 8B. 45, FC
        add     eax, edx                                ; 06E7 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 06E9 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 06ED _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 06EF _ 8B. 45, 10
        add     eax, edx                                ; 06F2 _ 01. D0
        lea     edx, [eax+5H]                           ; 06F4 _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 06F7 _ 8B. 45, 08
        add     edx, eax                                ; 06FA _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 06FC _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0700 _ 88. 02
?_019:  movsx   eax, byte [ebp-5H]                      ; 0702 _ 0F BE. 45, FB
        and     eax, 02H                                ; 0706 _ 83. E0, 02
        test    eax, eax                                ; 0709 _ 85. C0
        jz      ?_020                                   ; 070B _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 070D _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0710 _ 8B. 45, FC
        add     eax, edx                                ; 0713 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0715 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0719 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 071B _ 8B. 45, 10
        add     eax, edx                                ; 071E _ 01. D0
        lea     edx, [eax+6H]                           ; 0720 _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 0723 _ 8B. 45, 08
        add     edx, eax                                ; 0726 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0728 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 072C _ 88. 02
?_020:  movsx   eax, byte [ebp-5H]                      ; 072E _ 0F BE. 45, FB
        and     eax, 01H                                ; 0732 _ 83. E0, 01
        test    eax, eax                                ; 0735 _ 85. C0
        jz      ?_021                                   ; 0737 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 0739 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 073C _ 8B. 45, FC
        add     eax, edx                                ; 073F _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0741 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0745 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0747 _ 8B. 45, 10
        add     eax, edx                                ; 074A _ 01. D0
        lea     edx, [eax+7H]                           ; 074C _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 074F _ 8B. 45, 08
        add     edx, eax                                ; 0752 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0754 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0758 _ 88. 02
?_021:  add     dword [ebp-4H], 1                       ; 075A _ 83. 45, FC, 01
?_022:  cmp     dword [ebp-4H], 15                      ; 075E _ 83. 7D, FC, 0F
        jle     ?_013                                   ; 0762 _ 0F 8E, FFFFFE8A
        nop                                             ; 0768 _ 90
        leave                                           ; 0769 _ C9
        ret                                             ; 076A _ C3
; showChar8 End of function

init_mouse_cursor:; Function begin
        push    ebp                                     ; 076B _ 55
        mov     ebp, esp                                ; 076C _ 89. E5
        sub     esp, 20                                 ; 076E _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 0771 _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 0774 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 0777 _ C7. 45, FC, 00000000
        jmp     ?_029                                   ; 077E _ E9, 000000B5

?_023:  mov     dword [ebp-8H], 0                       ; 0783 _ C7. 45, F8, 00000000
        jmp     ?_028                                   ; 078A _ E9, 0000009B

?_024:  mov     eax, dword [ebp-4H]                     ; 078F _ 8B. 45, FC
        shl     eax, 4                                  ; 0792 _ C1. E0, 04
        mov     edx, eax                                ; 0795 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0797 _ 8B. 45, F8
        add     eax, edx                                ; 079A _ 01. D0
        add     eax, cursor.1632                        ; 079C _ 05, 00000060(d)
        movzx   eax, byte [eax]                         ; 07A1 _ 0F B6. 00
        cmp     al, 42                                  ; 07A4 _ 3C, 2A
        jnz     ?_025                                   ; 07A6 _ 75, 19
        mov     eax, dword [ebp-4H]                     ; 07A8 _ 8B. 45, FC
        shl     eax, 4                                  ; 07AB _ C1. E0, 04
        mov     edx, eax                                ; 07AE _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 07B0 _ 8B. 45, F8
        add     eax, edx                                ; 07B3 _ 01. D0
        mov     edx, eax                                ; 07B5 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 07B7 _ 8B. 45, 08
        add     eax, edx                                ; 07BA _ 01. D0
        mov     byte [eax], 0                           ; 07BC _ C6. 00, 00
        jmp     ?_027                                   ; 07BF _ EB, 65

?_025:  mov     eax, dword [ebp-4H]                     ; 07C1 _ 8B. 45, FC
        shl     eax, 4                                  ; 07C4 _ C1. E0, 04
        mov     edx, eax                                ; 07C7 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 07C9 _ 8B. 45, F8
        add     eax, edx                                ; 07CC _ 01. D0
        add     eax, cursor.1632                        ; 07CE _ 05, 00000060(d)
        movzx   eax, byte [eax]                         ; 07D3 _ 0F B6. 00
        cmp     al, 79                                  ; 07D6 _ 3C, 4F
        jnz     ?_026                                   ; 07D8 _ 75, 19
        mov     eax, dword [ebp-4H]                     ; 07DA _ 8B. 45, FC
        shl     eax, 4                                  ; 07DD _ C1. E0, 04
        mov     edx, eax                                ; 07E0 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 07E2 _ 8B. 45, F8
        add     eax, edx                                ; 07E5 _ 01. D0
        mov     edx, eax                                ; 07E7 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 07E9 _ 8B. 45, 08
        add     eax, edx                                ; 07EC _ 01. D0
        mov     byte [eax], 7                           ; 07EE _ C6. 00, 07
        jmp     ?_027                                   ; 07F1 _ EB, 33

?_026:  mov     eax, dword [ebp-4H]                     ; 07F3 _ 8B. 45, FC
        shl     eax, 4                                  ; 07F6 _ C1. E0, 04
        mov     edx, eax                                ; 07F9 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 07FB _ 8B. 45, F8
        add     eax, edx                                ; 07FE _ 01. D0
        add     eax, cursor.1632                        ; 0800 _ 05, 00000060(d)
        movzx   eax, byte [eax]                         ; 0805 _ 0F B6. 00
        cmp     al, 46                                  ; 0808 _ 3C, 2E
        jnz     ?_027                                   ; 080A _ 75, 1A
        mov     eax, dword [ebp-4H]                     ; 080C _ 8B. 45, FC
        shl     eax, 4                                  ; 080F _ C1. E0, 04
        mov     edx, eax                                ; 0812 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0814 _ 8B. 45, F8
        add     eax, edx                                ; 0817 _ 01. D0
        mov     edx, eax                                ; 0819 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 081B _ 8B. 45, 08
        add     edx, eax                                ; 081E _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0820 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0824 _ 88. 02
?_027:  add     dword [ebp-8H], 1                       ; 0826 _ 83. 45, F8, 01
?_028:  cmp     dword [ebp-8H], 15                      ; 082A _ 83. 7D, F8, 0F
        jle     ?_024                                   ; 082E _ 0F 8E, FFFFFF5B
        add     dword [ebp-4H], 1                       ; 0834 _ 83. 45, FC, 01
?_029:  cmp     dword [ebp-4H], 15                      ; 0838 _ 83. 7D, FC, 0F
        jle     ?_023                                   ; 083C _ 0F 8E, FFFFFF41
        nop                                             ; 0842 _ 90
        leave                                           ; 0843 _ C9
        ret                                             ; 0844 _ C3
; init_mouse_cursor End of function

putblock:; Function begin
        push    ebp                                     ; 0845 _ 55
        mov     ebp, esp                                ; 0846 _ 89. E5
        push    ebx                                     ; 0848 _ 53
        sub     esp, 16                                 ; 0849 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 084C _ C7. 45, F8, 00000000
        jmp     ?_033                                   ; 0853 _ EB, 50

?_030:  mov     dword [ebp-0CH], 0                      ; 0855 _ C7. 45, F4, 00000000
        jmp     ?_032                                   ; 085C _ EB, 3B

?_031:  mov     eax, dword [ebp-8H]                     ; 085E _ 8B. 45, F8
        imul    eax, dword [ebp+24H]                    ; 0861 _ 0F AF. 45, 24
        mov     edx, eax                                ; 0865 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 0867 _ 8B. 45, F4
        add     eax, edx                                ; 086A _ 01. D0
        mov     edx, eax                                ; 086C _ 89. C2
        mov     eax, dword [ebp+20H]                    ; 086E _ 8B. 45, 20
        add     eax, edx                                ; 0871 _ 01. D0
        mov     ecx, dword [ebp+1CH]                    ; 0873 _ 8B. 4D, 1C
        mov     edx, dword [ebp-8H]                     ; 0876 _ 8B. 55, F8
        add     edx, ecx                                ; 0879 _ 01. CA
        imul    edx, dword [ebp+0CH]                    ; 087B _ 0F AF. 55, 0C
        mov     ebx, dword [ebp+18H]                    ; 087F _ 8B. 5D, 18
        mov     ecx, dword [ebp-0CH]                    ; 0882 _ 8B. 4D, F4
        add     ecx, ebx                                ; 0885 _ 01. D9
        add     edx, ecx                                ; 0887 _ 01. CA
        mov     ecx, edx                                ; 0889 _ 89. D1
        mov     edx, dword [ebp+8H]                     ; 088B _ 8B. 55, 08
        add     edx, ecx                                ; 088E _ 01. CA
        movzx   eax, byte [eax]                         ; 0890 _ 0F B6. 00
        mov     byte [edx], al                          ; 0893 _ 88. 02
        add     dword [ebp-0CH], 1                      ; 0895 _ 83. 45, F4, 01
?_032:  mov     eax, dword [ebp-0CH]                    ; 0899 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 089C _ 3B. 45, 10
        jl      ?_031                                   ; 089F _ 7C, BD
        add     dword [ebp-8H], 1                       ; 08A1 _ 83. 45, F8, 01
?_033:  mov     eax, dword [ebp-8H]                     ; 08A5 _ 8B. 45, F8
        cmp     eax, dword [ebp+14H]                    ; 08A8 _ 3B. 45, 14
        jl      ?_030                                   ; 08AB _ 7C, A8
        nop                                             ; 08AD _ 90
        add     esp, 16                                 ; 08AE _ 83. C4, 10
        pop     ebx                                     ; 08B1 _ 5B
        pop     ebp                                     ; 08B2 _ 5D
        ret                                             ; 08B3 _ C3
; putblock End of function

intHandlerFromC:; Function begin
        push    ebp                                     ; 08B4 _ 55
        mov     ebp, esp                                ; 08B5 _ 89. E5
        sub     esp, 24                                 ; 08B7 _ 83. EC, 18
        mov     eax, dword [bootInfo]                   ; 08BA _ A1, 00000100(d)
        mov     dword [ebp-14H], eax                    ; 08BF _ 89. 45, EC
        movzx   eax, word [?_064]                       ; 08C2 _ 0F B7. 05, 00000104(d)
        cwde                                            ; 08C9 _ 98
        mov     dword [ebp-10H], eax                    ; 08CA _ 89. 45, F0
        movzx   eax, word [?_065]                       ; 08CD _ 0F B7. 05, 00000106(d)
        cwde                                            ; 08D4 _ 98
        mov     dword [ebp-0CH], eax                    ; 08D5 _ 89. 45, F4
        sub     esp, 8                                  ; 08D8 _ 83. EC, 08
        push    33                                      ; 08DB _ 6A, 21
        push    32                                      ; 08DD _ 6A, 20
        call    io_out8                                 ; 08DF _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 08E4 _ 83. C4, 10
        mov     byte [ebp-15H], 0                       ; 08E7 _ C6. 45, EB, 00
        sub     esp, 12                                 ; 08EB _ 83. EC, 0C
        push    96                                      ; 08EE _ 6A, 60
        call    io_in8                                  ; 08F0 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 08F5 _ 83. C4, 10
        mov     byte [ebp-15H], al                      ; 08F8 _ 88. 45, EB
        movzx   eax, byte [ebp-15H]                     ; 08FB _ 0F B6. 45, EB
        sub     esp, 8                                  ; 08FF _ 83. EC, 08
        push    eax                                     ; 0902 _ 50
        push    keyinfo                                 ; 0903 _ 68, 00000120(d)
        call    fifo8_put                               ; 0908 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 090D _ 83. C4, 10
        nop                                             ; 0910 _ 90
        leave                                           ; 0911 _ C9
        ret                                             ; 0912 _ C3
; intHandlerFromC End of function

charToHexVal:; Function begin
        push    ebp                                     ; 0913 _ 55
        mov     ebp, esp                                ; 0914 _ 89. E5
        sub     esp, 4                                  ; 0916 _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 0919 _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 091C _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 091F _ 80. 7D, FC, 09
        jle     ?_034                                   ; 0923 _ 7E, 09
        movzx   eax, byte [ebp-4H]                      ; 0925 _ 0F B6. 45, FC
        add     eax, 55                                 ; 0929 _ 83. C0, 37
        jmp     ?_035                                   ; 092C _ EB, 07

?_034:  movzx   eax, byte [ebp-4H]                      ; 092E _ 0F B6. 45, FC
        add     eax, 48                                 ; 0932 _ 83. C0, 30
?_035:  leave                                           ; 0935 _ C9
        ret                                             ; 0936 _ C3
; charToHexVal End of function

charToHexStr:; Function begin
        push    ebp                                     ; 0937 _ 55
        mov     ebp, esp                                ; 0938 _ 89. E5
        sub     esp, 20                                 ; 093A _ 83. EC, 14
        mov     eax, dword [ebp+8H]                     ; 093D _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 0940 _ 88. 45, EC
        movzx   eax, byte [ebp-14H]                     ; 0943 _ 0F B6. 45, EC
        and     eax, 0FH                                ; 0947 _ 83. E0, 0F
        mov     byte [ebp-1H], al                       ; 094A _ 88. 45, FF
        movsx   eax, byte [ebp-1H]                      ; 094D _ 0F BE. 45, FF
        push    eax                                     ; 0951 _ 50
        call    charToHexVal                            ; 0952 _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 0957 _ 83. C4, 04
        mov     byte [?_063], al                        ; 095A _ A2, 00000003(d)
        shr     byte [ebp-14H], 4                       ; 095F _ C0. 6D, EC, 04
        movzx   eax, byte [ebp-14H]                     ; 0963 _ 0F B6. 45, EC
        movsx   eax, al                                 ; 0967 _ 0F BE. C0
        push    eax                                     ; 096A _ 50
        call    charToHexVal                            ; 096B _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 0970 _ 83. C4, 04
        mov     byte [?_062], al                        ; 0973 _ A2, 00000002(d)
        mov     eax, keyval                             ; 0978 _ B8, 00000000(d)
        leave                                           ; 097D _ C9
        ret                                             ; 097E _ C3
; charToHexStr End of function

intToHexStr:; Function begin
        push    ebp                                     ; 097F _ 55
        mov     ebp, esp                                ; 0980 _ 89. E5
        sub     esp, 16                                 ; 0982 _ 83. EC, 10
        mov     byte [str.1679], 48                     ; 0985 _ C6. 05, 000001FC(d), 30
        mov     byte [?_066], 88                        ; 098C _ C6. 05, 000001FD(d), 58
        mov     byte [?_067], 0                         ; 0993 _ C6. 05, 00000206(d), 00
        mov     dword [ebp-8H], 2                       ; 099A _ C7. 45, F8, 00000002
        mov     dword [ebp-0CH], 7                      ; 09A1 _ C7. 45, F4, 00000007
        jmp     ?_039                                   ; 09A8 _ EB, 45

?_036:  mov     eax, dword [ebp+8H]                     ; 09AA _ 8B. 45, 08
        and     eax, 0FH                                ; 09AD _ 83. E0, 0F
        mov     dword [ebp-4H], eax                     ; 09B0 _ 89. 45, FC
        cmp     dword [ebp-4H], 9                       ; 09B3 _ 83. 7D, FC, 09
        jg      ?_037                                   ; 09B7 _ 7F, 18
        mov     eax, dword [ebp-4H]                     ; 09B9 _ 8B. 45, FC
        lea     ecx, [eax+30H]                          ; 09BC _ 8D. 48, 30
        mov     edx, dword [ebp-8H]                     ; 09BF _ 8B. 55, F8
        mov     eax, dword [ebp-0CH]                    ; 09C2 _ 8B. 45, F4
        add     eax, edx                                ; 09C5 _ 01. D0
        mov     edx, ecx                                ; 09C7 _ 89. CA
        mov     byte [str.1679+eax], dl                 ; 09C9 _ 88. 90, 000001FC(d)
        jmp     ?_038                                   ; 09CF _ EB, 16

?_037:  mov     eax, dword [ebp-4H]                     ; 09D1 _ 8B. 45, FC
        lea     ecx, [eax+37H]                          ; 09D4 _ 8D. 48, 37
        mov     edx, dword [ebp-8H]                     ; 09D7 _ 8B. 55, F8
        mov     eax, dword [ebp-0CH]                    ; 09DA _ 8B. 45, F4
        add     eax, edx                                ; 09DD _ 01. D0
        mov     edx, ecx                                ; 09DF _ 89. CA
        mov     byte [str.1679+eax], dl                 ; 09E1 _ 88. 90, 000001FC(d)
?_038:  shr     dword [ebp+8H], 4                       ; 09E7 _ C1. 6D, 08, 04
        sub     dword [ebp-0CH], 1                      ; 09EB _ 83. 6D, F4, 01
?_039:  cmp     dword [ebp-0CH], 0                      ; 09EF _ 83. 7D, F4, 00
        jns     ?_036                                   ; 09F3 _ 79, B5
        mov     eax, str.1679                           ; 09F5 _ B8, 000001FC(d)
        leave                                           ; 09FA _ C9
        ret                                             ; 09FB _ C3
; intToHexStr End of function

wait_KBC_sendReady:; Function begin
        push    ebp                                     ; 09FC _ 55
        mov     ebp, esp                                ; 09FD _ 89. E5
        sub     esp, 8                                  ; 09FF _ 83. EC, 08
?_040:  sub     esp, 12                                 ; 0A02 _ 83. EC, 0C
        push    100                                     ; 0A05 _ 6A, 64
        call    io_in8                                  ; 0A07 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0A0C _ 83. C4, 10
        and     eax, 02H                                ; 0A0F _ 83. E0, 02
        test    eax, eax                                ; 0A12 _ 85. C0
        jz      ?_041                                   ; 0A14 _ 74, 02
        jmp     ?_040                                   ; 0A16 _ EB, EA
; wait_KBC_sendReady End of function

?_041:  ; Local function
        nop                                             ; 0A18 _ 90
        nop                                             ; 0A19 _ 90
        leave                                           ; 0A1A _ C9
        ret                                             ; 0A1B _ C3

init_keyboard:; Function begin
        push    ebp                                     ; 0A1C _ 55
        mov     ebp, esp                                ; 0A1D _ 89. E5
        sub     esp, 8                                  ; 0A1F _ 83. EC, 08
        call    wait_KBC_sendReady                      ; 0A22 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0A27 _ 83. EC, 08
        push    96                                      ; 0A2A _ 6A, 60
        push    100                                     ; 0A2C _ 6A, 64
        call    io_out8                                 ; 0A2E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0A33 _ 83. C4, 10
        call    wait_KBC_sendReady                      ; 0A36 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0A3B _ 83. EC, 08
        push    71                                      ; 0A3E _ 6A, 47
        push    96                                      ; 0A40 _ 6A, 60
        call    io_out8                                 ; 0A42 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0A47 _ 83. C4, 10
        nop                                             ; 0A4A _ 90
        leave                                           ; 0A4B _ C9
        ret                                             ; 0A4C _ C3
; init_keyboard End of function

enable_mouse:; Function begin
        push    ebp                                     ; 0A4D _ 55
        mov     ebp, esp                                ; 0A4E _ 89. E5
        sub     esp, 8                                  ; 0A50 _ 83. EC, 08
        call    wait_KBC_sendReady                      ; 0A53 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0A58 _ 83. EC, 08
        push    212                                     ; 0A5B _ 68, 000000D4
        push    100                                     ; 0A60 _ 6A, 64
        call    io_out8                                 ; 0A62 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0A67 _ 83. C4, 10
        call    wait_KBC_sendReady                      ; 0A6A _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0A6F _ 83. EC, 08
        push    244                                     ; 0A72 _ 68, 000000F4
        push    96                                      ; 0A77 _ 6A, 60
        call    io_out8                                 ; 0A79 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0A7E _ 83. C4, 10
        nop                                             ; 0A81 _ 90
        leave                                           ; 0A82 _ C9
        ret                                             ; 0A83 _ C3
; enable_mouse End of function

intHandlerFromMouse:; Function begin
        push    ebp                                     ; 0A84 _ 55
        mov     ebp, esp                                ; 0A85 _ 89. E5
        sub     esp, 24                                 ; 0A87 _ 83. EC, 18
        sub     esp, 8                                  ; 0A8A _ 83. EC, 08
        push    32                                      ; 0A8D _ 6A, 20
        push    160                                     ; 0A8F _ 68, 000000A0
        call    io_out8                                 ; 0A94 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0A99 _ 83. C4, 10
        sub     esp, 8                                  ; 0A9C _ 83. EC, 08
        push    32                                      ; 0A9F _ 6A, 20
        push    32                                      ; 0AA1 _ 6A, 20
        call    io_out8                                 ; 0AA3 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0AA8 _ 83. C4, 10
        sub     esp, 12                                 ; 0AAB _ 83. EC, 0C
        push    96                                      ; 0AAE _ 6A, 60
        call    io_in8                                  ; 0AB0 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0AB5 _ 83. C4, 10
        mov     byte [ebp-9H], al                       ; 0AB8 _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 0ABB _ 0F B6. 45, F7
        sub     esp, 8                                  ; 0ABF _ 83. EC, 08
        push    eax                                     ; 0AC2 _ 50
        push    mouseinfo                               ; 0AC3 _ 68, 00000108(d)
        call    fifo8_put                               ; 0AC8 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0ACD _ 83. C4, 10
        nop                                             ; 0AD0 _ 90
        leave                                           ; 0AD1 _ C9
        ret                                             ; 0AD2 _ C3
; intHandlerFromMouse End of function

fifo8_init:; Function begin
        push    ebp                                     ; 0AD3 _ 55
        mov     ebp, esp                                ; 0AD4 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 0AD6 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 0AD9 _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 0ADC _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 0ADF _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 0AE2 _ 8B. 55, 10
        mov     dword [eax], edx                        ; 0AE5 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 0AE7 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 0AEA _ 8B. 55, 0C
        mov     dword [eax+10H], edx                    ; 0AED _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 0AF0 _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 0AF3 _ C7. 40, 14, 00000000
        mov     eax, dword [ebp+8H]                     ; 0AFA _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 0AFD _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 0B04 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 0B07 _ C7. 40, 08, 00000000
        nop                                             ; 0B0E _ 90
        pop     ebp                                     ; 0B0F _ 5D
        ret                                             ; 0B10 _ C3
; fifo8_init End of function

fifo8_put:; Function begin
        push    ebp                                     ; 0B11 _ 55
        mov     ebp, esp                                ; 0B12 _ 89. E5
        sub     esp, 4                                  ; 0B14 _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 0B17 _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 0B1A _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0B1D _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0B20 _ 8B. 40, 10
        test    eax, eax                                ; 0B23 _ 85. C0
        jnz     ?_042                                   ; 0B25 _ 75, 18
        mov     eax, dword [ebp+8H]                     ; 0B27 _ 8B. 45, 08
        mov     eax, dword [eax+14H]                    ; 0B2A _ 8B. 40, 14
        or      eax, 01H                                ; 0B2D _ 83. C8, 01
        mov     edx, eax                                ; 0B30 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0B32 _ 8B. 45, 08
        mov     dword [eax+14H], edx                    ; 0B35 _ 89. 50, 14
        mov     eax, 4294967295                         ; 0B38 _ B8, FFFFFFFF
        jmp     ?_044                                   ; 0B3D _ EB, 50

?_042:  mov     eax, dword [ebp+8H]                     ; 0B3F _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 0B42 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 0B44 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0B47 _ 8B. 40, 04
        add     edx, eax                                ; 0B4A _ 01. C2
        movzx   eax, byte [ebp-4H]                      ; 0B4C _ 0F B6. 45, FC
        mov     byte [edx], al                          ; 0B50 _ 88. 02
        mov     eax, dword [ebp+8H]                     ; 0B52 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0B55 _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 0B58 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0B5B _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 0B5E _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0B61 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 0B64 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0B67 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0B6A _ 8B. 40, 0C
        cmp     edx, eax                                ; 0B6D _ 39. C2
        jnz     ?_043                                   ; 0B6F _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 0B71 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 0B74 _ C7. 40, 04, 00000000
?_043:  mov     eax, dword [ebp+8H]                     ; 0B7B _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0B7E _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 0B81 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 0B84 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 0B87 _ 89. 50, 10
        mov     eax, 0                                  ; 0B8A _ B8, 00000000
?_044:  leave                                           ; 0B8F _ C9
        ret                                             ; 0B90 _ C3
; fifo8_put End of function

fifo8_get:; Function begin
        push    ebp                                     ; 0B91 _ 55
        mov     ebp, esp                                ; 0B92 _ 89. E5
        sub     esp, 16                                 ; 0B94 _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 0B97 _ 8B. 45, 08
        mov     edx, dword [eax+10H]                    ; 0B9A _ 8B. 50, 10
        mov     eax, dword [ebp+8H]                     ; 0B9D _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0BA0 _ 8B. 40, 0C
        cmp     edx, eax                                ; 0BA3 _ 39. C2
        jnz     ?_045                                   ; 0BA5 _ 75, 07
        mov     eax, 4294967295                         ; 0BA7 _ B8, FFFFFFFF
        jmp     ?_047                                   ; 0BAC _ EB, 51

?_045:  mov     eax, dword [ebp+8H]                     ; 0BAE _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 0BB1 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 0BB3 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0BB6 _ 8B. 40, 08
        add     eax, edx                                ; 0BB9 _ 01. D0
        movzx   eax, byte [eax]                         ; 0BBB _ 0F B6. 00
        movzx   eax, al                                 ; 0BBE _ 0F B6. C0
        mov     dword [ebp-4H], eax                     ; 0BC1 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0BC4 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0BC7 _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 0BCA _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0BCD _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0BD0 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 0BD3 _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 0BD6 _ 8B. 50, 08
        mov     eax, dword [ebp+8H]                     ; 0BD9 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0BDC _ 8B. 40, 0C
        cmp     edx, eax                                ; 0BDF _ 39. C2
        jnz     ?_046                                   ; 0BE1 _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 0BE3 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 0BE6 _ C7. 40, 08, 00000000
?_046:  mov     eax, dword [ebp+8H]                     ; 0BED _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0BF0 _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 0BF3 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0BF6 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 0BF9 _ 89. 50, 10
        mov     eax, dword [ebp-4H]                     ; 0BFC _ 8B. 45, FC
?_047:  leave                                           ; 0BFF _ C9
        ret                                             ; 0C00 _ C3
; fifo8_get End of function

fifo8_status:; Function begin
        push    ebp                                     ; 0C01 _ 55
        mov     ebp, esp                                ; 0C02 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 0C04 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 0C07 _ 8B. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 0C0A _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0C0D _ 8B. 40, 10
        sub     edx, eax                                ; 0C10 _ 29. C2
        mov     eax, edx                                ; 0C12 _ 89. D0
        pop     ebp                                     ; 0C14 _ 5D
        ret                                             ; 0C15 _ C3
; fifo8_status End of function

mouse_decode:; Function begin
        push    ebp                                     ; 0C16 _ 55
        mov     ebp, esp                                ; 0C17 _ 89. E5
        sub     esp, 4                                  ; 0C19 _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 0C1C _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 0C1F _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0C22 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 0C25 _ 0F B6. 40, 03
        test    al, al                                  ; 0C29 _ 84. C0
        jnz     ?_049                                   ; 0C2B _ 75, 17
        cmp     byte [ebp-4H], -6                       ; 0C2D _ 80. 7D, FC, FA
        jnz     ?_048                                   ; 0C31 _ 75, 07
        mov     eax, dword [ebp+8H]                     ; 0C33 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 0C36 _ C6. 40, 03, 01
?_048:  mov     eax, 0                                  ; 0C3A _ B8, 00000000
        jmp     ?_056                                   ; 0C3F _ E9, 0000010F

?_049:  mov     eax, dword [ebp+8H]                     ; 0C44 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 0C47 _ 0F B6. 40, 03
        cmp     al, 1                                   ; 0C4B _ 3C, 01
        jnz     ?_051                                   ; 0C4D _ 75, 28
        movzx   eax, byte [ebp-4H]                      ; 0C4F _ 0F B6. 45, FC
        and     eax, 0C8H                               ; 0C53 _ 25, 000000C8
        cmp     eax, 8                                  ; 0C58 _ 83. F8, 08
        jnz     ?_050                                   ; 0C5B _ 75, 10
        mov     eax, dword [ebp+8H]                     ; 0C5D _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 0C60 _ 0F B6. 55, FC
        mov     byte [eax], dl                          ; 0C64 _ 88. 10
        mov     eax, dword [ebp+8H]                     ; 0C66 _ 8B. 45, 08
        mov     byte [eax+3H], 2                        ; 0C69 _ C6. 40, 03, 02
?_050:  mov     eax, 0                                  ; 0C6D _ B8, 00000000
        jmp     ?_056                                   ; 0C72 _ E9, 000000DC

?_051:  mov     eax, dword [ebp+8H]                     ; 0C77 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 0C7A _ 0F B6. 40, 03
        cmp     al, 2                                   ; 0C7E _ 3C, 02
        jnz     ?_052                                   ; 0C80 _ 75, 1B
        mov     eax, dword [ebp+8H]                     ; 0C82 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 0C85 _ 0F B6. 55, FC
        mov     byte [eax+1H], dl                       ; 0C89 _ 88. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0C8C _ 8B. 45, 08
        mov     byte [eax+3H], 3                        ; 0C8F _ C6. 40, 03, 03
        mov     eax, 0                                  ; 0C93 _ B8, 00000000
        jmp     ?_056                                   ; 0C98 _ E9, 000000B6

?_052:  mov     eax, dword [ebp+8H]                     ; 0C9D _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 0CA0 _ 0F B6. 40, 03
        cmp     al, 3                                   ; 0CA4 _ 3C, 03
        jne     ?_055                                   ; 0CA6 _ 0F 85, 000000A2
        mov     eax, dword [ebp+8H]                     ; 0CAC _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 0CAF _ 0F B6. 55, FC
        mov     byte [eax+2H], dl                       ; 0CB3 _ 88. 50, 02
        mov     eax, dword [ebp+8H]                     ; 0CB6 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 0CB9 _ C6. 40, 03, 01
        mov     eax, dword [ebp+8H]                     ; 0CBD _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 0CC0 _ 0F B6. 00
        movzx   eax, al                                 ; 0CC3 _ 0F B6. C0
        and     eax, 07H                                ; 0CC6 _ 83. E0, 07
        mov     edx, eax                                ; 0CC9 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0CCB _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 0CCE _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 0CD1 _ 8B. 45, 08
        movzx   eax, byte [eax+1H]                      ; 0CD4 _ 0F B6. 40, 01
        movzx   edx, al                                 ; 0CD8 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 0CDB _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 0CDE _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0CE1 _ 8B. 45, 08
        movzx   eax, byte [eax+2H]                      ; 0CE4 _ 0F B6. 40, 02
        movzx   edx, al                                 ; 0CE8 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 0CEB _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0CEE _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 0CF1 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 0CF4 _ 0F B6. 00
        movzx   eax, al                                 ; 0CF7 _ 0F B6. C0
        and     eax, 10H                                ; 0CFA _ 83. E0, 10
        test    eax, eax                                ; 0CFD _ 85. C0
        jz      ?_053                                   ; 0CFF _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 0D01 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0D04 _ 8B. 40, 04
        or      eax, 0FFFFFF00H                         ; 0D07 _ 0D, FFFFFF00
        mov     edx, eax                                ; 0D0C _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0D0E _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 0D11 _ 89. 50, 04
?_053:  mov     eax, dword [ebp+8H]                     ; 0D14 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 0D17 _ 0F B6. 00
        movzx   eax, al                                 ; 0D1A _ 0F B6. C0
        and     eax, 20H                                ; 0D1D _ 83. E0, 20
        test    eax, eax                                ; 0D20 _ 85. C0
        jz      ?_054                                   ; 0D22 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 0D24 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0D27 _ 8B. 40, 08
        or      eax, 0FFFFFF00H                         ; 0D2A _ 0D, FFFFFF00
        mov     edx, eax                                ; 0D2F _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0D31 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0D34 _ 89. 50, 08
?_054:  mov     eax, dword [ebp+8H]                     ; 0D37 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0D3A _ 8B. 40, 08
        neg     eax                                     ; 0D3D _ F7. D8
        mov     edx, eax                                ; 0D3F _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0D41 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0D44 _ 89. 50, 08
        mov     eax, 1                                  ; 0D47 _ B8, 00000001
        jmp     ?_056                                   ; 0D4C _ EB, 05

?_055:  mov     eax, 4294967295                         ; 0D4E _ B8, FFFFFFFF
?_056:  leave                                           ; 0D53 _ C9
        ret                                             ; 0D54 _ C3
; mouse_decode End of function

computeMousePosition:; Function begin
        push    ebp                                     ; 0D55 _ 55
        mov     ebp, esp                                ; 0D56 _ 89. E5
        sub     esp, 16                                 ; 0D58 _ 83. EC, 10
        movzx   eax, word [?_064]                       ; 0D5B _ 0F B7. 05, 00000104(d)
        cwde                                            ; 0D62 _ 98
        mov     dword [ebp-8H], eax                     ; 0D63 _ 89. 45, F8
        movzx   eax, word [?_065]                       ; 0D66 _ 0F B7. 05, 00000106(d)
        cwde                                            ; 0D6D _ 98
        mov     dword [ebp-4H], eax                     ; 0D6E _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0D71 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 0D74 _ 8B. 50, 04
        mov     eax, dword [mx]                         ; 0D77 _ A1, 000001F0(d)
        add     eax, edx                                ; 0D7C _ 01. D0
        mov     dword [mx], eax                         ; 0D7E _ A3, 000001F0(d)
        mov     eax, dword [ebp+8H]                     ; 0D83 _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 0D86 _ 8B. 50, 08
        mov     eax, dword [my]                         ; 0D89 _ A1, 000001F4(d)
        add     eax, edx                                ; 0D8E _ 01. D0
        mov     dword [my], eax                         ; 0D90 _ A3, 000001F4(d)
        mov     eax, dword [mx]                         ; 0D95 _ A1, 000001F0(d)
        test    eax, eax                                ; 0D9A _ 85. C0
        jns     ?_057                                   ; 0D9C _ 79, 0A
        mov     dword [mx], 0                           ; 0D9E _ C7. 05, 000001F0(d), 00000000
?_057:  mov     eax, dword [my]                         ; 0DA8 _ A1, 000001F4(d)
        test    eax, eax                                ; 0DAD _ 85. C0
        jns     ?_058                                   ; 0DAF _ 79, 0A
        mov     dword [my], 0                           ; 0DB1 _ C7. 05, 000001F4(d), 00000000
?_058:  mov     eax, dword [ebp-8H]                     ; 0DBB _ 8B. 45, F8
        lea     edx, [eax-10H]                          ; 0DBE _ 8D. 50, F0
        mov     eax, dword [mx]                         ; 0DC1 _ A1, 000001F0(d)
        cmp     edx, eax                                ; 0DC6 _ 39. C2
        jge     ?_059                                   ; 0DC8 _ 7D, 0B
        mov     eax, dword [ebp-8H]                     ; 0DCA _ 8B. 45, F8
        sub     eax, 16                                 ; 0DCD _ 83. E8, 10
        mov     dword [mx], eax                         ; 0DD0 _ A3, 000001F0(d)
?_059:  mov     eax, dword [ebp-4H]                     ; 0DD5 _ 8B. 45, FC
        lea     edx, [eax-10H]                          ; 0DD8 _ 8D. 50, F0
        mov     eax, dword [my]                         ; 0DDB _ A1, 000001F4(d)
        cmp     edx, eax                                ; 0DE0 _ 39. C2
        jge     ?_060                                   ; 0DE2 _ 7D, 0B
        mov     eax, dword [ebp-4H]                     ; 0DE4 _ 8B. 45, FC
        sub     eax, 16                                 ; 0DE7 _ 83. E8, 10
        mov     dword [my], eax                         ; 0DEA _ A3, 000001F4(d)
?_060:  nop                                             ; 0DEF _ 90
        leave                                           ; 0DF0 _ C9
        ret                                             ; 0DF1 _ C3
; computeMousePosition End of function

eraseMouse:; Function begin
        push    ebp                                     ; 0DF2 _ 55
        mov     ebp, esp                                ; 0DF3 _ 89. E5
        push    ebx                                     ; 0DF5 _ 53
        sub     esp, 16                                 ; 0DF6 _ 83. EC, 10
        movzx   eax, word [?_064]                       ; 0DF9 _ 0F B7. 05, 00000104(d)
        cwde                                            ; 0E00 _ 98
        mov     dword [ebp-0CH], eax                    ; 0E01 _ 89. 45, F4
        movzx   eax, word [?_065]                       ; 0E04 _ 0F B7. 05, 00000106(d)
        cwde                                            ; 0E0B _ 98
        mov     dword [ebp-8H], eax                     ; 0E0C _ 89. 45, F8
        mov     eax, dword [my]                         ; 0E0F _ A1, 000001F4(d)
        lea     ebx, [eax+0FH]                          ; 0E14 _ 8D. 58, 0F
        mov     eax, dword [mx]                         ; 0E17 _ A1, 000001F0(d)
        lea     ecx, [eax+0FH]                          ; 0E1C _ 8D. 48, 0F
        mov     edx, dword [my]                         ; 0E1F _ 8B. 15, 000001F4(d)
        mov     eax, dword [mx]                         ; 0E25 _ A1, 000001F0(d)
        push    ebx                                     ; 0E2A _ 53
        push    ecx                                     ; 0E2B _ 51
        push    edx                                     ; 0E2C _ 52
        push    eax                                     ; 0E2D _ 50
        push    14                                      ; 0E2E _ 6A, 0E
        push    dword [ebp-0CH]                         ; 0E30 _ FF. 75, F4
        push    dword [ebp+8H]                          ; 0E33 _ FF. 75, 08
        call    boxfill8                                ; 0E36 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 0E3B _ 83. C4, 1C
        nop                                             ; 0E3E _ 90
        mov     ebx, dword [ebp-4H]                     ; 0E3F _ 8B. 5D, FC
        leave                                           ; 0E42 _ C9
        ret                                             ; 0E43 _ C3
; eraseMouse End of function

drawMouse:; Function begin
        push    ebp                                     ; 0E44 _ 55
        mov     ebp, esp                                ; 0E45 _ 89. E5
        sub     esp, 16                                 ; 0E47 _ 83. EC, 10
        movzx   eax, word [?_064]                       ; 0E4A _ 0F B7. 05, 00000104(d)
        cwde                                            ; 0E51 _ 98
        mov     dword [ebp-8H], eax                     ; 0E52 _ 89. 45, F8
        movzx   eax, word [?_065]                       ; 0E55 _ 0F B7. 05, 00000106(d)
        cwde                                            ; 0E5C _ 98
        mov     dword [ebp-4H], eax                     ; 0E5D _ 89. 45, FC
        mov     edx, dword [my]                         ; 0E60 _ 8B. 15, 000001F4(d)
        mov     eax, dword [mx]                         ; 0E66 _ A1, 000001F0(d)
        push    16                                      ; 0E6B _ 6A, 10
        push    mcursor                                 ; 0E6D _ 68, 00000000(d)
        push    edx                                     ; 0E72 _ 52
        push    eax                                     ; 0E73 _ 50
        push    16                                      ; 0E74 _ 6A, 10
        push    16                                      ; 0E76 _ 6A, 10
        push    dword [ebp-8H]                          ; 0E78 _ FF. 75, F8
        push    dword [ebp+8H]                          ; 0E7B _ FF. 75, 08
        call    putblock                                ; 0E7E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0E83 _ 83. C4, 20
        nop                                             ; 0E86 _ 90
        leave                                           ; 0E87 _ C9
        ret                                             ; 0E88 _ C3
; drawMouse End of function

show_mouse_info:; Function begin
        push    ebp                                     ; 0E89 _ 55
        mov     ebp, esp                                ; 0E8A _ 89. E5
        sub     esp, 16                                 ; 0E8C _ 83. EC, 10
        mov     eax, dword [bootInfo]                   ; 0E8F _ A1, 00000100(d)
        mov     dword [ebp-4H], eax                     ; 0E94 _ 89. 45, FC
        mov     byte [ebp-5H], 0                        ; 0E97 _ C6. 45, FB, 00
        push    mouseinfo                               ; 0E9B _ 68, 00000108(d)
        call    fifo8_get                               ; 0EA0 _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 0EA5 _ 83. C4, 04
        mov     byte [ebp-5H], al                       ; 0EA8 _ 88. 45, FB
        movzx   eax, byte [ebp-5H]                      ; 0EAB _ 0F B6. 45, FB
        push    eax                                     ; 0EAF _ 50
        push    mdec                                    ; 0EB0 _ 68, 000001E0(d)
        call    mouse_decode                            ; 0EB5 _ E8, FFFFFFFC(rel)
        add     esp, 8                                  ; 0EBA _ 83. C4, 08
        cmp     eax, 1                                  ; 0EBD _ 83. F8, 01
        jnz     ?_061                                   ; 0EC0 _ 75, 23
        push    dword [ebp-4H]                          ; 0EC2 _ FF. 75, FC
        call    eraseMouse                              ; 0EC5 _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 0ECA _ 83. C4, 04
        push    mdec                                    ; 0ECD _ 68, 000001E0(d)
        call    computeMousePosition                    ; 0ED2 _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 0ED7 _ 83. C4, 04
        push    dword [ebp-4H]                          ; 0EDA _ FF. 75, FC
        call    drawMouse                               ; 0EDD _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 0EE2 _ 83. C4, 04
?_061:  nop                                             ; 0EE5 _ 90
        leave                                           ; 0EE6 _ C9
        ret                                             ; 0EE7 _ C3
; show_mouse_info End of function

showMemoryInfo:; Function begin
        push    ebp                                     ; 0EE8 _ 55
        mov     ebp, esp                                ; 0EE9 _ 89. E5
        sub     esp, 56                                 ; 0EEB _ 83. EC, 38
        mov     dword [ebp-30H], 0                      ; 0EEE _ C7. 45, D0, 00000000
        mov     dword [ebp-2CH], 0                      ; 0EF5 _ C7. 45, D4, 00000000
        mov     dword [ebp-28H], 104                    ; 0EFC _ C7. 45, D8, 00000068
        mov     dword [ebp-24H], 80                     ; 0F03 _ C7. 45, DC, 00000050
        push    100                                     ; 0F0A _ 6A, 64
        push    dword [ebp+14H]                         ; 0F0C _ FF. 75, 14
        push    0                                       ; 0F0F _ 6A, 00
        push    0                                       ; 0F11 _ 6A, 00
        push    14                                      ; 0F13 _ 6A, 0E
        push    dword [ebp+14H]                         ; 0F15 _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 0F18 _ FF. 75, 0C
        call    boxfill8                                ; 0F1B _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 0F20 _ 83. C4, 1C
        mov     eax, dword [ebp+18H]                    ; 0F23 _ 8B. 45, 18
        movsx   eax, al                                 ; 0F26 _ 0F BE. C0
        sub     esp, 8                                  ; 0F29 _ 83. EC, 08
        push    ?_068                                   ; 0F2C _ 68, 00000000(d)
        push    eax                                     ; 0F31 _ 50
        push    dword [ebp-2CH]                         ; 0F32 _ FF. 75, D4
        push    dword [ebp-30H]                         ; 0F35 _ FF. 75, D0
        push    dword [ebp+14H]                         ; 0F38 _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 0F3B _ FF. 75, 0C
        call    showString                              ; 0F3E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0F43 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0F46 _ 8B. 45, 10
        sub     esp, 12                                 ; 0F49 _ 83. EC, 0C
        push    eax                                     ; 0F4C _ 50
        call    intToHexStr                             ; 0F4D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0F52 _ 83. C4, 10
        mov     dword [ebp-20H], eax                    ; 0F55 _ 89. 45, E0
        mov     eax, dword [ebp+18H]                    ; 0F58 _ 8B. 45, 18
        movsx   eax, al                                 ; 0F5B _ 0F BE. C0
        sub     esp, 8                                  ; 0F5E _ 83. EC, 08
        push    dword [ebp-20H]                         ; 0F61 _ FF. 75, E0
        push    eax                                     ; 0F64 _ 50
        push    dword [ebp-2CH]                         ; 0F65 _ FF. 75, D4
        push    dword [ebp-28H]                         ; 0F68 _ FF. 75, D8
        push    dword [ebp+14H]                         ; 0F6B _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 0F6E _ FF. 75, 0C
        call    showString                              ; 0F71 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0F76 _ 83. C4, 20
        add     dword [ebp-2CH], 16                     ; 0F79 _ 83. 45, D4, 10
        mov     eax, dword [ebp+18H]                    ; 0F7D _ 8B. 45, 18
        movsx   eax, al                                 ; 0F80 _ 0F BE. C0
        sub     esp, 8                                  ; 0F83 _ 83. EC, 08
        push    ?_069                                   ; 0F86 _ 68, 0000000A(d)
        push    eax                                     ; 0F8B _ 50
        push    dword [ebp-2CH]                         ; 0F8C _ FF. 75, D4
        push    dword [ebp-30H]                         ; 0F8F _ FF. 75, D0
        push    dword [ebp+14H]                         ; 0F92 _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 0F95 _ FF. 75, 0C
        call    showString                              ; 0F98 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0F9D _ 83. C4, 20
        mov     eax, dword [ebp+8H]                     ; 0FA0 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 0FA3 _ 8B. 00
        sub     esp, 12                                 ; 0FA5 _ 83. EC, 0C
        push    eax                                     ; 0FA8 _ 50
        call    intToHexStr                             ; 0FA9 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0FAE _ 83. C4, 10
        mov     dword [ebp-1CH], eax                    ; 0FB1 _ 89. 45, E4
        mov     eax, dword [ebp+18H]                    ; 0FB4 _ 8B. 45, 18
        movsx   eax, al                                 ; 0FB7 _ 0F BE. C0
        sub     esp, 8                                  ; 0FBA _ 83. EC, 08
        push    dword [ebp-1CH]                         ; 0FBD _ FF. 75, E4
        push    eax                                     ; 0FC0 _ 50
        push    dword [ebp-2CH]                         ; 0FC1 _ FF. 75, D4
        push    dword [ebp-28H]                         ; 0FC4 _ FF. 75, D8
        push    dword [ebp+14H]                         ; 0FC7 _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 0FCA _ FF. 75, 0C
        call    showString                              ; 0FCD _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0FD2 _ 83. C4, 20
        add     dword [ebp-2CH], 16                     ; 0FD5 _ 83. 45, D4, 10
        mov     eax, dword [ebp+18H]                    ; 0FD9 _ 8B. 45, 18
        movsx   eax, al                                 ; 0FDC _ 0F BE. C0
        sub     esp, 8                                  ; 0FDF _ 83. EC, 08
        push    ?_070                                   ; 0FE2 _ 68, 00000016(d)
        push    eax                                     ; 0FE7 _ 50
        push    dword [ebp-2CH]                         ; 0FE8 _ FF. 75, D4
        push    dword [ebp-30H]                         ; 0FEB _ FF. 75, D0
        push    dword [ebp+14H]                         ; 0FEE _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 0FF1 _ FF. 75, 0C
        call    showString                              ; 0FF4 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0FF9 _ 83. C4, 20
        mov     eax, dword [ebp+8H]                     ; 0FFC _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0FFF _ 8B. 40, 04
        sub     esp, 12                                 ; 1002 _ 83. EC, 0C
        push    eax                                     ; 1005 _ 50
        call    intToHexStr                             ; 1006 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 100B _ 83. C4, 10
        mov     dword [ebp-18H], eax                    ; 100E _ 89. 45, E8
        mov     eax, dword [ebp+18H]                    ; 1011 _ 8B. 45, 18
        movsx   eax, al                                 ; 1014 _ 0F BE. C0
        sub     esp, 8                                  ; 1017 _ 83. EC, 08
        push    dword [ebp-18H]                         ; 101A _ FF. 75, E8
        push    eax                                     ; 101D _ 50
        push    dword [ebp-2CH]                         ; 101E _ FF. 75, D4
        push    dword [ebp-28H]                         ; 1021 _ FF. 75, D8
        push    dword [ebp+14H]                         ; 1024 _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 1027 _ FF. 75, 0C
        call    showString                              ; 102A _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 102F _ 83. C4, 20
        add     dword [ebp-2CH], 16                     ; 1032 _ 83. 45, D4, 10
        mov     eax, dword [ebp+18H]                    ; 1036 _ 8B. 45, 18
        movsx   eax, al                                 ; 1039 _ 0F BE. C0
        sub     esp, 8                                  ; 103C _ 83. EC, 08
        push    ?_071                                   ; 103F _ 68, 00000022(d)
        push    eax                                     ; 1044 _ 50
        push    dword [ebp-2CH]                         ; 1045 _ FF. 75, D4
        push    dword [ebp-30H]                         ; 1048 _ FF. 75, D0
        push    dword [ebp+14H]                         ; 104B _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 104E _ FF. 75, 0C
        call    showString                              ; 1051 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1056 _ 83. C4, 20
        mov     eax, dword [ebp+8H]                     ; 1059 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 105C _ 8B. 40, 08
        sub     esp, 12                                 ; 105F _ 83. EC, 0C
        push    eax                                     ; 1062 _ 50
        call    intToHexStr                             ; 1063 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1068 _ 83. C4, 10
        mov     dword [ebp-14H], eax                    ; 106B _ 89. 45, EC
        mov     eax, dword [ebp+18H]                    ; 106E _ 8B. 45, 18
        movsx   eax, al                                 ; 1071 _ 0F BE. C0
        sub     esp, 8                                  ; 1074 _ 83. EC, 08
        push    dword [ebp-14H]                         ; 1077 _ FF. 75, EC
        push    eax                                     ; 107A _ 50
        push    dword [ebp-2CH]                         ; 107B _ FF. 75, D4
        push    dword [ebp-28H]                         ; 107E _ FF. 75, D8
        push    dword [ebp+14H]                         ; 1081 _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 1084 _ FF. 75, 0C
        call    showString                              ; 1087 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 108C _ 83. C4, 20
        add     dword [ebp-2CH], 16                     ; 108F _ 83. 45, D4, 10
        mov     eax, dword [ebp+18H]                    ; 1093 _ 8B. 45, 18
        movsx   eax, al                                 ; 1096 _ 0F BE. C0
        sub     esp, 8                                  ; 1099 _ 83. EC, 08
        push    ?_072                                   ; 109C _ 68, 0000002E(d)
        push    eax                                     ; 10A1 _ 50
        push    dword [ebp-2CH]                         ; 10A2 _ FF. 75, D4
        push    dword [ebp-30H]                         ; 10A5 _ FF. 75, D0
        push    dword [ebp+14H]                         ; 10A8 _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 10AB _ FF. 75, 0C
        call    showString                              ; 10AE _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 10B3 _ 83. C4, 20
        mov     eax, dword [ebp+8H]                     ; 10B6 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 10B9 _ 8B. 40, 0C
        sub     esp, 12                                 ; 10BC _ 83. EC, 0C
        push    eax                                     ; 10BF _ 50
        call    intToHexStr                             ; 10C0 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 10C5 _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 10C8 _ 89. 45, F0
        mov     eax, dword [ebp+18H]                    ; 10CB _ 8B. 45, 18
        movsx   eax, al                                 ; 10CE _ 0F BE. C0
        sub     esp, 8                                  ; 10D1 _ 83. EC, 08
        push    dword [ebp-10H]                         ; 10D4 _ FF. 75, F0
        push    eax                                     ; 10D7 _ 50
        push    dword [ebp-2CH]                         ; 10D8 _ FF. 75, D4
        push    dword [ebp-28H]                         ; 10DB _ FF. 75, D8
        push    dword [ebp+14H]                         ; 10DE _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 10E1 _ FF. 75, 0C
        call    showString                              ; 10E4 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 10E9 _ 83. C4, 20
        add     dword [ebp-2CH], 16                     ; 10EC _ 83. 45, D4, 10
        mov     eax, dword [ebp+18H]                    ; 10F0 _ 8B. 45, 18
        movsx   eax, al                                 ; 10F3 _ 0F BE. C0
        sub     esp, 8                                  ; 10F6 _ 83. EC, 08
        push    ?_073                                   ; 10F9 _ 68, 0000003B(d)
        push    eax                                     ; 10FE _ 50
        push    dword [ebp-2CH]                         ; 10FF _ FF. 75, D4
        push    dword [ebp-30H]                         ; 1102 _ FF. 75, D0
        push    dword [ebp+14H]                         ; 1105 _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 1108 _ FF. 75, 0C
        call    showString                              ; 110B _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1110 _ 83. C4, 20
        mov     eax, dword [ebp+8H]                     ; 1113 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 1116 _ 8B. 40, 10
        sub     esp, 12                                 ; 1119 _ 83. EC, 0C
        push    eax                                     ; 111C _ 50
        call    intToHexStr                             ; 111D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1122 _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 1125 _ 89. 45, F4
        mov     eax, dword [ebp+18H]                    ; 1128 _ 8B. 45, 18
        movsx   eax, al                                 ; 112B _ 0F BE. C0
        sub     esp, 8                                  ; 112E _ 83. EC, 08
        push    dword [ebp-0CH]                         ; 1131 _ FF. 75, F4
        push    eax                                     ; 1134 _ 50
        push    dword [ebp-2CH]                         ; 1135 _ FF. 75, D4
        push    dword [ebp-28H]                         ; 1138 _ FF. 75, D8
        push    dword [ebp+14H]                         ; 113B _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 113E _ FF. 75, 0C
        call    showString                              ; 1141 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1146 _ 83. C4, 20
        nop                                             ; 1149 _ 90
        leave                                           ; 114A _ C9
        ret                                             ; 114B _ C3
; showMemoryInfo End of function



keyval:                                                 ; byte
        db 30H, 78H                                     ; 0000 _ 0x

?_062:  db 00H                                          ; 0002 _ .

?_063:  db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0003 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 000B _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0013 _ ........
        db 00H, 00H, 00H, 00H, 00H                      ; 001B _ .....

table_rgb.1574:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 00H, 0FFH     ; 0020 _ ........
        db 00H, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH   ; 0028 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0030 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0038 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 0040 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 0048 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0050 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0058 _ ........

cursor.1632:                                            ; byte
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

?_064:  resw    1                                       ; 0104

?_065:  resw    1                                       ; 0106

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

showPos.1565:                                           ; dword
        resd    1                                       ; 01F8

str.1679:                                               ; byte
        resb    1                                       ; 01FC

?_066:  resb    9                                       ; 01FD

?_067:  resb    1                                       ; 0206



?_068:                                                  ; byte
        db 70H, 61H, 67H, 65H, 20H, 69H, 73H, 3AH       ; 0000 _ page is:
        db 20H, 00H                                     ; 0008 _  .

?_069:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 000A _ BaseAddr
        db 4CH, 3AH, 20H, 00H                           ; 0012 _ L: .

?_070:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0016 _ BaseAddr
        db 48H, 3AH, 20H, 00H                           ; 001E _ H: .

?_071:                                                  ; byte
        db 4CH, 65H, 6EH, 67H, 74H, 68H, 4CH, 6FH       ; 0022 _ LengthLo
        db 77H, 3AH, 20H, 00H                           ; 002A _ w: .

?_072:                                                  ; byte
        db 4CH, 65H, 6EH, 67H, 74H, 68H, 48H, 69H       ; 002E _ LengthHi
        db 67H, 68H, 3AH, 20H, 00H                      ; 0036 _ gh: .

?_073:                                                  ; byte
        db 54H, 79H, 70H, 65H, 3AH, 20H, 00H            ; 003B _ Type: .


