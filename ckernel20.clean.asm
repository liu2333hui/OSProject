
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
        mov     dword [ebp-28H], eax                    ; 001C _ 89. 45, D8
        movzx   eax, word [?_123]                       ; 001F _ 0F B7. 05, 00000004(d)
        cwde                                            ; 0026 _ 98
        mov     dword [xsize], eax                      ; 0027 _ A3, 00000200(d)
        movzx   eax, word [?_124]                       ; 002C _ 0F B7. 05, 00000006(d)
        cwde                                            ; 0033 _ 98
        mov     dword [ysize], eax                      ; 0034 _ A3, 00000204(d)
        mov     eax, dword [bootInfo]                   ; 0039 _ A1, 00000000(d)
        mov     dword [ebp-24H], eax                    ; 003E _ 89. 45, DC
        mov     dword [ebp-20H], 0                      ; 0041 _ C7. 45, E0, 00000000
        mov     dword [ebp-1CH], 0                      ; 0048 _ C7. 45, E4, 00000000
        sub     esp, 4                                  ; 004F _ 83. EC, 04
        push    mousebuf                                ; 0052 _ 68, 00000040(d)
        push    128                                     ; 0057 _ 68, 00000080
        push    mouseinfo                               ; 005C _ 68, 00000008(d)
        call    fifo8_init                              ; 0061 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0066 _ 83. C4, 10
        sub     esp, 4                                  ; 0069 _ 83. EC, 04
        push    keybuf                                  ; 006C _ 68, 000000C0(d)
        push    32                                      ; 0071 _ 6A, 20
        push    keyinfo                                 ; 0073 _ 68, 00000020(d)
        call    fifo8_init                              ; 0078 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 007D _ 83. C4, 10
        call    init_palette                            ; 0080 _ E8, FFFFFFFC(rel)
        call    init_keyboard                           ; 0085 _ E8, FFFFFFFC(rel)
        call    get_memory_block_count                  ; 008A _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 008F _ 89. 45, E8
        call    get_adr_buffer                          ; 0092 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 0097 _ 89. 45, EC
        mov     eax, dword [memman]                     ; 009A _ A1, 00000000(d)
        sub     esp, 12                                 ; 009F _ 83. EC, 0C
        push    eax                                     ; 00A2 _ 50
        call    memman_init                             ; 00A3 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00A8 _ 83. C4, 10
        mov     eax, dword [memman]                     ; 00AB _ A1, 00000000(d)
        sub     esp, 4                                  ; 00B0 _ 83. EC, 04
        push    534609920                               ; 00B3 _ 68, 1FDD8000
        push    1081344                                 ; 00B8 _ 68, 00108000
        push    eax                                     ; 00BD _ 50
        call    memman_free                             ; 00BE _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00C3 _ 83. C4, 10
        mov     ecx, dword [ysize]                      ; 00C6 _ 8B. 0D, 00000204(d)
        mov     edx, dword [xsize]                      ; 00CC _ 8B. 15, 00000200(d)
        mov     eax, dword [memman]                     ; 00D2 _ A1, 00000000(d)
        push    ecx                                     ; 00D7 _ 51
        push    edx                                     ; 00D8 _ 52
        push    dword [ebp-28H]                         ; 00D9 _ FF. 75, D8
        push    eax                                     ; 00DC _ 50
        call    shtctl_init                             ; 00DD _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00E2 _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 00E5 _ 89. 45, F0
        sub     esp, 12                                 ; 00E8 _ 83. EC, 0C
        push    dword [ebp-10H]                         ; 00EB _ FF. 75, F0
        call    sheet_alloc                             ; 00EE _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00F3 _ 83. C4, 10
        mov     dword [ebp-20H], eax                    ; 00F6 _ 89. 45, E0
        sub     esp, 12                                 ; 00F9 _ 83. EC, 0C
        push    dword [ebp-10H]                         ; 00FC _ FF. 75, F0
        call    sheet_alloc                             ; 00FF _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0104 _ 83. C4, 10
        mov     dword [ebp-1CH], eax                    ; 0107 _ 89. 45, E4
        mov     edx, dword [xsize]                      ; 010A _ 8B. 15, 00000200(d)
        mov     eax, dword [ysize]                      ; 0110 _ A1, 00000204(d)
        imul    eax, edx                                ; 0115 _ 0F AF. C2
        mov     edx, eax                                ; 0118 _ 89. C2
        mov     eax, dword [memman]                     ; 011A _ A1, 00000000(d)
        sub     esp, 8                                  ; 011F _ 83. EC, 08
        push    edx                                     ; 0122 _ 52
        push    eax                                     ; 0123 _ 50
        call    memman_alloc_4k                         ; 0124 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0129 _ 83. C4, 10
        mov     dword [buf_back], eax                   ; 012C _ A3, 000000F8(d)
        mov     ecx, dword [ysize]                      ; 0131 _ 8B. 0D, 00000204(d)
        mov     edx, dword [xsize]                      ; 0137 _ 8B. 15, 00000200(d)
        mov     eax, dword [buf_back]                   ; 013D _ A1, 000000F8(d)
        sub     esp, 12                                 ; 0142 _ 83. EC, 0C
        push    99                                      ; 0145 _ 6A, 63
        push    ecx                                     ; 0147 _ 51
        push    edx                                     ; 0148 _ 52
        push    eax                                     ; 0149 _ 50
        push    dword [ebp-20H]                         ; 014A _ FF. 75, E0
        call    sheet_setbuf                            ; 014D _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0152 _ 83. C4, 20
        sub     esp, 12                                 ; 0155 _ 83. EC, 0C
        push    99                                      ; 0158 _ 6A, 63
        push    16                                      ; 015A _ 6A, 10
        push    16                                      ; 015C _ 6A, 10
        push    buf_mouse                               ; 015E _ 68, 00000100(d)
        push    dword [ebp-1CH]                         ; 0163 _ FF. 75, E4
        call    sheet_setbuf                            ; 0166 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 016B _ 83. C4, 20
        mov     ecx, dword [ysize]                      ; 016E _ 8B. 0D, 00000204(d)
        mov     edx, dword [xsize]                      ; 0174 _ 8B. 15, 00000200(d)
        mov     eax, dword [buf_back]                   ; 017A _ A1, 000000F8(d)
        sub     esp, 4                                  ; 017F _ 83. EC, 04
        push    ecx                                     ; 0182 _ 51
        push    edx                                     ; 0183 _ 52
        push    eax                                     ; 0184 _ 50
        call    init_screen8                            ; 0185 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 018A _ 83. C4, 10
        sub     esp, 8                                  ; 018D _ 83. EC, 08
        push    99                                      ; 0190 _ 6A, 63
        push    buf_mouse                               ; 0192 _ 68, 00000100(d)
        call    init_mouse_cursor                       ; 0197 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 019C _ 83. C4, 10
        push    0                                       ; 019F _ 6A, 00
        push    0                                       ; 01A1 _ 6A, 00
        push    dword [ebp-20H]                         ; 01A3 _ FF. 75, E0
        push    dword [ebp-10H]                         ; 01A6 _ FF. 75, F0
        call    sheet_slide                             ; 01A9 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 01AE _ 83. C4, 10
        mov     eax, dword [xsize]                      ; 01B1 _ A1, 00000200(d)
        sub     eax, 16                                 ; 01B6 _ 83. E8, 10
        mov     edx, eax                                ; 01B9 _ 89. C2
        shr     edx, 31                                 ; 01BB _ C1. EA, 1F
        add     eax, edx                                ; 01BE _ 01. D0
        sar     eax, 1                                  ; 01C0 _ D1. F8
        mov     dword [mx], eax                         ; 01C2 _ A3, 000000F0(d)
        mov     eax, dword [ysize]                      ; 01C7 _ A1, 00000204(d)
        sub     eax, 44                                 ; 01CC _ 83. E8, 2C
        mov     edx, eax                                ; 01CF _ 89. C2
        shr     edx, 31                                 ; 01D1 _ C1. EA, 1F
        add     eax, edx                                ; 01D4 _ 01. D0
        sar     eax, 1                                  ; 01D6 _ D1. F8
        mov     dword [my], eax                         ; 01D8 _ A3, 000000F4(d)
        mov     edx, dword [my]                         ; 01DD _ 8B. 15, 000000F4(d)
        mov     eax, dword [mx]                         ; 01E3 _ A1, 000000F0(d)
        push    edx                                     ; 01E8 _ 52
        push    eax                                     ; 01E9 _ 50
        push    dword [ebp-1CH]                         ; 01EA _ FF. 75, E4
        push    dword [ebp-10H]                         ; 01ED _ FF. 75, F0
        call    sheet_slide                             ; 01F0 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 01F5 _ 83. C4, 10
        sub     esp, 4                                  ; 01F8 _ 83. EC, 04
        push    0                                       ; 01FB _ 6A, 00
        push    dword [ebp-20H]                         ; 01FD _ FF. 75, E0
        push    dword [ebp-10H]                         ; 0200 _ FF. 75, F0
        call    sheet_updown                            ; 0203 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0208 _ 83. C4, 10
        sub     esp, 4                                  ; 020B _ 83. EC, 04
        push    1                                       ; 020E _ 6A, 01
        push    dword [ebp-1CH]                         ; 0210 _ FF. 75, E4
        push    dword [ebp-10H]                         ; 0213 _ FF. 75, F0
        call    sheet_updown                            ; 0216 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 021B _ 83. C4, 10
        call    io_sti                                  ; 021E _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 0223 _ 83. EC, 0C
        push    mdec                                    ; 0226 _ 68, 000000E0(d)
        call    enable_mouse                            ; 022B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0230 _ 83. C4, 10
        mov     dword [ebp-0CH], 0                      ; 0233 _ C7. 45, F4, 00000000
        mov     dword [ebp-2CH], 0                      ; 023A _ C7. 45, D4, 00000000
?_001:  call    io_cli                                  ; 0241 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 0246 _ 83. EC, 0C
        push    keyinfo                                 ; 0249 _ 68, 00000020(d)
        call    fifo8_status                            ; 024E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0253 _ 83. C4, 10
        mov     ebx, eax                                ; 0256 _ 89. C3
        sub     esp, 12                                 ; 0258 _ 83. EC, 0C
        push    mouseinfo                               ; 025B _ 68, 00000008(d)
        call    fifo8_status                            ; 0260 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0265 _ 83. C4, 10
        add     eax, ebx                                ; 0268 _ 01. D8
        test    eax, eax                                ; 026A _ 85. C0
        jnz     ?_002                                   ; 026C _ 75, 0C
        call    io_sti                                  ; 026E _ E8, FFFFFFFC(rel)
        call    io_hlt                                  ; 0273 _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 0278 _ EB, C7
; CMain End of function

?_002:  ; Local function
        sub     esp, 12                                 ; 027A _ 83. EC, 0C
        push    keyinfo                                 ; 027D _ 68, 00000020(d)
        call    fifo8_status                            ; 0282 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0287 _ 83. C4, 10
        test    eax, eax                                ; 028A _ 85. C0
        jz      ?_003                                   ; 028C _ 74, 6F
        call    io_sti                                  ; 028E _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 0293 _ 83. EC, 0C
        push    keyinfo                                 ; 0296 _ 68, 00000020(d)
        call    fifo8_get                               ; 029B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 02A0 _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 02A3 _ 89. 45, F4
        cmp     dword [ebp-0CH], 28                     ; 02A6 _ 83. 7D, F4, 1C
        jnz     ?_001                                   ; 02AA _ 75, 95
        mov     ecx, dword [xsize]                      ; 02AC _ 8B. 0D, 00000200(d)
        mov     edx, dword [ebp-2CH]                    ; 02B2 _ 8B. 55, D4
        mov     eax, edx                                ; 02B5 _ 89. D0
        shl     eax, 2                                  ; 02B7 _ C1. E0, 02
        add     eax, edx                                ; 02BA _ 01. D0
        shl     eax, 2                                  ; 02BC _ C1. E0, 02
        mov     edx, eax                                ; 02BF _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 02C1 _ 8B. 45, EC
        add     eax, edx                                ; 02C4 _ 01. D0
        sub     esp, 4                                  ; 02C6 _ 83. EC, 04
        push    7                                       ; 02C9 _ 6A, 07
        push    ecx                                     ; 02CB _ 51
        push    dword [ebp-2CH]                         ; 02CC _ FF. 75, D4
        push    dword [ebp-28H]                         ; 02CF _ FF. 75, D8
        push    eax                                     ; 02D2 _ 50
        push    dword [ebp-20H]                         ; 02D3 _ FF. 75, E0
        push    dword [ebp-10H]                         ; 02D6 _ FF. 75, F0
        call    showMemoryInfo                          ; 02D9 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 02DE _ 83. C4, 20
        add     dword [ebp-2CH], 1                      ; 02E1 _ 83. 45, D4, 01
        mov     eax, dword [ebp-2CH]                    ; 02E5 _ 8B. 45, D4
        cmp     eax, dword [ebp-18H]                    ; 02E8 _ 3B. 45, E8
        jle     ?_001                                   ; 02EB _ 0F 8E, FFFFFF50
        mov     dword [ebp-2CH], 0                      ; 02F1 _ C7. 45, D4, 00000000
        jmp     ?_001                                   ; 02F8 _ E9, FFFFFF44

?_003:  ; Local function
        sub     esp, 12                                 ; 02FD _ 83. EC, 0C
        push    mouseinfo                               ; 0300 _ 68, 00000008(d)
        call    fifo8_status                            ; 0305 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 030A _ 83. C4, 10
        test    eax, eax                                ; 030D _ 85. C0
        je      ?_001                                   ; 030F _ 0F 84, FFFFFF2C
        call    io_sti                                  ; 0315 _ E8, FFFFFFFC(rel)
        sub     esp, 4                                  ; 031A _ 83. EC, 04
        push    dword [ebp-1CH]                         ; 031D _ FF. 75, E4
        push    dword [ebp-20H]                         ; 0320 _ FF. 75, E0
        push    dword [ebp-10H]                         ; 0323 _ FF. 75, F0
        call    show_mouse_info                         ; 0326 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 032B _ 83. C4, 10
        jmp     ?_001                                   ; 032E _ E9, FFFFFF0E

initBootInfo:; Function begin
        push    ebp                                     ; 0333 _ 55
        mov     ebp, esp                                ; 0334 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 0336 _ 8B. 45, 08
        mov     dword [eax], 655360                     ; 0339 _ C7. 00, 000A0000
        mov     eax, dword [ebp+8H]                     ; 033F _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 320                      ; 0342 _ 66: C7. 40, 04, 0140
        mov     eax, dword [ebp+8H]                     ; 0348 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 200                      ; 034B _ 66: C7. 40, 06, 00C8
        nop                                             ; 0351 _ 90
        pop     ebp                                     ; 0352 _ 5D
        ret                                             ; 0353 _ C3
; initBootInfo End of function

init_palette:; Function begin
        push    ebp                                     ; 0354 _ 55
        mov     ebp, esp                                ; 0355 _ 89. E5
        sub     esp, 8                                  ; 0357 _ 83. EC, 08
        sub     esp, 4                                  ; 035A _ 83. EC, 04
        push    table_rgb.1661                          ; 035D _ 68, 00000020(d)
        push    15                                      ; 0362 _ 6A, 0F
        push    0                                       ; 0364 _ 6A, 00
        call    set_palette                             ; 0366 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 036B _ 83. C4, 10
        nop                                             ; 036E _ 90
        leave                                           ; 036F _ C9
        ret                                             ; 0370 _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 0371 _ 55
        mov     ebp, esp                                ; 0372 _ 89. E5
        sub     esp, 24                                 ; 0374 _ 83. EC, 18
        call    io_load_eflags                          ; 0377 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 037C _ 89. 45, F4
        call    io_cli                                  ; 037F _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0384 _ 83. EC, 08
        push    dword [ebp+8H]                          ; 0387 _ FF. 75, 08
        push    968                                     ; 038A _ 68, 000003C8
        call    io_out8                                 ; 038F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0394 _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 0397 _ 8B. 45, 08
        mov     dword [ebp-10H], eax                    ; 039A _ 89. 45, F0
        jmp     ?_005                                   ; 039D _ EB, 65

?_004:  mov     eax, dword [ebp+10H]                    ; 039F _ 8B. 45, 10
        movzx   eax, byte [eax]                         ; 03A2 _ 0F B6. 00
        shr     al, 2                                   ; 03A5 _ C0. E8, 02
        movzx   eax, al                                 ; 03A8 _ 0F B6. C0
        sub     esp, 8                                  ; 03AB _ 83. EC, 08
        push    eax                                     ; 03AE _ 50
        push    969                                     ; 03AF _ 68, 000003C9
        call    io_out8                                 ; 03B4 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03B9 _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 03BC _ 8B. 45, 10
        add     eax, 1                                  ; 03BF _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 03C2 _ 0F B6. 00
        shr     al, 2                                   ; 03C5 _ C0. E8, 02
        movzx   eax, al                                 ; 03C8 _ 0F B6. C0
        sub     esp, 8                                  ; 03CB _ 83. EC, 08
        push    eax                                     ; 03CE _ 50
        push    969                                     ; 03CF _ 68, 000003C9
        call    io_out8                                 ; 03D4 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03D9 _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 03DC _ 8B. 45, 10
        add     eax, 2                                  ; 03DF _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 03E2 _ 0F B6. 00
        shr     al, 2                                   ; 03E5 _ C0. E8, 02
        movzx   eax, al                                 ; 03E8 _ 0F B6. C0
        sub     esp, 8                                  ; 03EB _ 83. EC, 08
        push    eax                                     ; 03EE _ 50
        push    969                                     ; 03EF _ 68, 000003C9
        call    io_out8                                 ; 03F4 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03F9 _ 83. C4, 10
        add     dword [ebp+10H], 3                      ; 03FC _ 83. 45, 10, 03
        add     dword [ebp-10H], 1                      ; 0400 _ 83. 45, F0, 01
