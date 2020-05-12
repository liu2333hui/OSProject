
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
        mov     dword [ebp-2CH], eax                    ; 001C _ 89. 45, D4
        movzx   eax, word [?_123]                       ; 001F _ 0F B7. 05, 00000004(d)
        cwde                                            ; 0026 _ 98
        mov     dword [xsize], eax                      ; 0027 _ A3, 00000200(d)
        movzx   eax, word [?_124]                       ; 002C _ 0F B7. 05, 00000006(d)
        cwde                                            ; 0033 _ 98
        mov     dword [ysize], eax                      ; 0034 _ A3, 00000204(d)
        mov     eax, dword [bootInfo]                   ; 0039 _ A1, 00000000(d)
        mov     dword [ebp-28H], eax                    ; 003E _ 89. 45, D8
        mov     dword [ebp-24H], 0                      ; 0041 _ C7. 45, DC, 00000000
        mov     dword [ebp-20H], 0                      ; 0048 _ C7. 45, E0, 00000000
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
        mov     edx, systemFont+410H                    ; 008A _ BA, 00000410(d)
        mov     eax, dword [xsize]                      ; 008F _ A1, 00000200(d)
        sub     esp, 8                                  ; 0094 _ 83. EC, 08
        push    edx                                     ; 0097 _ 52
        push    7                                       ; 0098 _ 6A, 07
        push    8                                       ; 009A _ 6A, 08
        push    8                                       ; 009C _ 6A, 08
        push    eax                                     ; 009E _ 50
        push    dword [ebp-2CH]                         ; 009F _ FF. 75, D4
        call    showChar8                               ; 00A2 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 00A7 _ 83. C4, 20
        mov     edx, systemFont+420H                    ; 00AA _ BA, 00000420(d)
        mov     eax, dword [xsize]                      ; 00AF _ A1, 00000200(d)
        sub     esp, 8                                  ; 00B4 _ 83. EC, 08
        push    edx                                     ; 00B7 _ 52
        push    7                                       ; 00B8 _ 6A, 07
        push    8                                       ; 00BA _ 6A, 08
        push    16                                      ; 00BC _ 6A, 10
        push    eax                                     ; 00BE _ 50
        push    dword [ebp-2CH]                         ; 00BF _ FF. 75, D4
        call    showChar8                               ; 00C2 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 00C7 _ 83. C4, 20
        mov     edx, systemFont+430H                    ; 00CA _ BA, 00000430(d)
        mov     eax, dword [xsize]                      ; 00CF _ A1, 00000200(d)
        sub     esp, 8                                  ; 00D4 _ 83. EC, 08
        push    edx                                     ; 00D7 _ 52
        push    7                                       ; 00D8 _ 6A, 07
        push    8                                       ; 00DA _ 6A, 08
        push    24                                      ; 00DC _ 6A, 18
        push    eax                                     ; 00DE _ 50
        push    dword [ebp-2CH]                         ; 00DF _ FF. 75, D4
        call    showChar8                               ; 00E2 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 00E7 _ 83. C4, 20
        mov     edx, systemFont+330H                    ; 00EA _ BA, 00000330(d)
        mov     eax, dword [xsize]                      ; 00EF _ A1, 00000200(d)
        sub     esp, 8                                  ; 00F4 _ 83. EC, 08
        push    edx                                     ; 00F7 _ 52
        push    7                                       ; 00F8 _ 6A, 07
        push    8                                       ; 00FA _ 6A, 08
        push    40                                      ; 00FC _ 6A, 28
        push    eax                                     ; 00FE _ 50
        push    dword [ebp-2CH]                         ; 00FF _ FF. 75, D4
        call    showChar8                               ; 0102 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0107 _ 83. C4, 20
        mov     edx, systemFont+320H                    ; 010A _ BA, 00000320(d)
        mov     eax, dword [xsize]                      ; 010F _ A1, 00000200(d)
        sub     esp, 8                                  ; 0114 _ 83. EC, 08
        push    edx                                     ; 0117 _ 52
        push    7                                       ; 0118 _ 6A, 07
        push    8                                       ; 011A _ 6A, 08
        push    48                                      ; 011C _ 6A, 30
        push    eax                                     ; 011E _ 50
        push    dword [ebp-2CH]                         ; 011F _ FF. 75, D4
        call    showChar8                               ; 0122 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0127 _ 83. C4, 20
        mov     eax, dword [xsize]                      ; 012A _ A1, 00000200(d)
        sub     esp, 8                                  ; 012F _ 83. EC, 08
        push    ?_114                                   ; 0132 _ 68, 00000000(d)
        push    7                                       ; 0137 _ 6A, 07
        push    64                                      ; 0139 _ 6A, 40
        push    8                                       ; 013B _ 6A, 08
        push    eax                                     ; 013D _ 50
        push    dword [ebp-2CH]                         ; 013E _ FF. 75, D4
        call    showString                              ; 0141 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0146 _ 83. C4, 20
        call    get_memory_block_count                  ; 0149 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 014E _ 89. 45, E4
        call    get_adr_buffer                          ; 0151 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 0156 _ 89. 45, E8
        mov     eax, dword [memman]                     ; 0159 _ A1, 00000000(d)
        sub     esp, 12                                 ; 015E _ 83. EC, 0C
        push    eax                                     ; 0161 _ 50
        call    memman_init                             ; 0162 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0167 _ 83. C4, 10
        mov     eax, dword [memman]                     ; 016A _ A1, 00000000(d)
        sub     esp, 4                                  ; 016F _ 83. EC, 04
        push    534609920                               ; 0172 _ 68, 1FDD8000
        push    1081344                                 ; 0177 _ 68, 00108000
        push    eax                                     ; 017C _ 50
        call    memman_free                             ; 017D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0182 _ 83. C4, 10
        mov     ecx, dword [ysize]                      ; 0185 _ 8B. 0D, 00000204(d)
        mov     edx, dword [xsize]                      ; 018B _ 8B. 15, 00000200(d)
        mov     eax, dword [memman]                     ; 0191 _ A1, 00000000(d)
        push    ecx                                     ; 0196 _ 51
        push    edx                                     ; 0197 _ 52
        push    dword [ebp-2CH]                         ; 0198 _ FF. 75, D4
        push    eax                                     ; 019B _ 50
        call    shtctl_init                             ; 019C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 01A1 _ 83. C4, 10
        mov     dword [ebp-14H], eax                    ; 01A4 _ 89. 45, EC
        sub     esp, 12                                 ; 01A7 _ 83. EC, 0C
        push    dword [ebp-14H]                         ; 01AA _ FF. 75, EC
        call    sheet_alloc                             ; 01AD _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 01B2 _ 83. C4, 10
        mov     dword [ebp-24H], eax                    ; 01B5 _ 89. 45, DC
        sub     esp, 12                                 ; 01B8 _ 83. EC, 0C
        push    dword [ebp-14H]                         ; 01BB _ FF. 75, EC
        call    sheet_alloc                             ; 01BE _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 01C3 _ 83. C4, 10
        mov     dword [ebp-20H], eax                    ; 01C6 _ 89. 45, E0
        mov     edx, dword [xsize]                      ; 01C9 _ 8B. 15, 00000200(d)
        mov     eax, dword [ysize]                      ; 01CF _ A1, 00000204(d)
        imul    eax, edx                                ; 01D4 _ 0F AF. C2
        mov     edx, eax                                ; 01D7 _ 89. C2
        mov     eax, dword [memman]                     ; 01D9 _ A1, 00000000(d)
        sub     esp, 8                                  ; 01DE _ 83. EC, 08
        push    edx                                     ; 01E1 _ 52
        push    eax                                     ; 01E2 _ 50
        call    memman_alloc_4k                         ; 01E3 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 01E8 _ 83. C4, 10
        mov     dword [buf_back], eax                   ; 01EB _ A3, 000000F8(d)
        mov     ecx, dword [ysize]                      ; 01F0 _ 8B. 0D, 00000204(d)
        mov     edx, dword [xsize]                      ; 01F6 _ 8B. 15, 00000200(d)
        mov     eax, dword [buf_back]                   ; 01FC _ A1, 000000F8(d)
        sub     esp, 12                                 ; 0201 _ 83. EC, 0C
        push    99                                      ; 0204 _ 6A, 63
        push    ecx                                     ; 0206 _ 51
        push    edx                                     ; 0207 _ 52
        push    eax                                     ; 0208 _ 50
        push    dword [ebp-24H]                         ; 0209 _ FF. 75, DC
        call    sheet_setbuf                            ; 020C _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0211 _ 83. C4, 20
        sub     esp, 12                                 ; 0214 _ 83. EC, 0C
        push    99                                      ; 0217 _ 6A, 63
        push    16                                      ; 0219 _ 6A, 10
        push    16                                      ; 021B _ 6A, 10
        push    buf_mouse                               ; 021D _ 68, 00000100(d)
        push    dword [ebp-20H]                         ; 0222 _ FF. 75, E0
        call    sheet_setbuf                            ; 0225 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 022A _ 83. C4, 20
        mov     ecx, dword [ysize]                      ; 022D _ 8B. 0D, 00000204(d)
        mov     edx, dword [xsize]                      ; 0233 _ 8B. 15, 00000200(d)
        mov     eax, dword [buf_back]                   ; 0239 _ A1, 000000F8(d)
        sub     esp, 4                                  ; 023E _ 83. EC, 04
        push    ecx                                     ; 0241 _ 51
        push    edx                                     ; 0242 _ 52
        push    eax                                     ; 0243 _ 50
        call    init_screen8                            ; 0244 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0249 _ 83. C4, 10
        sub     esp, 8                                  ; 024C _ 83. EC, 08
        push    99                                      ; 024F _ 6A, 63
        push    buf_mouse                               ; 0251 _ 68, 00000100(d)
        call    init_mouse_cursor                       ; 0256 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 025B _ 83. C4, 10
        push    0                                       ; 025E _ 6A, 00
        push    0                                       ; 0260 _ 6A, 00
        push    dword [ebp-24H]                         ; 0262 _ FF. 75, DC
        push    dword [ebp-14H]                         ; 0265 _ FF. 75, EC
        call    sheet_slide                             ; 0268 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 026D _ 83. C4, 10
        mov     eax, dword [xsize]                      ; 0270 _ A1, 00000200(d)
        sub     eax, 16                                 ; 0275 _ 83. E8, 10
        mov     edx, eax                                ; 0278 _ 89. C2
        shr     edx, 31                                 ; 027A _ C1. EA, 1F
        add     eax, edx                                ; 027D _ 01. D0
        sar     eax, 1                                  ; 027F _ D1. F8
        mov     dword [mx], eax                         ; 0281 _ A3, 000000F0(d)
        mov     eax, dword [ysize]                      ; 0286 _ A1, 00000204(d)
        sub     eax, 44                                 ; 028B _ 83. E8, 2C
        mov     edx, eax                                ; 028E _ 89. C2
        shr     edx, 31                                 ; 0290 _ C1. EA, 1F
        add     eax, edx                                ; 0293 _ 01. D0
        sar     eax, 1                                  ; 0295 _ D1. F8
        mov     dword [my], eax                         ; 0297 _ A3, 000000F4(d)
        mov     edx, dword [my]                         ; 029C _ 8B. 15, 000000F4(d)
        mov     eax, dword [mx]                         ; 02A2 _ A1, 000000F0(d)
        push    edx                                     ; 02A7 _ 52
        push    eax                                     ; 02A8 _ 50
        push    dword [ebp-20H]                         ; 02A9 _ FF. 75, E0
        push    dword [ebp-14H]                         ; 02AC _ FF. 75, EC
        call    sheet_slide                             ; 02AF _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 02B4 _ 83. C4, 10
        sub     esp, 4                                  ; 02B7 _ 83. EC, 04
        push    0                                       ; 02BA _ 6A, 00
        push    dword [ebp-24H]                         ; 02BC _ FF. 75, DC
        push    dword [ebp-14H]                         ; 02BF _ FF. 75, EC
        call    sheet_updown                            ; 02C2 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 02C7 _ 83. C4, 10
        sub     esp, 4                                  ; 02CA _ 83. EC, 04
        push    1                                       ; 02CD _ 6A, 01
        push    dword [ebp-20H]                         ; 02CF _ FF. 75, E0
        push    dword [ebp-14H]                         ; 02D2 _ FF. 75, EC
        call    sheet_updown                            ; 02D5 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 02DA _ 83. C4, 10
        mov     eax, dword [ebp-14H]                    ; 02DD _ 8B. 45, EC
        sub     esp, 12                                 ; 02E0 _ 83. EC, 0C
        push    eax                                     ; 02E3 _ 50
        call    intToHexStr                             ; 02E4 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 02E9 _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 02EC _ 89. 45, F0
        mov     eax, dword [xsize]                      ; 02EF _ A1, 00000200(d)
        sub     esp, 8                                  ; 02F4 _ 83. EC, 08
        push    dword [ebp-10H]                         ; 02F7 _ FF. 75, F0
        push    7                                       ; 02FA _ 6A, 07
        push    104                                     ; 02FC _ 6A, 68
        push    104                                     ; 02FE _ 6A, 68
        push    eax                                     ; 0300 _ 50
        push    dword [ebp-2CH]                         ; 0301 _ FF. 75, D4
        call    showString                              ; 0304 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0309 _ 83. C4, 20
        mov     eax, dword [buf_back]                   ; 030C _ A1, 000000F8(d)
        sub     esp, 12                                 ; 0311 _ 83. EC, 0C
        push    eax                                     ; 0314 _ 50
        call    intToHexStr                             ; 0315 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 031A _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 031D _ 89. 45, F0
        mov     eax, dword [xsize]                      ; 0320 _ A1, 00000200(d)
        sub     esp, 8                                  ; 0325 _ 83. EC, 08
        push    dword [ebp-10H]                         ; 0328 _ FF. 75, F0
        push    7                                       ; 032B _ 6A, 07
        push    80                                      ; 032D _ 6A, 50
        push    80                                      ; 032F _ 6A, 50
        push    eax                                     ; 0331 _ 50
        push    dword [ebp-2CH]                         ; 0332 _ FF. 75, D4
        call    showString                              ; 0335 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 033A _ 83. C4, 20
        call    io_sti                                  ; 033D _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 0342 _ 83. EC, 0C
        push    mdec                                    ; 0345 _ 68, 000000E0(d)
        call    enable_mouse                            ; 034A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 034F _ 83. C4, 10
        mov     dword [ebp-0CH], 0                      ; 0352 _ C7. 45, F4, 00000000
        mov     dword [ebp-30H], 0                      ; 0359 _ C7. 45, D0, 00000000
?_001:  call    io_cli                                  ; 0360 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 0365 _ 83. EC, 0C
        push    keyinfo                                 ; 0368 _ 68, 00000020(d)
        call    fifo8_status                            ; 036D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0372 _ 83. C4, 10
        mov     ebx, eax                                ; 0375 _ 89. C3
        sub     esp, 12                                 ; 0377 _ 83. EC, 0C
        push    mouseinfo                               ; 037A _ 68, 00000008(d)
        call    fifo8_status                            ; 037F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0384 _ 83. C4, 10
        add     eax, ebx                                ; 0387 _ 01. D8
        test    eax, eax                                ; 0389 _ 85. C0
        jnz     ?_002                                   ; 038B _ 75, 0C
        call    io_sti                                  ; 038D _ E8, FFFFFFFC(rel)
        call    io_hlt                                  ; 0392 _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 0397 _ EB, C7
; CMain End of function

?_002:  ; Local function
        sub     esp, 12                                 ; 0399 _ 83. EC, 0C
        push    keyinfo                                 ; 039C _ 68, 00000020(d)
        call    fifo8_status                            ; 03A1 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03A6 _ 83. C4, 10
        test    eax, eax                                ; 03A9 _ 85. C0
        jz      ?_004                                   ; 03AB _ 74, 73
        call    io_sti                                  ; 03AD _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 03B2 _ 83. EC, 0C
        push    keyinfo                                 ; 03B5 _ 68, 00000020(d)
        call    fifo8_get                               ; 03BA _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03BF _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 03C2 _ 89. 45, F4
        cmp     dword [ebp-0CH], 28                     ; 03C5 _ 83. 7D, F4, 1C
        jnz     ?_001                                   ; 03C9 _ 75, 95
        mov     ecx, dword [xsize]                      ; 03CB _ 8B. 0D, 00000200(d)
        mov     edx, dword [ebp-30H]                    ; 03D1 _ 8B. 55, D0
        mov     eax, edx                                ; 03D4 _ 89. D0
        shl     eax, 2                                  ; 03D6 _ C1. E0, 02
        add     eax, edx                                ; 03D9 _ 01. D0
        shl     eax, 2                                  ; 03DB _ C1. E0, 02
        mov     edx, eax                                ; 03DE _ 89. C2
        mov     eax, dword [ebp-18H]                    ; 03E0 _ 8B. 45, E8
        add     eax, edx                                ; 03E3 _ 01. D0
        sub     esp, 12                                 ; 03E5 _ 83. EC, 0C
        push    7                                       ; 03E8 _ 6A, 07
        push    ecx                                     ; 03EA _ 51
        push    dword [ebp-30H]                         ; 03EB _ FF. 75, D0
        push    dword [ebp-2CH]                         ; 03EE _ FF. 75, D4
        push    eax                                     ; 03F1 _ 50
        call    showMemoryInfo                          ; 03F2 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 03F7 _ 83. C4, 20
        add     dword [ebp-30H], 1                      ; 03FA _ 83. 45, D0, 01
        mov     eax, dword [ebp-30H]                    ; 03FE _ 8B. 45, D0
        cmp     eax, dword [ebp-1CH]                    ; 0401 _ 3B. 45, E4
        jle     ?_003                                   ; 0404 _ 7E, 07
        mov     dword [ebp-30H], 0                      ; 0406 _ C7. 45, D0, 00000000
