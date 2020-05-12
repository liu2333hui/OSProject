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
        movzx   eax, word [?_037]                       ; 001F _ 0F B7. 05, 00000104(d)
        cwde                                            ; 0026 _ 98
        mov     dword [ebp-18H], eax                    ; 0027 _ 89. 45, E8
        movzx   eax, word [?_038]                       ; 002A _ 0F B7. 05, 00000106(d)
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
        push    dword [ebp-18H]                         ; 0298 _ FF. 75, E8
        push    dword [ebp-1CH]                         ; 029B _ FF. 75, E4
        call    putblock                                ; 029E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 02A3 _ 83. C4, 20
        call    io_sti                                  ; 02A6 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], 0                      ; 02AB _ C7. 45, F0, 00000000
?_001:  call    io_cli                                  ; 02B2 _ E8, FFFFFFFC(rel)
        mov     eax, dword [?_041]                      ; 02B7 _ A1, 00000148(d)
        test    eax, eax                                ; 02BC _ 85. C0
        jnz     ?_002                                   ; 02BE _ 75, 0C
        call    io_sti                                  ; 02C0 _ E8, FFFFFFFC(rel)
        call    io_hlt                                  ; 02C5 _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 02CA _ EB, E6
; CMain End of function

?_002:  ; Local function
        mov     eax, dword [?_039]                      ; 02CC _ A1, 00000140(d)
        movzx   eax, byte [keybuf+eax]                  ; 02D1 _ 0F B6. 80, 00000120(d)
        movzx   eax, al                                 ; 02D8 _ 0F B6. C0
        mov     dword [ebp-10H], eax                    ; 02DB _ 89. 45, F0
        mov     eax, dword [?_039]                      ; 02DE _ A1, 00000140(d)
        lea     edx, [eax+1H]                           ; 02E3 _ 8D. 50, 01
        mov     eax, edx                                ; 02E6 _ 89. D0
        sar     eax, 31                                 ; 02E8 _ C1. F8, 1F
        shr     eax, 27                                 ; 02EB _ C1. E8, 1B
        add     edx, eax                                ; 02EE _ 01. C2
        and     edx, 1FH                                ; 02F0 _ 83. E2, 1F
        sub     edx, eax                                ; 02F3 _ 29. C2
        mov     eax, edx                                ; 02F5 _ 89. D0
        mov     dword [?_039], eax                      ; 02F7 _ A3, 00000140(d)
        call    io_sti                                  ; 02FC _ E8, FFFFFFFC(rel)
        mov     eax, dword [?_041]                      ; 0301 _ A1, 00000148(d)
        sub     eax, 1                                  ; 0306 _ 83. E8, 01
        mov     dword [?_041], eax                      ; 0309 _ A3, 00000148(d)
        mov     eax, dword [ebp-10H]                    ; 030E _ 8B. 45, F0
        movzx   eax, al                                 ; 0311 _ 0F B6. C0
        sub     esp, 12                                 ; 0314 _ 83. EC, 0C
        push    eax                                     ; 0317 _ 50
        call    charToHexStr                            ; 0318 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 031D _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 0320 _ 89. 45, F4
        mov     eax, dword [showPos.1494]               ; 0323 _ A1, 0000014C(d)
        sub     esp, 8                                  ; 0328 _ 83. EC, 08
        push    dword [ebp-0CH]                         ; 032B _ FF. 75, F4
        push    7                                       ; 032E _ 6A, 07
        push    eax                                     ; 0330 _ 50
        push    0                                       ; 0331 _ 6A, 00
        push    dword [ebp-18H]                         ; 0333 _ FF. 75, E8
        push    dword [ebp-1CH]                         ; 0336 _ FF. 75, E4
        call    showString                              ; 0339 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 033E _ 83. C4, 20
        mov     eax, dword [showPos.1494]               ; 0341 _ A1, 0000014C(d)
        add     eax, 32                                 ; 0346 _ 83. C0, 20
        mov     dword [showPos.1494], eax               ; 0349 _ A3, 0000014C(d)
        mov     eax, dword [showPos.1494]               ; 034E _ A1, 0000014C(d)
        cdq                                             ; 0353 _ 99
        idiv    dword [ebp-14H]                         ; 0354 _ F7. 7D, EC
        mov     eax, edx                                ; 0357 _ 89. D0
        mov     dword [showPos.1494], eax               ; 0359 _ A3, 0000014C(d)
        jmp     ?_001                                   ; 035E _ E9, FFFFFF4F

