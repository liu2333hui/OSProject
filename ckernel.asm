; Disassembly of file: /home/bobkuo/eclipse-workspace/nasmCode/ckernel.o
; Mon Apr 27 21:57:22 2020
; Mode: 32 bits
; Syntax: YASM/NASM
; Instruction set: 80386


global CMain: function
global init_palette: function
global set_palette: function
global boxfill8: function
global memman_init: function
global memman_total: function
global memman_alloc: function
global memman_free: function
global memman_alloc_4k: function
global shtctl_init: function
global sheet_alloc: function
global sheet_setbuf: function
global sheet_updown: function
global sheet_refresh: function
global sheet_slide: function

extern io_out8                                          ; near
extern io_store_eflags                                  ; near
extern io_cli                                           ; near
extern io_hlt                                           ; near
extern io_load_eflags                                   ; near


SECTION .text   align=1 execute                         ; section number 1, code

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
?_001:  call    io_hlt                                  ; 025E _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 0263 _ EB, F9
; CMain End of function

init_palette:; Function begin
        push    ebp                                     ; 0265 _ 55
        mov     ebp, esp                                ; 0266 _ 89. E5
        sub     esp, 8                                  ; 0268 _ 83. EC, 08
        sub     esp, 4                                  ; 026B _ 83. EC, 04
        push    table_rgb.1447                          ; 026E _ 68, 00000000(d)
        push    15                                      ; 0273 _ 6A, 0F
        push    0                                       ; 0275 _ 6A, 00
        call    set_palette                             ; 0277 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 027C _ 83. C4, 10
        nop                                             ; 027F _ 90
        leave                                           ; 0280 _ C9
        ret                                             ; 0281 _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 0282 _ 55
        mov     ebp, esp                                ; 0283 _ 89. E5
        sub     esp, 24                                 ; 0285 _ 83. EC, 18
        call    io_load_eflags                          ; 0288 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 028D _ 89. 45, F4
        call    io_cli                                  ; 0290 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0295 _ 83. EC, 08
        push    dword [ebp+8H]                          ; 0298 _ FF. 75, 08
        push    968                                     ; 029B _ 68, 000003C8
        call    io_out8                                 ; 02A0 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 02A5 _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 02A8 _ 8B. 45, 08
        mov     dword [ebp-10H], eax                    ; 02AB _ 89. 45, F0
        jmp     ?_003                                   ; 02AE _ EB, 65

?_002:  mov     eax, dword [ebp+10H]                    ; 02B0 _ 8B. 45, 10
        movzx   eax, byte [eax]                         ; 02B3 _ 0F B6. 00
        shr     al, 2                                   ; 02B6 _ C0. E8, 02
        movzx   eax, al                                 ; 02B9 _ 0F B6. C0
        sub     esp, 8                                  ; 02BC _ 83. EC, 08
        push    eax                                     ; 02BF _ 50
        push    969                                     ; 02C0 _ 68, 000003C9
        call    io_out8                                 ; 02C5 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 02CA _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 02CD _ 8B. 45, 10
        add     eax, 1                                  ; 02D0 _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 02D3 _ 0F B6. 00
        shr     al, 2                                   ; 02D6 _ C0. E8, 02
        movzx   eax, al                                 ; 02D9 _ 0F B6. C0
        sub     esp, 8                                  ; 02DC _ 83. EC, 08
        push    eax                                     ; 02DF _ 50
        push    969                                     ; 02E0 _ 68, 000003C9
        call    io_out8                                 ; 02E5 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 02EA _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 02ED _ 8B. 45, 10
        add     eax, 2                                  ; 02F0 _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 02F3 _ 0F B6. 00
        shr     al, 2                                   ; 02F6 _ C0. E8, 02
        movzx   eax, al                                 ; 02F9 _ 0F B6. C0
        sub     esp, 8                                  ; 02FC _ 83. EC, 08
        push    eax                                     ; 02FF _ 50
        push    969                                     ; 0300 _ 68, 000003C9
        call    io_out8                                 ; 0305 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 030A _ 83. C4, 10
        add     dword [ebp+10H], 3                      ; 030D _ 83. 45, 10, 03
        add     dword [ebp-10H], 1                      ; 0311 _ 83. 45, F0, 01
?_003:  mov     eax, dword [ebp-10H]                    ; 0315 _ 8B. 45, F0
        cmp     eax, dword [ebp+0CH]                    ; 0318 _ 3B. 45, 0C
        jle     ?_002                                   ; 031B _ 7E, 93
        sub     esp, 12                                 ; 031D _ 83. EC, 0C
        push    dword [ebp-0CH]                         ; 0320 _ FF. 75, F4
        call    io_store_eflags                         ; 0323 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0328 _ 83. C4, 10
        nop                                             ; 032B _ 90
        leave                                           ; 032C _ C9
        ret                                             ; 032D _ C3
; set_palette End of function

boxfill8:; Function begin
        push    ebp                                     ; 032E _ 55
        mov     ebp, esp                                ; 032F _ 89. E5
        sub     esp, 20                                 ; 0331 _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 0334 _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 0337 _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 033A _ 8B. 45, 18
        mov     dword [ebp-4H], eax                     ; 033D _ 89. 45, FC
        jmp     ?_007                                   ; 0340 _ EB, 33

?_004:  mov     eax, dword [ebp+14H]                    ; 0342 _ 8B. 45, 14
        mov     dword [ebp-8H], eax                     ; 0345 _ 89. 45, F8
        jmp     ?_006                                   ; 0348 _ EB, 1F

?_005:  mov     eax, dword [ebp-4H]                     ; 034A _ 8B. 45, FC
        imul    eax, dword [ebp+0CH]                    ; 034D _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0351 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0353 _ 8B. 45, F8
        add     eax, edx                                ; 0356 _ 01. D0
        mov     edx, eax                                ; 0358 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 035A _ 8B. 45, 08
        add     edx, eax                                ; 035D _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 035F _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0363 _ 88. 02
        add     dword [ebp-8H], 1                       ; 0365 _ 83. 45, F8, 01
?_006:  mov     eax, dword [ebp-8H]                     ; 0369 _ 8B. 45, F8
        cmp     eax, dword [ebp+1CH]                    ; 036C _ 3B. 45, 1C
        jle     ?_005                                   ; 036F _ 7E, D9
        add     dword [ebp-4H], 1                       ; 0371 _ 83. 45, FC, 01