?_003:  sub     esp, 12                                 ; 040D _ 83. EC, 0C
        push    dword [ebp-14H]                         ; 0410 _ FF. 75, EC
        call    sheet_refresh                           ; 0413 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0418 _ 83. C4, 10
        jmp     ?_001                                   ; 041B _ E9, FFFFFF40

?_004:  ; Local function
        sub     esp, 12                                 ; 0420 _ 83. EC, 0C
        push    mouseinfo                               ; 0423 _ 68, 00000008(d)
        call    fifo8_status                            ; 0428 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 042D _ 83. C4, 10
        test    eax, eax                                ; 0430 _ 85. C0
        je      ?_001                                   ; 0432 _ 0F 84, FFFFFF28
        call    io_sti                                  ; 0438 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 043D _ 83. EC, 08
        push    dword [ebp-20H]                         ; 0440 _ FF. 75, E0
        push    dword [ebp-14H]                         ; 0443 _ FF. 75, EC
        call    show_mouse_info                         ; 0446 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 044B _ 83. C4, 10
        jmp     ?_001                                   ; 044E _ E9, FFFFFF0D

initBootInfo:; Function begin
        push    ebp                                     ; 0453 _ 55
        mov     ebp, esp                                ; 0454 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 0456 _ 8B. 45, 08
        mov     dword [eax], 655360                     ; 0459 _ C7. 00, 000A0000
        mov     eax, dword [ebp+8H]                     ; 045F _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 320                      ; 0462 _ 66: C7. 40, 04, 0140
        mov     eax, dword [ebp+8H]                     ; 0468 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 200                      ; 046B _ 66: C7. 40, 06, 00C8
        nop                                             ; 0471 _ 90
        pop     ebp                                     ; 0472 _ 5D
        ret                                             ; 0473 _ C3
; initBootInfo End of function

init_palette:; Function begin
        push    ebp                                     ; 0474 _ 55
        mov     ebp, esp                                ; 0475 _ 89. E5
        sub     esp, 8                                  ; 0477 _ 83. EC, 08
        sub     esp, 4                                  ; 047A _ 83. EC, 04
        push    table_rgb.1648                          ; 047D _ 68, 00000020(d)
        push    15                                      ; 0482 _ 6A, 0F
        push    0                                       ; 0484 _ 6A, 00
        call    set_palette                             ; 0486 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 048B _ 83. C4, 10
        nop                                             ; 048E _ 90
        leave                                           ; 048F _ C9
        ret                                             ; 0490 _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 0491 _ 55
        mov     ebp, esp                                ; 0492 _ 89. E5
        sub     esp, 24                                 ; 0494 _ 83. EC, 18
        call    io_load_eflags                          ; 0497 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 049C _ 89. 45, F4
        call    io_cli                                  ; 049F _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 04A4 _ 83. EC, 08
        push    dword [ebp+8H]                          ; 04A7 _ FF. 75, 08
        push    968                                     ; 04AA _ 68, 000003C8
        call    io_out8                                 ; 04AF _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 04B4 _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 04B7 _ 8B. 45, 08
        mov     dword [ebp-10H], eax                    ; 04BA _ 89. 45, F0
        jmp     ?_006                                   ; 04BD _ EB, 65

?_005:  mov     eax, dword [ebp+10H]                    ; 04BF _ 8B. 45, 10
        movzx   eax, byte [eax]                         ; 04C2 _ 0F B6. 00
        shr     al, 2                                   ; 04C5 _ C0. E8, 02
        movzx   eax, al                                 ; 04C8 _ 0F B6. C0
        sub     esp, 8                                  ; 04CB _ 83. EC, 08
        push    eax                                     ; 04CE _ 50
        push    969                                     ; 04CF _ 68, 000003C9
        call    io_out8                                 ; 04D4 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 04D9 _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 04DC _ 8B. 45, 10
        add     eax, 1                                  ; 04DF _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 04E2 _ 0F B6. 00
        shr     al, 2                                   ; 04E5 _ C0. E8, 02
        movzx   eax, al                                 ; 04E8 _ 0F B6. C0
        sub     esp, 8                                  ; 04EB _ 83. EC, 08
        push    eax                                     ; 04EE _ 50
        push    969                                     ; 04EF _ 68, 000003C9
        call    io_out8                                 ; 04F4 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 04F9 _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 04FC _ 8B. 45, 10
        add     eax, 2                                  ; 04FF _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 0502 _ 0F B6. 00
        shr     al, 2                                   ; 0505 _ C0. E8, 02
        movzx   eax, al                                 ; 0508 _ 0F B6. C0
        sub     esp, 8                                  ; 050B _ 83. EC, 08
        push    eax                                     ; 050E _ 50
        push    969                                     ; 050F _ 68, 000003C9
        call    io_out8                                 ; 0514 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0519 _ 83. C4, 10
        add     dword [ebp+10H], 3                      ; 051C _ 83. 45, 10, 03
        add     dword [ebp-10H], 1                      ; 0520 _ 83. 45, F0, 01
?_006:  mov     eax, dword [ebp-10H]                    ; 0524 _ 8B. 45, F0
        cmp     eax, dword [ebp+0CH]                    ; 0527 _ 3B. 45, 0C
        jle     ?_005                                   ; 052A _ 7E, 93
        sub     esp, 12                                 ; 052C _ 83. EC, 0C
        push    dword [ebp-0CH]                         ; 052F _ FF. 75, F4
        call    io_store_eflags                         ; 0532 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0537 _ 83. C4, 10
        nop                                             ; 053A _ 90
        leave                                           ; 053B _ C9
        ret                                             ; 053C _ C3
; set_palette End of function

boxfill8:; Function begin
        push    ebp                                     ; 053D _ 55
        mov     ebp, esp                                ; 053E _ 89. E5
        sub     esp, 20                                 ; 0540 _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 0543 _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 0546 _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 0549 _ 8B. 45, 18
        mov     dword [ebp-4H], eax                     ; 054C _ 89. 45, FC
        jmp     ?_010                                   ; 054F _ EB, 33

?_007:  mov     eax, dword [ebp+14H]                    ; 0551 _ 8B. 45, 14
        mov     dword [ebp-8H], eax                     ; 0554 _ 89. 45, F8
        jmp     ?_009                                   ; 0557 _ EB, 1F

?_008:  mov     eax, dword [ebp-4H]                     ; 0559 _ 8B. 45, FC
        imul    eax, dword [ebp+0CH]                    ; 055C _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0560 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0562 _ 8B. 45, F8
        add     eax, edx                                ; 0565 _ 01. D0
        mov     edx, eax                                ; 0567 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0569 _ 8B. 45, 08
        add     edx, eax                                ; 056C _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 056E _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0572 _ 88. 02
        add     dword [ebp-8H], 1                       ; 0574 _ 83. 45, F8, 01
?_009:  mov     eax, dword [ebp-8H]                     ; 0578 _ 8B. 45, F8
        cmp     eax, dword [ebp+1CH]                    ; 057B _ 3B. 45, 1C
        jle     ?_008                                   ; 057E _ 7E, D9
        add     dword [ebp-4H], 1                       ; 0580 _ 83. 45, FC, 01
?_010:  mov     eax, dword [ebp-4H]                     ; 0584 _ 8B. 45, FC
        cmp     eax, dword [ebp+20H]                    ; 0587 _ 3B. 45, 20
        jle     ?_007                                   ; 058A _ 7E, C5
        nop                                             ; 058C _ 90
        leave                                           ; 058D _ C9
        ret                                             ; 058E _ C3
; boxfill8 End of function

showString:; Function begin
        push    ebp                                     ; 058F _ 55
        mov     ebp, esp                                ; 0590 _ 89. E5
        sub     esp, 24                                 ; 0592 _ 83. EC, 18
        mov     eax, dword [ebp+18H]                    ; 0595 _ 8B. 45, 18
        mov     byte [ebp-0CH], al                      ; 0598 _ 88. 45, F4
        jmp     ?_012                                   ; 059B _ EB, 37

?_011:  mov     eax, dword [ebp+1CH]                    ; 059D _ 8B. 45, 1C
        movzx   eax, byte [eax]                         ; 05A0 _ 0F B6. 00
        movzx   eax, al                                 ; 05A3 _ 0F B6. C0
        shl     eax, 4                                  ; 05A6 _ C1. E0, 04
        lea     edx, [systemFont+eax]                   ; 05A9 _ 8D. 90, 00000000(d)
        movsx   eax, byte [ebp-0CH]                     ; 05AF _ 0F BE. 45, F4
        sub     esp, 8                                  ; 05B3 _ 83. EC, 08
        push    edx                                     ; 05B6 _ 52
        push    eax                                     ; 05B7 _ 50
        push    dword [ebp+14H]                         ; 05B8 _ FF. 75, 14
        push    dword [ebp+10H]                         ; 05BB _ FF. 75, 10
        push    dword [ebp+0CH]                         ; 05BE _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 05C1 _ FF. 75, 08
        call    showChar8                               ; 05C4 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 05C9 _ 83. C4, 20
        add     dword [ebp+1CH], 1                      ; 05CC _ 83. 45, 1C, 01
        add     dword [ebp+10H], 8                      ; 05D0 _ 83. 45, 10, 08
?_012:  mov     eax, dword [ebp+1CH]                    ; 05D4 _ 8B. 45, 1C
        movzx   eax, byte [eax]                         ; 05D7 _ 0F B6. 00
        test    al, al                                  ; 05DA _ 84. C0
        jnz     ?_011                                   ; 05DC _ 75, BF
        nop                                             ; 05DE _ 90
        leave                                           ; 05DF _ C9
        ret                                             ; 05E0 _ C3
; showString End of function

showChar8:; Function begin
        push    ebp                                     ; 05E1 _ 55
        mov     ebp, esp                                ; 05E2 _ 89. E5
        sub     esp, 20                                 ; 05E4 _ 83. EC, 14
        mov     eax, dword [ebp+18H]                    ; 05E7 _ 8B. 45, 18
        mov     byte [ebp-14H], al                      ; 05EA _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 05ED _ C7. 45, FC, 00000000
        jmp     ?_022                                   ; 05F4 _ E9, 0000016C

?_013:  mov     edx, dword [ebp-4H]                     ; 05F9 _ 8B. 55, FC
        mov     eax, dword [ebp+1CH]                    ; 05FC _ 8B. 45, 1C
        add     eax, edx                                ; 05FF _ 01. D0
        movzx   eax, byte [eax]                         ; 0601 _ 0F B6. 00
        mov     byte [ebp-5H], al                       ; 0604 _ 88. 45, FB
        cmp     byte [ebp-5H], 0                        ; 0607 _ 80. 7D, FB, 00
        jns     ?_014                                   ; 060B _ 79, 20
        mov     edx, dword [ebp+14H]                    ; 060D _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0610 _ 8B. 45, FC
        add     eax, edx                                ; 0613 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0615 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0619 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 061B _ 8B. 45, 10
        add     eax, edx                                ; 061E _ 01. D0
        mov     edx, eax                                ; 0620 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0622 _ 8B. 45, 08
        add     edx, eax                                ; 0625 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0627 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 062B _ 88. 02
?_014:  movsx   eax, byte [ebp-5H]                      ; 062D _ 0F BE. 45, FB
        and     eax, 40H                                ; 0631 _ 83. E0, 40
        test    eax, eax                                ; 0634 _ 85. C0
        jz      ?_015                                   ; 0636 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 0638 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 063B _ 8B. 45, FC
        add     eax, edx                                ; 063E _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0640 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0644 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0646 _ 8B. 45, 10
        add     eax, edx                                ; 0649 _ 01. D0
        lea     edx, [eax+1H]                           ; 064B _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 064E _ 8B. 45, 08
        add     edx, eax                                ; 0651 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0653 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0657 _ 88. 02
?_015:  movsx   eax, byte [ebp-5H]                      ; 0659 _ 0F BE. 45, FB
        and     eax, 20H                                ; 065D _ 83. E0, 20
        test    eax, eax                                ; 0660 _ 85. C0
        jz      ?_016                                   ; 0662 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 0664 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0667 _ 8B. 45, FC
        add     eax, edx                                ; 066A _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 066C _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0670 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0672 _ 8B. 45, 10
        add     eax, edx                                ; 0675 _ 01. D0
        lea     edx, [eax+2H]                           ; 0677 _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 067A _ 8B. 45, 08
        add     edx, eax                                ; 067D _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 067F _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0683 _ 88. 02
?_016:  movsx   eax, byte [ebp-5H]                      ; 0685 _ 0F BE. 45, FB
        and     eax, 10H                                ; 0689 _ 83. E0, 10
        test    eax, eax                                ; 068C _ 85. C0
        jz      ?_017                                   ; 068E _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 0690 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0693 _ 8B. 45, FC
        add     eax, edx                                ; 0696 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0698 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 069C _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 069E _ 8B. 45, 10
        add     eax, edx                                ; 06A1 _ 01. D0
        lea     edx, [eax+3H]                           ; 06A3 _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 06A6 _ 8B. 45, 08
        add     edx, eax                                ; 06A9 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 06AB _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 06AF _ 88. 02
?_017:  movsx   eax, byte [ebp-5H]                      ; 06B1 _ 0F BE. 45, FB
        and     eax, 08H                                ; 06B5 _ 83. E0, 08
        test    eax, eax                                ; 06B8 _ 85. C0
        jz      ?_018                                   ; 06BA _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 06BC _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 06BF _ 8B. 45, FC
        add     eax, edx                                ; 06C2 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 06C4 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 06C8 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 06CA _ 8B. 45, 10
        add     eax, edx                                ; 06CD _ 01. D0
        lea     edx, [eax+4H]                           ; 06CF _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 06D2 _ 8B. 45, 08
        add     edx, eax                                ; 06D5 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 06D7 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 06DB _ 88. 02
?_018:  movsx   eax, byte [ebp-5H]                      ; 06DD _ 0F BE. 45, FB
        and     eax, 04H                                ; 06E1 _ 83. E0, 04
        test    eax, eax                                ; 06E4 _ 85. C0
        jz      ?_019                                   ; 06E6 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 06E8 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 06EB _ 8B. 45, FC
        add     eax, edx                                ; 06EE _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 06F0 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 06F4 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 06F6 _ 8B. 45, 10
        add     eax, edx                                ; 06F9 _ 01. D0
        lea     edx, [eax+5H]                           ; 06FB _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 06FE _ 8B. 45, 08
        add     edx, eax                                ; 0701 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0703 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0707 _ 88. 02
?_019:  movsx   eax, byte [ebp-5H]                      ; 0709 _ 0F BE. 45, FB
        and     eax, 02H                                ; 070D _ 83. E0, 02
        test    eax, eax                                ; 0710 _ 85. C0
        jz      ?_020                                   ; 0712 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 0714 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0717 _ 8B. 45, FC
        add     eax, edx                                ; 071A _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 071C _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0720 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0722 _ 8B. 45, 10
        add     eax, edx                                ; 0725 _ 01. D0
        lea     edx, [eax+6H]                           ; 0727 _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 072A _ 8B. 45, 08
        add     edx, eax                                ; 072D _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 072F _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0733 _ 88. 02
?_020:  movsx   eax, byte [ebp-5H]                      ; 0735 _ 0F BE. 45, FB
        and     eax, 01H                                ; 0739 _ 83. E0, 01
        test    eax, eax                                ; 073C _ 85. C0
        jz      ?_021                                   ; 073E _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 0740 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0743 _ 8B. 45, FC
        add     eax, edx                                ; 0746 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0748 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 074C _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 074E _ 8B. 45, 10
        add     eax, edx                                ; 0751 _ 01. D0
        lea     edx, [eax+7H]                           ; 0753 _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 0756 _ 8B. 45, 08
        add     edx, eax                                ; 0759 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 075B _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 075F _ 88. 02
