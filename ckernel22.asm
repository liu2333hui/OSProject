; Disassembly of file: /home/bobkuo/eclipse-workspace/nasmCode/ckernel22.o
; Wed Apr 29 20:57:24 2020
; Mode: 32 bits
; Syntax: YASM/NASM
; Instruction set: 80386


global CMain: function
global initBootInfo: function
global init_palette: function
global set_palette: function
global boxfill8: function
global showString: function
global showChar8: function
global init_mouse_cursor: function
global putblock: function
global intHandlerFromC: function
global charToHexVal: function
global charToHexStr: function
global intToHexStr: function
global wait_KBC_sendReady: function
global init_keyboard: function
global enable_mouse: function
global intHandlerFromMouse: function
global fifo8_init: function
global fifo8_put: function
global fifo8_get: function
global fifo8_status: function
global mouse_decode: function
global computeMousePosition: function
global show_mouse_info: function
global showMemoryInfo: function
global init_screen8: function
global make_window8: function
global message_box: function
global memman_init: function
global memman_total: function
global memman_alloc: function
global memman_free: function
global memman_alloc_4k: function
global memman_free_4k: function
global shtctl_init: function
global sheet_alloc: function
global sheet_setbuf: function
global sheet_updown: function
global sheet_refresh: function
global sheet_slide_mouse: function
global sheet_slide: function
global sheet_refreshsub: function
global memman

extern get_memory_block_count                           ; near
extern io_out8                                          ; near
extern io_sti                                           ; near
extern io_store_eflags                                  ; near
extern get_adr_buffer                                   ; near
extern io_cli                                           ; near
extern io_in8                                           ; near
extern systemFont                                       ; byte
extern io_load_eflags                                   ; near


SECTION .text   align=1 execute                         ; section number 1, code

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
        mov     dword [ebp-30H], eax                    ; 001C _ 89. 45, D0
        movzx   eax, word [?_136]                       ; 001F _ 0F B7. 05, 00000004(d)
        cwde                                            ; 0026 _ 98
        mov     dword [xsize], eax                      ; 0027 _ A3, 00000200(d)
        movzx   eax, word [?_137]                       ; 002C _ 0F B7. 05, 00000006(d)
        cwde                                            ; 0033 _ 98
        mov     dword [ysize], eax                      ; 0034 _ A3, 00000204(d)
        mov     eax, dword [bootInfo]                   ; 0039 _ A1, 00000000(d)
        mov     dword [ebp-2CH], eax                    ; 003E _ 89. 45, D4
        mov     dword [ebp-28H], 0                      ; 0041 _ C7. 45, D8, 00000000
        mov     dword [ebp-24H], 0                      ; 0048 _ C7. 45, DC, 00000000
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
        mov     dword [ebp-20H], eax                    ; 008F _ 89. 45, E0
        call    get_adr_buffer                          ; 0092 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 0097 _ 89. 45, E4
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
        push    dword [ebp-30H]                         ; 00D9 _ FF. 75, D0
        push    eax                                     ; 00DC _ 50
        call    shtctl_init                             ; 00DD _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00E2 _ 83. C4, 10
        mov     dword [ebp-18H], eax                    ; 00E5 _ 89. 45, E8
        sub     esp, 12                                 ; 00E8 _ 83. EC, 0C
        push    dword [ebp-18H]                         ; 00EB _ FF. 75, E8
        call    sheet_alloc                             ; 00EE _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00F3 _ 83. C4, 10
        mov     dword [ebp-28H], eax                    ; 00F6 _ 89. 45, D8
        sub     esp, 12                                 ; 00F9 _ 83. EC, 0C
        push    dword [ebp-18H]                         ; 00FC _ FF. 75, E8
        call    sheet_alloc                             ; 00FF _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0104 _ 83. C4, 10
        mov     dword [ebp-24H], eax                    ; 0107 _ 89. 45, DC
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
        push    dword [ebp-28H]                         ; 014A _ FF. 75, D8
        call    sheet_setbuf                            ; 014D _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0152 _ 83. C4, 20
        sub     esp, 12                                 ; 0155 _ 83. EC, 0C
        push    99                                      ; 0158 _ 6A, 63
        push    16                                      ; 015A _ 6A, 10
        push    16                                      ; 015C _ 6A, 10
        push    buf_mouse                               ; 015E _ 68, 00000100(d)
        push    dword [ebp-24H]                         ; 0163 _ FF. 75, DC
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
        push    dword [ebp-28H]                         ; 01A3 _ FF. 75, D8
        push    dword [ebp-18H]                         ; 01A6 _ FF. 75, E8
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
        push    dword [ebp-24H]                         ; 01EA _ FF. 75, DC
        push    dword [ebp-18H]                         ; 01ED _ FF. 75, E8
        call    sheet_slide                             ; 01F0 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 01F5 _ 83. C4, 10
        sub     esp, 8                                  ; 01F8 _ 83. EC, 08
        push    ?_124                                   ; 01FB _ 68, 00000000(d)
        push    dword [ebp-18H]                         ; 0200 _ FF. 75, E8
        call    message_box                             ; 0203 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0208 _ 83. C4, 10
        mov     dword [ebp-14H], eax                    ; 020B _ 89. 45, EC
        sub     esp, 4                                  ; 020E _ 83. EC, 04
        push    0                                       ; 0211 _ 6A, 00
        push    dword [ebp-28H]                         ; 0213 _ FF. 75, D8
        push    dword [ebp-18H]                         ; 0216 _ FF. 75, E8
        call    sheet_updown                            ; 0219 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 021E _ 83. C4, 10
        sub     esp, 4                                  ; 0221 _ 83. EC, 04
        push    100                                     ; 0224 _ 6A, 64
        push    dword [ebp-24H]                         ; 0226 _ FF. 75, DC
        push    dword [ebp-18H]                         ; 0229 _ FF. 75, E8
        call    sheet_updown                            ; 022C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0231 _ 83. C4, 10
        call    io_sti                                  ; 0234 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 0239 _ 83. EC, 0C
        push    mdec                                    ; 023C _ 68, 000000E0(d)
        call    enable_mouse                            ; 0241 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0246 _ 83. C4, 10
        mov     dword [ebp-10H], 0                      ; 0249 _ C7. 45, F0, 00000000
        mov     dword [ebp-38H], 0                      ; 0250 _ C7. 45, C8, 00000000
        mov     dword [ebp-34H], 0                      ; 0257 _ C7. 45, CC, 00000000
?_001:  mov     eax, dword [ebp-34H]                    ; 025E _ 8B. 45, CC
        sub     esp, 12                                 ; 0261 _ 83. EC, 0C
        push    eax                                     ; 0264 _ 50
        call    intToHexStr                             ; 0265 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 026A _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 026D _ 89. 45, F4
        add     dword [ebp-34H], 1                      ; 0270 _ 83. 45, CC, 01
        mov     eax, dword [ebp-14H]                    ; 0274 _ 8B. 45, EC
        mov     eax, dword [eax]                        ; 0277 _ 8B. 00
        sub     esp, 4                                  ; 0279 _ 83. EC, 04
        push    43                                      ; 027C _ 6A, 2B
        push    119                                     ; 027E _ 6A, 77
        push    28                                      ; 0280 _ 6A, 1C
        push    40                                      ; 0282 _ 6A, 28
        push    8                                       ; 0284 _ 6A, 08
        push    160                                     ; 0286 _ 68, 000000A0
        push    eax                                     ; 028B _ 50
        call    boxfill8                                ; 028C _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0291 _ 83. C4, 20
        sub     esp, 8                                  ; 0294 _ 83. EC, 08
        push    dword [ebp-0CH]                         ; 0297 _ FF. 75, F4
        push    0                                       ; 029A _ 6A, 00
        push    28                                      ; 029C _ 6A, 1C
        push    40                                      ; 029E _ 6A, 28
        push    dword [ebp-14H]                         ; 02A0 _ FF. 75, EC
        push    dword [ebp-18H]                         ; 02A3 _ FF. 75, E8
        call    showString                              ; 02A6 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 02AB _ 83. C4, 20
        call    io_cli                                  ; 02AE _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 02B3 _ 83. EC, 0C
        push    keyinfo                                 ; 02B6 _ 68, 00000020(d)
        call    fifo8_status                            ; 02BB _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 02C0 _ 83. C4, 10
        mov     ebx, eax                                ; 02C3 _ 89. C3
        sub     esp, 12                                 ; 02C5 _ 83. EC, 0C
        push    mouseinfo                               ; 02C8 _ 68, 00000008(d)
        call    fifo8_status                            ; 02CD _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 02D2 _ 83. C4, 10
        add     eax, ebx                                ; 02D5 _ 01. D8
        test    eax, eax                                ; 02D7 _ 85. C0
        jnz     ?_002                                   ; 02D9 _ 75, 0A
        call    io_sti                                  ; 02DB _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 02E0 _ E9, FFFFFF79
; CMain End of function

?_002:  ; Local function
        sub     esp, 12                                 ; 02E5 _ 83. EC, 0C
        push    keyinfo                                 ; 02E8 _ 68, 00000020(d)
        call    fifo8_status                            ; 02ED _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 02F2 _ 83. C4, 10
        test    eax, eax                                ; 02F5 _ 85. C0
        jz      ?_003                                   ; 02F7 _ 74, 73
        call    io_sti                                  ; 02F9 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 02FE _ 83. EC, 0C
        push    keyinfo                                 ; 0301 _ 68, 00000020(d)
        call    fifo8_get                               ; 0306 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 030B _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 030E _ 89. 45, F0
        cmp     dword [ebp-10H], 28                     ; 0311 _ 83. 7D, F0, 1C
        jne     ?_001                                   ; 0315 _ 0F 85, FFFFFF43
        mov     ecx, dword [xsize]                      ; 031B _ 8B. 0D, 00000200(d)
        mov     edx, dword [ebp-38H]                    ; 0321 _ 8B. 55, C8
        mov     eax, edx                                ; 0324 _ 89. D0
        shl     eax, 2                                  ; 0326 _ C1. E0, 02
        add     eax, edx                                ; 0329 _ 01. D0
        shl     eax, 2                                  ; 032B _ C1. E0, 02
        mov     edx, eax                                ; 032E _ 89. C2
        mov     eax, dword [ebp-1CH]                    ; 0330 _ 8B. 45, E4
        add     eax, edx                                ; 0333 _ 01. D0
        sub     esp, 4                                  ; 0335 _ 83. EC, 04
        push    7                                       ; 0338 _ 6A, 07
        push    ecx                                     ; 033A _ 51
        push    dword [ebp-38H]                         ; 033B _ FF. 75, C8
        push    dword [ebp-30H]                         ; 033E _ FF. 75, D0
        push    eax                                     ; 0341 _ 50
        push    dword [ebp-28H]                         ; 0342 _ FF. 75, D8
        push    dword [ebp-18H]                         ; 0345 _ FF. 75, E8
        call    showMemoryInfo                          ; 0348 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 034D _ 83. C4, 20
        add     dword [ebp-38H], 1                      ; 0350 _ 83. 45, C8, 01
        mov     eax, dword [ebp-38H]                    ; 0354 _ 8B. 45, C8
        cmp     eax, dword [ebp-20H]                    ; 0357 _ 3B. 45, E0
        jle     ?_001                                   ; 035A _ 0F 8E, FFFFFEFE
        mov     dword [ebp-38H], 0                      ; 0360 _ C7. 45, C8, 00000000
        jmp     ?_001                                   ; 0367 _ E9, FFFFFEF2

?_003:  ; Local function
        sub     esp, 12                                 ; 036C _ 83. EC, 0C
        push    mouseinfo                               ; 036F _ 68, 00000008(d)
        call    fifo8_status                            ; 0374 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0379 _ 83. C4, 10
        test    eax, eax                                ; 037C _ 85. C0
        je      ?_001                                   ; 037E _ 0F 84, FFFFFEDA
        call    io_sti                                  ; 0384 _ E8, FFFFFFFC(rel)
        sub     esp, 4                                  ; 0389 _ 83. EC, 04
        push    dword [ebp-24H]                         ; 038C _ FF. 75, DC
        push    dword [ebp-28H]                         ; 038F _ FF. 75, D8
        push    dword [ebp-18H]                         ; 0392 _ FF. 75, E8
        call    show_mouse_info                         ; 0395 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 039A _ 83. C4, 10
        jmp     ?_001                                   ; 039D _ E9, FFFFFEBC

initBootInfo:; Function begin
        push    ebp                                     ; 03A2 _ 55
        mov     ebp, esp                                ; 03A3 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 03A5 _ 8B. 45, 08
        mov     dword [eax], 655360                     ; 03A8 _ C7. 00, 000A0000
        mov     eax, dword [ebp+8H]                     ; 03AE _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 320                      ; 03B1 _ 66: C7. 40, 04, 0140
        mov     eax, dword [ebp+8H]                     ; 03B7 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 200                      ; 03BA _ 66: C7. 40, 06, 00C8
        nop                                             ; 03C0 _ 90
        pop     ebp                                     ; 03C1 _ 5D
        ret                                             ; 03C2 _ C3
; initBootInfo End of function

init_palette:; Function begin
        push    ebp                                     ; 03C3 _ 55
        mov     ebp, esp                                ; 03C4 _ 89. E5
        sub     esp, 8                                  ; 03C6 _ 83. EC, 08
        sub     esp, 4                                  ; 03C9 _ 83. EC, 04
        push    table_rgb.1677                          ; 03CC _ 68, 00000020(d)
        push    15                                      ; 03D1 _ 6A, 0F
        push    0                                       ; 03D3 _ 6A, 00
        call    set_palette                             ; 03D5 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03DA _ 83. C4, 10
        nop                                             ; 03DD _ 90
        leave                                           ; 03DE _ C9
        ret                                             ; 03DF _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 03E0 _ 55
        mov     ebp, esp                                ; 03E1 _ 89. E5
        sub     esp, 24                                 ; 03E3 _ 83. EC, 18
        call    io_load_eflags                          ; 03E6 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 03EB _ 89. 45, F4
        call    io_cli                                  ; 03EE _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 03F3 _ 83. EC, 08
        push    dword [ebp+8H]                          ; 03F6 _ FF. 75, 08
        push    968                                     ; 03F9 _ 68, 000003C8
        call    io_out8                                 ; 03FE _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0403 _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 0406 _ 8B. 45, 08
        mov     dword [ebp-10H], eax                    ; 0409 _ 89. 45, F0
        jmp     ?_005                                   ; 040C _ EB, 65

?_004:  mov     eax, dword [ebp+10H]                    ; 040E _ 8B. 45, 10
        movzx   eax, byte [eax]                         ; 0411 _ 0F B6. 00
        shr     al, 2                                   ; 0414 _ C0. E8, 02
        movzx   eax, al                                 ; 0417 _ 0F B6. C0
        sub     esp, 8                                  ; 041A _ 83. EC, 08
        push    eax                                     ; 041D _ 50
        push    969                                     ; 041E _ 68, 000003C9
        call    io_out8                                 ; 0423 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0428 _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 042B _ 8B. 45, 10
        add     eax, 1                                  ; 042E _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 0431 _ 0F B6. 00
        shr     al, 2                                   ; 0434 _ C0. E8, 02
        movzx   eax, al                                 ; 0437 _ 0F B6. C0
        sub     esp, 8                                  ; 043A _ 83. EC, 08
        push    eax                                     ; 043D _ 50
        push    969                                     ; 043E _ 68, 000003C9
        call    io_out8                                 ; 0443 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0448 _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 044B _ 8B. 45, 10
        add     eax, 2                                  ; 044E _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 0451 _ 0F B6. 00
        shr     al, 2                                   ; 0454 _ C0. E8, 02
        movzx   eax, al                                 ; 0457 _ 0F B6. C0
        sub     esp, 8                                  ; 045A _ 83. EC, 08
        push    eax                                     ; 045D _ 50
        push    969                                     ; 045E _ 68, 000003C9
        call    io_out8                                 ; 0463 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0468 _ 83. C4, 10
        add     dword [ebp+10H], 3                      ; 046B _ 83. 45, 10, 03
        add     dword [ebp-10H], 1                      ; 046F _ 83. 45, F0, 01
?_005:  mov     eax, dword [ebp-10H]                    ; 0473 _ 8B. 45, F0
        cmp     eax, dword [ebp+0CH]                    ; 0476 _ 3B. 45, 0C
        jle     ?_004                                   ; 0479 _ 7E, 93
        sub     esp, 12                                 ; 047B _ 83. EC, 0C
        push    dword [ebp-0CH]                         ; 047E _ FF. 75, F4
        call    io_store_eflags                         ; 0481 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0486 _ 83. C4, 10
        nop                                             ; 0489 _ 90
        leave                                           ; 048A _ C9
        ret                                             ; 048B _ C3
; set_palette End of function

boxfill8:; Function begin
        push    ebp                                     ; 048C _ 55
        mov     ebp, esp                                ; 048D _ 89. E5
        sub     esp, 20                                 ; 048F _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 0492 _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 0495 _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 0498 _ 8B. 45, 18
        mov     dword [ebp-4H], eax                     ; 049B _ 89. 45, FC
        jmp     ?_009                                   ; 049E _ EB, 33

?_006:  mov     eax, dword [ebp+14H]                    ; 04A0 _ 8B. 45, 14
        mov     dword [ebp-8H], eax                     ; 04A3 _ 89. 45, F8
        jmp     ?_008                                   ; 04A6 _ EB, 1F

?_007:  mov     eax, dword [ebp-4H]                     ; 04A8 _ 8B. 45, FC
        imul    eax, dword [ebp+0CH]                    ; 04AB _ 0F AF. 45, 0C
        mov     edx, eax                                ; 04AF _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 04B1 _ 8B. 45, F8
        add     eax, edx                                ; 04B4 _ 01. D0
        mov     edx, eax                                ; 04B6 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 04B8 _ 8B. 45, 08
        add     edx, eax                                ; 04BB _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 04BD _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 04C1 _ 88. 02
        add     dword [ebp-8H], 1                       ; 04C3 _ 83. 45, F8, 01
?_008:  mov     eax, dword [ebp-8H]                     ; 04C7 _ 8B. 45, F8
        cmp     eax, dword [ebp+1CH]                    ; 04CA _ 3B. 45, 1C
        jle     ?_007                                   ; 04CD _ 7E, D9
        add     dword [ebp-4H], 1                       ; 04CF _ 83. 45, FC, 01
?_009:  mov     eax, dword [ebp-4H]                     ; 04D3 _ 8B. 45, FC
        cmp     eax, dword [ebp+20H]                    ; 04D6 _ 3B. 45, 20
        jle     ?_006                                   ; 04D9 _ 7E, C5
        nop                                             ; 04DB _ 90
        leave                                           ; 04DC _ C9
        ret                                             ; 04DD _ C3
; boxfill8 End of function

showString:; Function begin
        push    ebp                                     ; 04DE _ 55
        mov     ebp, esp                                ; 04DF _ 89. E5
        push    ebx                                     ; 04E1 _ 53
        sub     esp, 36                                 ; 04E2 _ 83. EC, 24
        mov     eax, dword [ebp+18H]                    ; 04E5 _ 8B. 45, 18
        mov     byte [ebp-1CH], al                      ; 04E8 _ 88. 45, E4
        mov     eax, dword [ebp+10H]                    ; 04EB _ 8B. 45, 10
        mov     dword [ebp-0CH], eax                    ; 04EE _ 89. 45, F4
        jmp     ?_011                                   ; 04F1 _ EB, 3E

?_010:  mov     eax, dword [ebp+1CH]                    ; 04F3 _ 8B. 45, 1C
        movzx   eax, byte [eax]                         ; 04F6 _ 0F B6. 00
        movzx   eax, al                                 ; 04F9 _ 0F B6. C0
        shl     eax, 4                                  ; 04FC _ C1. E0, 04
        lea     ebx, [systemFont+eax]                   ; 04FF _ 8D. 98, 00000000(d)
        movsx   ecx, byte [ebp-1CH]                     ; 0505 _ 0F BE. 4D, E4
        mov     eax, dword [ebp+0CH]                    ; 0509 _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 050C _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 050F _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 0512 _ 8B. 00
        sub     esp, 8                                  ; 0514 _ 83. EC, 08
        push    ebx                                     ; 0517 _ 53
        push    ecx                                     ; 0518 _ 51
        push    dword [ebp+14H]                         ; 0519 _ FF. 75, 14
        push    dword [ebp+10H]                         ; 051C _ FF. 75, 10
        push    edx                                     ; 051F _ 52
        push    eax                                     ; 0520 _ 50
        call    showChar8                               ; 0521 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0526 _ 83. C4, 20
        add     dword [ebp+1CH], 1                      ; 0529 _ 83. 45, 1C, 01
        add     dword [ebp+10H], 8                      ; 052D _ 83. 45, 10, 08
?_011:  mov     eax, dword [ebp+1CH]                    ; 0531 _ 8B. 45, 1C
        movzx   eax, byte [eax]                         ; 0534 _ 0F B6. 00
        test    al, al                                  ; 0537 _ 84. C0
        jnz     ?_010                                   ; 0539 _ 75, B8
        mov     eax, dword [ebp+14H]                    ; 053B _ 8B. 45, 14
        add     eax, 16                                 ; 053E _ 83. C0, 10
        sub     esp, 8                                  ; 0541 _ 83. EC, 08
        push    eax                                     ; 0544 _ 50
        push    dword [ebp+10H]                         ; 0545 _ FF. 75, 10
        push    dword [ebp+14H]                         ; 0548 _ FF. 75, 14
        push    dword [ebp-0CH]                         ; 054B _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 054E _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0551 _ FF. 75, 08
        call    sheet_refresh                           ; 0554 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0559 _ 83. C4, 20
        nop                                             ; 055C _ 90
        mov     ebx, dword [ebp-4H]                     ; 055D _ 8B. 5D, FC
        leave                                           ; 0560 _ C9
        ret                                             ; 0561 _ C3
; showString End of function

showChar8:; Function begin
        push    ebp                                     ; 0562 _ 55
        mov     ebp, esp                                ; 0563 _ 89. E5
        sub     esp, 20                                 ; 0565 _ 83. EC, 14
        mov     eax, dword [ebp+18H]                    ; 0568 _ 8B. 45, 18
        mov     byte [ebp-14H], al                      ; 056B _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 056E _ C7. 45, FC, 00000000
        jmp     ?_021                                   ; 0575 _ E9, 0000016C