?_007:  mov     eax, dword [ebp-4H]                     ; 0375 _ 8B. 45, FC
        cmp     eax, dword [ebp+20H]                    ; 0378 _ 3B. 45, 20
        jle     ?_004                                   ; 037B _ 7E, C5
        nop                                             ; 037D _ 90
        leave                                           ; 037E _ C9
        ret                                             ; 037F _ C3
; boxfill8 End of function

memman_init:; Function begin
        push    ebp                                     ; 0380 _ 55
        mov     ebp, esp                                ; 0381 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 0383 _ 8B. 45, 08
        mov     dword [eax], 0                          ; 0386 _ C7. 00, 00000000
        mov     eax, dword [ebp+8H]                     ; 038C _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 038F _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 0396 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 0399 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 03A0 _ 8B. 45, 08
        mov     dword [eax+0CH], 0                      ; 03A3 _ C7. 40, 0C, 00000000
        nop                                             ; 03AA _ 90
        pop     ebp                                     ; 03AB _ 5D
        ret                                             ; 03AC _ C3
; memman_init End of function

memman_total:; Function begin
        push    ebp                                     ; 03AD _ 55
        mov     ebp, esp                                ; 03AE _ 89. E5
        sub     esp, 16                                 ; 03B0 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 03B3 _ C7. 45, FC, 00000000
        mov     dword [ebp-8H], 0                       ; 03BA _ C7. 45, F8, 00000000
        jmp     ?_009                                   ; 03C1 _ EB, 14

?_008:  mov     eax, dword [ebp+8H]                     ; 03C3 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 03C6 _ 8B. 55, F8
        add     edx, 2                                  ; 03C9 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 03CC _ 8B. 44 D0, 04
        add     dword [ebp-4H], eax                     ; 03D0 _ 01. 45, FC
        add     dword [ebp-8H], 1                       ; 03D3 _ 83. 45, F8, 01
?_009:  mov     eax, dword [ebp+8H]                     ; 03D7 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 03DA _ 8B. 00
        cmp     dword [ebp-8H], eax                     ; 03DC _ 39. 45, F8
        jc      ?_008                                   ; 03DF _ 72, E2
        mov     eax, dword [ebp-4H]                     ; 03E1 _ 8B. 45, FC
        leave                                           ; 03E4 _ C9
        ret                                             ; 03E5 _ C3
; memman_total End of function

memman_alloc:; Function begin
        push    ebp                                     ; 03E6 _ 55
        mov     ebp, esp                                ; 03E7 _ 89. E5
        sub     esp, 16                                 ; 03E9 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 03EC _ C7. 45, F8, 00000000
        jmp     ?_013                                   ; 03F3 _ EB, 67

?_010:  mov     eax, dword [ebp+8H]                     ; 03F5 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 03F8 _ 8B. 55, F8
        add     edx, 2                                  ; 03FB _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 03FE _ 8B. 44 D0, 04
        cmp     dword [ebp+0CH], eax                    ; 0402 _ 39. 45, 0C
        ja      ?_012                                   ; 0405 _ 77, 51
        mov     eax, dword [ebp+8H]                     ; 0407 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 040A _ 8B. 55, F8
        add     edx, 2                                  ; 040D _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 0410 _ 8B. 04 D0
        mov     dword [ebp-4H], eax                     ; 0413 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0416 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 0419 _ 8B. 55, F8
        add     edx, 2                                  ; 041C _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 041F _ 8B. 44 D0, 04
        sub     eax, dword [ebp+0CH]                    ; 0423 _ 2B. 45, 0C
        mov     edx, eax                                ; 0426 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0428 _ 8B. 45, 08
        mov     ecx, dword [ebp-8H]                     ; 042B _ 8B. 4D, F8
        add     ecx, 2                                  ; 042E _ 83. C1, 02
        mov     dword [eax+ecx*8+4H], edx               ; 0431 _ 89. 54 C8, 04
        mov     eax, dword [ebp+8H]                     ; 0435 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 0438 _ 8B. 55, F8
        add     edx, 2                                  ; 043B _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 043E _ 8B. 44 D0, 04
        test    eax, eax                                ; 0442 _ 85. C0
        jnz     ?_011                                   ; 0444 _ 75, 0D
        mov     eax, dword [ebp+8H]                     ; 0446 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 0449 _ 8B. 00
        lea     edx, [eax-1H]                           ; 044B _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 044E _ 8B. 45, 08
        mov     dword [eax], edx                        ; 0451 _ 89. 10
?_011:  mov     eax, dword [ebp-4H]                     ; 0453 _ 8B. 45, FC
        jmp     ?_014                                   ; 0456 _ EB, 13

?_012:  add     dword [ebp-8H], 1                       ; 0458 _ 83. 45, F8, 01
?_013:  mov     eax, dword [ebp+8H]                     ; 045C _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 045F _ 8B. 00
        cmp     dword [ebp-8H], eax                     ; 0461 _ 39. 45, F8
        jc      ?_010                                   ; 0464 _ 72, 8F
        mov     eax, 0                                  ; 0466 _ B8, 00000000
?_014:  leave                                           ; 046B _ C9
        ret                                             ; 046C _ C3
; memman_alloc End of function

memman_free:; Function begin
        push    ebp                                     ; 046D _ 55
        mov     ebp, esp                                ; 046E _ 89. E5
        push    ebx                                     ; 0470 _ 53
        sub     esp, 16                                 ; 0471 _ 83. EC, 10
        mov     dword [ebp-0CH], 0                      ; 0474 _ C7. 45, F4, 00000000
        jmp     ?_016                                   ; 047B _ EB, 15

?_015:  mov     eax, dword [ebp+8H]                     ; 047D _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 0480 _ 8B. 55, F4
        add     edx, 2                                  ; 0483 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 0486 _ 8B. 04 D0
        cmp     dword [ebp+0CH], eax                    ; 0489 _ 39. 45, 0C
        jc      ?_017                                   ; 048C _ 72, 10
        add     dword [ebp-0CH], 1                      ; 048E _ 83. 45, F4, 01
?_016:  mov     eax, dword [ebp+8H]                     ; 0492 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 0495 _ 8B. 00
        cmp     dword [ebp-0CH], eax                    ; 0497 _ 39. 45, F4
        jl      ?_015                                   ; 049A _ 7C, E1
        jmp     ?_018                                   ; 049C _ EB, 01