?_021:  add     dword [ebp-4H], 1                       ; 0761 _ 83. 45, FC, 01
?_022:  cmp     dword [ebp-4H], 15                      ; 0765 _ 83. 7D, FC, 0F
        jle     ?_013                                   ; 0769 _ 0F 8E, FFFFFE8A
        nop                                             ; 076F _ 90
        leave                                           ; 0770 _ C9
        ret                                             ; 0771 _ C3
; showChar8 End of function

init_mouse_cursor:; Function begin
        push    ebp                                     ; 0772 _ 55
        mov     ebp, esp                                ; 0773 _ 89. E5
        sub     esp, 20                                 ; 0775 _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 0778 _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 077B _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 077E _ C7. 45, FC, 00000000
        jmp     ?_029                                   ; 0785 _ E9, 000000B5

?_023:  mov     dword [ebp-8H], 0                       ; 078A _ C7. 45, F8, 00000000
        jmp     ?_028                                   ; 0791 _ E9, 0000009B

?_024:  mov     eax, dword [ebp-4H]                     ; 0796 _ 8B. 45, FC
        shl     eax, 4                                  ; 0799 _ C1. E0, 04
        mov     edx, eax                                ; 079C _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 079E _ 8B. 45, F8
        add     eax, edx                                ; 07A1 _ 01. D0
        add     eax, cursor.1706                        ; 07A3 _ 05, 00000060(d)
        movzx   eax, byte [eax]                         ; 07A8 _ 0F B6. 00
        cmp     al, 42                                  ; 07AB _ 3C, 2A
        jnz     ?_025                                   ; 07AD _ 75, 19
        mov     eax, dword [ebp-4H]                     ; 07AF _ 8B. 45, FC
        shl     eax, 4                                  ; 07B2 _ C1. E0, 04
        mov     edx, eax                                ; 07B5 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 07B7 _ 8B. 45, F8
        add     eax, edx                                ; 07BA _ 01. D0
        mov     edx, eax                                ; 07BC _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 07BE _ 8B. 45, 08
        add     eax, edx                                ; 07C1 _ 01. D0
        mov     byte [eax], 0                           ; 07C3 _ C6. 00, 00
        jmp     ?_027                                   ; 07C6 _ EB, 65

?_025:  mov     eax, dword [ebp-4H]                     ; 07C8 _ 8B. 45, FC
        shl     eax, 4                                  ; 07CB _ C1. E0, 04
        mov     edx, eax                                ; 07CE _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 07D0 _ 8B. 45, F8
        add     eax, edx                                ; 07D3 _ 01. D0
        add     eax, cursor.1706                        ; 07D5 _ 05, 00000060(d)
        movzx   eax, byte [eax]                         ; 07DA _ 0F B6. 00
        cmp     al, 79                                  ; 07DD _ 3C, 4F
        jnz     ?_026                                   ; 07DF _ 75, 19
        mov     eax, dword [ebp-4H]                     ; 07E1 _ 8B. 45, FC
        shl     eax, 4                                  ; 07E4 _ C1. E0, 04
        mov     edx, eax                                ; 07E7 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 07E9 _ 8B. 45, F8
        add     eax, edx                                ; 07EC _ 01. D0
        mov     edx, eax                                ; 07EE _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 07F0 _ 8B. 45, 08
        add     eax, edx                                ; 07F3 _ 01. D0
        mov     byte [eax], 7                           ; 07F5 _ C6. 00, 07
        jmp     ?_027                                   ; 07F8 _ EB, 33

?_026:  mov     eax, dword [ebp-4H]                     ; 07FA _ 8B. 45, FC
        shl     eax, 4                                  ; 07FD _ C1. E0, 04
        mov     edx, eax                                ; 0800 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0802 _ 8B. 45, F8
        add     eax, edx                                ; 0805 _ 01. D0
        add     eax, cursor.1706                        ; 0807 _ 05, 00000060(d)
        movzx   eax, byte [eax]                         ; 080C _ 0F B6. 00
        cmp     al, 46                                  ; 080F _ 3C, 2E
        jnz     ?_027                                   ; 0811 _ 75, 1A
        mov     eax, dword [ebp-4H]                     ; 0813 _ 8B. 45, FC
        shl     eax, 4                                  ; 0816 _ C1. E0, 04
        mov     edx, eax                                ; 0819 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 081B _ 8B. 45, F8
        add     eax, edx                                ; 081E _ 01. D0
        mov     edx, eax                                ; 0820 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0822 _ 8B. 45, 08
        add     edx, eax                                ; 0825 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0827 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 082B _ 88. 02
?_027:  add     dword [ebp-8H], 1                       ; 082D _ 83. 45, F8, 01
?_028:  cmp     dword [ebp-8H], 15                      ; 0831 _ 83. 7D, F8, 0F
        jle     ?_024                                   ; 0835 _ 0F 8E, FFFFFF5B
        add     dword [ebp-4H], 1                       ; 083B _ 83. 45, FC, 01
?_029:  cmp     dword [ebp-4H], 15                      ; 083F _ 83. 7D, FC, 0F
        jle     ?_023                                   ; 0843 _ 0F 8E, FFFFFF41
        nop                                             ; 0849 _ 90
        leave                                           ; 084A _ C9
        ret                                             ; 084B _ C3
; init_mouse_cursor End of function

putblock:; Function begin
        push    ebp                                     ; 084C _ 55
        mov     ebp, esp                                ; 084D _ 89. E5
        push    ebx                                     ; 084F _ 53
        sub     esp, 16                                 ; 0850 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 0853 _ C7. 45, F8, 00000000
        jmp     ?_033                                   ; 085A _ EB, 50

?_030:  mov     dword [ebp-0CH], 0                      ; 085C _ C7. 45, F4, 00000000
        jmp     ?_032                                   ; 0863 _ EB, 3B

?_031:  mov     eax, dword [ebp-8H]                     ; 0865 _ 8B. 45, F8
        imul    eax, dword [ebp+24H]                    ; 0868 _ 0F AF. 45, 24
        mov     edx, eax                                ; 086C _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 086E _ 8B. 45, F4
        add     eax, edx                                ; 0871 _ 01. D0
        mov     edx, eax                                ; 0873 _ 89. C2
        mov     eax, dword [ebp+20H]                    ; 0875 _ 8B. 45, 20
        add     eax, edx                                ; 0878 _ 01. D0
        mov     ecx, dword [ebp+1CH]                    ; 087A _ 8B. 4D, 1C
        mov     edx, dword [ebp-8H]                     ; 087D _ 8B. 55, F8
        add     edx, ecx                                ; 0880 _ 01. CA
        imul    edx, dword [ebp+0CH]                    ; 0882 _ 0F AF. 55, 0C
        mov     ebx, dword [ebp+18H]                    ; 0886 _ 8B. 5D, 18
        mov     ecx, dword [ebp-0CH]                    ; 0889 _ 8B. 4D, F4
        add     ecx, ebx                                ; 088C _ 01. D9
        add     edx, ecx                                ; 088E _ 01. CA
        mov     ecx, edx                                ; 0890 _ 89. D1
        mov     edx, dword [ebp+8H]                     ; 0892 _ 8B. 55, 08
        add     edx, ecx                                ; 0895 _ 01. CA
        movzx   eax, byte [eax]                         ; 0897 _ 0F B6. 00
        mov     byte [edx], al                          ; 089A _ 88. 02
        add     dword [ebp-0CH], 1                      ; 089C _ 83. 45, F4, 01
?_032:  mov     eax, dword [ebp-0CH]                    ; 08A0 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 08A3 _ 3B. 45, 10
        jl      ?_031                                   ; 08A6 _ 7C, BD
        add     dword [ebp-8H], 1                       ; 08A8 _ 83. 45, F8, 01
?_033:  mov     eax, dword [ebp-8H]                     ; 08AC _ 8B. 45, F8
        cmp     eax, dword [ebp+14H]                    ; 08AF _ 3B. 45, 14
        jl      ?_030                                   ; 08B2 _ 7C, A8
        nop                                             ; 08B4 _ 90
        add     esp, 16                                 ; 08B5 _ 83. C4, 10
        pop     ebx                                     ; 08B8 _ 5B
        pop     ebp                                     ; 08B9 _ 5D
        ret                                             ; 08BA _ C3
; putblock End of function

intHandlerFromC:; Function begin
        push    ebp                                     ; 08BB _ 55
        mov     ebp, esp                                ; 08BC _ 89. E5
        sub     esp, 24                                 ; 08BE _ 83. EC, 18
        mov     eax, dword [bootInfo]                   ; 08C1 _ A1, 00000000(d)
        mov     dword [ebp-14H], eax                    ; 08C6 _ 89. 45, EC
        movzx   eax, word [?_123]                       ; 08C9 _ 0F B7. 05, 00000004(d)
        cwde                                            ; 08D0 _ 98
        mov     dword [ebp-10H], eax                    ; 08D1 _ 89. 45, F0
        movzx   eax, word [?_124]                       ; 08D4 _ 0F B7. 05, 00000006(d)
        cwde                                            ; 08DB _ 98
        mov     dword [ebp-0CH], eax                    ; 08DC _ 89. 45, F4
        sub     esp, 8                                  ; 08DF _ 83. EC, 08
        push    33                                      ; 08E2 _ 6A, 21
        push    32                                      ; 08E4 _ 6A, 20
        call    io_out8                                 ; 08E6 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 08EB _ 83. C4, 10
        mov     byte [ebp-15H], 0                       ; 08EE _ C6. 45, EB, 00
        sub     esp, 12                                 ; 08F2 _ 83. EC, 0C
        push    96                                      ; 08F5 _ 6A, 60
        call    io_in8                                  ; 08F7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 08FC _ 83. C4, 10
        mov     byte [ebp-15H], al                      ; 08FF _ 88. 45, EB
        movzx   eax, byte [ebp-15H]                     ; 0902 _ 0F B6. 45, EB
        sub     esp, 8                                  ; 0906 _ 83. EC, 08
        push    eax                                     ; 0909 _ 50
        push    keyinfo                                 ; 090A _ 68, 00000020(d)
        call    fifo8_put                               ; 090F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0914 _ 83. C4, 10
        nop                                             ; 0917 _ 90
        leave                                           ; 0918 _ C9
        ret                                             ; 0919 _ C3
; intHandlerFromC End of function

charToHexVal:; Function begin
        push    ebp                                     ; 091A _ 55
        mov     ebp, esp                                ; 091B _ 89. E5
        sub     esp, 4                                  ; 091D _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 0920 _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 0923 _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 0926 _ 80. 7D, FC, 09
        jle     ?_034                                   ; 092A _ 7E, 09
        movzx   eax, byte [ebp-4H]                      ; 092C _ 0F B6. 45, FC
        add     eax, 55                                 ; 0930 _ 83. C0, 37
        jmp     ?_035                                   ; 0933 _ EB, 07

?_034:  movzx   eax, byte [ebp-4H]                      ; 0935 _ 0F B6. 45, FC
        add     eax, 48                                 ; 0939 _ 83. C0, 30
?_035:  leave                                           ; 093C _ C9
        ret                                             ; 093D _ C3
; charToHexVal End of function

charToHexStr:; Function begin
        push    ebp                                     ; 093E _ 55
        mov     ebp, esp                                ; 093F _ 89. E5
        sub     esp, 20                                 ; 0941 _ 83. EC, 14
        mov     eax, dword [ebp+8H]                     ; 0944 _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 0947 _ 88. 45, EC
        movzx   eax, byte [ebp-14H]                     ; 094A _ 0F B6. 45, EC
        and     eax, 0FH                                ; 094E _ 83. E0, 0F
        mov     byte [ebp-1H], al                       ; 0951 _ 88. 45, FF
        movsx   eax, byte [ebp-1H]                      ; 0954 _ 0F BE. 45, FF
        push    eax                                     ; 0958 _ 50
        call    charToHexVal                            ; 0959 _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 095E _ 83. C4, 04
        mov     byte [?_122], al                        ; 0961 _ A2, 00000003(d)
        shr     byte [ebp-14H], 4                       ; 0966 _ C0. 6D, EC, 04
        movzx   eax, byte [ebp-14H]                     ; 096A _ 0F B6. 45, EC
        movsx   eax, al                                 ; 096E _ 0F BE. C0
        push    eax                                     ; 0971 _ 50
        call    charToHexVal                            ; 0972 _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 0977 _ 83. C4, 04
        mov     byte [?_121], al                        ; 097A _ A2, 00000002(d)
        mov     eax, keyval                             ; 097F _ B8, 00000000(d)
        leave                                           ; 0984 _ C9
        ret                                             ; 0985 _ C3
; charToHexStr End of function

intToHexStr:; Function begin
        push    ebp                                     ; 0986 _ 55
        mov     ebp, esp                                ; 0987 _ 89. E5
        sub     esp, 16                                 ; 0989 _ 83. EC, 10
        mov     byte [str.1753], 48                     ; 098C _ C6. 05, 00000208(d), 30
        mov     byte [?_125], 88                        ; 0993 _ C6. 05, 00000209(d), 58
        mov     byte [?_126], 0                         ; 099A _ C6. 05, 00000212(d), 00
        mov     dword [ebp-8H], 2                       ; 09A1 _ C7. 45, F8, 00000002
        mov     dword [ebp-0CH], 7                      ; 09A8 _ C7. 45, F4, 00000007
        jmp     ?_039                                   ; 09AF _ EB, 45

?_036:  mov     eax, dword [ebp+8H]                     ; 09B1 _ 8B. 45, 08
        and     eax, 0FH                                ; 09B4 _ 83. E0, 0F
        mov     dword [ebp-4H], eax                     ; 09B7 _ 89. 45, FC
        cmp     dword [ebp-4H], 9                       ; 09BA _ 83. 7D, FC, 09
        jg      ?_037                                   ; 09BE _ 7F, 18
        mov     eax, dword [ebp-4H]                     ; 09C0 _ 8B. 45, FC
        lea     ecx, [eax+30H]                          ; 09C3 _ 8D. 48, 30
        mov     edx, dword [ebp-8H]                     ; 09C6 _ 8B. 55, F8
        mov     eax, dword [ebp-0CH]                    ; 09C9 _ 8B. 45, F4
        add     eax, edx                                ; 09CC _ 01. D0
        mov     edx, ecx                                ; 09CE _ 89. CA
        mov     byte [str.1753+eax], dl                 ; 09D0 _ 88. 90, 00000208(d)
        jmp     ?_038                                   ; 09D6 _ EB, 16

?_037:  mov     eax, dword [ebp-4H]                     ; 09D8 _ 8B. 45, FC
        lea     ecx, [eax+37H]                          ; 09DB _ 8D. 48, 37
        mov     edx, dword [ebp-8H]                     ; 09DE _ 8B. 55, F8
        mov     eax, dword [ebp-0CH]                    ; 09E1 _ 8B. 45, F4
        add     eax, edx                                ; 09E4 _ 01. D0
        mov     edx, ecx                                ; 09E6 _ 89. CA
        mov     byte [str.1753+eax], dl                 ; 09E8 _ 88. 90, 00000208(d)
?_038:  shr     dword [ebp+8H], 4                       ; 09EE _ C1. 6D, 08, 04
        sub     dword [ebp-0CH], 1                      ; 09F2 _ 83. 6D, F4, 01
?_039:  cmp     dword [ebp-0CH], 0                      ; 09F6 _ 83. 7D, F4, 00
        jns     ?_036                                   ; 09FA _ 79, B5
        mov     eax, str.1753                           ; 09FC _ B8, 00000208(d)
        leave                                           ; 0A01 _ C9
        ret                                             ; 0A02 _ C3
; intToHexStr End of function

wait_KBC_sendReady:; Function begin
        push    ebp                                     ; 0A03 _ 55
        mov     ebp, esp                                ; 0A04 _ 89. E5
        sub     esp, 8                                  ; 0A06 _ 83. EC, 08
?_040:  sub     esp, 12                                 ; 0A09 _ 83. EC, 0C
        push    100                                     ; 0A0C _ 6A, 64
        call    io_in8                                  ; 0A0E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0A13 _ 83. C4, 10
        and     eax, 02H                                ; 0A16 _ 83. E0, 02
        test    eax, eax                                ; 0A19 _ 85. C0
        jz      ?_041                                   ; 0A1B _ 74, 02
        jmp     ?_040                                   ; 0A1D _ EB, EA