initBootInfo:; Function begin
        push    ebp                                     ; 0363 _ 55
        mov     ebp, esp                                ; 0364 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 0366 _ 8B. 45, 08
        mov     dword [eax], 655360                     ; 0369 _ C7. 00, 000A0000
        mov     eax, dword [ebp+8H]                     ; 036F _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 320                      ; 0372 _ 66: C7. 40, 04, 0140
        mov     eax, dword [ebp+8H]                     ; 0378 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 200                      ; 037B _ 66: C7. 40, 06, 00C8
        nop                                             ; 0381 _ 90
        pop     ebp                                     ; 0382 _ 5D
        ret                                             ; 0383 _ C3
; initBootInfo End of function

init_palette:; Function begin
        push    ebp                                     ; 0384 _ 55
        mov     ebp, esp                                ; 0385 _ 89. E5
        sub     esp, 8                                  ; 0387 _ 83. EC, 08
        sub     esp, 4                                  ; 038A _ 83. EC, 04
        push    table_rgb.1502                          ; 038D _ 68, 00000020(d)
        push    15                                      ; 0392 _ 6A, 0F
        push    0                                       ; 0394 _ 6A, 00
        call    set_palette                             ; 0396 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 039B _ 83. C4, 10
        nop                                             ; 039E _ 90
        leave                                           ; 039F _ C9
        ret                                             ; 03A0 _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 03A1 _ 55
        mov     ebp, esp                                ; 03A2 _ 89. E5
        sub     esp, 24                                 ; 03A4 _ 83. EC, 18
        call    io_load_eflags                          ; 03A7 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 03AC _ 89. 45, F4
        call    io_cli                                  ; 03AF _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 03B4 _ 83. EC, 08
        push    dword [ebp+8H]                          ; 03B7 _ FF. 75, 08
        push    968                                     ; 03BA _ 68, 000003C8
        call    io_out8                                 ; 03BF _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03C4 _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 03C7 _ 8B. 45, 08
        mov     dword [ebp-10H], eax                    ; 03CA _ 89. 45, F0
        jmp     ?_004                                   ; 03CD _ EB, 65

?_003:  mov     eax, dword [ebp+10H]                    ; 03CF _ 8B. 45, 10
        movzx   eax, byte [eax]                         ; 03D2 _ 0F B6. 00
        shr     al, 2                                   ; 03D5 _ C0. E8, 02
        movzx   eax, al                                 ; 03D8 _ 0F B6. C0
        sub     esp, 8                                  ; 03DB _ 83. EC, 08
        push    eax                                     ; 03DE _ 50
        push    969                                     ; 03DF _ 68, 000003C9
        call    io_out8                                 ; 03E4 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03E9 _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 03EC _ 8B. 45, 10
        add     eax, 1                                  ; 03EF _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 03F2 _ 0F B6. 00
        shr     al, 2                                   ; 03F5 _ C0. E8, 02
        movzx   eax, al                                 ; 03F8 _ 0F B6. C0
        sub     esp, 8                                  ; 03FB _ 83. EC, 08
        push    eax                                     ; 03FE _ 50
        push    969                                     ; 03FF _ 68, 000003C9
        call    io_out8                                 ; 0404 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0409 _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 040C _ 8B. 45, 10
        add     eax, 2                                  ; 040F _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 0412 _ 0F B6. 00
        shr     al, 2                                   ; 0415 _ C0. E8, 02
        movzx   eax, al                                 ; 0418 _ 0F B6. C0
        sub     esp, 8                                  ; 041B _ 83. EC, 08
        push    eax                                     ; 041E _ 50
        push    969                                     ; 041F _ 68, 000003C9
        call    io_out8                                 ; 0424 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0429 _ 83. C4, 10
        add     dword [ebp+10H], 3                      ; 042C _ 83. 45, 10, 03
        add     dword [ebp-10H], 1                      ; 0430 _ 83. 45, F0, 01