?_017:  nop                                             ; 049E _ 90
?_018:  cmp     dword [ebp-0CH], 0                      ; 049F _ 83. 7D, F4, 00
        jle     ?_020                                   ; 04A3 _ 0F 8E, 000000B9
        mov     eax, dword [ebp-0CH]                    ; 04A9 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 04AC _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 04AF _ 8B. 45, 08
        add     edx, 2                                  ; 04B2 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 04B5 _ 8B. 14 D0
        mov     eax, dword [ebp-0CH]                    ; 04B8 _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 04BB _ 8D. 48, FF
        mov     eax, dword [ebp+8H]                     ; 04BE _ 8B. 45, 08
        add     ecx, 2                                  ; 04C1 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 04C4 _ 8B. 44 C8, 04
        add     eax, edx                                ; 04C8 _ 01. D0
        cmp     dword [ebp+0CH], eax                    ; 04CA _ 39. 45, 0C
        jne     ?_020                                   ; 04CD _ 0F 85, 0000008F
        mov     eax, dword [ebp-0CH]                    ; 04D3 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 04D6 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 04D9 _ 8B. 45, 08
        add     edx, 2                                  ; 04DC _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 04DF _ 8B. 54 D0, 04
        mov     eax, dword [ebp-0CH]                    ; 04E3 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 04E6 _ 8D. 58, FF
        mov     eax, dword [ebp+10H]                    ; 04E9 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 04EC _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 04EF _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 04F2 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 04F5 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 04F9 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 04FC _ 8B. 00
        test    eax, eax                                ; 04FE _ 85. C0
        jle     ?_019                                   ; 0500 _ 7E, 56
        mov     edx, dword [ebp+0CH]                    ; 0502 _ 8B. 55, 0C
        mov     eax, dword [ebp+10H]                    ; 0505 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 0508 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 050B _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 050E _ 8B. 55, F4
        add     edx, 2                                  ; 0511 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 0514 _ 8B. 04 D0
        cmp     ecx, eax                                ; 0517 _ 39. C1
        jnz     ?_019                                   ; 0519 _ 75, 3D
        mov     eax, dword [ebp-0CH]                    ; 051B _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 051E _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 0521 _ 8B. 45, 08
        add     edx, 2                                  ; 0524 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 0527 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+8H]                     ; 052B _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 052E _ 8B. 4D, F4
        add     ecx, 2                                  ; 0531 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 0534 _ 8B. 44 C8, 04
        mov     ecx, dword [ebp-0CH]                    ; 0538 _ 8B. 4D, F4
        lea     ebx, [ecx-1H]                           ; 053B _ 8D. 59, FF
        lea     ecx, [edx+eax]                          ; 053E _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 0541 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 0544 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 0547 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 054B _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 054E _ 8B. 00
        lea     edx, [eax-1H]                           ; 0550 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 0553 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 0556 _ 89. 10
?_019:  mov     eax, 0                                  ; 0558 _ B8, 00000000
        jmp     ?_026                                   ; 055D _ E9, 0000011B

?_020:  mov     eax, dword [ebp+8H]                     ; 0562 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 0565 _ 8B. 00
        test    eax, eax                                ; 0567 _ 85. C0
        jle     ?_021                                   ; 0569 _ 7E, 52
        mov     edx, dword [ebp+0CH]                    ; 056B _ 8B. 55, 0C
        mov     eax, dword [ebp+10H]                    ; 056E _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 0571 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 0574 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 0577 _ 8B. 55, F4
        add     edx, 2                                  ; 057A _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 057D _ 8B. 04 D0
        cmp     ecx, eax                                ; 0580 _ 39. C1
        jnz     ?_021                                   ; 0582 _ 75, 39
        mov     eax, dword [ebp+8H]                     ; 0584 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 0587 _ 8B. 55, F4
        add     edx, 2                                  ; 058A _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 058D _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 0591 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 0594 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 0597 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 059A _ 8B. 55, F4
        add     edx, 2                                  ; 059D _ 83. C2, 02
        mov     dword [eax+edx*8+4H], ecx               ; 05A0 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 05A4 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 05A7 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 05AA _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 05AD _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 05B0 _ 89. 14 C8
        mov     eax, 0                                  ; 05B3 _ B8, 00000000
        jmp     ?_026                                   ; 05B8 _ E9, 000000C0

?_021:  mov     eax, dword [ebp+8H]                     ; 05BD _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 05C0 _ 8B. 00
        cmp     eax, 4095                               ; 05C2 _ 3D, 00000FFF
        jg      ?_025                                   ; 05C7 _ 0F 8F, 00000087
        mov     eax, dword [ebp+8H]                     ; 05CD _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 05D0 _ 8B. 00
        lea     edx, [eax+1H]                           ; 05D2 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 05D5 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 05D8 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 05DA _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 05DD _ 8B. 00
        mov     dword [ebp-8H], eax                     ; 05DF _ 89. 45, F8
        jmp     ?_023                                   ; 05E2 _ EB, 28

?_022:  mov     eax, dword [ebp-8H]                     ; 05E4 _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 05E7 _ 8D. 50, FF
        mov     ecx, dword [ebp+8H]                     ; 05EA _ 8B. 4D, 08
        mov     eax, dword [ebp-8H]                     ; 05ED _ 8B. 45, F8
        lea     ebx, [eax+2H]                           ; 05F0 _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 05F3 _ 8B. 45, 08
        add     edx, 2                                  ; 05F6 _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 05F9 _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 05FC _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 05FE _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 0601 _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 0604 _ 89. 54 D9, 04
        sub     dword [ebp-8H], 1                       ; 0608 _ 83. 6D, F8, 01
?_023:  mov     eax, dword [ebp-8H]                     ; 060C _ 8B. 45, F8
        cmp     eax, dword [ebp-0CH]                    ; 060F _ 3B. 45, F4
        jg      ?_022                                   ; 0612 _ 7F, D0
        mov     eax, dword [ebp+8H]                     ; 0614 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 0617 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 061A _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 061D _ 8B. 00
        cmp     edx, eax                                ; 061F _ 39. C2
        jge     ?_024                                   ; 0621 _ 7D, 0B
        mov     eax, dword [ebp+8H]                     ; 0623 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 0626 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 0628 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 062B _ 89. 50, 04