?_012:  mov     edx, dword [ebp-4H]                     ; 057A _ 8B. 55, FC
        mov     eax, dword [ebp+1CH]                    ; 057D _ 8B. 45, 1C
        add     eax, edx                                ; 0580 _ 01. D0
        movzx   eax, byte [eax]                         ; 0582 _ 0F B6. 00
        mov     byte [ebp-5H], al                       ; 0585 _ 88. 45, FB
        cmp     byte [ebp-5H], 0                        ; 0588 _ 80. 7D, FB, 00
        jns     ?_013                                   ; 058C _ 79, 20
        mov     edx, dword [ebp+14H]                    ; 058E _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0591 _ 8B. 45, FC
        add     eax, edx                                ; 0594 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0596 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 059A _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 059C _ 8B. 45, 10
        add     eax, edx                                ; 059F _ 01. D0
        mov     edx, eax                                ; 05A1 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 05A3 _ 8B. 45, 08
        add     edx, eax                                ; 05A6 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 05A8 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 05AC _ 88. 02
?_013:  movsx   eax, byte [ebp-5H]                      ; 05AE _ 0F BE. 45, FB
        and     eax, 40H                                ; 05B2 _ 83. E0, 40
        test    eax, eax                                ; 05B5 _ 85. C0
        jz      ?_014                                   ; 05B7 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 05B9 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 05BC _ 8B. 45, FC
        add     eax, edx                                ; 05BF _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 05C1 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 05C5 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 05C7 _ 8B. 45, 10
        add     eax, edx                                ; 05CA _ 01. D0
        lea     edx, [eax+1H]                           ; 05CC _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 05CF _ 8B. 45, 08
        add     edx, eax                                ; 05D2 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 05D4 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 05D8 _ 88. 02
?_014:  movsx   eax, byte [ebp-5H]                      ; 05DA _ 0F BE. 45, FB
        and     eax, 20H                                ; 05DE _ 83. E0, 20
        test    eax, eax                                ; 05E1 _ 85. C0
        jz      ?_015                                   ; 05E3 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 05E5 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 05E8 _ 8B. 45, FC
        add     eax, edx                                ; 05EB _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 05ED _ 0F AF. 45, 0C
        mov     edx, eax                                ; 05F1 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 05F3 _ 8B. 45, 10
        add     eax, edx                                ; 05F6 _ 01. D0
        lea     edx, [eax+2H]                           ; 05F8 _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 05FB _ 8B. 45, 08
        add     edx, eax                                ; 05FE _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0600 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0604 _ 88. 02
?_015:  movsx   eax, byte [ebp-5H]                      ; 0606 _ 0F BE. 45, FB
        and     eax, 10H                                ; 060A _ 83. E0, 10
        test    eax, eax                                ; 060D _ 85. C0
        jz      ?_016                                   ; 060F _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 0611 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0614 _ 8B. 45, FC
        add     eax, edx                                ; 0617 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0619 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 061D _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 061F _ 8B. 45, 10
        add     eax, edx                                ; 0622 _ 01. D0
        lea     edx, [eax+3H]                           ; 0624 _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 0627 _ 8B. 45, 08
        add     edx, eax                                ; 062A _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 062C _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0630 _ 88. 02
?_016:  movsx   eax, byte [ebp-5H]                      ; 0632 _ 0F BE. 45, FB
        and     eax, 08H                                ; 0636 _ 83. E0, 08
        test    eax, eax                                ; 0639 _ 85. C0
        jz      ?_017                                   ; 063B _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 063D _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0640 _ 8B. 45, FC
        add     eax, edx                                ; 0643 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0645 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0649 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 064B _ 8B. 45, 10
        add     eax, edx                                ; 064E _ 01. D0
        lea     edx, [eax+4H]                           ; 0650 _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0653 _ 8B. 45, 08
        add     edx, eax                                ; 0656 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0658 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 065C _ 88. 02
?_017:  movsx   eax, byte [ebp-5H]                      ; 065E _ 0F BE. 45, FB
        and     eax, 04H                                ; 0662 _ 83. E0, 04
        test    eax, eax                                ; 0665 _ 85. C0
        jz      ?_018                                   ; 0667 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 0669 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 066C _ 8B. 45, FC
        add     eax, edx                                ; 066F _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0671 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0675 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0677 _ 8B. 45, 10
        add     eax, edx                                ; 067A _ 01. D0
        lea     edx, [eax+5H]                           ; 067C _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 067F _ 8B. 45, 08
        add     edx, eax                                ; 0682 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0684 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0688 _ 88. 02
?_018:  movsx   eax, byte [ebp-5H]                      ; 068A _ 0F BE. 45, FB
        and     eax, 02H                                ; 068E _ 83. E0, 02
        test    eax, eax                                ; 0691 _ 85. C0
        jz      ?_019                                   ; 0693 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 0695 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0698 _ 8B. 45, FC
        add     eax, edx                                ; 069B _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 069D _ 0F AF. 45, 0C
        mov     edx, eax                                ; 06A1 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 06A3 _ 8B. 45, 10
        add     eax, edx                                ; 06A6 _ 01. D0
        lea     edx, [eax+6H]                           ; 06A8 _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 06AB _ 8B. 45, 08
        add     edx, eax                                ; 06AE _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 06B0 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 06B4 _ 88. 02
?_019:  movsx   eax, byte [ebp-5H]                      ; 06B6 _ 0F BE. 45, FB
        and     eax, 01H                                ; 06BA _ 83. E0, 01
        test    eax, eax                                ; 06BD _ 85. C0
        jz      ?_020                                   ; 06BF _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 06C1 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 06C4 _ 8B. 45, FC
        add     eax, edx                                ; 06C7 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 06C9 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 06CD _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 06CF _ 8B. 45, 10
        add     eax, edx                                ; 06D2 _ 01. D0
        lea     edx, [eax+7H]                           ; 06D4 _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 06D7 _ 8B. 45, 08
        add     edx, eax                                ; 06DA _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 06DC _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 06E0 _ 88. 02
?_020:  add     dword [ebp-4H], 1                       ; 06E2 _ 83. 45, FC, 01
?_021:  cmp     dword [ebp-4H], 15                      ; 06E6 _ 83. 7D, FC, 0F
        jle     ?_012                                   ; 06EA _ 0F 8E, FFFFFE8A
        nop                                             ; 06F0 _ 90
        leave                                           ; 06F1 _ C9
        ret                                             ; 06F2 _ C3
; showChar8 End of function

init_mouse_cursor:; Function begin
        push    ebp                                     ; 06F3 _ 55
        mov     ebp, esp                                ; 06F4 _ 89. E5
        sub     esp, 20                                 ; 06F6 _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 06F9 _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 06FC _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 06FF _ C7. 45, FC, 00000000
        jmp     ?_028                                   ; 0706 _ E9, 000000B5

?_022:  mov     dword [ebp-8H], 0                       ; 070B _ C7. 45, F8, 00000000
        jmp     ?_027                                   ; 0712 _ E9, 0000009B

?_023:  mov     eax, dword [ebp-4H]                     ; 0717 _ 8B. 45, FC
        shl     eax, 4                                  ; 071A _ C1. E0, 04
        mov     edx, eax                                ; 071D _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 071F _ 8B. 45, F8
        add     eax, edx                                ; 0722 _ 01. D0
        add     eax, cursor.1734                        ; 0724 _ 05, 00000060(d)
        movzx   eax, byte [eax]                         ; 0729 _ 0F B6. 00
        cmp     al, 42                                  ; 072C _ 3C, 2A
        jnz     ?_024                                   ; 072E _ 75, 19
        mov     eax, dword [ebp-4H]                     ; 0730 _ 8B. 45, FC
        shl     eax, 4                                  ; 0733 _ C1. E0, 04
        mov     edx, eax                                ; 0736 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0738 _ 8B. 45, F8
        add     eax, edx                                ; 073B _ 01. D0
        mov     edx, eax                                ; 073D _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 073F _ 8B. 45, 08
        add     eax, edx                                ; 0742 _ 01. D0
        mov     byte [eax], 0                           ; 0744 _ C6. 00, 00
        jmp     ?_026                                   ; 0747 _ EB, 65

?_024:  mov     eax, dword [ebp-4H]                     ; 0749 _ 8B. 45, FC
        shl     eax, 4                                  ; 074C _ C1. E0, 04
        mov     edx, eax                                ; 074F _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0751 _ 8B. 45, F8
        add     eax, edx                                ; 0754 _ 01. D0
        add     eax, cursor.1734                        ; 0756 _ 05, 00000060(d)
        movzx   eax, byte [eax]                         ; 075B _ 0F B6. 00
        cmp     al, 79                                  ; 075E _ 3C, 4F
        jnz     ?_025                                   ; 0760 _ 75, 19
        mov     eax, dword [ebp-4H]                     ; 0762 _ 8B. 45, FC
        shl     eax, 4                                  ; 0765 _ C1. E0, 04
        mov     edx, eax                                ; 0768 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 076A _ 8B. 45, F8
        add     eax, edx                                ; 076D _ 01. D0
        mov     edx, eax                                ; 076F _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0771 _ 8B. 45, 08
        add     eax, edx                                ; 0774 _ 01. D0
        mov     byte [eax], 7                           ; 0776 _ C6. 00, 07
        jmp     ?_026                                   ; 0779 _ EB, 33

?_025:  mov     eax, dword [ebp-4H]                     ; 077B _ 8B. 45, FC
        shl     eax, 4                                  ; 077E _ C1. E0, 04
        mov     edx, eax                                ; 0781 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0783 _ 8B. 45, F8
        add     eax, edx                                ; 0786 _ 01. D0
        add     eax, cursor.1734                        ; 0788 _ 05, 00000060(d)
        movzx   eax, byte [eax]                         ; 078D _ 0F B6. 00
        cmp     al, 46                                  ; 0790 _ 3C, 2E
        jnz     ?_026                                   ; 0792 _ 75, 1A
        mov     eax, dword [ebp-4H]                     ; 0794 _ 8B. 45, FC
        shl     eax, 4                                  ; 0797 _ C1. E0, 04
        mov     edx, eax                                ; 079A _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 079C _ 8B. 45, F8
        add     eax, edx                                ; 079F _ 01. D0
        mov     edx, eax                                ; 07A1 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 07A3 _ 8B. 45, 08
        add     edx, eax                                ; 07A6 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 07A8 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 07AC _ 88. 02
?_026:  add     dword [ebp-8H], 1                       ; 07AE _ 83. 45, F8, 01
?_027:  cmp     dword [ebp-8H], 15                      ; 07B2 _ 83. 7D, F8, 0F
        jle     ?_023                                   ; 07B6 _ 0F 8E, FFFFFF5B
        add     dword [ebp-4H], 1                       ; 07BC _ 83. 45, FC, 01
?_028:  cmp     dword [ebp-4H], 15                      ; 07C0 _ 83. 7D, FC, 0F
        jle     ?_022                                   ; 07C4 _ 0F 8E, FFFFFF41
        nop                                             ; 07CA _ 90
        leave                                           ; 07CB _ C9
        ret                                             ; 07CC _ C3
; init_mouse_cursor End of function

putblock:; Function begin
        push    ebp                                     ; 07CD _ 55
        mov     ebp, esp                                ; 07CE _ 89. E5
        push    ebx                                     ; 07D0 _ 53
        sub     esp, 16                                 ; 07D1 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 07D4 _ C7. 45, F8, 00000000
        jmp     ?_032                                   ; 07DB _ EB, 50

?_029:  mov     dword [ebp-0CH], 0                      ; 07DD _ C7. 45, F4, 00000000
        jmp     ?_031                                   ; 07E4 _ EB, 3B

?_030:  mov     eax, dword [ebp-8H]                     ; 07E6 _ 8B. 45, F8
        imul    eax, dword [ebp+24H]                    ; 07E9 _ 0F AF. 45, 24
        mov     edx, eax                                ; 07ED _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 07EF _ 8B. 45, F4
        add     eax, edx                                ; 07F2 _ 01. D0
        mov     edx, eax                                ; 07F4 _ 89. C2
        mov     eax, dword [ebp+20H]                    ; 07F6 _ 8B. 45, 20
        add     eax, edx                                ; 07F9 _ 01. D0
        mov     ecx, dword [ebp+1CH]                    ; 07FB _ 8B. 4D, 1C
        mov     edx, dword [ebp-8H]                     ; 07FE _ 8B. 55, F8
        add     edx, ecx                                ; 0801 _ 01. CA
        imul    edx, dword [ebp+0CH]                    ; 0803 _ 0F AF. 55, 0C
        mov     ebx, dword [ebp+18H]                    ; 0807 _ 8B. 5D, 18
        mov     ecx, dword [ebp-0CH]                    ; 080A _ 8B. 4D, F4
        add     ecx, ebx                                ; 080D _ 01. D9
        add     edx, ecx                                ; 080F _ 01. CA
        mov     ecx, edx                                ; 0811 _ 89. D1
        mov     edx, dword [ebp+8H]                     ; 0813 _ 8B. 55, 08
        add     edx, ecx                                ; 0816 _ 01. CA
        movzx   eax, byte [eax]                         ; 0818 _ 0F B6. 00
        mov     byte [edx], al                          ; 081B _ 88. 02
        add     dword [ebp-0CH], 1                      ; 081D _ 83. 45, F4, 01
?_031:  mov     eax, dword [ebp-0CH]                    ; 0821 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 0824 _ 3B. 45, 10
        jl      ?_030                                   ; 0827 _ 7C, BD
        add     dword [ebp-8H], 1                       ; 0829 _ 83. 45, F8, 01
?_032:  mov     eax, dword [ebp-8H]                     ; 082D _ 8B. 45, F8
        cmp     eax, dword [ebp+14H]                    ; 0830 _ 3B. 45, 14
        jl      ?_029                                   ; 0833 _ 7C, A8
        nop                                             ; 0835 _ 90
        add     esp, 16                                 ; 0836 _ 83. C4, 10
        pop     ebx                                     ; 0839 _ 5B
        pop     ebp                                     ; 083A _ 5D
        ret                                             ; 083B _ C3
; putblock End of function

intHandlerFromC:; Function begin
        push    ebp                                     ; 083C _ 55
        mov     ebp, esp                                ; 083D _ 89. E5
        sub     esp, 24                                 ; 083F _ 83. EC, 18
        mov     eax, dword [bootInfo]                   ; 0842 _ A1, 00000000(d)
        mov     dword [ebp-14H], eax                    ; 0847 _ 89. 45, EC
        movzx   eax, word [?_136]                       ; 084A _ 0F B7. 05, 00000004(d)
        cwde                                            ; 0851 _ 98
        mov     dword [ebp-10H], eax                    ; 0852 _ 89. 45, F0
        movzx   eax, word [?_137]                       ; 0855 _ 0F B7. 05, 00000006(d)
        cwde                                            ; 085C _ 98
        mov     dword [ebp-0CH], eax                    ; 085D _ 89. 45, F4
        sub     esp, 8                                  ; 0860 _ 83. EC, 08
        push    33                                      ; 0863 _ 6A, 21
        push    32                                      ; 0865 _ 6A, 20
        call    io_out8                                 ; 0867 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 086C _ 83. C4, 10
        mov     byte [ebp-15H], 0                       ; 086F _ C6. 45, EB, 00
        sub     esp, 12                                 ; 0873 _ 83. EC, 0C
        push    96                                      ; 0876 _ 6A, 60
        call    io_in8                                  ; 0878 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 087D _ 83. C4, 10
        mov     byte [ebp-15H], al                      ; 0880 _ 88. 45, EB
        movzx   eax, byte [ebp-15H]                     ; 0883 _ 0F B6. 45, EB
        sub     esp, 8                                  ; 0887 _ 83. EC, 08
        push    eax                                     ; 088A _ 50
        push    keyinfo                                 ; 088B _ 68, 00000020(d)
        call    fifo8_put                               ; 0890 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0895 _ 83. C4, 10
        nop                                             ; 0898 _ 90
        leave                                           ; 0899 _ C9
        ret                                             ; 089A _ C3
; intHandlerFromC End of function

charToHexVal:; Function begin
        push    ebp                                     ; 089B _ 55
        mov     ebp, esp                                ; 089C _ 89. E5
        sub     esp, 4                                  ; 089E _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 08A1 _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 08A4 _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 08A7 _ 80. 7D, FC, 09
        jle     ?_033                                   ; 08AB _ 7E, 09
        movzx   eax, byte [ebp-4H]                      ; 08AD _ 0F B6. 45, FC
        add     eax, 55                                 ; 08B1 _ 83. C0, 37
        jmp     ?_034                                   ; 08B4 _ EB, 07

?_033:  movzx   eax, byte [ebp-4H]                      ; 08B6 _ 0F B6. 45, FC
        add     eax, 48                                 ; 08BA _ 83. C0, 30
?_034:  leave                                           ; 08BD _ C9
        ret                                             ; 08BE _ C3
; charToHexVal End of function

charToHexStr:; Function begin
        push    ebp                                     ; 08BF _ 55
        mov     ebp, esp                                ; 08C0 _ 89. E5
        sub     esp, 20                                 ; 08C2 _ 83. EC, 14
        mov     eax, dword [ebp+8H]                     ; 08C5 _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 08C8 _ 88. 45, EC
        movzx   eax, byte [ebp-14H]                     ; 08CB _ 0F B6. 45, EC
        and     eax, 0FH                                ; 08CF _ 83. E0, 0F
        mov     byte [ebp-1H], al                       ; 08D2 _ 88. 45, FF
        movsx   eax, byte [ebp-1H]                      ; 08D5 _ 0F BE. 45, FF
        push    eax                                     ; 08D9 _ 50
        call    charToHexVal                            ; 08DA _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 08DF _ 83. C4, 04
        mov     byte [?_135], al                        ; 08E2 _ A2, 00000003(d)
        shr     byte [ebp-14H], 4                       ; 08E7 _ C0. 6D, EC, 04
        movzx   eax, byte [ebp-14H]                     ; 08EB _ 0F B6. 45, EC
        movsx   eax, al                                 ; 08EF _ 0F BE. C0
        push    eax                                     ; 08F2 _ 50
        call    charToHexVal                            ; 08F3 _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 08F8 _ 83. C4, 04
        mov     byte [?_134], al                        ; 08FB _ A2, 00000002(d)
        mov     eax, keyval                             ; 0900 _ B8, 00000000(d)
        leave                                           ; 0905 _ C9
        ret                                             ; 0906 _ C3
; charToHexStr End of function

intToHexStr:; Function begin
        push    ebp                                     ; 0907 _ 55
        mov     ebp, esp                                ; 0908 _ 89. E5
        sub     esp, 16                                 ; 090A _ 83. EC, 10
        mov     byte [str.1778], 48                     ; 090D _ C6. 05, 00000208(d), 30
        mov     byte [?_138], 88                        ; 0914 _ C6. 05, 00000209(d), 58
        mov     byte [?_139], 0                         ; 091B _ C6. 05, 00000212(d), 00
        mov     dword [ebp-8H], 2                       ; 0922 _ C7. 45, F8, 00000002
        mov     dword [ebp-0CH], 7                      ; 0929 _ C7. 45, F4, 00000007
        jmp     ?_038                                   ; 0930 _ EB, 45

?_035:  mov     eax, dword [ebp+8H]                     ; 0932 _ 8B. 45, 08
        and     eax, 0FH                                ; 0935 _ 83. E0, 0F
        mov     dword [ebp-4H], eax                     ; 0938 _ 89. 45, FC
        cmp     dword [ebp-4H], 9                       ; 093B _ 83. 7D, FC, 09
        jg      ?_036                                   ; 093F _ 7F, 18
        mov     eax, dword [ebp-4H]                     ; 0941 _ 8B. 45, FC
        lea     ecx, [eax+30H]                          ; 0944 _ 8D. 48, 30
        mov     edx, dword [ebp-8H]                     ; 0947 _ 8B. 55, F8
        mov     eax, dword [ebp-0CH]                    ; 094A _ 8B. 45, F4
        add     eax, edx                                ; 094D _ 01. D0
        mov     edx, ecx                                ; 094F _ 89. CA
        mov     byte [str.1778+eax], dl                 ; 0951 _ 88. 90, 00000208(d)
        jmp     ?_037                                   ; 0957 _ EB, 16

?_036:  mov     eax, dword [ebp-4H]                     ; 0959 _ 8B. 45, FC
        lea     ecx, [eax+37H]                          ; 095C _ 8D. 48, 37
        mov     edx, dword [ebp-8H]                     ; 095F _ 8B. 55, F8
        mov     eax, dword [ebp-0CH]                    ; 0962 _ 8B. 45, F4
        add     eax, edx                                ; 0965 _ 01. D0
        mov     edx, ecx                                ; 0967 _ 89. CA
        mov     byte [str.1778+eax], dl                 ; 0969 _ 88. 90, 00000208(d)
?_037:  shr     dword [ebp+8H], 4                       ; 096F _ C1. 6D, 08, 04
        sub     dword [ebp-0CH], 1                      ; 0973 _ 83. 6D, F4, 01
?_038:  cmp     dword [ebp-0CH], 0                      ; 0977 _ 83. 7D, F4, 00
        jns     ?_035                                   ; 097B _ 79, B5
        mov     eax, str.1778                           ; 097D _ B8, 00000208(d)
        leave                                           ; 0982 _ C9
        ret                                             ; 0983 _ C3
; intToHexStr End of function

wait_KBC_sendReady:; Function begin
        push    ebp                                     ; 0984 _ 55
        mov     ebp, esp                                ; 0985 _ 89. E5
        sub     esp, 8                                  ; 0987 _ 83. EC, 08
?_039:  sub     esp, 12                                 ; 098A _ 83. EC, 0C
        push    100                                     ; 098D _ 6A, 64
        call    io_in8                                  ; 098F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0994 _ 83. C4, 10
        and     eax, 02H                                ; 0997 _ 83. E0, 02
        test    eax, eax                                ; 099A _ 85. C0
        jz      ?_040                                   ; 099C _ 74, 02
        jmp     ?_039                                   ; 099E _ EB, EA
; wait_KBC_sendReady End of function

?_040:  ; Local function
        nop                                             ; 09A0 _ 90
        nop                                             ; 09A1 _ 90
        leave                                           ; 09A2 _ C9
        ret                                             ; 09A3 _ C3