?_005:  mov     eax, dword [ebp-10H]                    ; 0404 _ 8B. 45, F0
        cmp     eax, dword [ebp+0CH]                    ; 0407 _ 3B. 45, 0C
        jle     ?_004                                   ; 040A _ 7E, 93
        sub     esp, 12                                 ; 040C _ 83. EC, 0C
        push    dword [ebp-0CH]                         ; 040F _ FF. 75, F4
        call    io_store_eflags                         ; 0412 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0417 _ 83. C4, 10
        nop                                             ; 041A _ 90
        leave                                           ; 041B _ C9
        ret                                             ; 041C _ C3
; set_palette End of function

boxfill8:; Function begin
        push    ebp                                     ; 041D _ 55
        mov     ebp, esp                                ; 041E _ 89. E5
        sub     esp, 20                                 ; 0420 _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 0423 _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 0426 _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 0429 _ 8B. 45, 18
        mov     dword [ebp-4H], eax                     ; 042C _ 89. 45, FC
        jmp     ?_009                                   ; 042F _ EB, 33

?_006:  mov     eax, dword [ebp+14H]                    ; 0431 _ 8B. 45, 14
        mov     dword [ebp-8H], eax                     ; 0434 _ 89. 45, F8
        jmp     ?_008                                   ; 0437 _ EB, 1F

?_007:  mov     eax, dword [ebp-4H]                     ; 0439 _ 8B. 45, FC
        imul    eax, dword [ebp+0CH]                    ; 043C _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0440 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0442 _ 8B. 45, F8
        add     eax, edx                                ; 0445 _ 01. D0
        mov     edx, eax                                ; 0447 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0449 _ 8B. 45, 08
        add     edx, eax                                ; 044C _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 044E _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0452 _ 88. 02
        add     dword [ebp-8H], 1                       ; 0454 _ 83. 45, F8, 01
?_008:  mov     eax, dword [ebp-8H]                     ; 0458 _ 8B. 45, F8
        cmp     eax, dword [ebp+1CH]                    ; 045B _ 3B. 45, 1C
        jle     ?_007                                   ; 045E _ 7E, D9
        add     dword [ebp-4H], 1                       ; 0460 _ 83. 45, FC, 01
?_009:  mov     eax, dword [ebp-4H]                     ; 0464 _ 8B. 45, FC
        cmp     eax, dword [ebp+20H]                    ; 0467 _ 3B. 45, 20
        jle     ?_006                                   ; 046A _ 7E, C5
        nop                                             ; 046C _ 90
        leave                                           ; 046D _ C9
        ret                                             ; 046E _ C3
; boxfill8 End of function

showString:; Function begin
        push    ebp                                     ; 046F _ 55
        mov     ebp, esp                                ; 0470 _ 89. E5
        push    ebx                                     ; 0472 _ 53
        sub     esp, 36                                 ; 0473 _ 83. EC, 24
        mov     eax, dword [ebp+18H]                    ; 0476 _ 8B. 45, 18
        mov     byte [ebp-1CH], al                      ; 0479 _ 88. 45, E4
        mov     eax, dword [ebp+10H]                    ; 047C _ 8B. 45, 10
        mov     dword [ebp-0CH], eax                    ; 047F _ 89. 45, F4
        jmp     ?_011                                   ; 0482 _ EB, 3E

?_010:  mov     eax, dword [ebp+1CH]                    ; 0484 _ 8B. 45, 1C
        movzx   eax, byte [eax]                         ; 0487 _ 0F B6. 00
        movzx   eax, al                                 ; 048A _ 0F B6. C0
        shl     eax, 4                                  ; 048D _ C1. E0, 04
        lea     ebx, [systemFont+eax]                   ; 0490 _ 8D. 98, 00000000(d)
        movsx   ecx, byte [ebp-1CH]                     ; 0496 _ 0F BE. 4D, E4
        mov     eax, dword [ebp+0CH]                    ; 049A _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 049D _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 04A0 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 04A3 _ 8B. 00
        sub     esp, 8                                  ; 04A5 _ 83. EC, 08
        push    ebx                                     ; 04A8 _ 53
        push    ecx                                     ; 04A9 _ 51
        push    dword [ebp+14H]                         ; 04AA _ FF. 75, 14
        push    dword [ebp+10H]                         ; 04AD _ FF. 75, 10
        push    edx                                     ; 04B0 _ 52
        push    eax                                     ; 04B1 _ 50
        call    showChar8                               ; 04B2 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 04B7 _ 83. C4, 20
        add     dword [ebp+1CH], 1                      ; 04BA _ 83. 45, 1C, 01
        add     dword [ebp+10H], 8                      ; 04BE _ 83. 45, 10, 08
?_011:  mov     eax, dword [ebp+1CH]                    ; 04C2 _ 8B. 45, 1C
        movzx   eax, byte [eax]                         ; 04C5 _ 0F B6. 00
        test    al, al                                  ; 04C8 _ 84. C0
        jnz     ?_010                                   ; 04CA _ 75, B8
        mov     eax, dword [ebp+14H]                    ; 04CC _ 8B. 45, 14
        add     eax, 16                                 ; 04CF _ 83. C0, 10
        sub     esp, 8                                  ; 04D2 _ 83. EC, 08
        push    eax                                     ; 04D5 _ 50
        push    dword [ebp+10H]                         ; 04D6 _ FF. 75, 10
        push    dword [ebp+14H]                         ; 04D9 _ FF. 75, 14
        push    dword [ebp-0CH]                         ; 04DC _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 04DF _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 04E2 _ FF. 75, 08
        call    sheet_refresh                           ; 04E5 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 04EA _ 83. C4, 20
        nop                                             ; 04ED _ 90
        mov     ebx, dword [ebp-4H]                     ; 04EE _ 8B. 5D, FC
        leave                                           ; 04F1 _ C9
        ret                                             ; 04F2 _ C3
; showString End of function

showChar8:; Function begin
        push    ebp                                     ; 04F3 _ 55
        mov     ebp, esp                                ; 04F4 _ 89. E5
        sub     esp, 20                                 ; 04F6 _ 83. EC, 14
        mov     eax, dword [ebp+18H]                    ; 04F9 _ 8B. 45, 18
        mov     byte [ebp-14H], al                      ; 04FC _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 04FF _ C7. 45, FC, 00000000
        jmp     ?_021                                   ; 0506 _ E9, 0000016C

?_012:  mov     edx, dword [ebp-4H]                     ; 050B _ 8B. 55, FC
        mov     eax, dword [ebp+1CH]                    ; 050E _ 8B. 45, 1C
        add     eax, edx                                ; 0511 _ 01. D0
        movzx   eax, byte [eax]                         ; 0513 _ 0F B6. 00
        mov     byte [ebp-5H], al                       ; 0516 _ 88. 45, FB
        cmp     byte [ebp-5H], 0                        ; 0519 _ 80. 7D, FB, 00
        jns     ?_013                                   ; 051D _ 79, 20
        mov     edx, dword [ebp+14H]                    ; 051F _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0522 _ 8B. 45, FC
        add     eax, edx                                ; 0525 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0527 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 052B _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 052D _ 8B. 45, 10
        add     eax, edx                                ; 0530 _ 01. D0
        mov     edx, eax                                ; 0532 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0534 _ 8B. 45, 08
        add     edx, eax                                ; 0537 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0539 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 053D _ 88. 02
?_013:  movsx   eax, byte [ebp-5H]                      ; 053F _ 0F BE. 45, FB
        and     eax, 40H                                ; 0543 _ 83. E0, 40
        test    eax, eax                                ; 0546 _ 85. C0
        jz      ?_014                                   ; 0548 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 054A _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 054D _ 8B. 45, FC
        add     eax, edx                                ; 0550 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0552 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0556 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0558 _ 8B. 45, 10
        add     eax, edx                                ; 055B _ 01. D0
        lea     edx, [eax+1H]                           ; 055D _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0560 _ 8B. 45, 08
        add     edx, eax                                ; 0563 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0565 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0569 _ 88. 02
?_014:  movsx   eax, byte [ebp-5H]                      ; 056B _ 0F BE. 45, FB
        and     eax, 20H                                ; 056F _ 83. E0, 20
        test    eax, eax                                ; 0572 _ 85. C0
        jz      ?_015                                   ; 0574 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 0576 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0579 _ 8B. 45, FC
        add     eax, edx                                ; 057C _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 057E _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0582 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0584 _ 8B. 45, 10
        add     eax, edx                                ; 0587 _ 01. D0
        lea     edx, [eax+2H]                           ; 0589 _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 058C _ 8B. 45, 08
        add     edx, eax                                ; 058F _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0591 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0595 _ 88. 02
?_015:  movsx   eax, byte [ebp-5H]                      ; 0597 _ 0F BE. 45, FB
        and     eax, 10H                                ; 059B _ 83. E0, 10
        test    eax, eax                                ; 059E _ 85. C0
        jz      ?_016                                   ; 05A0 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 05A2 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 05A5 _ 8B. 45, FC
        add     eax, edx                                ; 05A8 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 05AA _ 0F AF. 45, 0C
        mov     edx, eax                                ; 05AE _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 05B0 _ 8B. 45, 10
        add     eax, edx                                ; 05B3 _ 01. D0
        lea     edx, [eax+3H]                           ; 05B5 _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 05B8 _ 8B. 45, 08
        add     edx, eax                                ; 05BB _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 05BD _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 05C1 _ 88. 02
?_016:  movsx   eax, byte [ebp-5H]                      ; 05C3 _ 0F BE. 45, FB
        and     eax, 08H                                ; 05C7 _ 83. E0, 08
        test    eax, eax                                ; 05CA _ 85. C0
        jz      ?_017                                   ; 05CC _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 05CE _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 05D1 _ 8B. 45, FC
        add     eax, edx                                ; 05D4 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 05D6 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 05DA _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 05DC _ 8B. 45, 10
        add     eax, edx                                ; 05DF _ 01. D0
        lea     edx, [eax+4H]                           ; 05E1 _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 05E4 _ 8B. 45, 08
        add     edx, eax                                ; 05E7 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 05E9 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 05ED _ 88. 02
?_017:  movsx   eax, byte [ebp-5H]                      ; 05EF _ 0F BE. 45, FB
        and     eax, 04H                                ; 05F3 _ 83. E0, 04
        test    eax, eax                                ; 05F6 _ 85. C0
        jz      ?_018                                   ; 05F8 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 05FA _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 05FD _ 8B. 45, FC
        add     eax, edx                                ; 0600 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0602 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0606 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0608 _ 8B. 45, 10
        add     eax, edx                                ; 060B _ 01. D0
        lea     edx, [eax+5H]                           ; 060D _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 0610 _ 8B. 45, 08
        add     edx, eax                                ; 0613 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0615 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0619 _ 88. 02
?_018:  movsx   eax, byte [ebp-5H]                      ; 061B _ 0F BE. 45, FB
        and     eax, 02H                                ; 061F _ 83. E0, 02
        test    eax, eax                                ; 0622 _ 85. C0
        jz      ?_019                                   ; 0624 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 0626 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0629 _ 8B. 45, FC
        add     eax, edx                                ; 062C _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 062E _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0632 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0634 _ 8B. 45, 10
        add     eax, edx                                ; 0637 _ 01. D0
        lea     edx, [eax+6H]                           ; 0639 _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 063C _ 8B. 45, 08
        add     edx, eax                                ; 063F _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0641 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0645 _ 88. 02
?_019:  movsx   eax, byte [ebp-5H]                      ; 0647 _ 0F BE. 45, FB
        and     eax, 01H                                ; 064B _ 83. E0, 01
        test    eax, eax                                ; 064E _ 85. C0
        jz      ?_020                                   ; 0650 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 0652 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0655 _ 8B. 45, FC
        add     eax, edx                                ; 0658 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 065A _ 0F AF. 45, 0C
        mov     edx, eax                                ; 065E _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0660 _ 8B. 45, 10
        add     eax, edx                                ; 0663 _ 01. D0
        lea     edx, [eax+7H]                           ; 0665 _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 0668 _ 8B. 45, 08
        add     edx, eax                                ; 066B _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 066D _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0671 _ 88. 02
?_020:  add     dword [ebp-4H], 1                       ; 0673 _ 83. 45, FC, 01
?_021:  cmp     dword [ebp-4H], 15                      ; 0677 _ 83. 7D, FC, 0F
        jle     ?_012                                   ; 067B _ 0F 8E, FFFFFE8A
        nop                                             ; 0681 _ 90
        leave                                           ; 0682 _ C9
        ret                                             ; 0683 _ C3
; showChar8 End of function

init_mouse_cursor:; Function begin
        push    ebp                                     ; 0684 _ 55
        mov     ebp, esp                                ; 0685 _ 89. E5
        sub     esp, 20                                 ; 0687 _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 068A _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 068D _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 0690 _ C7. 45, FC, 00000000
        jmp     ?_028                                   ; 0697 _ E9, 000000B5

?_022:  mov     dword [ebp-8H], 0                       ; 069C _ C7. 45, F8, 00000000
        jmp     ?_027                                   ; 06A3 _ E9, 0000009B

?_023:  mov     eax, dword [ebp-4H]                     ; 06A8 _ 8B. 45, FC
        shl     eax, 4                                  ; 06AB _ C1. E0, 04
        mov     edx, eax                                ; 06AE _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 06B0 _ 8B. 45, F8
        add     eax, edx                                ; 06B3 _ 01. D0
        add     eax, cursor.1718                        ; 06B5 _ 05, 00000060(d)
        movzx   eax, byte [eax]                         ; 06BA _ 0F B6. 00
        cmp     al, 42                                  ; 06BD _ 3C, 2A
        jnz     ?_024                                   ; 06BF _ 75, 19
        mov     eax, dword [ebp-4H]                     ; 06C1 _ 8B. 45, FC
        shl     eax, 4                                  ; 06C4 _ C1. E0, 04
        mov     edx, eax                                ; 06C7 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 06C9 _ 8B. 45, F8
        add     eax, edx                                ; 06CC _ 01. D0
        mov     edx, eax                                ; 06CE _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 06D0 _ 8B. 45, 08
        add     eax, edx                                ; 06D3 _ 01. D0
        mov     byte [eax], 0                           ; 06D5 _ C6. 00, 00
        jmp     ?_026                                   ; 06D8 _ EB, 65

?_024:  mov     eax, dword [ebp-4H]                     ; 06DA _ 8B. 45, FC
        shl     eax, 4                                  ; 06DD _ C1. E0, 04
        mov     edx, eax                                ; 06E0 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 06E2 _ 8B. 45, F8
        add     eax, edx                                ; 06E5 _ 01. D0
        add     eax, cursor.1718                        ; 06E7 _ 05, 00000060(d)
        movzx   eax, byte [eax]                         ; 06EC _ 0F B6. 00
        cmp     al, 79                                  ; 06EF _ 3C, 4F
        jnz     ?_025                                   ; 06F1 _ 75, 19
        mov     eax, dword [ebp-4H]                     ; 06F3 _ 8B. 45, FC
        shl     eax, 4                                  ; 06F6 _ C1. E0, 04
        mov     edx, eax                                ; 06F9 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 06FB _ 8B. 45, F8
        add     eax, edx                                ; 06FE _ 01. D0
        mov     edx, eax                                ; 0700 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0702 _ 8B. 45, 08
        add     eax, edx                                ; 0705 _ 01. D0
        mov     byte [eax], 7                           ; 0707 _ C6. 00, 07
        jmp     ?_026                                   ; 070A _ EB, 33

?_025:  mov     eax, dword [ebp-4H]                     ; 070C _ 8B. 45, FC
        shl     eax, 4                                  ; 070F _ C1. E0, 04
        mov     edx, eax                                ; 0712 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0714 _ 8B. 45, F8
        add     eax, edx                                ; 0717 _ 01. D0
        add     eax, cursor.1718                        ; 0719 _ 05, 00000060(d)
        movzx   eax, byte [eax]                         ; 071E _ 0F B6. 00
        cmp     al, 46                                  ; 0721 _ 3C, 2E
        jnz     ?_026                                   ; 0723 _ 75, 1A
        mov     eax, dword [ebp-4H]                     ; 0725 _ 8B. 45, FC
        shl     eax, 4                                  ; 0728 _ C1. E0, 04
        mov     edx, eax                                ; 072B _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 072D _ 8B. 45, F8
        add     eax, edx                                ; 0730 _ 01. D0
        mov     edx, eax                                ; 0732 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0734 _ 8B. 45, 08
        add     edx, eax                                ; 0737 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0739 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 073D _ 88. 02