?_004:  mov     eax, dword [ebp-10H]                    ; 0434 _ 8B. 45, F0
        cmp     eax, dword [ebp+0CH]                    ; 0437 _ 3B. 45, 0C
        jle     ?_003                                   ; 043A _ 7E, 93
        sub     esp, 12                                 ; 043C _ 83. EC, 0C
        push    dword [ebp-0CH]                         ; 043F _ FF. 75, F4
        call    io_store_eflags                         ; 0442 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0447 _ 83. C4, 10
        nop                                             ; 044A _ 90
        leave                                           ; 044B _ C9
        ret                                             ; 044C _ C3
; set_palette End of function

boxfill8:; Function begin
        push    ebp                                     ; 044D _ 55
        mov     ebp, esp                                ; 044E _ 89. E5
        sub     esp, 20                                 ; 0450 _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 0453 _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 0456 _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 0459 _ 8B. 45, 18
        mov     dword [ebp-4H], eax                     ; 045C _ 89. 45, FC
        jmp     ?_008                                   ; 045F _ EB, 33

?_005:  mov     eax, dword [ebp+14H]                    ; 0461 _ 8B. 45, 14
        mov     dword [ebp-8H], eax                     ; 0464 _ 89. 45, F8
        jmp     ?_007                                   ; 0467 _ EB, 1F

?_006:  mov     eax, dword [ebp-4H]                     ; 0469 _ 8B. 45, FC
        imul    eax, dword [ebp+0CH]                    ; 046C _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0470 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0472 _ 8B. 45, F8
        add     eax, edx                                ; 0475 _ 01. D0
        mov     edx, eax                                ; 0477 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0479 _ 8B. 45, 08
        add     edx, eax                                ; 047C _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 047E _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0482 _ 88. 02
        add     dword [ebp-8H], 1                       ; 0484 _ 83. 45, F8, 01
?_007:  mov     eax, dword [ebp-8H]                     ; 0488 _ 8B. 45, F8
        cmp     eax, dword [ebp+1CH]                    ; 048B _ 3B. 45, 1C
        jle     ?_006                                   ; 048E _ 7E, D9
        add     dword [ebp-4H], 1                       ; 0490 _ 83. 45, FC, 01
?_008:  mov     eax, dword [ebp-4H]                     ; 0494 _ 8B. 45, FC
        cmp     eax, dword [ebp+20H]                    ; 0497 _ 3B. 45, 20
        jle     ?_005                                   ; 049A _ 7E, C5
        nop                                             ; 049C _ 90
        leave                                           ; 049D _ C9
        ret                                             ; 049E _ C3
; boxfill8 End of function

showString:; Function begin
        push    ebp                                     ; 049F _ 55
        mov     ebp, esp                                ; 04A0 _ 89. E5
        sub     esp, 24                                 ; 04A2 _ 83. EC, 18
        mov     eax, dword [ebp+18H]                    ; 04A5 _ 8B. 45, 18
        mov     byte [ebp-0CH], al                      ; 04A8 _ 88. 45, F4
        jmp     ?_010                                   ; 04AB _ EB, 37

?_009:  mov     eax, dword [ebp+1CH]                    ; 04AD _ 8B. 45, 1C
        movzx   eax, byte [eax]                         ; 04B0 _ 0F B6. 00
        movzx   eax, al                                 ; 04B3 _ 0F B6. C0
        shl     eax, 4                                  ; 04B6 _ C1. E0, 04
        lea     edx, [systemFont+eax]                   ; 04B9 _ 8D. 90, 00000000(d)
        movsx   eax, byte [ebp-0CH]                     ; 04BF _ 0F BE. 45, F4
        sub     esp, 8                                  ; 04C3 _ 83. EC, 08
        push    edx                                     ; 04C6 _ 52
        push    eax                                     ; 04C7 _ 50
        push    dword [ebp+14H]                         ; 04C8 _ FF. 75, 14
        push    dword [ebp+10H]                         ; 04CB _ FF. 75, 10
        push    dword [ebp+0CH]                         ; 04CE _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 04D1 _ FF. 75, 08
        call    showChar8                               ; 04D4 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 04D9 _ 83. C4, 20
        add     dword [ebp+1CH], 1                      ; 04DC _ 83. 45, 1C, 01
        add     dword [ebp+10H], 8                      ; 04E0 _ 83. 45, 10, 08