init_keyboard:; Function begin
        push    ebp                                     ; 09A4 _ 55
        mov     ebp, esp                                ; 09A5 _ 89. E5
        sub     esp, 8                                  ; 09A7 _ 83. EC, 08
        call    wait_KBC_sendReady                      ; 09AA _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 09AF _ 83. EC, 08
        push    96                                      ; 09B2 _ 6A, 60
        push    100                                     ; 09B4 _ 6A, 64
        call    io_out8                                 ; 09B6 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 09BB _ 83. C4, 10
        call    wait_KBC_sendReady                      ; 09BE _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 09C3 _ 83. EC, 08
        push    71                                      ; 09C6 _ 6A, 47
        push    96                                      ; 09C8 _ 6A, 60
        call    io_out8                                 ; 09CA _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 09CF _ 83. C4, 10
        nop                                             ; 09D2 _ 90
        leave                                           ; 09D3 _ C9
        ret                                             ; 09D4 _ C3
; init_keyboard End of function

enable_mouse:; Function begin
        push    ebp                                     ; 09D5 _ 55
        mov     ebp, esp                                ; 09D6 _ 89. E5
        sub     esp, 8                                  ; 09D8 _ 83. EC, 08
        call    wait_KBC_sendReady                      ; 09DB _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 09E0 _ 83. EC, 08
        push    212                                     ; 09E3 _ 68, 000000D4
        push    100                                     ; 09E8 _ 6A, 64
        call    io_out8                                 ; 09EA _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 09EF _ 83. C4, 10
        call    wait_KBC_sendReady                      ; 09F2 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 09F7 _ 83. EC, 08
        push    244                                     ; 09FA _ 68, 000000F4
        push    96                                      ; 09FF _ 6A, 60
        call    io_out8                                 ; 0A01 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0A06 _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 0A09 _ 8B. 45, 08
        mov     byte [eax+3H], 0                        ; 0A0C _ C6. 40, 03, 00
        nop                                             ; 0A10 _ 90
        leave                                           ; 0A11 _ C9
        ret                                             ; 0A12 _ C3
; enable_mouse End of function

intHandlerFromMouse:; Function begin
        push    ebp                                     ; 0A13 _ 55
        mov     ebp, esp                                ; 0A14 _ 89. E5
        sub     esp, 24                                 ; 0A16 _ 83. EC, 18
        sub     esp, 8                                  ; 0A19 _ 83. EC, 08
        push    32                                      ; 0A1C _ 6A, 20
        push    160                                     ; 0A1E _ 68, 000000A0
        call    io_out8                                 ; 0A23 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0A28 _ 83. C4, 10
        sub     esp, 8                                  ; 0A2B _ 83. EC, 08
        push    32                                      ; 0A2E _ 6A, 20
        push    32                                      ; 0A30 _ 6A, 20
        call    io_out8                                 ; 0A32 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0A37 _ 83. C4, 10
        sub     esp, 12                                 ; 0A3A _ 83. EC, 0C
        push    96                                      ; 0A3D _ 6A, 60
        call    io_in8                                  ; 0A3F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0A44 _ 83. C4, 10
        mov     byte [ebp-9H], al                       ; 0A47 _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 0A4A _ 0F B6. 45, F7
        sub     esp, 8                                  ; 0A4E _ 83. EC, 08
        push    eax                                     ; 0A51 _ 50
        push    mouseinfo                               ; 0A52 _ 68, 00000008(d)
        call    fifo8_put                               ; 0A57 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0A5C _ 83. C4, 10
        nop                                             ; 0A5F _ 90
        leave                                           ; 0A60 _ C9
        ret                                             ; 0A61 _ C3
; intHandlerFromMouse End of function

fifo8_init:; Function begin
        push    ebp                                     ; 0A62 _ 55
        mov     ebp, esp                                ; 0A63 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 0A65 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 0A68 _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 0A6B _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 0A6E _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 0A71 _ 8B. 55, 10
        mov     dword [eax], edx                        ; 0A74 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 0A76 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 0A79 _ 8B. 55, 0C
        mov     dword [eax+10H], edx                    ; 0A7C _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 0A7F _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 0A82 _ C7. 40, 14, 00000000
        mov     eax, dword [ebp+8H]                     ; 0A89 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 0A8C _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 0A93 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 0A96 _ C7. 40, 08, 00000000
        nop                                             ; 0A9D _ 90
        pop     ebp                                     ; 0A9E _ 5D
        ret                                             ; 0A9F _ C3
; fifo8_init End of function

fifo8_put:; Function begin
        push    ebp                                     ; 0AA0 _ 55
        mov     ebp, esp                                ; 0AA1 _ 89. E5
        sub     esp, 4                                  ; 0AA3 _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 0AA6 _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 0AA9 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0AAC _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0AAF _ 8B. 40, 10
        test    eax, eax                                ; 0AB2 _ 85. C0
        jnz     ?_041                                   ; 0AB4 _ 75, 18
        mov     eax, dword [ebp+8H]                     ; 0AB6 _ 8B. 45, 08
        mov     eax, dword [eax+14H]                    ; 0AB9 _ 8B. 40, 14
        or      eax, 01H                                ; 0ABC _ 83. C8, 01
        mov     edx, eax                                ; 0ABF _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0AC1 _ 8B. 45, 08
        mov     dword [eax+14H], edx                    ; 0AC4 _ 89. 50, 14
        mov     eax, 4294967295                         ; 0AC7 _ B8, FFFFFFFF
        jmp     ?_043                                   ; 0ACC _ EB, 50

?_041:  mov     eax, dword [ebp+8H]                     ; 0ACE _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 0AD1 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 0AD3 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0AD6 _ 8B. 40, 04
        add     edx, eax                                ; 0AD9 _ 01. C2
        movzx   eax, byte [ebp-4H]                      ; 0ADB _ 0F B6. 45, FC
        mov     byte [edx], al                          ; 0ADF _ 88. 02
        mov     eax, dword [ebp+8H]                     ; 0AE1 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0AE4 _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 0AE7 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0AEA _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 0AED _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0AF0 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 0AF3 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0AF6 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0AF9 _ 8B. 40, 0C
        cmp     edx, eax                                ; 0AFC _ 39. C2
        jnz     ?_042                                   ; 0AFE _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 0B00 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 0B03 _ C7. 40, 04, 00000000
?_042:  mov     eax, dword [ebp+8H]                     ; 0B0A _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0B0D _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 0B10 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 0B13 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 0B16 _ 89. 50, 10
        mov     eax, 0                                  ; 0B19 _ B8, 00000000
?_043:  leave                                           ; 0B1E _ C9
        ret                                             ; 0B1F _ C3
; fifo8_put End of function

fifo8_get:; Function begin
        push    ebp                                     ; 0B20 _ 55
        mov     ebp, esp                                ; 0B21 _ 89. E5
        sub     esp, 16                                 ; 0B23 _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 0B26 _ 8B. 45, 08
        mov     edx, dword [eax+10H]                    ; 0B29 _ 8B. 50, 10
        mov     eax, dword [ebp+8H]                     ; 0B2C _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0B2F _ 8B. 40, 0C
        cmp     edx, eax                                ; 0B32 _ 39. C2
        jnz     ?_044                                   ; 0B34 _ 75, 07
        mov     eax, 4294967295                         ; 0B36 _ B8, FFFFFFFF
        jmp     ?_046                                   ; 0B3B _ EB, 51

?_044:  mov     eax, dword [ebp+8H]                     ; 0B3D _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 0B40 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 0B42 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0B45 _ 8B. 40, 08
        add     eax, edx                                ; 0B48 _ 01. D0
        movzx   eax, byte [eax]                         ; 0B4A _ 0F B6. 00
        movzx   eax, al                                 ; 0B4D _ 0F B6. C0
        mov     dword [ebp-4H], eax                     ; 0B50 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0B53 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0B56 _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 0B59 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0B5C _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0B5F _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 0B62 _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 0B65 _ 8B. 50, 08
        mov     eax, dword [ebp+8H]                     ; 0B68 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0B6B _ 8B. 40, 0C
        cmp     edx, eax                                ; 0B6E _ 39. C2
        jnz     ?_045                                   ; 0B70 _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 0B72 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 0B75 _ C7. 40, 08, 00000000
?_045:  mov     eax, dword [ebp+8H]                     ; 0B7C _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0B7F _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 0B82 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0B85 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 0B88 _ 89. 50, 10
        mov     eax, dword [ebp-4H]                     ; 0B8B _ 8B. 45, FC
?_046:  leave                                           ; 0B8E _ C9
        ret                                             ; 0B8F _ C3
; fifo8_get End of function

fifo8_status:; Function begin
        push    ebp                                     ; 0B90 _ 55
        mov     ebp, esp                                ; 0B91 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 0B93 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 0B96 _ 8B. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 0B99 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0B9C _ 8B. 40, 10
        sub     edx, eax                                ; 0B9F _ 29. C2
        mov     eax, edx                                ; 0BA1 _ 89. D0
        pop     ebp                                     ; 0BA3 _ 5D
        ret                                             ; 0BA4 _ C3
; fifo8_status End of function

mouse_decode:; Function begin
        push    ebp                                     ; 0BA5 _ 55
        mov     ebp, esp                                ; 0BA6 _ 89. E5
        sub     esp, 4                                  ; 0BA8 _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 0BAB _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 0BAE _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0BB1 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 0BB4 _ 0F B6. 40, 03
        test    al, al                                  ; 0BB8 _ 84. C0
        jnz     ?_048                                   ; 0BBA _ 75, 17
        cmp     byte [ebp-4H], -6                       ; 0BBC _ 80. 7D, FC, FA
        jnz     ?_047                                   ; 0BC0 _ 75, 07
        mov     eax, dword [ebp+8H]                     ; 0BC2 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 0BC5 _ C6. 40, 03, 01
?_047:  mov     eax, 0                                  ; 0BC9 _ B8, 00000000
        jmp     ?_055                                   ; 0BCE _ E9, 0000010F

?_048:  mov     eax, dword [ebp+8H]                     ; 0BD3 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 0BD6 _ 0F B6. 40, 03
        cmp     al, 1                                   ; 0BDA _ 3C, 01
        jnz     ?_050                                   ; 0BDC _ 75, 28
        movzx   eax, byte [ebp-4H]                      ; 0BDE _ 0F B6. 45, FC
        and     eax, 0C8H                               ; 0BE2 _ 25, 000000C8
        cmp     eax, 8                                  ; 0BE7 _ 83. F8, 08
        jnz     ?_049                                   ; 0BEA _ 75, 10
        mov     eax, dword [ebp+8H]                     ; 0BEC _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 0BEF _ 0F B6. 55, FC
        mov     byte [eax], dl                          ; 0BF3 _ 88. 10
        mov     eax, dword [ebp+8H]                     ; 0BF5 _ 8B. 45, 08
        mov     byte [eax+3H], 2                        ; 0BF8 _ C6. 40, 03, 02
?_049:  mov     eax, 0                                  ; 0BFC _ B8, 00000000
        jmp     ?_055                                   ; 0C01 _ E9, 000000DC

?_050:  mov     eax, dword [ebp+8H]                     ; 0C06 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 0C09 _ 0F B6. 40, 03
        cmp     al, 2                                   ; 0C0D _ 3C, 02
        jnz     ?_051                                   ; 0C0F _ 75, 1B
        mov     eax, dword [ebp+8H]                     ; 0C11 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 0C14 _ 0F B6. 55, FC
        mov     byte [eax+1H], dl                       ; 0C18 _ 88. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0C1B _ 8B. 45, 08
        mov     byte [eax+3H], 3                        ; 0C1E _ C6. 40, 03, 03
        mov     eax, 0                                  ; 0C22 _ B8, 00000000
        jmp     ?_055                                   ; 0C27 _ E9, 000000B6

?_051:  mov     eax, dword [ebp+8H]                     ; 0C2C _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 0C2F _ 0F B6. 40, 03
        cmp     al, 3                                   ; 0C33 _ 3C, 03
        jne     ?_054                                   ; 0C35 _ 0F 85, 000000A2
        mov     eax, dword [ebp+8H]                     ; 0C3B _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 0C3E _ 0F B6. 55, FC
        mov     byte [eax+2H], dl                       ; 0C42 _ 88. 50, 02
        mov     eax, dword [ebp+8H]                     ; 0C45 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 0C48 _ C6. 40, 03, 01
        mov     eax, dword [ebp+8H]                     ; 0C4C _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 0C4F _ 0F B6. 00
        movzx   eax, al                                 ; 0C52 _ 0F B6. C0
        and     eax, 07H                                ; 0C55 _ 83. E0, 07
        mov     edx, eax                                ; 0C58 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0C5A _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 0C5D _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 0C60 _ 8B. 45, 08
        movzx   eax, byte [eax+1H]                      ; 0C63 _ 0F B6. 40, 01
        movzx   edx, al                                 ; 0C67 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 0C6A _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 0C6D _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0C70 _ 8B. 45, 08
        movzx   eax, byte [eax+2H]                      ; 0C73 _ 0F B6. 40, 02
        movzx   edx, al                                 ; 0C77 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 0C7A _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0C7D _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 0C80 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 0C83 _ 0F B6. 00
        movzx   eax, al                                 ; 0C86 _ 0F B6. C0
        and     eax, 10H                                ; 0C89 _ 83. E0, 10
        test    eax, eax                                ; 0C8C _ 85. C0
        jz      ?_052                                   ; 0C8E _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 0C90 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0C93 _ 8B. 40, 04
        or      eax, 0FFFFFF00H                         ; 0C96 _ 0D, FFFFFF00
        mov     edx, eax                                ; 0C9B _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0C9D _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 0CA0 _ 89. 50, 04
?_052:  mov     eax, dword [ebp+8H]                     ; 0CA3 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 0CA6 _ 0F B6. 00
        movzx   eax, al                                 ; 0CA9 _ 0F B6. C0
        and     eax, 20H                                ; 0CAC _ 83. E0, 20
        test    eax, eax                                ; 0CAF _ 85. C0
        jz      ?_053                                   ; 0CB1 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 0CB3 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0CB6 _ 8B. 40, 08
        or      eax, 0FFFFFF00H                         ; 0CB9 _ 0D, FFFFFF00
        mov     edx, eax                                ; 0CBE _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0CC0 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0CC3 _ 89. 50, 08
?_053:  mov     eax, dword [ebp+8H]                     ; 0CC6 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0CC9 _ 8B. 40, 08
        neg     eax                                     ; 0CCC _ F7. D8
        mov     edx, eax                                ; 0CCE _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0CD0 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0CD3 _ 89. 50, 08
        mov     eax, 1                                  ; 0CD6 _ B8, 00000001
        jmp     ?_055                                   ; 0CDB _ EB, 05

?_054:  mov     eax, 4294967295                         ; 0CDD _ B8, FFFFFFFF
?_055:  leave                                           ; 0CE2 _ C9
        ret                                             ; 0CE3 _ C3
; mouse_decode End of function

computeMousePosition:; Function begin
        push    ebp                                     ; 0CE4 _ 55
        mov     ebp, esp                                ; 0CE5 _ 89. E5
        sub     esp, 24                                 ; 0CE7 _ 83. EC, 18
        movzx   eax, word [?_136]                       ; 0CEA _ 0F B7. 05, 00000004(d)
        cwde                                            ; 0CF1 _ 98
        mov     dword [ebp-14H], eax                    ; 0CF2 _ 89. 45, EC
        movzx   eax, word [?_137]                       ; 0CF5 _ 0F B7. 05, 00000006(d)
        cwde                                            ; 0CFC _ 98
        mov     dword [ebp-10H], eax                    ; 0CFD _ 89. 45, F0
        mov     eax, dword [ebp+10H]                    ; 0D00 _ 8B. 45, 10
        mov     dword [eax+4H], 16                      ; 0D03 _ C7. 40, 04, 00000010
        mov     eax, dword [ebp+10H]                    ; 0D0A _ 8B. 45, 10
        mov     dword [eax+8H], 16                      ; 0D0D _ C7. 40, 08, 00000010
        mov     eax, dword [ebp+14H]                    ; 0D14 _ 8B. 45, 14
        mov     edx, dword [eax+4H]                     ; 0D17 _ 8B. 50, 04
        mov     eax, dword [mx]                         ; 0D1A _ A1, 000000F0(d)
        add     eax, edx                                ; 0D1F _ 01. D0
        mov     dword [mx], eax                         ; 0D21 _ A3, 000000F0(d)
        mov     eax, dword [ebp+14H]                    ; 0D26 _ 8B. 45, 14
        mov     edx, dword [eax+8H]                     ; 0D29 _ 8B. 50, 08
        mov     eax, dword [my]                         ; 0D2C _ A1, 000000F4(d)
        add     eax, edx                                ; 0D31 _ 01. D0
        mov     dword [my], eax                         ; 0D33 _ A3, 000000F4(d)
        mov     eax, dword [mx]                         ; 0D38 _ A1, 000000F0(d)
        test    eax, eax                                ; 0D3D _ 85. C0
        jns     ?_056                                   ; 0D3F _ 79, 0A
        mov     dword [mx], 0                           ; 0D41 _ C7. 05, 000000F0(d), 00000000
?_056:  mov     eax, dword [my]                         ; 0D4B _ A1, 000000F4(d)
        test    eax, eax                                ; 0D50 _ 85. C0
        jns     ?_057                                   ; 0D52 _ 79, 0A
        mov     dword [my], 0                           ; 0D54 _ C7. 05, 000000F4(d), 00000000
?_057:  mov     eax, dword [ebp-10H]                    ; 0D5E _ 8B. 45, F0
        lea     edx, [eax-10H]                          ; 0D61 _ 8D. 50, F0
        mov     eax, dword [my]                         ; 0D64 _ A1, 000000F4(d)
        cmp     edx, eax                                ; 0D69 _ 39. C2
        jge     ?_058                                   ; 0D6B _ 7D, 10
        mov     eax, dword [my]                         ; 0D6D _ A1, 000000F4(d)
        mov     edx, dword [ebp-10H]                    ; 0D72 _ 8B. 55, F0
        sub     edx, eax                                ; 0D75 _ 29. C2
        mov     eax, dword [ebp+10H]                    ; 0D77 _ 8B. 45, 10
        mov     dword [eax+8H], edx                     ; 0D7A _ 89. 50, 08
?_058:  mov     dword [ebp-0CH], 1                      ; 0D7D _ C7. 45, F4, 00000001
        mov     eax, dword [ebp-14H]                    ; 0D84 _ 8B. 45, EC
        sub     eax, dword [ebp-0CH]                    ; 0D87 _ 2B. 45, F4
        mov     edx, eax                                ; 0D8A _ 89. C2
        mov     eax, dword [mx]                         ; 0D8C _ A1, 000000F0(d)
        cmp     edx, eax                                ; 0D91 _ 39. C2
        jge     ?_059                                   ; 0D93 _ 7D, 14
        mov     eax, dword [ebp-14H]                    ; 0D95 _ 8B. 45, EC
        sub     eax, dword [ebp-0CH]                    ; 0D98 _ 2B. 45, F4
        mov     dword [mx], eax                         ; 0D9B _ A3, 000000F0(d)
        mov     eax, dword [ebp+10H]                    ; 0DA0 _ 8B. 45, 10
        mov     edx, dword [ebp-0CH]                    ; 0DA3 _ 8B. 55, F4
        mov     dword [eax+4H], edx                     ; 0DA6 _ 89. 50, 04
?_059:  mov     eax, dword [ebp-10H]                    ; 0DA9 _ 8B. 45, F0
        sub     eax, dword [ebp-0CH]                    ; 0DAC _ 2B. 45, F4
        mov     edx, eax                                ; 0DAF _ 89. C2
        mov     eax, dword [my]                         ; 0DB1 _ A1, 000000F4(d)
        cmp     edx, eax                                ; 0DB6 _ 39. C2
        jge     ?_060                                   ; 0DB8 _ 7D, 14
        mov     eax, dword [ebp-10H]                    ; 0DBA _ 8B. 45, F0
        sub     eax, dword [ebp-0CH]                    ; 0DBD _ 2B. 45, F4
        mov     dword [my], eax                         ; 0DC0 _ A3, 000000F4(d)
        mov     eax, dword [ebp+10H]                    ; 0DC5 _ 8B. 45, 10
        mov     edx, dword [ebp-0CH]                    ; 0DC8 _ 8B. 55, F4
        mov     dword [eax+8H], edx                     ; 0DCB _ 89. 50, 08
?_060:  sub     esp, 8                                  ; 0DCE _ 83. EC, 08
        push    ?_125                                   ; 0DD1 _ 68, 00000009(d)
        push    7                                       ; 0DD6 _ 6A, 07
        push    0                                       ; 0DD8 _ 6A, 00
        push    0                                       ; 0DDA _ 6A, 00
        push    dword [ebp+0CH]                         ; 0DDC _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0DDF _ FF. 75, 08
        call    showString                              ; 0DE2 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0DE7 _ 83. C4, 20
        nop                                             ; 0DEA _ 90
        leave                                           ; 0DEB _ C9
        ret                                             ; 0DEC _ C3
; computeMousePosition End of function

show_mouse_info:; Function begin
        push    ebp                                     ; 0DED _ 55
        mov     ebp, esp                                ; 0DEE _ 89. E5
        sub     esp, 24                                 ; 0DF0 _ 83. EC, 18
        mov     eax, dword [buf_back]                   ; 0DF3 _ A1, 000000F8(d)
        mov     dword [ebp-0CH], eax                    ; 0DF8 _ 89. 45, F4
        mov     byte [ebp-0DH], 0                       ; 0DFB _ C6. 45, F3, 00
        push    mouseinfo                               ; 0DFF _ 68, 00000008(d)
        call    fifo8_get                               ; 0E04 _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 0E09 _ 83. C4, 04
        mov     byte [ebp-0DH], al                      ; 0E0C _ 88. 45, F3
        movzx   eax, byte [ebp-0DH]                     ; 0E0F _ 0F B6. 45, F3
        push    eax                                     ; 0E13 _ 50
        push    mdec                                    ; 0E14 _ 68, 000000E0(d)
        call    mouse_decode                            ; 0E19 _ E8, FFFFFFFC(rel)
        add     esp, 8                                  ; 0E1E _ 83. C4, 08
        cmp     eax, 1                                  ; 0E21 _ 83. F8, 01
        jnz     ?_061                                   ; 0E24 _ 75, 31
        push    mdec                                    ; 0E26 _ 68, 000000E0(d)
        push    dword [ebp+10H]                         ; 0E2B _ FF. 75, 10
        push    dword [ebp+0CH]                         ; 0E2E _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0E31 _ FF. 75, 08
        call    computeMousePosition                    ; 0E34 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0E39 _ 83. C4, 10
        mov     edx, dword [my]                         ; 0E3C _ 8B. 15, 000000F4(d)
        mov     eax, dword [mx]                         ; 0E42 _ A1, 000000F0(d)
        push    edx                                     ; 0E47 _ 52
        push    eax                                     ; 0E48 _ 50
        push    dword [ebp+10H]                         ; 0E49 _ FF. 75, 10
        push    dword [ebp+8H]                          ; 0E4C _ FF. 75, 08
        call    sheet_slide_mouse                       ; 0E4F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0E54 _ 83. C4, 10
