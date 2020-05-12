; Disassembly of file: write_vga_cursor.o
; Tue Apr 21 10:49:59 2020
; Mode: 32 bits
; Syntax: YASM/NASM
; Instruction set: 80386


;SECTION .text   align=1 execute                         ; section number 1, code

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
        mov     eax, systemFont+410H                    ; 025E _ B8, 00000410(d)
        sub     esp, 8                                  ; 0263 _ 83. EC, 08
        push    eax                                     ; 0266 _ 50
        push    7                                       ; 0267 _ 6A, 07
        push    8                                       ; 0269 _ 6A, 08
        push    8                                       ; 026B _ 6A, 08
        push    dword [ebp-10H]                         ; 026D _ FF. 75, F0
        push    dword [ebp-14H]                         ; 0270 _ FF. 75, EC
        call    showChar8                               ; 0273 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0278 _ 83. C4, 20
        mov     eax, systemFont+420H                    ; 027B _ B8, 00000420(d)
        sub     esp, 8                                  ; 0280 _ 83. EC, 08
        push    eax                                     ; 0283 _ 50
        push    7                                       ; 0284 _ 6A, 07
        push    8                                       ; 0286 _ 6A, 08
        push    16                                      ; 0288 _ 6A, 10
        push    dword [ebp-10H]                         ; 028A _ FF. 75, F0
        push    dword [ebp-14H]                         ; 028D _ FF. 75, EC
        call    showChar8                               ; 0290 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0295 _ 83. C4, 20
        mov     eax, systemFont+430H                    ; 0298 _ B8, 00000430(d)
        sub     esp, 8                                  ; 029D _ 83. EC, 08
        push    eax                                     ; 02A0 _ 50
        push    7                                       ; 02A1 _ 6A, 07
        push    8                                       ; 02A3 _ 6A, 08
        push    24                                      ; 02A5 _ 6A, 18
        push    dword [ebp-10H]                         ; 02A7 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 02AA _ FF. 75, EC
        call    showChar8                               ; 02AD _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 02B2 _ 83. C4, 20
        mov     eax, systemFont+330H                    ; 02B5 _ B8, 00000330(d)
        sub     esp, 8                                  ; 02BA _ 83. EC, 08
        push    eax                                     ; 02BD _ 50
        push    7                                       ; 02BE _ 6A, 07
        push    8                                       ; 02C0 _ 6A, 08
        push    40                                      ; 02C2 _ 6A, 28
        push    dword [ebp-10H]                         ; 02C4 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 02C7 _ FF. 75, EC
        call    showChar8                               ; 02CA _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 02CF _ 83. C4, 20
        mov     eax, systemFont+320H                    ; 02D2 _ B8, 00000320(d)
        sub     esp, 8                                  ; 02D7 _ 83. EC, 08
        push    eax                                     ; 02DA _ 50
        push    7                                       ; 02DB _ 6A, 07
        push    8                                       ; 02DD _ 6A, 08
        push    48                                      ; 02DF _ 6A, 30
        push    dword [ebp-10H]                         ; 02E1 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 02E4 _ FF. 75, EC
        call    showChar8                               ; 02E7 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 02EC _ 83. C4, 20
        sub     esp, 8                                  ; 02EF _ 83. EC, 08
        push    ?_031                                   ; 02F2 _ 68, 00000000(d)
        push    7                                       ; 02F7 _ 6A, 07
        push    64                                      ; 02F9 _ 6A, 40
        push    8                                       ; 02FB _ 6A, 08
        push    dword [ebp-10H]                         ; 02FD _ FF. 75, F0
        push    dword [ebp-14H]                         ; 0300 _ FF. 75, EC
        call    showString                              ; 0303 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0308 _ 83. C4, 20
        sub     esp, 8                                  ; 030B _ 83. EC, 08
        push    14                                      ; 030E _ 6A, 0E
        push    mcursor                                 ; 0310 _ 68, 00000000(d)
        call    init_mouse_cursor                       ; 0315 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 031A _ 83. C4, 10
        push    16                                      ; 031D _ 6A, 10
        push    mcursor                                 ; 031F _ 68, 00000000(d)
        push    80                                      ; 0324 _ 6A, 50
        push    80                                      ; 0326 _ 6A, 50
        push    16                                      ; 0328 _ 6A, 10
        push    16                                      ; 032A _ 6A, 10
        push    dword [ebp-10H]                         ; 032C _ FF. 75, F0
        push    dword [ebp-14H]                         ; 032F _ FF. 75, EC
        call    putblock                                ; 0332 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0337 _ 83. C4, 20
