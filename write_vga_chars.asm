; Disassembly of file: write_vga_chars.o
; Mon Apr 20 22:22:16 2020
; Mode: 32 bits
; Syntax: YASM/NASM
; Instruction set: 80386
CMain:  ; Function begin
        push    ebp                                     ; 0000 _ 55
        mov     ebp, esp                                ; 0001 _ 89. E5
        push    ebx                                     ; 0003 _ 53
        sub     esp, 20                                 ; 0004 _ 83. EC, 14
        mov     dword [ebp-14H], 655360                 ; 0007 _ C7. 45, EC, 000A0000
        mov     dword [ebp-10H], 320                    ; 000E _ C7. 45, F0, 00000140
        mov     dword [ebp-0CH], 200                    ; 0015 _ C7. 45, F4, 000000C8
        call    init_palette                            ; 001C _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 0021 _ 8B. 45, F4
        lea     edx, [eax-1DH]                          ; 0024 _ 8D. 50, E3
        mov     eax, dword [ebp-10H]                    ; 0027 _ 8B. 45, F0
        sub     eax, 1                                  ; 002A _ 83. E8, 01
        sub     esp, 4                                  ; 002D _ 83. EC, 04
        push    edx                                     ; 0030 _ 52
        push    eax                                     ; 0031 _ 50
        push    0                                       ; 0032 _ 6A, 00
        push    0                                       ; 0034 _ 6A, 00
        push    14                                      ; 0036 _ 6A, 0E
        push    dword [ebp-10H]                         ; 0038 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 003B _ FF. 75, EC
        call    boxfill8                                ; 003E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0043 _ 83. C4, 20
        mov     eax, dword [ebp-0CH]                    ; 0046 _ 8B. 45, F4
        lea     ecx, [eax-1CH]                          ; 0049 _ 8D. 48, E4
        mov     eax, dword [ebp-10H]                    ; 004C _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 004F _ 8D. 50, FF
        mov     eax, dword [ebp-0CH]                    ; 0052 _ 8B. 45, F4
        sub     eax, 28                                 ; 0055 _ 83. E8, 1C
        sub     esp, 4                                  ; 0058 _ 83. EC, 04
        push    ecx                                     ; 005B _ 51
        push    edx                                     ; 005C _ 52
        push    eax                                     ; 005D _ 50
        push    0                                       ; 005E _ 6A, 00
        push    8                                       ; 0060 _ 6A, 08
        push    dword [ebp-10H]                         ; 0062 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 0065 _ FF. 75, EC
        call    boxfill8                                ; 0068 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 006D _ 83. C4, 20
        mov     eax, dword [ebp-0CH]                    ; 0070 _ 8B. 45, F4
        lea     ecx, [eax-1BH]                          ; 0073 _ 8D. 48, E5
        mov     eax, dword [ebp-10H]                    ; 0076 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 0079 _ 8D. 50, FF
        mov     eax, dword [ebp-0CH]                    ; 007C _ 8B. 45, F4
        sub     eax, 27                                 ; 007F _ 83. E8, 1B
        sub     esp, 4                                  ; 0082 _ 83. EC, 04
        push    ecx                                     ; 0085 _ 51
        push    edx                                     ; 0086 _ 52
        push    eax                                     ; 0087 _ 50
        push    0                                       ; 0088 _ 6A, 00
        push    7                                       ; 008A _ 6A, 07
        push    dword [ebp-10H]                         ; 008C _ FF. 75, F0
        push    dword [ebp-14H]                         ; 008F _ FF. 75, EC
        call    boxfill8                                ; 0092 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0097 _ 83. C4, 20
        mov     eax, dword [ebp-0CH]                    ; 009A _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 009D _ 8D. 48, FF
        mov     eax, dword [ebp-10H]                    ; 00A0 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 00A3 _ 8D. 50, FF
        mov     eax, dword [ebp-0CH]                    ; 00A6 _ 8B. 45, F4
        sub     eax, 26                                 ; 00A9 _ 83. E8, 1A
        sub     esp, 4                                  ; 00AC _ 83. EC, 04
        push    ecx                                     ; 00AF _ 51
        push    edx                                     ; 00B0 _ 52
        push    eax                                     ; 00B1 _ 50
        push    0                                       ; 00B2 _ 6A, 00
        push    8                                       ; 00B4 _ 6A, 08
        push    dword [ebp-10H]                         ; 00B6 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 00B9 _ FF. 75, EC
        call    boxfill8                                ; 00BC _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 00C1 _ 83. C4, 20
        mov     eax, dword [ebp-0CH]                    ; 00C4 _ 8B. 45, F4
        lea     edx, [eax-18H]                          ; 00C7 _ 8D. 50, E8
        mov     eax, dword [ebp-0CH]                    ; 00CA _ 8B. 45, F4
        sub     eax, 24                                 ; 00CD _ 83. E8, 18
        sub     esp, 4                                  ; 00D0 _ 83. EC, 04
        push    edx                                     ; 00D3 _ 52
        push    59                                      ; 00D4 _ 6A, 3B
        push    eax                                     ; 00D6 _ 50
        push    3                                       ; 00D7 _ 6A, 03
        push    7                                       ; 00D9 _ 6A, 07
        push    dword [ebp-10H]                         ; 00DB _ FF. 75, F0
        push    dword [ebp-14H]                         ; 00DE _ FF. 75, EC
        call    boxfill8                                ; 00E1 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 00E6 _ 83. C4, 20
        mov     eax, dword [ebp-0CH]                    ; 00E9 _ 8B. 45, F4
        lea     edx, [eax-4H]                           ; 00EC _ 8D. 50, FC
        mov     eax, dword [ebp-0CH]                    ; 00EF _ 8B. 45, F4
        sub     eax, 24                                 ; 00F2 _ 83. E8, 18
        sub     esp, 4                                  ; 00F5 _ 83. EC, 04
        push    edx                                     ; 00F8 _ 52
        push    2                                       ; 00F9 _ 6A, 02
        push    eax                                     ; 00FB _ 50
        push    2                                       ; 00FC _ 6A, 02
        push    7                                       ; 00FE _ 6A, 07
        push    dword [ebp-10H]                         ; 0100 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 0103 _ FF. 75, EC
        call    boxfill8                                ; 0106 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 010B _ 83. C4, 20
        mov     eax, dword [ebp-0CH]                    ; 010E _ 8B. 45, F4
        lea     edx, [eax-4H]                           ; 0111 _ 8D. 50, FC
        mov     eax, dword [ebp-0CH]                    ; 0114 _ 8B. 45, F4
        sub     eax, 4                                  ; 0117 _ 83. E8, 04
        sub     esp, 4                                  ; 011A _ 83. EC, 04
        push    edx                                     ; 011D _ 52
        push    59                                      ; 011E _ 6A, 3B
        push    eax                                     ; 0120 _ 50
        push    3                                       ; 0121 _ 6A, 03
        push    15                                      ; 0123 _ 6A, 0F
        push    dword [ebp-10H]                         ; 0125 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 0128 _ FF. 75, EC
        call    boxfill8                                ; 012B _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0130 _ 83. C4, 20
        mov     eax, dword [ebp-0CH]                    ; 0133 _ 8B. 45, F4
        lea     edx, [eax-5H]                           ; 0136 _ 8D. 50, FB
        mov     eax, dword [ebp-0CH]                    ; 0139 _ 8B. 45, F4
        sub     eax, 23                                 ; 013C _ 83. E8, 17
        sub     esp, 4                                  ; 013F _ 83. EC, 04
        push    edx                                     ; 0142 _ 52
        push    59                                      ; 0143 _ 6A, 3B
        push    eax                                     ; 0145 _ 50
        push    59                                      ; 0146 _ 6A, 3B
        push    15                                      ; 0148 _ 6A, 0F
        push    dword [ebp-10H]                         ; 014A _ FF. 75, F0
        push    dword [ebp-14H]                         ; 014D _ FF. 75, EC
        call    boxfill8                                ; 0150 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0155 _ 83. C4, 20
        mov     eax, dword [ebp-0CH]                    ; 0158 _ 8B. 45, F4
        lea     edx, [eax-3H]                           ; 015B _ 8D. 50, FD
        mov     eax, dword [ebp-0CH]                    ; 015E _ 8B. 45, F4
        sub     eax, 3                                  ; 0161 _ 83. E8, 03
        sub     esp, 4                                  ; 0164 _ 83. EC, 04
        push    edx                                     ; 0167 _ 52
        push    59                                      ; 0168 _ 6A, 3B
        push    eax                                     ; 016A _ 50
        push    2                                       ; 016B _ 6A, 02
        push    0                                       ; 016D _ 6A, 00
        push    dword [ebp-10H]                         ; 016F _ FF. 75, F0
        push    dword [ebp-14H]                         ; 0172 _ FF. 75, EC
        call    boxfill8                                ; 0175 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 017A _ 83. C4, 20
        mov     eax, dword [ebp-0CH]                    ; 017D _ 8B. 45, F4
        lea     edx, [eax-3H]                           ; 0180 _ 8D. 50, FD
        mov     eax, dword [ebp-0CH]                    ; 0183 _ 8B. 45, F4
        sub     eax, 24                                 ; 0186 _ 83. E8, 18
        sub     esp, 4                                  ; 0189 _ 83. EC, 04
        push    edx                                     ; 018C _ 52
        push    60                                      ; 018D _ 6A, 3C
        push    eax                                     ; 018F _ 50
        push    60                                      ; 0190 _ 6A, 3C
        push    0                                       ; 0192 _ 6A, 00
        push    dword [ebp-10H]                         ; 0194 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 0197 _ FF. 75, EC
        call    boxfill8                                ; 019A _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 019F _ 83. C4, 20
        mov     eax, dword [ebp-0CH]                    ; 01A2 _ 8B. 45, F4
        lea     ebx, [eax-3H]                           ; 01A5 _ 8D. 58, FD
        mov     eax, dword [ebp-10H]                    ; 01A8 _ 8B. 45, F0
        lea     ecx, [eax-4H]                           ; 01AB _ 8D. 48, FC
        mov     eax, dword [ebp-0CH]                    ; 01AE _ 8B. 45, F4
        lea     edx, [eax-3H]                           ; 01B1 _ 8D. 50, FD
        mov     eax, dword [ebp-10H]                    ; 01B4 _ 8B. 45, F0
        sub     eax, 47                                 ; 01B7 _ 83. E8, 2F
        sub     esp, 4                                  ; 01BA _ 83. EC, 04
        push    ebx                                     ; 01BD _ 53
        push    ecx                                     ; 01BE _ 51
        push    edx                                     ; 01BF _ 52
        push    eax                                     ; 01C0 _ 50
        push    7                                       ; 01C1 _ 6A, 07
        push    dword [ebp-10H]                         ; 01C3 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 01C6 _ FF. 75, EC
        call    boxfill8                                ; 01C9 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 01CE _ 83. C4, 20
        mov     eax, dword [ebp-0CH]                    ; 01D1 _ 8B. 45, F4
        lea     ebx, [eax-4H]                           ; 01D4 _ 8D. 58, FC
        mov     eax, dword [ebp-10H]                    ; 01D7 _ 8B. 45, F0
        lea     ecx, [eax-3H]                           ; 01DA _ 8D. 48, FD
        mov     eax, dword [ebp-0CH]                    ; 01DD _ 8B. 45, F4
        lea     edx, [eax-18H]                          ; 01E0 _ 8D. 50, E8
        mov     eax, dword [ebp-10H]                    ; 01E3 _ 8B. 45, F0
        sub     eax, 3                                  ; 01E6 _ 83. E8, 03
        sub     esp, 4                                  ; 01E9 _ 83. EC, 04
        push    ebx                                     ; 01EC _ 53
        push    ecx                                     ; 01ED _ 51
        push    edx                                     ; 01EE _ 52
        push    eax                                     ; 01EF _ 50
        push    7                                       ; 01F0 _ 6A, 07
        push    dword [ebp-10H]                         ; 01F2 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 01F5 _ FF. 75, EC
        call    boxfill8                                ; 01F8 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 01FD _ 83. C4, 20
        mov     eax, dword [ebp-0CH]                    ; 0200 _ 8B. 45, F4
        lea     ebx, [eax-18H]                          ; 0203 _ 8D. 58, E8
        mov     eax, dword [ebp-10H]                    ; 0206 _ 8B. 45, F0
        lea     ecx, [eax-4H]                           ; 0209 _ 8D. 48, FC
        mov     eax, dword [ebp-0CH]                    ; 020C _ 8B. 45, F4
        lea     edx, [eax-18H]                          ; 020F _ 8D. 50, E8
        mov     eax, dword [ebp-10H]                    ; 0212 _ 8B. 45, F0
        sub     eax, 47                                 ; 0215 _ 83. E8, 2F
        sub     esp, 4                                  ; 0218 _ 83. EC, 04
        push    ebx                                     ; 021B _ 53
        push    ecx                                     ; 021C _ 51
        push    edx                                     ; 021D _ 52
        push    eax                                     ; 021E _ 50
        push    15                                      ; 021F _ 6A, 0F
        push    dword [ebp-10H]                         ; 0221 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 0224 _ FF. 75, EC
        call    boxfill8                                ; 0227 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 022C _ 83. C4, 20
        mov     eax, dword [ebp-0CH]                    ; 022F _ 8B. 45, F4
        lea     ebx, [eax-4H]                           ; 0232 _ 8D. 58, FC
        mov     eax, dword [ebp-10H]                    ; 0235 _ 8B. 45, F0
        lea     ecx, [eax-2FH]                          ; 0238 _ 8D. 48, D1
        mov     eax, dword [ebp-0CH]                    ; 023B _ 8B. 45, F4
        lea     edx, [eax-17H]                          ; 023E _ 8D. 50, E9
        mov     eax, dword [ebp-10H]                    ; 0241 _ 8B. 45, F0
        sub     eax, 47                                 ; 0244 _ 83. E8, 2F
        sub     esp, 4                                  ; 0247 _ 83. EC, 04
        push    ebx                                     ; 024A _ 53
        push    ecx                                     ; 024B _ 51
        push    edx                                     ; 024C _ 52
        push    eax                                     ; 024D _ 50
        push    15                                      ; 024E _ 6A, 0F
        push    dword [ebp-10H]                         ; 0250 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 0253 _ FF. 75, EC
        call    boxfill8                                ; 0256 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 025B _ 83. C4, 20
        sub     esp, 8                                  ; 025E _ 83. EC, 08
        push    fontA.1456                              ; 0261 _ 68, 00000000(d)
        push    7                                       ; 0266 _ 6A, 07
        push    8                                       ; 0268 _ 6A, 08
        push    8                                       ; 026A _ 6A, 08
        push    dword [ebp-10H]                         ; 026C _ FF. 75, F0
        push    dword [ebp-14H]                         ; 026F _ FF. 75, EC
        call    showChar8                               ; 0272 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0277 _ 83. C4, 20
        mov     eax, systemFont+410H                    ; 027A _ B8, 00000410(d)
        sub     esp, 8                                  ; 027F _ 83. EC, 08
        push    eax                                     ; 0282 _ 50
        push    7                                       ; 0283 _ 6A, 07
        push    8                                       ; 0285 _ 6A, 08
        push    8                                       ; 0287 _ 6A, 08
        push    dword [ebp-10H]                         ; 0289 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 028C _ FF. 75, EC
        call    showChar8                               ; 028F _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0294 _ 83. C4, 20
        mov     eax, systemFont+420H                    ; 0297 _ B8, 00000420(d)
        sub     esp, 8                                  ; 029C _ 83. EC, 08
        push    eax                                     ; 029F _ 50
        push    7                                       ; 02A0 _ 6A, 07
        push    8                                       ; 02A2 _ 6A, 08
        push    16                                      ; 02A4 _ 6A, 10
        push    dword [ebp-10H]                         ; 02A6 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 02A9 _ FF. 75, EC
        call    showChar8                               ; 02AC _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 02B1 _ 83. C4, 20
        mov     eax, systemFont+430H                    ; 02B4 _ B8, 00000430(d)
        sub     esp, 8                                  ; 02B9 _ 83. EC, 08
        push    eax                                     ; 02BC _ 50
        push    7                                       ; 02BD _ 6A, 07
        push    8                                       ; 02BF _ 6A, 08
        push    24                                      ; 02C1 _ 6A, 18
        push    dword [ebp-10H]                         ; 02C3 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 02C6 _ FF. 75, EC
        call    showChar8                               ; 02C9 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 02CE _ 83. C4, 20
        mov     eax, systemFont+330H                    ; 02D1 _ B8, 00000330(d)
        sub     esp, 8                                  ; 02D6 _ 83. EC, 08
        push    eax                                     ; 02D9 _ 50
        push    7                                       ; 02DA _ 6A, 07
        push    8                                       ; 02DC _ 6A, 08
        push    40                                      ; 02DE _ 6A, 28
        push    dword [ebp-10H]                         ; 02E0 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 02E3 _ FF. 75, EC
        call    showChar8                               ; 02E6 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 02EB _ 83. C4, 20
        mov     eax, systemFont+320H                    ; 02EE _ B8, 00000320(d)
        sub     esp, 8                                  ; 02F3 _ 83. EC, 08
        push    eax                                     ; 02F6 _ 50
        push    7                                       ; 02F7 _ 6A, 07
        push    8                                       ; 02F9 _ 6A, 08
        push    48                                      ; 02FB _ 6A, 30
        push    dword [ebp-10H]                         ; 02FD _ FF. 75, F0
        push    dword [ebp-14H]                         ; 0300 _ FF. 75, EC
        call    showChar8                               ; 0303 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0308 _ 83. C4, 20
        sub     esp, 8                                  ; 030B _ 83. EC, 08
        push    ?_020                                   ; 030E _ 68, 00000000(d)
        push    7                                       ; 0313 _ 6A, 07
        push    64                                      ; 0315 _ 6A, 40
        push    8                                       ; 0317 _ 6A, 08
        push    dword [ebp-10H]                         ; 0319 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 031C _ FF. 75, EC
        call    showString                              ; 031F _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0324 _ 83. C4, 20