?_061:  nop                                             ; 0E57 _ 90
        leave                                           ; 0E58 _ C9
        ret                                             ; 0E59 _ C3
; show_mouse_info End of function

showMemoryInfo:; Function begin
        push    ebp                                     ; 0E5A _ 55
        mov     ebp, esp                                ; 0E5B _ 89. E5
        sub     esp, 56                                 ; 0E5D _ 83. EC, 38
        mov     dword [ebp-30H], 0                      ; 0E60 _ C7. 45, D0, 00000000
        mov     dword [ebp-2CH], 0                      ; 0E67 _ C7. 45, D4, 00000000
        mov     dword [ebp-28H], 104                    ; 0E6E _ C7. 45, D8, 00000068
        mov     dword [ebp-24H], 80                     ; 0E75 _ C7. 45, DC, 00000050
        mov     edx, dword [ysize]                      ; 0E7C _ 8B. 15, 00000204(d)
        mov     eax, dword [ebp+0CH]                    ; 0E82 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 0E85 _ 8B. 00
        sub     esp, 4                                  ; 0E87 _ 83. EC, 04
        push    edx                                     ; 0E8A _ 52
        push    dword [ebp+1CH]                         ; 0E8B _ FF. 75, 1C
        push    eax                                     ; 0E8E _ 50
        call    init_screen8                            ; 0E8F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0E94 _ 83. C4, 10
        mov     eax, dword [ebp+20H]                    ; 0E97 _ 8B. 45, 20
        movsx   eax, al                                 ; 0E9A _ 0F BE. C0
        sub     esp, 8                                  ; 0E9D _ 83. EC, 08
        push    ?_126                                   ; 0EA0 _ 68, 00000021(d)
        push    eax                                     ; 0EA5 _ 50
        push    dword [ebp-2CH]                         ; 0EA6 _ FF. 75, D4
        push    dword [ebp-30H]                         ; 0EA9 _ FF. 75, D0
        push    dword [ebp+0CH]                         ; 0EAC _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0EAF _ FF. 75, 08
        call    showString                              ; 0EB2 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0EB7 _ 83. C4, 20
        mov     eax, dword [ebp+18H]                    ; 0EBA _ 8B. 45, 18
        sub     esp, 12                                 ; 0EBD _ 83. EC, 0C
        push    eax                                     ; 0EC0 _ 50
        call    intToHexStr                             ; 0EC1 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0EC6 _ 83. C4, 10
        mov     dword [ebp-20H], eax                    ; 0EC9 _ 89. 45, E0
        mov     eax, dword [ebp+20H]                    ; 0ECC _ 8B. 45, 20
        movsx   eax, al                                 ; 0ECF _ 0F BE. C0
        sub     esp, 8                                  ; 0ED2 _ 83. EC, 08
        push    dword [ebp-20H]                         ; 0ED5 _ FF. 75, E0
        push    eax                                     ; 0ED8 _ 50
        push    dword [ebp-2CH]                         ; 0ED9 _ FF. 75, D4
        push    dword [ebp-28H]                         ; 0EDC _ FF. 75, D8
        push    dword [ebp+0CH]                         ; 0EDF _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0EE2 _ FF. 75, 08
        call    showString                              ; 0EE5 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0EEA _ 83. C4, 20
        add     dword [ebp-2CH], 16                     ; 0EED _ 83. 45, D4, 10
        mov     eax, dword [ebp+20H]                    ; 0EF1 _ 8B. 45, 20
        movsx   eax, al                                 ; 0EF4 _ 0F BE. C0
        sub     esp, 8                                  ; 0EF7 _ 83. EC, 08
        push    ?_127                                   ; 0EFA _ 68, 0000002B(d)
        push    eax                                     ; 0EFF _ 50
        push    dword [ebp-2CH]                         ; 0F00 _ FF. 75, D4
        push    dword [ebp-30H]                         ; 0F03 _ FF. 75, D0
        push    dword [ebp+0CH]                         ; 0F06 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0F09 _ FF. 75, 08
        call    showString                              ; 0F0C _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0F11 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0F14 _ 8B. 45, 10
        mov     eax, dword [eax]                        ; 0F17 _ 8B. 00
        sub     esp, 12                                 ; 0F19 _ 83. EC, 0C
        push    eax                                     ; 0F1C _ 50
        call    intToHexStr                             ; 0F1D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0F22 _ 83. C4, 10
        mov     dword [ebp-1CH], eax                    ; 0F25 _ 89. 45, E4
        mov     eax, dword [ebp+20H]                    ; 0F28 _ 8B. 45, 20
        movsx   eax, al                                 ; 0F2B _ 0F BE. C0
        sub     esp, 8                                  ; 0F2E _ 83. EC, 08
        push    dword [ebp-1CH]                         ; 0F31 _ FF. 75, E4
        push    eax                                     ; 0F34 _ 50
        push    dword [ebp-2CH]                         ; 0F35 _ FF. 75, D4
        push    dword [ebp-28H]                         ; 0F38 _ FF. 75, D8
        push    dword [ebp+0CH]                         ; 0F3B _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0F3E _ FF. 75, 08
        call    showString                              ; 0F41 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0F46 _ 83. C4, 20
        add     dword [ebp-2CH], 16                     ; 0F49 _ 83. 45, D4, 10
        mov     eax, dword [ebp+20H]                    ; 0F4D _ 8B. 45, 20
        movsx   eax, al                                 ; 0F50 _ 0F BE. C0
        sub     esp, 8                                  ; 0F53 _ 83. EC, 08
        push    ?_128                                   ; 0F56 _ 68, 00000037(d)
        push    eax                                     ; 0F5B _ 50
        push    dword [ebp-2CH]                         ; 0F5C _ FF. 75, D4
        push    dword [ebp-30H]                         ; 0F5F _ FF. 75, D0
        push    dword [ebp+0CH]                         ; 0F62 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0F65 _ FF. 75, 08
        call    showString                              ; 0F68 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0F6D _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0F70 _ 8B. 45, 10
        mov     eax, dword [eax+4H]                     ; 0F73 _ 8B. 40, 04
        sub     esp, 12                                 ; 0F76 _ 83. EC, 0C
        push    eax                                     ; 0F79 _ 50
        call    intToHexStr                             ; 0F7A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0F7F _ 83. C4, 10
        mov     dword [ebp-18H], eax                    ; 0F82 _ 89. 45, E8
        mov     eax, dword [ebp+20H]                    ; 0F85 _ 8B. 45, 20
        movsx   eax, al                                 ; 0F88 _ 0F BE. C0
        sub     esp, 8                                  ; 0F8B _ 83. EC, 08
        push    dword [ebp-18H]                         ; 0F8E _ FF. 75, E8
        push    eax                                     ; 0F91 _ 50
        push    dword [ebp-2CH]                         ; 0F92 _ FF. 75, D4
        push    dword [ebp-28H]                         ; 0F95 _ FF. 75, D8
        push    dword [ebp+0CH]                         ; 0F98 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0F9B _ FF. 75, 08
        call    showString                              ; 0F9E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0FA3 _ 83. C4, 20
        add     dword [ebp-2CH], 16                     ; 0FA6 _ 83. 45, D4, 10
        mov     eax, dword [ebp+20H]                    ; 0FAA _ 8B. 45, 20
        movsx   eax, al                                 ; 0FAD _ 0F BE. C0
        sub     esp, 8                                  ; 0FB0 _ 83. EC, 08
        push    ?_129                                   ; 0FB3 _ 68, 00000043(d)
        push    eax                                     ; 0FB8 _ 50
        push    dword [ebp-2CH]                         ; 0FB9 _ FF. 75, D4
        push    dword [ebp-30H]                         ; 0FBC _ FF. 75, D0
        push    dword [ebp+0CH]                         ; 0FBF _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0FC2 _ FF. 75, 08
        call    showString                              ; 0FC5 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0FCA _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0FCD _ 8B. 45, 10
        mov     eax, dword [eax+8H]                     ; 0FD0 _ 8B. 40, 08
        sub     esp, 12                                 ; 0FD3 _ 83. EC, 0C
        push    eax                                     ; 0FD6 _ 50
        call    intToHexStr                             ; 0FD7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0FDC _ 83. C4, 10
        mov     dword [ebp-14H], eax                    ; 0FDF _ 89. 45, EC
        mov     eax, dword [ebp+20H]                    ; 0FE2 _ 8B. 45, 20
        movsx   eax, al                                 ; 0FE5 _ 0F BE. C0
        sub     esp, 8                                  ; 0FE8 _ 83. EC, 08
        push    dword [ebp-14H]                         ; 0FEB _ FF. 75, EC
        push    eax                                     ; 0FEE _ 50
        push    dword [ebp-2CH]                         ; 0FEF _ FF. 75, D4
        push    dword [ebp-28H]                         ; 0FF2 _ FF. 75, D8
        push    dword [ebp+0CH]                         ; 0FF5 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0FF8 _ FF. 75, 08
        call    showString                              ; 0FFB _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1000 _ 83. C4, 20
        add     dword [ebp-2CH], 16                     ; 1003 _ 83. 45, D4, 10
        mov     eax, dword [ebp+20H]                    ; 1007 _ 8B. 45, 20
        movsx   eax, al                                 ; 100A _ 0F BE. C0
        sub     esp, 8                                  ; 100D _ 83. EC, 08
        push    ?_130                                   ; 1010 _ 68, 0000004F(d)
        push    eax                                     ; 1015 _ 50
        push    dword [ebp-2CH]                         ; 1016 _ FF. 75, D4
        push    dword [ebp-30H]                         ; 1019 _ FF. 75, D0
        push    dword [ebp+0CH]                         ; 101C _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 101F _ FF. 75, 08
        call    showString                              ; 1022 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1027 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 102A _ 8B. 45, 10
        mov     eax, dword [eax+0CH]                    ; 102D _ 8B. 40, 0C
        sub     esp, 12                                 ; 1030 _ 83. EC, 0C
        push    eax                                     ; 1033 _ 50
        call    intToHexStr                             ; 1034 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1039 _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 103C _ 89. 45, F0
        mov     eax, dword [ebp+20H]                    ; 103F _ 8B. 45, 20
        movsx   eax, al                                 ; 1042 _ 0F BE. C0
        sub     esp, 8                                  ; 1045 _ 83. EC, 08
        push    dword [ebp-10H]                         ; 1048 _ FF. 75, F0
        push    eax                                     ; 104B _ 50
        push    dword [ebp-2CH]                         ; 104C _ FF. 75, D4
        push    dword [ebp-28H]                         ; 104F _ FF. 75, D8
        push    dword [ebp+0CH]                         ; 1052 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1055 _ FF. 75, 08
        call    showString                              ; 1058 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 105D _ 83. C4, 20
        add     dword [ebp-2CH], 16                     ; 1060 _ 83. 45, D4, 10
        mov     eax, dword [ebp+20H]                    ; 1064 _ 8B. 45, 20
        movsx   eax, al                                 ; 1067 _ 0F BE. C0
        sub     esp, 8                                  ; 106A _ 83. EC, 08
        push    ?_131                                   ; 106D _ 68, 0000005C(d)
        push    eax                                     ; 1072 _ 50
        push    dword [ebp-2CH]                         ; 1073 _ FF. 75, D4
        push    dword [ebp-30H]                         ; 1076 _ FF. 75, D0
        push    dword [ebp+0CH]                         ; 1079 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 107C _ FF. 75, 08
        call    showString                              ; 107F _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1084 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 1087 _ 8B. 45, 10
        mov     eax, dword [eax+10H]                    ; 108A _ 8B. 40, 10
        sub     esp, 12                                 ; 108D _ 83. EC, 0C
        push    eax                                     ; 1090 _ 50
        call    intToHexStr                             ; 1091 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1096 _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 1099 _ 89. 45, F4
        mov     eax, dword [ebp+20H]                    ; 109C _ 8B. 45, 20
        movsx   eax, al                                 ; 109F _ 0F BE. C0
        sub     esp, 8                                  ; 10A2 _ 83. EC, 08
        push    dword [ebp-0CH]                         ; 10A5 _ FF. 75, F4
        push    eax                                     ; 10A8 _ 50
        push    dword [ebp-2CH]                         ; 10A9 _ FF. 75, D4
        push    dword [ebp-28H]                         ; 10AC _ FF. 75, D8
        push    dword [ebp+0CH]                         ; 10AF _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 10B2 _ FF. 75, 08
        call    showString                              ; 10B5 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 10BA _ 83. C4, 20
        nop                                             ; 10BD _ 90
        leave                                           ; 10BE _ C9
        ret                                             ; 10BF _ C3
; showMemoryInfo End of function

init_screen8:; Function begin
        push    ebp                                     ; 10C0 _ 55
        mov     ebp, esp                                ; 10C1 _ 89. E5
        push    ebx                                     ; 10C3 _ 53
        mov     eax, dword [ebp+10H]                    ; 10C4 _ 8B. 45, 10
        lea     edx, [eax-1DH]                          ; 10C7 _ 8D. 50, E3
        mov     eax, dword [ebp+0CH]                    ; 10CA _ 8B. 45, 0C
        sub     eax, 1                                  ; 10CD _ 83. E8, 01
        push    edx                                     ; 10D0 _ 52
        push    eax                                     ; 10D1 _ 50
        push    0                                       ; 10D2 _ 6A, 00
        push    0                                       ; 10D4 _ 6A, 00
        push    14                                      ; 10D6 _ 6A, 0E
        push    dword [ebp+0CH]                         ; 10D8 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 10DB _ FF. 75, 08
        call    boxfill8                                ; 10DE _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 10E3 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 10E6 _ 8B. 45, 10
        lea     ecx, [eax-1CH]                          ; 10E9 _ 8D. 48, E4
        mov     eax, dword [ebp+0CH]                    ; 10EC _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 10EF _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 10F2 _ 8B. 45, 10
        sub     eax, 28                                 ; 10F5 _ 83. E8, 1C
        push    ecx                                     ; 10F8 _ 51
        push    edx                                     ; 10F9 _ 52
        push    eax                                     ; 10FA _ 50
        push    0                                       ; 10FB _ 6A, 00
        push    8                                       ; 10FD _ 6A, 08
        push    dword [ebp+0CH]                         ; 10FF _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1102 _ FF. 75, 08
        call    boxfill8                                ; 1105 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 110A _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 110D _ 8B. 45, 10
        lea     ecx, [eax-1BH]                          ; 1110 _ 8D. 48, E5
        mov     eax, dword [ebp+0CH]                    ; 1113 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 1116 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 1119 _ 8B. 45, 10
        sub     eax, 27                                 ; 111C _ 83. E8, 1B
        push    ecx                                     ; 111F _ 51
        push    edx                                     ; 1120 _ 52
        push    eax                                     ; 1121 _ 50
        push    0                                       ; 1122 _ 6A, 00
        push    7                                       ; 1124 _ 6A, 07
        push    dword [ebp+0CH]                         ; 1126 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1129 _ FF. 75, 08
        call    boxfill8                                ; 112C _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1131 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 1134 _ 8B. 45, 10
        lea     ecx, [eax-1H]                           ; 1137 _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 113A _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 113D _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 1140 _ 8B. 45, 10
        sub     eax, 26                                 ; 1143 _ 83. E8, 1A
        push    ecx                                     ; 1146 _ 51
        push    edx                                     ; 1147 _ 52
        push    eax                                     ; 1148 _ 50
        push    0                                       ; 1149 _ 6A, 00
        push    8                                       ; 114B _ 6A, 08
        push    dword [ebp+0CH]                         ; 114D _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1150 _ FF. 75, 08
        call    boxfill8                                ; 1153 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1158 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 115B _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 115E _ 8D. 50, E8
        mov     eax, dword [ebp+10H]                    ; 1161 _ 8B. 45, 10
        sub     eax, 24                                 ; 1164 _ 83. E8, 18
        push    edx                                     ; 1167 _ 52
        push    59                                      ; 1168 _ 6A, 3B
        push    eax                                     ; 116A _ 50
        push    3                                       ; 116B _ 6A, 03
        push    7                                       ; 116D _ 6A, 07
        push    dword [ebp+0CH]                         ; 116F _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1172 _ FF. 75, 08
        call    boxfill8                                ; 1175 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 117A _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 117D _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 1180 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 1183 _ 8B. 45, 10
        sub     eax, 24                                 ; 1186 _ 83. E8, 18
        push    edx                                     ; 1189 _ 52
        push    2                                       ; 118A _ 6A, 02
        push    eax                                     ; 118C _ 50
        push    2                                       ; 118D _ 6A, 02
        push    7                                       ; 118F _ 6A, 07
        push    dword [ebp+0CH]                         ; 1191 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1194 _ FF. 75, 08
        call    boxfill8                                ; 1197 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 119C _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 119F _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 11A2 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 11A5 _ 8B. 45, 10
        sub     eax, 4                                  ; 11A8 _ 83. E8, 04
        push    edx                                     ; 11AB _ 52
        push    59                                      ; 11AC _ 6A, 3B
        push    eax                                     ; 11AE _ 50
        push    3                                       ; 11AF _ 6A, 03
        push    15                                      ; 11B1 _ 6A, 0F
        push    dword [ebp+0CH]                         ; 11B3 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 11B6 _ FF. 75, 08
        call    boxfill8                                ; 11B9 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 11BE _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 11C1 _ 8B. 45, 10
        lea     edx, [eax-5H]                           ; 11C4 _ 8D. 50, FB
        mov     eax, dword [ebp+10H]                    ; 11C7 _ 8B. 45, 10
        sub     eax, 23                                 ; 11CA _ 83. E8, 17
        push    edx                                     ; 11CD _ 52
        push    59                                      ; 11CE _ 6A, 3B
        push    eax                                     ; 11D0 _ 50
        push    59                                      ; 11D1 _ 6A, 3B
        push    15                                      ; 11D3 _ 6A, 0F
        push    dword [ebp+0CH]                         ; 11D5 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 11D8 _ FF. 75, 08
        call    boxfill8                                ; 11DB _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 11E0 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 11E3 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 11E6 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 11E9 _ 8B. 45, 10
        sub     eax, 3                                  ; 11EC _ 83. E8, 03
        push    edx                                     ; 11EF _ 52
        push    59                                      ; 11F0 _ 6A, 3B
        push    eax                                     ; 11F2 _ 50
        push    2                                       ; 11F3 _ 6A, 02
        push    0                                       ; 11F5 _ 6A, 00
        push    dword [ebp+0CH]                         ; 11F7 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 11FA _ FF. 75, 08
        call    boxfill8                                ; 11FD _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1202 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 1205 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 1208 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 120B _ 8B. 45, 10
        sub     eax, 24                                 ; 120E _ 83. E8, 18
        push    edx                                     ; 1211 _ 52
        push    60                                      ; 1212 _ 6A, 3C
        push    eax                                     ; 1214 _ 50
        push    60                                      ; 1215 _ 6A, 3C
        push    0                                       ; 1217 _ 6A, 00
        push    dword [ebp+0CH]                         ; 1219 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 121C _ FF. 75, 08
        call    boxfill8                                ; 121F _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1224 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 1227 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 122A _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 122D _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 1230 _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 1233 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 1236 _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 1239 _ 8B. 45, 0C
        sub     eax, 47                                 ; 123C _ 83. E8, 2F
        push    ebx                                     ; 123F _ 53
        push    ecx                                     ; 1240 _ 51
        push    edx                                     ; 1241 _ 52
        push    eax                                     ; 1242 _ 50
        push    7                                       ; 1243 _ 6A, 07
        push    dword [ebp+0CH]                         ; 1245 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1248 _ FF. 75, 08
        call    boxfill8                                ; 124B _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1250 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 1253 _ 8B. 45, 10
        lea     ebx, [eax-4H]                           ; 1256 _ 8D. 58, FC
        mov     eax, dword [ebp+0CH]                    ; 1259 _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 125C _ 8D. 48, FD
        mov     eax, dword [ebp+10H]                    ; 125F _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 1262 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 1265 _ 8B. 45, 0C
        sub     eax, 3                                  ; 1268 _ 83. E8, 03
        push    ebx                                     ; 126B _ 53
        push    ecx                                     ; 126C _ 51
        push    edx                                     ; 126D _ 52
        push    eax                                     ; 126E _ 50
        push    7                                       ; 126F _ 6A, 07
        push    dword [ebp+0CH]                         ; 1271 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1274 _ FF. 75, 08
        call    boxfill8                                ; 1277 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 127C _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 127F _ 8B. 45, 10
        lea     ebx, [eax-18H]                          ; 1282 _ 8D. 58, E8
        mov     eax, dword [ebp+0CH]                    ; 1285 _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 1288 _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 128B _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 128E _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 1291 _ 8B. 45, 0C
        sub     eax, 47                                 ; 1294 _ 83. E8, 2F
        push    ebx                                     ; 1297 _ 53
        push    ecx                                     ; 1298 _ 51
        push    edx                                     ; 1299 _ 52
        push    eax                                     ; 129A _ 50
        push    15                                      ; 129B _ 6A, 0F
        push    dword [ebp+0CH]                         ; 129D _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 12A0 _ FF. 75, 08
        call    boxfill8                                ; 12A3 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 12A8 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 12AB _ 8B. 45, 10
        lea     ebx, [eax-4H]                           ; 12AE _ 8D. 58, FC
        mov     eax, dword [ebp+0CH]                    ; 12B1 _ 8B. 45, 0C
        lea     ecx, [eax-2FH]                          ; 12B4 _ 8D. 48, D1
        mov     eax, dword [ebp+10H]                    ; 12B7 _ 8B. 45, 10
        lea     edx, [eax-17H]                          ; 12BA _ 8D. 50, E9
        mov     eax, dword [ebp+0CH]                    ; 12BD _ 8B. 45, 0C
        sub     eax, 47                                 ; 12C0 _ 83. E8, 2F
        push    ebx                                     ; 12C3 _ 53
        push    ecx                                     ; 12C4 _ 51
        push    edx                                     ; 12C5 _ 52
        push    eax                                     ; 12C6 _ 50
        push    15                                      ; 12C7 _ 6A, 0F
        push    dword [ebp+0CH]                         ; 12C9 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 12CC _ FF. 75, 08
        call    boxfill8                                ; 12CF _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 12D4 _ 83. C4, 1C
        nop                                             ; 12D7 _ 90
        mov     ebx, dword [ebp-4H]                     ; 12D8 _ 8B. 5D, FC
        leave                                           ; 12DB _ C9
        ret                                             ; 12DC _ C3