?_026:  add     dword [ebp-8H], 1                       ; 073F _ 83. 45, F8, 01
?_027:  cmp     dword [ebp-8H], 15                      ; 0743 _ 83. 7D, F8, 0F
        jle     ?_023                                   ; 0747 _ 0F 8E, FFFFFF5B
        add     dword [ebp-4H], 1                       ; 074D _ 83. 45, FC, 01
?_028:  cmp     dword [ebp-4H], 15                      ; 0751 _ 83. 7D, FC, 0F
        jle     ?_022                                   ; 0755 _ 0F 8E, FFFFFF41
        nop                                             ; 075B _ 90
        leave                                           ; 075C _ C9
        ret                                             ; 075D _ C3
; init_mouse_cursor End of function

putblock:; Function begin
        push    ebp                                     ; 075E _ 55
        mov     ebp, esp                                ; 075F _ 89. E5
        push    ebx                                     ; 0761 _ 53
        sub     esp, 16                                 ; 0762 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 0765 _ C7. 45, F8, 00000000
        jmp     ?_032                                   ; 076C _ EB, 50

?_029:  mov     dword [ebp-0CH], 0                      ; 076E _ C7. 45, F4, 00000000
        jmp     ?_031                                   ; 0775 _ EB, 3B

?_030:  mov     eax, dword [ebp-8H]                     ; 0777 _ 8B. 45, F8
        imul    eax, dword [ebp+24H]                    ; 077A _ 0F AF. 45, 24
        mov     edx, eax                                ; 077E _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 0780 _ 8B. 45, F4
        add     eax, edx                                ; 0783 _ 01. D0
        mov     edx, eax                                ; 0785 _ 89. C2
        mov     eax, dword [ebp+20H]                    ; 0787 _ 8B. 45, 20
        add     eax, edx                                ; 078A _ 01. D0
        mov     ecx, dword [ebp+1CH]                    ; 078C _ 8B. 4D, 1C
        mov     edx, dword [ebp-8H]                     ; 078F _ 8B. 55, F8
        add     edx, ecx                                ; 0792 _ 01. CA
        imul    edx, dword [ebp+0CH]                    ; 0794 _ 0F AF. 55, 0C
        mov     ebx, dword [ebp+18H]                    ; 0798 _ 8B. 5D, 18
        mov     ecx, dword [ebp-0CH]                    ; 079B _ 8B. 4D, F4
        add     ecx, ebx                                ; 079E _ 01. D9
        add     edx, ecx                                ; 07A0 _ 01. CA
        mov     ecx, edx                                ; 07A2 _ 89. D1
        mov     edx, dword [ebp+8H]                     ; 07A4 _ 8B. 55, 08
        add     edx, ecx                                ; 07A7 _ 01. CA
        movzx   eax, byte [eax]                         ; 07A9 _ 0F B6. 00
        mov     byte [edx], al                          ; 07AC _ 88. 02
        add     dword [ebp-0CH], 1                      ; 07AE _ 83. 45, F4, 01
?_031:  mov     eax, dword [ebp-0CH]                    ; 07B2 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 07B5 _ 3B. 45, 10
        jl      ?_030                                   ; 07B8 _ 7C, BD
        add     dword [ebp-8H], 1                       ; 07BA _ 83. 45, F8, 01
?_032:  mov     eax, dword [ebp-8H]                     ; 07BE _ 8B. 45, F8
        cmp     eax, dword [ebp+14H]                    ; 07C1 _ 3B. 45, 14
        jl      ?_029                                   ; 07C4 _ 7C, A8
        nop                                             ; 07C6 _ 90
        add     esp, 16                                 ; 07C7 _ 83. C4, 10
        pop     ebx                                     ; 07CA _ 5B
        pop     ebp                                     ; 07CB _ 5D
        ret                                             ; 07CC _ C3
; putblock End of function

intHandlerFromC:; Function begin
        push    ebp                                     ; 07CD _ 55
        mov     ebp, esp                                ; 07CE _ 89. E5
        sub     esp, 24                                 ; 07D0 _ 83. EC, 18
        mov     eax, dword [bootInfo]                   ; 07D3 _ A1, 00000000(d)
        mov     dword [ebp-14H], eax                    ; 07D8 _ 89. 45, EC
        movzx   eax, word [?_123]                       ; 07DB _ 0F B7. 05, 00000004(d)
        cwde                                            ; 07E2 _ 98
        mov     dword [ebp-10H], eax                    ; 07E3 _ 89. 45, F0
        movzx   eax, word [?_124]                       ; 07E6 _ 0F B7. 05, 00000006(d)
        cwde                                            ; 07ED _ 98
        mov     dword [ebp-0CH], eax                    ; 07EE _ 89. 45, F4
        sub     esp, 8                                  ; 07F1 _ 83. EC, 08
        push    33                                      ; 07F4 _ 6A, 21
        push    32                                      ; 07F6 _ 6A, 20
        call    io_out8                                 ; 07F8 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 07FD _ 83. C4, 10
        mov     byte [ebp-15H], 0                       ; 0800 _ C6. 45, EB, 00
        sub     esp, 12                                 ; 0804 _ 83. EC, 0C
        push    96                                      ; 0807 _ 6A, 60
        call    io_in8                                  ; 0809 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 080E _ 83. C4, 10
        mov     byte [ebp-15H], al                      ; 0811 _ 88. 45, EB
        movzx   eax, byte [ebp-15H]                     ; 0814 _ 0F B6. 45, EB
        sub     esp, 8                                  ; 0818 _ 83. EC, 08
        push    eax                                     ; 081B _ 50
        push    keyinfo                                 ; 081C _ 68, 00000020(d)
        call    fifo8_put                               ; 0821 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0826 _ 83. C4, 10
        nop                                             ; 0829 _ 90
        leave                                           ; 082A _ C9
        ret                                             ; 082B _ C3
; intHandlerFromC End of function

charToHexVal:; Function begin
        push    ebp                                     ; 082C _ 55
        mov     ebp, esp                                ; 082D _ 89. E5
        sub     esp, 4                                  ; 082F _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 0832 _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 0835 _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 0838 _ 80. 7D, FC, 09
        jle     ?_033                                   ; 083C _ 7E, 09
        movzx   eax, byte [ebp-4H]                      ; 083E _ 0F B6. 45, FC
        add     eax, 55                                 ; 0842 _ 83. C0, 37
        jmp     ?_034                                   ; 0845 _ EB, 07

?_033:  movzx   eax, byte [ebp-4H]                      ; 0847 _ 0F B6. 45, FC
        add     eax, 48                                 ; 084B _ 83. C0, 30
?_034:  leave                                           ; 084E _ C9
        ret                                             ; 084F _ C3
; charToHexVal End of function

charToHexStr:; Function begin
        push    ebp                                     ; 0850 _ 55
        mov     ebp, esp                                ; 0851 _ 89. E5
        sub     esp, 20                                 ; 0853 _ 83. EC, 14
        mov     eax, dword [ebp+8H]                     ; 0856 _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 0859 _ 88. 45, EC
        movzx   eax, byte [ebp-14H]                     ; 085C _ 0F B6. 45, EC
        and     eax, 0FH                                ; 0860 _ 83. E0, 0F
        mov     byte [ebp-1H], al                       ; 0863 _ 88. 45, FF
        movsx   eax, byte [ebp-1H]                      ; 0866 _ 0F BE. 45, FF
        push    eax                                     ; 086A _ 50
        call    charToHexVal                            ; 086B _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 0870 _ 83. C4, 04
        mov     byte [?_122], al                        ; 0873 _ A2, 00000003(d)
        shr     byte [ebp-14H], 4                       ; 0878 _ C0. 6D, EC, 04
        movzx   eax, byte [ebp-14H]                     ; 087C _ 0F B6. 45, EC
        movsx   eax, al                                 ; 0880 _ 0F BE. C0
        push    eax                                     ; 0883 _ 50
        call    charToHexVal                            ; 0884 _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 0889 _ 83. C4, 04
        mov     byte [?_121], al                        ; 088C _ A2, 00000002(d)
        mov     eax, keyval                             ; 0891 _ B8, 00000000(d)
        leave                                           ; 0896 _ C9
        ret                                             ; 0897 _ C3
; charToHexStr End of function

intToHexStr:; Function begin
        push    ebp                                     ; 0898 _ 55
        mov     ebp, esp                                ; 0899 _ 89. E5
        sub     esp, 16                                 ; 089B _ 83. EC, 10
        mov     byte [str.1762], 48                     ; 089E _ C6. 05, 00000208(d), 30
        mov     byte [?_125], 88                        ; 08A5 _ C6. 05, 00000209(d), 58
        mov     byte [?_126], 0                         ; 08AC _ C6. 05, 00000212(d), 00
        mov     dword [ebp-8H], 2                       ; 08B3 _ C7. 45, F8, 00000002
        mov     dword [ebp-0CH], 7                      ; 08BA _ C7. 45, F4, 00000007
        jmp     ?_038                                   ; 08C1 _ EB, 45

?_035:  mov     eax, dword [ebp+8H]                     ; 08C3 _ 8B. 45, 08
        and     eax, 0FH                                ; 08C6 _ 83. E0, 0F
        mov     dword [ebp-4H], eax                     ; 08C9 _ 89. 45, FC
        cmp     dword [ebp-4H], 9                       ; 08CC _ 83. 7D, FC, 09
        jg      ?_036                                   ; 08D0 _ 7F, 18
        mov     eax, dword [ebp-4H]                     ; 08D2 _ 8B. 45, FC
        lea     ecx, [eax+30H]                          ; 08D5 _ 8D. 48, 30
        mov     edx, dword [ebp-8H]                     ; 08D8 _ 8B. 55, F8
        mov     eax, dword [ebp-0CH]                    ; 08DB _ 8B. 45, F4
        add     eax, edx                                ; 08DE _ 01. D0
        mov     edx, ecx                                ; 08E0 _ 89. CA
        mov     byte [str.1762+eax], dl                 ; 08E2 _ 88. 90, 00000208(d)
        jmp     ?_037                                   ; 08E8 _ EB, 16

?_036:  mov     eax, dword [ebp-4H]                     ; 08EA _ 8B. 45, FC
        lea     ecx, [eax+37H]                          ; 08ED _ 8D. 48, 37
        mov     edx, dword [ebp-8H]                     ; 08F0 _ 8B. 55, F8
        mov     eax, dword [ebp-0CH]                    ; 08F3 _ 8B. 45, F4
        add     eax, edx                                ; 08F6 _ 01. D0
        mov     edx, ecx                                ; 08F8 _ 89. CA
        mov     byte [str.1762+eax], dl                 ; 08FA _ 88. 90, 00000208(d)
?_037:  shr     dword [ebp+8H], 4                       ; 0900 _ C1. 6D, 08, 04
        sub     dword [ebp-0CH], 1                      ; 0904 _ 83. 6D, F4, 01
?_038:  cmp     dword [ebp-0CH], 0                      ; 0908 _ 83. 7D, F4, 00
        jns     ?_035                                   ; 090C _ 79, B5
        mov     eax, str.1762                           ; 090E _ B8, 00000208(d)
        leave                                           ; 0913 _ C9
        ret                                             ; 0914 _ C3
; intToHexStr End of function

wait_KBC_sendReady:; Function begin
        push    ebp                                     ; 0915 _ 55
        mov     ebp, esp                                ; 0916 _ 89. E5
        sub     esp, 8                                  ; 0918 _ 83. EC, 08
?_039:  sub     esp, 12                                 ; 091B _ 83. EC, 0C
        push    100                                     ; 091E _ 6A, 64
        call    io_in8                                  ; 0920 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0925 _ 83. C4, 10
        and     eax, 02H                                ; 0928 _ 83. E0, 02
        test    eax, eax                                ; 092B _ 85. C0
        jz      ?_040                                   ; 092D _ 74, 02
        jmp     ?_039                                   ; 092F _ EB, EA
; wait_KBC_sendReady End of function

?_040:  ; Local function
        nop                                             ; 0931 _ 90
        nop                                             ; 0932 _ 90
        leave                                           ; 0933 _ C9
        ret                                             ; 0934 _ C3

init_keyboard:; Function begin
        push    ebp                                     ; 0935 _ 55
        mov     ebp, esp                                ; 0936 _ 89. E5
        sub     esp, 8                                  ; 0938 _ 83. EC, 08
        call    wait_KBC_sendReady                      ; 093B _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0940 _ 83. EC, 08
        push    96                                      ; 0943 _ 6A, 60
        push    100                                     ; 0945 _ 6A, 64
        call    io_out8                                 ; 0947 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 094C _ 83. C4, 10
        call    wait_KBC_sendReady                      ; 094F _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0954 _ 83. EC, 08
        push    71                                      ; 0957 _ 6A, 47
        push    96                                      ; 0959 _ 6A, 60
        call    io_out8                                 ; 095B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0960 _ 83. C4, 10
        nop                                             ; 0963 _ 90
        leave                                           ; 0964 _ C9
        ret                                             ; 0965 _ C3
; init_keyboard End of function

enable_mouse:; Function begin
        push    ebp                                     ; 0966 _ 55
        mov     ebp, esp                                ; 0967 _ 89. E5
        sub     esp, 8                                  ; 0969 _ 83. EC, 08
        call    wait_KBC_sendReady                      ; 096C _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0971 _ 83. EC, 08
        push    212                                     ; 0974 _ 68, 000000D4
        push    100                                     ; 0979 _ 6A, 64
        call    io_out8                                 ; 097B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0980 _ 83. C4, 10
        call    wait_KBC_sendReady                      ; 0983 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0988 _ 83. EC, 08
        push    244                                     ; 098B _ 68, 000000F4
        push    96                                      ; 0990 _ 6A, 60
        call    io_out8                                 ; 0992 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0997 _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 099A _ 8B. 45, 08
        mov     byte [eax+3H], 0                        ; 099D _ C6. 40, 03, 00
        nop                                             ; 09A1 _ 90
        leave                                           ; 09A2 _ C9
        ret                                             ; 09A3 _ C3
; enable_mouse End of function

intHandlerFromMouse:; Function begin
        push    ebp                                     ; 09A4 _ 55
        mov     ebp, esp                                ; 09A5 _ 89. E5
        sub     esp, 24                                 ; 09A7 _ 83. EC, 18
        sub     esp, 8                                  ; 09AA _ 83. EC, 08
        push    32                                      ; 09AD _ 6A, 20
        push    160                                     ; 09AF _ 68, 000000A0
        call    io_out8                                 ; 09B4 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 09B9 _ 83. C4, 10
        sub     esp, 8                                  ; 09BC _ 83. EC, 08
        push    32                                      ; 09BF _ 6A, 20
        push    32                                      ; 09C1 _ 6A, 20
        call    io_out8                                 ; 09C3 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 09C8 _ 83. C4, 10
        sub     esp, 12                                 ; 09CB _ 83. EC, 0C
        push    96                                      ; 09CE _ 6A, 60
        call    io_in8                                  ; 09D0 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 09D5 _ 83. C4, 10
        mov     byte [ebp-9H], al                       ; 09D8 _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 09DB _ 0F B6. 45, F7
        sub     esp, 8                                  ; 09DF _ 83. EC, 08
        push    eax                                     ; 09E2 _ 50
        push    mouseinfo                               ; 09E3 _ 68, 00000008(d)
        call    fifo8_put                               ; 09E8 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 09ED _ 83. C4, 10
        nop                                             ; 09F0 _ 90
        leave                                           ; 09F1 _ C9
        ret                                             ; 09F2 _ C3
; intHandlerFromMouse End of function

fifo8_init:; Function begin
        push    ebp                                     ; 09F3 _ 55
        mov     ebp, esp                                ; 09F4 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 09F6 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 09F9 _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 09FC _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 09FF _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 0A02 _ 8B. 55, 10
        mov     dword [eax], edx                        ; 0A05 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 0A07 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 0A0A _ 8B. 55, 0C
        mov     dword [eax+10H], edx                    ; 0A0D _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 0A10 _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 0A13 _ C7. 40, 14, 00000000
        mov     eax, dword [ebp+8H]                     ; 0A1A _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 0A1D _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 0A24 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 0A27 _ C7. 40, 08, 00000000
        nop                                             ; 0A2E _ 90
        pop     ebp                                     ; 0A2F _ 5D
        ret                                             ; 0A30 _ C3
; fifo8_init End of function

fifo8_put:; Function begin
        push    ebp                                     ; 0A31 _ 55
        mov     ebp, esp                                ; 0A32 _ 89. E5
        sub     esp, 4                                  ; 0A34 _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 0A37 _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 0A3A _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0A3D _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0A40 _ 8B. 40, 10
        test    eax, eax                                ; 0A43 _ 85. C0
        jnz     ?_041                                   ; 0A45 _ 75, 18
        mov     eax, dword [ebp+8H]                     ; 0A47 _ 8B. 45, 08
        mov     eax, dword [eax+14H]                    ; 0A4A _ 8B. 40, 14
        or      eax, 01H                                ; 0A4D _ 83. C8, 01
        mov     edx, eax                                ; 0A50 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0A52 _ 8B. 45, 08
        mov     dword [eax+14H], edx                    ; 0A55 _ 89. 50, 14
        mov     eax, 4294967295                         ; 0A58 _ B8, FFFFFFFF
        jmp     ?_043                                   ; 0A5D _ EB, 50

