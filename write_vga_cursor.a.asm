; Disassembly of file: write_vga_cursor.a.o
; Tue Apr 21 21:28:41 2020
; Mode: 32 bits
; Syntax: YASM/NASM
; Instruction set: 80386


CMain:  ; Function begin
        push    ebp                                     ; 0000 _ 55
        mov     ebp, esp                                ; 0001 _ 89. E5
        push    ebx                                     ; 0003 _ 53
        sub     esp, 20                                 ; 0004 _ 83. EC, 14
        sub     esp, 12                                 ; 0007 _ 83. EC, 0C
        push    bootInfo                                ; 000A _ 68, 00000100(d)
        call    initBootInfo                            ; 000F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0014 _ 83. C4, 10
        mov     eax, dword [bootInfo]                   ; 0017 _ A1, 00000100(d)
        mov     dword [ebp-14H], eax                    ; 001C _ 89. 45, EC
        movzx   eax, word [?_032]                       ; 001F _ 0F B7. 05, 00000104(d)
        cwde                                            ; 0026 _ 98
        mov     dword [ebp-10H], eax                    ; 0027 _ 89. 45, F0
        movzx   eax, word [?_033]                       ; 002A _ 0F B7. 05, 00000106(d)
        cwde                                            ; 0031 _ 98
        mov     dword [ebp-0CH], eax                    ; 0032 _ 89. 45, F4
        call    init_palette                            ; 0035 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 003A _ 8B. 45, F4
        lea     edx, [eax-1DH]                          ; 003D _ 8D. 50, E3
        mov     eax, dword [ebp-10H]                    ; 0040 _ 8B. 45, F0
        sub     eax, 1                                  ; 0043 _ 83. E8, 01
        sub     esp, 4                                  ; 0046 _ 83. EC, 04
        push    edx                                     ; 0049 _ 52
        push    eax                                     ; 004A _ 50
        push    0                                       ; 004B _ 6A, 00
        push    0                                       ; 004D _ 6A, 00
        push    14                                      ; 004F _ 6A, 0E
        push    dword [ebp-10H]                         ; 0051 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 0054 _ FF. 75, EC
        call    boxfill8                                ; 0057 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 005C _ 83. C4, 20
        mov     eax, dword [ebp-0CH]                    ; 005F _ 8B. 45, F4
        lea     ecx, [eax-1CH]                          ; 0062 _ 8D. 48, E4
        mov     eax, dword [ebp-10H]                    ; 0065 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 0068 _ 8D. 50, FF
        mov     eax, dword [ebp-0CH]                    ; 006B _ 8B. 45, F4
        sub     eax, 28                                 ; 006E _ 83. E8, 1C
        sub     esp, 4                                  ; 0071 _ 83. EC, 04
        push    ecx                                     ; 0074 _ 51
        push    edx                                     ; 0075 _ 52
        push    eax                                     ; 0076 _ 50
        push    0                                       ; 0077 _ 6A, 00
        push    8                                       ; 0079 _ 6A, 08
        push    dword [ebp-10H]                         ; 007B _ FF. 75, F0
        push    dword [ebp-14H]                         ; 007E _ FF. 75, EC
        call    boxfill8                                ; 0081 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0086 _ 83. C4, 20
        mov     eax, dword [ebp-0CH]                    ; 0089 _ 8B. 45, F4
        lea     ecx, [eax-1BH]                          ; 008C _ 8D. 48, E5
        mov     eax, dword [ebp-10H]                    ; 008F _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 0092 _ 8D. 50, FF
        mov     eax, dword [ebp-0CH]                    ; 0095 _ 8B. 45, F4
        sub     eax, 27                                 ; 0098 _ 83. E8, 1B
        sub     esp, 4                                  ; 009B _ 83. EC, 04
        push    ecx                                     ; 009E _ 51
        push    edx                                     ; 009F _ 52
        push    eax                                     ; 00A0 _ 50
        push    0                                       ; 00A1 _ 6A, 00
        push    7                                       ; 00A3 _ 6A, 07
        push    dword [ebp-10H]                         ; 00A5 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 00A8 _ FF. 75, EC
        call    boxfill8                                ; 00AB _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 00B0 _ 83. C4, 20
        mov     eax, dword [ebp-0CH]                    ; 00B3 _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 00B6 _ 8D. 48, FF
        mov     eax, dword [ebp-10H]                    ; 00B9 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 00BC _ 8D. 50, FF
        mov     eax, dword [ebp-0CH]                    ; 00BF _ 8B. 45, F4
        sub     eax, 26                                 ; 00C2 _ 83. E8, 1A
        sub     esp, 4                                  ; 00C5 _ 83. EC, 04
        push    ecx                                     ; 00C8 _ 51
        push    edx                                     ; 00C9 _ 52
        push    eax                                     ; 00CA _ 50
        push    0                                       ; 00CB _ 6A, 00
        push    8                                       ; 00CD _ 6A, 08
        push    dword [ebp-10H]                         ; 00CF _ FF. 75, F0
        push    dword [ebp-14H]                         ; 00D2 _ FF. 75, EC
        call    boxfill8                                ; 00D5 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 00DA _ 83. C4, 20
        mov     eax, dword [ebp-0CH]                    ; 00DD _ 8B. 45, F4
        lea     edx, [eax-18H]                          ; 00E0 _ 8D. 50, E8
        mov     eax, dword [ebp-0CH]                    ; 00E3 _ 8B. 45, F4
        sub     eax, 24                                 ; 00E6 _ 83. E8, 18
        sub     esp, 4                                  ; 00E9 _ 83. EC, 04
        push    edx                                     ; 00EC _ 52
        push    59                                      ; 00ED _ 6A, 3B
        push    eax                                     ; 00EF _ 50
        push    3                                       ; 00F0 _ 6A, 03
        push    7                                       ; 00F2 _ 6A, 07
        push    dword [ebp-10H]                         ; 00F4 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 00F7 _ FF. 75, EC
        call    boxfill8                                ; 00FA _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 00FF _ 83. C4, 20
        mov     eax, dword [ebp-0CH]                    ; 0102 _ 8B. 45, F4
        lea     edx, [eax-4H]                           ; 0105 _ 8D. 50, FC
        mov     eax, dword [ebp-0CH]                    ; 0108 _ 8B. 45, F4
        sub     eax, 24                                 ; 010B _ 83. E8, 18
        sub     esp, 4                                  ; 010E _ 83. EC, 04
        push    edx                                     ; 0111 _ 52
        push    2                                       ; 0112 _ 6A, 02
        push    eax                                     ; 0114 _ 50
        push    2                                       ; 0115 _ 6A, 02
        push    7                                       ; 0117 _ 6A, 07
        push    dword [ebp-10H]                         ; 0119 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 011C _ FF. 75, EC
        call    boxfill8                                ; 011F _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0124 _ 83. C4, 20
        mov     eax, dword [ebp-0CH]                    ; 0127 _ 8B. 45, F4
        lea     edx, [eax-4H]                           ; 012A _ 8D. 50, FC
        mov     eax, dword [ebp-0CH]                    ; 012D _ 8B. 45, F4
        sub     eax, 4                                  ; 0130 _ 83. E8, 04
        sub     esp, 4                                  ; 0133 _ 83. EC, 04
        push    edx                                     ; 0136 _ 52
        push    59                                      ; 0137 _ 6A, 3B
        push    eax                                     ; 0139 _ 50
        push    3                                       ; 013A _ 6A, 03
        push    15                                      ; 013C _ 6A, 0F
        push    dword [ebp-10H]                         ; 013E _ FF. 75, F0
        push    dword [ebp-14H]                         ; 0141 _ FF. 75, EC
        call    boxfill8                                ; 0144 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0149 _ 83. C4, 20
        mov     eax, dword [ebp-0CH]                    ; 014C _ 8B. 45, F4
        lea     edx, [eax-5H]                           ; 014F _ 8D. 50, FB
        mov     eax, dword [ebp-0CH]                    ; 0152 _ 8B. 45, F4
        sub     eax, 23                                 ; 0155 _ 83. E8, 17
        sub     esp, 4                                  ; 0158 _ 83. EC, 04
        push    edx                                     ; 015B _ 52
        push    59                                      ; 015C _ 6A, 3B
        push    eax                                     ; 015E _ 50
        push    59                                      ; 015F _ 6A, 3B
        push    15                                      ; 0161 _ 6A, 0F
        push    dword [ebp-10H]                         ; 0163 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 0166 _ FF. 75, EC
        call    boxfill8                                ; 0169 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 016E _ 83. C4, 20
        mov     eax, dword [ebp-0CH]                    ; 0171 _ 8B. 45, F4
        lea     edx, [eax-3H]                           ; 0174 _ 8D. 50, FD
        mov     eax, dword [ebp-0CH]                    ; 0177 _ 8B. 45, F4
        sub     eax, 3                                  ; 017A _ 83. E8, 03
        sub     esp, 4                                  ; 017D _ 83. EC, 04
        push    edx                                     ; 0180 _ 52
        push    59                                      ; 0181 _ 6A, 3B
        push    eax                                     ; 0183 _ 50
        push    2                                       ; 0184 _ 6A, 02
        push    0                                       ; 0186 _ 6A, 00
        push    dword [ebp-10H]                         ; 0188 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 018B _ FF. 75, EC
        call    boxfill8                                ; 018E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0193 _ 83. C4, 20
        mov     eax, dword [ebp-0CH]                    ; 0196 _ 8B. 45, F4
        lea     edx, [eax-3H]                           ; 0199 _ 8D. 50, FD
        mov     eax, dword [ebp-0CH]                    ; 019C _ 8B. 45, F4
        sub     eax, 24                                 ; 019F _ 83. E8, 18
        sub     esp, 4                                  ; 01A2 _ 83. EC, 04
        push    edx                                     ; 01A5 _ 52
        push    60                                      ; 01A6 _ 6A, 3C
        push    eax                                     ; 01A8 _ 50
        push    60                                      ; 01A9 _ 6A, 3C
        push    0                                       ; 01AB _ 6A, 00
        push    dword [ebp-10H]                         ; 01AD _ FF. 75, F0
        push    dword [ebp-14H]                         ; 01B0 _ FF. 75, EC
        call    boxfill8                                ; 01B3 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 01B8 _ 83. C4, 20
        mov     eax, dword [ebp-0CH]                    ; 01BB _ 8B. 45, F4
        lea     ebx, [eax-3H]                           ; 01BE _ 8D. 58, FD
        mov     eax, dword [ebp-10H]                    ; 01C1 _ 8B. 45, F0
        lea     ecx, [eax-4H]                           ; 01C4 _ 8D. 48, FC
        mov     eax, dword [ebp-0CH]                    ; 01C7 _ 8B. 45, F4
        lea     edx, [eax-3H]                           ; 01CA _ 8D. 50, FD
        mov     eax, dword [ebp-10H]                    ; 01CD _ 8B. 45, F0
        sub     eax, 47                                 ; 01D0 _ 83. E8, 2F
        sub     esp, 4                                  ; 01D3 _ 83. EC, 04
        push    ebx                                     ; 01D6 _ 53
        push    ecx                                     ; 01D7 _ 51
        push    edx                                     ; 01D8 _ 52
        push    eax                                     ; 01D9 _ 50
        push    7                                       ; 01DA _ 6A, 07
        push    dword [ebp-10H]                         ; 01DC _ FF. 75, F0
        push    dword [ebp-14H]                         ; 01DF _ FF. 75, EC
        call    boxfill8                                ; 01E2 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 01E7 _ 83. C4, 20
        mov     eax, dword [ebp-0CH]                    ; 01EA _ 8B. 45, F4
        lea     ebx, [eax-4H]                           ; 01ED _ 8D. 58, FC
        mov     eax, dword [ebp-10H]                    ; 01F0 _ 8B. 45, F0
        lea     ecx, [eax-3H]                           ; 01F3 _ 8D. 48, FD
        mov     eax, dword [ebp-0CH]                    ; 01F6 _ 8B. 45, F4
        lea     edx, [eax-18H]                          ; 01F9 _ 8D. 50, E8
        mov     eax, dword [ebp-10H]                    ; 01FC _ 8B. 45, F0
        sub     eax, 3                                  ; 01FF _ 83. E8, 03
        sub     esp, 4                                  ; 0202 _ 83. EC, 04
        push    ebx                                     ; 0205 _ 53
        push    ecx                                     ; 0206 _ 51
        push    edx                                     ; 0207 _ 52
        push    eax                                     ; 0208 _ 50
        push    7                                       ; 0209 _ 6A, 07
        push    dword [ebp-10H]                         ; 020B _ FF. 75, F0
        push    dword [ebp-14H]                         ; 020E _ FF. 75, EC
        call    boxfill8                                ; 0211 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0216 _ 83. C4, 20
        mov     eax, dword [ebp-0CH]                    ; 0219 _ 8B. 45, F4
        lea     ebx, [eax-18H]                          ; 021C _ 8D. 58, E8
        mov     eax, dword [ebp-10H]                    ; 021F _ 8B. 45, F0
        lea     ecx, [eax-4H]                           ; 0222 _ 8D. 48, FC
        mov     eax, dword [ebp-0CH]                    ; 0225 _ 8B. 45, F4
        lea     edx, [eax-18H]                          ; 0228 _ 8D. 50, E8
        mov     eax, dword [ebp-10H]                    ; 022B _ 8B. 45, F0
        sub     eax, 47                                 ; 022E _ 83. E8, 2F
        sub     esp, 4                                  ; 0231 _ 83. EC, 04
        push    ebx                                     ; 0234 _ 53
        push    ecx                                     ; 0235 _ 51
        push    edx                                     ; 0236 _ 52
        push    eax                                     ; 0237 _ 50
        push    15                                      ; 0238 _ 6A, 0F
        push    dword [ebp-10H]                         ; 023A _ FF. 75, F0
        push    dword [ebp-14H]                         ; 023D _ FF. 75, EC
        call    boxfill8                                ; 0240 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0245 _ 83. C4, 20
        mov     eax, dword [ebp-0CH]                    ; 0248 _ 8B. 45, F4
        lea     ebx, [eax-4H]                           ; 024B _ 8D. 58, FC
        mov     eax, dword [ebp-10H]                    ; 024E _ 8B. 45, F0
        lea     ecx, [eax-2FH]                          ; 0251 _ 8D. 48, D1
        mov     eax, dword [ebp-0CH]                    ; 0254 _ 8B. 45, F4
        lea     edx, [eax-17H]                          ; 0257 _ 8D. 50, E9
        mov     eax, dword [ebp-10H]                    ; 025A _ 8B. 45, F0
        sub     eax, 47                                 ; 025D _ 83. E8, 2F
        sub     esp, 4                                  ; 0260 _ 83. EC, 04
        push    ebx                                     ; 0263 _ 53
        push    ecx                                     ; 0264 _ 51
        push    edx                                     ; 0265 _ 52
        push    eax                                     ; 0266 _ 50
        push    15                                      ; 0267 _ 6A, 0F
        push    dword [ebp-10H]                         ; 0269 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 026C _ FF. 75, EC
        call    boxfill8                                ; 026F _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0274 _ 83. C4, 20
        mov     eax, systemFont+410H                    ; 0277 _ B8, 00000410(d)
        sub     esp, 8                                  ; 027C _ 83. EC, 08
        push    eax                                     ; 027F _ 50
        push    7                                       ; 0280 _ 6A, 07
        push    8                                       ; 0282 _ 6A, 08
        push    8                                       ; 0284 _ 6A, 08
        push    dword [ebp-10H]                         ; 0286 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 0289 _ FF. 75, EC
        call    showChar8                               ; 028C _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0291 _ 83. C4, 20
        mov     eax, systemFont+420H                    ; 0294 _ B8, 00000420(d)
        sub     esp, 8                                  ; 0299 _ 83. EC, 08
        push    eax                                     ; 029C _ 50
        push    7                                       ; 029D _ 6A, 07
        push    8                                       ; 029F _ 6A, 08
        push    16                                      ; 02A1 _ 6A, 10
        push    dword [ebp-10H]                         ; 02A3 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 02A6 _ FF. 75, EC
        call    showChar8                               ; 02A9 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 02AE _ 83. C4, 20
        mov     eax, systemFont+430H                    ; 02B1 _ B8, 00000430(d)
        sub     esp, 8                                  ; 02B6 _ 83. EC, 08
        push    eax                                     ; 02B9 _ 50
        push    7                                       ; 02BA _ 6A, 07
        push    8                                       ; 02BC _ 6A, 08
        push    24                                      ; 02BE _ 6A, 18
        push    dword [ebp-10H]                         ; 02C0 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 02C3 _ FF. 75, EC
        call    showChar8                               ; 02C6 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 02CB _ 83. C4, 20
        mov     eax, systemFont+330H                    ; 02CE _ B8, 00000330(d)
        sub     esp, 8                                  ; 02D3 _ 83. EC, 08
        push    eax                                     ; 02D6 _ 50
        push    7                                       ; 02D7 _ 6A, 07
        push    8                                       ; 02D9 _ 6A, 08
        push    40                                      ; 02DB _ 6A, 28
        push    dword [ebp-10H]                         ; 02DD _ FF. 75, F0
        push    dword [ebp-14H]                         ; 02E0 _ FF. 75, EC
        call    showChar8                               ; 02E3 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 02E8 _ 83. C4, 20
        mov     eax, systemFont+320H                    ; 02EB _ B8, 00000320(d)
        sub     esp, 8                                  ; 02F0 _ 83. EC, 08
        push    eax                                     ; 02F3 _ 50
        push    7                                       ; 02F4 _ 6A, 07
        push    8                                       ; 02F6 _ 6A, 08
        push    48                                      ; 02F8 _ 6A, 30
        push    dword [ebp-10H]                         ; 02FA _ FF. 75, F0
        push    dword [ebp-14H]                         ; 02FD _ FF. 75, EC
        call    showChar8                               ; 0300 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0305 _ 83. C4, 20
        sub     esp, 8                                  ; 0308 _ 83. EC, 08
        push    ?_034                                   ; 030B _ 68, 00000000(d)
        push    7                                       ; 0310 _ 6A, 07
        push    64                                      ; 0312 _ 6A, 40
        push    8                                       ; 0314 _ 6A, 08
        push    dword [ebp-10H]                         ; 0316 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 0319 _ FF. 75, EC
        call    showString                              ; 031C _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0321 _ 83. C4, 20
        sub     esp, 8                                  ; 0324 _ 83. EC, 08
        push    14                                      ; 0327 _ 6A, 0E
        push    mcursor                                 ; 0329 _ 68, 00000000(d)
        call    init_mouse_cursor                       ; 032E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0333 _ 83. C4, 10
        push    16                                      ; 0336 _ 6A, 10
        push    mcursor                                 ; 0338 _ 68, 00000000(d)
        push    80                                      ; 033D _ 6A, 50
        push    80                                      ; 033F _ 6A, 50
        push    16                                      ; 0341 _ 6A, 10
        push    16                                      ; 0343 _ 6A, 10
        push    dword [ebp-10H]                         ; 0345 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 0348 _ FF. 75, EC
        call    putblock                                ; 034B _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0350 _ 83. C4, 20