?_010:  mov     eax, dword [ebp+1CH]                    ; 04E4 _ 8B. 45, 1C
        movzx   eax, byte [eax]                         ; 04E7 _ 0F B6. 00
        test    al, al                                  ; 04EA _ 84. C0
        jnz     ?_009                                   ; 04EC _ 75, BF
        nop                                             ; 04EE _ 90
        leave                                           ; 04EF _ C9
        ret                                             ; 04F0 _ C3
; showString End of function

showChar8:; Function begin
        push    ebp                                     ; 04F1 _ 55
        mov     ebp, esp                                ; 04F2 _ 89. E5
        sub     esp, 20                                 ; 04F4 _ 83. EC, 14
        mov     eax, dword [ebp+18H]                    ; 04F7 _ 8B. 45, 18
        mov     byte [ebp-14H], al                      ; 04FA _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 04FD _ C7. 45, FC, 00000000
        jmp     ?_020                                   ; 0504 _ E9, 0000016C

?_011:  mov     edx, dword [ebp-4H]                     ; 0509 _ 8B. 55, FC
        mov     eax, dword [ebp+1CH]                    ; 050C _ 8B. 45, 1C
        add     eax, edx                                ; 050F _ 01. D0
        movzx   eax, byte [eax]                         ; 0511 _ 0F B6. 00
        mov     byte [ebp-5H], al                       ; 0514 _ 88. 45, FB
        cmp     byte [ebp-5H], 0                        ; 0517 _ 80. 7D, FB, 00
        jns     ?_012                                   ; 051B _ 79, 20
        mov     edx, dword [ebp+14H]                    ; 051D _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0520 _ 8B. 45, FC
        add     eax, edx                                ; 0523 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0525 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0529 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 052B _ 8B. 45, 10
        add     eax, edx                                ; 052E _ 01. D0
        mov     edx, eax                                ; 0530 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0532 _ 8B. 45, 08
        add     edx, eax                                ; 0535 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0537 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 053B _ 88. 02
?_012:  movsx   eax, byte [ebp-5H]                      ; 053D _ 0F BE. 45, FB
        and     eax, 40H                                ; 0541 _ 83. E0, 40
        test    eax, eax                                ; 0544 _ 85. C0
        jz      ?_013                                   ; 0546 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 0548 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 054B _ 8B. 45, FC
        add     eax, edx                                ; 054E _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0550 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0554 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0556 _ 8B. 45, 10
        add     eax, edx                                ; 0559 _ 01. D0
        lea     edx, [eax+1H]                           ; 055B _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 055E _ 8B. 45, 08
        add     edx, eax                                ; 0561 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0563 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0567 _ 88. 02
?_013:  movsx   eax, byte [ebp-5H]                      ; 0569 _ 0F BE. 45, FB
        and     eax, 20H                                ; 056D _ 83. E0, 20
        test    eax, eax                                ; 0570 _ 85. C0
        jz      ?_014                                   ; 0572 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 0574 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0577 _ 8B. 45, FC
        add     eax, edx                                ; 057A _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 057C _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0580 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0582 _ 8B. 45, 10
        add     eax, edx                                ; 0585 _ 01. D0
        lea     edx, [eax+2H]                           ; 0587 _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 058A _ 8B. 45, 08
        add     edx, eax                                ; 058D _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 058F _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0593 _ 88. 02
?_014:  movsx   eax, byte [ebp-5H]                      ; 0595 _ 0F BE. 45, FB
        and     eax, 10H                                ; 0599 _ 83. E0, 10
        test    eax, eax                                ; 059C _ 85. C0
        jz      ?_015                                   ; 059E _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 05A0 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 05A3 _ 8B. 45, FC
        add     eax, edx                                ; 05A6 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 05A8 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 05AC _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 05AE _ 8B. 45, 10
        add     eax, edx                                ; 05B1 _ 01. D0
        lea     edx, [eax+3H]                           ; 05B3 _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 05B6 _ 8B. 45, 08
        add     edx, eax                                ; 05B9 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 05BB _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 05BF _ 88. 02