?_041:  mov     eax, dword [ebp+8H]                     ; 0A5F _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 0A62 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 0A64 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0A67 _ 8B. 40, 04
        add     edx, eax                                ; 0A6A _ 01. C2
        movzx   eax, byte [ebp-4H]                      ; 0A6C _ 0F B6. 45, FC
        mov     byte [edx], al                          ; 0A70 _ 88. 02
        mov     eax, dword [ebp+8H]                     ; 0A72 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0A75 _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 0A78 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0A7B _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 0A7E _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0A81 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 0A84 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0A87 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0A8A _ 8B. 40, 0C
        cmp     edx, eax                                ; 0A8D _ 39. C2
        jnz     ?_042                                   ; 0A8F _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 0A91 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 0A94 _ C7. 40, 04, 00000000
?_042:  mov     eax, dword [ebp+8H]                     ; 0A9B _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0A9E _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 0AA1 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 0AA4 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 0AA7 _ 89. 50, 10
        mov     eax, 0                                  ; 0AAA _ B8, 00000000
?_043:  leave                                           ; 0AAF _ C9
        ret                                             ; 0AB0 _ C3
; fifo8_put End of function

fifo8_get:; Function begin
        push    ebp                                     ; 0AB1 _ 55
        mov     ebp, esp                                ; 0AB2 _ 89. E5
        sub     esp, 16                                 ; 0AB4 _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 0AB7 _ 8B. 45, 08
        mov     edx, dword [eax+10H]                    ; 0ABA _ 8B. 50, 10
        mov     eax, dword [ebp+8H]                     ; 0ABD _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0AC0 _ 8B. 40, 0C
        cmp     edx, eax                                ; 0AC3 _ 39. C2
        jnz     ?_044                                   ; 0AC5 _ 75, 07
        mov     eax, 4294967295                         ; 0AC7 _ B8, FFFFFFFF
        jmp     ?_046                                   ; 0ACC _ EB, 51

?_044:  mov     eax, dword [ebp+8H]                     ; 0ACE _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 0AD1 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 0AD3 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0AD6 _ 8B. 40, 08
        add     eax, edx                                ; 0AD9 _ 01. D0
        movzx   eax, byte [eax]                         ; 0ADB _ 0F B6. 00
        movzx   eax, al                                 ; 0ADE _ 0F B6. C0
        mov     dword [ebp-4H], eax                     ; 0AE1 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0AE4 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0AE7 _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 0AEA _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0AED _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0AF0 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 0AF3 _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 0AF6 _ 8B. 50, 08
        mov     eax, dword [ebp+8H]                     ; 0AF9 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0AFC _ 8B. 40, 0C
        cmp     edx, eax                                ; 0AFF _ 39. C2
        jnz     ?_045                                   ; 0B01 _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 0B03 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 0B06 _ C7. 40, 08, 00000000
?_045:  mov     eax, dword [ebp+8H]                     ; 0B0D _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0B10 _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 0B13 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0B16 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 0B19 _ 89. 50, 10
        mov     eax, dword [ebp-4H]                     ; 0B1C _ 8B. 45, FC
?_046:  leave                                           ; 0B1F _ C9
        ret                                             ; 0B20 _ C3
; fifo8_get End of function

fifo8_status:; Function begin
        push    ebp                                     ; 0B21 _ 55
        mov     ebp, esp                                ; 0B22 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 0B24 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 0B27 _ 8B. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 0B2A _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0B2D _ 8B. 40, 10
        sub     edx, eax                                ; 0B30 _ 29. C2
        mov     eax, edx                                ; 0B32 _ 89. D0
        pop     ebp                                     ; 0B34 _ 5D
        ret                                             ; 0B35 _ C3
; fifo8_status End of function

mouse_decode:; Function begin
        push    ebp                                     ; 0B36 _ 55
        mov     ebp, esp                                ; 0B37 _ 89. E5
        sub     esp, 4                                  ; 0B39 _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 0B3C _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 0B3F _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0B42 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 0B45 _ 0F B6. 40, 03
        test    al, al                                  ; 0B49 _ 84. C0
        jnz     ?_048                                   ; 0B4B _ 75, 17
        cmp     byte [ebp-4H], -6                       ; 0B4D _ 80. 7D, FC, FA
        jnz     ?_047                                   ; 0B51 _ 75, 07
        mov     eax, dword [ebp+8H]                     ; 0B53 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 0B56 _ C6. 40, 03, 01
?_047:  mov     eax, 0                                  ; 0B5A _ B8, 00000000
        jmp     ?_055                                   ; 0B5F _ E9, 0000010F

?_048:  mov     eax, dword [ebp+8H]                     ; 0B64 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 0B67 _ 0F B6. 40, 03
        cmp     al, 1                                   ; 0B6B _ 3C, 01
        jnz     ?_050                                   ; 0B6D _ 75, 28
        movzx   eax, byte [ebp-4H]                      ; 0B6F _ 0F B6. 45, FC
        and     eax, 0C8H                               ; 0B73 _ 25, 000000C8
        cmp     eax, 8                                  ; 0B78 _ 83. F8, 08
        jnz     ?_049                                   ; 0B7B _ 75, 10
        mov     eax, dword [ebp+8H]                     ; 0B7D _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 0B80 _ 0F B6. 55, FC
        mov     byte [eax], dl                          ; 0B84 _ 88. 10
        mov     eax, dword [ebp+8H]                     ; 0B86 _ 8B. 45, 08
        mov     byte [eax+3H], 2                        ; 0B89 _ C6. 40, 03, 02
?_049:  mov     eax, 0                                  ; 0B8D _ B8, 00000000
        jmp     ?_055                                   ; 0B92 _ E9, 000000DC

?_050:  mov     eax, dword [ebp+8H]                     ; 0B97 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 0B9A _ 0F B6. 40, 03
        cmp     al, 2                                   ; 0B9E _ 3C, 02
        jnz     ?_051                                   ; 0BA0 _ 75, 1B
        mov     eax, dword [ebp+8H]                     ; 0BA2 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 0BA5 _ 0F B6. 55, FC
        mov     byte [eax+1H], dl                       ; 0BA9 _ 88. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0BAC _ 8B. 45, 08
        mov     byte [eax+3H], 3                        ; 0BAF _ C6. 40, 03, 03
        mov     eax, 0                                  ; 0BB3 _ B8, 00000000
        jmp     ?_055                                   ; 0BB8 _ E9, 000000B6

?_051:  mov     eax, dword [ebp+8H]                     ; 0BBD _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 0BC0 _ 0F B6. 40, 03
        cmp     al, 3                                   ; 0BC4 _ 3C, 03
        jne     ?_054                                   ; 0BC6 _ 0F 85, 000000A2
        mov     eax, dword [ebp+8H]                     ; 0BCC _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 0BCF _ 0F B6. 55, FC
        mov     byte [eax+2H], dl                       ; 0BD3 _ 88. 50, 02
        mov     eax, dword [ebp+8H]                     ; 0BD6 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 0BD9 _ C6. 40, 03, 01
        mov     eax, dword [ebp+8H]                     ; 0BDD _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 0BE0 _ 0F B6. 00
        movzx   eax, al                                 ; 0BE3 _ 0F B6. C0
        and     eax, 07H                                ; 0BE6 _ 83. E0, 07
        mov     edx, eax                                ; 0BE9 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0BEB _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 0BEE _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 0BF1 _ 8B. 45, 08
        movzx   eax, byte [eax+1H]                      ; 0BF4 _ 0F B6. 40, 01
        movzx   edx, al                                 ; 0BF8 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 0BFB _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 0BFE _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0C01 _ 8B. 45, 08
        movzx   eax, byte [eax+2H]                      ; 0C04 _ 0F B6. 40, 02
        movzx   edx, al                                 ; 0C08 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 0C0B _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0C0E _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 0C11 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 0C14 _ 0F B6. 00
        movzx   eax, al                                 ; 0C17 _ 0F B6. C0
        and     eax, 10H                                ; 0C1A _ 83. E0, 10
        test    eax, eax                                ; 0C1D _ 85. C0
        jz      ?_052                                   ; 0C1F _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 0C21 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0C24 _ 8B. 40, 04
        or      eax, 0FFFFFF00H                         ; 0C27 _ 0D, FFFFFF00
        mov     edx, eax                                ; 0C2C _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0C2E _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 0C31 _ 89. 50, 04
?_052:  mov     eax, dword [ebp+8H]                     ; 0C34 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 0C37 _ 0F B6. 00
        movzx   eax, al                                 ; 0C3A _ 0F B6. C0
        and     eax, 20H                                ; 0C3D _ 83. E0, 20
        test    eax, eax                                ; 0C40 _ 85. C0
        jz      ?_053                                   ; 0C42 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 0C44 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0C47 _ 8B. 40, 08
        or      eax, 0FFFFFF00H                         ; 0C4A _ 0D, FFFFFF00
        mov     edx, eax                                ; 0C4F _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0C51 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0C54 _ 89. 50, 08
?_053:  mov     eax, dword [ebp+8H]                     ; 0C57 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0C5A _ 8B. 40, 08
        neg     eax                                     ; 0C5D _ F7. D8
        mov     edx, eax                                ; 0C5F _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0C61 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0C64 _ 89. 50, 08
        mov     eax, 1                                  ; 0C67 _ B8, 00000001
        jmp     ?_055                                   ; 0C6C _ EB, 05

?_054:  mov     eax, 4294967295                         ; 0C6E _ B8, FFFFFFFF
?_055:  leave                                           ; 0C73 _ C9
        ret                                             ; 0C74 _ C3
; mouse_decode End of function

computeMousePosition:; Function begin
        push    ebp                                     ; 0C75 _ 55
        mov     ebp, esp                                ; 0C76 _ 89. E5
        sub     esp, 24                                 ; 0C78 _ 83. EC, 18
        movzx   eax, word [?_123]                       ; 0C7B _ 0F B7. 05, 00000004(d)
        cwde                                            ; 0C82 _ 98
        mov     dword [ebp-10H], eax                    ; 0C83 _ 89. 45, F0
        movzx   eax, word [?_124]                       ; 0C86 _ 0F B7. 05, 00000006(d)
        cwde                                            ; 0C8D _ 98
        mov     dword [ebp-0CH], eax                    ; 0C8E _ 89. 45, F4
        mov     eax, dword [ebp+10H]                    ; 0C91 _ 8B. 45, 10
        mov     edx, dword [eax+4H]                     ; 0C94 _ 8B. 50, 04
        mov     eax, dword [mx]                         ; 0C97 _ A1, 000000F0(d)
        add     eax, edx                                ; 0C9C _ 01. D0
        mov     dword [mx], eax                         ; 0C9E _ A3, 000000F0(d)
        mov     eax, dword [ebp+10H]                    ; 0CA3 _ 8B. 45, 10
        mov     edx, dword [eax+8H]                     ; 0CA6 _ 8B. 50, 08
        mov     eax, dword [my]                         ; 0CA9 _ A1, 000000F4(d)
        add     eax, edx                                ; 0CAE _ 01. D0
        mov     dword [my], eax                         ; 0CB0 _ A3, 000000F4(d)
        mov     eax, dword [mx]                         ; 0CB5 _ A1, 000000F0(d)
        test    eax, eax                                ; 0CBA _ 85. C0
        jns     ?_056                                   ; 0CBC _ 79, 0A
        mov     dword [mx], 0                           ; 0CBE _ C7. 05, 000000F0(d), 00000000
?_056:  mov     eax, dword [my]                         ; 0CC8 _ A1, 000000F4(d)
        test    eax, eax                                ; 0CCD _ 85. C0
        jns     ?_057                                   ; 0CCF _ 79, 0A
        mov     dword [my], 0                           ; 0CD1 _ C7. 05, 000000F4(d), 00000000
?_057:  mov     eax, dword [ebp-10H]                    ; 0CDB _ 8B. 45, F0
        lea     edx, [eax-10H]                          ; 0CDE _ 8D. 50, F0
        mov     eax, dword [mx]                         ; 0CE1 _ A1, 000000F0(d)
        cmp     edx, eax                                ; 0CE6 _ 39. C2
        jge     ?_058                                   ; 0CE8 _ 7D, 0B
        mov     eax, dword [ebp-10H]                    ; 0CEA _ 8B. 45, F0
        sub     eax, 16                                 ; 0CED _ 83. E8, 10
        mov     dword [mx], eax                         ; 0CF0 _ A3, 000000F0(d)
?_058:  mov     eax, dword [ebp-0CH]                    ; 0CF5 _ 8B. 45, F4
        lea     edx, [eax-10H]                          ; 0CF8 _ 8D. 50, F0
        mov     eax, dword [my]                         ; 0CFB _ A1, 000000F4(d)
        cmp     edx, eax                                ; 0D00 _ 39. C2
        jge     ?_059                                   ; 0D02 _ 7D, 0B
        mov     eax, dword [ebp-0CH]                    ; 0D04 _ 8B. 45, F4
        sub     eax, 16                                 ; 0D07 _ 83. E8, 10
        mov     dword [my], eax                         ; 0D0A _ A3, 000000F4(d)
?_059:  sub     esp, 8                                  ; 0D0F _ 83. EC, 08
        push    ?_114                                   ; 0D12 _ 68, 00000000(d)
        push    7                                       ; 0D17 _ 6A, 07
        push    0                                       ; 0D19 _ 6A, 00
        push    0                                       ; 0D1B _ 6A, 00
        push    dword [ebp+0CH]                         ; 0D1D _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0D20 _ FF. 75, 08
        call    showString                              ; 0D23 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0D28 _ 83. C4, 20
        nop                                             ; 0D2B _ 90
        leave                                           ; 0D2C _ C9
        ret                                             ; 0D2D _ C3
; computeMousePosition End of function

show_mouse_info:; Function begin
        push    ebp                                     ; 0D2E _ 55
        mov     ebp, esp                                ; 0D2F _ 89. E5
        sub     esp, 24                                 ; 0D31 _ 83. EC, 18
        mov     eax, dword [buf_back]                   ; 0D34 _ A1, 000000F8(d)
        mov     dword [ebp-0CH], eax                    ; 0D39 _ 89. 45, F4
        mov     byte [ebp-0DH], 0                       ; 0D3C _ C6. 45, F3, 00
        push    mouseinfo                               ; 0D40 _ 68, 00000008(d)
        call    fifo8_get                               ; 0D45 _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 0D4A _ 83. C4, 04
        mov     byte [ebp-0DH], al                      ; 0D4D _ 88. 45, F3
        movzx   eax, byte [ebp-0DH]                     ; 0D50 _ 0F B6. 45, F3
        push    eax                                     ; 0D54 _ 50
        push    mdec                                    ; 0D55 _ 68, 000000E0(d)
        call    mouse_decode                            ; 0D5A _ E8, FFFFFFFC(rel)
        add     esp, 8                                  ; 0D5F _ 83. C4, 08
        cmp     eax, 1                                  ; 0D62 _ 83. F8, 01
        jnz     ?_060                                   ; 0D65 _ 75, 31
        sub     esp, 4                                  ; 0D67 _ 83. EC, 04
        push    mdec                                    ; 0D6A _ 68, 000000E0(d)
        push    dword [ebp+0CH]                         ; 0D6F _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0D72 _ FF. 75, 08
        call    computeMousePosition                    ; 0D75 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0D7A _ 83. C4, 10
        mov     edx, dword [my]                         ; 0D7D _ 8B. 15, 000000F4(d)
        mov     eax, dword [mx]                         ; 0D83 _ A1, 000000F0(d)
        push    edx                                     ; 0D88 _ 52
        push    eax                                     ; 0D89 _ 50
        push    dword [ebp+10H]                         ; 0D8A _ FF. 75, 10
        push    dword [ebp+8H]                          ; 0D8D _ FF. 75, 08
        call    sheet_slide                             ; 0D90 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0D95 _ 83. C4, 10
?_060:  nop                                             ; 0D98 _ 90
        leave                                           ; 0D99 _ C9
        ret                                             ; 0D9A _ C3
; show_mouse_info End of function