?_001:  call    io_hlt                                  ; 033A _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 033F _ EB, F9
; CMain End of function

init_palette:; Function begin
        push    ebp                                     ; 0341 _ 55
        mov     ebp, esp                                ; 0342 _ 89. E5
        sub     esp, 8                                  ; 0344 _ 83. EC, 08
        sub     esp, 4                                  ; 0347 _ 83. EC, 04
        push    table_rgb.1467                          ; 034A _ 68, 00000000(d)
        push    15                                      ; 034F _ 6A, 0F
        push    0                                       ; 0351 _ 6A, 00
        call    set_palette                             ; 0353 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0358 _ 83. C4, 10
        nop                                             ; 035B _ 90
        leave                                           ; 035C _ C9
        ret                                             ; 035D _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 035E _ 55
        mov     ebp, esp                                ; 035F _ 89. E5
        sub     esp, 24                                 ; 0361 _ 83. EC, 18
        call    io_load_eflags                          ; 0364 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 0369 _ 89. 45, F4
        call    io_cli                                  ; 036C _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0371 _ 83. EC, 08
        push    dword [ebp+8H]                          ; 0374 _ FF. 75, 08
        push    968                                     ; 0377 _ 68, 000003C8
        call    io_out8                                 ; 037C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0381 _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 0384 _ 8B. 45, 08
        mov     dword [ebp-10H], eax                    ; 0387 _ 89. 45, F0
        jmp     ?_003                                   ; 038A _ EB, 65

?_002:  mov     eax, dword [ebp+10H]                    ; 038C _ 8B. 45, 10
        movzx   eax, byte [eax]                         ; 038F _ 0F B6. 00
        shr     al, 2                                   ; 0392 _ C0. E8, 02
        movzx   eax, al                                 ; 0395 _ 0F B6. C0
        sub     esp, 8                                  ; 0398 _ 83. EC, 08
        push    eax                                     ; 039B _ 50
        push    969                                     ; 039C _ 68, 000003C9
        call    io_out8                                 ; 03A1 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03A6 _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 03A9 _ 8B. 45, 10
        add     eax, 1                                  ; 03AC _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 03AF _ 0F B6. 00
        shr     al, 2                                   ; 03B2 _ C0. E8, 02
        movzx   eax, al                                 ; 03B5 _ 0F B6. C0
        sub     esp, 8                                  ; 03B8 _ 83. EC, 08
        push    eax                                     ; 03BB _ 50
        push    969                                     ; 03BC _ 68, 000003C9
        call    io_out8                                 ; 03C1 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03C6 _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 03C9 _ 8B. 45, 10
        add     eax, 2                                  ; 03CC _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 03CF _ 0F B6. 00
        shr     al, 2                                   ; 03D2 _ C0. E8, 02
        movzx   eax, al                                 ; 03D5 _ 0F B6. C0
        sub     esp, 8                                  ; 03D8 _ 83. EC, 08
        push    eax                                     ; 03DB _ 50
        push    969                                     ; 03DC _ 68, 000003C9
        call    io_out8                                 ; 03E1 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03E6 _ 83. C4, 10
        add     dword [ebp+10H], 3                      ; 03E9 _ 83. 45, 10, 03
        add     dword [ebp-10H], 1                      ; 03ED _ 83. 45, F0, 01