?_015:  movsx   eax, byte [ebp-5H]                      ; 05C1 _ 0F BE. 45, FB
        and     eax, 08H                                ; 05C5 _ 83. E0, 08
        test    eax, eax                                ; 05C8 _ 85. C0
        jz      ?_016                                   ; 05CA _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 05CC _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 05CF _ 8B. 45, FC
        add     eax, edx                                ; 05D2 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 05D4 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 05D8 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 05DA _ 8B. 45, 10
        add     eax, edx                                ; 05DD _ 01. D0
        lea     edx, [eax+4H]                           ; 05DF _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 05E2 _ 8B. 45, 08
        add     edx, eax                                ; 05E5 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 05E7 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 05EB _ 88. 02
?_016:  movsx   eax, byte [ebp-5H]                      ; 05ED _ 0F BE. 45, FB
        and     eax, 04H                                ; 05F1 _ 83. E0, 04
        test    eax, eax                                ; 05F4 _ 85. C0
        jz      ?_017                                   ; 05F6 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 05F8 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 05FB _ 8B. 45, FC
        add     eax, edx                                ; 05FE _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0600 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0604 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0606 _ 8B. 45, 10
        add     eax, edx                                ; 0609 _ 01. D0
        lea     edx, [eax+5H]                           ; 060B _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 060E _ 8B. 45, 08
        add     edx, eax                                ; 0611 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0613 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0617 _ 88. 02
?_017:  movsx   eax, byte [ebp-5H]                      ; 0619 _ 0F BE. 45, FB
        and     eax, 02H                                ; 061D _ 83. E0, 02
        test    eax, eax                                ; 0620 _ 85. C0
        jz      ?_018                                   ; 0622 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 0624 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0627 _ 8B. 45, FC
        add     eax, edx                                ; 062A _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 062C _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0630 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0632 _ 8B. 45, 10
        add     eax, edx                                ; 0635 _ 01. D0
        lea     edx, [eax+6H]                           ; 0637 _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 063A _ 8B. 45, 08
        add     edx, eax                                ; 063D _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 063F _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0643 _ 88. 02
?_018:  movsx   eax, byte [ebp-5H]                      ; 0645 _ 0F BE. 45, FB
        and     eax, 01H                                ; 0649 _ 83. E0, 01
        test    eax, eax                                ; 064C _ 85. C0
        jz      ?_019                                   ; 064E _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 0650 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0653 _ 8B. 45, FC
        add     eax, edx                                ; 0656 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0658 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 065C _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 065E _ 8B. 45, 10
        add     eax, edx                                ; 0661 _ 01. D0
        lea     edx, [eax+7H]                           ; 0663 _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 0666 _ 8B. 45, 08
        add     edx, eax                                ; 0669 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 066B _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 066F _ 88. 02
?_019:  add     dword [ebp-4H], 1                       ; 0671 _ 83. 45, FC, 01
?_020:  cmp     dword [ebp-4H], 15                      ; 0675 _ 83. 7D, FC, 0F
        jle     ?_011                                   ; 0679 _ 0F 8E, FFFFFE8A
        nop                                             ; 067F _ 90
        leave                                           ; 0680 _ C9
        ret                                             ; 0681 _ C3
; showChar8 End of function

init_mouse_cursor:; Function begin
        push    ebp                                     ; 0682 _ 55
        mov     ebp, esp                                ; 0683 _ 89. E5
        sub     esp, 20                                 ; 0685 _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 0688 _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 068B _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 068E _ C7. 45, FC, 00000000
        jmp     ?_027                                   ; 0695 _ E9, 000000B5

?_021:  mov     dword [ebp-8H], 0                       ; 069A _ C7. 45, F8, 00000000
        jmp     ?_026                                   ; 06A1 _ E9, 0000009B

?_022:  mov     eax, dword [ebp-4H]                     ; 06A6 _ 8B. 45, FC
        shl     eax, 4                                  ; 06A9 _ C1. E0, 04
        mov     edx, eax                                ; 06AC _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 06AE _ 8B. 45, F8
        add     eax, edx                                ; 06B1 _ 01. D0
        add     eax, cursor.1560                        ; 06B3 _ 05, 00000060(d)
        movzx   eax, byte [eax]                         ; 06B8 _ 0F B6. 00
        cmp     al, 42                                  ; 06BB _ 3C, 2A
        jnz     ?_023                                   ; 06BD _ 75, 19
        mov     eax, dword [ebp-4H]                     ; 06BF _ 8B. 45, FC
        shl     eax, 4                                  ; 06C2 _ C1. E0, 04
        mov     edx, eax                                ; 06C5 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 06C7 _ 8B. 45, F8
        add     eax, edx                                ; 06CA _ 01. D0
        mov     edx, eax                                ; 06CC _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 06CE _ 8B. 45, 08
        add     eax, edx                                ; 06D1 _ 01. D0
        mov     byte [eax], 0                           ; 06D3 _ C6. 00, 00
        jmp     ?_025                                   ; 06D6 _ EB, 65