showMemoryInfo:; Function begin
        push    ebp                                     ; 0D9B _ 55
        mov     ebp, esp                                ; 0D9C _ 89. E5
        sub     esp, 56                                 ; 0D9E _ 83. EC, 38
        mov     dword [ebp-30H], 0                      ; 0DA1 _ C7. 45, D0, 00000000
        mov     dword [ebp-2CH], 0                      ; 0DA8 _ C7. 45, D4, 00000000
        mov     dword [ebp-28H], 104                    ; 0DAF _ C7. 45, D8, 00000068
        mov     dword [ebp-24H], 80                     ; 0DB6 _ C7. 45, DC, 00000050
        mov     edx, dword [ysize]                      ; 0DBD _ 8B. 15, 00000204(d)
        mov     eax, dword [ebp+0CH]                    ; 0DC3 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 0DC6 _ 8B. 00
        sub     esp, 4                                  ; 0DC8 _ 83. EC, 04
        push    edx                                     ; 0DCB _ 52
        push    dword [ebp+1CH]                         ; 0DCC _ FF. 75, 1C
        push    eax                                     ; 0DCF _ 50
        call    init_screen8                            ; 0DD0 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0DD5 _ 83. C4, 10
        mov     eax, dword [ebp+20H]                    ; 0DD8 _ 8B. 45, 20
        movsx   eax, al                                 ; 0DDB _ 0F BE. C0
        sub     esp, 8                                  ; 0DDE _ 83. EC, 08
        push    ?_115                                   ; 0DE1 _ 68, 00000018(d)
        push    eax                                     ; 0DE6 _ 50
        push    dword [ebp-2CH]                         ; 0DE7 _ FF. 75, D4
        push    dword [ebp-30H]                         ; 0DEA _ FF. 75, D0
        push    dword [ebp+0CH]                         ; 0DED _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0DF0 _ FF. 75, 08
        call    showString                              ; 0DF3 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0DF8 _ 83. C4, 20
        mov     eax, dword [ebp+18H]                    ; 0DFB _ 8B. 45, 18
        sub     esp, 12                                 ; 0DFE _ 83. EC, 0C
        push    eax                                     ; 0E01 _ 50
        call    intToHexStr                             ; 0E02 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0E07 _ 83. C4, 10
        mov     dword [ebp-20H], eax                    ; 0E0A _ 89. 45, E0
        mov     eax, dword [ebp+20H]                    ; 0E0D _ 8B. 45, 20
        movsx   eax, al                                 ; 0E10 _ 0F BE. C0
        sub     esp, 8                                  ; 0E13 _ 83. EC, 08
        push    dword [ebp-20H]                         ; 0E16 _ FF. 75, E0
        push    eax                                     ; 0E19 _ 50
        push    dword [ebp-2CH]                         ; 0E1A _ FF. 75, D4
        push    dword [ebp-28H]                         ; 0E1D _ FF. 75, D8
        push    dword [ebp+0CH]                         ; 0E20 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0E23 _ FF. 75, 08
        call    showString                              ; 0E26 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0E2B _ 83. C4, 20
        add     dword [ebp-2CH], 16                     ; 0E2E _ 83. 45, D4, 10
        mov     eax, dword [ebp+20H]                    ; 0E32 _ 8B. 45, 20
        movsx   eax, al                                 ; 0E35 _ 0F BE. C0
        sub     esp, 8                                  ; 0E38 _ 83. EC, 08
        push    ?_116                                   ; 0E3B _ 68, 00000022(d)
        push    eax                                     ; 0E40 _ 50
        push    dword [ebp-2CH]                         ; 0E41 _ FF. 75, D4
        push    dword [ebp-30H]                         ; 0E44 _ FF. 75, D0
        push    dword [ebp+0CH]                         ; 0E47 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0E4A _ FF. 75, 08
        call    showString                              ; 0E4D _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0E52 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0E55 _ 8B. 45, 10
        mov     eax, dword [eax]                        ; 0E58 _ 8B. 00
        sub     esp, 12                                 ; 0E5A _ 83. EC, 0C
        push    eax                                     ; 0E5D _ 50
        call    intToHexStr                             ; 0E5E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0E63 _ 83. C4, 10
        mov     dword [ebp-1CH], eax                    ; 0E66 _ 89. 45, E4
        mov     eax, dword [ebp+20H]                    ; 0E69 _ 8B. 45, 20
        movsx   eax, al                                 ; 0E6C _ 0F BE. C0
        sub     esp, 8                                  ; 0E6F _ 83. EC, 08
        push    dword [ebp-1CH]                         ; 0E72 _ FF. 75, E4
        push    eax                                     ; 0E75 _ 50
        push    dword [ebp-2CH]                         ; 0E76 _ FF. 75, D4
        push    dword [ebp-28H]                         ; 0E79 _ FF. 75, D8
        push    dword [ebp+0CH]                         ; 0E7C _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0E7F _ FF. 75, 08
        call    showString                              ; 0E82 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0E87 _ 83. C4, 20
        add     dword [ebp-2CH], 16                     ; 0E8A _ 83. 45, D4, 10
        mov     eax, dword [ebp+20H]                    ; 0E8E _ 8B. 45, 20
        movsx   eax, al                                 ; 0E91 _ 0F BE. C0
        sub     esp, 8                                  ; 0E94 _ 83. EC, 08
        push    ?_117                                   ; 0E97 _ 68, 0000002E(d)
        push    eax                                     ; 0E9C _ 50
        push    dword [ebp-2CH]                         ; 0E9D _ FF. 75, D4
        push    dword [ebp-30H]                         ; 0EA0 _ FF. 75, D0
        push    dword [ebp+0CH]                         ; 0EA3 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0EA6 _ FF. 75, 08
        call    showString                              ; 0EA9 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0EAE _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0EB1 _ 8B. 45, 10
        mov     eax, dword [eax+4H]                     ; 0EB4 _ 8B. 40, 04
        sub     esp, 12                                 ; 0EB7 _ 83. EC, 0C
        push    eax                                     ; 0EBA _ 50
        call    intToHexStr                             ; 0EBB _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0EC0 _ 83. C4, 10
        mov     dword [ebp-18H], eax                    ; 0EC3 _ 89. 45, E8
        mov     eax, dword [ebp+20H]                    ; 0EC6 _ 8B. 45, 20
        movsx   eax, al                                 ; 0EC9 _ 0F BE. C0
        sub     esp, 8                                  ; 0ECC _ 83. EC, 08
        push    dword [ebp-18H]                         ; 0ECF _ FF. 75, E8
        push    eax                                     ; 0ED2 _ 50
        push    dword [ebp-2CH]                         ; 0ED3 _ FF. 75, D4
        push    dword [ebp-28H]                         ; 0ED6 _ FF. 75, D8
        push    dword [ebp+0CH]                         ; 0ED9 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0EDC _ FF. 75, 08
        call    showString                              ; 0EDF _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0EE4 _ 83. C4, 20
        add     dword [ebp-2CH], 16                     ; 0EE7 _ 83. 45, D4, 10
        mov     eax, dword [ebp+20H]                    ; 0EEB _ 8B. 45, 20
        movsx   eax, al                                 ; 0EEE _ 0F BE. C0
        sub     esp, 8                                  ; 0EF1 _ 83. EC, 08
        push    ?_118                                   ; 0EF4 _ 68, 0000003A(d)
        push    eax                                     ; 0EF9 _ 50
        push    dword [ebp-2CH]                         ; 0EFA _ FF. 75, D4
        push    dword [ebp-30H]                         ; 0EFD _ FF. 75, D0
        push    dword [ebp+0CH]                         ; 0F00 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0F03 _ FF. 75, 08
        call    showString                              ; 0F06 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0F0B _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0F0E _ 8B. 45, 10
        mov     eax, dword [eax+8H]                     ; 0F11 _ 8B. 40, 08
        sub     esp, 12                                 ; 0F14 _ 83. EC, 0C
        push    eax                                     ; 0F17 _ 50
        call    intToHexStr                             ; 0F18 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0F1D _ 83. C4, 10
        mov     dword [ebp-14H], eax                    ; 0F20 _ 89. 45, EC
        mov     eax, dword [ebp+20H]                    ; 0F23 _ 8B. 45, 20
        movsx   eax, al                                 ; 0F26 _ 0F BE. C0
        sub     esp, 8                                  ; 0F29 _ 83. EC, 08
        push    dword [ebp-14H]                         ; 0F2C _ FF. 75, EC
        push    eax                                     ; 0F2F _ 50
        push    dword [ebp-2CH]                         ; 0F30 _ FF. 75, D4
        push    dword [ebp-28H]                         ; 0F33 _ FF. 75, D8
        push    dword [ebp+0CH]                         ; 0F36 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0F39 _ FF. 75, 08
        call    showString                              ; 0F3C _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0F41 _ 83. C4, 20
        add     dword [ebp-2CH], 16                     ; 0F44 _ 83. 45, D4, 10
        mov     eax, dword [ebp+20H]                    ; 0F48 _ 8B. 45, 20
        movsx   eax, al                                 ; 0F4B _ 0F BE. C0
        sub     esp, 8                                  ; 0F4E _ 83. EC, 08
        push    ?_119                                   ; 0F51 _ 68, 00000046(d)
        push    eax                                     ; 0F56 _ 50
        push    dword [ebp-2CH]                         ; 0F57 _ FF. 75, D4
        push    dword [ebp-30H]                         ; 0F5A _ FF. 75, D0
        push    dword [ebp+0CH]                         ; 0F5D _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0F60 _ FF. 75, 08
        call    showString                              ; 0F63 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0F68 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0F6B _ 8B. 45, 10
        mov     eax, dword [eax+0CH]                    ; 0F6E _ 8B. 40, 0C
        sub     esp, 12                                 ; 0F71 _ 83. EC, 0C
        push    eax                                     ; 0F74 _ 50
        call    intToHexStr                             ; 0F75 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0F7A _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 0F7D _ 89. 45, F0
        mov     eax, dword [ebp+20H]                    ; 0F80 _ 8B. 45, 20
        movsx   eax, al                                 ; 0F83 _ 0F BE. C0
        sub     esp, 8                                  ; 0F86 _ 83. EC, 08
        push    dword [ebp-10H]                         ; 0F89 _ FF. 75, F0
        push    eax                                     ; 0F8C _ 50
        push    dword [ebp-2CH]                         ; 0F8D _ FF. 75, D4
        push    dword [ebp-28H]                         ; 0F90 _ FF. 75, D8
        push    dword [ebp+0CH]                         ; 0F93 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0F96 _ FF. 75, 08
        call    showString                              ; 0F99 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0F9E _ 83. C4, 20
        add     dword [ebp-2CH], 16                     ; 0FA1 _ 83. 45, D4, 10
        mov     eax, dword [ebp+20H]                    ; 0FA5 _ 8B. 45, 20
        movsx   eax, al                                 ; 0FA8 _ 0F BE. C0
        sub     esp, 8                                  ; 0FAB _ 83. EC, 08
        push    ?_120                                   ; 0FAE _ 68, 00000053(d)
        push    eax                                     ; 0FB3 _ 50
        push    dword [ebp-2CH]                         ; 0FB4 _ FF. 75, D4
        push    dword [ebp-30H]                         ; 0FB7 _ FF. 75, D0
        push    dword [ebp+0CH]                         ; 0FBA _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0FBD _ FF. 75, 08
        call    showString                              ; 0FC0 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0FC5 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0FC8 _ 8B. 45, 10
        mov     eax, dword [eax+10H]                    ; 0FCB _ 8B. 40, 10
        sub     esp, 12                                 ; 0FCE _ 83. EC, 0C
        push    eax                                     ; 0FD1 _ 50
        call    intToHexStr                             ; 0FD2 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0FD7 _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 0FDA _ 89. 45, F4
        mov     eax, dword [ebp+20H]                    ; 0FDD _ 8B. 45, 20
        movsx   eax, al                                 ; 0FE0 _ 0F BE. C0
        sub     esp, 8                                  ; 0FE3 _ 83. EC, 08
        push    dword [ebp-0CH]                         ; 0FE6 _ FF. 75, F4
        push    eax                                     ; 0FE9 _ 50
        push    dword [ebp-2CH]                         ; 0FEA _ FF. 75, D4
        push    dword [ebp-28H]                         ; 0FED _ FF. 75, D8
        push    dword [ebp+0CH]                         ; 0FF0 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0FF3 _ FF. 75, 08
        call    showString                              ; 0FF6 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0FFB _ 83. C4, 20
        nop                                             ; 0FFE _ 90
        leave                                           ; 0FFF _ C9
        ret                                             ; 1000 _ C3
; showMemoryInfo End of function

init_screen8:; Function begin
        push    ebp                                     ; 1001 _ 55
        mov     ebp, esp                                ; 1002 _ 89. E5
        push    ebx                                     ; 1004 _ 53
        mov     eax, dword [ebp+10H]                    ; 1005 _ 8B. 45, 10
        lea     edx, [eax-1DH]                          ; 1008 _ 8D. 50, E3
        mov     eax, dword [ebp+0CH]                    ; 100B _ 8B. 45, 0C
        sub     eax, 1                                  ; 100E _ 83. E8, 01
        push    edx                                     ; 1011 _ 52
        push    eax                                     ; 1012 _ 50
        push    0                                       ; 1013 _ 6A, 00
        push    0                                       ; 1015 _ 6A, 00
        push    14                                      ; 1017 _ 6A, 0E
        push    dword [ebp+0CH]                         ; 1019 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 101C _ FF. 75, 08
        call    boxfill8                                ; 101F _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1024 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 1027 _ 8B. 45, 10
        lea     ecx, [eax-1CH]                          ; 102A _ 8D. 48, E4
        mov     eax, dword [ebp+0CH]                    ; 102D _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 1030 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 1033 _ 8B. 45, 10
        sub     eax, 28                                 ; 1036 _ 83. E8, 1C
        push    ecx                                     ; 1039 _ 51
        push    edx                                     ; 103A _ 52
        push    eax                                     ; 103B _ 50
        push    0                                       ; 103C _ 6A, 00
        push    8                                       ; 103E _ 6A, 08
        push    dword [ebp+0CH]                         ; 1040 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1043 _ FF. 75, 08
        call    boxfill8                                ; 1046 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 104B _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 104E _ 8B. 45, 10
        lea     ecx, [eax-1BH]                          ; 1051 _ 8D. 48, E5
        mov     eax, dword [ebp+0CH]                    ; 1054 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 1057 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 105A _ 8B. 45, 10
        sub     eax, 27                                 ; 105D _ 83. E8, 1B
        push    ecx                                     ; 1060 _ 51
        push    edx                                     ; 1061 _ 52
        push    eax                                     ; 1062 _ 50
        push    0                                       ; 1063 _ 6A, 00
        push    7                                       ; 1065 _ 6A, 07
        push    dword [ebp+0CH]                         ; 1067 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 106A _ FF. 75, 08
        call    boxfill8                                ; 106D _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1072 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 1075 _ 8B. 45, 10
        lea     ecx, [eax-1H]                           ; 1078 _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 107B _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 107E _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 1081 _ 8B. 45, 10
        sub     eax, 26                                 ; 1084 _ 83. E8, 1A
        push    ecx                                     ; 1087 _ 51
        push    edx                                     ; 1088 _ 52
        push    eax                                     ; 1089 _ 50
        push    0                                       ; 108A _ 6A, 00
        push    8                                       ; 108C _ 6A, 08
        push    dword [ebp+0CH]                         ; 108E _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1091 _ FF. 75, 08
        call    boxfill8                                ; 1094 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1099 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 109C _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 109F _ 8D. 50, E8
        mov     eax, dword [ebp+10H]                    ; 10A2 _ 8B. 45, 10
        sub     eax, 24                                 ; 10A5 _ 83. E8, 18
        push    edx                                     ; 10A8 _ 52
        push    59                                      ; 10A9 _ 6A, 3B
        push    eax                                     ; 10AB _ 50
        push    3                                       ; 10AC _ 6A, 03
        push    7                                       ; 10AE _ 6A, 07
        push    dword [ebp+0CH]                         ; 10B0 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 10B3 _ FF. 75, 08
        call    boxfill8                                ; 10B6 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 10BB _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 10BE _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 10C1 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 10C4 _ 8B. 45, 10
        sub     eax, 24                                 ; 10C7 _ 83. E8, 18
        push    edx                                     ; 10CA _ 52
        push    2                                       ; 10CB _ 6A, 02
        push    eax                                     ; 10CD _ 50
        push    2                                       ; 10CE _ 6A, 02
        push    7                                       ; 10D0 _ 6A, 07
        push    dword [ebp+0CH]                         ; 10D2 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 10D5 _ FF. 75, 08
        call    boxfill8                                ; 10D8 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 10DD _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 10E0 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 10E3 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 10E6 _ 8B. 45, 10
        sub     eax, 4                                  ; 10E9 _ 83. E8, 04
        push    edx                                     ; 10EC _ 52
        push    59                                      ; 10ED _ 6A, 3B
        push    eax                                     ; 10EF _ 50
        push    3                                       ; 10F0 _ 6A, 03
        push    15                                      ; 10F2 _ 6A, 0F
        push    dword [ebp+0CH]                         ; 10F4 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 10F7 _ FF. 75, 08
        call    boxfill8                                ; 10FA _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 10FF _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 1102 _ 8B. 45, 10
        lea     edx, [eax-5H]                           ; 1105 _ 8D. 50, FB
        mov     eax, dword [ebp+10H]                    ; 1108 _ 8B. 45, 10
        sub     eax, 23                                 ; 110B _ 83. E8, 17
        push    edx                                     ; 110E _ 52
        push    59                                      ; 110F _ 6A, 3B
        push    eax                                     ; 1111 _ 50
        push    59                                      ; 1112 _ 6A, 3B
        push    15                                      ; 1114 _ 6A, 0F
        push    dword [ebp+0CH]                         ; 1116 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1119 _ FF. 75, 08
        call    boxfill8                                ; 111C _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1121 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 1124 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 1127 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 112A _ 8B. 45, 10
        sub     eax, 3                                  ; 112D _ 83. E8, 03
        push    edx                                     ; 1130 _ 52
        push    59                                      ; 1131 _ 6A, 3B
        push    eax                                     ; 1133 _ 50
        push    2                                       ; 1134 _ 6A, 02
        push    0                                       ; 1136 _ 6A, 00
        push    dword [ebp+0CH]                         ; 1138 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 113B _ FF. 75, 08
        call    boxfill8                                ; 113E _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1143 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 1146 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 1149 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 114C _ 8B. 45, 10
        sub     eax, 24                                 ; 114F _ 83. E8, 18
        push    edx                                     ; 1152 _ 52
        push    60                                      ; 1153 _ 6A, 3C
        push    eax                                     ; 1155 _ 50
        push    60                                      ; 1156 _ 6A, 3C
        push    0                                       ; 1158 _ 6A, 00
        push    dword [ebp+0CH]                         ; 115A _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 115D _ FF. 75, 08
        call    boxfill8                                ; 1160 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1165 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 1168 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 116B _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 116E _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 1171 _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 1174 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 1177 _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 117A _ 8B. 45, 0C
        sub     eax, 47                                 ; 117D _ 83. E8, 2F
        push    ebx                                     ; 1180 _ 53
        push    ecx                                     ; 1181 _ 51
        push    edx                                     ; 1182 _ 52
        push    eax                                     ; 1183 _ 50
        push    7                                       ; 1184 _ 6A, 07
        push    dword [ebp+0CH]                         ; 1186 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1189 _ FF. 75, 08
        call    boxfill8                                ; 118C _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1191 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 1194 _ 8B. 45, 10
        lea     ebx, [eax-4H]                           ; 1197 _ 8D. 58, FC
        mov     eax, dword [ebp+0CH]                    ; 119A _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 119D _ 8D. 48, FD
        mov     eax, dword [ebp+10H]                    ; 11A0 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 11A3 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 11A6 _ 8B. 45, 0C
        sub     eax, 3                                  ; 11A9 _ 83. E8, 03
        push    ebx                                     ; 11AC _ 53
        push    ecx                                     ; 11AD _ 51
        push    edx                                     ; 11AE _ 52
        push    eax                                     ; 11AF _ 50
        push    7                                       ; 11B0 _ 6A, 07
        push    dword [ebp+0CH]                         ; 11B2 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 11B5 _ FF. 75, 08
        call    boxfill8                                ; 11B8 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 11BD _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 11C0 _ 8B. 45, 10
        lea     ebx, [eax-18H]                          ; 11C3 _ 8D. 58, E8
        mov     eax, dword [ebp+0CH]                    ; 11C6 _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 11C9 _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 11CC _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 11CF _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 11D2 _ 8B. 45, 0C
        sub     eax, 47                                 ; 11D5 _ 83. E8, 2F
        push    ebx                                     ; 11D8 _ 53
        push    ecx                                     ; 11D9 _ 51
        push    edx                                     ; 11DA _ 52
        push    eax                                     ; 11DB _ 50
        push    15                                      ; 11DC _ 6A, 0F
        push    dword [ebp+0CH]                         ; 11DE _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 11E1 _ FF. 75, 08
        call    boxfill8                                ; 11E4 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 11E9 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 11EC _ 8B. 45, 10
        lea     ebx, [eax-4H]                           ; 11EF _ 8D. 58, FC
        mov     eax, dword [ebp+0CH]                    ; 11F2 _ 8B. 45, 0C
        lea     ecx, [eax-2FH]                          ; 11F5 _ 8D. 48, D1
        mov     eax, dword [ebp+10H]                    ; 11F8 _ 8B. 45, 10
        lea     edx, [eax-17H]                          ; 11FB _ 8D. 50, E9
        mov     eax, dword [ebp+0CH]                    ; 11FE _ 8B. 45, 0C
        sub     eax, 47                                 ; 1201 _ 83. E8, 2F
        push    ebx                                     ; 1204 _ 53
        push    ecx                                     ; 1205 _ 51
        push    edx                                     ; 1206 _ 52
        push    eax                                     ; 1207 _ 50
        push    15                                      ; 1208 _ 6A, 0F
        push    dword [ebp+0CH]                         ; 120A _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 120D _ FF. 75, 08
        call    boxfill8                                ; 1210 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1215 _ 83. C4, 1C
        nop                                             ; 1218 _ 90
        mov     ebx, dword [ebp-4H]                     ; 1219 _ 8B. 5D, FC
        leave                                           ; 121C _ C9
        ret                                             ; 121D _ C3