; wait_KBC_sendReady End of function

?_041:  ; Local function
        nop                                             ; 0A1F _ 90
        nop                                             ; 0A20 _ 90
        leave                                           ; 0A21 _ C9
        ret                                             ; 0A22 _ C3

init_keyboard:; Function begin
        push    ebp                                     ; 0A23 _ 55
        mov     ebp, esp                                ; 0A24 _ 89. E5
        sub     esp, 8                                  ; 0A26 _ 83. EC, 08
        call    wait_KBC_sendReady                      ; 0A29 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0A2E _ 83. EC, 08
        push    96                                      ; 0A31 _ 6A, 60
        push    100                                     ; 0A33 _ 6A, 64
        call    io_out8                                 ; 0A35 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0A3A _ 83. C4, 10
        call    wait_KBC_sendReady                      ; 0A3D _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0A42 _ 83. EC, 08
        push    71                                      ; 0A45 _ 6A, 47
        push    96                                      ; 0A47 _ 6A, 60
        call    io_out8                                 ; 0A49 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0A4E _ 83. C4, 10
        nop                                             ; 0A51 _ 90
        leave                                           ; 0A52 _ C9
        ret                                             ; 0A53 _ C3
; init_keyboard End of function

enable_mouse:; Function begin
        push    ebp                                     ; 0A54 _ 55
        mov     ebp, esp                                ; 0A55 _ 89. E5
        sub     esp, 8                                  ; 0A57 _ 83. EC, 08
        call    wait_KBC_sendReady                      ; 0A5A _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0A5F _ 83. EC, 08
        push    212                                     ; 0A62 _ 68, 000000D4
        push    100                                     ; 0A67 _ 6A, 64
        call    io_out8                                 ; 0A69 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0A6E _ 83. C4, 10
        call    wait_KBC_sendReady                      ; 0A71 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0A76 _ 83. EC, 08
        push    244                                     ; 0A79 _ 68, 000000F4
        push    96                                      ; 0A7E _ 6A, 60
        call    io_out8                                 ; 0A80 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0A85 _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 0A88 _ 8B. 45, 08
        mov     byte [eax+3H], 0                        ; 0A8B _ C6. 40, 03, 00
        nop                                             ; 0A8F _ 90
        leave                                           ; 0A90 _ C9
        ret                                             ; 0A91 _ C3
; enable_mouse End of function

intHandlerFromMouse:; Function begin
        push    ebp                                     ; 0A92 _ 55
        mov     ebp, esp                                ; 0A93 _ 89. E5
        sub     esp, 24                                 ; 0A95 _ 83. EC, 18
        sub     esp, 8                                  ; 0A98 _ 83. EC, 08
        push    32                                      ; 0A9B _ 6A, 20
        push    160                                     ; 0A9D _ 68, 000000A0
        call    io_out8                                 ; 0AA2 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0AA7 _ 83. C4, 10
        sub     esp, 8                                  ; 0AAA _ 83. EC, 08
        push    32                                      ; 0AAD _ 6A, 20
        push    32                                      ; 0AAF _ 6A, 20
        call    io_out8                                 ; 0AB1 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0AB6 _ 83. C4, 10
        sub     esp, 12                                 ; 0AB9 _ 83. EC, 0C
        push    96                                      ; 0ABC _ 6A, 60
        call    io_in8                                  ; 0ABE _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0AC3 _ 83. C4, 10
        mov     byte [ebp-9H], al                       ; 0AC6 _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 0AC9 _ 0F B6. 45, F7
        sub     esp, 8                                  ; 0ACD _ 83. EC, 08
        push    eax                                     ; 0AD0 _ 50
        push    mouseinfo                               ; 0AD1 _ 68, 00000008(d)
        call    fifo8_put                               ; 0AD6 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0ADB _ 83. C4, 10
        nop                                             ; 0ADE _ 90
        leave                                           ; 0ADF _ C9
        ret                                             ; 0AE0 _ C3
; intHandlerFromMouse End of function

fifo8_init:; Function begin
        push    ebp                                     ; 0AE1 _ 55
        mov     ebp, esp                                ; 0AE2 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 0AE4 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 0AE7 _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 0AEA _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 0AED _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 0AF0 _ 8B. 55, 10
        mov     dword [eax], edx                        ; 0AF3 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 0AF5 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 0AF8 _ 8B. 55, 0C
        mov     dword [eax+10H], edx                    ; 0AFB _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 0AFE _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 0B01 _ C7. 40, 14, 00000000
        mov     eax, dword [ebp+8H]                     ; 0B08 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 0B0B _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 0B12 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 0B15 _ C7. 40, 08, 00000000
        nop                                             ; 0B1C _ 90
        pop     ebp                                     ; 0B1D _ 5D
        ret                                             ; 0B1E _ C3
; fifo8_init End of function

fifo8_put:; Function begin
        push    ebp                                     ; 0B1F _ 55
        mov     ebp, esp                                ; 0B20 _ 89. E5
        sub     esp, 4                                  ; 0B22 _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 0B25 _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 0B28 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0B2B _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0B2E _ 8B. 40, 10
        test    eax, eax                                ; 0B31 _ 85. C0
        jnz     ?_042                                   ; 0B33 _ 75, 18
        mov     eax, dword [ebp+8H]                     ; 0B35 _ 8B. 45, 08
        mov     eax, dword [eax+14H]                    ; 0B38 _ 8B. 40, 14
        or      eax, 01H                                ; 0B3B _ 83. C8, 01
        mov     edx, eax                                ; 0B3E _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0B40 _ 8B. 45, 08
        mov     dword [eax+14H], edx                    ; 0B43 _ 89. 50, 14
        mov     eax, 4294967295                         ; 0B46 _ B8, FFFFFFFF
        jmp     ?_044                                   ; 0B4B _ EB, 50

?_042:  mov     eax, dword [ebp+8H]                     ; 0B4D _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 0B50 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 0B52 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0B55 _ 8B. 40, 04
        add     edx, eax                                ; 0B58 _ 01. C2
        movzx   eax, byte [ebp-4H]                      ; 0B5A _ 0F B6. 45, FC
        mov     byte [edx], al                          ; 0B5E _ 88. 02
        mov     eax, dword [ebp+8H]                     ; 0B60 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0B63 _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 0B66 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0B69 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 0B6C _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0B6F _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 0B72 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0B75 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0B78 _ 8B. 40, 0C
        cmp     edx, eax                                ; 0B7B _ 39. C2
        jnz     ?_043                                   ; 0B7D _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 0B7F _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 0B82 _ C7. 40, 04, 00000000
?_043:  mov     eax, dword [ebp+8H]                     ; 0B89 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0B8C _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 0B8F _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 0B92 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 0B95 _ 89. 50, 10
        mov     eax, 0                                  ; 0B98 _ B8, 00000000
?_044:  leave                                           ; 0B9D _ C9
        ret                                             ; 0B9E _ C3
; fifo8_put End of function

fifo8_get:; Function begin
        push    ebp                                     ; 0B9F _ 55
        mov     ebp, esp                                ; 0BA0 _ 89. E5
        sub     esp, 16                                 ; 0BA2 _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 0BA5 _ 8B. 45, 08
        mov     edx, dword [eax+10H]                    ; 0BA8 _ 8B. 50, 10
        mov     eax, dword [ebp+8H]                     ; 0BAB _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0BAE _ 8B. 40, 0C
        cmp     edx, eax                                ; 0BB1 _ 39. C2
        jnz     ?_045                                   ; 0BB3 _ 75, 07
        mov     eax, 4294967295                         ; 0BB5 _ B8, FFFFFFFF
        jmp     ?_047                                   ; 0BBA _ EB, 51

?_045:  mov     eax, dword [ebp+8H]                     ; 0BBC _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 0BBF _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 0BC1 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0BC4 _ 8B. 40, 08
        add     eax, edx                                ; 0BC7 _ 01. D0
        movzx   eax, byte [eax]                         ; 0BC9 _ 0F B6. 00
        movzx   eax, al                                 ; 0BCC _ 0F B6. C0
        mov     dword [ebp-4H], eax                     ; 0BCF _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0BD2 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0BD5 _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 0BD8 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0BDB _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0BDE _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 0BE1 _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 0BE4 _ 8B. 50, 08
        mov     eax, dword [ebp+8H]                     ; 0BE7 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0BEA _ 8B. 40, 0C
        cmp     edx, eax                                ; 0BED _ 39. C2
        jnz     ?_046                                   ; 0BEF _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 0BF1 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 0BF4 _ C7. 40, 08, 00000000
?_046:  mov     eax, dword [ebp+8H]                     ; 0BFB _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0BFE _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 0C01 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0C04 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 0C07 _ 89. 50, 10
        mov     eax, dword [ebp-4H]                     ; 0C0A _ 8B. 45, FC
?_047:  leave                                           ; 0C0D _ C9
        ret                                             ; 0C0E _ C3
; fifo8_get End of function

fifo8_status:; Function begin
        push    ebp                                     ; 0C0F _ 55
        mov     ebp, esp                                ; 0C10 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 0C12 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 0C15 _ 8B. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 0C18 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0C1B _ 8B. 40, 10
        sub     edx, eax                                ; 0C1E _ 29. C2
        mov     eax, edx                                ; 0C20 _ 89. D0
        pop     ebp                                     ; 0C22 _ 5D
        ret                                             ; 0C23 _ C3
; fifo8_status End of function

mouse_decode:; Function begin
        push    ebp                                     ; 0C24 _ 55
        mov     ebp, esp                                ; 0C25 _ 89. E5
        sub     esp, 4                                  ; 0C27 _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 0C2A _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 0C2D _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0C30 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 0C33 _ 0F B6. 40, 03
        test    al, al                                  ; 0C37 _ 84. C0
        jnz     ?_049                                   ; 0C39 _ 75, 17
        cmp     byte [ebp-4H], -6                       ; 0C3B _ 80. 7D, FC, FA
        jnz     ?_048                                   ; 0C3F _ 75, 07
        mov     eax, dword [ebp+8H]                     ; 0C41 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 0C44 _ C6. 40, 03, 01
?_048:  mov     eax, 0                                  ; 0C48 _ B8, 00000000
        jmp     ?_056                                   ; 0C4D _ E9, 0000010F

?_049:  mov     eax, dword [ebp+8H]                     ; 0C52 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 0C55 _ 0F B6. 40, 03
        cmp     al, 1                                   ; 0C59 _ 3C, 01
        jnz     ?_051                                   ; 0C5B _ 75, 28
        movzx   eax, byte [ebp-4H]                      ; 0C5D _ 0F B6. 45, FC
        and     eax, 0C8H                               ; 0C61 _ 25, 000000C8
        cmp     eax, 8                                  ; 0C66 _ 83. F8, 08
        jnz     ?_050                                   ; 0C69 _ 75, 10
        mov     eax, dword [ebp+8H]                     ; 0C6B _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 0C6E _ 0F B6. 55, FC
        mov     byte [eax], dl                          ; 0C72 _ 88. 10
        mov     eax, dword [ebp+8H]                     ; 0C74 _ 8B. 45, 08
        mov     byte [eax+3H], 2                        ; 0C77 _ C6. 40, 03, 02
?_050:  mov     eax, 0                                  ; 0C7B _ B8, 00000000
        jmp     ?_056                                   ; 0C80 _ E9, 000000DC

?_051:  mov     eax, dword [ebp+8H]                     ; 0C85 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 0C88 _ 0F B6. 40, 03
        cmp     al, 2                                   ; 0C8C _ 3C, 02
        jnz     ?_052                                   ; 0C8E _ 75, 1B
        mov     eax, dword [ebp+8H]                     ; 0C90 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 0C93 _ 0F B6. 55, FC
        mov     byte [eax+1H], dl                       ; 0C97 _ 88. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0C9A _ 8B. 45, 08
        mov     byte [eax+3H], 3                        ; 0C9D _ C6. 40, 03, 03
        mov     eax, 0                                  ; 0CA1 _ B8, 00000000
        jmp     ?_056                                   ; 0CA6 _ E9, 000000B6

?_052:  mov     eax, dword [ebp+8H]                     ; 0CAB _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 0CAE _ 0F B6. 40, 03
        cmp     al, 3                                   ; 0CB2 _ 3C, 03
        jne     ?_055                                   ; 0CB4 _ 0F 85, 000000A2
        mov     eax, dword [ebp+8H]                     ; 0CBA _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 0CBD _ 0F B6. 55, FC
        mov     byte [eax+2H], dl                       ; 0CC1 _ 88. 50, 02
        mov     eax, dword [ebp+8H]                     ; 0CC4 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 0CC7 _ C6. 40, 03, 01
        mov     eax, dword [ebp+8H]                     ; 0CCB _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 0CCE _ 0F B6. 00
        movzx   eax, al                                 ; 0CD1 _ 0F B6. C0
        and     eax, 07H                                ; 0CD4 _ 83. E0, 07
        mov     edx, eax                                ; 0CD7 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0CD9 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 0CDC _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 0CDF _ 8B. 45, 08
        movzx   eax, byte [eax+1H]                      ; 0CE2 _ 0F B6. 40, 01
        movzx   edx, al                                 ; 0CE6 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 0CE9 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 0CEC _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0CEF _ 8B. 45, 08
        movzx   eax, byte [eax+2H]                      ; 0CF2 _ 0F B6. 40, 02
        movzx   edx, al                                 ; 0CF6 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 0CF9 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0CFC _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 0CFF _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 0D02 _ 0F B6. 00
        movzx   eax, al                                 ; 0D05 _ 0F B6. C0
        and     eax, 10H                                ; 0D08 _ 83. E0, 10
        test    eax, eax                                ; 0D0B _ 85. C0
        jz      ?_053                                   ; 0D0D _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 0D0F _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0D12 _ 8B. 40, 04
        or      eax, 0FFFFFF00H                         ; 0D15 _ 0D, FFFFFF00
        mov     edx, eax                                ; 0D1A _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0D1C _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 0D1F _ 89. 50, 04
?_053:  mov     eax, dword [ebp+8H]                     ; 0D22 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 0D25 _ 0F B6. 00
        movzx   eax, al                                 ; 0D28 _ 0F B6. C0
        and     eax, 20H                                ; 0D2B _ 83. E0, 20
        test    eax, eax                                ; 0D2E _ 85. C0
        jz      ?_054                                   ; 0D30 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 0D32 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0D35 _ 8B. 40, 08
        or      eax, 0FFFFFF00H                         ; 0D38 _ 0D, FFFFFF00
        mov     edx, eax                                ; 0D3D _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0D3F _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0D42 _ 89. 50, 08
?_054:  mov     eax, dword [ebp+8H]                     ; 0D45 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0D48 _ 8B. 40, 08
        neg     eax                                     ; 0D4B _ F7. D8
        mov     edx, eax                                ; 0D4D _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0D4F _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0D52 _ 89. 50, 08
        mov     eax, 1                                  ; 0D55 _ B8, 00000001
        jmp     ?_056                                   ; 0D5A _ EB, 05

?_055:  mov     eax, 4294967295                         ; 0D5C _ B8, FFFFFFFF
?_056:  leave                                           ; 0D61 _ C9
        ret                                             ; 0D62 _ C3
; mouse_decode End of function

computeMousePosition:; Function begin
        push    ebp                                     ; 0D63 _ 55
        mov     ebp, esp                                ; 0D64 _ 89. E5
        sub     esp, 16                                 ; 0D66 _ 83. EC, 10
        movzx   eax, word [?_123]                       ; 0D69 _ 0F B7. 05, 00000004(d)
        cwde                                            ; 0D70 _ 98
        mov     dword [ebp-8H], eax                     ; 0D71 _ 89. 45, F8
        movzx   eax, word [?_124]                       ; 0D74 _ 0F B7. 05, 00000006(d)
        cwde                                            ; 0D7B _ 98
        mov     dword [ebp-4H], eax                     ; 0D7C _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0D7F _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 0D82 _ 8B. 50, 04
        mov     eax, dword [mx]                         ; 0D85 _ A1, 000000F0(d)
        add     eax, edx                                ; 0D8A _ 01. D0
        mov     dword [mx], eax                         ; 0D8C _ A3, 000000F0(d)
        mov     eax, dword [ebp+8H]                     ; 0D91 _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 0D94 _ 8B. 50, 08
        mov     eax, dword [my]                         ; 0D97 _ A1, 000000F4(d)
        add     eax, edx                                ; 0D9C _ 01. D0
        mov     dword [my], eax                         ; 0D9E _ A3, 000000F4(d)
        mov     eax, dword [mx]                         ; 0DA3 _ A1, 000000F0(d)
        test    eax, eax                                ; 0DA8 _ 85. C0
        jns     ?_057                                   ; 0DAA _ 79, 0A
        mov     dword [mx], 0                           ; 0DAC _ C7. 05, 000000F0(d), 00000000