?_023:  mov     eax, dword [ebp-4H]                     ; 06D8 _ 8B. 45, FC
        shl     eax, 4                                  ; 06DB _ C1. E0, 04
        mov     edx, eax                                ; 06DE _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 06E0 _ 8B. 45, F8
        add     eax, edx                                ; 06E3 _ 01. D0
        add     eax, cursor.1560                        ; 06E5 _ 05, 00000060(d)
        movzx   eax, byte [eax]                         ; 06EA _ 0F B6. 00
        cmp     al, 79                                  ; 06ED _ 3C, 4F
        jnz     ?_024                                   ; 06EF _ 75, 19
        mov     eax, dword [ebp-4H]                     ; 06F1 _ 8B. 45, FC
        shl     eax, 4                                  ; 06F4 _ C1. E0, 04
        mov     edx, eax                                ; 06F7 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 06F9 _ 8B. 45, F8
        add     eax, edx                                ; 06FC _ 01. D0
        mov     edx, eax                                ; 06FE _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0700 _ 8B. 45, 08
        add     eax, edx                                ; 0703 _ 01. D0
        mov     byte [eax], 7                           ; 0705 _ C6. 00, 07
        jmp     ?_025                                   ; 0708 _ EB, 33

?_024:  mov     eax, dword [ebp-4H]                     ; 070A _ 8B. 45, FC
        shl     eax, 4                                  ; 070D _ C1. E0, 04
        mov     edx, eax                                ; 0710 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0712 _ 8B. 45, F8
        add     eax, edx                                ; 0715 _ 01. D0
        add     eax, cursor.1560                        ; 0717 _ 05, 00000060(d)
        movzx   eax, byte [eax]                         ; 071C _ 0F B6. 00
        cmp     al, 46                                  ; 071F _ 3C, 2E
        jnz     ?_025                                   ; 0721 _ 75, 1A
        mov     eax, dword [ebp-4H]                     ; 0723 _ 8B. 45, FC
        shl     eax, 4                                  ; 0726 _ C1. E0, 04
        mov     edx, eax                                ; 0729 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 072B _ 8B. 45, F8
        add     eax, edx                                ; 072E _ 01. D0
        mov     edx, eax                                ; 0730 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0732 _ 8B. 45, 08
        add     edx, eax                                ; 0735 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0737 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 073B _ 88. 02
?_025:  add     dword [ebp-8H], 1                       ; 073D _ 83. 45, F8, 01
?_026:  cmp     dword [ebp-8H], 15                      ; 0741 _ 83. 7D, F8, 0F
        jle     ?_022                                   ; 0745 _ 0F 8E, FFFFFF5B
        add     dword [ebp-4H], 1                       ; 074B _ 83. 45, FC, 01
?_027:  cmp     dword [ebp-4H], 15                      ; 074F _ 83. 7D, FC, 0F
        jle     ?_021                                   ; 0753 _ 0F 8E, FFFFFF41
        nop                                             ; 0759 _ 90
        leave                                           ; 075A _ C9
        ret                                             ; 075B _ C3
; init_mouse_cursor End of function

putblock:; Function begin
        push    ebp                                     ; 075C _ 55
        mov     ebp, esp                                ; 075D _ 89. E5
        push    ebx                                     ; 075F _ 53
        sub     esp, 16                                 ; 0760 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 0763 _ C7. 45, F8, 00000000
        jmp     ?_031                                   ; 076A _ EB, 50

?_028:  mov     dword [ebp-0CH], 0                      ; 076C _ C7. 45, F4, 00000000
        jmp     ?_030                                   ; 0773 _ EB, 3B