; init_screen8 End of function

memman_init:; Function begin
        push    ebp                                     ; 121E _ 55
        mov     ebp, esp                                ; 121F _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 1221 _ 8B. 45, 08
        mov     dword [eax], 0                          ; 1224 _ C7. 00, 00000000
        mov     eax, dword [ebp+8H]                     ; 122A _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 122D _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 1234 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 1237 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 123E _ 8B. 45, 08
        mov     dword [eax+0CH], 0                      ; 1241 _ C7. 40, 0C, 00000000
        nop                                             ; 1248 _ 90
        pop     ebp                                     ; 1249 _ 5D
        ret                                             ; 124A _ C3
; memman_init End of function

memman_total:; Function begin
        push    ebp                                     ; 124B _ 55
        mov     ebp, esp                                ; 124C _ 89. E5
        sub     esp, 16                                 ; 124E _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 1251 _ C7. 45, FC, 00000000
        mov     dword [ebp-8H], 0                       ; 1258 _ C7. 45, F8, 00000000
        jmp     ?_062                                   ; 125F _ EB, 14

?_061:  mov     eax, dword [ebp+8H]                     ; 1261 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1264 _ 8B. 55, F8
        add     edx, 2                                  ; 1267 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 126A _ 8B. 44 D0, 04
        add     dword [ebp-4H], eax                     ; 126E _ 01. 45, FC
        add     dword [ebp-8H], 1                       ; 1271 _ 83. 45, F8, 01
?_062:  mov     eax, dword [ebp+8H]                     ; 1275 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1278 _ 8B. 00
        cmp     dword [ebp-8H], eax                     ; 127A _ 39. 45, F8
        jc      ?_061                                   ; 127D _ 72, E2
        mov     eax, dword [ebp-4H]                     ; 127F _ 8B. 45, FC
        leave                                           ; 1282 _ C9
        ret                                             ; 1283 _ C3
; memman_total End of function

memman_alloc:; Function begin
        push    ebp                                     ; 1284 _ 55
        mov     ebp, esp                                ; 1285 _ 89. E5
        sub     esp, 16                                 ; 1287 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 128A _ C7. 45, F8, 00000000
        jmp     ?_066                                   ; 1291 _ E9, 00000085

?_063:  mov     eax, dword [ebp+8H]                     ; 1296 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1299 _ 8B. 55, F8
        add     edx, 2                                  ; 129C _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 129F _ 8B. 44 D0, 04
        cmp     dword [ebp+0CH], eax                    ; 12A3 _ 39. 45, 0C
        ja      ?_065                                   ; 12A6 _ 77, 6F
        mov     eax, dword [ebp+8H]                     ; 12A8 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 12AB _ 8B. 55, F8
        add     edx, 2                                  ; 12AE _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 12B1 _ 8B. 04 D0
        mov     dword [ebp-4H], eax                     ; 12B4 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 12B7 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 12BA _ 8B. 55, F8
        add     edx, 2                                  ; 12BD _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 12C0 _ 8B. 14 D0
        mov     eax, dword [ebp+0CH]                    ; 12C3 _ 8B. 45, 0C
        lea     ecx, [edx+eax]                          ; 12C6 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 12C9 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 12CC _ 8B. 55, F8
        add     edx, 2                                  ; 12CF _ 83. C2, 02
        mov     dword [eax+edx*8], ecx                  ; 12D2 _ 89. 0C D0
        mov     eax, dword [ebp+8H]                     ; 12D5 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 12D8 _ 8B. 55, F8
        add     edx, 2                                  ; 12DB _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 12DE _ 8B. 44 D0, 04
        sub     eax, dword [ebp+0CH]                    ; 12E2 _ 2B. 45, 0C
        mov     edx, eax                                ; 12E5 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 12E7 _ 8B. 45, 08
        mov     ecx, dword [ebp-8H]                     ; 12EA _ 8B. 4D, F8
        add     ecx, 2                                  ; 12ED _ 83. C1, 02
        mov     dword [eax+ecx*8+4H], edx               ; 12F0 _ 89. 54 C8, 04
        mov     eax, dword [ebp+8H]                     ; 12F4 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 12F7 _ 8B. 55, F8
        add     edx, 2                                  ; 12FA _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 12FD _ 8B. 44 D0, 04
        test    eax, eax                                ; 1301 _ 85. C0
        jnz     ?_064                                   ; 1303 _ 75, 0D
        mov     eax, dword [ebp+8H]                     ; 1305 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1308 _ 8B. 00
        lea     edx, [eax-1H]                           ; 130A _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 130D _ 8B. 45, 08
        mov     dword [eax], edx                        ; 1310 _ 89. 10
?_064:  mov     eax, dword [ebp-4H]                     ; 1312 _ 8B. 45, FC
        jmp     ?_067                                   ; 1315 _ EB, 17

?_065:  add     dword [ebp-8H], 1                       ; 1317 _ 83. 45, F8, 01
?_066:  mov     eax, dword [ebp+8H]                     ; 131B _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 131E _ 8B. 00
        cmp     dword [ebp-8H], eax                     ; 1320 _ 39. 45, F8
        jc      ?_063                                   ; 1323 _ 0F 82, FFFFFF6D
        mov     eax, 0                                  ; 1329 _ B8, 00000000
?_067:  leave                                           ; 132E _ C9
        ret                                             ; 132F _ C3
; memman_alloc End of function

memman_free:; Function begin
        push    ebp                                     ; 1330 _ 55
        mov     ebp, esp                                ; 1331 _ 89. E5
        push    ebx                                     ; 1333 _ 53
        sub     esp, 16                                 ; 1334 _ 83. EC, 10
        mov     dword [ebp-0CH], 0                      ; 1337 _ C7. 45, F4, 00000000
        jmp     ?_069                                   ; 133E _ EB, 15

?_068:  mov     eax, dword [ebp+8H]                     ; 1340 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1343 _ 8B. 55, F4
        add     edx, 2                                  ; 1346 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 1349 _ 8B. 04 D0
        cmp     dword [ebp+0CH], eax                    ; 134C _ 39. 45, 0C
        jc      ?_070                                   ; 134F _ 72, 10
        add     dword [ebp-0CH], 1                      ; 1351 _ 83. 45, F4, 01
?_069:  mov     eax, dword [ebp+8H]                     ; 1355 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1358 _ 8B. 00
        cmp     dword [ebp-0CH], eax                    ; 135A _ 39. 45, F4
        jl      ?_068                                   ; 135D _ 7C, E1
        jmp     ?_071                                   ; 135F _ EB, 01

?_070:  nop                                             ; 1361 _ 90
?_071:  cmp     dword [ebp-0CH], 0                      ; 1362 _ 83. 7D, F4, 00
        jle     ?_073                                   ; 1366 _ 0F 8E, 000000B9
        mov     eax, dword [ebp-0CH]                    ; 136C _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 136F _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1372 _ 8B. 45, 08
        add     edx, 2                                  ; 1375 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 1378 _ 8B. 14 D0
        mov     eax, dword [ebp-0CH]                    ; 137B _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 137E _ 8D. 48, FF
        mov     eax, dword [ebp+8H]                     ; 1381 _ 8B. 45, 08
        add     ecx, 2                                  ; 1384 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 1387 _ 8B. 44 C8, 04
        add     eax, edx                                ; 138B _ 01. D0
        cmp     dword [ebp+0CH], eax                    ; 138D _ 39. 45, 0C
        jne     ?_073                                   ; 1390 _ 0F 85, 0000008F
        mov     eax, dword [ebp-0CH]                    ; 1396 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1399 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 139C _ 8B. 45, 08
        add     edx, 2                                  ; 139F _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 13A2 _ 8B. 54 D0, 04
        mov     eax, dword [ebp-0CH]                    ; 13A6 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 13A9 _ 8D. 58, FF
        mov     eax, dword [ebp+10H]                    ; 13AC _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 13AF _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 13B2 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 13B5 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 13B8 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 13BC _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 13BF _ 8B. 00
        test    eax, eax                                ; 13C1 _ 85. C0
        jle     ?_072                                   ; 13C3 _ 7E, 56
        mov     edx, dword [ebp+0CH]                    ; 13C5 _ 8B. 55, 0C
        mov     eax, dword [ebp+10H]                    ; 13C8 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 13CB _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 13CE _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 13D1 _ 8B. 55, F4
        add     edx, 2                                  ; 13D4 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 13D7 _ 8B. 04 D0
        cmp     ecx, eax                                ; 13DA _ 39. C1
        jnz     ?_072                                   ; 13DC _ 75, 3D
        mov     eax, dword [ebp-0CH]                    ; 13DE _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 13E1 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 13E4 _ 8B. 45, 08
        add     edx, 2                                  ; 13E7 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 13EA _ 8B. 54 D0, 04
        mov     eax, dword [ebp+8H]                     ; 13EE _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 13F1 _ 8B. 4D, F4
        add     ecx, 2                                  ; 13F4 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 13F7 _ 8B. 44 C8, 04
        mov     ecx, dword [ebp-0CH]                    ; 13FB _ 8B. 4D, F4
        lea     ebx, [ecx-1H]                           ; 13FE _ 8D. 59, FF
        lea     ecx, [edx+eax]                          ; 1401 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1404 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 1407 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 140A _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 140E _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1411 _ 8B. 00
        lea     edx, [eax-1H]                           ; 1413 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1416 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 1419 _ 89. 10
?_072:  mov     eax, 0                                  ; 141B _ B8, 00000000
        jmp     ?_079                                   ; 1420 _ E9, 0000011B

?_073:  mov     eax, dword [ebp+8H]                     ; 1425 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1428 _ 8B. 00
        test    eax, eax                                ; 142A _ 85. C0
        jle     ?_074                                   ; 142C _ 7E, 52
        mov     edx, dword [ebp+0CH]                    ; 142E _ 8B. 55, 0C
        mov     eax, dword [ebp+10H]                    ; 1431 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 1434 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1437 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 143A _ 8B. 55, F4
        add     edx, 2                                  ; 143D _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 1440 _ 8B. 04 D0
        cmp     ecx, eax                                ; 1443 _ 39. C1
        jnz     ?_074                                   ; 1445 _ 75, 39
        mov     eax, dword [ebp+8H]                     ; 1447 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 144A _ 8B. 55, F4
        add     edx, 2                                  ; 144D _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 1450 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 1454 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 1457 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 145A _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 145D _ 8B. 55, F4
        add     edx, 2                                  ; 1460 _ 83. C2, 02
        mov     dword [eax+edx*8+4H], ecx               ; 1463 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 1467 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 146A _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 146D _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 1470 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 1473 _ 89. 14 C8
        mov     eax, 0                                  ; 1476 _ B8, 00000000
        jmp     ?_079                                   ; 147B _ E9, 000000C0

?_074:  mov     eax, dword [ebp+8H]                     ; 1480 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1483 _ 8B. 00
        cmp     eax, 4095                               ; 1485 _ 3D, 00000FFF
        jg      ?_078                                   ; 148A _ 0F 8F, 00000087
        mov     eax, dword [ebp+8H]                     ; 1490 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1493 _ 8B. 00
        lea     edx, [eax+1H]                           ; 1495 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1498 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 149B _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 149D _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 14A0 _ 8B. 00
        mov     dword [ebp-8H], eax                     ; 14A2 _ 89. 45, F8
        jmp     ?_076                                   ; 14A5 _ EB, 28

?_075:  mov     eax, dword [ebp-8H]                     ; 14A7 _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 14AA _ 8D. 50, FF
        mov     ecx, dword [ebp+8H]                     ; 14AD _ 8B. 4D, 08
        mov     eax, dword [ebp-8H]                     ; 14B0 _ 8B. 45, F8
        lea     ebx, [eax+2H]                           ; 14B3 _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 14B6 _ 8B. 45, 08
        add     edx, 2                                  ; 14B9 _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 14BC _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 14BF _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 14C1 _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 14C4 _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 14C7 _ 89. 54 D9, 04
        sub     dword [ebp-8H], 1                       ; 14CB _ 83. 6D, F8, 01
?_076:  mov     eax, dword [ebp-8H]                     ; 14CF _ 8B. 45, F8
        cmp     eax, dword [ebp-0CH]                    ; 14D2 _ 3B. 45, F4
        jg      ?_075                                   ; 14D5 _ 7F, D0
        mov     eax, dword [ebp+8H]                     ; 14D7 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 14DA _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 14DD _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 14E0 _ 8B. 00
        cmp     edx, eax                                ; 14E2 _ 39. C2
        jge     ?_077                                   ; 14E4 _ 7D, 0B
        mov     eax, dword [ebp+8H]                     ; 14E6 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 14E9 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 14EB _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 14EE _ 89. 50, 04