?_001:  call    io_hlt                                  ; 0327 _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 032C _ EB, F9
; CMain End of function

init_palette:; Function begin
        push    ebp                                     ; 032E _ 55
        mov     ebp, esp                                ; 032F _ 89. E5
        sub     esp, 8                                  ; 0331 _ 83. EC, 08
        sub     esp, 4                                  ; 0334 _ 83. EC, 04
        push    table_rgb.1463                          ; 0337 _ 68, 00000020(d)
        push    15                                      ; 033C _ 6A, 0F
        push    0                                       ; 033E _ 6A, 00
        call    set_palette                             ; 0340 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0345 _ 83. C4, 10
        nop                                             ; 0348 _ 90
        leave                                           ; 0349 _ C9
        ret                                             ; 034A _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 034B _ 55
        mov     ebp, esp                                ; 034C _ 89. E5
        sub     esp, 24                                 ; 034E _ 83. EC, 18
        call    io_load_eflags                          ; 0351 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 0356 _ 89. 45, F4
        call    io_cli                                  ; 0359 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 035E _ 83. EC, 08
        push    dword [ebp+8H]                          ; 0361 _ FF. 75, 08
        push    968                                     ; 0364 _ 68, 000003C8
        call    io_out8                                 ; 0369 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 036E _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 0371 _ 8B. 45, 08
        mov     dword [ebp-10H], eax                    ; 0374 _ 89. 45, F0
        jmp     ?_003                                   ; 0377 _ EB, 65