?_001:  call    io_hlt                                  ; 0353 _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 0358 _ EB, F9
; CMain End of function

initBootInfo:; Function begin
        push    ebp                                     ; 035A _ 55
        mov     ebp, esp                                ; 035B _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 035D _ 8B. 45, 08
        mov     dword [eax], 655360                     ; 0360 _ C7. 00, 000A0000
        mov     eax, dword [ebp+8H]                     ; 0366 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 320                      ; 0369 _ 66: C7. 40, 04, 0140
        mov     eax, dword [ebp+8H]                     ; 036F _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 200                      ; 0372 _ 66: C7. 40, 06, 00C8
        nop                                             ; 0378 _ 90
        pop     ebp                                     ; 0379 _ 5D
        ret                                             ; 037A _ C3
; initBootInfo End of function

init_palette:; Function begin
        push    ebp                                     ; 037B _ 55
        mov     ebp, esp                                ; 037C _ 89. E5
        sub     esp, 8                                  ; 037E _ 83. EC, 08
        sub     esp, 4                                  ; 0381 _ 83. EC, 04
        push    table_rgb.1488                          ; 0384 _ 68, 00000000(d)
        push    15                                      ; 0389 _ 6A, 0F
        push    0                                       ; 038B _ 6A, 00
        call    set_palette                             ; 038D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0392 _ 83. C4, 10
        nop                                             ; 0395 _ 90
        leave                                           ; 0396 _ C9
        ret                                             ; 0397 _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 0398 _ 55
        mov     ebp, esp                                ; 0399 _ 89. E5
        sub     esp, 24                                 ; 039B _ 83. EC, 18
        call    io_load_eflags                          ; 039E _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 03A3 _ 89. 45, F4
        call    io_cli                                  ; 03A6 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 03AB _ 83. EC, 08
        push    dword [ebp+8H]                          ; 03AE _ FF. 75, 08
        push    968                                     ; 03B1 _ 68, 000003C8
        call    io_out8                                 ; 03B6 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03BB _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 03BE _ 8B. 45, 08
        mov     dword [ebp-10H], eax                    ; 03C1 _ 89. 45, F0
        jmp     ?_003                                   ; 03C4 _ EB, 65