; init_screen8 End of function

make_window8:; Function begin
        push    ebp                                     ; 12DD _ 55
        mov     ebp, esp                                ; 12DE _ 89. E5
        push    ebx                                     ; 12E0 _ 53
        sub     esp, 36                                 ; 12E1 _ 83. EC, 24
        mov     eax, dword [ebp+0CH]                    ; 12E4 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 12E7 _ 8B. 40, 04
        mov     dword [ebp-10H], eax                    ; 12EA _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 12ED _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 12F0 _ 8B. 40, 08
        mov     dword [ebp-0CH], eax                    ; 12F3 _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 12F6 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 12F9 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 12FC _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 12FF _ 8B. 00
        push    0                                       ; 1301 _ 6A, 00
        push    edx                                     ; 1303 _ 52
        push    0                                       ; 1304 _ 6A, 00
        push    0                                       ; 1306 _ 6A, 00
        push    8                                       ; 1308 _ 6A, 08
        push    dword [ebp-10H]                         ; 130A _ FF. 75, F0
        push    eax                                     ; 130D _ 50
        call    boxfill8                                ; 130E _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1313 _ 83. C4, 1C
        mov     eax, dword [ebp-10H]                    ; 1316 _ 8B. 45, F0
        lea     edx, [eax-2H]                           ; 1319 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 131C _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 131F _ 8B. 00
        push    1                                       ; 1321 _ 6A, 01
        push    edx                                     ; 1323 _ 52
        push    1                                       ; 1324 _ 6A, 01
        push    1                                       ; 1326 _ 6A, 01
        push    7                                       ; 1328 _ 6A, 07
        push    dword [ebp-10H]                         ; 132A _ FF. 75, F0
        push    eax                                     ; 132D _ 50
        call    boxfill8                                ; 132E _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1333 _ 83. C4, 1C
        mov     eax, dword [ebp-0CH]                    ; 1336 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1339 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 133C _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 133F _ 8B. 00
        push    edx                                     ; 1341 _ 52
        push    0                                       ; 1342 _ 6A, 00
        push    0                                       ; 1344 _ 6A, 00
        push    0                                       ; 1346 _ 6A, 00
        push    8                                       ; 1348 _ 6A, 08
        push    dword [ebp-10H]                         ; 134A _ FF. 75, F0
        push    eax                                     ; 134D _ 50
        call    boxfill8                                ; 134E _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1353 _ 83. C4, 1C
        mov     eax, dword [ebp-0CH]                    ; 1356 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1359 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 135C _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 135F _ 8B. 00
        push    edx                                     ; 1361 _ 52
        push    1                                       ; 1362 _ 6A, 01
        push    1                                       ; 1364 _ 6A, 01
        push    1                                       ; 1366 _ 6A, 01
        push    8                                       ; 1368 _ 6A, 08
        push    dword [ebp-10H]                         ; 136A _ FF. 75, F0
        push    eax                                     ; 136D _ 50
        call    boxfill8                                ; 136E _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1373 _ 83. C4, 1C
        mov     eax, dword [ebp-0CH]                    ; 1376 _ 8B. 45, F4
        lea     ebx, [eax-2H]                           ; 1379 _ 8D. 58, FE
        mov     eax, dword [ebp-10H]                    ; 137C _ 8B. 45, F0
        lea     ecx, [eax-2H]                           ; 137F _ 8D. 48, FE
        mov     eax, dword [ebp-10H]                    ; 1382 _ 8B. 45, F0
        lea     edx, [eax-2H]                           ; 1385 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 1388 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 138B _ 8B. 00
        push    ebx                                     ; 138D _ 53
        push    ecx                                     ; 138E _ 51
        push    1                                       ; 138F _ 6A, 01
        push    edx                                     ; 1391 _ 52
        push    15                                      ; 1392 _ 6A, 0F
        push    dword [ebp-10H]                         ; 1394 _ FF. 75, F0
        push    eax                                     ; 1397 _ 50
        call    boxfill8                                ; 1398 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 139D _ 83. C4, 1C
        mov     eax, dword [ebp-0CH]                    ; 13A0 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 13A3 _ 8D. 58, FF
        mov     eax, dword [ebp-10H]                    ; 13A6 _ 8B. 45, F0
        lea     ecx, [eax-1H]                           ; 13A9 _ 8D. 48, FF
        mov     eax, dword [ebp-10H]                    ; 13AC _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 13AF _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 13B2 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 13B5 _ 8B. 00
        push    ebx                                     ; 13B7 _ 53
        push    ecx                                     ; 13B8 _ 51
        push    0                                       ; 13B9 _ 6A, 00
        push    edx                                     ; 13BB _ 52
        push    0                                       ; 13BC _ 6A, 00
        push    dword [ebp-10H]                         ; 13BE _ FF. 75, F0
        push    eax                                     ; 13C1 _ 50
        call    boxfill8                                ; 13C2 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 13C7 _ 83. C4, 1C
        mov     eax, dword [ebp-0CH]                    ; 13CA _ 8B. 45, F4
        lea     ecx, [eax-3H]                           ; 13CD _ 8D. 48, FD
        mov     eax, dword [ebp-10H]                    ; 13D0 _ 8B. 45, F0
        lea     edx, [eax-3H]                           ; 13D3 _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 13D6 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 13D9 _ 8B. 00
        push    ecx                                     ; 13DB _ 51
        push    edx                                     ; 13DC _ 52
        push    2                                       ; 13DD _ 6A, 02
        push    2                                       ; 13DF _ 6A, 02
        push    8                                       ; 13E1 _ 6A, 08
        push    dword [ebp-10H]                         ; 13E3 _ FF. 75, F0
        push    eax                                     ; 13E6 _ 50
        call    boxfill8                                ; 13E7 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 13EC _ 83. C4, 1C
        mov     eax, dword [ebp-10H]                    ; 13EF _ 8B. 45, F0
        lea     edx, [eax-4H]                           ; 13F2 _ 8D. 50, FC
        mov     eax, dword [ebp+0CH]                    ; 13F5 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 13F8 _ 8B. 00
        push    20                                      ; 13FA _ 6A, 14
        push    edx                                     ; 13FC _ 52
        push    3                                       ; 13FD _ 6A, 03
        push    3                                       ; 13FF _ 6A, 03
        push    12                                      ; 1401 _ 6A, 0C
        push    dword [ebp-10H]                         ; 1403 _ FF. 75, F0
        push    eax                                     ; 1406 _ 50
        call    boxfill8                                ; 1407 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 140C _ 83. C4, 1C
        mov     eax, dword [ebp-0CH]                    ; 140F _ 8B. 45, F4
        lea     ebx, [eax-2H]                           ; 1412 _ 8D. 58, FE
        mov     eax, dword [ebp-10H]                    ; 1415 _ 8B. 45, F0
        lea     ecx, [eax-2H]                           ; 1418 _ 8D. 48, FE
        mov     eax, dword [ebp-0CH]                    ; 141B _ 8B. 45, F4
        lea     edx, [eax-2H]                           ; 141E _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 1421 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1424 _ 8B. 00
        push    ebx                                     ; 1426 _ 53
        push    ecx                                     ; 1427 _ 51
        push    edx                                     ; 1428 _ 52
        push    1                                       ; 1429 _ 6A, 01
        push    15                                      ; 142B _ 6A, 0F
        push    dword [ebp-10H]                         ; 142D _ FF. 75, F0
        push    eax                                     ; 1430 _ 50
        call    boxfill8                                ; 1431 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1436 _ 83. C4, 1C
        mov     eax, dword [ebp-0CH]                    ; 1439 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 143C _ 8D. 58, FF
        mov     eax, dword [ebp-10H]                    ; 143F _ 8B. 45, F0
        lea     ecx, [eax-1H]                           ; 1442 _ 8D. 48, FF
        mov     eax, dword [ebp-0CH]                    ; 1445 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1448 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 144B _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 144E _ 8B. 00
        push    ebx                                     ; 1450 _ 53
        push    ecx                                     ; 1451 _ 51
        push    edx                                     ; 1452 _ 52
        push    0                                       ; 1453 _ 6A, 00
        push    0                                       ; 1455 _ 6A, 00
        push    dword [ebp-10H]                         ; 1457 _ FF. 75, F0
        push    eax                                     ; 145A _ 50
        call    boxfill8                                ; 145B _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1460 _ 83. C4, 1C
        sub     esp, 8                                  ; 1463 _ 83. EC, 08
        push    dword [ebp+10H]                         ; 1466 _ FF. 75, 10
        push    7                                       ; 1469 _ 6A, 07
        push    4                                       ; 146B _ 6A, 04
        push    24                                      ; 146D _ 6A, 18
        push    dword [ebp+0CH]                         ; 146F _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1472 _ FF. 75, 08
        call    showString                              ; 1475 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 147A _ 83. C4, 20
        mov     dword [ebp-14H], 0                      ; 147D _ C7. 45, EC, 00000000
        jmp     ?_069                                   ; 1484 _ E9, 00000083

?_062:  mov     dword [ebp-18H], 0                      ; 1489 _ C7. 45, E8, 00000000
        jmp     ?_068                                   ; 1490 _ EB, 70

?_063:  mov     eax, dword [ebp-14H]                    ; 1492 _ 8B. 45, EC
        shl     eax, 4                                  ; 1495 _ C1. E0, 04
        mov     edx, eax                                ; 1498 _ 89. C2
        mov     eax, dword [ebp-18H]                    ; 149A _ 8B. 45, E8
        add     eax, edx                                ; 149D _ 01. D0
        add     eax, closebtn.1865                      ; 149F _ 05, 00000160(d)
        movzx   eax, byte [eax]                         ; 14A4 _ 0F B6. 00
        mov     byte [ebp-19H], al                      ; 14A7 _ 88. 45, E7
        cmp     byte [ebp-19H], 64                      ; 14AA _ 80. 7D, E7, 40
        jnz     ?_064                                   ; 14AE _ 75, 06
        mov     byte [ebp-19H], 0                       ; 14B0 _ C6. 45, E7, 00
        jmp     ?_067                                   ; 14B4 _ EB, 1C

?_064:  cmp     byte [ebp-19H], 36                      ; 14B6 _ 80. 7D, E7, 24
        jnz     ?_065                                   ; 14BA _ 75, 06
        mov     byte [ebp-19H], 15                      ; 14BC _ C6. 45, E7, 0F
        jmp     ?_067                                   ; 14C0 _ EB, 10

?_065:  cmp     byte [ebp-19H], 81                      ; 14C2 _ 80. 7D, E7, 51
        jnz     ?_066                                   ; 14C6 _ 75, 06
        mov     byte [ebp-19H], 8                       ; 14C8 _ C6. 45, E7, 08
        jmp     ?_067                                   ; 14CC _ EB, 04

?_066:  mov     byte [ebp-19H], 7                       ; 14CE _ C6. 45, E7, 07
?_067:  mov     eax, dword [ebp+0CH]                    ; 14D2 _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 14D5 _ 8B. 10
        mov     eax, dword [ebp-14H]                    ; 14D7 _ 8B. 45, EC
        lea     ecx, [eax+5H]                           ; 14DA _ 8D. 48, 05
        mov     eax, dword [ebp+0CH]                    ; 14DD _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 14E0 _ 8B. 40, 04
        imul    ecx, eax                                ; 14E3 _ 0F AF. C8
        mov     eax, dword [ebp+0CH]                    ; 14E6 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 14E9 _ 8B. 40, 04
        lea     ebx, [eax-15H]                          ; 14EC _ 8D. 58, EB
        mov     eax, dword [ebp-18H]                    ; 14EF _ 8B. 45, E8
        add     eax, ebx                                ; 14F2 _ 01. D8
        add     eax, ecx                                ; 14F4 _ 01. C8
        add     edx, eax                                ; 14F6 _ 01. C2
        movzx   eax, byte [ebp-19H]                     ; 14F8 _ 0F B6. 45, E7
        mov     byte [edx], al                          ; 14FC _ 88. 02
        add     dword [ebp-18H], 1                      ; 14FE _ 83. 45, E8, 01
?_068:  cmp     dword [ebp-18H], 15                     ; 1502 _ 83. 7D, E8, 0F
        jle     ?_063                                   ; 1506 _ 7E, 8A
        add     dword [ebp-14H], 1                      ; 1508 _ 83. 45, EC, 01
?_069:  cmp     dword [ebp-14H], 13                     ; 150C _ 83. 7D, EC, 0D
        jle     ?_062                                   ; 1510 _ 0F 8E, FFFFFF73
        nop                                             ; 1516 _ 90
        mov     ebx, dword [ebp-4H]                     ; 1517 _ 8B. 5D, FC
        leave                                           ; 151A _ C9
        ret                                             ; 151B _ C3
; make_window8 End of function

message_box:; Function begin
        push    ebp                                     ; 151C _ 55
        mov     ebp, esp                                ; 151D _ 89. E5
        sub     esp, 24                                 ; 151F _ 83. EC, 18
        sub     esp, 12                                 ; 1522 _ 83. EC, 0C
        push    dword [ebp+8H]                          ; 1525 _ FF. 75, 08
        call    sheet_alloc                             ; 1528 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 152D _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 1530 _ 89. 45, F0
        mov     eax, dword [memman]                     ; 1533 _ A1, 00000000(d)
        sub     esp, 8                                  ; 1538 _ 83. EC, 08
        push    10880                                   ; 153B _ 68, 00002A80
        push    eax                                     ; 1540 _ 50
        call    memman_alloc_4k                         ; 1541 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1546 _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 1549 _ 89. 45, F4
        sub     esp, 12                                 ; 154C _ 83. EC, 0C
        push    -1                                      ; 154F _ 6A, FF
        push    68                                      ; 1551 _ 6A, 44
        push    160                                     ; 1553 _ 68, 000000A0
        push    dword [ebp-0CH]                         ; 1558 _ FF. 75, F4
        push    dword [ebp-10H]                         ; 155B _ FF. 75, F0
        call    sheet_setbuf                            ; 155E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1563 _ 83. C4, 20
        sub     esp, 4                                  ; 1566 _ 83. EC, 04
        push    dword [ebp+0CH]                         ; 1569 _ FF. 75, 0C
        push    dword [ebp-10H]                         ; 156C _ FF. 75, F0
        push    dword [ebp+8H]                          ; 156F _ FF. 75, 08
        call    make_window8                            ; 1572 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1577 _ 83. C4, 10
        sub     esp, 8                                  ; 157A _ 83. EC, 08
        push    ?_132                                   ; 157D _ 68, 00000063(d)
        push    0                                       ; 1582 _ 6A, 00
        push    28                                      ; 1584 _ 6A, 1C
        push    24                                      ; 1586 _ 6A, 18
        push    dword [ebp-10H]                         ; 1588 _ FF. 75, F0
        push    dword [ebp+8H]                          ; 158B _ FF. 75, 08
        call    showString                              ; 158E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1593 _ 83. C4, 20
        sub     esp, 8                                  ; 1596 _ 83. EC, 08
        push    ?_133                                   ; 1599 _ 68, 0000006F(d)
        push    0                                       ; 159E _ 6A, 00
        push    44                                      ; 15A0 _ 6A, 2C
        push    24                                      ; 15A2 _ 6A, 18
        push    dword [ebp-10H]                         ; 15A4 _ FF. 75, F0
        push    dword [ebp+8H]                          ; 15A7 _ FF. 75, 08
        call    showString                              ; 15AA _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 15AF _ 83. C4, 20
        push    72                                      ; 15B2 _ 6A, 48
        push    80                                      ; 15B4 _ 6A, 50
        push    dword [ebp-10H]                         ; 15B6 _ FF. 75, F0
        push    dword [ebp+8H]                          ; 15B9 _ FF. 75, 08
        call    sheet_slide                             ; 15BC _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 15C1 _ 83. C4, 10
        sub     esp, 4                                  ; 15C4 _ 83. EC, 04
        push    1                                       ; 15C7 _ 6A, 01
        push    dword [ebp-10H]                         ; 15C9 _ FF. 75, F0
        push    dword [ebp+8H]                          ; 15CC _ FF. 75, 08
        call    sheet_updown                            ; 15CF _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 15D4 _ 83. C4, 10
        mov     eax, dword [ebp-10H]                    ; 15D7 _ 8B. 45, F0
        leave                                           ; 15DA _ C9
        ret                                             ; 15DB _ C3
; message_box End of function

memman_init:; Function begin
        push    ebp                                     ; 15DC _ 55
        mov     ebp, esp                                ; 15DD _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 15DF _ 8B. 45, 08
        mov     dword [eax], 0                          ; 15E2 _ C7. 00, 00000000
        mov     eax, dword [ebp+8H]                     ; 15E8 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 15EB _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 15F2 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 15F5 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 15FC _ 8B. 45, 08
        mov     dword [eax+0CH], 0                      ; 15FF _ C7. 40, 0C, 00000000
        nop                                             ; 1606 _ 90
        pop     ebp                                     ; 1607 _ 5D
        ret                                             ; 1608 _ C3
; memman_init End of function

memman_total:; Function begin
        push    ebp                                     ; 1609 _ 55
        mov     ebp, esp                                ; 160A _ 89. E5
        sub     esp, 16                                 ; 160C _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 160F _ C7. 45, FC, 00000000
        mov     dword [ebp-8H], 0                       ; 1616 _ C7. 45, F8, 00000000
        jmp     ?_071                                   ; 161D _ EB, 14

?_070:  mov     eax, dword [ebp+8H]                     ; 161F _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1622 _ 8B. 55, F8
        add     edx, 2                                  ; 1625 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 1628 _ 8B. 44 D0, 04
        add     dword [ebp-4H], eax                     ; 162C _ 01. 45, FC
        add     dword [ebp-8H], 1                       ; 162F _ 83. 45, F8, 01
?_071:  mov     eax, dword [ebp+8H]                     ; 1633 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1636 _ 8B. 00
        cmp     dword [ebp-8H], eax                     ; 1638 _ 39. 45, F8
        jc      ?_070                                   ; 163B _ 72, E2
        mov     eax, dword [ebp-4H]                     ; 163D _ 8B. 45, FC
        leave                                           ; 1640 _ C9
        ret                                             ; 1641 _ C3
; memman_total End of function

memman_alloc:; Function begin
        push    ebp                                     ; 1642 _ 55
        mov     ebp, esp                                ; 1643 _ 89. E5
        sub     esp, 16                                 ; 1645 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 1648 _ C7. 45, F8, 00000000
        jmp     ?_075                                   ; 164F _ E9, 00000085

?_072:  mov     eax, dword [ebp+8H]                     ; 1654 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1657 _ 8B. 55, F8
        add     edx, 2                                  ; 165A _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 165D _ 8B. 44 D0, 04
        cmp     dword [ebp+0CH], eax                    ; 1661 _ 39. 45, 0C
        ja      ?_074                                   ; 1664 _ 77, 6F
        mov     eax, dword [ebp+8H]                     ; 1666 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1669 _ 8B. 55, F8
        add     edx, 2                                  ; 166C _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 166F _ 8B. 04 D0
        mov     dword [ebp-4H], eax                     ; 1672 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 1675 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1678 _ 8B. 55, F8
        add     edx, 2                                  ; 167B _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 167E _ 8B. 14 D0
        mov     eax, dword [ebp+0CH]                    ; 1681 _ 8B. 45, 0C
        lea     ecx, [edx+eax]                          ; 1684 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1687 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 168A _ 8B. 55, F8
        add     edx, 2                                  ; 168D _ 83. C2, 02
        mov     dword [eax+edx*8], ecx                  ; 1690 _ 89. 0C D0
        mov     eax, dword [ebp+8H]                     ; 1693 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1696 _ 8B. 55, F8
        add     edx, 2                                  ; 1699 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 169C _ 8B. 44 D0, 04
        sub     eax, dword [ebp+0CH]                    ; 16A0 _ 2B. 45, 0C
        mov     edx, eax                                ; 16A3 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 16A5 _ 8B. 45, 08
        mov     ecx, dword [ebp-8H]                     ; 16A8 _ 8B. 4D, F8
        add     ecx, 2                                  ; 16AB _ 83. C1, 02
        mov     dword [eax+ecx*8+4H], edx               ; 16AE _ 89. 54 C8, 04
        mov     eax, dword [ebp+8H]                     ; 16B2 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 16B5 _ 8B. 55, F8
        add     edx, 2                                  ; 16B8 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 16BB _ 8B. 44 D0, 04
        test    eax, eax                                ; 16BF _ 85. C0
        jnz     ?_073                                   ; 16C1 _ 75, 0D
        mov     eax, dword [ebp+8H]                     ; 16C3 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 16C6 _ 8B. 00
        lea     edx, [eax-1H]                           ; 16C8 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 16CB _ 8B. 45, 08
        mov     dword [eax], edx                        ; 16CE _ 89. 10
?_073:  mov     eax, dword [ebp-4H]                     ; 16D0 _ 8B. 45, FC
        jmp     ?_076                                   ; 16D3 _ EB, 17