?_002:  mov     eax, dword [ebp+10H]                    ; 0379 _ 8B. 45, 10
        movzx   eax, byte [eax]                         ; 037C _ 0F B6. 00
        shr     al, 2                                   ; 037F _ C0. E8, 02
        movzx   eax, al                                 ; 0382 _ 0F B6. C0
        sub     esp, 8                                  ; 0385 _ 83. EC, 08
        push    eax                                     ; 0388 _ 50
        push    969                                     ; 0389 _ 68, 000003C9
        call    io_out8                                 ; 038E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0393 _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 0396 _ 8B. 45, 10
        add     eax, 1                                  ; 0399 _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 039C _ 0F B6. 00
        shr     al, 2                                   ; 039F _ C0. E8, 02
        movzx   eax, al                                 ; 03A2 _ 0F B6. C0
        sub     esp, 8                                  ; 03A5 _ 83. EC, 08
        push    eax                                     ; 03A8 _ 50
        push    969                                     ; 03A9 _ 68, 000003C9
        call    io_out8                                 ; 03AE _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03B3 _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 03B6 _ 8B. 45, 10
        add     eax, 2                                  ; 03B9 _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 03BC _ 0F B6. 00
        shr     al, 2                                   ; 03BF _ C0. E8, 02
        movzx   eax, al                                 ; 03C2 _ 0F B6. C0
        sub     esp, 8                                  ; 03C5 _ 83. EC, 08
        push    eax                                     ; 03C8 _ 50
        push    969                                     ; 03C9 _ 68, 000003C9
        call    io_out8                                 ; 03CE _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03D3 _ 83. C4, 10
        add     dword [ebp+10H], 3                      ; 03D6 _ 83. 45, 10, 03
        add     dword [ebp-10H], 1                      ; 03DA _ 83. 45, F0, 01