?_002:  mov     eax, dword [ebp+10H]                    ; 03C6 _ 8B. 45, 10
        movzx   eax, byte [eax]                         ; 03C9 _ 0F B6. 00
        shr     al, 2                                   ; 03CC _ C0. E8, 02
        movzx   eax, al                                 ; 03CF _ 0F B6. C0
        sub     esp, 8                                  ; 03D2 _ 83. EC, 08
        push    eax                                     ; 03D5 _ 50
        push    969                                     ; 03D6 _ 68, 000003C9
        call    io_out8                                 ; 03DB _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03E0 _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 03E3 _ 8B. 45, 10
        add     eax, 1                                  ; 03E6 _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 03E9 _ 0F B6. 00
        shr     al, 2                                   ; 03EC _ C0. E8, 02
        movzx   eax, al                                 ; 03EF _ 0F B6. C0
        sub     esp, 8                                  ; 03F2 _ 83. EC, 08
        push    eax                                     ; 03F5 _ 50
        push    969                                     ; 03F6 _ 68, 000003C9
        call    io_out8                                 ; 03FB _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0400 _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 0403 _ 8B. 45, 10
        add     eax, 2                                  ; 0406 _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 0409 _ 0F B6. 00
        shr     al, 2                                   ; 040C _ C0. E8, 02
        movzx   eax, al                                 ; 040F _ 0F B6. C0
        sub     esp, 8                                  ; 0412 _ 83. EC, 08
        push    eax                                     ; 0415 _ 50
        push    969                                     ; 0416 _ 68, 000003C9
        call    io_out8                                 ; 041B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0420 _ 83. C4, 10
        add     dword [ebp+10H], 3                      ; 0423 _ 83. 45, 10, 03
        add     dword [ebp-10H], 1                      ; 0427 _ 83. 45, F0, 01