?_024:  mov     eax, dword [ebp+8H]                     ; 062E _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 0631 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 0634 _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 0637 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 063A _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 063D _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 0640 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 0643 _ 8D. 4A, 02
        mov     edx, dword [ebp+10H]                    ; 0646 _ 8B. 55, 10
        mov     dword [eax+ecx*8+4H], edx               ; 0649 _ 89. 54 C8, 04
        mov     eax, 0                                  ; 064D _ B8, 00000000
        jmp     ?_026                                   ; 0652 _ EB, 29

?_025:  mov     eax, dword [ebp+8H]                     ; 0654 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0657 _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 065A _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 065D _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 0660 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 0663 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0666 _ 8B. 40, 08
        mov     edx, eax                                ; 0669 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 066B _ 8B. 45, 10
        add     eax, edx                                ; 066E _ 01. D0
        mov     edx, eax                                ; 0670 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0672 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0675 _ 89. 50, 08
        mov     eax, 4294967295                         ; 0678 _ B8, FFFFFFFF
?_026:  add     esp, 16                                 ; 067D _ 83. C4, 10
        pop     ebx                                     ; 0680 _ 5B
        pop     ebp                                     ; 0681 _ 5D
        ret                                             ; 0682 _ C3
; memman_free End of function

memman_alloc_4k:; Function begin
        push    ebp                                     ; 0683 _ 55
        mov     ebp, esp                                ; 0684 _ 89. E5
        sub     esp, 16                                 ; 0686 _ 83. EC, 10
        mov     eax, dword [ebp+0CH]                    ; 0689 _ 8B. 45, 0C
        add     eax, 4095                               ; 068C _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 0691 _ 25, FFFFF000
        mov     dword [ebp+0CH], eax                    ; 0696 _ 89. 45, 0C
        push    dword [ebp+0CH]                         ; 0699 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 069C _ FF. 75, 08
        call    memman_alloc                            ; 069F _ E8, FFFFFFFC(rel)
        add     esp, 8                                  ; 06A4 _ 83. C4, 08
        mov     dword [ebp-4H], eax                     ; 06A7 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 06AA _ 8B. 45, FC
        leave                                           ; 06AD _ C9
        ret                                             ; 06AE _ C3
; memman_alloc_4k End of function

shtctl_init:; Function begin
        push    ebp                                     ; 06AF _ 55
        mov     ebp, esp                                ; 06B0 _ 89. E5
        sub     esp, 24                                 ; 06B2 _ 83. EC, 18
        sub     esp, 8                                  ; 06B5 _ 83. EC, 08
        push    9232                                    ; 06B8 _ 68, 00002410
        push    dword [ebp+8H]                          ; 06BD _ FF. 75, 08
        call    memman_alloc_4k                         ; 06C0 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 06C5 _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 06C8 _ 89. 45, F4
        cmp     dword [ebp-0CH], 0                      ; 06CB _ 83. 7D, F4, 00
        jnz     ?_027                                   ; 06CF _ 75, 07
        mov     eax, 0                                  ; 06D1 _ B8, 00000000
        jmp     ?_030                                   ; 06D6 _ EB, 54

?_027:  mov     eax, dword [ebp-0CH]                    ; 06D8 _ 8B. 45, F4
        mov     edx, dword [ebp+0CH]                    ; 06DB _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 06DE _ 89. 10
        mov     eax, dword [ebp-0CH]                    ; 06E0 _ 8B. 45, F4
        mov     edx, dword [ebp+10H]                    ; 06E3 _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 06E6 _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 06E9 _ 8B. 45, F4
        mov     edx, dword [ebp+14H]                    ; 06EC _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 06EF _ 89. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 06F2 _ 8B. 45, F4
        mov     dword [eax+0CH], -1                     ; 06F5 _ C7. 40, 0C, FFFFFFFF
        mov     dword [ebp-10H], 0                      ; 06FC _ C7. 45, F0, 00000000
        jmp     ?_029                                   ; 0703 _ EB, 1B

?_028:  mov     eax, dword [ebp-0CH]                    ; 0705 _ 8B. 45, F4
        mov     edx, dword [ebp-10H]                    ; 0708 _ 8B. 55, F0
        add     edx, 33                                 ; 070B _ 83. C2, 21
        shl     edx, 5                                  ; 070E _ C1. E2, 05
        add     eax, edx                                ; 0711 _ 01. D0
        add     eax, 12                                 ; 0713 _ 83. C0, 0C
        mov     dword [eax], 0                          ; 0716 _ C7. 00, 00000000
        add     dword [ebp-10H], 1                      ; 071C _ 83. 45, F0, 01
?_029:  cmp     dword [ebp-10H], 255                    ; 0720 _ 81. 7D, F0, 000000FF
        jle     ?_028                                   ; 0727 _ 7E, DC
        mov     eax, dword [ebp-0CH]                    ; 0729 _ 8B. 45, F4
?_030:  leave                                           ; 072C _ C9
        ret                                             ; 072D _ C3
; shtctl_init End of function

sheet_alloc:; Function begin
        push    ebp                                     ; 072E _ 55
        mov     ebp, esp                                ; 072F _ 89. E5
        sub     esp, 16                                 ; 0731 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 0734 _ C7. 45, F8, 00000000
        jmp     ?_033                                   ; 073B _ EB, 57

?_031:  mov     eax, dword [ebp+8H]                     ; 073D _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 0740 _ 8B. 55, F8
        add     edx, 33                                 ; 0743 _ 83. C2, 21
        shl     edx, 5                                  ; 0746 _ C1. E2, 05
        add     eax, edx                                ; 0749 _ 01. D0
        add     eax, 12                                 ; 074B _ 83. C0, 0C
        mov     eax, dword [eax]                        ; 074E _ 8B. 00
        test    eax, eax                                ; 0750 _ 85. C0
        jnz     ?_032                                   ; 0752 _ 75, 3C
        mov     eax, dword [ebp-8H]                     ; 0754 _ 8B. 45, F8
        shl     eax, 5                                  ; 0757 _ C1. E0, 05
        lea     edx, [eax+410H]                         ; 075A _ 8D. 90, 00000410
        mov     eax, dword [ebp+8H]                     ; 0760 _ 8B. 45, 08
        add     eax, edx                                ; 0763 _ 01. D0
        mov     dword [ebp-4H], eax                     ; 0765 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0768 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 076B _ 8B. 55, F8
        lea     ecx, [edx+4H]                           ; 076E _ 8D. 4A, 04
        mov     edx, dword [ebp-4H]                     ; 0771 _ 8B. 55, FC
        mov     dword [eax+ecx*4], edx                  ; 0774 _ 89. 14 88
        mov     eax, dword [ebp-4H]                     ; 0777 _ 8B. 45, FC
        mov     dword [eax+1CH], 1                      ; 077A _ C7. 40, 1C, 00000001
        mov     eax, dword [ebp-4H]                     ; 0781 _ 8B. 45, FC
        mov     dword [eax+18H], -1                     ; 0784 _ C7. 40, 18, FFFFFFFF
        mov     eax, dword [ebp-4H]                     ; 078B _ 8B. 45, FC
        jmp     ?_034                                   ; 078E _ EB, 12