?_003:  mov     eax, dword [ebp-10H]                    ; 03DE _ 8B. 45, F0
        cmp     eax, dword [ebp+0CH]                    ; 03E1 _ 3B. 45, 0C
        jle     ?_002                                   ; 03E4 _ 7E, 93
        sub     esp, 12                                 ; 03E6 _ 83. EC, 0C
        push    dword [ebp-0CH]                         ; 03E9 _ FF. 75, F4
        call    io_store_eflags                         ; 03EC _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03F1 _ 83. C4, 10
        nop                                             ; 03F4 _ 90
        leave                                           ; 03F5 _ C9
        ret                                             ; 03F6 _ C3
; set_palette End of function

boxfill8:; Function begin
        push    ebp                                     ; 03F7 _ 55
        mov     ebp, esp                                ; 03F8 _ 89. E5
        sub     esp, 20                                 ; 03FA _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 03FD _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 0400 _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 0403 _ 8B. 45, 18
        mov     dword [ebp-4H], eax                     ; 0406 _ 89. 45, FC
        jmp     ?_007                                   ; 0409 _ EB, 33

?_004:  mov     eax, dword [ebp+14H]                    ; 040B _ 8B. 45, 14
        mov     dword [ebp-8H], eax                     ; 040E _ 89. 45, F8
        jmp     ?_006                                   ; 0411 _ EB, 1F