?_074:  add     dword [ebp-8H], 1                       ; 16D5 _ 83. 45, F8, 01
?_075:  mov     eax, dword [ebp+8H]                     ; 16D9 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 16DC _ 8B. 00
        cmp     dword [ebp-8H], eax                     ; 16DE _ 39. 45, F8
        jc      ?_072                                   ; 16E1 _ 0F 82, FFFFFF6D
        mov     eax, 0                                  ; 16E7 _ B8, 00000000
?_076:  leave                                           ; 16EC _ C9
        ret                                             ; 16ED _ C3
; memman_alloc End of function

memman_free:; Function begin
        push    ebp                                     ; 16EE _ 55
        mov     ebp, esp                                ; 16EF _ 89. E5
        push    ebx                                     ; 16F1 _ 53
        sub     esp, 16                                 ; 16F2 _ 83. EC, 10
        mov     dword [ebp-0CH], 0                      ; 16F5 _ C7. 45, F4, 00000000
        jmp     ?_078                                   ; 16FC _ EB, 15

?_077:  mov     eax, dword [ebp+8H]                     ; 16FE _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1701 _ 8B. 55, F4
        add     edx, 2                                  ; 1704 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 1707 _ 8B. 04 D0
        cmp     dword [ebp+0CH], eax                    ; 170A _ 39. 45, 0C
        jc      ?_079                                   ; 170D _ 72, 10
        add     dword [ebp-0CH], 1                      ; 170F _ 83. 45, F4, 01
?_078:  mov     eax, dword [ebp+8H]                     ; 1713 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1716 _ 8B. 00
        cmp     dword [ebp-0CH], eax                    ; 1718 _ 39. 45, F4
        jl      ?_077                                   ; 171B _ 7C, E1
        jmp     ?_080                                   ; 171D _ EB, 01

?_079:  nop                                             ; 171F _ 90
?_080:  cmp     dword [ebp-0CH], 0                      ; 1720 _ 83. 7D, F4, 00
        jle     ?_082                                   ; 1724 _ 0F 8E, 000000B9
        mov     eax, dword [ebp-0CH]                    ; 172A _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 172D _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1730 _ 8B. 45, 08
        add     edx, 2                                  ; 1733 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 1736 _ 8B. 14 D0
        mov     eax, dword [ebp-0CH]                    ; 1739 _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 173C _ 8D. 48, FF
        mov     eax, dword [ebp+8H]                     ; 173F _ 8B. 45, 08
        add     ecx, 2                                  ; 1742 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 1745 _ 8B. 44 C8, 04
        add     eax, edx                                ; 1749 _ 01. D0
        cmp     dword [ebp+0CH], eax                    ; 174B _ 39. 45, 0C
        jne     ?_082                                   ; 174E _ 0F 85, 0000008F
        mov     eax, dword [ebp-0CH]                    ; 1754 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1757 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 175A _ 8B. 45, 08
        add     edx, 2                                  ; 175D _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 1760 _ 8B. 54 D0, 04
        mov     eax, dword [ebp-0CH]                    ; 1764 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 1767 _ 8D. 58, FF
        mov     eax, dword [ebp+10H]                    ; 176A _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 176D _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1770 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 1773 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 1776 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 177A _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 177D _ 8B. 00
        test    eax, eax                                ; 177F _ 85. C0
        jle     ?_081                                   ; 1781 _ 7E, 56
        mov     edx, dword [ebp+0CH]                    ; 1783 _ 8B. 55, 0C
        mov     eax, dword [ebp+10H]                    ; 1786 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 1789 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 178C _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 178F _ 8B. 55, F4
        add     edx, 2                                  ; 1792 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 1795 _ 8B. 04 D0
        cmp     ecx, eax                                ; 1798 _ 39. C1
        jnz     ?_081                                   ; 179A _ 75, 3D
        mov     eax, dword [ebp-0CH]                    ; 179C _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 179F _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 17A2 _ 8B. 45, 08
        add     edx, 2                                  ; 17A5 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 17A8 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+8H]                     ; 17AC _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 17AF _ 8B. 4D, F4
        add     ecx, 2                                  ; 17B2 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 17B5 _ 8B. 44 C8, 04
        mov     ecx, dword [ebp-0CH]                    ; 17B9 _ 8B. 4D, F4
        lea     ebx, [ecx-1H]                           ; 17BC _ 8D. 59, FF
        lea     ecx, [edx+eax]                          ; 17BF _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 17C2 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 17C5 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 17C8 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 17CC _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 17CF _ 8B. 00
        lea     edx, [eax-1H]                           ; 17D1 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 17D4 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 17D7 _ 89. 10
?_081:  mov     eax, 0                                  ; 17D9 _ B8, 00000000
        jmp     ?_088                                   ; 17DE _ E9, 0000011B

?_082:  mov     eax, dword [ebp+8H]                     ; 17E3 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 17E6 _ 8B. 00
        test    eax, eax                                ; 17E8 _ 85. C0
        jle     ?_083                                   ; 17EA _ 7E, 52
        mov     edx, dword [ebp+0CH]                    ; 17EC _ 8B. 55, 0C
        mov     eax, dword [ebp+10H]                    ; 17EF _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 17F2 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 17F5 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 17F8 _ 8B. 55, F4
        add     edx, 2                                  ; 17FB _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 17FE _ 8B. 04 D0
        cmp     ecx, eax                                ; 1801 _ 39. C1
        jnz     ?_083                                   ; 1803 _ 75, 39
        mov     eax, dword [ebp+8H]                     ; 1805 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1808 _ 8B. 55, F4
        add     edx, 2                                  ; 180B _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 180E _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 1812 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 1815 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1818 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 181B _ 8B. 55, F4
        add     edx, 2                                  ; 181E _ 83. C2, 02
        mov     dword [eax+edx*8+4H], ecx               ; 1821 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 1825 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1828 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 182B _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 182E _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 1831 _ 89. 14 C8
        mov     eax, 0                                  ; 1834 _ B8, 00000000
        jmp     ?_088                                   ; 1839 _ E9, 000000C0

?_083:  mov     eax, dword [ebp+8H]                     ; 183E _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1841 _ 8B. 00
        cmp     eax, 4095                               ; 1843 _ 3D, 00000FFF
        jg      ?_087                                   ; 1848 _ 0F 8F, 00000087
        mov     eax, dword [ebp+8H]                     ; 184E _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1851 _ 8B. 00
        lea     edx, [eax+1H]                           ; 1853 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1856 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 1859 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 185B _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 185E _ 8B. 00
        mov     dword [ebp-8H], eax                     ; 1860 _ 89. 45, F8
        jmp     ?_085                                   ; 1863 _ EB, 28

?_084:  mov     eax, dword [ebp-8H]                     ; 1865 _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 1868 _ 8D. 50, FF
        mov     ecx, dword [ebp+8H]                     ; 186B _ 8B. 4D, 08
        mov     eax, dword [ebp-8H]                     ; 186E _ 8B. 45, F8
        lea     ebx, [eax+2H]                           ; 1871 _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 1874 _ 8B. 45, 08
        add     edx, 2                                  ; 1877 _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 187A _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 187D _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 187F _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 1882 _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 1885 _ 89. 54 D9, 04
        sub     dword [ebp-8H], 1                       ; 1889 _ 83. 6D, F8, 01
?_085:  mov     eax, dword [ebp-8H]                     ; 188D _ 8B. 45, F8
        cmp     eax, dword [ebp-0CH]                    ; 1890 _ 3B. 45, F4
        jg      ?_084                                   ; 1893 _ 7F, D0
        mov     eax, dword [ebp+8H]                     ; 1895 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1898 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 189B _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 189E _ 8B. 00
        cmp     edx, eax                                ; 18A0 _ 39. C2
        jge     ?_086                                   ; 18A2 _ 7D, 0B
        mov     eax, dword [ebp+8H]                     ; 18A4 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 18A7 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 18A9 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 18AC _ 89. 50, 04
?_086:  mov     eax, dword [ebp+8H]                     ; 18AF _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 18B2 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 18B5 _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 18B8 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 18BB _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 18BE _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 18C1 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 18C4 _ 8D. 4A, 02
        mov     edx, dword [ebp+10H]                    ; 18C7 _ 8B. 55, 10
        mov     dword [eax+ecx*8+4H], edx               ; 18CA _ 89. 54 C8, 04
        mov     eax, 0                                  ; 18CE _ B8, 00000000
        jmp     ?_088                                   ; 18D3 _ EB, 29

?_087:  mov     eax, dword [ebp+8H]                     ; 18D5 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 18D8 _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 18DB _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 18DE _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 18E1 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 18E4 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 18E7 _ 8B. 40, 08
        mov     edx, eax                                ; 18EA _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 18EC _ 8B. 45, 10
        add     eax, edx                                ; 18EF _ 01. D0
        mov     edx, eax                                ; 18F1 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 18F3 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 18F6 _ 89. 50, 08
        mov     eax, 4294967295                         ; 18F9 _ B8, FFFFFFFF
?_088:  add     esp, 16                                 ; 18FE _ 83. C4, 10
        pop     ebx                                     ; 1901 _ 5B
        pop     ebp                                     ; 1902 _ 5D
        ret                                             ; 1903 _ C3
; memman_free End of function

memman_alloc_4k:; Function begin
        push    ebp                                     ; 1904 _ 55
        mov     ebp, esp                                ; 1905 _ 89. E5
        sub     esp, 16                                 ; 1907 _ 83. EC, 10
        mov     eax, dword [ebp+0CH]                    ; 190A _ 8B. 45, 0C
        add     eax, 4095                               ; 190D _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 1912 _ 25, FFFFF000
        mov     dword [ebp+0CH], eax                    ; 1917 _ 89. 45, 0C
        push    dword [ebp+0CH]                         ; 191A _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 191D _ FF. 75, 08
        call    memman_alloc                            ; 1920 _ E8, FFFFFFFC(rel)
        add     esp, 8                                  ; 1925 _ 83. C4, 08
        mov     dword [ebp-4H], eax                     ; 1928 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 192B _ 8B. 45, FC
        leave                                           ; 192E _ C9
        ret                                             ; 192F _ C3
; memman_alloc_4k End of function

memman_free_4k:; Function begin
        push    ebp                                     ; 1930 _ 55
        mov     ebp, esp                                ; 1931 _ 89. E5
        sub     esp, 16                                 ; 1933 _ 83. EC, 10
        mov     eax, dword [ebp+10H]                    ; 1936 _ 8B. 45, 10
        add     eax, 4095                               ; 1939 _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 193E _ 25, FFFFF000
        mov     dword [ebp+10H], eax                    ; 1943 _ 89. 45, 10
        push    dword [ebp+10H]                         ; 1946 _ FF. 75, 10
        push    dword [ebp+0CH]                         ; 1949 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 194C _ FF. 75, 08
        call    memman_free                             ; 194F _ E8, FFFFFFFC(rel)
        add     esp, 12                                 ; 1954 _ 83. C4, 0C
        mov     dword [ebp-4H], eax                     ; 1957 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 195A _ 8B. 45, FC
        leave                                           ; 195D _ C9
        ret                                             ; 195E _ C3
; memman_free_4k End of function

shtctl_init:; Function begin
        push    ebp                                     ; 195F _ 55
        mov     ebp, esp                                ; 1960 _ 89. E5
        sub     esp, 24                                 ; 1962 _ 83. EC, 18
        sub     esp, 8                                  ; 1965 _ 83. EC, 08
        push    9232                                    ; 1968 _ 68, 00002410
        push    dword [ebp+8H]                          ; 196D _ FF. 75, 08
        call    memman_alloc_4k                         ; 1970 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1975 _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 1978 _ 89. 45, F4
        cmp     dword [ebp-0CH], 0                      ; 197B _ 83. 7D, F4, 00
        jnz     ?_089                                   ; 197F _ 75, 07
        mov     eax, 0                                  ; 1981 _ B8, 00000000
        jmp     ?_092                                   ; 1986 _ EB, 54

?_089:  mov     eax, dword [ebp-0CH]                    ; 1988 _ 8B. 45, F4
        mov     edx, dword [ebp+0CH]                    ; 198B _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 198E _ 89. 10
        mov     eax, dword [ebp-0CH]                    ; 1990 _ 8B. 45, F4
        mov     edx, dword [ebp+10H]                    ; 1993 _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 1996 _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 1999 _ 8B. 45, F4
        mov     edx, dword [ebp+14H]                    ; 199C _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 199F _ 89. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 19A2 _ 8B. 45, F4
        mov     dword [eax+0CH], -1                     ; 19A5 _ C7. 40, 0C, FFFFFFFF
        mov     dword [ebp-10H], 0                      ; 19AC _ C7. 45, F0, 00000000
        jmp     ?_091                                   ; 19B3 _ EB, 1B

?_090:  mov     eax, dword [ebp-0CH]                    ; 19B5 _ 8B. 45, F4
        mov     edx, dword [ebp-10H]                    ; 19B8 _ 8B. 55, F0
        add     edx, 33                                 ; 19BB _ 83. C2, 21
        shl     edx, 5                                  ; 19BE _ C1. E2, 05
        add     eax, edx                                ; 19C1 _ 01. D0
        add     eax, 12                                 ; 19C3 _ 83. C0, 0C
        mov     dword [eax], 0                          ; 19C6 _ C7. 00, 00000000
        add     dword [ebp-10H], 1                      ; 19CC _ 83. 45, F0, 01
?_091:  cmp     dword [ebp-10H], 255                    ; 19D0 _ 81. 7D, F0, 000000FF
        jle     ?_090                                   ; 19D7 _ 7E, DC
        mov     eax, dword [ebp-0CH]                    ; 19D9 _ 8B. 45, F4
?_092:  leave                                           ; 19DC _ C9
        ret                                             ; 19DD _ C3
; shtctl_init End of function

sheet_alloc:; Function begin
        push    ebp                                     ; 19DE _ 55
        mov     ebp, esp                                ; 19DF _ 89. E5
        sub     esp, 16                                 ; 19E1 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 19E4 _ C7. 45, F8, 00000000
        jmp     ?_095                                   ; 19EB _ EB, 57

?_093:  mov     eax, dword [ebp+8H]                     ; 19ED _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 19F0 _ 8B. 55, F8
        add     edx, 33                                 ; 19F3 _ 83. C2, 21
        shl     edx, 5                                  ; 19F6 _ C1. E2, 05
        add     eax, edx                                ; 19F9 _ 01. D0
        add     eax, 12                                 ; 19FB _ 83. C0, 0C
        mov     eax, dword [eax]                        ; 19FE _ 8B. 00
        test    eax, eax                                ; 1A00 _ 85. C0
        jnz     ?_094                                   ; 1A02 _ 75, 3C
        mov     eax, dword [ebp-8H]                     ; 1A04 _ 8B. 45, F8
        shl     eax, 5                                  ; 1A07 _ C1. E0, 05
        lea     edx, [eax+410H]                         ; 1A0A _ 8D. 90, 00000410
        mov     eax, dword [ebp+8H]                     ; 1A10 _ 8B. 45, 08
        add     eax, edx                                ; 1A13 _ 01. D0
        mov     dword [ebp-4H], eax                     ; 1A15 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 1A18 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1A1B _ 8B. 55, F8
        lea     ecx, [edx+4H]                           ; 1A1E _ 8D. 4A, 04
        mov     edx, dword [ebp-4H]                     ; 1A21 _ 8B. 55, FC
        mov     dword [eax+ecx*4], edx                  ; 1A24 _ 89. 14 88
        mov     eax, dword [ebp-4H]                     ; 1A27 _ 8B. 45, FC
        mov     dword [eax+1CH], 1                      ; 1A2A _ C7. 40, 1C, 00000001
        mov     eax, dword [ebp-4H]                     ; 1A31 _ 8B. 45, FC
        mov     dword [eax+18H], -1                     ; 1A34 _ C7. 40, 18, FFFFFFFF
        mov     eax, dword [ebp-4H]                     ; 1A3B _ 8B. 45, FC
        jmp     ?_096                                   ; 1A3E _ EB, 12

?_094:  add     dword [ebp-8H], 1                       ; 1A40 _ 83. 45, F8, 01
?_095:  cmp     dword [ebp-8H], 255                     ; 1A44 _ 81. 7D, F8, 000000FF
        jle     ?_093                                   ; 1A4B _ 7E, A0
        mov     eax, 0                                  ; 1A4D _ B8, 00000000
?_096:  leave                                           ; 1A52 _ C9
        ret                                             ; 1A53 _ C3
; sheet_alloc End of function

sheet_setbuf:; Function begin
        push    ebp                                     ; 1A54 _ 55
        mov     ebp, esp                                ; 1A55 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 1A57 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 1A5A _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 1A5D _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 1A5F _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 1A62 _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 1A65 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1A68 _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 1A6B _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 1A6E _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 1A71 _ 8B. 45, 08
        mov     edx, dword [ebp+18H]                    ; 1A74 _ 8B. 55, 18
        mov     dword [eax+14H], edx                    ; 1A77 _ 89. 50, 14
        nop                                             ; 1A7A _ 90
        pop     ebp                                     ; 1A7B _ 5D
        ret                                             ; 1A7C _ C3
; sheet_setbuf End of function

sheet_updown:; Function begin
        push    ebp                                     ; 1A7D _ 55
        mov     ebp, esp                                ; 1A7E _ 89. E5
        push    ebx                                     ; 1A80 _ 53
        sub     esp, 20                                 ; 1A81 _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 1A84 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 1A87 _ 8B. 40, 18
        mov     dword [ebp-0CH], eax                    ; 1A8A _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 1A8D _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1A90 _ 8B. 40, 0C
        add     eax, 1                                  ; 1A93 _ 83. C0, 01
        cmp     dword [ebp+10H], eax                    ; 1A96 _ 39. 45, 10
        jle     ?_097                                   ; 1A99 _ 7E, 0C
        mov     eax, dword [ebp+8H]                     ; 1A9B _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1A9E _ 8B. 40, 0C
        add     eax, 1                                  ; 1AA1 _ 83. C0, 01
        mov     dword [ebp+10H], eax                    ; 1AA4 _ 89. 45, 10
?_097:  cmp     dword [ebp+10H], -1                     ; 1AA7 _ 83. 7D, 10, FF
        jge     ?_098                                   ; 1AAB _ 7D, 07
        mov     dword [ebp+10H], -1                     ; 1AAD _ C7. 45, 10, FFFFFFFF
?_098:  mov     eax, dword [ebp+0CH]                    ; 1AB4 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 1AB7 _ 8B. 55, 10
        mov     dword [eax+18H], edx                    ; 1ABA _ 89. 50, 18
        mov     eax, dword [ebp-0CH]                    ; 1ABD _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 1AC0 _ 3B. 45, 10
        jle     ?_106                                   ; 1AC3 _ 0F 8E, 000000F7
        cmp     dword [ebp+10H], 0                      ; 1AC9 _ 83. 7D, 10, 00
        js      ?_101                                   ; 1ACD _ 78, 52
        mov     eax, dword [ebp-0CH]                    ; 1ACF _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 1AD2 _ 89. 45, F0
        jmp     ?_100                                   ; 1AD5 _ EB, 31

?_099:  mov     eax, dword [ebp-10H]                    ; 1AD7 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 1ADA _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1ADD _ 8B. 45, 08
        add     edx, 4                                  ; 1AE0 _ 83. C2, 04
        mov     edx, dword [eax+edx*4]                  ; 1AE3 _ 8B. 14 90
        mov     eax, dword [ebp+8H]                     ; 1AE6 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 1AE9 _ 8B. 4D, F0
        add     ecx, 4                                  ; 1AEC _ 83. C1, 04
        mov     dword [eax+ecx*4], edx                  ; 1AEF _ 89. 14 88
        mov     eax, dword [ebp+8H]                     ; 1AF2 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 1AF5 _ 8B. 55, F0
        add     edx, 4                                  ; 1AF8 _ 83. C2, 04
        mov     eax, dword [eax+edx*4]                  ; 1AFB _ 8B. 04 90
        mov     edx, dword [ebp-10H]                    ; 1AFE _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 1B01 _ 89. 50, 18
        sub     dword [ebp-10H], 1                      ; 1B04 _ 83. 6D, F0, 01
?_100:  mov     eax, dword [ebp-10H]                    ; 1B08 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 1B0B _ 3B. 45, 10
        jg      ?_099                                   ; 1B0E _ 7F, C7
        mov     eax, dword [ebp+8H]                     ; 1B10 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 1B13 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 1B16 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 1B19 _ 8B. 55, 0C
        mov     dword [eax+ecx*4], edx                  ; 1B1C _ 89. 14 88
        jmp     ?_105                                   ; 1B1F _ EB, 5E

?_101:  mov     eax, dword [ebp+8H]                     ; 1B21 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1B24 _ 8B. 40, 0C
        cmp     dword [ebp-0CH], eax                    ; 1B27 _ 39. 45, F4
        jge     ?_104                                   ; 1B2A _ 7D, 44
        mov     eax, dword [ebp-0CH]                    ; 1B2C _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 1B2F _ 89. 45, F0
        jmp     ?_103                                   ; 1B32 _ EB, 31

?_102:  mov     eax, dword [ebp-10H]                    ; 1B34 _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 1B37 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1B3A _ 8B. 45, 08
        add     edx, 4                                  ; 1B3D _ 83. C2, 04
        mov     edx, dword [eax+edx*4]                  ; 1B40 _ 8B. 14 90
        mov     eax, dword [ebp+8H]                     ; 1B43 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 1B46 _ 8B. 4D, F0
        add     ecx, 4                                  ; 1B49 _ 83. C1, 04
        mov     dword [eax+ecx*4], edx                  ; 1B4C _ 89. 14 88
        mov     eax, dword [ebp+8H]                     ; 1B4F _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 1B52 _ 8B. 55, F0
        add     edx, 4                                  ; 1B55 _ 83. C2, 04
        mov     eax, dword [eax+edx*4]                  ; 1B58 _ 8B. 04 90
        mov     edx, dword [ebp-10H]                    ; 1B5B _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 1B5E _ 89. 50, 18
        add     dword [ebp-10H], 1                      ; 1B61 _ 83. 45, F0, 01
?_103:  mov     eax, dword [ebp+8H]                     ; 1B65 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1B68 _ 8B. 40, 0C
        cmp     dword [ebp-10H], eax                    ; 1B6B _ 39. 45, F0
        jl      ?_102                                   ; 1B6E _ 7C, C4