?_032:  add     dword [ebp-8H], 1                       ; 0790 _ 83. 45, F8, 01
?_033:  cmp     dword [ebp-8H], 255                     ; 0794 _ 81. 7D, F8, 000000FF
        jle     ?_031                                   ; 079B _ 7E, A0
        mov     eax, 0                                  ; 079D _ B8, 00000000
?_034:  leave                                           ; 07A2 _ C9
        ret                                             ; 07A3 _ C3
; sheet_alloc End of function

sheet_setbuf:; Function begin
        push    ebp                                     ; 07A4 _ 55
        mov     ebp, esp                                ; 07A5 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 07A7 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 07AA _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 07AD _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 07AF _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 07B2 _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 07B5 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 07B8 _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 07BB _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 07BE _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 07C1 _ 8B. 45, 08
        mov     edx, dword [ebp+18H]                    ; 07C4 _ 8B. 55, 18
        mov     dword [eax+14H], edx                    ; 07C7 _ 89. 50, 14
        nop                                             ; 07CA _ 90
        pop     ebp                                     ; 07CB _ 5D
        ret                                             ; 07CC _ C3
; sheet_setbuf End of function

sheet_updown:; Function begin
        push    ebp                                     ; 07CD _ 55
        mov     ebp, esp                                ; 07CE _ 89. E5
        sub     esp, 24                                 ; 07D0 _ 83. EC, 18
        mov     eax, dword [ebp+0CH]                    ; 07D3 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 07D6 _ 8B. 40, 18
        mov     dword [ebp-0CH], eax                    ; 07D9 _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 07DC _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 07DF _ 8B. 40, 0C
        add     eax, 1                                  ; 07E2 _ 83. C0, 01
        cmp     dword [ebp+10H], eax                    ; 07E5 _ 39. 45, 10
        jle     ?_035                                   ; 07E8 _ 7E, 0C
        mov     eax, dword [ebp+8H]                     ; 07EA _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 07ED _ 8B. 40, 0C
        add     eax, 1                                  ; 07F0 _ 83. C0, 01
        mov     dword [ebp+10H], eax                    ; 07F3 _ 89. 45, 10
?_035:  cmp     dword [ebp+10H], -1                     ; 07F6 _ 83. 7D, 10, FF
        jge     ?_036                                   ; 07FA _ 7D, 07
        mov     dword [ebp+10H], -1                     ; 07FC _ C7. 45, 10, FFFFFFFF
?_036:  mov     eax, dword [ebp+0CH]                    ; 0803 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 0806 _ 8B. 55, 10
        mov     dword [eax+18H], edx                    ; 0809 _ 89. 50, 18
        mov     eax, dword [ebp-0CH]                    ; 080C _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 080F _ 3B. 45, 10
        jle     ?_044                                   ; 0812 _ 0F 8E, 000000C9
        cmp     dword [ebp+10H], 0                      ; 0818 _ 83. 7D, 10, 00
        js      ?_039                                   ; 081C _ 78, 52
        mov     eax, dword [ebp-0CH]                    ; 081E _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 0821 _ 89. 45, F0
        jmp     ?_038                                   ; 0824 _ EB, 31

?_037:  mov     eax, dword [ebp-10H]                    ; 0826 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 0829 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 082C _ 8B. 45, 08
        add     edx, 4                                  ; 082F _ 83. C2, 04
        mov     edx, dword [eax+edx*4]                  ; 0832 _ 8B. 14 90
        mov     eax, dword [ebp+8H]                     ; 0835 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 0838 _ 8B. 4D, F0
        add     ecx, 4                                  ; 083B _ 83. C1, 04
        mov     dword [eax+ecx*4], edx                  ; 083E _ 89. 14 88
        mov     eax, dword [ebp+8H]                     ; 0841 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 0844 _ 8B. 55, F0
        add     edx, 4                                  ; 0847 _ 83. C2, 04
        mov     eax, dword [eax+edx*4]                  ; 084A _ 8B. 04 90
        mov     edx, dword [ebp-10H]                    ; 084D _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 0850 _ 89. 50, 18
        sub     dword [ebp-10H], 1                      ; 0853 _ 83. 6D, F0, 01
?_038:  mov     eax, dword [ebp-10H]                    ; 0857 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 085A _ 3B. 45, 10
        jg      ?_037                                   ; 085D _ 7F, C7
        mov     eax, dword [ebp+8H]                     ; 085F _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 0862 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 0865 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 0868 _ 8B. 55, 0C
        mov     dword [eax+ecx*4], edx                  ; 086B _ 89. 14 88
        jmp     ?_043                                   ; 086E _ EB, 5E

?_039:  mov     eax, dword [ebp+8H]                     ; 0870 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0873 _ 8B. 40, 0C
        cmp     dword [ebp-0CH], eax                    ; 0876 _ 39. 45, F4
        jge     ?_042                                   ; 0879 _ 7D, 44
        mov     eax, dword [ebp-0CH]                    ; 087B _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 087E _ 89. 45, F0
        jmp     ?_041                                   ; 0881 _ EB, 31

?_040:  mov     eax, dword [ebp-10H]                    ; 0883 _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 0886 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0889 _ 8B. 45, 08
        add     edx, 4                                  ; 088C _ 83. C2, 04
        mov     edx, dword [eax+edx*4]                  ; 088F _ 8B. 14 90
        mov     eax, dword [ebp+8H]                     ; 0892 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 0895 _ 8B. 4D, F0
        add     ecx, 4                                  ; 0898 _ 83. C1, 04
        mov     dword [eax+ecx*4], edx                  ; 089B _ 89. 14 88
        mov     eax, dword [ebp+8H]                     ; 089E _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 08A1 _ 8B. 55, F0
        add     edx, 4                                  ; 08A4 _ 83. C2, 04
        mov     eax, dword [eax+edx*4]                  ; 08A7 _ 8B. 04 90
        mov     edx, dword [ebp-10H]                    ; 08AA _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 08AD _ 89. 50, 18
        add     dword [ebp-10H], 1                      ; 08B0 _ 83. 45, F0, 01