?_003:  mov     eax, dword [ebp-10H]                    ; 03F1 _ 8B. 45, F0
        cmp     eax, dword [ebp+0CH]                    ; 03F4 _ 3B. 45, 0C
        jle     ?_002                                   ; 03F7 _ 7E, 93
        sub     esp, 12                                 ; 03F9 _ 83. EC, 0C
        push    dword [ebp-0CH]                         ; 03FC _ FF. 75, F4
        call    io_store_eflags                         ; 03FF _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0404 _ 83. C4, 10
        nop                                             ; 0407 _ 90
        leave                                           ; 0408 _ C9
        ret                                             ; 0409 _ C3
; set_palette End of function

boxfill8:; Function begin
        push    ebp                                     ; 040A _ 55
        mov     ebp, esp                                ; 040B _ 89. E5
        sub     esp, 20                                 ; 040D _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 0410 _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 0413 _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 0416 _ 8B. 45, 18
        mov     dword [ebp-4H], eax                     ; 0419 _ 89. 45, FC
        jmp     ?_007                                   ; 041C _ EB, 33

?_004:  mov     eax, dword [ebp+14H]                    ; 041E _ 8B. 45, 14
        mov     dword [ebp-8H], eax                     ; 0421 _ 89. 45, F8
        jmp     ?_006                                   ; 0424 _ EB, 1F

?_005:  mov     eax, dword [ebp-4H]                     ; 0426 _ 8B. 45, FC
        imul    eax, dword [ebp+0CH]                    ; 0429 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 042D _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 042F _ 8B. 45, F8
        add     eax, edx                                ; 0432 _ 01. D0
        mov     edx, eax                                ; 0434 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0436 _ 8B. 45, 08
        add     edx, eax                                ; 0439 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 043B _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 043F _ 88. 02
        add     dword [ebp-8H], 1                       ; 0441 _ 83. 45, F8, 01
?_006:  mov     eax, dword [ebp-8H]                     ; 0445 _ 8B. 45, F8
        cmp     eax, dword [ebp+1CH]                    ; 0448 _ 3B. 45, 1C
        jle     ?_005                                   ; 044B _ 7E, D9
        add     dword [ebp-4H], 1                       ; 044D _ 83. 45, FC, 01
?_007:  mov     eax, dword [ebp-4H]                     ; 0451 _ 8B. 45, FC
        cmp     eax, dword [ebp+20H]                    ; 0454 _ 3B. 45, 20
        jle     ?_004                                   ; 0457 _ 7E, C5
        nop                                             ; 0459 _ 90
        leave                                           ; 045A _ C9
        ret                                             ; 045B _ C3
; boxfill8 End of function

showString:; Function begin
        push    ebp                                     ; 045C _ 55
        mov     ebp, esp                                ; 045D _ 89. E5
        sub     esp, 24                                 ; 045F _ 83. EC, 18
        mov     eax, dword [ebp+18H]                    ; 0462 _ 8B. 45, 18
        mov     byte [ebp-0CH], al                      ; 0465 _ 88. 45, F4
        jmp     ?_009                                   ; 0468 _ EB, 37

?_008:  mov     eax, dword [ebp+1CH]                    ; 046A _ 8B. 45, 1C
        movzx   eax, byte [eax]                         ; 046D _ 0F B6. 00
        movzx   eax, al                                 ; 0470 _ 0F B6. C0
        shl     eax, 4                                  ; 0473 _ C1. E0, 04
        lea     edx, [systemFont+eax]                   ; 0476 _ 8D. 90, 00000000(d)
        movsx   eax, byte [ebp-0CH]                     ; 047C _ 0F BE. 45, F4
        sub     esp, 8                                  ; 0480 _ 83. EC, 08
        push    edx                                     ; 0483 _ 52
        push    eax                                     ; 0484 _ 50
        push    dword [ebp+14H]                         ; 0485 _ FF. 75, 14
        push    dword [ebp+10H]                         ; 0488 _ FF. 75, 10
        push    dword [ebp+0CH]                         ; 048B _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 048E _ FF. 75, 08
        call    showChar8                               ; 0491 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0496 _ 83. C4, 20
        add     dword [ebp+1CH], 1                      ; 0499 _ 83. 45, 1C, 01
        add     dword [ebp+10H], 8                      ; 049D _ 83. 45, 10, 08