?_005:  mov     eax, dword [ebp-4H]                     ; 0413 _ 8B. 45, FC
        imul    eax, dword [ebp+0CH]                    ; 0416 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 041A _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 041C _ 8B. 45, F8
        add     eax, edx                                ; 041F _ 01. D0
        mov     edx, eax                                ; 0421 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0423 _ 8B. 45, 08
        add     edx, eax                                ; 0426 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0428 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 042C _ 88. 02
        add     dword [ebp-8H], 1                       ; 042E _ 83. 45, F8, 01
?_006:  mov     eax, dword [ebp-8H]                     ; 0432 _ 8B. 45, F8
        cmp     eax, dword [ebp+1CH]                    ; 0435 _ 3B. 45, 1C
        jle     ?_005                                   ; 0438 _ 7E, D9
        add     dword [ebp-4H], 1                       ; 043A _ 83. 45, FC, 01
?_007:  mov     eax, dword [ebp-4H]                     ; 043E _ 8B. 45, FC
        cmp     eax, dword [ebp+20H]                    ; 0441 _ 3B. 45, 20
        jle     ?_004                                   ; 0444 _ 7E, C5
        nop                                             ; 0446 _ 90
        leave                                           ; 0447 _ C9
        ret                                             ; 0448 _ C3
; boxfill8 End of function