?_003:  mov     eax, dword [ebp-10H]                    ; 042B _ 8B. 45, F0
        cmp     eax, dword [ebp+0CH]                    ; 042E _ 3B. 45, 0C
        jle     ?_002                                   ; 0431 _ 7E, 93
        sub     esp, 12                                 ; 0433 _ 83. EC, 0C
        push    dword [ebp-0CH]                         ; 0436 _ FF. 75, F4
        call    io_store_eflags                         ; 0439 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 043E _ 83. C4, 10
        nop                                             ; 0441 _ 90
        leave                                           ; 0442 _ C9
        ret                                             ; 0443 _ C3
; set_palette End of function

boxfill8:; Function begin
        push    ebp                                     ; 0444 _ 55
        mov     ebp, esp                                ; 0445 _ 89. E5
        sub     esp, 20                                 ; 0447 _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 044A _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 044D _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 0450 _ 8B. 45, 18
        mov     dword [ebp-4H], eax                     ; 0453 _ 89. 45, FC
        jmp     ?_007                                   ; 0456 _ EB, 33

?_004:  mov     eax, dword [ebp+14H]                    ; 0458 _ 8B. 45, 14
        mov     dword [ebp-8H], eax                     ; 045B _ 89. 45, F8
        jmp     ?_006                                   ; 045E _ EB, 1F