?_009:  mov     eax, dword [ebp+1CH]                    ; 04A1 _ 8B. 45, 1C
        movzx   eax, byte [eax]                         ; 04A4 _ 0F B6. 00
        test    al, al                                  ; 04A7 _ 84. C0
        jnz     ?_008                                   ; 04A9 _ 75, BF
        nop                                             ; 04AB _ 90
        leave                                           ; 04AC _ C9
        ret                                             ; 04AD _ C3
; showString End of function

showChar8:; Function begin
        push    ebp                                     ; 04AE _ 55
        mov     ebp, esp                                ; 04AF _ 89. E5
        sub     esp, 20                                 ; 04B1 _ 83. EC, 14
        mov     eax, dword [ebp+18H]                    ; 04B4 _ 8B. 45, 18
        mov     byte [ebp-14H], al                      ; 04B7 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 04BA _ C7. 45, FC, 00000000
        jmp     ?_019                                   ; 04C1 _ E9, 0000016C

?_010:  mov     edx, dword [ebp-4H]                     ; 04C6 _ 8B. 55, FC
        mov     eax, dword [ebp+1CH]                    ; 04C9 _ 8B. 45, 1C
        add     eax, edx                                ; 04CC _ 01. D0
        movzx   eax, byte [eax]                         ; 04CE _ 0F B6. 00
        mov     byte [ebp-5H], al                       ; 04D1 _ 88. 45, FB
        cmp     byte [ebp-5H], 0                        ; 04D4 _ 80. 7D, FB, 00
        jns     ?_011                                   ; 04D8 _ 79, 20
        mov     edx, dword [ebp+14H]                    ; 04DA _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 04DD _ 8B. 45, FC
        add     eax, edx                                ; 04E0 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 04E2 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 04E6 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 04E8 _ 8B. 45, 10
        add     eax, edx                                ; 04EB _ 01. D0
        mov     edx, eax                                ; 04ED _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 04EF _ 8B. 45, 08
        add     edx, eax                                ; 04F2 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 04F4 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 04F8 _ 88. 02
?_011:  movsx   eax, byte [ebp-5H]                      ; 04FA _ 0F BE. 45, FB
        and     eax, 40H                                ; 04FE _ 83. E0, 40
        test    eax, eax                                ; 0501 _ 85. C0
        jz      ?_012                                   ; 0503 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 0505 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0508 _ 8B. 45, FC
        add     eax, edx                                ; 050B _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 050D _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0511 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0513 _ 8B. 45, 10
        add     eax, edx                                ; 0516 _ 01. D0
        lea     edx, [eax+1H]                           ; 0518 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 051B _ 8B. 45, 08
        add     edx, eax                                ; 051E _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0520 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0524 _ 88. 02
?_012:  movsx   eax, byte [ebp-5H]                      ; 0526 _ 0F BE. 45, FB
        and     eax, 20H                                ; 052A _ 83. E0, 20
        test    eax, eax                                ; 052D _ 85. C0
        jz      ?_013                                   ; 052F _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 0531 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0534 _ 8B. 45, FC
        add     eax, edx                                ; 0537 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0539 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 053D _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 053F _ 8B. 45, 10
        add     eax, edx                                ; 0542 _ 01. D0
        lea     edx, [eax+2H]                           ; 0544 _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 0547 _ 8B. 45, 08
        add     edx, eax                                ; 054A _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 054C _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0550 _ 88. 02
?_013:  movsx   eax, byte [ebp-5H]                      ; 0552 _ 0F BE. 45, FB
        and     eax, 10H                                ; 0556 _ 83. E0, 10
        test    eax, eax                                ; 0559 _ 85. C0
        jz      ?_014                                   ; 055B _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 055D _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0560 _ 8B. 45, FC
        add     eax, edx                                ; 0563 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0565 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0569 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 056B _ 8B. 45, 10
        add     eax, edx                                ; 056E _ 01. D0
        lea     edx, [eax+3H]                           ; 0570 _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 0573 _ 8B. 45, 08
        add     edx, eax                                ; 0576 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0578 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 057C _ 88. 02