?_057:  mov     eax, dword [my]                         ; 0DB6 _ A1, 000000F4(d)
        test    eax, eax                                ; 0DBB _ 85. C0
        jns     ?_058                                   ; 0DBD _ 79, 0A
        mov     dword [my], 0                           ; 0DBF _ C7. 05, 000000F4(d), 00000000
?_058:  mov     eax, dword [ebp-8H]                     ; 0DC9 _ 8B. 45, F8
        lea     edx, [eax-10H]                          ; 0DCC _ 8D. 50, F0
        mov     eax, dword [mx]                         ; 0DCF _ A1, 000000F0(d)
        cmp     edx, eax                                ; 0DD4 _ 39. C2
        jge     ?_059                                   ; 0DD6 _ 7D, 0B
        mov     eax, dword [ebp-8H]                     ; 0DD8 _ 8B. 45, F8
        sub     eax, 16                                 ; 0DDB _ 83. E8, 10
        mov     dword [mx], eax                         ; 0DDE _ A3, 000000F0(d)
?_059:  mov     eax, dword [ebp-4H]                     ; 0DE3 _ 8B. 45, FC
        lea     edx, [eax-10H]                          ; 0DE6 _ 8D. 50, F0
        mov     eax, dword [my]                         ; 0DE9 _ A1, 000000F4(d)
        cmp     edx, eax                                ; 0DEE _ 39. C2
        jge     ?_060                                   ; 0DF0 _ 7D, 0B
        mov     eax, dword [ebp-4H]                     ; 0DF2 _ 8B. 45, FC
        sub     eax, 16                                 ; 0DF5 _ 83. E8, 10
        mov     dword [my], eax                         ; 0DF8 _ A3, 000000F4(d)
?_060:  nop                                             ; 0DFD _ 90
        leave                                           ; 0DFE _ C9
        ret                                             ; 0DFF _ C3
; computeMousePosition End of function

show_mouse_info:; Function begin
        push    ebp                                     ; 0E00 _ 55
        mov     ebp, esp                                ; 0E01 _ 89. E5
        sub     esp, 24                                 ; 0E03 _ 83. EC, 18
        mov     eax, dword [buf_back]                   ; 0E06 _ A1, 000000F8(d)
        mov     dword [ebp-0CH], eax                    ; 0E0B _ 89. 45, F4
        mov     byte [ebp-0DH], 0                       ; 0E0E _ C6. 45, F3, 00
        push    mouseinfo                               ; 0E12 _ 68, 00000008(d)
        call    fifo8_get                               ; 0E17 _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 0E1C _ 83. C4, 04
        mov     byte [ebp-0DH], al                      ; 0E1F _ 88. 45, F3
        movzx   eax, byte [ebp-0DH]                     ; 0E22 _ 0F B6. 45, F3
        push    eax                                     ; 0E26 _ 50
        push    mdec                                    ; 0E27 _ 68, 000000E0(d)
        call    mouse_decode                            ; 0E2C _ E8, FFFFFFFC(rel)
        add     esp, 8                                  ; 0E31 _ 83. C4, 08
        cmp     eax, 1                                  ; 0E34 _ 83. F8, 01
        jnz     ?_061                                   ; 0E37 _ 75, 28
        push    mdec                                    ; 0E39 _ 68, 000000E0(d)
        call    computeMousePosition                    ; 0E3E _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 0E43 _ 83. C4, 04
        mov     edx, dword [my]                         ; 0E46 _ 8B. 15, 000000F4(d)
        mov     eax, dword [mx]                         ; 0E4C _ A1, 000000F0(d)
        push    edx                                     ; 0E51 _ 52
        push    eax                                     ; 0E52 _ 50
        push    dword [ebp+0CH]                         ; 0E53 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0E56 _ FF. 75, 08
        call    sheet_slide                             ; 0E59 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0E5E _ 83. C4, 10
?_061:  nop                                             ; 0E61 _ 90
        leave                                           ; 0E62 _ C9
        ret                                             ; 0E63 _ C3
; show_mouse_info End of function

showMemoryInfo:; Function begin
        push    ebp                                     ; 0E64 _ 55
        mov     ebp, esp                                ; 0E65 _ 89. E5
        sub     esp, 56                                 ; 0E67 _ 83. EC, 38
        mov     dword [ebp-30H], 0                      ; 0E6A _ C7. 45, D0, 00000000
        mov     dword [ebp-2CH], 0                      ; 0E71 _ C7. 45, D4, 00000000
        mov     dword [ebp-28H], 104                    ; 0E78 _ C7. 45, D8, 00000068
        mov     dword [ebp-24H], 80                     ; 0E7F _ C7. 45, DC, 00000050
        push    100                                     ; 0E86 _ 6A, 64
        push    dword [ebp+14H]                         ; 0E88 _ FF. 75, 14
        push    0                                       ; 0E8B _ 6A, 00
        push    0                                       ; 0E8D _ 6A, 00
        push    14                                      ; 0E8F _ 6A, 0E
        push    dword [ebp+14H]                         ; 0E91 _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 0E94 _ FF. 75, 0C
        call    boxfill8                                ; 0E97 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 0E9C _ 83. C4, 1C
        mov     eax, dword [ebp+18H]                    ; 0E9F _ 8B. 45, 18
        movsx   eax, al                                 ; 0EA2 _ 0F BE. C0
        sub     esp, 8                                  ; 0EA5 _ 83. EC, 08
        push    ?_115                                   ; 0EA8 _ 68, 00000006(d)
        push    eax                                     ; 0EAD _ 50
        push    dword [ebp-2CH]                         ; 0EAE _ FF. 75, D4
        push    dword [ebp-30H]                         ; 0EB1 _ FF. 75, D0
        push    dword [ebp+14H]                         ; 0EB4 _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 0EB7 _ FF. 75, 0C
        call    showString                              ; 0EBA _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0EBF _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0EC2 _ 8B. 45, 10
        sub     esp, 12                                 ; 0EC5 _ 83. EC, 0C
        push    eax                                     ; 0EC8 _ 50
        call    intToHexStr                             ; 0EC9 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0ECE _ 83. C4, 10
        mov     dword [ebp-20H], eax                    ; 0ED1 _ 89. 45, E0
        mov     eax, dword [ebp+18H]                    ; 0ED4 _ 8B. 45, 18
        movsx   eax, al                                 ; 0ED7 _ 0F BE. C0
        sub     esp, 8                                  ; 0EDA _ 83. EC, 08
        push    dword [ebp-20H]                         ; 0EDD _ FF. 75, E0
        push    eax                                     ; 0EE0 _ 50
        push    dword [ebp-2CH]                         ; 0EE1 _ FF. 75, D4
        push    dword [ebp-28H]                         ; 0EE4 _ FF. 75, D8
        push    dword [ebp+14H]                         ; 0EE7 _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 0EEA _ FF. 75, 0C
        call    showString                              ; 0EED _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0EF2 _ 83. C4, 20
        add     dword [ebp-2CH], 16                     ; 0EF5 _ 83. 45, D4, 10
        mov     eax, dword [ebp+18H]                    ; 0EF9 _ 8B. 45, 18
        movsx   eax, al                                 ; 0EFC _ 0F BE. C0
        sub     esp, 8                                  ; 0EFF _ 83. EC, 08
        push    ?_116                                   ; 0F02 _ 68, 00000010(d)
        push    eax                                     ; 0F07 _ 50
        push    dword [ebp-2CH]                         ; 0F08 _ FF. 75, D4
        push    dword [ebp-30H]                         ; 0F0B _ FF. 75, D0
        push    dword [ebp+14H]                         ; 0F0E _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 0F11 _ FF. 75, 0C
        call    showString                              ; 0F14 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0F19 _ 83. C4, 20
        mov     eax, dword [ebp+8H]                     ; 0F1C _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 0F1F _ 8B. 00
        sub     esp, 12                                 ; 0F21 _ 83. EC, 0C
        push    eax                                     ; 0F24 _ 50
        call    intToHexStr                             ; 0F25 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0F2A _ 83. C4, 10
        mov     dword [ebp-1CH], eax                    ; 0F2D _ 89. 45, E4
        mov     eax, dword [ebp+18H]                    ; 0F30 _ 8B. 45, 18
        movsx   eax, al                                 ; 0F33 _ 0F BE. C0
        sub     esp, 8                                  ; 0F36 _ 83. EC, 08
        push    dword [ebp-1CH]                         ; 0F39 _ FF. 75, E4
        push    eax                                     ; 0F3C _ 50
        push    dword [ebp-2CH]                         ; 0F3D _ FF. 75, D4
        push    dword [ebp-28H]                         ; 0F40 _ FF. 75, D8
        push    dword [ebp+14H]                         ; 0F43 _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 0F46 _ FF. 75, 0C
        call    showString                              ; 0F49 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0F4E _ 83. C4, 20
        add     dword [ebp-2CH], 16                     ; 0F51 _ 83. 45, D4, 10
        mov     eax, dword [ebp+18H]                    ; 0F55 _ 8B. 45, 18
        movsx   eax, al                                 ; 0F58 _ 0F BE. C0
        sub     esp, 8                                  ; 0F5B _ 83. EC, 08
        push    ?_117                                   ; 0F5E _ 68, 0000001C(d)
        push    eax                                     ; 0F63 _ 50
        push    dword [ebp-2CH]                         ; 0F64 _ FF. 75, D4
        push    dword [ebp-30H]                         ; 0F67 _ FF. 75, D0
        push    dword [ebp+14H]                         ; 0F6A _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 0F6D _ FF. 75, 0C
        call    showString                              ; 0F70 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0F75 _ 83. C4, 20
        mov     eax, dword [ebp+8H]                     ; 0F78 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0F7B _ 8B. 40, 04
        sub     esp, 12                                 ; 0F7E _ 83. EC, 0C
        push    eax                                     ; 0F81 _ 50
        call    intToHexStr                             ; 0F82 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0F87 _ 83. C4, 10
        mov     dword [ebp-18H], eax                    ; 0F8A _ 89. 45, E8
        mov     eax, dword [ebp+18H]                    ; 0F8D _ 8B. 45, 18
        movsx   eax, al                                 ; 0F90 _ 0F BE. C0
        sub     esp, 8                                  ; 0F93 _ 83. EC, 08
        push    dword [ebp-18H]                         ; 0F96 _ FF. 75, E8
        push    eax                                     ; 0F99 _ 50
        push    dword [ebp-2CH]                         ; 0F9A _ FF. 75, D4
        push    dword [ebp-28H]                         ; 0F9D _ FF. 75, D8
        push    dword [ebp+14H]                         ; 0FA0 _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 0FA3 _ FF. 75, 0C
        call    showString                              ; 0FA6 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0FAB _ 83. C4, 20
        add     dword [ebp-2CH], 16                     ; 0FAE _ 83. 45, D4, 10
        mov     eax, dword [ebp+18H]                    ; 0FB2 _ 8B. 45, 18
        movsx   eax, al                                 ; 0FB5 _ 0F BE. C0
        sub     esp, 8                                  ; 0FB8 _ 83. EC, 08
        push    ?_118                                   ; 0FBB _ 68, 00000028(d)
        push    eax                                     ; 0FC0 _ 50
        push    dword [ebp-2CH]                         ; 0FC1 _ FF. 75, D4
        push    dword [ebp-30H]                         ; 0FC4 _ FF. 75, D0
        push    dword [ebp+14H]                         ; 0FC7 _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 0FCA _ FF. 75, 0C
        call    showString                              ; 0FCD _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0FD2 _ 83. C4, 20
        mov     eax, dword [ebp+8H]                     ; 0FD5 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0FD8 _ 8B. 40, 08
        sub     esp, 12                                 ; 0FDB _ 83. EC, 0C
        push    eax                                     ; 0FDE _ 50
        call    intToHexStr                             ; 0FDF _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0FE4 _ 83. C4, 10
        mov     dword [ebp-14H], eax                    ; 0FE7 _ 89. 45, EC
        mov     eax, dword [ebp+18H]                    ; 0FEA _ 8B. 45, 18
        movsx   eax, al                                 ; 0FED _ 0F BE. C0
        sub     esp, 8                                  ; 0FF0 _ 83. EC, 08
        push    dword [ebp-14H]                         ; 0FF3 _ FF. 75, EC
        push    eax                                     ; 0FF6 _ 50
        push    dword [ebp-2CH]                         ; 0FF7 _ FF. 75, D4
        push    dword [ebp-28H]                         ; 0FFA _ FF. 75, D8
        push    dword [ebp+14H]                         ; 0FFD _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 1000 _ FF. 75, 0C
        call    showString                              ; 1003 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1008 _ 83. C4, 20
        add     dword [ebp-2CH], 16                     ; 100B _ 83. 45, D4, 10
        mov     eax, dword [ebp+18H]                    ; 100F _ 8B. 45, 18
        movsx   eax, al                                 ; 1012 _ 0F BE. C0
        sub     esp, 8                                  ; 1015 _ 83. EC, 08
        push    ?_119                                   ; 1018 _ 68, 00000034(d)
        push    eax                                     ; 101D _ 50
        push    dword [ebp-2CH]                         ; 101E _ FF. 75, D4
        push    dword [ebp-30H]                         ; 1021 _ FF. 75, D0
        push    dword [ebp+14H]                         ; 1024 _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 1027 _ FF. 75, 0C
        call    showString                              ; 102A _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 102F _ 83. C4, 20
        mov     eax, dword [ebp+8H]                     ; 1032 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1035 _ 8B. 40, 0C
        sub     esp, 12                                 ; 1038 _ 83. EC, 0C
        push    eax                                     ; 103B _ 50
        call    intToHexStr                             ; 103C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1041 _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 1044 _ 89. 45, F0
        mov     eax, dword [ebp+18H]                    ; 1047 _ 8B. 45, 18
        movsx   eax, al                                 ; 104A _ 0F BE. C0
        sub     esp, 8                                  ; 104D _ 83. EC, 08
        push    dword [ebp-10H]                         ; 1050 _ FF. 75, F0
        push    eax                                     ; 1053 _ 50
        push    dword [ebp-2CH]                         ; 1054 _ FF. 75, D4
        push    dword [ebp-28H]                         ; 1057 _ FF. 75, D8
        push    dword [ebp+14H]                         ; 105A _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 105D _ FF. 75, 0C
        call    showString                              ; 1060 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1065 _ 83. C4, 20
        add     dword [ebp-2CH], 16                     ; 1068 _ 83. 45, D4, 10
        mov     eax, dword [ebp+18H]                    ; 106C _ 8B. 45, 18
        movsx   eax, al                                 ; 106F _ 0F BE. C0
        sub     esp, 8                                  ; 1072 _ 83. EC, 08
        push    ?_120                                   ; 1075 _ 68, 00000041(d)
        push    eax                                     ; 107A _ 50
        push    dword [ebp-2CH]                         ; 107B _ FF. 75, D4
        push    dword [ebp-30H]                         ; 107E _ FF. 75, D0
        push    dword [ebp+14H]                         ; 1081 _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 1084 _ FF. 75, 0C
        call    showString                              ; 1087 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 108C _ 83. C4, 20
        mov     eax, dword [ebp+8H]                     ; 108F _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 1092 _ 8B. 40, 10
        sub     esp, 12                                 ; 1095 _ 83. EC, 0C
        push    eax                                     ; 1098 _ 50
        call    intToHexStr                             ; 1099 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 109E _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 10A1 _ 89. 45, F4
        mov     eax, dword [ebp+18H]                    ; 10A4 _ 8B. 45, 18
        movsx   eax, al                                 ; 10A7 _ 0F BE. C0
        sub     esp, 8                                  ; 10AA _ 83. EC, 08
        push    dword [ebp-0CH]                         ; 10AD _ FF. 75, F4
        push    eax                                     ; 10B0 _ 50
        push    dword [ebp-2CH]                         ; 10B1 _ FF. 75, D4
        push    dword [ebp-28H]                         ; 10B4 _ FF. 75, D8
        push    dword [ebp+14H]                         ; 10B7 _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 10BA _ FF. 75, 0C
        call    showString                              ; 10BD _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 10C2 _ 83. C4, 20
        nop                                             ; 10C5 _ 90
        leave                                           ; 10C6 _ C9
        ret                                             ; 10C7 _ C3
; showMemoryInfo End of function