?_005:  mov     eax, dword [ebp-4H]                     ; 0460 _ 8B. 45, FC
        imul    eax, dword [ebp+0CH]                    ; 0463 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0467 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0469 _ 8B. 45, F8
        add     eax, edx                                ; 046C _ 01. D0
        mov     edx, eax                                ; 046E _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0470 _ 8B. 45, 08
        add     edx, eax                                ; 0473 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0475 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0479 _ 88. 02
        add     dword [ebp-8H], 1                       ; 047B _ 83. 45, F8, 01
?_006:  mov     eax, dword [ebp-8H]                     ; 047F _ 8B. 45, F8
        cmp     eax, dword [ebp+1CH]                    ; 0482 _ 3B. 45, 1C
        jle     ?_005                                   ; 0485 _ 7E, D9
        add     dword [ebp-4H], 1                       ; 0487 _ 83. 45, FC, 01
?_007:  mov     eax, dword [ebp-4H]                     ; 048B _ 8B. 45, FC
        cmp     eax, dword [ebp+20H]                    ; 048E _ 3B. 45, 20
        jle     ?_004                                   ; 0491 _ 7E, C5
        nop                                             ; 0493 _ 90
        leave                                           ; 0494 _ C9
        ret                                             ; 0495 _ C3
; boxfill8 End of function

showString:; Function begin
        push    ebp                                     ; 0496 _ 55
        mov     ebp, esp                                ; 0497 _ 89. E5
        sub     esp, 24                                 ; 0499 _ 83. EC, 18
        mov     eax, dword [ebp+18H]                    ; 049C _ 8B. 45, 18
        mov     byte [ebp-0CH], al                      ; 049F _ 88. 45, F4
        jmp     ?_009                                   ; 04A2 _ EB, 37

?_008:  mov     eax, dword [ebp+1CH]                    ; 04A4 _ 8B. 45, 1C
        movzx   eax, byte [eax]                         ; 04A7 _ 0F B6. 00
        movzx   eax, al                                 ; 04AA _ 0F B6. C0
        shl     eax, 4                                  ; 04AD _ C1. E0, 04
        lea     edx, [systemFont+eax]                   ; 04B0 _ 8D. 90, 00000000(d)
        movsx   eax, byte [ebp-0CH]                     ; 04B6 _ 0F BE. 45, F4
        sub     esp, 8                                  ; 04BA _ 83. EC, 08
        push    edx                                     ; 04BD _ 52
        push    eax                                     ; 04BE _ 50
        push    dword [ebp+14H]                         ; 04BF _ FF. 75, 14
        push    dword [ebp+10H]                         ; 04C2 _ FF. 75, 10
        push    dword [ebp+0CH]                         ; 04C5 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 04C8 _ FF. 75, 08
        call    showChar8                               ; 04CB _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 04D0 _ 83. C4, 20
        add     dword [ebp+1CH], 1                      ; 04D3 _ 83. 45, 1C, 01
        add     dword [ebp+10H], 8                      ; 04D7 _ 83. 45, 10, 08
?_009:  mov     eax, dword [ebp+1CH]                    ; 04DB _ 8B. 45, 1C
        movzx   eax, byte [eax]                         ; 04DE _ 0F B6. 00
        test    al, al                                  ; 04E1 _ 84. C0
        jnz     ?_008                                   ; 04E3 _ 75, BF
        nop                                             ; 04E5 _ 90
        leave                                           ; 04E6 _ C9
        ret                                             ; 04E7 _ C3
; showString End of function

showChar8:; Function begin
        push    ebp                                     ; 04E8 _ 55
        mov     ebp, esp                                ; 04E9 _ 89. E5
        sub     esp, 20                                 ; 04EB _ 83. EC, 14
        mov     eax, dword [ebp+18H]                    ; 04EE _ 8B. 45, 18
        mov     byte [ebp-14H], al                      ; 04F1 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 04F4 _ C7. 45, FC, 00000000
        jmp     ?_019                                   ; 04FB _ E9, 0000016C

?_010:  mov     edx, dword [ebp-4H]                     ; 0500 _ 8B. 55, FC
        mov     eax, dword [ebp+1CH]                    ; 0503 _ 8B. 45, 1C
        add     eax, edx                                ; 0506 _ 01. D0
        movzx   eax, byte [eax]                         ; 0508 _ 0F B6. 00
        mov     byte [ebp-5H], al                       ; 050B _ 88. 45, FB
        cmp     byte [ebp-5H], 0                        ; 050E _ 80. 7D, FB, 00
        jns     ?_011                                   ; 0512 _ 79, 20
        mov     edx, dword [ebp+14H]                    ; 0514 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0517 _ 8B. 45, FC
        add     eax, edx                                ; 051A _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 051C _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0520 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0522 _ 8B. 45, 10
        add     eax, edx                                ; 0525 _ 01. D0
        mov     edx, eax                                ; 0527 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0529 _ 8B. 45, 08
        add     edx, eax                                ; 052C _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 052E _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0532 _ 88. 02
?_011:  movsx   eax, byte [ebp-5H]                      ; 0534 _ 0F BE. 45, FB
        and     eax, 40H                                ; 0538 _ 83. E0, 40
        test    eax, eax                                ; 053B _ 85. C0
        jz      ?_012                                   ; 053D _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 053F _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0542 _ 8B. 45, FC
        add     eax, edx                                ; 0545 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0547 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 054B _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 054D _ 8B. 45, 10
        add     eax, edx                                ; 0550 _ 01. D0
        lea     edx, [eax+1H]                           ; 0552 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0555 _ 8B. 45, 08
        add     edx, eax                                ; 0558 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 055A _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 055E _ 88. 02