?_041:  mov     eax, dword [ebp+8H]                     ; 08B4 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 08B7 _ 8B. 40, 0C
        cmp     dword [ebp-10H], eax                    ; 08BA _ 39. 45, F0
        jl      ?_040                                   ; 08BD _ 7C, C4
?_042:  mov     eax, dword [ebp+8H]                     ; 08BF _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 08C2 _ 8B. 40, 0C
        lea     edx, [eax-1H]                           ; 08C5 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 08C8 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 08CB _ 89. 50, 0C
?_043:  sub     esp, 12                                 ; 08CE _ 83. EC, 0C
        push    dword [ebp+8H]                          ; 08D1 _ FF. 75, 08
        call    sheet_refresh                           ; 08D4 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 08D9 _ 83. C4, 10
        jmp     ?_051                                   ; 08DC _ E9, 000000DA

?_044:  mov     eax, dword [ebp-0CH]                    ; 08E1 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 08E4 _ 3B. 45, 10
        jge     ?_051                                   ; 08E7 _ 0F 8D, 000000CE
        cmp     dword [ebp-0CH], 0                      ; 08ED _ 83. 7D, F4, 00
        js      ?_047                                   ; 08F1 _ 78, 52
        mov     eax, dword [ebp-0CH]                    ; 08F3 _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 08F6 _ 89. 45, F0
        jmp     ?_046                                   ; 08F9 _ EB, 31

?_045:  mov     eax, dword [ebp-10H]                    ; 08FB _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 08FE _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0901 _ 8B. 45, 08
        add     edx, 4                                  ; 0904 _ 83. C2, 04
        mov     edx, dword [eax+edx*4]                  ; 0907 _ 8B. 14 90
        mov     eax, dword [ebp+8H]                     ; 090A _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 090D _ 8B. 4D, F0
        add     ecx, 4                                  ; 0910 _ 83. C1, 04
        mov     dword [eax+ecx*4], edx                  ; 0913 _ 89. 14 88
        mov     eax, dword [ebp+8H]                     ; 0916 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 0919 _ 8B. 55, F0
        add     edx, 4                                  ; 091C _ 83. C2, 04
        mov     eax, dword [eax+edx*4]                  ; 091F _ 8B. 04 90
        mov     edx, dword [ebp-10H]                    ; 0922 _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 0925 _ 89. 50, 18
        add     dword [ebp-10H], 1                      ; 0928 _ 83. 45, F0, 01
?_046:  mov     eax, dword [ebp-10H]                    ; 092C _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 092F _ 3B. 45, 10
        jl      ?_045                                   ; 0932 _ 7C, C7
        mov     eax, dword [ebp+8H]                     ; 0934 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 0937 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 093A _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 093D _ 8B. 55, 0C
        mov     dword [eax+ecx*4], edx                  ; 0940 _ 89. 14 88
        jmp     ?_050                                   ; 0943 _ EB, 68

?_047:  mov     eax, dword [ebp+8H]                     ; 0945 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0948 _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 094B _ 89. 45, F0
        jmp     ?_049                                   ; 094E _ EB, 37

?_048:  mov     eax, dword [ebp-10H]                    ; 0950 _ 8B. 45, F0
        lea     ecx, [eax+1H]                           ; 0953 _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 0956 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 0959 _ 8B. 55, F0
        add     edx, 4                                  ; 095C _ 83. C2, 04
        mov     edx, dword [eax+edx*4]                  ; 095F _ 8B. 14 90
        mov     eax, dword [ebp+8H]                     ; 0962 _ 8B. 45, 08
        add     ecx, 4                                  ; 0965 _ 83. C1, 04
        mov     dword [eax+ecx*4], edx                  ; 0968 _ 89. 14 88
        mov     eax, dword [ebp-10H]                    ; 096B _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 096E _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0971 _ 8B. 45, 08
        add     edx, 4                                  ; 0974 _ 83. C2, 04
        mov     eax, dword [eax+edx*4]                  ; 0977 _ 8B. 04 90
        mov     edx, dword [ebp-10H]                    ; 097A _ 8B. 55, F0
        add     edx, 1                                  ; 097D _ 83. C2, 01
        mov     dword [eax+18H], edx                    ; 0980 _ 89. 50, 18
        sub     dword [ebp-10H], 1                      ; 0983 _ 83. 6D, F0, 01
?_049:  mov     eax, dword [ebp-10H]                    ; 0987 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 098A _ 3B. 45, 10
        jge     ?_048                                   ; 098D _ 7D, C1
        mov     eax, dword [ebp+8H]                     ; 098F _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 0992 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 0995 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 0998 _ 8B. 55, 0C
        mov     dword [eax+ecx*4], edx                  ; 099B _ 89. 14 88
        mov     eax, dword [ebp+8H]                     ; 099E _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 09A1 _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 09A4 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 09A7 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 09AA _ 89. 50, 0C
?_050:  sub     esp, 12                                 ; 09AD _ 83. EC, 0C
        push    dword [ebp+8H]                          ; 09B0 _ FF. 75, 08
        call    sheet_refresh                           ; 09B3 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 09B8 _ 83. C4, 10
?_051:  nop                                             ; 09BB _ 90
        leave                                           ; 09BC _ C9
        ret                                             ; 09BD _ C3
; sheet_updown End of function

sheet_refresh:; Function begin
        push    ebp                                     ; 09BE _ 55
        mov     ebp, esp                                ; 09BF _ 89. E5
        sub     esp, 48                                 ; 09C1 _ 83. EC, 30
        mov     eax, dword [ebp+8H]                     ; 09C4 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 09C7 _ 8B. 00
        mov     dword [ebp-14H], eax                    ; 09C9 _ 89. 45, EC
        mov     dword [ebp-20H], 0                      ; 09CC _ C7. 45, E0, 00000000
        jmp     ?_058                                   ; 09D3 _ E9, 000000A3