?_104:  mov     eax, dword [ebp+8H]                     ; 1B70 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1B73 _ 8B. 40, 0C
        lea     edx, [eax-1H]                           ; 1B76 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1B79 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 1B7C _ 89. 50, 0C
?_105:  mov     eax, dword [ebp+0CH]                    ; 1B7F _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1B82 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1B85 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 1B88 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 1B8B _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 1B8E _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 1B91 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 1B94 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1B97 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 1B9A _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 1B9D _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1BA0 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1BA3 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 1BA6 _ 8B. 40, 0C
        sub     esp, 12                                 ; 1BA9 _ 83. EC, 0C
        push    ebx                                     ; 1BAC _ 53
        push    ecx                                     ; 1BAD _ 51
        push    edx                                     ; 1BAE _ 52
        push    eax                                     ; 1BAF _ 50
        push    dword [ebp+8H]                          ; 1BB0 _ FF. 75, 08
        call    sheet_refreshsub                        ; 1BB3 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1BB8 _ 83. C4, 20
        jmp     ?_113                                   ; 1BBB _ E9, 00000108

?_106:  mov     eax, dword [ebp-0CH]                    ; 1BC0 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 1BC3 _ 3B. 45, 10
        jge     ?_113                                   ; 1BC6 _ 0F 8D, 000000FC
        cmp     dword [ebp-0CH], 0                      ; 1BCC _ 83. 7D, F4, 00
        js      ?_109                                   ; 1BD0 _ 78, 52
        mov     eax, dword [ebp-0CH]                    ; 1BD2 _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 1BD5 _ 89. 45, F0
        jmp     ?_108                                   ; 1BD8 _ EB, 31

?_107:  mov     eax, dword [ebp-10H]                    ; 1BDA _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 1BDD _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1BE0 _ 8B. 45, 08
        add     edx, 4                                  ; 1BE3 _ 83. C2, 04
        mov     edx, dword [eax+edx*4]                  ; 1BE6 _ 8B. 14 90
        mov     eax, dword [ebp+8H]                     ; 1BE9 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 1BEC _ 8B. 4D, F0
        add     ecx, 4                                  ; 1BEF _ 83. C1, 04
        mov     dword [eax+ecx*4], edx                  ; 1BF2 _ 89. 14 88
        mov     eax, dword [ebp+8H]                     ; 1BF5 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 1BF8 _ 8B. 55, F0
        add     edx, 4                                  ; 1BFB _ 83. C2, 04
        mov     eax, dword [eax+edx*4]                  ; 1BFE _ 8B. 04 90
        mov     edx, dword [ebp-10H]                    ; 1C01 _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 1C04 _ 89. 50, 18
        add     dword [ebp-10H], 1                      ; 1C07 _ 83. 45, F0, 01
?_108:  mov     eax, dword [ebp-10H]                    ; 1C0B _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 1C0E _ 3B. 45, 10
        jl      ?_107                                   ; 1C11 _ 7C, C7
        mov     eax, dword [ebp+8H]                     ; 1C13 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 1C16 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 1C19 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 1C1C _ 8B. 55, 0C
        mov     dword [eax+ecx*4], edx                  ; 1C1F _ 89. 14 88
        jmp     ?_112                                   ; 1C22 _ EB, 68

?_109:  mov     eax, dword [ebp+8H]                     ; 1C24 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1C27 _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 1C2A _ 89. 45, F0
        jmp     ?_111                                   ; 1C2D _ EB, 37

?_110:  mov     eax, dword [ebp-10H]                    ; 1C2F _ 8B. 45, F0
        lea     ecx, [eax+1H]                           ; 1C32 _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 1C35 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 1C38 _ 8B. 55, F0
        add     edx, 4                                  ; 1C3B _ 83. C2, 04
        mov     edx, dword [eax+edx*4]                  ; 1C3E _ 8B. 14 90
        mov     eax, dword [ebp+8H]                     ; 1C41 _ 8B. 45, 08
        add     ecx, 4                                  ; 1C44 _ 83. C1, 04
        mov     dword [eax+ecx*4], edx                  ; 1C47 _ 89. 14 88
        mov     eax, dword [ebp-10H]                    ; 1C4A _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 1C4D _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1C50 _ 8B. 45, 08
        add     edx, 4                                  ; 1C53 _ 83. C2, 04
        mov     eax, dword [eax+edx*4]                  ; 1C56 _ 8B. 04 90
        mov     edx, dword [ebp-10H]                    ; 1C59 _ 8B. 55, F0
        add     edx, 1                                  ; 1C5C _ 83. C2, 01
        mov     dword [eax+18H], edx                    ; 1C5F _ 89. 50, 18
        sub     dword [ebp-10H], 1                      ; 1C62 _ 83. 6D, F0, 01
?_111:  mov     eax, dword [ebp-10H]                    ; 1C66 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 1C69 _ 3B. 45, 10
        jge     ?_110                                   ; 1C6C _ 7D, C1
        mov     eax, dword [ebp+8H]                     ; 1C6E _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 1C71 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 1C74 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 1C77 _ 8B. 55, 0C
        mov     dword [eax+ecx*4], edx                  ; 1C7A _ 89. 14 88
        mov     eax, dword [ebp+8H]                     ; 1C7D _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1C80 _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 1C83 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1C86 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 1C89 _ 89. 50, 0C
?_112:  mov     eax, dword [ebp+0CH]                    ; 1C8C _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1C8F _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1C92 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 1C95 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 1C98 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 1C9B _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 1C9E _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 1CA1 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1CA4 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 1CA7 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 1CAA _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1CAD _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1CB0 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 1CB3 _ 8B. 40, 0C
        sub     esp, 12                                 ; 1CB6 _ 83. EC, 0C
        push    ebx                                     ; 1CB9 _ 53
        push    ecx                                     ; 1CBA _ 51
        push    edx                                     ; 1CBB _ 52
        push    eax                                     ; 1CBC _ 50
        push    dword [ebp+8H]                          ; 1CBD _ FF. 75, 08
        call    sheet_refreshsub                        ; 1CC0 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1CC5 _ 83. C4, 20
?_113:  nop                                             ; 1CC8 _ 90
        mov     ebx, dword [ebp-4H]                     ; 1CC9 _ 8B. 5D, FC
        leave                                           ; 1CCC _ C9
        ret                                             ; 1CCD _ C3
; sheet_updown End of function

sheet_refresh:; Function begin
        push    ebp                                     ; 1CCE _ 55
        mov     ebp, esp                                ; 1CCF _ 89. E5
        push    esi                                     ; 1CD1 _ 56
        push    ebx                                     ; 1CD2 _ 53
        mov     eax, dword [ebp+0CH]                    ; 1CD3 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 1CD6 _ 8B. 40, 18
        test    eax, eax                                ; 1CD9 _ 85. C0
        js      ?_114                                   ; 1CDB _ 78, 40
        mov     eax, dword [ebp+0CH]                    ; 1CDD _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1CE0 _ 8B. 50, 10
        mov     eax, dword [ebp+1CH]                    ; 1CE3 _ 8B. 45, 1C
        lea     ebx, [edx+eax]                          ; 1CE6 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 1CE9 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 1CEC _ 8B. 50, 0C
        mov     eax, dword [ebp+18H]                    ; 1CEF _ 8B. 45, 18
        lea     ecx, [edx+eax]                          ; 1CF2 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 1CF5 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1CF8 _ 8B. 50, 10
        mov     eax, dword [ebp+14H]                    ; 1CFB _ 8B. 45, 14
        add     edx, eax                                ; 1CFE _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 1D00 _ 8B. 45, 0C
        mov     esi, dword [eax+0CH]                    ; 1D03 _ 8B. 70, 0C
        mov     eax, dword [ebp+10H]                    ; 1D06 _ 8B. 45, 10
        add     eax, esi                                ; 1D09 _ 01. F0
        sub     esp, 12                                 ; 1D0B _ 83. EC, 0C
        push    ebx                                     ; 1D0E _ 53
        push    ecx                                     ; 1D0F _ 51
        push    edx                                     ; 1D10 _ 52
        push    eax                                     ; 1D11 _ 50
        push    dword [ebp+8H]                          ; 1D12 _ FF. 75, 08
        call    sheet_refreshsub                        ; 1D15 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1D1A _ 83. C4, 20
?_114:  mov     eax, 0                                  ; 1D1D _ B8, 00000000
        lea     esp, [ebp-8H]                           ; 1D22 _ 8D. 65, F8
        pop     ebx                                     ; 1D25 _ 5B
        pop     esi                                     ; 1D26 _ 5E
        pop     ebp                                     ; 1D27 _ 5D
        ret                                             ; 1D28 _ C3
; sheet_refresh End of function

sheet_slide_mouse:; Function begin
        push    ebp                                     ; 1D29 _ 55
        mov     ebp, esp                                ; 1D2A _ 89. E5
        sub     esp, 24                                 ; 1D2C _ 83. EC, 18
        mov     eax, dword [ebp+0CH]                    ; 1D2F _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 1D32 _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 1D35 _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 1D38 _ 8B. 45, 0C
        mov     eax, dword [eax+10H]                    ; 1D3B _ 8B. 40, 10
        mov     dword [ebp-0CH], eax                    ; 1D3E _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 1D41 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 1D44 _ 8B. 55, 10
        mov     dword [eax+0CH], edx                    ; 1D47 _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 1D4A _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 1D4D _ 8B. 55, 14
        mov     dword [eax+10H], edx                    ; 1D50 _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1D53 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 1D56 _ 8B. 40, 18
        test    eax, eax                                ; 1D59 _ 85. C0
        js      ?_115                                   ; 1D5B _ 78, 4E
        mov     eax, dword [ebp-0CH]                    ; 1D5D _ 8B. 45, F4
        lea     edx, [eax+10H]                          ; 1D60 _ 8D. 50, 10
        mov     eax, dword [ebp-10H]                    ; 1D63 _ 8B. 45, F0
        add     eax, 16                                 ; 1D66 _ 83. C0, 10
        sub     esp, 12                                 ; 1D69 _ 83. EC, 0C
        push    edx                                     ; 1D6C _ 52
        push    eax                                     ; 1D6D _ 50
        push    dword [ebp-0CH]                         ; 1D6E _ FF. 75, F4
        push    dword [ebp-10H]                         ; 1D71 _ FF. 75, F0
        push    dword [ebp+8H]                          ; 1D74 _ FF. 75, 08
        call    sheet_refreshsub                        ; 1D77 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1D7C _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 1D7F _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 1D82 _ 8B. 50, 08
        mov     eax, dword [ebp+14H]                    ; 1D85 _ 8B. 45, 14
        add     edx, eax                                ; 1D88 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 1D8A _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 1D8D _ 8B. 48, 04
        mov     eax, dword [ebp+10H]                    ; 1D90 _ 8B. 45, 10
        add     eax, ecx                                ; 1D93 _ 01. C8
        sub     esp, 12                                 ; 1D95 _ 83. EC, 0C
        push    edx                                     ; 1D98 _ 52
        push    eax                                     ; 1D99 _ 50
        push    dword [ebp+14H]                         ; 1D9A _ FF. 75, 14
        push    dword [ebp+10H]                         ; 1D9D _ FF. 75, 10
        push    dword [ebp+8H]                          ; 1DA0 _ FF. 75, 08
        call    sheet_refreshsub                        ; 1DA3 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1DA8 _ 83. C4, 20
?_115:  nop                                             ; 1DAB _ 90
        leave                                           ; 1DAC _ C9
        ret                                             ; 1DAD _ C3
; sheet_slide_mouse End of function

sheet_slide:; Function begin
        push    ebp                                     ; 1DAE _ 55
        mov     ebp, esp                                ; 1DAF _ 89. E5
        sub     esp, 24                                 ; 1DB1 _ 83. EC, 18
        mov     eax, dword [ebp+0CH]                    ; 1DB4 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 1DB7 _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 1DBA _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 1DBD _ 8B. 45, 0C
        mov     eax, dword [eax+10H]                    ; 1DC0 _ 8B. 40, 10
        mov     dword [ebp-0CH], eax                    ; 1DC3 _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 1DC6 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 1DC9 _ 8B. 55, 10
        mov     dword [eax+0CH], edx                    ; 1DCC _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 1DCF _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 1DD2 _ 8B. 55, 14
        mov     dword [eax+10H], edx                    ; 1DD5 _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1DD8 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 1DDB _ 8B. 40, 18
        test    eax, eax                                ; 1DDE _ 85. C0
        js      ?_116                                   ; 1DE0 _ 78, 58
        mov     eax, dword [ebp+0CH]                    ; 1DE2 _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 1DE5 _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 1DE8 _ 8B. 45, F4
        add     edx, eax                                ; 1DEB _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 1DED _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 1DF0 _ 8B. 48, 04
        mov     eax, dword [ebp-10H]                    ; 1DF3 _ 8B. 45, F0
        add     eax, ecx                                ; 1DF6 _ 01. C8
        sub     esp, 12                                 ; 1DF8 _ 83. EC, 0C
        push    edx                                     ; 1DFB _ 52
        push    eax                                     ; 1DFC _ 50
        push    dword [ebp-0CH]                         ; 1DFD _ FF. 75, F4
        push    dword [ebp-10H]                         ; 1E00 _ FF. 75, F0
        push    dword [ebp+8H]                          ; 1E03 _ FF. 75, 08
        call    sheet_refreshsub                        ; 1E06 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1E0B _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 1E0E _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 1E11 _ 8B. 50, 08
        mov     eax, dword [ebp+14H]                    ; 1E14 _ 8B. 45, 14
        add     edx, eax                                ; 1E17 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 1E19 _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 1E1C _ 8B. 48, 04
        mov     eax, dword [ebp+10H]                    ; 1E1F _ 8B. 45, 10
        add     eax, ecx                                ; 1E22 _ 01. C8
        sub     esp, 12                                 ; 1E24 _ 83. EC, 0C
        push    edx                                     ; 1E27 _ 52
        push    eax                                     ; 1E28 _ 50
        push    dword [ebp+14H]                         ; 1E29 _ FF. 75, 14
        push    dword [ebp+10H]                         ; 1E2C _ FF. 75, 10
        push    dword [ebp+8H]                          ; 1E2F _ FF. 75, 08
        call    sheet_refreshsub                        ; 1E32 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1E37 _ 83. C4, 20
?_116:  nop                                             ; 1E3A _ 90
        leave                                           ; 1E3B _ C9
        ret                                             ; 1E3C _ C3
; sheet_slide End of function

sheet_refreshsub:; Function begin
        push    ebp                                     ; 1E3D _ 55
        mov     ebp, esp                                ; 1E3E _ 89. E5
        sub     esp, 48                                 ; 1E40 _ 83. EC, 30
        mov     eax, dword [ebp+8H]                     ; 1E43 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1E46 _ 8B. 00
        mov     dword [ebp-14H], eax                    ; 1E48 _ 89. 45, EC
        mov     dword [ebp-20H], 0                      ; 1E4B _ C7. 45, E0, 00000000
        jmp     ?_123                                   ; 1E52 _ E9, 000000ED

?_117:  mov     eax, dword [ebp+8H]                     ; 1E57 _ 8B. 45, 08
        mov     edx, dword [ebp-20H]                    ; 1E5A _ 8B. 55, E0
        add     edx, 4                                  ; 1E5D _ 83. C2, 04
        mov     eax, dword [eax+edx*4]                  ; 1E60 _ 8B. 04 90
        mov     dword [ebp-10H], eax                    ; 1E63 _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 1E66 _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 1E69 _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 1E6B _ 89. 45, F4
        mov     dword [ebp-18H], 0                      ; 1E6E _ C7. 45, E8, 00000000
        jmp     ?_122                                   ; 1E75 _ E9, 000000B7

?_118:  mov     eax, dword [ebp-10H]                    ; 1E7A _ 8B. 45, F0
        mov     edx, dword [eax+10H]                    ; 1E7D _ 8B. 50, 10
        mov     eax, dword [ebp-18H]                    ; 1E80 _ 8B. 45, E8
        add     eax, edx                                ; 1E83 _ 01. D0
        mov     dword [ebp-8H], eax                     ; 1E85 _ 89. 45, F8
        mov     dword [ebp-1CH], 0                      ; 1E88 _ C7. 45, E4, 00000000
        jmp     ?_121                                   ; 1E8F _ E9, 0000008A

?_119:  mov     eax, dword [ebp-10H]                    ; 1E94 _ 8B. 45, F0
        mov     edx, dword [eax+0CH]                    ; 1E97 _ 8B. 50, 0C
        mov     eax, dword [ebp-1CH]                    ; 1E9A _ 8B. 45, E4
        add     eax, edx                                ; 1E9D _ 01. D0
        mov     dword [ebp-4H], eax                     ; 1E9F _ 89. 45, FC
        mov     eax, dword [ebp+0CH]                    ; 1EA2 _ 8B. 45, 0C
        cmp     eax, dword [ebp-4H]                     ; 1EA5 _ 3B. 45, FC
        jg      ?_120                                   ; 1EA8 _ 7F, 70
        mov     eax, dword [ebp-4H]                     ; 1EAA _ 8B. 45, FC
        cmp     eax, dword [ebp+14H]                    ; 1EAD _ 3B. 45, 14
        jge     ?_120                                   ; 1EB0 _ 7D, 68
        mov     eax, dword [ebp+10H]                    ; 1EB2 _ 8B. 45, 10
        cmp     eax, dword [ebp-8H]                     ; 1EB5 _ 3B. 45, F8
        jg      ?_120                                   ; 1EB8 _ 7F, 60
        mov     eax, dword [ebp-8H]                     ; 1EBA _ 8B. 45, F8
        cmp     eax, dword [ebp+18H]                    ; 1EBD _ 3B. 45, 18
        jge     ?_120                                   ; 1EC0 _ 7D, 58
        mov     eax, dword [ebp-10H]                    ; 1EC2 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 1EC5 _ 8B. 40, 04
        imul    eax, dword [ebp-18H]                    ; 1EC8 _ 0F AF. 45, E8
        mov     edx, eax                                ; 1ECC _ 89. C2
        mov     eax, dword [ebp-1CH]                    ; 1ECE _ 8B. 45, E4
        add     eax, edx                                ; 1ED1 _ 01. D0
        mov     edx, eax                                ; 1ED3 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 1ED5 _ 8B. 45, F4
        add     eax, edx                                ; 1ED8 _ 01. D0
        movzx   eax, byte [eax]                         ; 1EDA _ 0F B6. 00
        mov     byte [ebp-21H], al                      ; 1EDD _ 88. 45, DF
        movzx   edx, byte [ebp-21H]                     ; 1EE0 _ 0F B6. 55, DF
        mov     eax, dword [ebp-10H]                    ; 1EE4 _ 8B. 45, F0
        mov     eax, dword [eax+14H]                    ; 1EE7 _ 8B. 40, 14
        cmp     edx, eax                                ; 1EEA _ 39. C2
        jz      ?_120                                   ; 1EEC _ 74, 2C
        mov     eax, dword [ebp+8H]                     ; 1EEE _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 1EF1 _ 8B. 40, 04
        sub     eax, 1                                  ; 1EF4 _ 83. E8, 01
        cmp     dword [ebp-4H], eax                     ; 1EF7 _ 39. 45, FC
        jg      ?_120                                   ; 1EFA _ 7F, 1E
        mov     eax, dword [ebp+8H]                     ; 1EFC _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 1EFF _ 8B. 40, 04
        imul    eax, dword [ebp-8H]                     ; 1F02 _ 0F AF. 45, F8
        mov     edx, eax                                ; 1F06 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 1F08 _ 8B. 45, FC
        add     eax, edx                                ; 1F0B _ 01. D0
        mov     edx, eax                                ; 1F0D _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 1F0F _ 8B. 45, EC
        add     edx, eax                                ; 1F12 _ 01. C2
        movzx   eax, byte [ebp-21H]                     ; 1F14 _ 0F B6. 45, DF
        mov     byte [edx], al                          ; 1F18 _ 88. 02
?_120:  add     dword [ebp-1CH], 1                      ; 1F1A _ 83. 45, E4, 01
?_121:  mov     eax, dword [ebp-10H]                    ; 1F1E _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 1F21 _ 8B. 40, 04
        cmp     dword [ebp-1CH], eax                    ; 1F24 _ 39. 45, E4
        jl      ?_119                                   ; 1F27 _ 0F 8C, FFFFFF67
        add     dword [ebp-18H], 1                      ; 1F2D _ 83. 45, E8, 01
?_122:  mov     eax, dword [ebp-10H]                    ; 1F31 _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 1F34 _ 8B. 40, 08
        cmp     dword [ebp-18H], eax                    ; 1F37 _ 39. 45, E8
        jl      ?_118                                   ; 1F3A _ 0F 8C, FFFFFF3A
        add     dword [ebp-20H], 1                      ; 1F40 _ 83. 45, E0, 01
?_123:  mov     eax, dword [ebp+8H]                     ; 1F44 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1F47 _ 8B. 40, 0C
        cmp     dword [ebp-20H], eax                    ; 1F4A _ 39. 45, E0
        jle     ?_117                                   ; 1F4D _ 0F 8E, FFFFFF04
        nop                                             ; 1F53 _ 90
        leave                                           ; 1F54 _ C9
        ret                                             ; 1F55 _ C3
; sheet_refreshsub End of function


SECTION .rodata align=1 noexecute                       ; section number 2, const

?_124:                                                  ; byte
        db 77H, 69H, 6EH, 64H, 64H, 6FH, 77H, 6EH       ; 0000 _ winddown
        db 00H                                          ; 0008 _ .

?_125:                                                  ; byte
        db 69H, 6DH, 70H, 72H, 6FH, 76H, 65H, 20H       ; 0009 _ improve 
        db 73H, 74H, 72H, 69H, 6EH, 67H, 20H, 73H       ; 0011 _ string s
        db 68H, 6FH, 77H, 69H, 6EH, 67H, 21H, 00H       ; 0019 _ howing!.

?_126:                                                  ; byte
        db 70H, 61H, 67H, 65H, 20H, 69H, 73H, 3AH       ; 0021 _ page is:
        db 20H, 00H                                     ; 0029 _  .

?_127:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 002B _ BaseAddr
        db 4CH, 3AH, 20H, 00H                           ; 0033 _ L: .

?_128:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0037 _ BaseAddr
        db 48H, 3AH, 20H, 00H                           ; 003F _ H: .