?_014:  movsx   eax, byte [ebp-5H]                      ; 057E _ 0F BE. 45, FB
        and     eax, 08H                                ; 0582 _ 83. E0, 08
        test    eax, eax                                ; 0585 _ 85. C0
        jz      ?_015                                   ; 0587 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 0589 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 058C _ 8B. 45, FC
        add     eax, edx                                ; 058F _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0591 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0595 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0597 _ 8B. 45, 10
        add     eax, edx                                ; 059A _ 01. D0
        lea     edx, [eax+4H]                           ; 059C _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 059F _ 8B. 45, 08
        add     edx, eax                                ; 05A2 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 05A4 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 05A8 _ 88. 02
?_015:  movsx   eax, byte [ebp-5H]                      ; 05AA _ 0F BE. 45, FB
        and     eax, 04H                                ; 05AE _ 83. E0, 04
        test    eax, eax                                ; 05B1 _ 85. C0
        jz      ?_016                                   ; 05B3 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 05B5 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 05B8 _ 8B. 45, FC
        add     eax, edx                                ; 05BB _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 05BD _ 0F AF. 45, 0C
        mov     edx, eax                                ; 05C1 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 05C3 _ 8B. 45, 10
        add     eax, edx                                ; 05C6 _ 01. D0
        lea     edx, [eax+5H]                           ; 05C8 _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 05CB _ 8B. 45, 08
        add     edx, eax                                ; 05CE _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 05D0 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 05D4 _ 88. 02
?_016:  movsx   eax, byte [ebp-5H]                      ; 05D6 _ 0F BE. 45, FB
        and     eax, 02H                                ; 05DA _ 83. E0, 02
        test    eax, eax                                ; 05DD _ 85. C0
        jz      ?_017                                   ; 05DF _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 05E1 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 05E4 _ 8B. 45, FC
        add     eax, edx                                ; 05E7 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 05E9 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 05ED _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 05EF _ 8B. 45, 10
        add     eax, edx                                ; 05F2 _ 01. D0
        lea     edx, [eax+6H]                           ; 05F4 _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 05F7 _ 8B. 45, 08
        add     edx, eax                                ; 05FA _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 05FC _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0600 _ 88. 02
?_017:  movsx   eax, byte [ebp-5H]                      ; 0602 _ 0F BE. 45, FB
        and     eax, 01H                                ; 0606 _ 83. E0, 01
        test    eax, eax                                ; 0609 _ 85. C0
        jz      ?_018                                   ; 060B _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 060D _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0610 _ 8B. 45, FC
        add     eax, edx                                ; 0613 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0615 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0619 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 061B _ 8B. 45, 10
        add     eax, edx                                ; 061E _ 01. D0
        lea     edx, [eax+7H]                           ; 0620 _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 0623 _ 8B. 45, 08
        add     edx, eax                                ; 0626 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0628 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 062C _ 88. 02
?_018:  add     dword [ebp-4H], 1                       ; 062E _ 83. 45, FC, 01
?_019:  cmp     dword [ebp-4H], 15                      ; 0632 _ 83. 7D, FC, 0F
        jle     ?_010                                   ; 0636 _ 0F 8E, FFFFFE8A
        nop                                             ; 063C _ 90
        leave                                           ; 063D _ C9
        ret                                             ; 063E _ C3
; showChar8 End of function

init_mouse_cursor:; Function begin
        push    ebp                                     ; 063F _ 55
        mov     ebp, esp                                ; 0640 _ 89. E5
        sub     esp, 20                                 ; 0642 _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 0645 _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 0648 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 064B _ C7. 45, FC, 00000000
        jmp     ?_026                                   ; 0652 _ E9, 000000B5