showString:; Function begin
        push    ebp                                     ; 0449 _ 55
        mov     ebp, esp                                ; 044A _ 89. E5
        sub     esp, 24                                 ; 044C _ 83. EC, 18
        mov     eax, dword [ebp+18H]                    ; 044F _ 8B. 45, 18
        mov     byte [ebp-0CH], al                      ; 0452 _ 88. 45, F4
        jmp     ?_009                                   ; 0455 _ EB, 37

?_008:  mov     eax, dword [ebp+1CH]                    ; 0457 _ 8B. 45, 1C
        movzx   eax, byte [eax]                         ; 045A _ 0F B6. 00
        movzx   eax, al                                 ; 045D _ 0F B6. C0
        shl     eax, 4                                  ; 0460 _ C1. E0, 04
        lea     edx, [systemFont+eax]                   ; 0463 _ 8D. 90, 00000000(d)
        movsx   eax, byte [ebp-0CH]                     ; 0469 _ 0F BE. 45, F4
        sub     esp, 8                                  ; 046D _ 83. EC, 08
        push    edx                                     ; 0470 _ 52
        push    eax                                     ; 0471 _ 50
        push    dword [ebp+14H]                         ; 0472 _ FF. 75, 14
        push    dword [ebp+10H]                         ; 0475 _ FF. 75, 10
        push    dword [ebp+0CH]                         ; 0478 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 047B _ FF. 75, 08
        call    showChar8                               ; 047E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0483 _ 83. C4, 20
        add     dword [ebp+1CH], 1                      ; 0486 _ 83. 45, 1C, 01
        add     dword [ebp+10H], 8                      ; 048A _ 83. 45, 10, 08