?_012:  movsx   eax, byte [ebp-5H]                      ; 0560 _ 0F BE. 45, FB
        and     eax, 20H                                ; 0564 _ 83. E0, 20
        test    eax, eax                                ; 0567 _ 85. C0
        jz      ?_013                                   ; 0569 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 056B _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 056E _ 8B. 45, FC
        add     eax, edx                                ; 0571 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0573 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0577 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0579 _ 8B. 45, 10
        add     eax, edx                                ; 057C _ 01. D0
        lea     edx, [eax+2H]                           ; 057E _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 0581 _ 8B. 45, 08
        add     edx, eax                                ; 0584 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0586 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 058A _ 88. 02
?_013:  movsx   eax, byte [ebp-5H]                      ; 058C _ 0F BE. 45, FB
        and     eax, 10H                                ; 0590 _ 83. E0, 10
        test    eax, eax                                ; 0593 _ 85. C0
        jz      ?_014                                   ; 0595 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 0597 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 059A _ 8B. 45, FC
        add     eax, edx                                ; 059D _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 059F _ 0F AF. 45, 0C
        mov     edx, eax                                ; 05A3 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 05A5 _ 8B. 45, 10
        add     eax, edx                                ; 05A8 _ 01. D0
        lea     edx, [eax+3H]                           ; 05AA _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 05AD _ 8B. 45, 08
        add     edx, eax                                ; 05B0 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 05B2 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 05B6 _ 88. 02
?_014:  movsx   eax, byte [ebp-5H]                      ; 05B8 _ 0F BE. 45, FB
        and     eax, 08H                                ; 05BC _ 83. E0, 08
        test    eax, eax                                ; 05BF _ 85. C0
        jz      ?_015                                   ; 05C1 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 05C3 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 05C6 _ 8B. 45, FC
        add     eax, edx                                ; 05C9 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 05CB _ 0F AF. 45, 0C
        mov     edx, eax                                ; 05CF _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 05D1 _ 8B. 45, 10
        add     eax, edx                                ; 05D4 _ 01. D0
        lea     edx, [eax+4H]                           ; 05D6 _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 05D9 _ 8B. 45, 08
        add     edx, eax                                ; 05DC _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 05DE _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 05E2 _ 88. 02
?_015:  movsx   eax, byte [ebp-5H]                      ; 05E4 _ 0F BE. 45, FB
        and     eax, 04H                                ; 05E8 _ 83. E0, 04
        test    eax, eax                                ; 05EB _ 85. C0
        jz      ?_016                                   ; 05ED _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 05EF _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 05F2 _ 8B. 45, FC
        add     eax, edx                                ; 05F5 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 05F7 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 05FB _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 05FD _ 8B. 45, 10
        add     eax, edx                                ; 0600 _ 01. D0
        lea     edx, [eax+5H]                           ; 0602 _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 0605 _ 8B. 45, 08
        add     edx, eax                                ; 0608 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 060A _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 060E _ 88. 02
?_016:  movsx   eax, byte [ebp-5H]                      ; 0610 _ 0F BE. 45, FB
        and     eax, 02H                                ; 0614 _ 83. E0, 02
        test    eax, eax                                ; 0617 _ 85. C0
        jz      ?_017                                   ; 0619 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 061B _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 061E _ 8B. 45, FC
        add     eax, edx                                ; 0621 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0623 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0627 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0629 _ 8B. 45, 10
        add     eax, edx                                ; 062C _ 01. D0
        lea     edx, [eax+6H]                           ; 062E _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 0631 _ 8B. 45, 08
        add     edx, eax                                ; 0634 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0636 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 063A _ 88. 02
?_017:  movsx   eax, byte [ebp-5H]                      ; 063C _ 0F BE. 45, FB
        and     eax, 01H                                ; 0640 _ 83. E0, 01
        test    eax, eax                                ; 0643 _ 85. C0
        jz      ?_018                                   ; 0645 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 0647 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 064A _ 8B. 45, FC
        add     eax, edx                                ; 064D _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 064F _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0653 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0655 _ 8B. 45, 10
        add     eax, edx                                ; 0658 _ 01. D0
        lea     edx, [eax+7H]                           ; 065A _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 065D _ 8B. 45, 08
        add     edx, eax                                ; 0660 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0662 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0666 _ 88. 02
?_018:  add     dword [ebp-4H], 1                       ; 0668 _ 83. 45, FC, 01
?_019:  cmp     dword [ebp-4H], 15                      ; 066C _ 83. 7D, FC, 0F
        jle     ?_010                                   ; 0670 _ 0F 8E, FFFFFE8A
        nop                                             ; 0676 _ 90
        leave                                           ; 0677 _ C9
        ret                                             ; 0678 _ C3
; showChar8 End of function

init_mouse_cursor:; Function begin
        push    ebp                                     ; 0679 _ 55
        mov     ebp, esp                                ; 067A _ 89. E5
        sub     esp, 20                                 ; 067C _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 067F _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 0682 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 0685 _ C7. 45, FC, 00000000
        jmp     ?_026                                   ; 068C _ E9, 000000B5

?_020:  mov     dword [ebp-8H], 0                       ; 0691 _ C7. 45, F8, 00000000
        jmp     ?_025                                   ; 0698 _ E9, 0000009B