?_020:  mov     dword [ebp-8H], 0                       ; 0657 _ C7. 45, F8, 00000000
        jmp     ?_025                                   ; 065E _ E9, 0000009B

?_021:  mov     eax, dword [ebp-4H]                     ; 0663 _ 8B. 45, FC
        shl     eax, 4                                  ; 0666 _ C1. E0, 04
        mov     edx, eax                                ; 0669 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 066B _ 8B. 45, F8
        add     eax, edx                                ; 066E _ 01. D0
        add     eax, cursor.1525                        ; 0670 _ 05, 00000040(d)
        movzx   eax, byte [eax]                         ; 0675 _ 0F B6. 00
        cmp     al, 42                                  ; 0678 _ 3C, 2A
        jnz     ?_022                                   ; 067A _ 75, 19
        mov     eax, dword [ebp-4H]                     ; 067C _ 8B. 45, FC
        shl     eax, 4                                  ; 067F _ C1. E0, 04
        mov     edx, eax                                ; 0682 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0684 _ 8B. 45, F8
        add     eax, edx                                ; 0687 _ 01. D0
        mov     edx, eax                                ; 0689 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 068B _ 8B. 45, 08
        add     eax, edx                                ; 068E _ 01. D0
        mov     byte [eax], 0                           ; 0690 _ C6. 00, 00
        jmp     ?_024                                   ; 0693 _ EB, 65

?_022:  mov     eax, dword [ebp-4H]                     ; 0695 _ 8B. 45, FC
        shl     eax, 4                                  ; 0698 _ C1. E0, 04
        mov     edx, eax                                ; 069B _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 069D _ 8B. 45, F8
        add     eax, edx                                ; 06A0 _ 01. D0
        add     eax, cursor.1525                        ; 06A2 _ 05, 00000040(d)
        movzx   eax, byte [eax]                         ; 06A7 _ 0F B6. 00
        cmp     al, 79                                  ; 06AA _ 3C, 4F
        jnz     ?_023                                   ; 06AC _ 75, 19
        mov     eax, dword [ebp-4H]                     ; 06AE _ 8B. 45, FC
        shl     eax, 4                                  ; 06B1 _ C1. E0, 04
        mov     edx, eax                                ; 06B4 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 06B6 _ 8B. 45, F8
        add     eax, edx                                ; 06B9 _ 01. D0
        mov     edx, eax                                ; 06BB _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 06BD _ 8B. 45, 08
        add     eax, edx                                ; 06C0 _ 01. D0
        mov     byte [eax], 7                           ; 06C2 _ C6. 00, 07
        jmp     ?_024                                   ; 06C5 _ EB, 33

?_023:  mov     eax, dword [ebp-4H]                     ; 06C7 _ 8B. 45, FC
        shl     eax, 4                                  ; 06CA _ C1. E0, 04
        mov     edx, eax                                ; 06CD _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 06CF _ 8B. 45, F8
        add     eax, edx                                ; 06D2 _ 01. D0
        add     eax, cursor.1525                        ; 06D4 _ 05, 00000040(d)
        movzx   eax, byte [eax]                         ; 06D9 _ 0F B6. 00
        cmp     al, 46                                  ; 06DC _ 3C, 2E
        jnz     ?_024                                   ; 06DE _ 75, 1A
        mov     eax, dword [ebp-4H]                     ; 06E0 _ 8B. 45, FC
        shl     eax, 4                                  ; 06E3 _ C1. E0, 04
        mov     edx, eax                                ; 06E6 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 06E8 _ 8B. 45, F8
        add     eax, edx                                ; 06EB _ 01. D0
        mov     edx, eax                                ; 06ED _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 06EF _ 8B. 45, 08
        add     edx, eax                                ; 06F2 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 06F4 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 06F8 _ 88. 02
?_024:  add     dword [ebp-8H], 1                       ; 06FA _ 83. 45, F8, 01
?_025:  cmp     dword [ebp-8H], 15                      ; 06FE _ 83. 7D, F8, 0F
        jle     ?_021                                   ; 0702 _ 0F 8E, FFFFFF5B
        add     dword [ebp-4H], 1                       ; 0708 _ 83. 45, FC, 01