init_screen8:; Function begin
        push    ebp                                     ; 10C8 _ 55
        mov     ebp, esp                                ; 10C9 _ 89. E5
        push    ebx                                     ; 10CB _ 53
        mov     eax, dword [ebp+10H]                    ; 10CC _ 8B. 45, 10
        lea     edx, [eax-1DH]                          ; 10CF _ 8D. 50, E3
        mov     eax, dword [ebp+0CH]                    ; 10D2 _ 8B. 45, 0C
        sub     eax, 1                                  ; 10D5 _ 83. E8, 01
        push    edx                                     ; 10D8 _ 52
        push    eax                                     ; 10D9 _ 50
        push    0                                       ; 10DA _ 6A, 00
        push    0                                       ; 10DC _ 6A, 00
        push    14                                      ; 10DE _ 6A, 0E
        push    dword [ebp+0CH]                         ; 10E0 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 10E3 _ FF. 75, 08
        call    boxfill8                                ; 10E6 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 10EB _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 10EE _ 8B. 45, 10
        lea     ecx, [eax-1CH]                          ; 10F1 _ 8D. 48, E4
        mov     eax, dword [ebp+0CH]                    ; 10F4 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 10F7 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 10FA _ 8B. 45, 10
        sub     eax, 28                                 ; 10FD _ 83. E8, 1C
        push    ecx                                     ; 1100 _ 51
        push    edx                                     ; 1101 _ 52
        push    eax                                     ; 1102 _ 50
        push    0                                       ; 1103 _ 6A, 00
        push    8                                       ; 1105 _ 6A, 08
        push    dword [ebp+0CH]                         ; 1107 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 110A _ FF. 75, 08
        call    boxfill8                                ; 110D _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1112 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 1115 _ 8B. 45, 10
        lea     ecx, [eax-1BH]                          ; 1118 _ 8D. 48, E5
        mov     eax, dword [ebp+0CH]                    ; 111B _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 111E _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 1121 _ 8B. 45, 10
        sub     eax, 27                                 ; 1124 _ 83. E8, 1B
        push    ecx                                     ; 1127 _ 51
        push    edx                                     ; 1128 _ 52
        push    eax                                     ; 1129 _ 50
        push    0                                       ; 112A _ 6A, 00
        push    7                                       ; 112C _ 6A, 07
        push    dword [ebp+0CH]                         ; 112E _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1131 _ FF. 75, 08
        call    boxfill8                                ; 1134 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1139 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 113C _ 8B. 45, 10
        lea     ecx, [eax-1H]                           ; 113F _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 1142 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 1145 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 1148 _ 8B. 45, 10
        sub     eax, 26                                 ; 114B _ 83. E8, 1A
        push    ecx                                     ; 114E _ 51
        push    edx                                     ; 114F _ 52
        push    eax                                     ; 1150 _ 50
        push    0                                       ; 1151 _ 6A, 00
        push    8                                       ; 1153 _ 6A, 08
        push    dword [ebp+0CH]                         ; 1155 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1158 _ FF. 75, 08
        call    boxfill8                                ; 115B _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1160 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 1163 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 1166 _ 8D. 50, E8
        mov     eax, dword [ebp+10H]                    ; 1169 _ 8B. 45, 10
        sub     eax, 24                                 ; 116C _ 83. E8, 18
        push    edx                                     ; 116F _ 52
        push    59                                      ; 1170 _ 6A, 3B
        push    eax                                     ; 1172 _ 50
        push    3                                       ; 1173 _ 6A, 03
        push    7                                       ; 1175 _ 6A, 07
        push    dword [ebp+0CH]                         ; 1177 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 117A _ FF. 75, 08
        call    boxfill8                                ; 117D _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1182 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 1185 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 1188 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 118B _ 8B. 45, 10
        sub     eax, 24                                 ; 118E _ 83. E8, 18
        push    edx                                     ; 1191 _ 52
        push    2                                       ; 1192 _ 6A, 02
        push    eax                                     ; 1194 _ 50
        push    2                                       ; 1195 _ 6A, 02
        push    7                                       ; 1197 _ 6A, 07
        push    dword [ebp+0CH]                         ; 1199 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 119C _ FF. 75, 08
        call    boxfill8                                ; 119F _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 11A4 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 11A7 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 11AA _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 11AD _ 8B. 45, 10
        sub     eax, 4                                  ; 11B0 _ 83. E8, 04
        push    edx                                     ; 11B3 _ 52
        push    59                                      ; 11B4 _ 6A, 3B
        push    eax                                     ; 11B6 _ 50
        push    3                                       ; 11B7 _ 6A, 03
        push    15                                      ; 11B9 _ 6A, 0F
        push    dword [ebp+0CH]                         ; 11BB _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 11BE _ FF. 75, 08
        call    boxfill8                                ; 11C1 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 11C6 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 11C9 _ 8B. 45, 10
        lea     edx, [eax-5H]                           ; 11CC _ 8D. 50, FB
        mov     eax, dword [ebp+10H]                    ; 11CF _ 8B. 45, 10
        sub     eax, 23                                 ; 11D2 _ 83. E8, 17
        push    edx                                     ; 11D5 _ 52
        push    59                                      ; 11D6 _ 6A, 3B
        push    eax                                     ; 11D8 _ 50
        push    59                                      ; 11D9 _ 6A, 3B
        push    15                                      ; 11DB _ 6A, 0F
        push    dword [ebp+0CH]                         ; 11DD _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 11E0 _ FF. 75, 08
        call    boxfill8                                ; 11E3 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 11E8 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 11EB _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 11EE _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 11F1 _ 8B. 45, 10
        sub     eax, 3                                  ; 11F4 _ 83. E8, 03
        push    edx                                     ; 11F7 _ 52
        push    59                                      ; 11F8 _ 6A, 3B
        push    eax                                     ; 11FA _ 50
        push    2                                       ; 11FB _ 6A, 02
        push    0                                       ; 11FD _ 6A, 00
        push    dword [ebp+0CH]                         ; 11FF _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1202 _ FF. 75, 08
        call    boxfill8                                ; 1205 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 120A _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 120D _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 1210 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 1213 _ 8B. 45, 10
        sub     eax, 24                                 ; 1216 _ 83. E8, 18
        push    edx                                     ; 1219 _ 52
        push    60                                      ; 121A _ 6A, 3C
        push    eax                                     ; 121C _ 50
        push    60                                      ; 121D _ 6A, 3C
        push    0                                       ; 121F _ 6A, 00
        push    dword [ebp+0CH]                         ; 1221 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1224 _ FF. 75, 08
        call    boxfill8                                ; 1227 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 122C _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 122F _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 1232 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 1235 _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 1238 _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 123B _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 123E _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 1241 _ 8B. 45, 0C
        sub     eax, 47                                 ; 1244 _ 83. E8, 2F
        push    ebx                                     ; 1247 _ 53
        push    ecx                                     ; 1248 _ 51
        push    edx                                     ; 1249 _ 52
        push    eax                                     ; 124A _ 50
        push    7                                       ; 124B _ 6A, 07
        push    dword [ebp+0CH]                         ; 124D _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1250 _ FF. 75, 08
        call    boxfill8                                ; 1253 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1258 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 125B _ 8B. 45, 10
        lea     ebx, [eax-4H]                           ; 125E _ 8D. 58, FC
        mov     eax, dword [ebp+0CH]                    ; 1261 _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 1264 _ 8D. 48, FD
        mov     eax, dword [ebp+10H]                    ; 1267 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 126A _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 126D _ 8B. 45, 0C
        sub     eax, 3                                  ; 1270 _ 83. E8, 03
        push    ebx                                     ; 1273 _ 53
        push    ecx                                     ; 1274 _ 51
        push    edx                                     ; 1275 _ 52
        push    eax                                     ; 1276 _ 50
        push    7                                       ; 1277 _ 6A, 07
        push    dword [ebp+0CH]                         ; 1279 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 127C _ FF. 75, 08
        call    boxfill8                                ; 127F _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1284 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 1287 _ 8B. 45, 10
        lea     ebx, [eax-18H]                          ; 128A _ 8D. 58, E8
        mov     eax, dword [ebp+0CH]                    ; 128D _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 1290 _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 1293 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 1296 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 1299 _ 8B. 45, 0C
        sub     eax, 47                                 ; 129C _ 83. E8, 2F
        push    ebx                                     ; 129F _ 53
        push    ecx                                     ; 12A0 _ 51
        push    edx                                     ; 12A1 _ 52
        push    eax                                     ; 12A2 _ 50
        push    15                                      ; 12A3 _ 6A, 0F
        push    dword [ebp+0CH]                         ; 12A5 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 12A8 _ FF. 75, 08
        call    boxfill8                                ; 12AB _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 12B0 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 12B3 _ 8B. 45, 10
        lea     ebx, [eax-4H]                           ; 12B6 _ 8D. 58, FC
        mov     eax, dword [ebp+0CH]                    ; 12B9 _ 8B. 45, 0C
        lea     ecx, [eax-2FH]                          ; 12BC _ 8D. 48, D1
        mov     eax, dword [ebp+10H]                    ; 12BF _ 8B. 45, 10
        lea     edx, [eax-17H]                          ; 12C2 _ 8D. 50, E9
        mov     eax, dword [ebp+0CH]                    ; 12C5 _ 8B. 45, 0C
        sub     eax, 47                                 ; 12C8 _ 83. E8, 2F
        push    ebx                                     ; 12CB _ 53
        push    ecx                                     ; 12CC _ 51
        push    edx                                     ; 12CD _ 52
        push    eax                                     ; 12CE _ 50
        push    15                                      ; 12CF _ 6A, 0F
        push    dword [ebp+0CH]                         ; 12D1 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 12D4 _ FF. 75, 08
        call    boxfill8                                ; 12D7 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 12DC _ 83. C4, 1C
        nop                                             ; 12DF _ 90
        mov     ebx, dword [ebp-4H]                     ; 12E0 _ 8B. 5D, FC
        leave                                           ; 12E3 _ C9
        ret                                             ; 12E4 _ C3
; init_screen8 End of function

memman_init:; Function begin
        push    ebp                                     ; 12E5 _ 55
        mov     ebp, esp                                ; 12E6 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 12E8 _ 8B. 45, 08
        mov     dword [eax], 0                          ; 12EB _ C7. 00, 00000000
        mov     eax, dword [ebp+8H]                     ; 12F1 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 12F4 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 12FB _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 12FE _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 1305 _ 8B. 45, 08
        mov     dword [eax+0CH], 0                      ; 1308 _ C7. 40, 0C, 00000000
        nop                                             ; 130F _ 90
        pop     ebp                                     ; 1310 _ 5D
        ret                                             ; 1311 _ C3
; memman_init End of function

memman_total:; Function begin
        push    ebp                                     ; 1312 _ 55
        mov     ebp, esp                                ; 1313 _ 89. E5
        sub     esp, 16                                 ; 1315 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 1318 _ C7. 45, FC, 00000000
        mov     dword [ebp-8H], 0                       ; 131F _ C7. 45, F8, 00000000
        jmp     ?_063                                   ; 1326 _ EB, 14

?_062:  mov     eax, dword [ebp+8H]                     ; 1328 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 132B _ 8B. 55, F8
        add     edx, 2                                  ; 132E _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 1331 _ 8B. 44 D0, 04
        add     dword [ebp-4H], eax                     ; 1335 _ 01. 45, FC
        add     dword [ebp-8H], 1                       ; 1338 _ 83. 45, F8, 01
?_063:  mov     eax, dword [ebp+8H]                     ; 133C _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 133F _ 8B. 00
        cmp     dword [ebp-8H], eax                     ; 1341 _ 39. 45, F8
        jc      ?_062                                   ; 1344 _ 72, E2
        mov     eax, dword [ebp-4H]                     ; 1346 _ 8B. 45, FC
        leave                                           ; 1349 _ C9
        ret                                             ; 134A _ C3
; memman_total End of function

memman_alloc:; Function begin
        push    ebp                                     ; 134B _ 55
        mov     ebp, esp                                ; 134C _ 89. E5
        sub     esp, 16                                 ; 134E _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 1351 _ C7. 45, F8, 00000000
        jmp     ?_067                                   ; 1358 _ E9, 00000085

?_064:  mov     eax, dword [ebp+8H]                     ; 135D _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1360 _ 8B. 55, F8
        add     edx, 2                                  ; 1363 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 1366 _ 8B. 44 D0, 04
        cmp     dword [ebp+0CH], eax                    ; 136A _ 39. 45, 0C
        ja      ?_066                                   ; 136D _ 77, 6F
        mov     eax, dword [ebp+8H]                     ; 136F _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1372 _ 8B. 55, F8
        add     edx, 2                                  ; 1375 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 1378 _ 8B. 04 D0
        mov     dword [ebp-4H], eax                     ; 137B _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 137E _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1381 _ 8B. 55, F8
        add     edx, 2                                  ; 1384 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 1387 _ 8B. 14 D0
        mov     eax, dword [ebp+0CH]                    ; 138A _ 8B. 45, 0C
        lea     ecx, [edx+eax]                          ; 138D _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1390 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1393 _ 8B. 55, F8
        add     edx, 2                                  ; 1396 _ 83. C2, 02
        mov     dword [eax+edx*8], ecx                  ; 1399 _ 89. 0C D0
        mov     eax, dword [ebp+8H]                     ; 139C _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 139F _ 8B. 55, F8
        add     edx, 2                                  ; 13A2 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 13A5 _ 8B. 44 D0, 04
        sub     eax, dword [ebp+0CH]                    ; 13A9 _ 2B. 45, 0C
        mov     edx, eax                                ; 13AC _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 13AE _ 8B. 45, 08
        mov     ecx, dword [ebp-8H]                     ; 13B1 _ 8B. 4D, F8
        add     ecx, 2                                  ; 13B4 _ 83. C1, 02
        mov     dword [eax+ecx*8+4H], edx               ; 13B7 _ 89. 54 C8, 04
        mov     eax, dword [ebp+8H]                     ; 13BB _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 13BE _ 8B. 55, F8
        add     edx, 2                                  ; 13C1 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 13C4 _ 8B. 44 D0, 04
        test    eax, eax                                ; 13C8 _ 85. C0
        jnz     ?_065                                   ; 13CA _ 75, 0D
        mov     eax, dword [ebp+8H]                     ; 13CC _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 13CF _ 8B. 00
        lea     edx, [eax-1H]                           ; 13D1 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 13D4 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 13D7 _ 89. 10
?_065:  mov     eax, dword [ebp-4H]                     ; 13D9 _ 8B. 45, FC
        jmp     ?_068                                   ; 13DC _ EB, 17

?_066:  add     dword [ebp-8H], 1                       ; 13DE _ 83. 45, F8, 01
?_067:  mov     eax, dword [ebp+8H]                     ; 13E2 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 13E5 _ 8B. 00
        cmp     dword [ebp-8H], eax                     ; 13E7 _ 39. 45, F8
        jc      ?_064                                   ; 13EA _ 0F 82, FFFFFF6D
        mov     eax, 0                                  ; 13F0 _ B8, 00000000
?_068:  leave                                           ; 13F5 _ C9
        ret                                             ; 13F6 _ C3
; memman_alloc End of function

memman_free:; Function begin
        push    ebp                                     ; 13F7 _ 55
        mov     ebp, esp                                ; 13F8 _ 89. E5
        push    ebx                                     ; 13FA _ 53
        sub     esp, 16                                 ; 13FB _ 83. EC, 10
        mov     dword [ebp-0CH], 0                      ; 13FE _ C7. 45, F4, 00000000
        jmp     ?_070                                   ; 1405 _ EB, 15

?_069:  mov     eax, dword [ebp+8H]                     ; 1407 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 140A _ 8B. 55, F4
        add     edx, 2                                  ; 140D _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 1410 _ 8B. 04 D0
        cmp     dword [ebp+0CH], eax                    ; 1413 _ 39. 45, 0C
        jc      ?_071                                   ; 1416 _ 72, 10
        add     dword [ebp-0CH], 1                      ; 1418 _ 83. 45, F4, 01
?_070:  mov     eax, dword [ebp+8H]                     ; 141C _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 141F _ 8B. 00
        cmp     dword [ebp-0CH], eax                    ; 1421 _ 39. 45, F4
        jl      ?_069                                   ; 1424 _ 7C, E1
        jmp     ?_072                                   ; 1426 _ EB, 01