?_021:  mov     eax, dword [ebp-4H]                     ; 069D _ 8B. 45, FC
        shl     eax, 4                                  ; 06A0 _ C1. E0, 04
        mov     edx, eax                                ; 06A3 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 06A5 _ 8B. 45, F8
        add     eax, edx                                ; 06A8 _ 01. D0
        add     eax, cursor.1546                        ; 06AA _ 05, 00000040(d)
        movzx   eax, byte [eax]                         ; 06AF _ 0F B6. 00
        cmp     al, 42                                  ; 06B2 _ 3C, 2A
        jnz     ?_022                                   ; 06B4 _ 75, 19
        mov     eax, dword [ebp-4H]                     ; 06B6 _ 8B. 45, FC
        shl     eax, 4                                  ; 06B9 _ C1. E0, 04
        mov     edx, eax                                ; 06BC _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 06BE _ 8B. 45, F8
        add     eax, edx                                ; 06C1 _ 01. D0
        mov     edx, eax                                ; 06C3 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 06C5 _ 8B. 45, 08
        add     eax, edx                                ; 06C8 _ 01. D0
        mov     byte [eax], 0                           ; 06CA _ C6. 00, 00
        jmp     ?_024                                   ; 06CD _ EB, 65

?_022:  mov     eax, dword [ebp-4H]                     ; 06CF _ 8B. 45, FC
        shl     eax, 4                                  ; 06D2 _ C1. E0, 04
        mov     edx, eax                                ; 06D5 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 06D7 _ 8B. 45, F8
        add     eax, edx                                ; 06DA _ 01. D0
        add     eax, cursor.1546                        ; 06DC _ 05, 00000040(d)
        movzx   eax, byte [eax]                         ; 06E1 _ 0F B6. 00
        cmp     al, 79                                  ; 06E4 _ 3C, 4F
        jnz     ?_023                                   ; 06E6 _ 75, 19
        mov     eax, dword [ebp-4H]                     ; 06E8 _ 8B. 45, FC
        shl     eax, 4                                  ; 06EB _ C1. E0, 04
        mov     edx, eax                                ; 06EE _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 06F0 _ 8B. 45, F8
        add     eax, edx                                ; 06F3 _ 01. D0
        mov     edx, eax                                ; 06F5 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 06F7 _ 8B. 45, 08
        add     eax, edx                                ; 06FA _ 01. D0
        mov     byte [eax], 7                           ; 06FC _ C6. 00, 07
        jmp     ?_024                                   ; 06FF _ EB, 33

?_023:  mov     eax, dword [ebp-4H]                     ; 0701 _ 8B. 45, FC
        shl     eax, 4                                  ; 0704 _ C1. E0, 04
        mov     edx, eax                                ; 0707 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0709 _ 8B. 45, F8
        add     eax, edx                                ; 070C _ 01. D0
        add     eax, cursor.1546                        ; 070E _ 05, 00000040(d)
        movzx   eax, byte [eax]                         ; 0713 _ 0F B6. 00
        cmp     al, 46                                  ; 0716 _ 3C, 2E
        jnz     ?_024                                   ; 0718 _ 75, 1A
        mov     eax, dword [ebp-4H]                     ; 071A _ 8B. 45, FC
        shl     eax, 4                                  ; 071D _ C1. E0, 04
        mov     edx, eax                                ; 0720 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0722 _ 8B. 45, F8
        add     eax, edx                                ; 0725 _ 01. D0
        mov     edx, eax                                ; 0727 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0729 _ 8B. 45, 08
        add     edx, eax                                ; 072C _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 072E _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0732 _ 88. 02
?_024:  add     dword [ebp-8H], 1                       ; 0734 _ 83. 45, F8, 01
?_025:  cmp     dword [ebp-8H], 15                      ; 0738 _ 83. 7D, F8, 0F
        jle     ?_021                                   ; 073C _ 0F 8E, FFFFFF5B
        add     dword [ebp-4H], 1                       ; 0742 _ 83. 45, FC, 01
?_026:  cmp     dword [ebp-4H], 15                      ; 0746 _ 83. 7D, FC, 0F
        jle     ?_020                                   ; 074A _ 0F 8E, FFFFFF41
        nop                                             ; 0750 _ 90
        leave                                           ; 0751 _ C9
        ret                                             ; 0752 _ C3
; init_mouse_cursor End of function

putblock:; Function begin
        push    ebp                                     ; 0753 _ 55
        mov     ebp, esp                                ; 0754 _ 89. E5
        push    ebx                                     ; 0756 _ 53
        sub     esp, 16                                 ; 0757 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 075A _ C7. 45, F8, 00000000
        jmp     ?_030                                   ; 0761 _ EB, 50

?_027:  mov     dword [ebp-0CH], 0                      ; 0763 _ C7. 45, F4, 00000000
        jmp     ?_029                                   ; 076A _ EB, 3B

?_028:  mov     eax, dword [ebp-8H]                     ; 076C _ 8B. 45, F8
        imul    eax, dword [ebp+24H]                    ; 076F _ 0F AF. 45, 24
        mov     edx, eax                                ; 0773 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 0775 _ 8B. 45, F4
        add     eax, edx                                ; 0778 _ 01. D0
        mov     edx, eax                                ; 077A _ 89. C2
        mov     eax, dword [ebp+20H]                    ; 077C _ 8B. 45, 20
        add     eax, edx                                ; 077F _ 01. D0
        mov     ecx, dword [ebp+1CH]                    ; 0781 _ 8B. 4D, 1C
        mov     edx, dword [ebp-8H]                     ; 0784 _ 8B. 55, F8
        add     edx, ecx                                ; 0787 _ 01. CA
        imul    edx, dword [ebp+0CH]                    ; 0789 _ 0F AF. 55, 0C
        mov     ebx, dword [ebp+18H]                    ; 078D _ 8B. 5D, 18
        mov     ecx, dword [ebp-0CH]                    ; 0790 _ 8B. 4D, F4
        add     ecx, ebx                                ; 0793 _ 01. D9
        add     edx, ecx                                ; 0795 _ 01. CA
        mov     ecx, edx                                ; 0797 _ 89. D1
        mov     edx, dword [ebp+8H]                     ; 0799 _ 8B. 55, 08
        add     edx, ecx                                ; 079C _ 01. CA
        movzx   eax, byte [eax]                         ; 079E _ 0F B6. 00
        mov     byte [edx], al                          ; 07A1 _ 88. 02
        add     dword [ebp-0CH], 1                      ; 07A3 _ 83. 45, F4, 01