?_026:  cmp     dword [ebp-4H], 15                      ; 070C _ 83. 7D, FC, 0F
        jle     ?_020                                   ; 0710 _ 0F 8E, FFFFFF41
        nop                                             ; 0716 _ 90
        leave                                           ; 0717 _ C9
        ret                                             ; 0718 _ C3
; init_mouse_cursor End of function

putblock:; Function begin
        push    ebp                                     ; 0719 _ 55
        mov     ebp, esp                                ; 071A _ 89. E5
        push    ebx                                     ; 071C _ 53
        sub     esp, 16                                 ; 071D _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 0720 _ C7. 45, F8, 00000000
        jmp     ?_030                                   ; 0727 _ EB, 50

?_027:  mov     dword [ebp-0CH], 0                      ; 0729 _ C7. 45, F4, 00000000
        jmp     ?_029                                   ; 0730 _ EB, 3B

?_028:  mov     eax, dword [ebp-8H]                     ; 0732 _ 8B. 45, F8
        imul    eax, dword [ebp+24H]                    ; 0735 _ 0F AF. 45, 24
        mov     edx, eax                                ; 0739 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 073B _ 8B. 45, F4
        add     eax, edx                                ; 073E _ 01. D0
        mov     edx, eax                                ; 0740 _ 89. C2
        mov     eax, dword [ebp+20H]                    ; 0742 _ 8B. 45, 20
        add     eax, edx                                ; 0745 _ 01. D0
        mov     ecx, dword [ebp+1CH]                    ; 0747 _ 8B. 4D, 1C
        mov     edx, dword [ebp-8H]                     ; 074A _ 8B. 55, F8
        add     edx, ecx                                ; 074D _ 01. CA
        imul    edx, dword [ebp+0CH]                    ; 074F _ 0F AF. 55, 0C
        mov     ebx, dword [ebp+18H]                    ; 0753 _ 8B. 5D, 18
        mov     ecx, dword [ebp-0CH]                    ; 0756 _ 8B. 4D, F4
        add     ecx, ebx                                ; 0759 _ 01. D9
        add     edx, ecx                                ; 075B _ 01. CA
        mov     ecx, edx                                ; 075D _ 89. D1
        mov     edx, dword [ebp+8H]                     ; 075F _ 8B. 55, 08
        add     edx, ecx                                ; 0762 _ 01. CA
        movzx   eax, byte [eax]                         ; 0764 _ 0F B6. 00
        mov     byte [edx], al                          ; 0767 _ 88. 02
        add     dword [ebp-0CH], 1                      ; 0769 _ 83. 45, F4, 01
?_029:  mov     eax, dword [ebp-0CH]                    ; 076D _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 0770 _ 3B. 45, 10
        jl      ?_028                                   ; 0773 _ 7C, BD
        add     dword [ebp-8H], 1                       ; 0775 _ 83. 45, F8, 01
?_030:  mov     eax, dword [ebp-8H]                     ; 0779 _ 8B. 45, F8
        cmp     eax, dword [ebp+14H]                    ; 077C _ 3B. 45, 14
        jl      ?_027                                   ; 077F _ 7C, A8
        nop                                             ; 0781 _ 90
        add     esp, 16                                 ; 0782 _ 83. C4, 10
        pop     ebx                                     ; 0785 _ 5B
        pop     ebp                                     ; 0786 _ 5D
        ret                                             ; 0787 _ C3
; putblock End of function


;SECTION .data   align=32 noexecute                      ; section number 2, data

table_rgb.1467:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 00H, 0FFH     ; 0000 _ ........
        db 00H, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH   ; 0008 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0010 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0018 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 0020 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 0028 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0030 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0038 _ ........

cursor.1525:                                            ; byte
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


;SECTION .rodata align=1 noexecute                       ; section number 4, const

?_031:                                                  ; byte
        db 74H, 65H, 78H, 74H, 21H, 00H                 ; 0000 _ text!.