?_009:  mov     eax, dword [ebp+1CH]                    ; 048E _ 8B. 45, 1C
        movzx   eax, byte [eax]                         ; 0491 _ 0F B6. 00
        test    al, al                                  ; 0494 _ 84. C0
        jnz     ?_008                                   ; 0496 _ 75, BF
        nop                                             ; 0498 _ 90
        leave                                           ; 0499 _ C9
        ret                                             ; 049A _ C3
; showString End of function

showChar8:; Function begin
        push    ebp                                     ; 049B _ 55
        mov     ebp, esp                                ; 049C _ 89. E5
        sub     esp, 20                                 ; 049E _ 83. EC, 14
        mov     eax, dword [ebp+18H]                    ; 04A1 _ 8B. 45, 18
        mov     byte [ebp-14H], al                      ; 04A4 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 04A7 _ C7. 45, FC, 00000000
        jmp     ?_019                                   ; 04AE _ E9, 0000016C

?_010:  mov     edx, dword [ebp-4H]                     ; 04B3 _ 8B. 55, FC
        mov     eax, dword [ebp+1CH]                    ; 04B6 _ 8B. 45, 1C
        add     eax, edx                                ; 04B9 _ 01. D0
        movzx   eax, byte [eax]                         ; 04BB _ 0F B6. 00
        mov     byte [ebp-5H], al                       ; 04BE _ 88. 45, FB
        cmp     byte [ebp-5H], 0                        ; 04C1 _ 80. 7D, FB, 00
        jns     ?_011                                   ; 04C5 _ 79, 20
        mov     edx, dword [ebp+14H]                    ; 04C7 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 04CA _ 8B. 45, FC
        add     eax, edx                                ; 04CD _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 04CF _ 0F AF. 45, 0C
        mov     edx, eax                                ; 04D3 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 04D5 _ 8B. 45, 10
        add     eax, edx                                ; 04D8 _ 01. D0
        mov     edx, eax                                ; 04DA _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 04DC _ 8B. 45, 08
        add     edx, eax                                ; 04DF _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 04E1 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 04E5 _ 88. 02
?_011:  movsx   eax, byte [ebp-5H]                      ; 04E7 _ 0F BE. 45, FB
        and     eax, 40H                                ; 04EB _ 83. E0, 40
        test    eax, eax                                ; 04EE _ 85. C0
        jz      ?_012                                   ; 04F0 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 04F2 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 04F5 _ 8B. 45, FC
        add     eax, edx                                ; 04F8 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 04FA _ 0F AF. 45, 0C
        mov     edx, eax                                ; 04FE _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0500 _ 8B. 45, 10
        add     eax, edx                                ; 0503 _ 01. D0
        lea     edx, [eax+1H]                           ; 0505 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0508 _ 8B. 45, 08
        add     edx, eax                                ; 050B _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 050D _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0511 _ 88. 02
?_012:  movsx   eax, byte [ebp-5H]                      ; 0513 _ 0F BE. 45, FB
        and     eax, 20H                                ; 0517 _ 83. E0, 20
        test    eax, eax                                ; 051A _ 85. C0
        jz      ?_013                                   ; 051C _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 051E _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0521 _ 8B. 45, FC
        add     eax, edx                                ; 0524 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0526 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 052A _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 052C _ 8B. 45, 10
        add     eax, edx                                ; 052F _ 01. D0
        lea     edx, [eax+2H]                           ; 0531 _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 0534 _ 8B. 45, 08
        add     edx, eax                                ; 0537 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0539 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 053D _ 88. 02
?_013:  movsx   eax, byte [ebp-5H]                      ; 053F _ 0F BE. 45, FB
        and     eax, 10H                                ; 0543 _ 83. E0, 10
        test    eax, eax                                ; 0546 _ 85. C0
        jz      ?_014                                   ; 0548 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 054A _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 054D _ 8B. 45, FC
        add     eax, edx                                ; 0550 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0552 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0556 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0558 _ 8B. 45, 10
        add     eax, edx                                ; 055B _ 01. D0
        lea     edx, [eax+3H]                           ; 055D _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 0560 _ 8B. 45, 08
        add     edx, eax                                ; 0563 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0565 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0569 _ 88. 02