?_052:  mov     eax, dword [ebp+8H]                     ; 09D8 _ 8B. 45, 08
        mov     edx, dword [ebp-20H]                    ; 09DB _ 8B. 55, E0
        add     edx, 4                                  ; 09DE _ 83. C2, 04
        mov     eax, dword [eax+edx*4]                  ; 09E1 _ 8B. 04 90
        mov     dword [ebp-10H], eax                    ; 09E4 _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 09E7 _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 09EA _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 09EC _ 89. 45, F4
        mov     dword [ebp-18H], 0                      ; 09EF _ C7. 45, E8, 00000000
        jmp     ?_057                                   ; 09F6 _ EB, 74

?_053:  mov     eax, dword [ebp-10H]                    ; 09F8 _ 8B. 45, F0
        mov     edx, dword [eax+0CH]                    ; 09FB _ 8B. 50, 0C
        mov     eax, dword [ebp-1CH]                    ; 09FE _ 8B. 45, E4
        add     eax, edx                                ; 0A01 _ 01. D0
        mov     dword [ebp-8H], eax                     ; 0A03 _ 89. 45, F8
        mov     dword [ebp-1CH], 0                      ; 0A06 _ C7. 45, E4, 00000000
        jmp     ?_056                                   ; 0A0D _ EB, 4E

?_054:  mov     eax, dword [ebp-10H]                    ; 0A0F _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 0A12 _ 8B. 40, 04
        imul    eax, dword [ebp-18H]                    ; 0A15 _ 0F AF. 45, E8
        mov     edx, eax                                ; 0A19 _ 89. C2
        mov     eax, dword [ebp-1CH]                    ; 0A1B _ 8B. 45, E4
        add     eax, edx                                ; 0A1E _ 01. D0
        mov     edx, eax                                ; 0A20 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 0A22 _ 8B. 45, F4
        add     eax, edx                                ; 0A25 _ 01. D0
        movzx   eax, byte [eax]                         ; 0A27 _ 0F B6. 00
        mov     byte [ebp-21H], al                      ; 0A2A _ 88. 45, DF
        movzx   edx, byte [ebp-21H]                     ; 0A2D _ 0F B6. 55, DF
        mov     eax, dword [ebp-10H]                    ; 0A31 _ 8B. 45, F0
        mov     eax, dword [eax+14H]                    ; 0A34 _ 8B. 40, 14
        cmp     edx, eax                                ; 0A37 _ 39. C2
        jz      ?_055                                   ; 0A39 _ 74, 1E
        mov     eax, dword [ebp+8H]                     ; 0A3B _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0A3E _ 8B. 40, 04
        imul    eax, dword [ebp-4H]                     ; 0A41 _ 0F AF. 45, FC
        mov     edx, eax                                ; 0A45 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0A47 _ 8B. 45, F8
        add     eax, edx                                ; 0A4A _ 01. D0
        mov     edx, eax                                ; 0A4C _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 0A4E _ 8B. 45, EC
        add     edx, eax                                ; 0A51 _ 01. C2
        movzx   eax, byte [ebp-21H]                     ; 0A53 _ 0F B6. 45, DF
        mov     byte [edx], al                          ; 0A57 _ 88. 02
?_055:  add     dword [ebp-1CH], 1                      ; 0A59 _ 83. 45, E4, 01
?_056:  mov     eax, dword [ebp-10H]                    ; 0A5D _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 0A60 _ 8B. 40, 04
        cmp     dword [ebp-1CH], eax                    ; 0A63 _ 39. 45, E4
        jl      ?_054                                   ; 0A66 _ 7C, A7
        add     dword [ebp-18H], 1                      ; 0A68 _ 83. 45, E8, 01
?_057:  mov     eax, dword [ebp-10H]                    ; 0A6C _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 0A6F _ 8B. 40, 08
        cmp     dword [ebp-18H], eax                    ; 0A72 _ 39. 45, E8
        jl      ?_053                                   ; 0A75 _ 7C, 81
        add     dword [ebp-20H], 1                      ; 0A77 _ 83. 45, E0, 01
?_058:  mov     eax, dword [ebp+8H]                     ; 0A7B _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0A7E _ 8B. 40, 0C
        cmp     dword [ebp-20H], eax                    ; 0A81 _ 39. 45, E0
        jle     ?_052                                   ; 0A84 _ 0F 8E, FFFFFF4E
        mov     eax, 0                                  ; 0A8A _ B8, 00000000
        leave                                           ; 0A8F _ C9
        ret                                             ; 0A90 _ C3
; sheet_refresh End of function

sheet_slide:; Function begin
        push    ebp                                     ; 0A91 _ 55
        mov     ebp, esp                                ; 0A92 _ 89. E5
        mov     eax, dword [ebp+0CH]                    ; 0A94 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 0A97 _ 8B. 55, 10
        mov     dword [eax+0CH], edx                    ; 0A9A _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 0A9D _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 0AA0 _ 8B. 55, 14
        mov     dword [eax+10H], edx                    ; 0AA3 _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 0AA6 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 0AA9 _ 8B. 40, 18
        test    eax, eax                                ; 0AAC _ 85. C0
        js      ?_059                                   ; 0AAE _ 78, 0B
        push    dword [ebp+8H]                          ; 0AB0 _ FF. 75, 08
        call    sheet_refresh                           ; 0AB3 _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 0AB8 _ 83. C4, 04
?_059:  nop                                             ; 0ABB _ 90
        leave                                           ; 0ABC _ C9
        ret                                             ; 0ABD _ C3
; sheet_slide End of function