?_077:  mov     eax, dword [ebp+8H]                     ; 14F1 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 14F4 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 14F7 _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 14FA _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 14FD _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 1500 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1503 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 1506 _ 8D. 4A, 02
        mov     edx, dword [ebp+10H]                    ; 1509 _ 8B. 55, 10
        mov     dword [eax+ecx*8+4H], edx               ; 150C _ 89. 54 C8, 04
        mov     eax, 0                                  ; 1510 _ B8, 00000000
        jmp     ?_079                                   ; 1515 _ EB, 29

?_078:  mov     eax, dword [ebp+8H]                     ; 1517 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 151A _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 151D _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1520 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 1523 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 1526 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 1529 _ 8B. 40, 08
        mov     edx, eax                                ; 152C _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 152E _ 8B. 45, 10
        add     eax, edx                                ; 1531 _ 01. D0
        mov     edx, eax                                ; 1533 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1535 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 1538 _ 89. 50, 08
        mov     eax, 4294967295                         ; 153B _ B8, FFFFFFFF
?_079:  add     esp, 16                                 ; 1540 _ 83. C4, 10
        pop     ebx                                     ; 1543 _ 5B
        pop     ebp                                     ; 1544 _ 5D
        ret                                             ; 1545 _ C3
; memman_free End of function

memman_alloc_4k:; Function begin
        push    ebp                                     ; 1546 _ 55
        mov     ebp, esp                                ; 1547 _ 89. E5
        sub     esp, 16                                 ; 1549 _ 83. EC, 10
        mov     eax, dword [ebp+0CH]                    ; 154C _ 8B. 45, 0C
        add     eax, 4095                               ; 154F _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 1554 _ 25, FFFFF000
        mov     dword [ebp+0CH], eax                    ; 1559 _ 89. 45, 0C
        push    dword [ebp+0CH]                         ; 155C _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 155F _ FF. 75, 08
        call    memman_alloc                            ; 1562 _ E8, FFFFFFFC(rel)
        add     esp, 8                                  ; 1567 _ 83. C4, 08
        mov     dword [ebp-4H], eax                     ; 156A _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 156D _ 8B. 45, FC
        leave                                           ; 1570 _ C9
        ret                                             ; 1571 _ C3
; memman_alloc_4k End of function

memman_free_4k:; Function begin
        push    ebp                                     ; 1572 _ 55
        mov     ebp, esp                                ; 1573 _ 89. E5
        sub     esp, 16                                 ; 1575 _ 83. EC, 10
        mov     eax, dword [ebp+10H]                    ; 1578 _ 8B. 45, 10
        add     eax, 4095                               ; 157B _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 1580 _ 25, FFFFF000
        mov     dword [ebp+10H], eax                    ; 1585 _ 89. 45, 10
        push    dword [ebp+10H]                         ; 1588 _ FF. 75, 10
        push    dword [ebp+0CH]                         ; 158B _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 158E _ FF. 75, 08
        call    memman_free                             ; 1591 _ E8, FFFFFFFC(rel)
        add     esp, 12                                 ; 1596 _ 83. C4, 0C
        mov     dword [ebp-4H], eax                     ; 1599 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 159C _ 8B. 45, FC
        leave                                           ; 159F _ C9
        ret                                             ; 15A0 _ C3
; memman_free_4k End of function

shtctl_init:; Function begin
        push    ebp                                     ; 15A1 _ 55
        mov     ebp, esp                                ; 15A2 _ 89. E5
        sub     esp, 24                                 ; 15A4 _ 83. EC, 18
        sub     esp, 8                                  ; 15A7 _ 83. EC, 08
        push    9232                                    ; 15AA _ 68, 00002410
        push    dword [ebp+8H]                          ; 15AF _ FF. 75, 08
        call    memman_alloc_4k                         ; 15B2 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 15B7 _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 15BA _ 89. 45, F4
        cmp     dword [ebp-0CH], 0                      ; 15BD _ 83. 7D, F4, 00
        jnz     ?_080                                   ; 15C1 _ 75, 07
        mov     eax, 0                                  ; 15C3 _ B8, 00000000
        jmp     ?_083                                   ; 15C8 _ EB, 54

?_080:  mov     eax, dword [ebp-0CH]                    ; 15CA _ 8B. 45, F4
        mov     edx, dword [ebp+0CH]                    ; 15CD _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 15D0 _ 89. 10
        mov     eax, dword [ebp-0CH]                    ; 15D2 _ 8B. 45, F4
        mov     edx, dword [ebp+10H]                    ; 15D5 _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 15D8 _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 15DB _ 8B. 45, F4
        mov     edx, dword [ebp+14H]                    ; 15DE _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 15E1 _ 89. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 15E4 _ 8B. 45, F4
        mov     dword [eax+0CH], -1                     ; 15E7 _ C7. 40, 0C, FFFFFFFF
        mov     dword [ebp-10H], 0                      ; 15EE _ C7. 45, F0, 00000000
        jmp     ?_082                                   ; 15F5 _ EB, 1B

?_081:  mov     eax, dword [ebp-0CH]                    ; 15F7 _ 8B. 45, F4
        mov     edx, dword [ebp-10H]                    ; 15FA _ 8B. 55, F0
        add     edx, 33                                 ; 15FD _ 83. C2, 21
        shl     edx, 5                                  ; 1600 _ C1. E2, 05
        add     eax, edx                                ; 1603 _ 01. D0
        add     eax, 12                                 ; 1605 _ 83. C0, 0C
        mov     dword [eax], 0                          ; 1608 _ C7. 00, 00000000
        add     dword [ebp-10H], 1                      ; 160E _ 83. 45, F0, 01
?_082:  cmp     dword [ebp-10H], 255                    ; 1612 _ 81. 7D, F0, 000000FF
        jle     ?_081                                   ; 1619 _ 7E, DC
        mov     eax, dword [ebp-0CH]                    ; 161B _ 8B. 45, F4
?_083:  leave                                           ; 161E _ C9
        ret                                             ; 161F _ C3
; shtctl_init End of function

sheet_alloc:; Function begin
        push    ebp                                     ; 1620 _ 55
        mov     ebp, esp                                ; 1621 _ 89. E5
        sub     esp, 16                                 ; 1623 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 1626 _ C7. 45, F8, 00000000
        jmp     ?_086                                   ; 162D _ EB, 57

?_084:  mov     eax, dword [ebp+8H]                     ; 162F _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1632 _ 8B. 55, F8
        add     edx, 33                                 ; 1635 _ 83. C2, 21
        shl     edx, 5                                  ; 1638 _ C1. E2, 05
        add     eax, edx                                ; 163B _ 01. D0
        add     eax, 12                                 ; 163D _ 83. C0, 0C
        mov     eax, dword [eax]                        ; 1640 _ 8B. 00
        test    eax, eax                                ; 1642 _ 85. C0
        jnz     ?_085                                   ; 1644 _ 75, 3C
        mov     eax, dword [ebp-8H]                     ; 1646 _ 8B. 45, F8
        shl     eax, 5                                  ; 1649 _ C1. E0, 05
        lea     edx, [eax+410H]                         ; 164C _ 8D. 90, 00000410
        mov     eax, dword [ebp+8H]                     ; 1652 _ 8B. 45, 08
        add     eax, edx                                ; 1655 _ 01. D0
        mov     dword [ebp-4H], eax                     ; 1657 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 165A _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 165D _ 8B. 55, F8
        lea     ecx, [edx+4H]                           ; 1660 _ 8D. 4A, 04
        mov     edx, dword [ebp-4H]                     ; 1663 _ 8B. 55, FC
        mov     dword [eax+ecx*4], edx                  ; 1666 _ 89. 14 88
        mov     eax, dword [ebp-4H]                     ; 1669 _ 8B. 45, FC
        mov     dword [eax+1CH], 1                      ; 166C _ C7. 40, 1C, 00000001
        mov     eax, dword [ebp-4H]                     ; 1673 _ 8B. 45, FC
        mov     dword [eax+18H], -1                     ; 1676 _ C7. 40, 18, FFFFFFFF
        mov     eax, dword [ebp-4H]                     ; 167D _ 8B. 45, FC
        jmp     ?_087                                   ; 1680 _ EB, 12

?_085:  add     dword [ebp-8H], 1                       ; 1682 _ 83. 45, F8, 01
?_086:  cmp     dword [ebp-8H], 255                     ; 1686 _ 81. 7D, F8, 000000FF
        jle     ?_084                                   ; 168D _ 7E, A0
        mov     eax, 0                                  ; 168F _ B8, 00000000
?_087:  leave                                           ; 1694 _ C9
        ret                                             ; 1695 _ C3
; sheet_alloc End of function

sheet_setbuf:; Function begin
        push    ebp                                     ; 1696 _ 55
        mov     ebp, esp                                ; 1697 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 1699 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 169C _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 169F _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 16A1 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 16A4 _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 16A7 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 16AA _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 16AD _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 16B0 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 16B3 _ 8B. 45, 08
        mov     edx, dword [ebp+18H]                    ; 16B6 _ 8B. 55, 18
        mov     dword [eax+14H], edx                    ; 16B9 _ 89. 50, 14
        nop                                             ; 16BC _ 90
        pop     ebp                                     ; 16BD _ 5D
        ret                                             ; 16BE _ C3
; sheet_setbuf End of function

sheet_updown:; Function begin
        push    ebp                                     ; 16BF _ 55
        mov     ebp, esp                                ; 16C0 _ 89. E5
        push    ebx                                     ; 16C2 _ 53
        sub     esp, 20                                 ; 16C3 _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 16C6 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 16C9 _ 8B. 40, 18
        mov     dword [ebp-0CH], eax                    ; 16CC _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 16CF _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 16D2 _ 8B. 40, 0C
        add     eax, 1                                  ; 16D5 _ 83. C0, 01
        cmp     dword [ebp+10H], eax                    ; 16D8 _ 39. 45, 10
        jle     ?_088                                   ; 16DB _ 7E, 0C
        mov     eax, dword [ebp+8H]                     ; 16DD _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 16E0 _ 8B. 40, 0C
        add     eax, 1                                  ; 16E3 _ 83. C0, 01
        mov     dword [ebp+10H], eax                    ; 16E6 _ 89. 45, 10
?_088:  cmp     dword [ebp+10H], -1                     ; 16E9 _ 83. 7D, 10, FF
        jge     ?_089                                   ; 16ED _ 7D, 07
        mov     dword [ebp+10H], -1                     ; 16EF _ C7. 45, 10, FFFFFFFF
?_089:  mov     eax, dword [ebp+0CH]                    ; 16F6 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 16F9 _ 8B. 55, 10
        mov     dword [eax+18H], edx                    ; 16FC _ 89. 50, 18
        mov     eax, dword [ebp-0CH]                    ; 16FF _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 1702 _ 3B. 45, 10
        jle     ?_097                                   ; 1705 _ 0F 8E, 000000F7
        cmp     dword [ebp+10H], 0                      ; 170B _ 83. 7D, 10, 00
        js      ?_092                                   ; 170F _ 78, 52
        mov     eax, dword [ebp-0CH]                    ; 1711 _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 1714 _ 89. 45, F0
        jmp     ?_091                                   ; 1717 _ EB, 31

?_090:  mov     eax, dword [ebp-10H]                    ; 1719 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 171C _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 171F _ 8B. 45, 08
        add     edx, 4                                  ; 1722 _ 83. C2, 04
        mov     edx, dword [eax+edx*4]                  ; 1725 _ 8B. 14 90
        mov     eax, dword [ebp+8H]                     ; 1728 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 172B _ 8B. 4D, F0
        add     ecx, 4                                  ; 172E _ 83. C1, 04
        mov     dword [eax+ecx*4], edx                  ; 1731 _ 89. 14 88
        mov     eax, dword [ebp+8H]                     ; 1734 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 1737 _ 8B. 55, F0
        add     edx, 4                                  ; 173A _ 83. C2, 04
        mov     eax, dword [eax+edx*4]                  ; 173D _ 8B. 04 90
        mov     edx, dword [ebp-10H]                    ; 1740 _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 1743 _ 89. 50, 18
        sub     dword [ebp-10H], 1                      ; 1746 _ 83. 6D, F0, 01
?_091:  mov     eax, dword [ebp-10H]                    ; 174A _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 174D _ 3B. 45, 10
        jg      ?_090                                   ; 1750 _ 7F, C7
        mov     eax, dword [ebp+8H]                     ; 1752 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 1755 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 1758 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 175B _ 8B. 55, 0C
        mov     dword [eax+ecx*4], edx                  ; 175E _ 89. 14 88
        jmp     ?_096                                   ; 1761 _ EB, 5E

?_092:  mov     eax, dword [ebp+8H]                     ; 1763 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1766 _ 8B. 40, 0C
        cmp     dword [ebp-0CH], eax                    ; 1769 _ 39. 45, F4
        jge     ?_095                                   ; 176C _ 7D, 44
        mov     eax, dword [ebp-0CH]                    ; 176E _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 1771 _ 89. 45, F0
        jmp     ?_094                                   ; 1774 _ EB, 31

?_093:  mov     eax, dword [ebp-10H]                    ; 1776 _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 1779 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 177C _ 8B. 45, 08
        add     edx, 4                                  ; 177F _ 83. C2, 04
        mov     edx, dword [eax+edx*4]                  ; 1782 _ 8B. 14 90
        mov     eax, dword [ebp+8H]                     ; 1785 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 1788 _ 8B. 4D, F0
        add     ecx, 4                                  ; 178B _ 83. C1, 04
        mov     dword [eax+ecx*4], edx                  ; 178E _ 89. 14 88
        mov     eax, dword [ebp+8H]                     ; 1791 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 1794 _ 8B. 55, F0
        add     edx, 4                                  ; 1797 _ 83. C2, 04
        mov     eax, dword [eax+edx*4]                  ; 179A _ 8B. 04 90
        mov     edx, dword [ebp-10H]                    ; 179D _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 17A0 _ 89. 50, 18
        add     dword [ebp-10H], 1                      ; 17A3 _ 83. 45, F0, 01
?_094:  mov     eax, dword [ebp+8H]                     ; 17A7 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 17AA _ 8B. 40, 0C
        cmp     dword [ebp-10H], eax                    ; 17AD _ 39. 45, F0
        jl      ?_093                                   ; 17B0 _ 7C, C4
?_095:  mov     eax, dword [ebp+8H]                     ; 17B2 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 17B5 _ 8B. 40, 0C
        lea     edx, [eax-1H]                           ; 17B8 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 17BB _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 17BE _ 89. 50, 0C
?_096:  mov     eax, dword [ebp+0CH]                    ; 17C1 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 17C4 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 17C7 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 17CA _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 17CD _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 17D0 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 17D3 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 17D6 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 17D9 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 17DC _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 17DF _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 17E2 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 17E5 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 17E8 _ 8B. 40, 0C
        sub     esp, 12                                 ; 17EB _ 83. EC, 0C
        push    ebx                                     ; 17EE _ 53
        push    ecx                                     ; 17EF _ 51
        push    edx                                     ; 17F0 _ 52
        push    eax                                     ; 17F1 _ 50
        push    dword [ebp+8H]                          ; 17F2 _ FF. 75, 08
        call    sheet_refreshsub                        ; 17F5 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 17FA _ 83. C4, 20
        jmp     ?_104                                   ; 17FD _ E9, 00000108

?_097:  mov     eax, dword [ebp-0CH]                    ; 1802 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 1805 _ 3B. 45, 10
        jge     ?_104                                   ; 1808 _ 0F 8D, 000000FC
        cmp     dword [ebp-0CH], 0                      ; 180E _ 83. 7D, F4, 00
        js      ?_100                                   ; 1812 _ 78, 52
        mov     eax, dword [ebp-0CH]                    ; 1814 _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 1817 _ 89. 45, F0
        jmp     ?_099                                   ; 181A _ EB, 31

?_098:  mov     eax, dword [ebp-10H]                    ; 181C _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 181F _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1822 _ 8B. 45, 08
        add     edx, 4                                  ; 1825 _ 83. C2, 04
        mov     edx, dword [eax+edx*4]                  ; 1828 _ 8B. 14 90
        mov     eax, dword [ebp+8H]                     ; 182B _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 182E _ 8B. 4D, F0
        add     ecx, 4                                  ; 1831 _ 83. C1, 04
        mov     dword [eax+ecx*4], edx                  ; 1834 _ 89. 14 88
        mov     eax, dword [ebp+8H]                     ; 1837 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 183A _ 8B. 55, F0
        add     edx, 4                                  ; 183D _ 83. C2, 04
        mov     eax, dword [eax+edx*4]                  ; 1840 _ 8B. 04 90
        mov     edx, dword [ebp-10H]                    ; 1843 _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 1846 _ 89. 50, 18
        add     dword [ebp-10H], 1                      ; 1849 _ 83. 45, F0, 01
?_099:  mov     eax, dword [ebp-10H]                    ; 184D _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 1850 _ 3B. 45, 10
        jl      ?_098                                   ; 1853 _ 7C, C7
        mov     eax, dword [ebp+8H]                     ; 1855 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 1858 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 185B _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 185E _ 8B. 55, 0C
        mov     dword [eax+ecx*4], edx                  ; 1861 _ 89. 14 88
        jmp     ?_103                                   ; 1864 _ EB, 68