?_029:  mov     eax, dword [ebp-8H]                     ; 0775 _ 8B. 45, F8
        imul    eax, dword [ebp+24H]                    ; 0778 _ 0F AF. 45, 24
        mov     edx, eax                                ; 077C _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 077E _ 8B. 45, F4
        add     eax, edx                                ; 0781 _ 01. D0
        mov     edx, eax                                ; 0783 _ 89. C2
        mov     eax, dword [ebp+20H]                    ; 0785 _ 8B. 45, 20
        add     eax, edx                                ; 0788 _ 01. D0
        mov     ecx, dword [ebp+1CH]                    ; 078A _ 8B. 4D, 1C
        mov     edx, dword [ebp-8H]                     ; 078D _ 8B. 55, F8
        add     edx, ecx                                ; 0790 _ 01. CA
        imul    edx, dword [ebp+0CH]                    ; 0792 _ 0F AF. 55, 0C
        mov     ebx, dword [ebp+18H]                    ; 0796 _ 8B. 5D, 18
        mov     ecx, dword [ebp-0CH]                    ; 0799 _ 8B. 4D, F4
        add     ecx, ebx                                ; 079C _ 01. D9
        add     edx, ecx                                ; 079E _ 01. CA
        mov     ecx, edx                                ; 07A0 _ 89. D1
        mov     edx, dword [ebp+8H]                     ; 07A2 _ 8B. 55, 08
        add     edx, ecx                                ; 07A5 _ 01. CA
        movzx   eax, byte [eax]                         ; 07A7 _ 0F B6. 00
        mov     byte [edx], al                          ; 07AA _ 88. 02
        add     dword [ebp-0CH], 1                      ; 07AC _ 83. 45, F4, 01
?_030:  mov     eax, dword [ebp-0CH]                    ; 07B0 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 07B3 _ 3B. 45, 10
        jl      ?_029                                   ; 07B6 _ 7C, BD
        add     dword [ebp-8H], 1                       ; 07B8 _ 83. 45, F8, 01
?_031:  mov     eax, dword [ebp-8H]                     ; 07BC _ 8B. 45, F8
        cmp     eax, dword [ebp+14H]                    ; 07BF _ 3B. 45, 14
        jl      ?_028                                   ; 07C2 _ 7C, A8
        nop                                             ; 07C4 _ 90
        add     esp, 16                                 ; 07C5 _ 83. C4, 10
        pop     ebx                                     ; 07C8 _ 5B
        pop     ebp                                     ; 07C9 _ 5D
        ret                                             ; 07CA _ C3
; putblock End of function

intHandlerFromC:; Function begin
        push    ebp                                     ; 07CB _ 55
        mov     ebp, esp                                ; 07CC _ 89. E5
        sub     esp, 24                                 ; 07CE _ 83. EC, 18
        mov     eax, dword [bootInfo]                   ; 07D1 _ A1, 00000100(d)
        mov     dword [ebp-14H], eax                    ; 07D6 _ 89. 45, EC
        movzx   eax, word [?_037]                       ; 07D9 _ 0F B7. 05, 00000104(d)
        cwde                                            ; 07E0 _ 98
        mov     dword [ebp-10H], eax                    ; 07E1 _ 89. 45, F0
        movzx   eax, word [?_038]                       ; 07E4 _ 0F B7. 05, 00000106(d)
        cwde                                            ; 07EB _ 98
        mov     dword [ebp-0CH], eax                    ; 07EC _ 89. 45, F4
        sub     esp, 8                                  ; 07EF _ 83. EC, 08
        push    33                                      ; 07F2 _ 6A, 21
        push    32                                      ; 07F4 _ 6A, 20
        call    io_out8                                 ; 07F6 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 07FB _ 83. C4, 10
        mov     byte [ebp-15H], 0                       ; 07FE _ C6. 45, EB, 00
        sub     esp, 12                                 ; 0802 _ 83. EC, 0C
        push    96                                      ; 0805 _ 6A, 60
        call    io_in8                                  ; 0807 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 080C _ 83. C4, 10
        mov     byte [ebp-15H], al                      ; 080F _ 88. 45, EB
        mov     eax, dword [?_041]                      ; 0812 _ A1, 00000148(d)
        cmp     eax, 31                                 ; 0817 _ 83. F8, 1F
        jg      ?_032                                   ; 081A _ 7F, 2C
        mov     eax, dword [?_040]                      ; 081C _ A1, 00000144(d)
        movzx   edx, byte [ebp-15H]                     ; 0821 _ 0F B6. 55, EB
        mov     byte [keybuf+eax], dl                   ; 0825 _ 88. 90, 00000120(d)
        mov     eax, dword [?_041]                      ; 082B _ A1, 00000148(d)
        add     eax, 1                                  ; 0830 _ 83. C0, 01
        mov     dword [?_041], eax                      ; 0833 _ A3, 00000148(d)
        mov     eax, dword [?_040]                      ; 0838 _ A1, 00000144(d)
        add     eax, 1                                  ; 083D _ 83. C0, 01
        and     eax, 1FH                                ; 0840 _ 83. E0, 1F
        mov     dword [?_040], eax                      ; 0843 _ A3, 00000144(d)