?_071:  nop                                             ; 1428 _ 90
?_072:  cmp     dword [ebp-0CH], 0                      ; 1429 _ 83. 7D, F4, 00
        jle     ?_074                                   ; 142D _ 0F 8E, 000000B9
        mov     eax, dword [ebp-0CH]                    ; 1433 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1436 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1439 _ 8B. 45, 08
        add     edx, 2                                  ; 143C _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 143F _ 8B. 14 D0
        mov     eax, dword [ebp-0CH]                    ; 1442 _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 1445 _ 8D. 48, FF
        mov     eax, dword [ebp+8H]                     ; 1448 _ 8B. 45, 08
        add     ecx, 2                                  ; 144B _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 144E _ 8B. 44 C8, 04
        add     eax, edx                                ; 1452 _ 01. D0
        cmp     dword [ebp+0CH], eax                    ; 1454 _ 39. 45, 0C
        jne     ?_074                                   ; 1457 _ 0F 85, 0000008F
        mov     eax, dword [ebp-0CH]                    ; 145D _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1460 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1463 _ 8B. 45, 08
        add     edx, 2                                  ; 1466 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 1469 _ 8B. 54 D0, 04
        mov     eax, dword [ebp-0CH]                    ; 146D _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 1470 _ 8D. 58, FF
        mov     eax, dword [ebp+10H]                    ; 1473 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 1476 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1479 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 147C _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 147F _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 1483 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1486 _ 8B. 00
        test    eax, eax                                ; 1488 _ 85. C0
        jle     ?_073                                   ; 148A _ 7E, 56
        mov     edx, dword [ebp+0CH]                    ; 148C _ 8B. 55, 0C
        mov     eax, dword [ebp+10H]                    ; 148F _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 1492 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1495 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1498 _ 8B. 55, F4
        add     edx, 2                                  ; 149B _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 149E _ 8B. 04 D0
        cmp     ecx, eax                                ; 14A1 _ 39. C1
        jnz     ?_073                                   ; 14A3 _ 75, 3D
        mov     eax, dword [ebp-0CH]                    ; 14A5 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 14A8 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 14AB _ 8B. 45, 08
        add     edx, 2                                  ; 14AE _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 14B1 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+8H]                     ; 14B5 _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 14B8 _ 8B. 4D, F4
        add     ecx, 2                                  ; 14BB _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 14BE _ 8B. 44 C8, 04
        mov     ecx, dword [ebp-0CH]                    ; 14C2 _ 8B. 4D, F4
        lea     ebx, [ecx-1H]                           ; 14C5 _ 8D. 59, FF
        lea     ecx, [edx+eax]                          ; 14C8 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 14CB _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 14CE _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 14D1 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 14D5 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 14D8 _ 8B. 00
        lea     edx, [eax-1H]                           ; 14DA _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 14DD _ 8B. 45, 08
        mov     dword [eax], edx                        ; 14E0 _ 89. 10
?_073:  mov     eax, 0                                  ; 14E2 _ B8, 00000000
        jmp     ?_080                                   ; 14E7 _ E9, 0000011B

?_074:  mov     eax, dword [ebp+8H]                     ; 14EC _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 14EF _ 8B. 00
        test    eax, eax                                ; 14F1 _ 85. C0
        jle     ?_075                                   ; 14F3 _ 7E, 52
        mov     edx, dword [ebp+0CH]                    ; 14F5 _ 8B. 55, 0C
        mov     eax, dword [ebp+10H]                    ; 14F8 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 14FB _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 14FE _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1501 _ 8B. 55, F4
        add     edx, 2                                  ; 1504 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 1507 _ 8B. 04 D0
        cmp     ecx, eax                                ; 150A _ 39. C1
        jnz     ?_075                                   ; 150C _ 75, 39
        mov     eax, dword [ebp+8H]                     ; 150E _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1511 _ 8B. 55, F4
        add     edx, 2                                  ; 1514 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 1517 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 151B _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 151E _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1521 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1524 _ 8B. 55, F4
        add     edx, 2                                  ; 1527 _ 83. C2, 02
        mov     dword [eax+edx*8+4H], ecx               ; 152A _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 152E _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1531 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 1534 _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 1537 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 153A _ 89. 14 C8
        mov     eax, 0                                  ; 153D _ B8, 00000000
        jmp     ?_080                                   ; 1542 _ E9, 000000C0

?_075:  mov     eax, dword [ebp+8H]                     ; 1547 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 154A _ 8B. 00
        cmp     eax, 4095                               ; 154C _ 3D, 00000FFF
        jg      ?_079                                   ; 1551 _ 0F 8F, 00000087
        mov     eax, dword [ebp+8H]                     ; 1557 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 155A _ 8B. 00
        lea     edx, [eax+1H]                           ; 155C _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 155F _ 8B. 45, 08
        mov     dword [eax], edx                        ; 1562 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 1564 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1567 _ 8B. 00
        mov     dword [ebp-8H], eax                     ; 1569 _ 89. 45, F8
        jmp     ?_077                                   ; 156C _ EB, 28

?_076:  mov     eax, dword [ebp-8H]                     ; 156E _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 1571 _ 8D. 50, FF
        mov     ecx, dword [ebp+8H]                     ; 1574 _ 8B. 4D, 08
        mov     eax, dword [ebp-8H]                     ; 1577 _ 8B. 45, F8
        lea     ebx, [eax+2H]                           ; 157A _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 157D _ 8B. 45, 08
        add     edx, 2                                  ; 1580 _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 1583 _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 1586 _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 1588 _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 158B _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 158E _ 89. 54 D9, 04
        sub     dword [ebp-8H], 1                       ; 1592 _ 83. 6D, F8, 01
?_077:  mov     eax, dword [ebp-8H]                     ; 1596 _ 8B. 45, F8
        cmp     eax, dword [ebp-0CH]                    ; 1599 _ 3B. 45, F4
        jg      ?_076                                   ; 159C _ 7F, D0
        mov     eax, dword [ebp+8H]                     ; 159E _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 15A1 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 15A4 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 15A7 _ 8B. 00
        cmp     edx, eax                                ; 15A9 _ 39. C2
        jge     ?_078                                   ; 15AB _ 7D, 0B
        mov     eax, dword [ebp+8H]                     ; 15AD _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 15B0 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 15B2 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 15B5 _ 89. 50, 04
?_078:  mov     eax, dword [ebp+8H]                     ; 15B8 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 15BB _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 15BE _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 15C1 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 15C4 _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 15C7 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 15CA _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 15CD _ 8D. 4A, 02
        mov     edx, dword [ebp+10H]                    ; 15D0 _ 8B. 55, 10
        mov     dword [eax+ecx*8+4H], edx               ; 15D3 _ 89. 54 C8, 04
        mov     eax, 0                                  ; 15D7 _ B8, 00000000
        jmp     ?_080                                   ; 15DC _ EB, 29

?_079:  mov     eax, dword [ebp+8H]                     ; 15DE _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 15E1 _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 15E4 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 15E7 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 15EA _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 15ED _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 15F0 _ 8B. 40, 08
        mov     edx, eax                                ; 15F3 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 15F5 _ 8B. 45, 10
        add     eax, edx                                ; 15F8 _ 01. D0
        mov     edx, eax                                ; 15FA _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 15FC _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 15FF _ 89. 50, 08
        mov     eax, 4294967295                         ; 1602 _ B8, FFFFFFFF
?_080:  add     esp, 16                                 ; 1607 _ 83. C4, 10
        pop     ebx                                     ; 160A _ 5B
        pop     ebp                                     ; 160B _ 5D
        ret                                             ; 160C _ C3
; memman_free End of function

memman_alloc_4k:; Function begin
        push    ebp                                     ; 160D _ 55
        mov     ebp, esp                                ; 160E _ 89. E5
        sub     esp, 16                                 ; 1610 _ 83. EC, 10
        mov     eax, dword [ebp+0CH]                    ; 1613 _ 8B. 45, 0C
        add     eax, 4095                               ; 1616 _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 161B _ 25, FFFFF000
        mov     dword [ebp+0CH], eax                    ; 1620 _ 89. 45, 0C
        push    dword [ebp+0CH]                         ; 1623 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1626 _ FF. 75, 08
        call    memman_alloc                            ; 1629 _ E8, FFFFFFFC(rel)
        add     esp, 8                                  ; 162E _ 83. C4, 08
        mov     dword [ebp-4H], eax                     ; 1631 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 1634 _ 8B. 45, FC
        leave                                           ; 1637 _ C9
        ret                                             ; 1638 _ C3
; memman_alloc_4k End of function

memman_free_4k:; Function begin
        push    ebp                                     ; 1639 _ 55
        mov     ebp, esp                                ; 163A _ 89. E5
        sub     esp, 16                                 ; 163C _ 83. EC, 10
        mov     eax, dword [ebp+10H]                    ; 163F _ 8B. 45, 10
        add     eax, 4095                               ; 1642 _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 1647 _ 25, FFFFF000
        mov     dword [ebp+10H], eax                    ; 164C _ 89. 45, 10
        push    dword [ebp+10H]                         ; 164F _ FF. 75, 10
        push    dword [ebp+0CH]                         ; 1652 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1655 _ FF. 75, 08
        call    memman_free                             ; 1658 _ E8, FFFFFFFC(rel)
        add     esp, 12                                 ; 165D _ 83. C4, 0C
        mov     dword [ebp-4H], eax                     ; 1660 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 1663 _ 8B. 45, FC
        leave                                           ; 1666 _ C9
        ret                                             ; 1667 _ C3
; memman_free_4k End of function

shtctl_init:; Function begin
        push    ebp                                     ; 1668 _ 55
        mov     ebp, esp                                ; 1669 _ 89. E5
        sub     esp, 24                                 ; 166B _ 83. EC, 18
        sub     esp, 8                                  ; 166E _ 83. EC, 08
        push    9232                                    ; 1671 _ 68, 00002410
        push    dword [ebp+8H]                          ; 1676 _ FF. 75, 08
        call    memman_alloc_4k                         ; 1679 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 167E _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 1681 _ 89. 45, F4
        cmp     dword [ebp-0CH], 0                      ; 1684 _ 83. 7D, F4, 00
        jnz     ?_081                                   ; 1688 _ 75, 07
        mov     eax, 0                                  ; 168A _ B8, 00000000
        jmp     ?_084                                   ; 168F _ EB, 54

?_081:  mov     eax, dword [ebp-0CH]                    ; 1691 _ 8B. 45, F4
        mov     edx, dword [ebp+0CH]                    ; 1694 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 1697 _ 89. 10
        mov     eax, dword [ebp-0CH]                    ; 1699 _ 8B. 45, F4
        mov     edx, dword [ebp+10H]                    ; 169C _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 169F _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 16A2 _ 8B. 45, F4
        mov     edx, dword [ebp+14H]                    ; 16A5 _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 16A8 _ 89. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 16AB _ 8B. 45, F4
        mov     dword [eax+0CH], -1                     ; 16AE _ C7. 40, 0C, FFFFFFFF
        mov     dword [ebp-10H], 0                      ; 16B5 _ C7. 45, F0, 00000000
        jmp     ?_083                                   ; 16BC _ EB, 1B

?_082:  mov     eax, dword [ebp-0CH]                    ; 16BE _ 8B. 45, F4
        mov     edx, dword [ebp-10H]                    ; 16C1 _ 8B. 55, F0
        add     edx, 33                                 ; 16C4 _ 83. C2, 21
        shl     edx, 5                                  ; 16C7 _ C1. E2, 05
        add     eax, edx                                ; 16CA _ 01. D0
        add     eax, 12                                 ; 16CC _ 83. C0, 0C
        mov     dword [eax], 0                          ; 16CF _ C7. 00, 00000000
        add     dword [ebp-10H], 1                      ; 16D5 _ 83. 45, F0, 01
?_083:  cmp     dword [ebp-10H], 255                    ; 16D9 _ 81. 7D, F0, 000000FF
        jle     ?_082                                   ; 16E0 _ 7E, DC
        mov     eax, dword [ebp-0CH]                    ; 16E2 _ 8B. 45, F4
?_084:  leave                                           ; 16E5 _ C9
        ret                                             ; 16E6 _ C3
; shtctl_init End of function

sheet_alloc:; Function begin
        push    ebp                                     ; 16E7 _ 55
        mov     ebp, esp                                ; 16E8 _ 89. E5
        sub     esp, 16                                 ; 16EA _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 16ED _ C7. 45, F8, 00000000
        jmp     ?_087                                   ; 16F4 _ EB, 57

?_085:  mov     eax, dword [ebp+8H]                     ; 16F6 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 16F9 _ 8B. 55, F8
        add     edx, 33                                 ; 16FC _ 83. C2, 21
        shl     edx, 5                                  ; 16FF _ C1. E2, 05
        add     eax, edx                                ; 1702 _ 01. D0
        add     eax, 12                                 ; 1704 _ 83. C0, 0C
        mov     eax, dword [eax]                        ; 1707 _ 8B. 00
        test    eax, eax                                ; 1709 _ 85. C0
        jnz     ?_086                                   ; 170B _ 75, 3C
        mov     eax, dword [ebp-8H]                     ; 170D _ 8B. 45, F8
        shl     eax, 5                                  ; 1710 _ C1. E0, 05
        lea     edx, [eax+410H]                         ; 1713 _ 8D. 90, 00000410
        mov     eax, dword [ebp+8H]                     ; 1719 _ 8B. 45, 08
        add     eax, edx                                ; 171C _ 01. D0
        mov     dword [ebp-4H], eax                     ; 171E _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 1721 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1724 _ 8B. 55, F8
        lea     ecx, [edx+4H]                           ; 1727 _ 8D. 4A, 04
        mov     edx, dword [ebp-4H]                     ; 172A _ 8B. 55, FC
        mov     dword [eax+ecx*4], edx                  ; 172D _ 89. 14 88
        mov     eax, dword [ebp-4H]                     ; 1730 _ 8B. 45, FC
        mov     dword [eax+1CH], 1                      ; 1733 _ C7. 40, 1C, 00000001
        mov     eax, dword [ebp-4H]                     ; 173A _ 8B. 45, FC
        mov     dword [eax+18H], -1                     ; 173D _ C7. 40, 18, FFFFFFFF
        mov     eax, dword [ebp-4H]                     ; 1744 _ 8B. 45, FC
        jmp     ?_088                                   ; 1747 _ EB, 12

?_086:  add     dword [ebp-8H], 1                       ; 1749 _ 83. 45, F8, 01
?_087:  cmp     dword [ebp-8H], 255                     ; 174D _ 81. 7D, F8, 000000FF
        jle     ?_085                                   ; 1754 _ 7E, A0
        mov     eax, 0                                  ; 1756 _ B8, 00000000
?_088:  leave                                           ; 175B _ C9
        ret                                             ; 175C _ C3
; sheet_alloc End of function

sheet_setbuf:; Function begin
        push    ebp                                     ; 175D _ 55
        mov     ebp, esp                                ; 175E _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 1760 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 1763 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 1766 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 1768 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 176B _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 176E _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1771 _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 1774 _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 1777 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 177A _ 8B. 45, 08
        mov     edx, dword [ebp+18H]                    ; 177D _ 8B. 55, 18
        mov     dword [eax+14H], edx                    ; 1780 _ 89. 50, 14
        nop                                             ; 1783 _ 90
        pop     ebp                                     ; 1784 _ 5D
        ret                                             ; 1785 _ C3
; sheet_setbuf End of function

sheet_updown:; Function begin
        push    ebp                                     ; 1786 _ 55
        mov     ebp, esp                                ; 1787 _ 89. E5
        sub     esp, 24                                 ; 1789 _ 83. EC, 18
        mov     eax, dword [ebp+0CH]                    ; 178C _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 178F _ 8B. 40, 18
        mov     dword [ebp-0CH], eax                    ; 1792 _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 1795 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1798 _ 8B. 40, 0C
        add     eax, 1                                  ; 179B _ 83. C0, 01
        cmp     dword [ebp+10H], eax                    ; 179E _ 39. 45, 10
        jle     ?_089                                   ; 17A1 _ 7E, 0C
        mov     eax, dword [ebp+8H]                     ; 17A3 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 17A6 _ 8B. 40, 0C
        add     eax, 1                                  ; 17A9 _ 83. C0, 01
        mov     dword [ebp+10H], eax                    ; 17AC _ 89. 45, 10
?_089:  cmp     dword [ebp+10H], -1                     ; 17AF _ 83. 7D, 10, FF
        jge     ?_090                                   ; 17B3 _ 7D, 07
        mov     dword [ebp+10H], -1                     ; 17B5 _ C7. 45, 10, FFFFFFFF
?_090:  mov     eax, dword [ebp+0CH]                    ; 17BC _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 17BF _ 8B. 55, 10
        mov     dword [eax+18H], edx                    ; 17C2 _ 89. 50, 18
        mov     eax, dword [ebp-0CH]                    ; 17C5 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 17C8 _ 3B. 45, 10
        jle     ?_098                                   ; 17CB _ 0F 8E, 000000C9
        cmp     dword [ebp+10H], 0                      ; 17D1 _ 83. 7D, 10, 00
        js      ?_093                                   ; 17D5 _ 78, 52
        mov     eax, dword [ebp-0CH]                    ; 17D7 _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 17DA _ 89. 45, F0
        jmp     ?_092                                   ; 17DD _ EB, 31