?_129:                                                  ; byte
        db 4CH, 65H, 6EH, 67H, 74H, 68H, 4CH, 6FH       ; 0043 _ LengthLo
        db 77H, 3AH, 20H, 00H                           ; 004B _ w: .

?_130:                                                  ; byte
        db 4CH, 65H, 6EH, 67H, 74H, 68H, 48H, 69H       ; 004F _ LengthHi
        db 67H, 68H, 3AH, 20H, 00H                      ; 0057 _ gh: .

?_131:                                                  ; byte
        db 54H, 79H, 70H, 65H, 3AH, 20H, 00H            ; 005C _ Type: .

?_132:                                                  ; byte
        db 57H, 65H, 6CH, 65H, 63H, 6FH, 6DH, 65H       ; 0063 _ Welecome
        db 20H, 74H, 6FH, 00H                           ; 006B _  to.

?_133:                                                  ; byte
        db 6DH, 79H, 4FH, 53H, 00H                      ; 006F _ myOS.


SECTION .eh_frame align=4 noexecute                     ; section number 3, const

        db 14H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0000 _ ........
        db 01H, 7AH, 52H, 00H, 01H, 7CH, 08H, 01H       ; 0008 _ .zR..|..
        db 1BH, 0CH, 04H, 04H, 88H, 01H, 00H, 00H       ; 0010 _ ........
        db 18H, 00H, 00H, 00H, 1CH, 00H, 00H, 00H       ; 0018 _ ........
        dd CMain-$-20H                                  ; 0020 _ 00000000 (rel)
        dd 000003A2H, 080E4100H                         ; 0024 _ 930 135151872 
        dd 0D420285H, 03834405H                         ; 002C _ 222429829 58934277 
        dd 0000001CH, 00000038H                         ; 0034 _ 28 56 
        dd CMain-$+366H                                 ; 003C _ 000003A2 (rel)
        dd 00000021H, 080E4100H                         ; 0040 _ 33 135151872 
        dd 0D420285H, 0CC55D05H                         ; 0048 _ 222429829 214260997 
        dd 00000404H, 0000001CH                         ; 0050 _ 1028 28 
        dd 00000058H                                    ; 0058 _ 88 
        dd CMain-$+367H                                 ; 005C _ 000003C3 (rel)
        dd 0000001DH, 080E4100H                         ; 0060 _ 29 135151872 
        dd 0D420285H, 0CC55905H                         ; 0068 _ 222429829 214259973 
        dd 00000404H, 0000001CH                         ; 0070 _ 1028 28 
        dd 00000078H                                    ; 0078 _ 120 
        dd CMain-$+364H                                 ; 007C _ 000003E0 (rel)
        dd 000000ACH, 080E4100H                         ; 0080 _ 172 135151872 
        dd 0D420285H, 0C5A80205H                        ; 0088 _ 222429829 -978845179 
        dd 0004040CH, 0000001CH                         ; 0090 _ 263180 28 
        dd 00000098H                                    ; 0098 _ 152 
        dd CMain-$+3F0H                                 ; 009C _ 0000048C (rel)
        dd 00000052H, 080E4100H                         ; 00A0 _ 82 135151872 
        dd 0D420285H, 0C54E0205H                        ; 00A8 _ 222429829 -984743419 
        dd 0004040CH, 00000020H                         ; 00B0 _ 263180 32 
        dd 000000B8H                                    ; 00B8 _ 184 
        dd CMain-$+422H                                 ; 00BC _ 000004DE (rel)
        dd 00000084H, 080E4100H                         ; 00C0 _ 132 135151872 
        dd 0D420285H, 03834405H                         ; 00C8 _ 222429829 58934277 
        dd 0C3C57C02H, 0004040CH                        ; 00D0 _ -1010467838 263180 
        dd 0000001CH, 000000DCH                         ; 00D8 _ 28 220 
        dd CMain-$+482H                                 ; 00E0 _ 00000562 (rel)
        dd 00000191H, 080E4100H                         ; 00E4 _ 401 135151872 
        dd 0D420285H, 018D0305H                         ; 00EC _ 222429829 26018565 
        dd 04040CC5H, 0000001CH                         ; 00F4 _ 67374277 28 
        dd 000000FCH                                    ; 00FC _ 252 
        dd CMain-$+5F3H                                 ; 0100 _ 000006F3 (rel)
        dd 000000DAH, 080E4100H                         ; 0104 _ 218 135151872 
        dd 0D420285H, 0C5D60205H                        ; 010C _ 222429829 -975830523 
        dd 0004040CH, 00000020H                         ; 0114 _ 263180 32 
        dd 0000011CH                                    ; 011C _ 284 
        dd CMain-$+6ADH                                 ; 0120 _ 000007CD (rel)
        dd 0000006FH, 080E4100H                         ; 0124 _ 111 135151872 
        dd 0D420285H, 03834405H                         ; 012C _ 222429829 58934277 
        dd 41C36602H, 04040CC5H                         ; 0134 _ 1103324674 67374277 
        dd 0000001CH, 00000140H                         ; 013C _ 28 320 
        dd CMain-$+6F8H                                 ; 0144 _ 0000083C (rel)
        dd 0000005FH, 080E4100H                         ; 0148 _ 95 135151872 
        dd 0D420285H, 0C55B0205H                        ; 0150 _ 222429829 -983891451 
        dd 0004040CH, 0000001CH                         ; 0158 _ 263180 28 
        dd 00000160H                                    ; 0160 _ 352 
        dd CMain-$+737H                                 ; 0164 _ 0000089B (rel)
        dd 00000024H, 080E4100H                         ; 0168 _ 36 135151872 
        dd 0D420285H, 0CC56005H                         ; 0170 _ 222429829 214261765 
        dd 00000404H, 0000001CH                         ; 0178 _ 1028 28 
        dd 00000180H                                    ; 0180 _ 384 
        dd CMain-$+73BH                                 ; 0184 _ 000008BF (rel)
        dd 00000048H, 080E4100H                         ; 0188 _ 72 135151872 
        dd 0D420285H, 0C5440205H                        ; 0190 _ 222429829 -985398779 
        dd 0004040CH, 0000001CH                         ; 0198 _ 263180 28 
        dd 000001A0H                                    ; 01A0 _ 416 
        dd CMain-$+763H                                 ; 01A4 _ 00000907 (rel)
        dd 0000007DH, 080E4100H                         ; 01A8 _ 125 135151872 
        dd 0D420285H, 0C5790205H                        ; 01B0 _ 222429829 -981925371 
        dd 0004040CH, 0000001CH                         ; 01B8 _ 263180 28 
        dd 000001C0H                                    ; 01C0 _ 448 
        dd ?_028-$+1C4H                                 ; 01C4 _ 00000984 (rel)
        dd 00000020H, 080E4100H                         ; 01C8 _ 32 135151872 
        dd 0D420285H, 0CC55C05H                         ; 01D0 _ 222429829 214260741 
        dd 00000404H, 0000001CH                         ; 01D8 _ 1028 28 
        dd 000001E0H                                    ; 01E0 _ 480 
        dd ?_028-$+1E4H                                 ; 01E4 _ 000009A4 (rel)
        dd 00000031H, 080E4100H                         ; 01E8 _ 49 135151872 
        dd 0D420285H, 0CC56D05H                         ; 01F0 _ 222429829 214265093 
        dd 00000404H, 0000001CH                         ; 01F8 _ 1028 28 
        dd 00000200H                                    ; 0200 _ 512 
        dd CMain-$+7D1H                                 ; 0204 _ 000009D5 (rel)
        dd 0000003EH, 080E4100H                         ; 0208 _ 62 135151872 
        dd 0D420285H, 0CC57A05H                         ; 0210 _ 222429829 214268421 
        dd 00000404H, 0000001CH                         ; 0218 _ 1028 28 
        dd 00000220H                                    ; 0220 _ 544 
        dd CMain-$+7EFH                                 ; 0224 _ 00000A13 (rel)
        dd 0000004FH, 080E4100H                         ; 0228 _ 79 135151872 
        dd 0D420285H, 0C54B0205H                        ; 0230 _ 222429829 -984940027 
        dd 0004040CH, 0000001CH                         ; 0238 _ 263180 28 
        dd 00000240H                                    ; 0240 _ 576 
        dd CMain-$+81EH                                 ; 0244 _ 00000A62 (rel)
        dd 0000003EH, 080E4100H                         ; 0248 _ 62 135151872 
        dd 0D420285H, 0CC57A05H                         ; 0250 _ 222429829 214268421 
        dd 00000404H, 0000001CH                         ; 0258 _ 1028 28 
        dd 00000260H                                    ; 0260 _ 608 
        dd intHandlerFromC-$+264H                       ; 0264 _ 00000AA0 (rel)
        dd 00000080H, 080E4100H                         ; 0268 _ 128 135151872 
        dd 0D420285H, 0C57C0205H                        ; 0270 _ 222429829 -981728763 
        dd 0004040CH, 0000001CH                         ; 0278 _ 263180 28 
        dd 00000280H                                    ; 0280 _ 640 
        dd CMain-$+89CH                                 ; 0284 _ 00000B20 (rel)
        dd 00000070H, 080E4100H                         ; 0288 _ 112 135151872 
        dd 0D420285H, 0C56C0205H                        ; 0290 _ 222429829 -982777339 
        dd 0004040CH, 0000001CH                         ; 0298 _ 263180 28 
        dd 000002A0H                                    ; 02A0 _ 672 
        dd CMain-$+8ECH                                 ; 02A4 _ 00000B90 (rel)
        dd 00000015H, 080E4100H                         ; 02A8 _ 21 135151872 
        dd 0D420285H, 0CC55105H                         ; 02B0 _ 222429829 214257925 
        dd 00000404H, 0000001CH                         ; 02B8 _ 1028 28 
        dd 000002C0H                                    ; 02C0 _ 704 
        dd CMain-$+8E1H                                 ; 02C4 _ 00000BA5 (rel)
        dd 0000013FH, 080E4100H                         ; 02C8 _ 319 135151872 
        dd 0D420285H, 013B0305H                         ; 02D0 _ 222429829 20644613 
        dd 04040CC5H, 0000001CH                         ; 02D8 _ 67374277 28 
        dd 000002E0H                                    ; 02E0 _ 736 
        dd CMain-$+0A00H                                ; 02E4 _ 00000CE4 (rel)
        dd 00000109H, 080E4100H                         ; 02E8 _ 265 135151872 
        dd 0D420285H, 01050305H                         ; 02F0 _ 222429829 17105669 
        dd 04040CC5H, 0000001CH                         ; 02F8 _ 67374277 28 
        dd 00000300H                                    ; 0300 _ 768 
        dd CMain-$+0AE9H                                ; 0304 _ 00000DED (rel)
        dd 0000006DH, 080E4100H                         ; 0308 _ 109 135151872 
        dd 0D420285H, 0C5690205H                        ; 0310 _ 222429829 -982973947 
        dd 0004040CH, 0000001CH                         ; 0318 _ 263180 28 
        dd 00000320H                                    ; 0320 _ 800 
        dd CMain-$+0B36H                                ; 0324 _ 00000E5A (rel)
        dd 00000266H, 080E4100H                         ; 0328 _ 614 135151872 
        dd 0D420285H, 02620305H                         ; 0330 _ 222429829 39977733 
        dd 04040CC5H, 00000020H                         ; 0338 _ 67374277 32 
        dd 00000340H                                    ; 0340 _ 832 
        dd CMain-$+0D7CH                                ; 0344 _ 000010C0 (rel)
        dd 0000021DH, 080E4100H                         ; 0348 _ 541 135151872 
        dd 0D420285H, 03834105H                         ; 0350 _ 222429829 58933509 
        dd 0C5021803H, 04040CC3H                        ; 0358 _ -989718525 67374275 
        dd 00000020H, 00000364H                         ; 0360 _ 32 868 
        dd CMain-$+0F75H                                ; 0368 _ 000012DD (rel)
        dd 0000023FH, 080E4100H                         ; 036C _ 575 135151872 
        dd 0D420285H, 03834405H                         ; 0374 _ 222429829 58934277 
        dd 0C5023703H, 04040CC3H                        ; 037C _ -989710589 67374275 
        dd 0000001CH, 00000388H                         ; 0384 _ 28 904 
        dd CMain-$+1190H                                ; 038C _ 0000151C (rel)
        dd 000000C0H, 080E4100H                         ; 0390 _ 192 135151872 
        dd 0D420285H, 0C5BC0205H                        ; 0398 _ 222429829 -977534459 
        dd 0004040CH, 00000014H                         ; 03A0 _ 263180 20 
        dd 00000000H, 00527A01H                         ; 03A8 _ 0 5405185 
        dd 01087C01H, 04040C1BH                         ; 03B0 _ 17333249 67374107 
        dd 00000188H, 0000001CH                         ; 03B8 _ 392 28 
        dd 0000001CH                                    ; 03C0 _ 28 
        dd CMain-$+1218H                                ; 03C4 _ 000015DC (rel)
        dd 0000002DH, 080E4100H                         ; 03C8 _ 45 135151872 
        dd 0D420285H, 0CC56905H                         ; 03D0 _ 222429829 214264069 
        dd 00000404H, 0000001CH                         ; 03D8 _ 1028 28 
        dd 0000003CH                                    ; 03E0 _ 60 
        dd CMain-$+1225H                                ; 03E4 _ 00001609 (rel)
        dd 00000039H, 080E4100H                         ; 03E8 _ 57 135151872 
        dd 0D420285H, 0CC57505H                         ; 03F0 _ 222429829 214267141 
        dd 00000404H, 0000001CH                         ; 03F8 _ 1028 28 
        dd 0000005CH                                    ; 0400 _ 92 
        dd CMain-$+123EH                                ; 0404 _ 00001642 (rel)
        dd 000000ACH, 080E4100H                         ; 0408 _ 172 135151872 
        dd 0D420285H, 0C5A80205H                        ; 0410 _ 222429829 -978845179 
        dd 0004040CH, 00000024H                         ; 0418 _ 263180 36 
        dd 0000007CH                                    ; 0420 _ 124 
        dd CMain-$+12CAH                                ; 0424 _ 000016EE (rel)
        dd 00000216H, 080E4100H                         ; 0428 _ 534 135151872 
        dd 0D420285H, 03834405H                         ; 0430 _ 222429829 58934277 
        dd 0C3020D03H, 040CC541H                        ; 0438 _ -1023275773 67945793 
        dd 00000004H, 0000001CH                         ; 0440 _ 4 28 
        dd 000000A4H                                    ; 0448 _ 164 
        dd CMain-$+14B8H                                ; 044C _ 00001904 (rel)
        dd 0000002CH, 080E4100H                         ; 0450 _ 44 135151872 
        dd 0D420285H, 0CC56805H                         ; 0458 _ 222429829 214263813 
        dd 00000404H, 0000001CH                         ; 0460 _ 1028 28 
        dd 000000C4H                                    ; 0468 _ 196 
        dd CMain-$+14C4H                                ; 046C _ 00001930 (rel)
        dd 0000002FH, 080E4100H                         ; 0470 _ 47 135151872 
        dd 0D420285H, 0CC56B05H                         ; 0478 _ 222429829 214264581 
        dd 00000404H, 00000014H                         ; 0480 _ 1028 20 
        dd 00000000H, 00527A01H                         ; 0488 _ 0 5405185 
        dd 01087C01H, 04040C1BH                         ; 0490 _ 17333249 67374107 
        dd 00000188H, 0000001CH                         ; 0498 _ 392 28 
        dd 0000001CH                                    ; 04A0 _ 28 
        dd CMain-$+14BBH                                ; 04A4 _ 0000195F (rel)
        dd 0000007FH, 080E4100H                         ; 04A8 _ 127 135151872 
        dd 0D420285H, 0C57B0205H                        ; 04B0 _ 222429829 -981794299 
        dd 0004040CH, 0000001CH                         ; 04B8 _ 263180 28 
        dd 0000003CH                                    ; 04C0 _ 60 
        dd CMain-$+151AH                                ; 04C4 _ 000019DE (rel)
        dd 00000076H, 080E4100H                         ; 04C8 _ 118 135151872 
        dd 0D420285H, 0C5720205H                        ; 04D0 _ 222429829 -982384123 
        dd 0004040CH, 0000001CH                         ; 04D8 _ 263180 28 
        dd 0000005CH                                    ; 04E0 _ 92 
        dd CMain-$+1570H                                ; 04E4 _ 00001A54 (rel)
        dd 00000029H, 080E4100H                         ; 04E8 _ 41 135151872 
        dd 0D420285H, 0CC56505H                         ; 04F0 _ 222429829 214263045 
        dd 00000404H, 00000020H                         ; 04F8 _ 1028 32 
        dd 0000007CH                                    ; 0500 _ 124 
        dd CMain-$+1579H                                ; 0504 _ 00001A7D (rel)
        dd 00000251H, 080E4100H                         ; 0508 _ 593 135151872 
        dd 0D420285H, 03834405H                         ; 0510 _ 222429829 58934277 
        dd 0C5024903H, 04040CC3H                        ; 0518 _ -989705981 67374275 
        dd 00000024H, 000000A0H                         ; 0520 _ 36 160 
        dd CMain-$+17A6H                                ; 0528 _ 00001CCE (rel)
        dd 0000005BH, 080E4100H                         ; 052C _ 91 135151872 
        dd 0D420285H, 03864205H                         ; 0534 _ 222429829 59130373 
        dd 53020483H, 41C641C3H                         ; 053C _ 1392641155 1103512003 
        dd 04040CC5H, 0000001CH                         ; 0544 _ 67374277 28 
        dd 000000C8H                                    ; 054C _ 200 
        dd ?_081-$+550H                                 ; 0550 _ 00001D29 (rel)
        dd 00000085H, 080E4100H                         ; 0554 _ 133 135151872 
        dd 0D420285H, 0C5810205H                        ; 055C _ 222429829 -981401083 
        dd 0004040CH, 0000001CH                         ; 0564 _ 263180 28 
        dd 000000E8H                                    ; 056C _ 232 
        dd ?_083-$+570H                                 ; 0570 _ 00001DAE (rel)
        dd 0000008FH, 080E4100H                         ; 0574 _ 143 135151872 
        dd 0D420285H, 0C58B0205H                        ; 057C _ 222429829 -980745723 
        dd 0004040CH, 0000001CH                         ; 0584 _ 263180 28 
        dd 00000108H                                    ; 058C _ 264 
        dd CMain-$+18ADH                                ; 0590 _ 00001E3D (rel)
        dd 00000119H, 080E4100H                         ; 0594 _ 281 135151872 
        dd 0D420285H, 01150305H                         ; 059C _ 222429829 18154245 
        dd 04040CC5H                                    ; 05A4 _ 67374277 


SECTION .data   align=32 noexecute                      ; section number 4, data

keyval:                                                 ; byte
        db 30H, 78H                                     ; 0000 _ 0x

?_134:  db 00H                                          ; 0002 _ .

?_135:  db 00H, 00H, 00H, 00H, 00H                      ; 0003 _ .....

memman: dd 00100000H, 00000000H                         ; 0008 _ 1048576 0 
        dd 00000000H, 00000000H                         ; 0010 _ 0 0 
        dd 00000000H, 00000000H                         ; 0018 _ 0 0 

table_rgb.1677:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 00H, 0FFH     ; 0020 _ ........
        db 00H, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH   ; 0028 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0030 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0038 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 0040 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 0048 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0050 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0058 _ ........

cursor.1734:                                            ; byte
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

closebtn.1865:                                          ; byte
        db 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 0160 _ OOOOOOOO
        db 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 40H       ; 0168 _ OOOOOOO@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 51H       ; 0170 _ OQQQQQQQ
        db 51H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 0178 _ QQQQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 51H       ; 0180 _ OQQQQQQQ
        db 51H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 0188 _ QQQQQQ$@
        db 4FH, 51H, 51H, 51H, 40H, 40H, 51H, 51H       ; 0190 _ OQQQ@@QQ
        db 51H, 51H, 40H, 40H, 51H, 51H, 24H, 40H       ; 0198 _ QQ@@QQ$@
        db 4FH, 51H, 51H, 51H, 51H, 40H, 40H, 51H       ; 01A0 _ OQQQQ@@Q
        db 51H, 40H, 40H, 51H, 51H, 51H, 24H, 40H       ; 01A8 _ Q@@QQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 40H, 40H       ; 01B0 _ OQQQQQ@@
        db 40H, 40H, 51H, 51H, 51H, 51H, 24H, 40H       ; 01B8 _ @@QQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 40H       ; 01C0 _ OQQQQQQ@
        db 40H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 01C8 _ @QQQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 40H, 40H       ; 01D0 _ OQQQQQ@@
        db 40H, 40H, 51H, 51H, 51H, 51H, 24H, 40H       ; 01D8 _ @@QQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 40H, 40H, 51H       ; 01E0 _ OQQQQ@@Q
        db 51H, 40H, 40H, 51H, 51H, 51H, 24H, 40H       ; 01E8 _ Q@@QQQ$@
        db 4FH, 51H, 51H, 51H, 40H, 40H, 51H, 51H       ; 01F0 _ OQQQ@@QQ
        db 51H, 51H, 40H, 40H, 51H, 51H, 24H, 40H       ; 01F8 _ QQ@@QQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 51H       ; 0200 _ OQQQQQQQ
        db 51H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 0208 _ QQQQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 51H       ; 0210 _ OQQQQQQQ
        db 51H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 0218 _ QQQQQQ$@
        db 4FH, 24H, 24H, 24H, 24H, 24H, 24H, 24H       ; 0220 _ O$$$$$$$
        db 24H, 24H, 24H, 24H, 24H, 24H, 24H, 40H       ; 0228 _ $$$$$$$@
        db 40H, 40H, 40H, 40H, 40H, 40H, 40H, 40H       ; 0230 _ @@@@@@@@
        db 40H, 40H, 40H, 40H, 40H, 40H, 40H, 40H       ; 0238 _ @@@@@@@@


SECTION .bss    align=32 noexecute                      ; section number 5, bss

bootInfo:                                               ; qword
        resb    4                                       ; 0000

?_136:  resw    1                                       ; 0004

?_137:  resw    1                                       ; 0006

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

str.1778:                                               ; byte
        resb    1                                       ; 0208

?_138:  resb    9                                       ; 0209

?_139:  resb    1                                       ; 0212