?_032:  nop                                             ; 0848 _ 90
        leave                                           ; 0849 _ C9
        ret                                             ; 084A _ C3
; intHandlerFromC End of function

charToHexVal:; Function begin
        push    ebp                                     ; 084B _ 55
        mov     ebp, esp                                ; 084C _ 89. E5
        sub     esp, 4                                  ; 084E _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 0851 _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 0854 _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 0857 _ 80. 7D, FC, 09
        jle     ?_033                                   ; 085B _ 7E, 09
        movzx   eax, byte [ebp-4H]                      ; 085D _ 0F B6. 45, FC
        add     eax, 55                                 ; 0861 _ 83. C0, 37
        jmp     ?_034                                   ; 0864 _ EB, 07

?_033:  movzx   eax, byte [ebp-4H]                      ; 0866 _ 0F B6. 45, FC
        add     eax, 48                                 ; 086A _ 83. C0, 30
?_034:  leave                                           ; 086D _ C9
        ret                                             ; 086E _ C3
; charToHexVal End of function

charToHexStr:; Function begin
        push    ebp                                     ; 086F _ 55
        mov     ebp, esp                                ; 0870 _ 89. E5
        sub     esp, 20                                 ; 0872 _ 83. EC, 14
        mov     eax, dword [ebp+8H]                     ; 0875 _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 0878 _ 88. 45, EC
        movzx   eax, byte [ebp-14H]                     ; 087B _ 0F B6. 45, EC
        and     eax, 0FH                                ; 087F _ 83. E0, 0F
        mov     byte [ebp-1H], al                       ; 0882 _ 88. 45, FF
        movsx   eax, byte [ebp-1H]                      ; 0885 _ 0F BE. 45, FF
        push    eax                                     ; 0889 _ 50
        call    charToHexVal                            ; 088A _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 088F _ 83. C4, 04
        mov     byte [?_036], al                        ; 0892 _ A2, 00000003(d)
        shr     byte [ebp-14H], 4                       ; 0897 _ C0. 6D, EC, 04
        movzx   eax, byte [ebp-14H]                     ; 089B _ 0F B6. 45, EC
        movsx   eax, al                                 ; 089F _ 0F BE. C0
        push    eax                                     ; 08A2 _ 50
        call    charToHexVal                            ; 08A3 _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 08A8 _ 83. C4, 04
        mov     byte [?_035], al                        ; 08AB _ A2, 00000002(d)
        mov     eax, keyval                             ; 08B0 _ B8, 00000000(d)
        leave                                           ; 08B5 _ C9
        ret                                             ; 08B6 _ C3
; charToHexStr End of function



keyval:                                                 ; byte
        db 30H, 78H                                     ; 0000 _ 0x

?_035:  db 00H                                          ; 0002 _ .

?_036:  db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0003 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 000B _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0013 _ ........
        db 00H, 00H, 00H, 00H, 00H                      ; 001B _ .....

table_rgb.1502:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 00H, 0FFH     ; 0020 _ ........
        db 00H, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH   ; 0028 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0030 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0038 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 0040 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 0048 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0050 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0058 _ ........

cursor.1560:                                            ; byte
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

?_037:  resw    1                                       ; 0104

?_038:  resw    13                                      ; 0106

keybuf:                                                 ; byte
        resb    32                                      ; 0120

?_039:  resd    1                                       ; 0140

?_040:  resd    1                                       ; 0144

?_041:  resd    1                                       ; 0148

showPos.1494:                                           ; dword
        resd    1                                       ; 014C