?_014:  movsx   eax, byte [ebp-5H]                      ; 056B _ 0F BE. 45, FB
        and     eax, 08H                                ; 056F _ 83. E0, 08
        test    eax, eax                                ; 0572 _ 85. C0
        jz      ?_015                                   ; 0574 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 0576 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0579 _ 8B. 45, FC
        add     eax, edx                                ; 057C _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 057E _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0582 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0584 _ 8B. 45, 10
        add     eax, edx                                ; 0587 _ 01. D0
        lea     edx, [eax+4H]                           ; 0589 _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 058C _ 8B. 45, 08
        add     edx, eax                                ; 058F _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0591 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0595 _ 88. 02
?_015:  movsx   eax, byte [ebp-5H]                      ; 0597 _ 0F BE. 45, FB
        and     eax, 04H                                ; 059B _ 83. E0, 04
        test    eax, eax                                ; 059E _ 85. C0
        jz      ?_016                                   ; 05A0 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 05A2 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 05A5 _ 8B. 45, FC
        add     eax, edx                                ; 05A8 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 05AA _ 0F AF. 45, 0C
        mov     edx, eax                                ; 05AE _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 05B0 _ 8B. 45, 10
        add     eax, edx                                ; 05B3 _ 01. D0
        lea     edx, [eax+5H]                           ; 05B5 _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 05B8 _ 8B. 45, 08
        add     edx, eax                                ; 05BB _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 05BD _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 05C1 _ 88. 02
?_016:  movsx   eax, byte [ebp-5H]                      ; 05C3 _ 0F BE. 45, FB
        and     eax, 02H                                ; 05C7 _ 83. E0, 02
        test    eax, eax                                ; 05CA _ 85. C0
        jz      ?_017                                   ; 05CC _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 05CE _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 05D1 _ 8B. 45, FC
        add     eax, edx                                ; 05D4 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 05D6 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 05DA _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 05DC _ 8B. 45, 10
        add     eax, edx                                ; 05DF _ 01. D0
        lea     edx, [eax+6H]                           ; 05E1 _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 05E4 _ 8B. 45, 08
        add     edx, eax                                ; 05E7 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 05E9 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 05ED _ 88. 02
?_017:  movsx   eax, byte [ebp-5H]                      ; 05EF _ 0F BE. 45, FB
        and     eax, 01H                                ; 05F3 _ 83. E0, 01
        test    eax, eax                                ; 05F6 _ 85. C0
        jz      ?_018                                   ; 05F8 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 05FA _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 05FD _ 8B. 45, FC
        add     eax, edx                                ; 0600 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0602 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0606 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0608 _ 8B. 45, 10
        add     eax, edx                                ; 060B _ 01. D0
        lea     edx, [eax+7H]                           ; 060D _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 0610 _ 8B. 45, 08
        add     edx, eax                                ; 0613 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0615 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0619 _ 88. 02
?_018:  add     dword [ebp-4H], 1                       ; 061B _ 83. 45, FC, 01
?_019:  cmp     dword [ebp-4H], 15                      ; 061F _ 83. 7D, FC, 0F
        jle     ?_010                                   ; 0623 _ 0F 8E, FFFFFE8A
        nop                                             ; 0629 _ 90
        leave                                           ; 062A _ C9
        ret                                             ; 062B _ C3
; showChar8 End of function


;SECTION .data   align=32 noexecute                      ; section number 2, data

fontA.1456:                                             ; oword
        db 00H, 18H, 18H, 18H, 18H, 24H, 24H, 24H       ; 0000 _ .....$$$
        db 24H, 7EH, 42H, 42H, 42H, 0E7H, 00H, 00H      ; 0008 _ $~BBB...
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0010 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0018 _ ........

table_rgb.1463:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 00H, 0FFH     ; 0020 _ ........
        db 00H, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH   ; 0028 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0030 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0038 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 0040 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 0048 _ ........


;SECTION .bss    align=1 noexecute                       ; section number 3, bss


;SECTION .rodata align=1 noexecute                       ; section number 4, const

?_020:                                                  ; byte
        db 74H, 65H, 78H, 74H, 21H, 00H                 ; 0000 _ text!.