?_029:  mov     eax, dword [ebp-0CH]                    ; 07A7 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 07AA _ 3B. 45, 10
        jl      ?_028                                   ; 07AD _ 7C, BD
        add     dword [ebp-8H], 1                       ; 07AF _ 83. 45, F8, 01
?_030:  mov     eax, dword [ebp-8H]                     ; 07B3 _ 8B. 45, F8
        cmp     eax, dword [ebp+14H]                    ; 07B6 _ 3B. 45, 14
        jl      ?_027                                   ; 07B9 _ 7C, A8
        nop                                             ; 07BB _ 90
        add     esp, 16                                 ; 07BC _ 83. C4, 10
        pop     ebx                                     ; 07BF _ 5B
        pop     ebp                                     ; 07C0 _ 5D
        ret                                             ; 07C1 _ C3
; putblock End of function

intHandlerFromC:; Function begin
        push    ebp                                     ; 07C2 _ 55
        mov     ebp, esp                                ; 07C3 _ 89. E5
        sub     esp, 24                                 ; 07C5 _ 83. EC, 18
        mov     eax, dword [bootInfo]                   ; 07C8 _ A1, 00000100(d)
        mov     dword [ebp-14H], eax                    ; 07CD _ 89. 45, EC
        movzx   eax, word [?_032]                       ; 07D0 _ 0F B7. 05, 00000104(d)
        cwde                                            ; 07D7 _ 98
        mov     dword [ebp-10H], eax                    ; 07D8 _ 89. 45, F0
        movzx   eax, word [?_033]                       ; 07DB _ 0F B7. 05, 00000106(d)
        cwde                                            ; 07E2 _ 98
        mov     dword [ebp-0CH], eax                    ; 07E3 _ 89. 45, F4
        push    15                                      ; 07E6 _ 6A, 0F
        push    255                                     ; 07E8 _ 68, 000000FF
        push    0                                       ; 07ED _ 6A, 00
        push    0                                       ; 07EF _ 6A, 00
        push    0                                       ; 07F1 _ 6A, 00
        push    dword [ebp-10H]                         ; 07F3 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 07F6 _ FF. 75, EC
        call    boxfill8                                ; 07F9 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 07FE _ 83. C4, 1C
        sub     esp, 8                                  ; 0801 _ 83. EC, 08
        push    ?_035                                   ; 0804 _ 68, 00000006(d)
        push    7                                       ; 0809 _ 6A, 07
        push    0                                       ; 080B _ 6A, 00
        push    0                                       ; 080D _ 6A, 00
        push    dword [ebp-10H]                         ; 080F _ FF. 75, F0
        push    dword [ebp-14H]                         ; 0812 _ FF. 75, EC
        call    showString                              ; 0815 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 081A _ 83. C4, 20
?_031:  call    io_hlt                                  ; 081D _ E8, FFFFFFFC(rel)
        jmp     ?_031                                   ; 0822 _ EB, F9
; intHandlerFromC End of function


;SECTION .data   align=32 noexecute                      ; section number 2, data

table_rgb.1488:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 00H, 0FFH     ; 0000 _ ........
        db 00H, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH   ; 0008 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0010 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0018 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 0020 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 0028 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0030 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0038 _ ........

cursor.1546:                                            ; byte
        db 2AH, 2AH, 2AH, 2AH, 2AH, 2AH, 2AH, 2AH       ; 0040 _ ********
        db 2AH, 2AH, 2AH, 2AH, 2AH, 2AH, 2EH, 2EH       ; 0048 _ ******..
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 0050 _ *OOOOOOO
        db 4FH, 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH       ; 0058 _ OOOO*...
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 0060 _ *OOOOOOO
        db 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH       ; 0068 _ OOO*....
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 0070 _ *OOOOOOO
        db 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0078 _ OO*.....
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 0080 _ *OOOOOOO
        db 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0088 _ O*......
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 0090 _ *OOOOOOO
        db 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0098 _ *.......
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 00A0 _ *OOOOOOO
        db 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 00A8 _ *.......
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 00B0 _ *OOOOOOO
        db 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 00B8 _ O*......
        db 2AH, 4FH, 4FH, 4FH, 4FH, 2AH, 2AH, 4FH       ; 00C0 _ *OOOO**O
        db 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 00C8 _ OO*.....
        db 2AH, 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2AH       ; 00D0 _ *OOO*..*
        db 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH       ; 00D8 _ OOO*....
        db 2AH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH       ; 00E0 _ *OO*....
        db 2AH, 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH       ; 00E8 _ *OOO*...
        db 2AH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 00F0 _ *O*.....
        db 2EH, 2AH, 4FH, 4FH, 4FH, 2AH, 2EH, 2EH       ; 00F8 _ .*OOO*..
        db 2AH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0100 _ **......
        db 2EH, 2EH, 2AH, 4FH, 4FH, 4FH, 2AH, 2EH       ; 0108 _ ..*OOO*.
        db 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0110 _ *.......
        db 2EH, 2EH, 2EH, 2AH, 4FH, 4FH, 4FH, 2AH       ; 0118 _ ...*OOO*
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0120 _ ........
        db 2EH, 2EH, 2EH, 2EH, 2AH, 4FH, 4FH, 2AH       ; 0128 _ ....*OO*
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0130 _ ........
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2AH, 2AH, 2AH       ; 0138 _ .....***


;SECTION .bss    align=32 noexecute                      ; section number 3, bss

mcursor:                                                ; byte
        resb    256                                     ; 0000

bootInfo:                                               ; qword
        resb    4                                       ; 0100

?_032:  resw    1                                       ; 0104

?_033:  resw    1                                       ; 0106


;SECTION .rodata align=1 noexecute                       ; section number 4, const

?_034:                                                  ; byte
        db 74H, 65H, 78H, 74H, 21H, 00H                 ; 0000 _ text!.

?_035:                                                  ; byte
        db 50H, 53H, 2FH, 32H, 20H, 4BH, 65H, 79H       ; 0006 _ PS/2 Key
        db 62H, 6FH, 61H, 72H, 64H, 00H                 ; 000E _ board.