?_100:  mov     eax, dword [ebp+8H]                     ; 1866 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1869 _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 186C _ 89. 45, F0
        jmp     ?_102                                   ; 186F _ EB, 37

?_101:  mov     eax, dword [ebp-10H]                    ; 1871 _ 8B. 45, F0
        lea     ecx, [eax+1H]                           ; 1874 _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 1877 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 187A _ 8B. 55, F0
        add     edx, 4                                  ; 187D _ 83. C2, 04
        mov     edx, dword [eax+edx*4]                  ; 1880 _ 8B. 14 90
        mov     eax, dword [ebp+8H]                     ; 1883 _ 8B. 45, 08
        add     ecx, 4                                  ; 1886 _ 83. C1, 04
        mov     dword [eax+ecx*4], edx                  ; 1889 _ 89. 14 88
        mov     eax, dword [ebp-10H]                    ; 188C _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 188F _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1892 _ 8B. 45, 08
        add     edx, 4                                  ; 1895 _ 83. C2, 04
        mov     eax, dword [eax+edx*4]                  ; 1898 _ 8B. 04 90
        mov     edx, dword [ebp-10H]                    ; 189B _ 8B. 55, F0
        add     edx, 1                                  ; 189E _ 83. C2, 01
        mov     dword [eax+18H], edx                    ; 18A1 _ 89. 50, 18
        sub     dword [ebp-10H], 1                      ; 18A4 _ 83. 6D, F0, 01
?_102:  mov     eax, dword [ebp-10H]                    ; 18A8 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 18AB _ 3B. 45, 10
        jge     ?_101                                   ; 18AE _ 7D, C1
        mov     eax, dword [ebp+8H]                     ; 18B0 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 18B3 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 18B6 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 18B9 _ 8B. 55, 0C
        mov     dword [eax+ecx*4], edx                  ; 18BC _ 89. 14 88
        mov     eax, dword [ebp+8H]                     ; 18BF _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 18C2 _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 18C5 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 18C8 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 18CB _ 89. 50, 0C
?_103:  mov     eax, dword [ebp+0CH]                    ; 18CE _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 18D1 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 18D4 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 18D7 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 18DA _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 18DD _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 18E0 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 18E3 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 18E6 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 18E9 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 18EC _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 18EF _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 18F2 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 18F5 _ 8B. 40, 0C
        sub     esp, 12                                 ; 18F8 _ 83. EC, 0C
        push    ebx                                     ; 18FB _ 53
        push    ecx                                     ; 18FC _ 51
        push    edx                                     ; 18FD _ 52
        push    eax                                     ; 18FE _ 50
        push    dword [ebp+8H]                          ; 18FF _ FF. 75, 08
        call    sheet_refreshsub                        ; 1902 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1907 _ 83. C4, 20
?_104:  nop                                             ; 190A _ 90
        mov     ebx, dword [ebp-4H]                     ; 190B _ 8B. 5D, FC
        leave                                           ; 190E _ C9
        ret                                             ; 190F _ C3
; sheet_updown End of function

sheet_refresh:; Function begin
        push    ebp                                     ; 1910 _ 55
        mov     ebp, esp                                ; 1911 _ 89. E5
        push    esi                                     ; 1913 _ 56
        push    ebx                                     ; 1914 _ 53
        mov     eax, dword [ebp+0CH]                    ; 1915 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 1918 _ 8B. 40, 18
        test    eax, eax                                ; 191B _ 85. C0
        js      ?_105                                   ; 191D _ 78, 40
        mov     eax, dword [ebp+0CH]                    ; 191F _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1922 _ 8B. 50, 10
        mov     eax, dword [ebp+1CH]                    ; 1925 _ 8B. 45, 1C
        lea     ebx, [edx+eax]                          ; 1928 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 192B _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 192E _ 8B. 50, 0C
        mov     eax, dword [ebp+18H]                    ; 1931 _ 8B. 45, 18
        lea     ecx, [edx+eax]                          ; 1934 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 1937 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 193A _ 8B. 50, 10
        mov     eax, dword [ebp+14H]                    ; 193D _ 8B. 45, 14
        add     edx, eax                                ; 1940 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 1942 _ 8B. 45, 0C
        mov     esi, dword [eax+0CH]                    ; 1945 _ 8B. 70, 0C
        mov     eax, dword [ebp+10H]                    ; 1948 _ 8B. 45, 10
        add     eax, esi                                ; 194B _ 01. F0
        sub     esp, 12                                 ; 194D _ 83. EC, 0C
        push    ebx                                     ; 1950 _ 53
        push    ecx                                     ; 1951 _ 51
        push    edx                                     ; 1952 _ 52
        push    eax                                     ; 1953 _ 50
        push    dword [ebp+8H]                          ; 1954 _ FF. 75, 08
        call    sheet_refreshsub                        ; 1957 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 195C _ 83. C4, 20
?_105:  mov     eax, 0                                  ; 195F _ B8, 00000000
        lea     esp, [ebp-8H]                           ; 1964 _ 8D. 65, F8
        pop     ebx                                     ; 1967 _ 5B
        pop     esi                                     ; 1968 _ 5E
        pop     ebp                                     ; 1969 _ 5D
        ret                                             ; 196A _ C3
; sheet_refresh End of function

sheet_slide:; Function begin
        push    ebp                                     ; 196B _ 55
        mov     ebp, esp                                ; 196C _ 89. E5
        sub     esp, 24                                 ; 196E _ 83. EC, 18
        mov     eax, dword [ebp+0CH]                    ; 1971 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 1974 _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 1977 _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 197A _ 8B. 45, 0C
        mov     eax, dword [eax+10H]                    ; 197D _ 8B. 40, 10
        mov     dword [ebp-0CH], eax                    ; 1980 _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 1983 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 1986 _ 8B. 55, 10
        mov     dword [eax+0CH], edx                    ; 1989 _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 198C _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 198F _ 8B. 55, 14
        mov     dword [eax+10H], edx                    ; 1992 _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1995 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 1998 _ 8B. 40, 18
        test    eax, eax                                ; 199B _ 85. C0
        js      ?_106                                   ; 199D _ 78, 58
        mov     eax, dword [ebp+0CH]                    ; 199F _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 19A2 _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 19A5 _ 8B. 45, F4
        add     edx, eax                                ; 19A8 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 19AA _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 19AD _ 8B. 48, 04
        mov     eax, dword [ebp-10H]                    ; 19B0 _ 8B. 45, F0
        add     eax, ecx                                ; 19B3 _ 01. C8
        sub     esp, 12                                 ; 19B5 _ 83. EC, 0C
        push    edx                                     ; 19B8 _ 52
        push    eax                                     ; 19B9 _ 50
        push    dword [ebp-0CH]                         ; 19BA _ FF. 75, F4
        push    dword [ebp-10H]                         ; 19BD _ FF. 75, F0
        push    dword [ebp+8H]                          ; 19C0 _ FF. 75, 08
        call    sheet_refreshsub                        ; 19C3 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 19C8 _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 19CB _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 19CE _ 8B. 50, 08
        mov     eax, dword [ebp+14H]                    ; 19D1 _ 8B. 45, 14
        add     edx, eax                                ; 19D4 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 19D6 _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 19D9 _ 8B. 48, 04
        mov     eax, dword [ebp+10H]                    ; 19DC _ 8B. 45, 10
        add     eax, ecx                                ; 19DF _ 01. C8
        sub     esp, 12                                 ; 19E1 _ 83. EC, 0C
        push    edx                                     ; 19E4 _ 52
        push    eax                                     ; 19E5 _ 50
        push    dword [ebp+14H]                         ; 19E6 _ FF. 75, 14
        push    dword [ebp+10H]                         ; 19E9 _ FF. 75, 10
        push    dword [ebp+8H]                          ; 19EC _ FF. 75, 08
        call    sheet_refreshsub                        ; 19EF _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 19F4 _ 83. C4, 20
?_106:  nop                                             ; 19F7 _ 90
        leave                                           ; 19F8 _ C9
        ret                                             ; 19F9 _ C3
; sheet_slide End of function

sheet_refreshsub:; Function begin
        push    ebp                                     ; 19FA _ 55
        mov     ebp, esp                                ; 19FB _ 89. E5
        sub     esp, 48                                 ; 19FD _ 83. EC, 30
        mov     eax, dword [ebp+8H]                     ; 1A00 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1A03 _ 8B. 00
        mov     dword [ebp-14H], eax                    ; 1A05 _ 89. 45, EC
        mov     dword [ebp-20H], 0                      ; 1A08 _ C7. 45, E0, 00000000
        jmp     ?_113                                   ; 1A0F _ E9, 000000DC

?_107:  mov     eax, dword [ebp+8H]                     ; 1A14 _ 8B. 45, 08
        mov     edx, dword [ebp-20H]                    ; 1A17 _ 8B. 55, E0
        add     edx, 4                                  ; 1A1A _ 83. C2, 04
        mov     eax, dword [eax+edx*4]                  ; 1A1D _ 8B. 04 90
        mov     dword [ebp-10H], eax                    ; 1A20 _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 1A23 _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 1A26 _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 1A28 _ 89. 45, F4
        mov     dword [ebp-18H], 0                      ; 1A2B _ C7. 45, E8, 00000000
        jmp     ?_112                                   ; 1A32 _ E9, 000000A6

?_108:  mov     eax, dword [ebp-10H]                    ; 1A37 _ 8B. 45, F0
        mov     edx, dword [eax+10H]                    ; 1A3A _ 8B. 50, 10
        mov     eax, dword [ebp-18H]                    ; 1A3D _ 8B. 45, E8
        add     eax, edx                                ; 1A40 _ 01. D0
        mov     dword [ebp-8H], eax                     ; 1A42 _ 89. 45, F8
        mov     dword [ebp-1CH], 0                      ; 1A45 _ C7. 45, E4, 00000000
        jmp     ?_111                                   ; 1A4C _ EB, 7C

?_109:  mov     eax, dword [ebp-10H]                    ; 1A4E _ 8B. 45, F0
        mov     edx, dword [eax+0CH]                    ; 1A51 _ 8B. 50, 0C
        mov     eax, dword [ebp-1CH]                    ; 1A54 _ 8B. 45, E4
        add     eax, edx                                ; 1A57 _ 01. D0
        mov     dword [ebp-4H], eax                     ; 1A59 _ 89. 45, FC
        mov     eax, dword [ebp+0CH]                    ; 1A5C _ 8B. 45, 0C
        cmp     eax, dword [ebp-4H]                     ; 1A5F _ 3B. 45, FC
        jg      ?_110                                   ; 1A62 _ 7F, 62
        mov     eax, dword [ebp-4H]                     ; 1A64 _ 8B. 45, FC
        cmp     eax, dword [ebp+14H]                    ; 1A67 _ 3B. 45, 14
        jge     ?_110                                   ; 1A6A _ 7D, 5A
        mov     eax, dword [ebp+10H]                    ; 1A6C _ 8B. 45, 10
        cmp     eax, dword [ebp-8H]                     ; 1A6F _ 3B. 45, F8
        jg      ?_110                                   ; 1A72 _ 7F, 52
        mov     eax, dword [ebp-8H]                     ; 1A74 _ 8B. 45, F8
        cmp     eax, dword [ebp+18H]                    ; 1A77 _ 3B. 45, 18
        jge     ?_110                                   ; 1A7A _ 7D, 4A
        mov     eax, dword [ebp-10H]                    ; 1A7C _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 1A7F _ 8B. 40, 04
        imul    eax, dword [ebp-18H]                    ; 1A82 _ 0F AF. 45, E8
        mov     edx, eax                                ; 1A86 _ 89. C2
        mov     eax, dword [ebp-1CH]                    ; 1A88 _ 8B. 45, E4
        add     eax, edx                                ; 1A8B _ 01. D0
        mov     edx, eax                                ; 1A8D _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 1A8F _ 8B. 45, F4
        add     eax, edx                                ; 1A92 _ 01. D0
        movzx   eax, byte [eax]                         ; 1A94 _ 0F B6. 00
        mov     byte [ebp-21H], al                      ; 1A97 _ 88. 45, DF
        movzx   edx, byte [ebp-21H]                     ; 1A9A _ 0F B6. 55, DF
        mov     eax, dword [ebp-10H]                    ; 1A9E _ 8B. 45, F0
        mov     eax, dword [eax+14H]                    ; 1AA1 _ 8B. 40, 14
        cmp     edx, eax                                ; 1AA4 _ 39. C2
        jz      ?_110                                   ; 1AA6 _ 74, 1E
        mov     eax, dword [ebp+8H]                     ; 1AA8 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 1AAB _ 8B. 40, 04
        imul    eax, dword [ebp-8H]                     ; 1AAE _ 0F AF. 45, F8
        mov     edx, eax                                ; 1AB2 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 1AB4 _ 8B. 45, FC
        add     eax, edx                                ; 1AB7 _ 01. D0
        mov     edx, eax                                ; 1AB9 _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 1ABB _ 8B. 45, EC
        add     edx, eax                                ; 1ABE _ 01. C2
        movzx   eax, byte [ebp-21H]                     ; 1AC0 _ 0F B6. 45, DF
        mov     byte [edx], al                          ; 1AC4 _ 88. 02
?_110:  add     dword [ebp-1CH], 1                      ; 1AC6 _ 83. 45, E4, 01
?_111:  mov     eax, dword [ebp-10H]                    ; 1ACA _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 1ACD _ 8B. 40, 04
        cmp     dword [ebp-1CH], eax                    ; 1AD0 _ 39. 45, E4
        jl      ?_109                                   ; 1AD3 _ 0F 8C, FFFFFF75
        add     dword [ebp-18H], 1                      ; 1AD9 _ 83. 45, E8, 01
?_112:  mov     eax, dword [ebp-10H]                    ; 1ADD _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 1AE0 _ 8B. 40, 08
        cmp     dword [ebp-18H], eax                    ; 1AE3 _ 39. 45, E8
        jl      ?_108                                   ; 1AE6 _ 0F 8C, FFFFFF4B
        add     dword [ebp-20H], 1                      ; 1AEC _ 83. 45, E0, 01
?_113:  mov     eax, dword [ebp+8H]                     ; 1AF0 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1AF3 _ 8B. 40, 0C
        cmp     dword [ebp-20H], eax                    ; 1AF6 _ 39. 45, E0
        jle     ?_107                                   ; 1AF9 _ 0F 8E, FFFFFF15
        nop                                             ; 1AFF _ 90
        leave                                           ; 1B00 _ C9
        ret                                             ; 1B01 _ C3
; sheet_refreshsub End of function



?_114:                                                  ; byte
        db 69H, 6DH, 70H, 72H, 6FH, 76H, 65H, 20H       ; 0000 _ improve 
        db 73H, 74H, 72H, 69H, 6EH, 67H, 20H, 73H       ; 0008 _ string s
        db 68H, 6FH, 77H, 69H, 6EH, 67H, 21H, 00H       ; 0010 _ howing!.

?_115:                                                  ; byte
        db 70H, 61H, 67H, 65H, 20H, 69H, 73H, 3AH       ; 0018 _ page is:
        db 20H, 00H                                     ; 0020 _  .

?_116:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0022 _ BaseAddr
        db 4CH, 3AH, 20H, 00H                           ; 002A _ L: .

?_117:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 002E _ BaseAddr
        db 48H, 3AH, 20H, 00H                           ; 0036 _ H: .

?_118:                                                  ; byte
        db 4CH, 65H, 6EH, 67H, 74H, 68H, 4CH, 6FH       ; 003A _ LengthLo
        db 77H, 3AH, 20H, 00H                           ; 0042 _ w: .

?_119:                                                  ; byte
        db 4CH, 65H, 6EH, 67H, 74H, 68H, 48H, 69H       ; 0046 _ LengthHi
        db 67H, 68H, 3AH, 20H, 00H                      ; 004E _ gh: .

?_120:                                                  ; byte
        db 54H, 79H, 70H, 65H, 3AH, 20H, 00H            ; 0053 _ Type: .



keyval:                                                 ; byte
        db 30H, 78H                                     ; 0000 _ 0x

?_121:  db 00H                                          ; 0002 _ .

?_122:  db 00H, 00H, 00H, 00H, 00H                      ; 0003 _ .....

memman: dd 00100000H, 00000000H                         ; 0008 _ 1048576 0 
        dd 00000000H, 00000000H                         ; 0010 _ 0 0 
        dd 00000000H, 00000000H                         ; 0018 _ 0 0 

table_rgb.1661:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 00H, 0FFH     ; 0020 _ ........
        db 00H, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH   ; 0028 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0030 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0038 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 0040 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 0048 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0050 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0058 _ ........

cursor.1718:                                            ; byte
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



bootInfo:                                               ; qword
        resb    4                                       ; 0000

?_123:  resw    1                                       ; 0004

?_124:  resw    1                                       ; 0006

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

str.1762:                                               ; byte
        resb    1                                       ; 0208

?_125:  resb    9                                       ; 0209

?_126:  resb    1                                       ; 0212