SECTION .eh_frame align=4 noexecute                     ; section number 2, const

        db 14H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0000 _ ........
        db 01H, 7AH, 52H, 00H, 01H, 7CH, 08H, 01H       ; 0008 _ .zR..|..
        db 1BH, 0CH, 04H, 04H, 88H, 01H, 00H, 00H       ; 0010 _ ........
        db 18H, 00H, 00H, 00H, 1CH, 00H, 00H, 00H       ; 0018 _ ........
        dd CMain-$-20H                                  ; 0020 _ 00000000 (rel)
        dd 00000265H, 080E4100H                         ; 0024 _ 613 135151872 
        dd 0D420285H, 03834405H                         ; 002C _ 222429829 58934277 
        dd 0000001CH, 00000038H                         ; 0034 _ 28 56 
        dd CMain-$+229H                                 ; 003C _ 00000265 (rel)
        dd 0000001DH, 080E4100H                         ; 0040 _ 29 135151872 
        dd 0D420285H, 0CC55905H                         ; 0048 _ 222429829 214259973 
        dd 00000404H, 0000001CH                         ; 0050 _ 1028 28 
        dd 00000058H                                    ; 0058 _ 88 
        dd CMain-$+226H                                 ; 005C _ 00000282 (rel)
        dd 000000ACH, 080E4100H                         ; 0060 _ 172 135151872 
        dd 0D420285H, 0C5A80205H                        ; 0068 _ 222429829 -978845179 
        dd 0004040CH, 0000001CH                         ; 0070 _ 263180 28 
        dd 00000078H                                    ; 0078 _ 120 
        dd CMain-$+2B2H                                 ; 007C _ 0000032E (rel)
        dd 00000052H, 080E4100H                         ; 0080 _ 82 135151872 
        dd 0D420285H, 0C54E0205H                        ; 0088 _ 222429829 -984743419 
        dd 0004040CH, 00000014H                         ; 0090 _ 263180 20 
        dd 00000000H, 00527A01H                         ; 0098 _ 0 5405185 
        dd 01087C01H, 04040C1BH                         ; 00A0 _ 17333249 67374107 
        dd 00000188H, 0000001CH                         ; 00A8 _ 392 28 
        dd 0000001CH                                    ; 00B0 _ 28 
        dd CMain-$+2CCH                                 ; 00B4 _ 00000380 (rel)
        dd 0000002DH, 080E4100H                         ; 00B8 _ 45 135151872 
        dd 0D420285H, 0CC56905H                         ; 00C0 _ 222429829 214264069 
        dd 00000404H, 0000001CH                         ; 00C8 _ 1028 28 
        dd 0000003CH                                    ; 00D0 _ 60 
        dd CMain-$+2D9H                                 ; 00D4 _ 000003AD (rel)
        dd 00000039H, 080E4100H                         ; 00D8 _ 57 135151872 
        dd 0D420285H, 0CC57505H                         ; 00E0 _ 222429829 214267141 
        dd 00000404H, 0000001CH                         ; 00E8 _ 1028 28 
        dd 0000005CH                                    ; 00F0 _ 92 
        dd CMain-$+2F2H                                 ; 00F4 _ 000003E6 (rel)
        dd 00000087H, 080E4100H                         ; 00F8 _ 135 135151872 
        dd 0D420285H, 0C5830205H                        ; 0100 _ 222429829 -981270011 
        dd 0004040CH, 00000024H                         ; 0108 _ 263180 36 
        dd 0000007CH                                    ; 0110 _ 124 
        dd CMain-$+359H                                 ; 0114 _ 0000046D (rel)
        dd 00000216H, 080E4100H                         ; 0118 _ 534 135151872 
        dd 0D420285H, 03834405H                         ; 0120 _ 222429829 58934277 
        dd 0C3020D03H, 040CC541H                        ; 0128 _ -1023275773 67945793 
        dd 00000004H, 0000001CH                         ; 0130 _ 4 28 
        dd 000000A4H                                    ; 0138 _ 164 
        dd CMain-$+547H                                 ; 013C _ 00000683 (rel)
        dd 0000002CH, 080E4100H                         ; 0140 _ 44 135151872 
        dd 0D420285H, 0CC56805H                         ; 0148 _ 222429829 214263813 
        dd 00000404H, 00000014H                         ; 0150 _ 1028 20 
        dd 00000000H, 00527A01H                         ; 0158 _ 0 5405185 
        dd 01087C01H, 04040C1BH                         ; 0160 _ 17333249 67374107 
        dd 00000188H, 0000001CH                         ; 0168 _ 392 28 
        dd 0000001CH                                    ; 0170 _ 28 
        dd CMain-$+53BH                                 ; 0174 _ 000006AF (rel)
        dd 0000007FH, 080E4100H                         ; 0178 _ 127 135151872 
        dd 0D420285H, 0C57B0205H                        ; 0180 _ 222429829 -981794299 
        dd 0004040CH, 0000001CH                         ; 0188 _ 263180 28 
        dd 0000003CH                                    ; 0190 _ 60 
        dd CMain-$+59AH                                 ; 0194 _ 0000072E (rel)
        dd 00000076H, 080E4100H                         ; 0198 _ 118 135151872 
        dd 0D420285H, 0C5720205H                        ; 01A0 _ 222429829 -982384123 
        dd 0004040CH, 0000001CH                         ; 01A8 _ 263180 28 
        dd 0000005CH                                    ; 01B0 _ 92 
        dd CMain-$+5F0H                                 ; 01B4 _ 000007A4 (rel)
        dd 00000029H, 080E4100H                         ; 01B8 _ 41 135151872 
        dd 0D420285H, 0CC56505H                         ; 01C0 _ 222429829 214263045 
        dd 00000404H, 0000001CH                         ; 01C8 _ 1028 28 
        dd 0000007CH                                    ; 01D0 _ 124 
        dd CMain-$+5F9H                                 ; 01D4 _ 000007CD (rel)
        dd 000001F1H, 080E4100H                         ; 01D8 _ 497 135151872 
        dd 0D420285H, 01ED0305H                         ; 01E0 _ 222429829 32310021 
        dd 04040CC5H, 0000001CH                         ; 01E8 _ 67374277 28 
        dd 0000009CH                                    ; 01F0 _ 156 
        dd CMain-$+7CAH                                 ; 01F4 _ 000009BE (rel)
        dd 000000D3H, 080E4100H                         ; 01F8 _ 211 135151872 
        dd 0D420285H, 0C5CF0205H                        ; 0200 _ 222429829 -976289275 
        dd 0004040CH, 0000001CH                         ; 0208 _ 263180 28 
        dd 000000BCH                                    ; 0210 _ 188 
        dd CMain-$+87DH                                 ; 0214 _ 00000A91 (rel)
        dd 0000002DH, 080E4100H                         ; 0218 _ 45 135151872 
        dd 0D420285H, 0CC56905H                         ; 0220 _ 222429829 214264069 
        dd 00000404H                                    ; 0228 _ 1028 


SECTION .data   align=32 noexecute                      ; section number 3, data

table_rgb.1447:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 00H, 0FFH     ; 0000 _ ........
        db 00H, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH   ; 0008 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0010 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0018 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 0020 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 0028 _ ........


SECTION .bss    align=1 noexecute                       ; section number 4, bss