?_091:  mov     eax, dword [ebp-10H]                    ; 17DF _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 17E2 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 17E5 _ 8B. 45, 08
        add     edx, 4                                  ; 17E8 _ 83. C2, 04
        mov     edx, dword [eax+edx*4]                  ; 17EB _ 8B. 14 90
        mov     eax, dword [ebp+8H]                     ; 17EE _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 17F1 _ 8B. 4D, F0
        add     ecx, 4                                  ; 17F4 _ 83. C1, 04
        mov     dword [eax+ecx*4], edx                  ; 17F7 _ 89. 14 88
        mov     eax, dword [ebp+8H]                     ; 17FA _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 17FD _ 8B. 55, F0
        add     edx, 4                                  ; 1800 _ 83. C2, 04
        mov     eax, dword [eax+edx*4]                  ; 1803 _ 8B. 04 90
        mov     edx, dword [ebp-10H]                    ; 1806 _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 1809 _ 89. 50, 18
        sub     dword [ebp-10H], 1                      ; 180C _ 83. 6D, F0, 01
?_092:  mov     eax, dword [ebp-10H]                    ; 1810 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 1813 _ 3B. 45, 10
        jg      ?_091                                   ; 1816 _ 7F, C7
        mov     eax, dword [ebp+8H]                     ; 1818 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 181B _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 181E _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 1821 _ 8B. 55, 0C
        mov     dword [eax+ecx*4], edx                  ; 1824 _ 89. 14 88
        jmp     ?_097                                   ; 1827 _ EB, 5E

?_093:  mov     eax, dword [ebp+8H]                     ; 1829 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 182C _ 8B. 40, 0C
        cmp     dword [ebp-0CH], eax                    ; 182F _ 39. 45, F4
        jge     ?_096                                   ; 1832 _ 7D, 44
        mov     eax, dword [ebp-0CH]                    ; 1834 _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 1837 _ 89. 45, F0
        jmp     ?_095                                   ; 183A _ EB, 31

?_094:  mov     eax, dword [ebp-10H]                    ; 183C _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 183F _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1842 _ 8B. 45, 08
        add     edx, 4                                  ; 1845 _ 83. C2, 04
        mov     edx, dword [eax+edx*4]                  ; 1848 _ 8B. 14 90
        mov     eax, dword [ebp+8H]                     ; 184B _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 184E _ 8B. 4D, F0
        add     ecx, 4                                  ; 1851 _ 83. C1, 04
        mov     dword [eax+ecx*4], edx                  ; 1854 _ 89. 14 88
        mov     eax, dword [ebp+8H]                     ; 1857 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 185A _ 8B. 55, F0
        add     edx, 4                                  ; 185D _ 83. C2, 04
        mov     eax, dword [eax+edx*4]                  ; 1860 _ 8B. 04 90
        mov     edx, dword [ebp-10H]                    ; 1863 _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 1866 _ 89. 50, 18
        add     dword [ebp-10H], 1                      ; 1869 _ 83. 45, F0, 01
?_095:  mov     eax, dword [ebp+8H]                     ; 186D _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1870 _ 8B. 40, 0C
        cmp     dword [ebp-10H], eax                    ; 1873 _ 39. 45, F0
        jl      ?_094                                   ; 1876 _ 7C, C4
?_096:  mov     eax, dword [ebp+8H]                     ; 1878 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 187B _ 8B. 40, 0C
        lea     edx, [eax-1H]                           ; 187E _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1881 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 1884 _ 89. 50, 0C
?_097:  sub     esp, 12                                 ; 1887 _ 83. EC, 0C
        push    dword [ebp+8H]                          ; 188A _ FF. 75, 08
        call    sheet_refresh                           ; 188D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1892 _ 83. C4, 10
        jmp     ?_105                                   ; 1895 _ E9, 000000DA

?_098:  mov     eax, dword [ebp-0CH]                    ; 189A _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 189D _ 3B. 45, 10
        jge     ?_105                                   ; 18A0 _ 0F 8D, 000000CE
        cmp     dword [ebp-0CH], 0                      ; 18A6 _ 83. 7D, F4, 00
        js      ?_101                                   ; 18AA _ 78, 52
        mov     eax, dword [ebp-0CH]                    ; 18AC _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 18AF _ 89. 45, F0
        jmp     ?_100                                   ; 18B2 _ EB, 31

?_099:  mov     eax, dword [ebp-10H]                    ; 18B4 _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 18B7 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 18BA _ 8B. 45, 08
        add     edx, 4                                  ; 18BD _ 83. C2, 04
        mov     edx, dword [eax+edx*4]                  ; 18C0 _ 8B. 14 90
        mov     eax, dword [ebp+8H]                     ; 18C3 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 18C6 _ 8B. 4D, F0
        add     ecx, 4                                  ; 18C9 _ 83. C1, 04
        mov     dword [eax+ecx*4], edx                  ; 18CC _ 89. 14 88
        mov     eax, dword [ebp+8H]                     ; 18CF _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 18D2 _ 8B. 55, F0
        add     edx, 4                                  ; 18D5 _ 83. C2, 04
        mov     eax, dword [eax+edx*4]                  ; 18D8 _ 8B. 04 90
        mov     edx, dword [ebp-10H]                    ; 18DB _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 18DE _ 89. 50, 18
        add     dword [ebp-10H], 1                      ; 18E1 _ 83. 45, F0, 01
?_100:  mov     eax, dword [ebp-10H]                    ; 18E5 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 18E8 _ 3B. 45, 10
        jl      ?_099                                   ; 18EB _ 7C, C7
        mov     eax, dword [ebp+8H]                     ; 18ED _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 18F0 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 18F3 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 18F6 _ 8B. 55, 0C
        mov     dword [eax+ecx*4], edx                  ; 18F9 _ 89. 14 88
        jmp     ?_104                                   ; 18FC _ EB, 68

?_101:  mov     eax, dword [ebp+8H]                     ; 18FE _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1901 _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 1904 _ 89. 45, F0
        jmp     ?_103                                   ; 1907 _ EB, 37

?_102:  mov     eax, dword [ebp-10H]                    ; 1909 _ 8B. 45, F0
        lea     ecx, [eax+1H]                           ; 190C _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 190F _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 1912 _ 8B. 55, F0
        add     edx, 4                                  ; 1915 _ 83. C2, 04
        mov     edx, dword [eax+edx*4]                  ; 1918 _ 8B. 14 90
        mov     eax, dword [ebp+8H]                     ; 191B _ 8B. 45, 08
        add     ecx, 4                                  ; 191E _ 83. C1, 04
        mov     dword [eax+ecx*4], edx                  ; 1921 _ 89. 14 88
        mov     eax, dword [ebp-10H]                    ; 1924 _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 1927 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 192A _ 8B. 45, 08
        add     edx, 4                                  ; 192D _ 83. C2, 04
        mov     eax, dword [eax+edx*4]                  ; 1930 _ 8B. 04 90
        mov     edx, dword [ebp-10H]                    ; 1933 _ 8B. 55, F0
        add     edx, 1                                  ; 1936 _ 83. C2, 01
        mov     dword [eax+18H], edx                    ; 1939 _ 89. 50, 18
        sub     dword [ebp-10H], 1                      ; 193C _ 83. 6D, F0, 01
?_103:  mov     eax, dword [ebp-10H]                    ; 1940 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 1943 _ 3B. 45, 10
        jge     ?_102                                   ; 1946 _ 7D, C1
        mov     eax, dword [ebp+8H]                     ; 1948 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 194B _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 194E _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 1951 _ 8B. 55, 0C
        mov     dword [eax+ecx*4], edx                  ; 1954 _ 89. 14 88
        mov     eax, dword [ebp+8H]                     ; 1957 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 195A _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 195D _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1960 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 1963 _ 89. 50, 0C
?_104:  sub     esp, 12                                 ; 1966 _ 83. EC, 0C
        push    dword [ebp+8H]                          ; 1969 _ FF. 75, 08
        call    sheet_refresh                           ; 196C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1971 _ 83. C4, 10
?_105:  nop                                             ; 1974 _ 90
        leave                                           ; 1975 _ C9
        ret                                             ; 1976 _ C3
; sheet_updown End of function

sheet_refresh:; Function begin
        push    ebp                                     ; 1977 _ 55
        mov     ebp, esp                                ; 1978 _ 89. E5
        sub     esp, 48                                 ; 197A _ 83. EC, 30
        mov     eax, dword [ebp+8H]                     ; 197D _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1980 _ 8B. 00
        mov     dword [ebp-14H], eax                    ; 1982 _ 89. 45, EC
        mov     dword [ebp-20H], 0                      ; 1985 _ C7. 45, E0, 00000000
        jmp     ?_112                                   ; 198C _ E9, 000000B8

?_106:  mov     eax, dword [ebp+8H]                     ; 1991 _ 8B. 45, 08
        mov     edx, dword [ebp-20H]                    ; 1994 _ 8B. 55, E0
        add     edx, 4                                  ; 1997 _ 83. C2, 04
        mov     eax, dword [eax+edx*4]                  ; 199A _ 8B. 04 90
        mov     dword [ebp-10H], eax                    ; 199D _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 19A0 _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 19A3 _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 19A5 _ 89. 45, F4
        mov     dword [ebp-18H], 0                      ; 19A8 _ C7. 45, E8, 00000000
        jmp     ?_111                                   ; 19AF _ E9, 00000082

?_107:  mov     eax, dword [ebp-10H]                    ; 19B4 _ 8B. 45, F0
        mov     edx, dword [eax+10H]                    ; 19B7 _ 8B. 50, 10
        mov     eax, dword [ebp-18H]                    ; 19BA _ 8B. 45, E8
        add     eax, edx                                ; 19BD _ 01. D0
        mov     dword [ebp-8H], eax                     ; 19BF _ 89. 45, F8
        mov     dword [ebp-1CH], 0                      ; 19C2 _ C7. 45, E4, 00000000
        jmp     ?_110                                   ; 19C9 _ EB, 5C

?_108:  mov     eax, dword [ebp-10H]                    ; 19CB _ 8B. 45, F0
        mov     edx, dword [eax+0CH]                    ; 19CE _ 8B. 50, 0C
        mov     eax, dword [ebp-1CH]                    ; 19D1 _ 8B. 45, E4
        add     eax, edx                                ; 19D4 _ 01. D0
        mov     dword [ebp-4H], eax                     ; 19D6 _ 89. 45, FC
        mov     eax, dword [ebp-10H]                    ; 19D9 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 19DC _ 8B. 40, 04
        imul    eax, dword [ebp-18H]                    ; 19DF _ 0F AF. 45, E8
        mov     edx, eax                                ; 19E3 _ 89. C2
        mov     eax, dword [ebp-1CH]                    ; 19E5 _ 8B. 45, E4
        add     eax, edx                                ; 19E8 _ 01. D0
        mov     edx, eax                                ; 19EA _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 19EC _ 8B. 45, F4
        add     eax, edx                                ; 19EF _ 01. D0
        movzx   eax, byte [eax]                         ; 19F1 _ 0F B6. 00
        mov     byte [ebp-21H], al                      ; 19F4 _ 88. 45, DF
        movzx   edx, byte [ebp-21H]                     ; 19F7 _ 0F B6. 55, DF
        mov     eax, dword [ebp-10H]                    ; 19FB _ 8B. 45, F0
        mov     eax, dword [eax+14H]                    ; 19FE _ 8B. 40, 14
        cmp     edx, eax                                ; 1A01 _ 39. C2
        jz      ?_109                                   ; 1A03 _ 74, 1E
        mov     eax, dword [ebp+8H]                     ; 1A05 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 1A08 _ 8B. 40, 04
        imul    eax, dword [ebp-8H]                     ; 1A0B _ 0F AF. 45, F8
        mov     edx, eax                                ; 1A0F _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 1A11 _ 8B. 45, FC
        add     eax, edx                                ; 1A14 _ 01. D0
        mov     edx, eax                                ; 1A16 _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 1A18 _ 8B. 45, EC
        add     edx, eax                                ; 1A1B _ 01. C2
        movzx   eax, byte [ebp-21H]                     ; 1A1D _ 0F B6. 45, DF
        mov     byte [edx], al                          ; 1A21 _ 88. 02
?_109:  add     dword [ebp-1CH], 1                      ; 1A23 _ 83. 45, E4, 01
?_110:  mov     eax, dword [ebp-10H]                    ; 1A27 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 1A2A _ 8B. 40, 04
        cmp     dword [ebp-1CH], eax                    ; 1A2D _ 39. 45, E4
        jl      ?_108                                   ; 1A30 _ 7C, 99
        add     dword [ebp-18H], 1                      ; 1A32 _ 83. 45, E8, 01
?_111:  mov     eax, dword [ebp-10H]                    ; 1A36 _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 1A39 _ 8B. 40, 08
        cmp     dword [ebp-18H], eax                    ; 1A3C _ 39. 45, E8
        jl      ?_107                                   ; 1A3F _ 0F 8C, FFFFFF6F
        add     dword [ebp-20H], 1                      ; 1A45 _ 83. 45, E0, 01
?_112:  mov     eax, dword [ebp+8H]                     ; 1A49 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1A4C _ 8B. 40, 0C
        cmp     dword [ebp-20H], eax                    ; 1A4F _ 39. 45, E0
        jle     ?_106                                   ; 1A52 _ 0F 8E, FFFFFF39
        mov     eax, 0                                  ; 1A58 _ B8, 00000000
        leave                                           ; 1A5D _ C9
        ret                                             ; 1A5E _ C3
; sheet_refresh End of function

sheet_slide:; Function begin
        push    ebp                                     ; 1A5F _ 55
        mov     ebp, esp                                ; 1A60 _ 89. E5
        mov     eax, dword [ebp+0CH]                    ; 1A62 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 1A65 _ 8B. 55, 10
        mov     dword [eax+0CH], edx                    ; 1A68 _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 1A6B _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 1A6E _ 8B. 55, 14
        mov     dword [eax+10H], edx                    ; 1A71 _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1A74 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 1A77 _ 8B. 40, 18
        test    eax, eax                                ; 1A7A _ 85. C0
        js      ?_113                                   ; 1A7C _ 78, 0B
        push    dword [ebp+8H]                          ; 1A7E _ FF. 75, 08
        call    sheet_refresh                           ; 1A81 _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 1A86 _ 83. C4, 04
?_113:  nop                                             ; 1A89 _ 90
        leave                                           ; 1A8A _ C9
        ret                                             ; 1A8B _ C3
; sheet_slide End of function



?_114:                                                  ; byte
        db 74H, 65H, 78H, 74H, 21H, 00H                 ; 0000 _ text!.

?_115:                                                  ; byte
        db 70H, 61H, 67H, 65H, 20H, 69H, 73H, 3AH       ; 0006 _ page is:
        db 20H, 00H                                     ; 000E _  .

?_116:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0010 _ BaseAddr
        db 4CH, 3AH, 20H, 00H                           ; 0018 _ L: .

?_117:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 001C _ BaseAddr
        db 48H, 3AH, 20H, 00H                           ; 0024 _ H: .

?_118:                                                  ; byte
        db 4CH, 65H, 6EH, 67H, 74H, 68H, 4CH, 6FH       ; 0028 _ LengthLo
        db 77H, 3AH, 20H, 00H                           ; 0030 _ w: .

?_119:                                                  ; byte
        db 4CH, 65H, 6EH, 67H, 74H, 68H, 48H, 69H       ; 0034 _ LengthHi
        db 67H, 68H, 3AH, 20H, 00H                      ; 003C _ gh: .

?_120:                                                  ; byte
        db 54H, 79H, 70H, 65H, 3AH, 20H, 00H            ; 0041 _ Type: .



keyval:                                                 ; byte
        db 30H, 78H                                     ; 0000 _ 0x

?_121:  db 00H                                          ; 0002 _ .

?_122:  db 00H, 00H, 00H, 00H, 00H                      ; 0003 _ .....

memman: dd 00100000H, 00000000H                         ; 0008 _ 1048576 0 
        dd 00000000H, 00000000H                         ; 0010 _ 0 0 
        dd 00000000H, 00000000H                         ; 0018 _ 0 0 

table_rgb.1648:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 00H, 0FFH     ; 0020 _ ........
        db 00H, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH   ; 0028 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0030 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0038 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 0040 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 0048 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0050 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0058 _ ........

cursor.1706:                                            ; byte
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

str.1753:                                               ; byte
        resb    1                                       ; 0208

?_125:  resb    9                                       ; 0209

?_126:  resb    1                                       ; 0212


