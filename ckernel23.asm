; Disassembly of file: /home/bobkuo/eclipse-workspace/nasmCode/ckernel23.o
; Thu Apr 30 15:05:12 2020
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
        movzx   eax, word [?_135]                       ; 001F _ 0F B7. 05, 00000004(d)
        cwde                                            ; 0026 _ 98
        mov     dword [xsize], eax                      ; 0027 _ A3, 00000200(d)
        movzx   eax, word [?_136]                       ; 002C _ 0F B7. 05, 00000006(d)
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
        push    ?_123                                   ; 01FB _ 68, 00000000(d)
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
        sub     esp, 4                                  ; 0384 _ 83. EC, 04
        push    dword [ebp-24H]                         ; 0387 _ FF. 75, DC
        push    dword [ebp-28H]                         ; 038A _ FF. 75, D8
        push    dword [ebp-18H]                         ; 038D _ FF. 75, E8
        call    show_mouse_info                         ; 0390 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0395 _ 83. C4, 10
        jmp     ?_001                                   ; 0398 _ E9, FFFFFEC1

initBootInfo:; Function begin
        push    ebp                                     ; 039D _ 55
        mov     ebp, esp                                ; 039E _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 03A0 _ 8B. 45, 08
        mov     dword [eax], 655360                     ; 03A3 _ C7. 00, 000A0000
        mov     eax, dword [ebp+8H]                     ; 03A9 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 320                      ; 03AC _ 66: C7. 40, 04, 0140
        mov     eax, dword [ebp+8H]                     ; 03B2 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 200                      ; 03B5 _ 66: C7. 40, 06, 00C8
        nop                                             ; 03BB _ 90
        pop     ebp                                     ; 03BC _ 5D
        ret                                             ; 03BD _ C3
; initBootInfo End of function

init_palette:; Function begin
        push    ebp                                     ; 03BE _ 55
        mov     ebp, esp                                ; 03BF _ 89. E5
        sub     esp, 8                                  ; 03C1 _ 83. EC, 08
        sub     esp, 4                                  ; 03C4 _ 83. EC, 04
        push    table_rgb.1678                          ; 03C7 _ 68, 00000020(d)
        push    15                                      ; 03CC _ 6A, 0F
        push    0                                       ; 03CE _ 6A, 00
        call    set_palette                             ; 03D0 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03D5 _ 83. C4, 10
        nop                                             ; 03D8 _ 90
        leave                                           ; 03D9 _ C9
        ret                                             ; 03DA _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 03DB _ 55
        mov     ebp, esp                                ; 03DC _ 89. E5
        sub     esp, 24                                 ; 03DE _ 83. EC, 18
        call    io_load_eflags                          ; 03E1 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 03E6 _ 89. 45, F4
        call    io_cli                                  ; 03E9 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 03EE _ 83. EC, 08
        push    dword [ebp+8H]                          ; 03F1 _ FF. 75, 08
        push    968                                     ; 03F4 _ 68, 000003C8
        call    io_out8                                 ; 03F9 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03FE _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 0401 _ 8B. 45, 08
        mov     dword [ebp-10H], eax                    ; 0404 _ 89. 45, F0
        jmp     ?_005                                   ; 0407 _ EB, 65

?_004:  mov     eax, dword [ebp+10H]                    ; 0409 _ 8B. 45, 10
        movzx   eax, byte [eax]                         ; 040C _ 0F B6. 00
        shr     al, 2                                   ; 040F _ C0. E8, 02
        movzx   eax, al                                 ; 0412 _ 0F B6. C0
        sub     esp, 8                                  ; 0415 _ 83. EC, 08
        push    eax                                     ; 0418 _ 50
        push    969                                     ; 0419 _ 68, 000003C9
        call    io_out8                                 ; 041E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0423 _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 0426 _ 8B. 45, 10
        add     eax, 1                                  ; 0429 _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 042C _ 0F B6. 00
        shr     al, 2                                   ; 042F _ C0. E8, 02
        movzx   eax, al                                 ; 0432 _ 0F B6. C0
        sub     esp, 8                                  ; 0435 _ 83. EC, 08
        push    eax                                     ; 0438 _ 50
        push    969                                     ; 0439 _ 68, 000003C9
        call    io_out8                                 ; 043E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0443 _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 0446 _ 8B. 45, 10
        add     eax, 2                                  ; 0449 _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 044C _ 0F B6. 00
        shr     al, 2                                   ; 044F _ C0. E8, 02
        movzx   eax, al                                 ; 0452 _ 0F B6. C0
        sub     esp, 8                                  ; 0455 _ 83. EC, 08
        push    eax                                     ; 0458 _ 50
        push    969                                     ; 0459 _ 68, 000003C9
        call    io_out8                                 ; 045E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0463 _ 83. C4, 10
        add     dword [ebp+10H], 3                      ; 0466 _ 83. 45, 10, 03
        add     dword [ebp-10H], 1                      ; 046A _ 83. 45, F0, 01
?_005:  mov     eax, dword [ebp-10H]                    ; 046E _ 8B. 45, F0
        cmp     eax, dword [ebp+0CH]                    ; 0471 _ 3B. 45, 0C
        jle     ?_004                                   ; 0474 _ 7E, 93
        sub     esp, 12                                 ; 0476 _ 83. EC, 0C
        push    dword [ebp-0CH]                         ; 0479 _ FF. 75, F4
        call    io_store_eflags                         ; 047C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0481 _ 83. C4, 10
        nop                                             ; 0484 _ 90
        leave                                           ; 0485 _ C9
        ret                                             ; 0486 _ C3
; set_palette End of function

boxfill8:; Function begin
        push    ebp                                     ; 0487 _ 55
        mov     ebp, esp                                ; 0488 _ 89. E5
        sub     esp, 20                                 ; 048A _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 048D _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 0490 _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 0493 _ 8B. 45, 18
        mov     dword [ebp-4H], eax                     ; 0496 _ 89. 45, FC
        jmp     ?_009                                   ; 0499 _ EB, 33

?_006:  mov     eax, dword [ebp+14H]                    ; 049B _ 8B. 45, 14
        mov     dword [ebp-8H], eax                     ; 049E _ 89. 45, F8
        jmp     ?_008                                   ; 04A1 _ EB, 1F

?_007:  mov     eax, dword [ebp-4H]                     ; 04A3 _ 8B. 45, FC
        imul    eax, dword [ebp+0CH]                    ; 04A6 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 04AA _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 04AC _ 8B. 45, F8
        add     eax, edx                                ; 04AF _ 01. D0
        mov     edx, eax                                ; 04B1 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 04B3 _ 8B. 45, 08
        add     edx, eax                                ; 04B6 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 04B8 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 04BC _ 88. 02
        add     dword [ebp-8H], 1                       ; 04BE _ 83. 45, F8, 01
?_008:  mov     eax, dword [ebp-8H]                     ; 04C2 _ 8B. 45, F8
        cmp     eax, dword [ebp+1CH]                    ; 04C5 _ 3B. 45, 1C
        jle     ?_007                                   ; 04C8 _ 7E, D9
        add     dword [ebp-4H], 1                       ; 04CA _ 83. 45, FC, 01
?_009:  mov     eax, dword [ebp-4H]                     ; 04CE _ 8B. 45, FC
        cmp     eax, dword [ebp+20H]                    ; 04D1 _ 3B. 45, 20
        jle     ?_006                                   ; 04D4 _ 7E, C5
        nop                                             ; 04D6 _ 90
        leave                                           ; 04D7 _ C9
        ret                                             ; 04D8 _ C3
; boxfill8 End of function

showString:; Function begin
        push    ebp                                     ; 04D9 _ 55
        mov     ebp, esp                                ; 04DA _ 89. E5
        push    ebx                                     ; 04DC _ 53
        sub     esp, 36                                 ; 04DD _ 83. EC, 24
        mov     eax, dword [ebp+18H]                    ; 04E0 _ 8B. 45, 18
        mov     byte [ebp-1CH], al                      ; 04E3 _ 88. 45, E4
        mov     eax, dword [ebp+10H]                    ; 04E6 _ 8B. 45, 10
        mov     dword [ebp-0CH], eax                    ; 04E9 _ 89. 45, F4
        jmp     ?_011                                   ; 04EC _ EB, 3E

?_010:  mov     eax, dword [ebp+1CH]                    ; 04EE _ 8B. 45, 1C
        movzx   eax, byte [eax]                         ; 04F1 _ 0F B6. 00
        movzx   eax, al                                 ; 04F4 _ 0F B6. C0
        shl     eax, 4                                  ; 04F7 _ C1. E0, 04
        lea     ebx, [systemFont+eax]                   ; 04FA _ 8D. 98, 00000000(d)
        movsx   ecx, byte [ebp-1CH]                     ; 0500 _ 0F BE. 4D, E4
        mov     eax, dword [ebp+0CH]                    ; 0504 _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 0507 _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 050A _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 050D _ 8B. 00
        sub     esp, 8                                  ; 050F _ 83. EC, 08
        push    ebx                                     ; 0512 _ 53
        push    ecx                                     ; 0513 _ 51
        push    dword [ebp+14H]                         ; 0514 _ FF. 75, 14
        push    dword [ebp+10H]                         ; 0517 _ FF. 75, 10
        push    edx                                     ; 051A _ 52
        push    eax                                     ; 051B _ 50
        call    showChar8                               ; 051C _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0521 _ 83. C4, 20
        add     dword [ebp+1CH], 1                      ; 0524 _ 83. 45, 1C, 01
        add     dword [ebp+10H], 8                      ; 0528 _ 83. 45, 10, 08
?_011:  mov     eax, dword [ebp+1CH]                    ; 052C _ 8B. 45, 1C
        movzx   eax, byte [eax]                         ; 052F _ 0F B6. 00
        test    al, al                                  ; 0532 _ 84. C0
        jnz     ?_010                                   ; 0534 _ 75, B8
        mov     eax, dword [ebp+14H]                    ; 0536 _ 8B. 45, 14
        add     eax, 16                                 ; 0539 _ 83. C0, 10
        sub     esp, 8                                  ; 053C _ 83. EC, 08
        push    eax                                     ; 053F _ 50
        push    dword [ebp+10H]                         ; 0540 _ FF. 75, 10
        push    dword [ebp+14H]                         ; 0543 _ FF. 75, 14
        push    dword [ebp-0CH]                         ; 0546 _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 0549 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 054C _ FF. 75, 08
        call    sheet_refresh                           ; 054F _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0554 _ 83. C4, 20
        nop                                             ; 0557 _ 90
        mov     ebx, dword [ebp-4H]                     ; 0558 _ 8B. 5D, FC
        leave                                           ; 055B _ C9
        ret                                             ; 055C _ C3
; showString End of function

showChar8:; Function begin
        push    ebp                                     ; 055D _ 55
        mov     ebp, esp                                ; 055E _ 89. E5
        sub     esp, 20                                 ; 0560 _ 83. EC, 14
        mov     eax, dword [ebp+18H]                    ; 0563 _ 8B. 45, 18
        mov     byte [ebp-14H], al                      ; 0566 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 0569 _ C7. 45, FC, 00000000
        jmp     ?_021                                   ; 0570 _ E9, 0000016C

?_012:  mov     edx, dword [ebp-4H]                     ; 0575 _ 8B. 55, FC
        mov     eax, dword [ebp+1CH]                    ; 0578 _ 8B. 45, 1C
        add     eax, edx                                ; 057B _ 01. D0
        movzx   eax, byte [eax]                         ; 057D _ 0F B6. 00
        mov     byte [ebp-5H], al                       ; 0580 _ 88. 45, FB
        cmp     byte [ebp-5H], 0                        ; 0583 _ 80. 7D, FB, 00
        jns     ?_013                                   ; 0587 _ 79, 20
        mov     edx, dword [ebp+14H]                    ; 0589 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 058C _ 8B. 45, FC
        add     eax, edx                                ; 058F _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0591 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0595 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0597 _ 8B. 45, 10
        add     eax, edx                                ; 059A _ 01. D0
        mov     edx, eax                                ; 059C _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 059E _ 8B. 45, 08
        add     edx, eax                                ; 05A1 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 05A3 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 05A7 _ 88. 02
?_013:  movsx   eax, byte [ebp-5H]                      ; 05A9 _ 0F BE. 45, FB
        and     eax, 40H                                ; 05AD _ 83. E0, 40
        test    eax, eax                                ; 05B0 _ 85. C0
        jz      ?_014                                   ; 05B2 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 05B4 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 05B7 _ 8B. 45, FC
        add     eax, edx                                ; 05BA _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 05BC _ 0F AF. 45, 0C
        mov     edx, eax                                ; 05C0 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 05C2 _ 8B. 45, 10
        add     eax, edx                                ; 05C5 _ 01. D0
        lea     edx, [eax+1H]                           ; 05C7 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 05CA _ 8B. 45, 08
        add     edx, eax                                ; 05CD _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 05CF _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 05D3 _ 88. 02
?_014:  movsx   eax, byte [ebp-5H]                      ; 05D5 _ 0F BE. 45, FB
        and     eax, 20H                                ; 05D9 _ 83. E0, 20
        test    eax, eax                                ; 05DC _ 85. C0
        jz      ?_015                                   ; 05DE _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 05E0 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 05E3 _ 8B. 45, FC
        add     eax, edx                                ; 05E6 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 05E8 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 05EC _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 05EE _ 8B. 45, 10
        add     eax, edx                                ; 05F1 _ 01. D0
        lea     edx, [eax+2H]                           ; 05F3 _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 05F6 _ 8B. 45, 08
        add     edx, eax                                ; 05F9 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 05FB _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 05FF _ 88. 02
?_015:  movsx   eax, byte [ebp-5H]                      ; 0601 _ 0F BE. 45, FB
        and     eax, 10H                                ; 0605 _ 83. E0, 10
        test    eax, eax                                ; 0608 _ 85. C0
        jz      ?_016                                   ; 060A _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 060C _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 060F _ 8B. 45, FC
        add     eax, edx                                ; 0612 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0614 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0618 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 061A _ 8B. 45, 10
        add     eax, edx                                ; 061D _ 01. D0
        lea     edx, [eax+3H]                           ; 061F _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 0622 _ 8B. 45, 08
        add     edx, eax                                ; 0625 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0627 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 062B _ 88. 02
?_016:  movsx   eax, byte [ebp-5H]                      ; 062D _ 0F BE. 45, FB
        and     eax, 08H                                ; 0631 _ 83. E0, 08
        test    eax, eax                                ; 0634 _ 85. C0
        jz      ?_017                                   ; 0636 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 0638 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 063B _ 8B. 45, FC
        add     eax, edx                                ; 063E _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0640 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0644 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0646 _ 8B. 45, 10
        add     eax, edx                                ; 0649 _ 01. D0
        lea     edx, [eax+4H]                           ; 064B _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 064E _ 8B. 45, 08
        add     edx, eax                                ; 0651 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0653 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0657 _ 88. 02
?_017:  movsx   eax, byte [ebp-5H]                      ; 0659 _ 0F BE. 45, FB
        and     eax, 04H                                ; 065D _ 83. E0, 04
        test    eax, eax                                ; 0660 _ 85. C0
        jz      ?_018                                   ; 0662 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 0664 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0667 _ 8B. 45, FC
        add     eax, edx                                ; 066A _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 066C _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0670 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0672 _ 8B. 45, 10
        add     eax, edx                                ; 0675 _ 01. D0
        lea     edx, [eax+5H]                           ; 0677 _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 067A _ 8B. 45, 08
        add     edx, eax                                ; 067D _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 067F _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0683 _ 88. 02
?_018:  movsx   eax, byte [ebp-5H]                      ; 0685 _ 0F BE. 45, FB
        and     eax, 02H                                ; 0689 _ 83. E0, 02
        test    eax, eax                                ; 068C _ 85. C0
        jz      ?_019                                   ; 068E _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 0690 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0693 _ 8B. 45, FC
        add     eax, edx                                ; 0696 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0698 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 069C _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 069E _ 8B. 45, 10
        add     eax, edx                                ; 06A1 _ 01. D0
        lea     edx, [eax+6H]                           ; 06A3 _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 06A6 _ 8B. 45, 08
        add     edx, eax                                ; 06A9 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 06AB _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 06AF _ 88. 02
?_019:  movsx   eax, byte [ebp-5H]                      ; 06B1 _ 0F BE. 45, FB
        and     eax, 01H                                ; 06B5 _ 83. E0, 01
        test    eax, eax                                ; 06B8 _ 85. C0
        jz      ?_020                                   ; 06BA _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 06BC _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 06BF _ 8B. 45, FC
        add     eax, edx                                ; 06C2 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 06C4 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 06C8 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 06CA _ 8B. 45, 10
        add     eax, edx                                ; 06CD _ 01. D0
        lea     edx, [eax+7H]                           ; 06CF _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 06D2 _ 8B. 45, 08
        add     edx, eax                                ; 06D5 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 06D7 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 06DB _ 88. 02
?_020:  add     dword [ebp-4H], 1                       ; 06DD _ 83. 45, FC, 01
?_021:  cmp     dword [ebp-4H], 15                      ; 06E1 _ 83. 7D, FC, 0F
        jle     ?_012                                   ; 06E5 _ 0F 8E, FFFFFE8A
        nop                                             ; 06EB _ 90
        leave                                           ; 06EC _ C9
        ret                                             ; 06ED _ C3
; showChar8 End of function

init_mouse_cursor:; Function begin
        push    ebp                                     ; 06EE _ 55
        mov     ebp, esp                                ; 06EF _ 89. E5
        sub     esp, 20                                 ; 06F1 _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 06F4 _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 06F7 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 06FA _ C7. 45, FC, 00000000
        jmp     ?_028                                   ; 0701 _ E9, 000000B5

?_022:  mov     dword [ebp-8H], 0                       ; 0706 _ C7. 45, F8, 00000000
        jmp     ?_027                                   ; 070D _ E9, 0000009B

?_023:  mov     eax, dword [ebp-4H]                     ; 0712 _ 8B. 45, FC
        shl     eax, 4                                  ; 0715 _ C1. E0, 04
        mov     edx, eax                                ; 0718 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 071A _ 8B. 45, F8
        add     eax, edx                                ; 071D _ 01. D0
        add     eax, cursor.1735                        ; 071F _ 05, 00000060(d)
        movzx   eax, byte [eax]                         ; 0724 _ 0F B6. 00
        cmp     al, 42                                  ; 0727 _ 3C, 2A
        jnz     ?_024                                   ; 0729 _ 75, 19
        mov     eax, dword [ebp-4H]                     ; 072B _ 8B. 45, FC
        shl     eax, 4                                  ; 072E _ C1. E0, 04
        mov     edx, eax                                ; 0731 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0733 _ 8B. 45, F8
        add     eax, edx                                ; 0736 _ 01. D0
        mov     edx, eax                                ; 0738 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 073A _ 8B. 45, 08
        add     eax, edx                                ; 073D _ 01. D0
        mov     byte [eax], 0                           ; 073F _ C6. 00, 00
        jmp     ?_026                                   ; 0742 _ EB, 65

?_024:  mov     eax, dword [ebp-4H]                     ; 0744 _ 8B. 45, FC
        shl     eax, 4                                  ; 0747 _ C1. E0, 04
        mov     edx, eax                                ; 074A _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 074C _ 8B. 45, F8
        add     eax, edx                                ; 074F _ 01. D0
        add     eax, cursor.1735                        ; 0751 _ 05, 00000060(d)
        movzx   eax, byte [eax]                         ; 0756 _ 0F B6. 00
        cmp     al, 79                                  ; 0759 _ 3C, 4F
        jnz     ?_025                                   ; 075B _ 75, 19
        mov     eax, dword [ebp-4H]                     ; 075D _ 8B. 45, FC
        shl     eax, 4                                  ; 0760 _ C1. E0, 04
        mov     edx, eax                                ; 0763 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0765 _ 8B. 45, F8
        add     eax, edx                                ; 0768 _ 01. D0
        mov     edx, eax                                ; 076A _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 076C _ 8B. 45, 08
        add     eax, edx                                ; 076F _ 01. D0
        mov     byte [eax], 7                           ; 0771 _ C6. 00, 07
        jmp     ?_026                                   ; 0774 _ EB, 33

?_025:  mov     eax, dword [ebp-4H]                     ; 0776 _ 8B. 45, FC
        shl     eax, 4                                  ; 0779 _ C1. E0, 04
        mov     edx, eax                                ; 077C _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 077E _ 8B. 45, F8
        add     eax, edx                                ; 0781 _ 01. D0
        add     eax, cursor.1735                        ; 0783 _ 05, 00000060(d)
        movzx   eax, byte [eax]                         ; 0788 _ 0F B6. 00
        cmp     al, 46                                  ; 078B _ 3C, 2E
        jnz     ?_026                                   ; 078D _ 75, 1A
        mov     eax, dword [ebp-4H]                     ; 078F _ 8B. 45, FC
        shl     eax, 4                                  ; 0792 _ C1. E0, 04
        mov     edx, eax                                ; 0795 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0797 _ 8B. 45, F8
        add     eax, edx                                ; 079A _ 01. D0
        mov     edx, eax                                ; 079C _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 079E _ 8B. 45, 08
        add     edx, eax                                ; 07A1 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 07A3 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 07A7 _ 88. 02
?_026:  add     dword [ebp-8H], 1                       ; 07A9 _ 83. 45, F8, 01
?_027:  cmp     dword [ebp-8H], 15                      ; 07AD _ 83. 7D, F8, 0F
        jle     ?_023                                   ; 07B1 _ 0F 8E, FFFFFF5B
        add     dword [ebp-4H], 1                       ; 07B7 _ 83. 45, FC, 01
?_028:  cmp     dword [ebp-4H], 15                      ; 07BB _ 83. 7D, FC, 0F
        jle     ?_022                                   ; 07BF _ 0F 8E, FFFFFF41
        nop                                             ; 07C5 _ 90
        leave                                           ; 07C6 _ C9
        ret                                             ; 07C7 _ C3
; init_mouse_cursor End of function

putblock:; Function begin
        push    ebp                                     ; 07C8 _ 55
        mov     ebp, esp                                ; 07C9 _ 89. E5
        push    ebx                                     ; 07CB _ 53
        sub     esp, 16                                 ; 07CC _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 07CF _ C7. 45, F8, 00000000
        jmp     ?_032                                   ; 07D6 _ EB, 50

?_029:  mov     dword [ebp-0CH], 0                      ; 07D8 _ C7. 45, F4, 00000000
        jmp     ?_031                                   ; 07DF _ EB, 3B

?_030:  mov     eax, dword [ebp-8H]                     ; 07E1 _ 8B. 45, F8
        imul    eax, dword [ebp+24H]                    ; 07E4 _ 0F AF. 45, 24
        mov     edx, eax                                ; 07E8 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 07EA _ 8B. 45, F4
        add     eax, edx                                ; 07ED _ 01. D0
        mov     edx, eax                                ; 07EF _ 89. C2
        mov     eax, dword [ebp+20H]                    ; 07F1 _ 8B. 45, 20
        add     eax, edx                                ; 07F4 _ 01. D0
        mov     ecx, dword [ebp+1CH]                    ; 07F6 _ 8B. 4D, 1C
        mov     edx, dword [ebp-8H]                     ; 07F9 _ 8B. 55, F8
        add     edx, ecx                                ; 07FC _ 01. CA
        imul    edx, dword [ebp+0CH]                    ; 07FE _ 0F AF. 55, 0C
        mov     ebx, dword [ebp+18H]                    ; 0802 _ 8B. 5D, 18
        mov     ecx, dword [ebp-0CH]                    ; 0805 _ 8B. 4D, F4
        add     ecx, ebx                                ; 0808 _ 01. D9
        add     edx, ecx                                ; 080A _ 01. CA
        mov     ecx, edx                                ; 080C _ 89. D1
        mov     edx, dword [ebp+8H]                     ; 080E _ 8B. 55, 08
        add     edx, ecx                                ; 0811 _ 01. CA
        movzx   eax, byte [eax]                         ; 0813 _ 0F B6. 00
        mov     byte [edx], al                          ; 0816 _ 88. 02
        add     dword [ebp-0CH], 1                      ; 0818 _ 83. 45, F4, 01
?_031:  mov     eax, dword [ebp-0CH]                    ; 081C _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 081F _ 3B. 45, 10
        jl      ?_030                                   ; 0822 _ 7C, BD
        add     dword [ebp-8H], 1                       ; 0824 _ 83. 45, F8, 01
?_032:  mov     eax, dword [ebp-8H]                     ; 0828 _ 8B. 45, F8
        cmp     eax, dword [ebp+14H]                    ; 082B _ 3B. 45, 14
        jl      ?_029                                   ; 082E _ 7C, A8
        nop                                             ; 0830 _ 90
        add     esp, 16                                 ; 0831 _ 83. C4, 10
        pop     ebx                                     ; 0834 _ 5B
        pop     ebp                                     ; 0835 _ 5D
        ret                                             ; 0836 _ C3
; putblock End of function

intHandlerFromC:; Function begin
        push    ebp                                     ; 0837 _ 55
        mov     ebp, esp                                ; 0838 _ 89. E5
        sub     esp, 24                                 ; 083A _ 83. EC, 18
        mov     eax, dword [bootInfo]                   ; 083D _ A1, 00000000(d)
        mov     dword [ebp-14H], eax                    ; 0842 _ 89. 45, EC
        movzx   eax, word [?_135]                       ; 0845 _ 0F B7. 05, 00000004(d)
        cwde                                            ; 084C _ 98
        mov     dword [ebp-10H], eax                    ; 084D _ 89. 45, F0
        movzx   eax, word [?_136]                       ; 0850 _ 0F B7. 05, 00000006(d)
        cwde                                            ; 0857 _ 98
        mov     dword [ebp-0CH], eax                    ; 0858 _ 89. 45, F4
        sub     esp, 8                                  ; 085B _ 83. EC, 08
        push    33                                      ; 085E _ 6A, 21
        push    32                                      ; 0860 _ 6A, 20
        call    io_out8                                 ; 0862 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0867 _ 83. C4, 10
        mov     byte [ebp-15H], 0                       ; 086A _ C6. 45, EB, 00
        sub     esp, 12                                 ; 086E _ 83. EC, 0C
        push    96                                      ; 0871 _ 6A, 60
        call    io_in8                                  ; 0873 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0878 _ 83. C4, 10
        mov     byte [ebp-15H], al                      ; 087B _ 88. 45, EB
        movzx   eax, byte [ebp-15H]                     ; 087E _ 0F B6. 45, EB
        sub     esp, 8                                  ; 0882 _ 83. EC, 08
        push    eax                                     ; 0885 _ 50
        push    keyinfo                                 ; 0886 _ 68, 00000020(d)
        call    fifo8_put                               ; 088B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0890 _ 83. C4, 10
        nop                                             ; 0893 _ 90
        leave                                           ; 0894 _ C9
        ret                                             ; 0895 _ C3
; intHandlerFromC End of function

charToHexVal:; Function begin
        push    ebp                                     ; 0896 _ 55
        mov     ebp, esp                                ; 0897 _ 89. E5
        sub     esp, 4                                  ; 0899 _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 089C _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 089F _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 08A2 _ 80. 7D, FC, 09
        jle     ?_033                                   ; 08A6 _ 7E, 09
        movzx   eax, byte [ebp-4H]                      ; 08A8 _ 0F B6. 45, FC
        add     eax, 55                                 ; 08AC _ 83. C0, 37
        jmp     ?_034                                   ; 08AF _ EB, 07

?_033:  movzx   eax, byte [ebp-4H]                      ; 08B1 _ 0F B6. 45, FC
        add     eax, 48                                 ; 08B5 _ 83. C0, 30
?_034:  leave                                           ; 08B8 _ C9
        ret                                             ; 08B9 _ C3
; charToHexVal End of function

charToHexStr:; Function begin
        push    ebp                                     ; 08BA _ 55
        mov     ebp, esp                                ; 08BB _ 89. E5
        sub     esp, 20                                 ; 08BD _ 83. EC, 14
        mov     eax, dword [ebp+8H]                     ; 08C0 _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 08C3 _ 88. 45, EC
        movzx   eax, byte [ebp-14H]                     ; 08C6 _ 0F B6. 45, EC
        and     eax, 0FH                                ; 08CA _ 83. E0, 0F
        mov     byte [ebp-1H], al                       ; 08CD _ 88. 45, FF
        movsx   eax, byte [ebp-1H]                      ; 08D0 _ 0F BE. 45, FF
        push    eax                                     ; 08D4 _ 50
        call    charToHexVal                            ; 08D5 _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 08DA _ 83. C4, 04
        mov     byte [?_134], al                        ; 08DD _ A2, 00000003(d)
        shr     byte [ebp-14H], 4                       ; 08E2 _ C0. 6D, EC, 04
        movzx   eax, byte [ebp-14H]                     ; 08E6 _ 0F B6. 45, EC
        movsx   eax, al                                 ; 08EA _ 0F BE. C0
        push    eax                                     ; 08ED _ 50
        call    charToHexVal                            ; 08EE _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 08F3 _ 83. C4, 04
        mov     byte [?_133], al                        ; 08F6 _ A2, 00000002(d)
        mov     eax, keyval                             ; 08FB _ B8, 00000000(d)
        leave                                           ; 0900 _ C9
        ret                                             ; 0901 _ C3
; charToHexStr End of function

intToHexStr:; Function begin
        push    ebp                                     ; 0902 _ 55
        mov     ebp, esp                                ; 0903 _ 89. E5
        sub     esp, 16                                 ; 0905 _ 83. EC, 10
        mov     byte [str.1779], 48                     ; 0908 _ C6. 05, 00000208(d), 30
        mov     byte [?_137], 88                        ; 090F _ C6. 05, 00000209(d), 58
        mov     byte [?_138], 0                         ; 0916 _ C6. 05, 00000212(d), 00
        mov     dword [ebp-8H], 2                       ; 091D _ C7. 45, F8, 00000002
        mov     dword [ebp-0CH], 7                      ; 0924 _ C7. 45, F4, 00000007
        jmp     ?_038                                   ; 092B _ EB, 45

?_035:  mov     eax, dword [ebp+8H]                     ; 092D _ 8B. 45, 08
        and     eax, 0FH                                ; 0930 _ 83. E0, 0F
        mov     dword [ebp-4H], eax                     ; 0933 _ 89. 45, FC
        cmp     dword [ebp-4H], 9                       ; 0936 _ 83. 7D, FC, 09
        jg      ?_036                                   ; 093A _ 7F, 18
        mov     eax, dword [ebp-4H]                     ; 093C _ 8B. 45, FC
        lea     ecx, [eax+30H]                          ; 093F _ 8D. 48, 30
        mov     edx, dword [ebp-8H]                     ; 0942 _ 8B. 55, F8
        mov     eax, dword [ebp-0CH]                    ; 0945 _ 8B. 45, F4
        add     eax, edx                                ; 0948 _ 01. D0
        mov     edx, ecx                                ; 094A _ 89. CA
        mov     byte [str.1779+eax], dl                 ; 094C _ 88. 90, 00000208(d)
        jmp     ?_037                                   ; 0952 _ EB, 16

?_036:  mov     eax, dword [ebp-4H]                     ; 0954 _ 8B. 45, FC
        lea     ecx, [eax+37H]                          ; 0957 _ 8D. 48, 37
        mov     edx, dword [ebp-8H]                     ; 095A _ 8B. 55, F8
        mov     eax, dword [ebp-0CH]                    ; 095D _ 8B. 45, F4
        add     eax, edx                                ; 0960 _ 01. D0
        mov     edx, ecx                                ; 0962 _ 89. CA
        mov     byte [str.1779+eax], dl                 ; 0964 _ 88. 90, 00000208(d)
?_037:  shr     dword [ebp+8H], 4                       ; 096A _ C1. 6D, 08, 04
        sub     dword [ebp-0CH], 1                      ; 096E _ 83. 6D, F4, 01
?_038:  cmp     dword [ebp-0CH], 0                      ; 0972 _ 83. 7D, F4, 00
        jns     ?_035                                   ; 0976 _ 79, B5
        mov     eax, str.1779                           ; 0978 _ B8, 00000208(d)
        leave                                           ; 097D _ C9
        ret                                             ; 097E _ C3
; intToHexStr End of function

wait_KBC_sendReady:; Function begin
        push    ebp                                     ; 097F _ 55
        mov     ebp, esp                                ; 0980 _ 89. E5
        sub     esp, 8                                  ; 0982 _ 83. EC, 08
?_039:  sub     esp, 12                                 ; 0985 _ 83. EC, 0C
        push    100                                     ; 0988 _ 6A, 64
        call    io_in8                                  ; 098A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 098F _ 83. C4, 10
        and     eax, 02H                                ; 0992 _ 83. E0, 02
        test    eax, eax                                ; 0995 _ 85. C0
        jz      ?_040                                   ; 0997 _ 74, 02
        jmp     ?_039                                   ; 0999 _ EB, EA
; wait_KBC_sendReady End of function

?_040:  ; Local function
        nop                                             ; 099B _ 90
        nop                                             ; 099C _ 90
        leave                                           ; 099D _ C9
        ret                                             ; 099E _ C3

init_keyboard:; Function begin
        push    ebp                                     ; 099F _ 55
        mov     ebp, esp                                ; 09A0 _ 89. E5
        sub     esp, 8                                  ; 09A2 _ 83. EC, 08
        call    wait_KBC_sendReady                      ; 09A5 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 09AA _ 83. EC, 08
        push    96                                      ; 09AD _ 6A, 60
        push    100                                     ; 09AF _ 6A, 64
        call    io_out8                                 ; 09B1 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 09B6 _ 83. C4, 10
        call    wait_KBC_sendReady                      ; 09B9 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 09BE _ 83. EC, 08
        push    71                                      ; 09C1 _ 6A, 47
        push    96                                      ; 09C3 _ 6A, 60
        call    io_out8                                 ; 09C5 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 09CA _ 83. C4, 10
        nop                                             ; 09CD _ 90
        leave                                           ; 09CE _ C9
        ret                                             ; 09CF _ C3
; init_keyboard End of function

enable_mouse:; Function begin
        push    ebp                                     ; 09D0 _ 55
        mov     ebp, esp                                ; 09D1 _ 89. E5
        sub     esp, 8                                  ; 09D3 _ 83. EC, 08
        call    wait_KBC_sendReady                      ; 09D6 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 09DB _ 83. EC, 08
        push    212                                     ; 09DE _ 68, 000000D4
        push    100                                     ; 09E3 _ 6A, 64
        call    io_out8                                 ; 09E5 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 09EA _ 83. C4, 10
        call    wait_KBC_sendReady                      ; 09ED _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 09F2 _ 83. EC, 08
        push    244                                     ; 09F5 _ 68, 000000F4
        push    96                                      ; 09FA _ 6A, 60
        call    io_out8                                 ; 09FC _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0A01 _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 0A04 _ 8B. 45, 08
        mov     byte [eax+3H], 0                        ; 0A07 _ C6. 40, 03, 00
        nop                                             ; 0A0B _ 90
        leave                                           ; 0A0C _ C9
        ret                                             ; 0A0D _ C3
; enable_mouse End of function

intHandlerFromMouse:; Function begin
        push    ebp                                     ; 0A0E _ 55
        mov     ebp, esp                                ; 0A0F _ 89. E5
        sub     esp, 24                                 ; 0A11 _ 83. EC, 18
        sub     esp, 8                                  ; 0A14 _ 83. EC, 08
        push    32                                      ; 0A17 _ 6A, 20
        push    160                                     ; 0A19 _ 68, 000000A0
        call    io_out8                                 ; 0A1E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0A23 _ 83. C4, 10
        sub     esp, 8                                  ; 0A26 _ 83. EC, 08
        push    32                                      ; 0A29 _ 6A, 20
        push    32                                      ; 0A2B _ 6A, 20
        call    io_out8                                 ; 0A2D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0A32 _ 83. C4, 10
        sub     esp, 12                                 ; 0A35 _ 83. EC, 0C
        push    96                                      ; 0A38 _ 6A, 60
        call    io_in8                                  ; 0A3A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0A3F _ 83. C4, 10
        mov     byte [ebp-9H], al                       ; 0A42 _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 0A45 _ 0F B6. 45, F7
        sub     esp, 8                                  ; 0A49 _ 83. EC, 08
        push    eax                                     ; 0A4C _ 50
        push    mouseinfo                               ; 0A4D _ 68, 00000008(d)
        call    fifo8_put                               ; 0A52 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0A57 _ 83. C4, 10
        nop                                             ; 0A5A _ 90
        leave                                           ; 0A5B _ C9
        ret                                             ; 0A5C _ C3
; intHandlerFromMouse End of function

fifo8_init:; Function begin
        push    ebp                                     ; 0A5D _ 55
        mov     ebp, esp                                ; 0A5E _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 0A60 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 0A63 _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 0A66 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 0A69 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 0A6C _ 8B. 55, 10
        mov     dword [eax], edx                        ; 0A6F _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 0A71 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 0A74 _ 8B. 55, 0C
        mov     dword [eax+10H], edx                    ; 0A77 _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 0A7A _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 0A7D _ C7. 40, 14, 00000000
        mov     eax, dword [ebp+8H]                     ; 0A84 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 0A87 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 0A8E _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 0A91 _ C7. 40, 08, 00000000
        nop                                             ; 0A98 _ 90
        pop     ebp                                     ; 0A99 _ 5D
        ret                                             ; 0A9A _ C3
; fifo8_init End of function

fifo8_put:; Function begin
        push    ebp                                     ; 0A9B _ 55
        mov     ebp, esp                                ; 0A9C _ 89. E5
        sub     esp, 4                                  ; 0A9E _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 0AA1 _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 0AA4 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0AA7 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0AAA _ 8B. 40, 10
        test    eax, eax                                ; 0AAD _ 85. C0
        jnz     ?_041                                   ; 0AAF _ 75, 18
        mov     eax, dword [ebp+8H]                     ; 0AB1 _ 8B. 45, 08
        mov     eax, dword [eax+14H]                    ; 0AB4 _ 8B. 40, 14
        or      eax, 01H                                ; 0AB7 _ 83. C8, 01
        mov     edx, eax                                ; 0ABA _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0ABC _ 8B. 45, 08
        mov     dword [eax+14H], edx                    ; 0ABF _ 89. 50, 14
        mov     eax, 4294967295                         ; 0AC2 _ B8, FFFFFFFF
        jmp     ?_043                                   ; 0AC7 _ EB, 50

?_041:  mov     eax, dword [ebp+8H]                     ; 0AC9 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 0ACC _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 0ACE _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0AD1 _ 8B. 40, 04
        add     edx, eax                                ; 0AD4 _ 01. C2
        movzx   eax, byte [ebp-4H]                      ; 0AD6 _ 0F B6. 45, FC
        mov     byte [edx], al                          ; 0ADA _ 88. 02
        mov     eax, dword [ebp+8H]                     ; 0ADC _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0ADF _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 0AE2 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0AE5 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 0AE8 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0AEB _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 0AEE _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0AF1 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0AF4 _ 8B. 40, 0C
        cmp     edx, eax                                ; 0AF7 _ 39. C2
        jnz     ?_042                                   ; 0AF9 _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 0AFB _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 0AFE _ C7. 40, 04, 00000000
?_042:  mov     eax, dword [ebp+8H]                     ; 0B05 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0B08 _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 0B0B _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 0B0E _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 0B11 _ 89. 50, 10
        mov     eax, 0                                  ; 0B14 _ B8, 00000000
?_043:  leave                                           ; 0B19 _ C9
        ret                                             ; 0B1A _ C3
; fifo8_put End of function

fifo8_get:; Function begin
        push    ebp                                     ; 0B1B _ 55
        mov     ebp, esp                                ; 0B1C _ 89. E5
        sub     esp, 16                                 ; 0B1E _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 0B21 _ 8B. 45, 08
        mov     edx, dword [eax+10H]                    ; 0B24 _ 8B. 50, 10
        mov     eax, dword [ebp+8H]                     ; 0B27 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0B2A _ 8B. 40, 0C
        cmp     edx, eax                                ; 0B2D _ 39. C2
        jnz     ?_044                                   ; 0B2F _ 75, 07
        mov     eax, 4294967295                         ; 0B31 _ B8, FFFFFFFF
        jmp     ?_046                                   ; 0B36 _ EB, 51

?_044:  mov     eax, dword [ebp+8H]                     ; 0B38 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 0B3B _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 0B3D _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0B40 _ 8B. 40, 08
        add     eax, edx                                ; 0B43 _ 01. D0
        movzx   eax, byte [eax]                         ; 0B45 _ 0F B6. 00
        movzx   eax, al                                 ; 0B48 _ 0F B6. C0
        mov     dword [ebp-4H], eax                     ; 0B4B _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0B4E _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0B51 _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 0B54 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0B57 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0B5A _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 0B5D _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 0B60 _ 8B. 50, 08
        mov     eax, dword [ebp+8H]                     ; 0B63 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0B66 _ 8B. 40, 0C
        cmp     edx, eax                                ; 0B69 _ 39. C2
        jnz     ?_045                                   ; 0B6B _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 0B6D _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 0B70 _ C7. 40, 08, 00000000
?_045:  mov     eax, dword [ebp+8H]                     ; 0B77 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0B7A _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 0B7D _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0B80 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 0B83 _ 89. 50, 10
        mov     eax, dword [ebp-4H]                     ; 0B86 _ 8B. 45, FC
?_046:  leave                                           ; 0B89 _ C9
        ret                                             ; 0B8A _ C3
; fifo8_get End of function

fifo8_status:; Function begin
        push    ebp                                     ; 0B8B _ 55
        mov     ebp, esp                                ; 0B8C _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 0B8E _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 0B91 _ 8B. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 0B94 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0B97 _ 8B. 40, 10
        sub     edx, eax                                ; 0B9A _ 29. C2
        mov     eax, edx                                ; 0B9C _ 89. D0
        pop     ebp                                     ; 0B9E _ 5D
        ret                                             ; 0B9F _ C3
; fifo8_status End of function

mouse_decode:; Function begin
        push    ebp                                     ; 0BA0 _ 55
        mov     ebp, esp                                ; 0BA1 _ 89. E5
        sub     esp, 4                                  ; 0BA3 _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 0BA6 _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 0BA9 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0BAC _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 0BAF _ 0F B6. 40, 03
        test    al, al                                  ; 0BB3 _ 84. C0
        jnz     ?_048                                   ; 0BB5 _ 75, 17
        cmp     byte [ebp-4H], -6                       ; 0BB7 _ 80. 7D, FC, FA
        jnz     ?_047                                   ; 0BBB _ 75, 07
        mov     eax, dword [ebp+8H]                     ; 0BBD _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 0BC0 _ C6. 40, 03, 01
?_047:  mov     eax, 0                                  ; 0BC4 _ B8, 00000000
        jmp     ?_055                                   ; 0BC9 _ E9, 0000010F

?_048:  mov     eax, dword [ebp+8H]                     ; 0BCE _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 0BD1 _ 0F B6. 40, 03
        cmp     al, 1                                   ; 0BD5 _ 3C, 01
        jnz     ?_050                                   ; 0BD7 _ 75, 28
        movzx   eax, byte [ebp-4H]                      ; 0BD9 _ 0F B6. 45, FC
        and     eax, 0C8H                               ; 0BDD _ 25, 000000C8
        cmp     eax, 8                                  ; 0BE2 _ 83. F8, 08
        jnz     ?_049                                   ; 0BE5 _ 75, 10
        mov     eax, dword [ebp+8H]                     ; 0BE7 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 0BEA _ 0F B6. 55, FC
        mov     byte [eax], dl                          ; 0BEE _ 88. 10
        mov     eax, dword [ebp+8H]                     ; 0BF0 _ 8B. 45, 08
        mov     byte [eax+3H], 2                        ; 0BF3 _ C6. 40, 03, 02
?_049:  mov     eax, 0                                  ; 0BF7 _ B8, 00000000
        jmp     ?_055                                   ; 0BFC _ E9, 000000DC

?_050:  mov     eax, dword [ebp+8H]                     ; 0C01 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 0C04 _ 0F B6. 40, 03
        cmp     al, 2                                   ; 0C08 _ 3C, 02
        jnz     ?_051                                   ; 0C0A _ 75, 1B
        mov     eax, dword [ebp+8H]                     ; 0C0C _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 0C0F _ 0F B6. 55, FC
        mov     byte [eax+1H], dl                       ; 0C13 _ 88. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0C16 _ 8B. 45, 08
        mov     byte [eax+3H], 3                        ; 0C19 _ C6. 40, 03, 03
        mov     eax, 0                                  ; 0C1D _ B8, 00000000
        jmp     ?_055                                   ; 0C22 _ E9, 000000B6

?_051:  mov     eax, dword [ebp+8H]                     ; 0C27 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 0C2A _ 0F B6. 40, 03
        cmp     al, 3                                   ; 0C2E _ 3C, 03
        jne     ?_054                                   ; 0C30 _ 0F 85, 000000A2
        mov     eax, dword [ebp+8H]                     ; 0C36 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 0C39 _ 0F B6. 55, FC
        mov     byte [eax+2H], dl                       ; 0C3D _ 88. 50, 02
        mov     eax, dword [ebp+8H]                     ; 0C40 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 0C43 _ C6. 40, 03, 01
        mov     eax, dword [ebp+8H]                     ; 0C47 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 0C4A _ 0F B6. 00
        movzx   eax, al                                 ; 0C4D _ 0F B6. C0
        and     eax, 07H                                ; 0C50 _ 83. E0, 07
        mov     edx, eax                                ; 0C53 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0C55 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 0C58 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 0C5B _ 8B. 45, 08
        movzx   eax, byte [eax+1H]                      ; 0C5E _ 0F B6. 40, 01
        movzx   edx, al                                 ; 0C62 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 0C65 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 0C68 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0C6B _ 8B. 45, 08
        movzx   eax, byte [eax+2H]                      ; 0C6E _ 0F B6. 40, 02
        movzx   edx, al                                 ; 0C72 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 0C75 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0C78 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 0C7B _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 0C7E _ 0F B6. 00
        movzx   eax, al                                 ; 0C81 _ 0F B6. C0
        and     eax, 10H                                ; 0C84 _ 83. E0, 10
        test    eax, eax                                ; 0C87 _ 85. C0
        jz      ?_052                                   ; 0C89 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 0C8B _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0C8E _ 8B. 40, 04
        or      eax, 0FFFFFF00H                         ; 0C91 _ 0D, FFFFFF00
        mov     edx, eax                                ; 0C96 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0C98 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 0C9B _ 89. 50, 04
?_052:  mov     eax, dword [ebp+8H]                     ; 0C9E _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 0CA1 _ 0F B6. 00
        movzx   eax, al                                 ; 0CA4 _ 0F B6. C0
        and     eax, 20H                                ; 0CA7 _ 83. E0, 20
        test    eax, eax                                ; 0CAA _ 85. C0
        jz      ?_053                                   ; 0CAC _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 0CAE _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0CB1 _ 8B. 40, 08
        or      eax, 0FFFFFF00H                         ; 0CB4 _ 0D, FFFFFF00
        mov     edx, eax                                ; 0CB9 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0CBB _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0CBE _ 89. 50, 08
?_053:  mov     eax, dword [ebp+8H]                     ; 0CC1 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0CC4 _ 8B. 40, 08
        neg     eax                                     ; 0CC7 _ F7. D8
        mov     edx, eax                                ; 0CC9 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0CCB _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0CCE _ 89. 50, 08
        mov     eax, 1                                  ; 0CD1 _ B8, 00000001
        jmp     ?_055                                   ; 0CD6 _ EB, 05

?_054:  mov     eax, 4294967295                         ; 0CD8 _ B8, FFFFFFFF
?_055:  leave                                           ; 0CDD _ C9
        ret                                             ; 0CDE _ C3
; mouse_decode End of function

computeMousePosition:; Function begin
        push    ebp                                     ; 0CDF _ 55
        mov     ebp, esp                                ; 0CE0 _ 89. E5
        sub     esp, 24                                 ; 0CE2 _ 83. EC, 18
        movzx   eax, word [?_135]                       ; 0CE5 _ 0F B7. 05, 00000004(d)
        cwde                                            ; 0CEC _ 98
        mov     dword [ebp-14H], eax                    ; 0CED _ 89. 45, EC
        movzx   eax, word [?_136]                       ; 0CF0 _ 0F B7. 05, 00000006(d)
        cwde                                            ; 0CF7 _ 98
        mov     dword [ebp-10H], eax                    ; 0CF8 _ 89. 45, F0
        mov     eax, dword [ebp+10H]                    ; 0CFB _ 8B. 45, 10
        mov     dword [eax+4H], 16                      ; 0CFE _ C7. 40, 04, 00000010
        mov     eax, dword [ebp+10H]                    ; 0D05 _ 8B. 45, 10
        mov     dword [eax+8H], 16                      ; 0D08 _ C7. 40, 08, 00000010
        mov     eax, dword [ebp+14H]                    ; 0D0F _ 8B. 45, 14
        mov     edx, dword [eax+4H]                     ; 0D12 _ 8B. 50, 04
        mov     eax, dword [mx]                         ; 0D15 _ A1, 000000F0(d)
        add     eax, edx                                ; 0D1A _ 01. D0
        mov     dword [mx], eax                         ; 0D1C _ A3, 000000F0(d)
        mov     eax, dword [ebp+14H]                    ; 0D21 _ 8B. 45, 14
        mov     edx, dword [eax+8H]                     ; 0D24 _ 8B. 50, 08
        mov     eax, dword [my]                         ; 0D27 _ A1, 000000F4(d)
        add     eax, edx                                ; 0D2C _ 01. D0
        mov     dword [my], eax                         ; 0D2E _ A3, 000000F4(d)
        mov     eax, dword [mx]                         ; 0D33 _ A1, 000000F0(d)
        test    eax, eax                                ; 0D38 _ 85. C0
        jns     ?_056                                   ; 0D3A _ 79, 0A
        mov     dword [mx], 0                           ; 0D3C _ C7. 05, 000000F0(d), 00000000
?_056:  mov     eax, dword [my]                         ; 0D46 _ A1, 000000F4(d)
        test    eax, eax                                ; 0D4B _ 85. C0
        jns     ?_057                                   ; 0D4D _ 79, 0A
        mov     dword [my], 0                           ; 0D4F _ C7. 05, 000000F4(d), 00000000
?_057:  mov     eax, dword [ebp-10H]                    ; 0D59 _ 8B. 45, F0
        lea     edx, [eax-10H]                          ; 0D5C _ 8D. 50, F0
        mov     eax, dword [my]                         ; 0D5F _ A1, 000000F4(d)
        cmp     edx, eax                                ; 0D64 _ 39. C2
        jge     ?_058                                   ; 0D66 _ 7D, 10
        mov     eax, dword [my]                         ; 0D68 _ A1, 000000F4(d)
        mov     edx, dword [ebp-10H]                    ; 0D6D _ 8B. 55, F0
        sub     edx, eax                                ; 0D70 _ 29. C2
        mov     eax, dword [ebp+10H]                    ; 0D72 _ 8B. 45, 10
        mov     dword [eax+8H], edx                     ; 0D75 _ 89. 50, 08
?_058:  mov     dword [ebp-0CH], 1                      ; 0D78 _ C7. 45, F4, 00000001
        mov     eax, dword [ebp-14H]                    ; 0D7F _ 8B. 45, EC
        sub     eax, dword [ebp-0CH]                    ; 0D82 _ 2B. 45, F4
        mov     edx, eax                                ; 0D85 _ 89. C2
        mov     eax, dword [mx]                         ; 0D87 _ A1, 000000F0(d)
        cmp     edx, eax                                ; 0D8C _ 39. C2
        jge     ?_059                                   ; 0D8E _ 7D, 14
        mov     eax, dword [ebp-14H]                    ; 0D90 _ 8B. 45, EC
        sub     eax, dword [ebp-0CH]                    ; 0D93 _ 2B. 45, F4
        mov     dword [mx], eax                         ; 0D96 _ A3, 000000F0(d)
        mov     eax, dword [ebp+10H]                    ; 0D9B _ 8B. 45, 10
        mov     edx, dword [ebp-0CH]                    ; 0D9E _ 8B. 55, F4
        mov     dword [eax+4H], edx                     ; 0DA1 _ 89. 50, 04
?_059:  mov     eax, dword [ebp-10H]                    ; 0DA4 _ 8B. 45, F0
        sub     eax, dword [ebp-0CH]                    ; 0DA7 _ 2B. 45, F4
        mov     edx, eax                                ; 0DAA _ 89. C2
        mov     eax, dword [my]                         ; 0DAC _ A1, 000000F4(d)
        cmp     edx, eax                                ; 0DB1 _ 39. C2
        jge     ?_060                                   ; 0DB3 _ 7D, 14
        mov     eax, dword [ebp-10H]                    ; 0DB5 _ 8B. 45, F0
        sub     eax, dword [ebp-0CH]                    ; 0DB8 _ 2B. 45, F4
        mov     dword [my], eax                         ; 0DBB _ A3, 000000F4(d)
        mov     eax, dword [ebp+10H]                    ; 0DC0 _ 8B. 45, 10
        mov     edx, dword [ebp-0CH]                    ; 0DC3 _ 8B. 55, F4
        mov     dword [eax+8H], edx                     ; 0DC6 _ 89. 50, 08
?_060:  sub     esp, 8                                  ; 0DC9 _ 83. EC, 08
        push    ?_124                                   ; 0DCC _ 68, 00000009(d)
        push    7                                       ; 0DD1 _ 6A, 07
        push    0                                       ; 0DD3 _ 6A, 00
        push    0                                       ; 0DD5 _ 6A, 00
        push    dword [ebp+0CH]                         ; 0DD7 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0DDA _ FF. 75, 08
        call    showString                              ; 0DDD _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0DE2 _ 83. C4, 20
        nop                                             ; 0DE5 _ 90
        leave                                           ; 0DE6 _ C9
        ret                                             ; 0DE7 _ C3
; computeMousePosition End of function

show_mouse_info:; Function begin
        push    ebp                                     ; 0DE8 _ 55
        mov     ebp, esp                                ; 0DE9 _ 89. E5
        sub     esp, 24                                 ; 0DEB _ 83. EC, 18
        mov     eax, dword [buf_back]                   ; 0DEE _ A1, 000000F8(d)
        mov     dword [ebp-0CH], eax                    ; 0DF3 _ 89. 45, F4
        mov     byte [ebp-0DH], 0                       ; 0DF6 _ C6. 45, F3, 00
        call    io_sti                                  ; 0DFA _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 0DFF _ 83. EC, 0C
        push    mouseinfo                               ; 0E02 _ 68, 00000008(d)
        call    fifo8_get                               ; 0E07 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0E0C _ 83. C4, 10
        mov     byte [ebp-0DH], al                      ; 0E0F _ 88. 45, F3
        movzx   eax, byte [ebp-0DH]                     ; 0E12 _ 0F B6. 45, F3
        sub     esp, 8                                  ; 0E16 _ 83. EC, 08
        push    eax                                     ; 0E19 _ 50
        push    mdec                                    ; 0E1A _ 68, 000000E0(d)
        call    mouse_decode                            ; 0E1F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0E24 _ 83. C4, 10
        cmp     eax, 1                                  ; 0E27 _ 83. F8, 01
        jnz     ?_061                                   ; 0E2A _ 75, 31
        push    mdec                                    ; 0E2C _ 68, 000000E0(d)
        push    dword [ebp+10H]                         ; 0E31 _ FF. 75, 10
        push    dword [ebp+0CH]                         ; 0E34 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0E37 _ FF. 75, 08
        call    computeMousePosition                    ; 0E3A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0E3F _ 83. C4, 10
        mov     edx, dword [my]                         ; 0E42 _ 8B. 15, 000000F4(d)
        mov     eax, dword [mx]                         ; 0E48 _ A1, 000000F0(d)
        push    edx                                     ; 0E4D _ 52
        push    eax                                     ; 0E4E _ 50
        push    dword [ebp+10H]                         ; 0E4F _ FF. 75, 10
        push    dword [ebp+8H]                          ; 0E52 _ FF. 75, 08
        call    sheet_slide_mouse                       ; 0E55 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0E5A _ 83. C4, 10
?_061:  nop                                             ; 0E5D _ 90
        leave                                           ; 0E5E _ C9
        ret                                             ; 0E5F _ C3
; show_mouse_info End of function

showMemoryInfo:; Function begin
        push    ebp                                     ; 0E60 _ 55
        mov     ebp, esp                                ; 0E61 _ 89. E5
        sub     esp, 56                                 ; 0E63 _ 83. EC, 38
        mov     dword [ebp-30H], 0                      ; 0E66 _ C7. 45, D0, 00000000
        mov     dword [ebp-2CH], 0                      ; 0E6D _ C7. 45, D4, 00000000
        mov     dword [ebp-28H], 104                    ; 0E74 _ C7. 45, D8, 00000068
        mov     dword [ebp-24H], 80                     ; 0E7B _ C7. 45, DC, 00000050
        mov     edx, dword [ysize]                      ; 0E82 _ 8B. 15, 00000204(d)
        mov     eax, dword [ebp+0CH]                    ; 0E88 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 0E8B _ 8B. 00
        sub     esp, 4                                  ; 0E8D _ 83. EC, 04
        push    edx                                     ; 0E90 _ 52
        push    dword [ebp+1CH]                         ; 0E91 _ FF. 75, 1C
        push    eax                                     ; 0E94 _ 50
        call    init_screen8                            ; 0E95 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0E9A _ 83. C4, 10
        mov     eax, dword [ebp+20H]                    ; 0E9D _ 8B. 45, 20
        movsx   eax, al                                 ; 0EA0 _ 0F BE. C0
        sub     esp, 8                                  ; 0EA3 _ 83. EC, 08
        push    ?_125                                   ; 0EA6 _ 68, 00000021(d)
        push    eax                                     ; 0EAB _ 50
        push    dword [ebp-2CH]                         ; 0EAC _ FF. 75, D4
        push    dword [ebp-30H]                         ; 0EAF _ FF. 75, D0
        push    dword [ebp+0CH]                         ; 0EB2 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0EB5 _ FF. 75, 08
        call    showString                              ; 0EB8 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0EBD _ 83. C4, 20
        mov     eax, dword [ebp+18H]                    ; 0EC0 _ 8B. 45, 18
        sub     esp, 12                                 ; 0EC3 _ 83. EC, 0C
        push    eax                                     ; 0EC6 _ 50
        call    intToHexStr                             ; 0EC7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0ECC _ 83. C4, 10
        mov     dword [ebp-20H], eax                    ; 0ECF _ 89. 45, E0
        mov     eax, dword [ebp+20H]                    ; 0ED2 _ 8B. 45, 20
        movsx   eax, al                                 ; 0ED5 _ 0F BE. C0
        sub     esp, 8                                  ; 0ED8 _ 83. EC, 08
        push    dword [ebp-20H]                         ; 0EDB _ FF. 75, E0
        push    eax                                     ; 0EDE _ 50
        push    dword [ebp-2CH]                         ; 0EDF _ FF. 75, D4
        push    dword [ebp-28H]                         ; 0EE2 _ FF. 75, D8
        push    dword [ebp+0CH]                         ; 0EE5 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0EE8 _ FF. 75, 08
        call    showString                              ; 0EEB _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0EF0 _ 83. C4, 20
        add     dword [ebp-2CH], 16                     ; 0EF3 _ 83. 45, D4, 10
        mov     eax, dword [ebp+20H]                    ; 0EF7 _ 8B. 45, 20
        movsx   eax, al                                 ; 0EFA _ 0F BE. C0
        sub     esp, 8                                  ; 0EFD _ 83. EC, 08
        push    ?_126                                   ; 0F00 _ 68, 0000002B(d)
        push    eax                                     ; 0F05 _ 50
        push    dword [ebp-2CH]                         ; 0F06 _ FF. 75, D4
        push    dword [ebp-30H]                         ; 0F09 _ FF. 75, D0
        push    dword [ebp+0CH]                         ; 0F0C _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0F0F _ FF. 75, 08
        call    showString                              ; 0F12 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0F17 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0F1A _ 8B. 45, 10
        mov     eax, dword [eax]                        ; 0F1D _ 8B. 00
        sub     esp, 12                                 ; 0F1F _ 83. EC, 0C
        push    eax                                     ; 0F22 _ 50
        call    intToHexStr                             ; 0F23 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0F28 _ 83. C4, 10
        mov     dword [ebp-1CH], eax                    ; 0F2B _ 89. 45, E4
        mov     eax, dword [ebp+20H]                    ; 0F2E _ 8B. 45, 20
        movsx   eax, al                                 ; 0F31 _ 0F BE. C0
        sub     esp, 8                                  ; 0F34 _ 83. EC, 08
        push    dword [ebp-1CH]                         ; 0F37 _ FF. 75, E4
        push    eax                                     ; 0F3A _ 50
        push    dword [ebp-2CH]                         ; 0F3B _ FF. 75, D4
        push    dword [ebp-28H]                         ; 0F3E _ FF. 75, D8
        push    dword [ebp+0CH]                         ; 0F41 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0F44 _ FF. 75, 08
        call    showString                              ; 0F47 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0F4C _ 83. C4, 20
        add     dword [ebp-2CH], 16                     ; 0F4F _ 83. 45, D4, 10
        mov     eax, dword [ebp+20H]                    ; 0F53 _ 8B. 45, 20
        movsx   eax, al                                 ; 0F56 _ 0F BE. C0
        sub     esp, 8                                  ; 0F59 _ 83. EC, 08
        push    ?_127                                   ; 0F5C _ 68, 00000037(d)
        push    eax                                     ; 0F61 _ 50
        push    dword [ebp-2CH]                         ; 0F62 _ FF. 75, D4
        push    dword [ebp-30H]                         ; 0F65 _ FF. 75, D0
        push    dword [ebp+0CH]                         ; 0F68 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0F6B _ FF. 75, 08
        call    showString                              ; 0F6E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0F73 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0F76 _ 8B. 45, 10
        mov     eax, dword [eax+4H]                     ; 0F79 _ 8B. 40, 04
        sub     esp, 12                                 ; 0F7C _ 83. EC, 0C
        push    eax                                     ; 0F7F _ 50
        call    intToHexStr                             ; 0F80 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0F85 _ 83. C4, 10
        mov     dword [ebp-18H], eax                    ; 0F88 _ 89. 45, E8
        mov     eax, dword [ebp+20H]                    ; 0F8B _ 8B. 45, 20
        movsx   eax, al                                 ; 0F8E _ 0F BE. C0
        sub     esp, 8                                  ; 0F91 _ 83. EC, 08
        push    dword [ebp-18H]                         ; 0F94 _ FF. 75, E8
        push    eax                                     ; 0F97 _ 50
        push    dword [ebp-2CH]                         ; 0F98 _ FF. 75, D4
        push    dword [ebp-28H]                         ; 0F9B _ FF. 75, D8
        push    dword [ebp+0CH]                         ; 0F9E _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0FA1 _ FF. 75, 08
        call    showString                              ; 0FA4 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0FA9 _ 83. C4, 20
        add     dword [ebp-2CH], 16                     ; 0FAC _ 83. 45, D4, 10
        mov     eax, dword [ebp+20H]                    ; 0FB0 _ 8B. 45, 20
        movsx   eax, al                                 ; 0FB3 _ 0F BE. C0
        sub     esp, 8                                  ; 0FB6 _ 83. EC, 08
        push    ?_128                                   ; 0FB9 _ 68, 00000043(d)
        push    eax                                     ; 0FBE _ 50
        push    dword [ebp-2CH]                         ; 0FBF _ FF. 75, D4
        push    dword [ebp-30H]                         ; 0FC2 _ FF. 75, D0
        push    dword [ebp+0CH]                         ; 0FC5 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0FC8 _ FF. 75, 08
        call    showString                              ; 0FCB _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0FD0 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0FD3 _ 8B. 45, 10
        mov     eax, dword [eax+8H]                     ; 0FD6 _ 8B. 40, 08
        sub     esp, 12                                 ; 0FD9 _ 83. EC, 0C
        push    eax                                     ; 0FDC _ 50
        call    intToHexStr                             ; 0FDD _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0FE2 _ 83. C4, 10
        mov     dword [ebp-14H], eax                    ; 0FE5 _ 89. 45, EC
        mov     eax, dword [ebp+20H]                    ; 0FE8 _ 8B. 45, 20
        movsx   eax, al                                 ; 0FEB _ 0F BE. C0
        sub     esp, 8                                  ; 0FEE _ 83. EC, 08
        push    dword [ebp-14H]                         ; 0FF1 _ FF. 75, EC
        push    eax                                     ; 0FF4 _ 50
        push    dword [ebp-2CH]                         ; 0FF5 _ FF. 75, D4
        push    dword [ebp-28H]                         ; 0FF8 _ FF. 75, D8
        push    dword [ebp+0CH]                         ; 0FFB _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0FFE _ FF. 75, 08
        call    showString                              ; 1001 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1006 _ 83. C4, 20
        add     dword [ebp-2CH], 16                     ; 1009 _ 83. 45, D4, 10
        mov     eax, dword [ebp+20H]                    ; 100D _ 8B. 45, 20
        movsx   eax, al                                 ; 1010 _ 0F BE. C0
        sub     esp, 8                                  ; 1013 _ 83. EC, 08
        push    ?_129                                   ; 1016 _ 68, 0000004F(d)
        push    eax                                     ; 101B _ 50
        push    dword [ebp-2CH]                         ; 101C _ FF. 75, D4
        push    dword [ebp-30H]                         ; 101F _ FF. 75, D0
        push    dword [ebp+0CH]                         ; 1022 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1025 _ FF. 75, 08
        call    showString                              ; 1028 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 102D _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 1030 _ 8B. 45, 10
        mov     eax, dword [eax+0CH]                    ; 1033 _ 8B. 40, 0C
        sub     esp, 12                                 ; 1036 _ 83. EC, 0C
        push    eax                                     ; 1039 _ 50
        call    intToHexStr                             ; 103A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 103F _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 1042 _ 89. 45, F0
        mov     eax, dword [ebp+20H]                    ; 1045 _ 8B. 45, 20
        movsx   eax, al                                 ; 1048 _ 0F BE. C0
        sub     esp, 8                                  ; 104B _ 83. EC, 08
        push    dword [ebp-10H]                         ; 104E _ FF. 75, F0
        push    eax                                     ; 1051 _ 50
        push    dword [ebp-2CH]                         ; 1052 _ FF. 75, D4
        push    dword [ebp-28H]                         ; 1055 _ FF. 75, D8
        push    dword [ebp+0CH]                         ; 1058 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 105B _ FF. 75, 08
        call    showString                              ; 105E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1063 _ 83. C4, 20
        add     dword [ebp-2CH], 16                     ; 1066 _ 83. 45, D4, 10
        mov     eax, dword [ebp+20H]                    ; 106A _ 8B. 45, 20
        movsx   eax, al                                 ; 106D _ 0F BE. C0
        sub     esp, 8                                  ; 1070 _ 83. EC, 08
        push    ?_130                                   ; 1073 _ 68, 0000005C(d)
        push    eax                                     ; 1078 _ 50
        push    dword [ebp-2CH]                         ; 1079 _ FF. 75, D4
        push    dword [ebp-30H]                         ; 107C _ FF. 75, D0
        push    dword [ebp+0CH]                         ; 107F _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1082 _ FF. 75, 08
        call    showString                              ; 1085 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 108A _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 108D _ 8B. 45, 10
        mov     eax, dword [eax+10H]                    ; 1090 _ 8B. 40, 10
        sub     esp, 12                                 ; 1093 _ 83. EC, 0C
        push    eax                                     ; 1096 _ 50
        call    intToHexStr                             ; 1097 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 109C _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 109F _ 89. 45, F4
        mov     eax, dword [ebp+20H]                    ; 10A2 _ 8B. 45, 20
        movsx   eax, al                                 ; 10A5 _ 0F BE. C0
        sub     esp, 8                                  ; 10A8 _ 83. EC, 08
        push    dword [ebp-0CH]                         ; 10AB _ FF. 75, F4
        push    eax                                     ; 10AE _ 50
        push    dword [ebp-2CH]                         ; 10AF _ FF. 75, D4
        push    dword [ebp-28H]                         ; 10B2 _ FF. 75, D8
        push    dword [ebp+0CH]                         ; 10B5 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 10B8 _ FF. 75, 08
        call    showString                              ; 10BB _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 10C0 _ 83. C4, 20
        nop                                             ; 10C3 _ 90
        leave                                           ; 10C4 _ C9
        ret                                             ; 10C5 _ C3
; showMemoryInfo End of function

init_screen8:; Function begin
        push    ebp                                     ; 10C6 _ 55
        mov     ebp, esp                                ; 10C7 _ 89. E5
        push    ebx                                     ; 10C9 _ 53
        mov     eax, dword [ebp+10H]                    ; 10CA _ 8B. 45, 10
        lea     edx, [eax-1DH]                          ; 10CD _ 8D. 50, E3
        mov     eax, dword [ebp+0CH]                    ; 10D0 _ 8B. 45, 0C
        sub     eax, 1                                  ; 10D3 _ 83. E8, 01
        push    edx                                     ; 10D6 _ 52
        push    eax                                     ; 10D7 _ 50
        push    0                                       ; 10D8 _ 6A, 00
        push    0                                       ; 10DA _ 6A, 00
        push    14                                      ; 10DC _ 6A, 0E
        push    dword [ebp+0CH]                         ; 10DE _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 10E1 _ FF. 75, 08
        call    boxfill8                                ; 10E4 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 10E9 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 10EC _ 8B. 45, 10
        lea     ecx, [eax-1CH]                          ; 10EF _ 8D. 48, E4
        mov     eax, dword [ebp+0CH]                    ; 10F2 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 10F5 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 10F8 _ 8B. 45, 10
        sub     eax, 28                                 ; 10FB _ 83. E8, 1C
        push    ecx                                     ; 10FE _ 51
        push    edx                                     ; 10FF _ 52
        push    eax                                     ; 1100 _ 50
        push    0                                       ; 1101 _ 6A, 00
        push    8                                       ; 1103 _ 6A, 08
        push    dword [ebp+0CH]                         ; 1105 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1108 _ FF. 75, 08
        call    boxfill8                                ; 110B _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1110 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 1113 _ 8B. 45, 10
        lea     ecx, [eax-1BH]                          ; 1116 _ 8D. 48, E5
        mov     eax, dword [ebp+0CH]                    ; 1119 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 111C _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 111F _ 8B. 45, 10
        sub     eax, 27                                 ; 1122 _ 83. E8, 1B
        push    ecx                                     ; 1125 _ 51
        push    edx                                     ; 1126 _ 52
        push    eax                                     ; 1127 _ 50
        push    0                                       ; 1128 _ 6A, 00
        push    7                                       ; 112A _ 6A, 07
        push    dword [ebp+0CH]                         ; 112C _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 112F _ FF. 75, 08
        call    boxfill8                                ; 1132 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1137 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 113A _ 8B. 45, 10
        lea     ecx, [eax-1H]                           ; 113D _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 1140 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 1143 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 1146 _ 8B. 45, 10
        sub     eax, 26                                 ; 1149 _ 83. E8, 1A
        push    ecx                                     ; 114C _ 51
        push    edx                                     ; 114D _ 52
        push    eax                                     ; 114E _ 50
        push    0                                       ; 114F _ 6A, 00
        push    8                                       ; 1151 _ 6A, 08
        push    dword [ebp+0CH]                         ; 1153 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1156 _ FF. 75, 08
        call    boxfill8                                ; 1159 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 115E _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 1161 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 1164 _ 8D. 50, E8
        mov     eax, dword [ebp+10H]                    ; 1167 _ 8B. 45, 10
        sub     eax, 24                                 ; 116A _ 83. E8, 18
        push    edx                                     ; 116D _ 52
        push    59                                      ; 116E _ 6A, 3B
        push    eax                                     ; 1170 _ 50
        push    3                                       ; 1171 _ 6A, 03
        push    7                                       ; 1173 _ 6A, 07
        push    dword [ebp+0CH]                         ; 1175 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1178 _ FF. 75, 08
        call    boxfill8                                ; 117B _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1180 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 1183 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 1186 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 1189 _ 8B. 45, 10
        sub     eax, 24                                 ; 118C _ 83. E8, 18
        push    edx                                     ; 118F _ 52
        push    2                                       ; 1190 _ 6A, 02
        push    eax                                     ; 1192 _ 50
        push    2                                       ; 1193 _ 6A, 02
        push    7                                       ; 1195 _ 6A, 07
        push    dword [ebp+0CH]                         ; 1197 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 119A _ FF. 75, 08
        call    boxfill8                                ; 119D _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 11A2 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 11A5 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 11A8 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 11AB _ 8B. 45, 10
        sub     eax, 4                                  ; 11AE _ 83. E8, 04
        push    edx                                     ; 11B1 _ 52
        push    59                                      ; 11B2 _ 6A, 3B
        push    eax                                     ; 11B4 _ 50
        push    3                                       ; 11B5 _ 6A, 03
        push    15                                      ; 11B7 _ 6A, 0F
        push    dword [ebp+0CH]                         ; 11B9 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 11BC _ FF. 75, 08
        call    boxfill8                                ; 11BF _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 11C4 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 11C7 _ 8B. 45, 10
        lea     edx, [eax-5H]                           ; 11CA _ 8D. 50, FB
        mov     eax, dword [ebp+10H]                    ; 11CD _ 8B. 45, 10
        sub     eax, 23                                 ; 11D0 _ 83. E8, 17
        push    edx                                     ; 11D3 _ 52
        push    59                                      ; 11D4 _ 6A, 3B
        push    eax                                     ; 11D6 _ 50
        push    59                                      ; 11D7 _ 6A, 3B
        push    15                                      ; 11D9 _ 6A, 0F
        push    dword [ebp+0CH]                         ; 11DB _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 11DE _ FF. 75, 08
        call    boxfill8                                ; 11E1 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 11E6 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 11E9 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 11EC _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 11EF _ 8B. 45, 10
        sub     eax, 3                                  ; 11F2 _ 83. E8, 03
        push    edx                                     ; 11F5 _ 52
        push    59                                      ; 11F6 _ 6A, 3B
        push    eax                                     ; 11F8 _ 50
        push    2                                       ; 11F9 _ 6A, 02
        push    0                                       ; 11FB _ 6A, 00
        push    dword [ebp+0CH]                         ; 11FD _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1200 _ FF. 75, 08
        call    boxfill8                                ; 1203 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1208 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 120B _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 120E _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 1211 _ 8B. 45, 10
        sub     eax, 24                                 ; 1214 _ 83. E8, 18
        push    edx                                     ; 1217 _ 52
        push    60                                      ; 1218 _ 6A, 3C
        push    eax                                     ; 121A _ 50
        push    60                                      ; 121B _ 6A, 3C
        push    0                                       ; 121D _ 6A, 00
        push    dword [ebp+0CH]                         ; 121F _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1222 _ FF. 75, 08
        call    boxfill8                                ; 1225 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 122A _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 122D _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 1230 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 1233 _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 1236 _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 1239 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 123C _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 123F _ 8B. 45, 0C
        sub     eax, 47                                 ; 1242 _ 83. E8, 2F
        push    ebx                                     ; 1245 _ 53
        push    ecx                                     ; 1246 _ 51
        push    edx                                     ; 1247 _ 52
        push    eax                                     ; 1248 _ 50
        push    7                                       ; 1249 _ 6A, 07
        push    dword [ebp+0CH]                         ; 124B _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 124E _ FF. 75, 08
        call    boxfill8                                ; 1251 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1256 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 1259 _ 8B. 45, 10
        lea     ebx, [eax-4H]                           ; 125C _ 8D. 58, FC
        mov     eax, dword [ebp+0CH]                    ; 125F _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 1262 _ 8D. 48, FD
        mov     eax, dword [ebp+10H]                    ; 1265 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 1268 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 126B _ 8B. 45, 0C
        sub     eax, 3                                  ; 126E _ 83. E8, 03
        push    ebx                                     ; 1271 _ 53
        push    ecx                                     ; 1272 _ 51
        push    edx                                     ; 1273 _ 52
        push    eax                                     ; 1274 _ 50
        push    7                                       ; 1275 _ 6A, 07
        push    dword [ebp+0CH]                         ; 1277 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 127A _ FF. 75, 08
        call    boxfill8                                ; 127D _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1282 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 1285 _ 8B. 45, 10
        lea     ebx, [eax-18H]                          ; 1288 _ 8D. 58, E8
        mov     eax, dword [ebp+0CH]                    ; 128B _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 128E _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 1291 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 1294 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 1297 _ 8B. 45, 0C
        sub     eax, 47                                 ; 129A _ 83. E8, 2F
        push    ebx                                     ; 129D _ 53
        push    ecx                                     ; 129E _ 51
        push    edx                                     ; 129F _ 52
        push    eax                                     ; 12A0 _ 50
        push    15                                      ; 12A1 _ 6A, 0F
        push    dword [ebp+0CH]                         ; 12A3 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 12A6 _ FF. 75, 08
        call    boxfill8                                ; 12A9 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 12AE _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 12B1 _ 8B. 45, 10
        lea     ebx, [eax-4H]                           ; 12B4 _ 8D. 58, FC
        mov     eax, dword [ebp+0CH]                    ; 12B7 _ 8B. 45, 0C
        lea     ecx, [eax-2FH]                          ; 12BA _ 8D. 48, D1
        mov     eax, dword [ebp+10H]                    ; 12BD _ 8B. 45, 10
        lea     edx, [eax-17H]                          ; 12C0 _ 8D. 50, E9
        mov     eax, dword [ebp+0CH]                    ; 12C3 _ 8B. 45, 0C
        sub     eax, 47                                 ; 12C6 _ 83. E8, 2F
        push    ebx                                     ; 12C9 _ 53
        push    ecx                                     ; 12CA _ 51
        push    edx                                     ; 12CB _ 52
        push    eax                                     ; 12CC _ 50
        push    15                                      ; 12CD _ 6A, 0F
        push    dword [ebp+0CH]                         ; 12CF _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 12D2 _ FF. 75, 08
        call    boxfill8                                ; 12D5 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 12DA _ 83. C4, 1C
        nop                                             ; 12DD _ 90
        mov     ebx, dword [ebp-4H]                     ; 12DE _ 8B. 5D, FC
        leave                                           ; 12E1 _ C9
        ret                                             ; 12E2 _ C3
; init_screen8 End of function

make_window8:; Function begin
        push    ebp                                     ; 12E3 _ 55
        mov     ebp, esp                                ; 12E4 _ 89. E5
        push    ebx                                     ; 12E6 _ 53
        sub     esp, 36                                 ; 12E7 _ 83. EC, 24
        mov     eax, dword [ebp+0CH]                    ; 12EA _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 12ED _ 8B. 40, 04
        mov     dword [ebp-10H], eax                    ; 12F0 _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 12F3 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 12F6 _ 8B. 40, 08
        mov     dword [ebp-0CH], eax                    ; 12F9 _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 12FC _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 12FF _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1302 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1305 _ 8B. 00
        push    0                                       ; 1307 _ 6A, 00
        push    edx                                     ; 1309 _ 52
        push    0                                       ; 130A _ 6A, 00
        push    0                                       ; 130C _ 6A, 00
        push    8                                       ; 130E _ 6A, 08
        push    dword [ebp-10H]                         ; 1310 _ FF. 75, F0
        push    eax                                     ; 1313 _ 50
        call    boxfill8                                ; 1314 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1319 _ 83. C4, 1C
        mov     eax, dword [ebp-10H]                    ; 131C _ 8B. 45, F0
        lea     edx, [eax-2H]                           ; 131F _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 1322 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1325 _ 8B. 00
        push    1                                       ; 1327 _ 6A, 01
        push    edx                                     ; 1329 _ 52
        push    1                                       ; 132A _ 6A, 01
        push    1                                       ; 132C _ 6A, 01
        push    7                                       ; 132E _ 6A, 07
        push    dword [ebp-10H]                         ; 1330 _ FF. 75, F0
        push    eax                                     ; 1333 _ 50
        call    boxfill8                                ; 1334 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1339 _ 83. C4, 1C
        mov     eax, dword [ebp-0CH]                    ; 133C _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 133F _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1342 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1345 _ 8B. 00
        push    edx                                     ; 1347 _ 52
        push    0                                       ; 1348 _ 6A, 00
        push    0                                       ; 134A _ 6A, 00
        push    0                                       ; 134C _ 6A, 00
        push    8                                       ; 134E _ 6A, 08
        push    dword [ebp-10H]                         ; 1350 _ FF. 75, F0
        push    eax                                     ; 1353 _ 50
        call    boxfill8                                ; 1354 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1359 _ 83. C4, 1C
        mov     eax, dword [ebp-0CH]                    ; 135C _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 135F _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1362 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1365 _ 8B. 00
        push    edx                                     ; 1367 _ 52
        push    1                                       ; 1368 _ 6A, 01
        push    1                                       ; 136A _ 6A, 01
        push    1                                       ; 136C _ 6A, 01
        push    8                                       ; 136E _ 6A, 08
        push    dword [ebp-10H]                         ; 1370 _ FF. 75, F0
        push    eax                                     ; 1373 _ 50
        call    boxfill8                                ; 1374 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1379 _ 83. C4, 1C
        mov     eax, dword [ebp-0CH]                    ; 137C _ 8B. 45, F4
        lea     ebx, [eax-2H]                           ; 137F _ 8D. 58, FE
        mov     eax, dword [ebp-10H]                    ; 1382 _ 8B. 45, F0
        lea     ecx, [eax-2H]                           ; 1385 _ 8D. 48, FE
        mov     eax, dword [ebp-10H]                    ; 1388 _ 8B. 45, F0
        lea     edx, [eax-2H]                           ; 138B _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 138E _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1391 _ 8B. 00
        push    ebx                                     ; 1393 _ 53
        push    ecx                                     ; 1394 _ 51
        push    1                                       ; 1395 _ 6A, 01
        push    edx                                     ; 1397 _ 52
        push    15                                      ; 1398 _ 6A, 0F
        push    dword [ebp-10H]                         ; 139A _ FF. 75, F0
        push    eax                                     ; 139D _ 50
        call    boxfill8                                ; 139E _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 13A3 _ 83. C4, 1C
        mov     eax, dword [ebp-0CH]                    ; 13A6 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 13A9 _ 8D. 58, FF
        mov     eax, dword [ebp-10H]                    ; 13AC _ 8B. 45, F0
        lea     ecx, [eax-1H]                           ; 13AF _ 8D. 48, FF
        mov     eax, dword [ebp-10H]                    ; 13B2 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 13B5 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 13B8 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 13BB _ 8B. 00
        push    ebx                                     ; 13BD _ 53
        push    ecx                                     ; 13BE _ 51
        push    0                                       ; 13BF _ 6A, 00
        push    edx                                     ; 13C1 _ 52
        push    0                                       ; 13C2 _ 6A, 00
        push    dword [ebp-10H]                         ; 13C4 _ FF. 75, F0
        push    eax                                     ; 13C7 _ 50
        call    boxfill8                                ; 13C8 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 13CD _ 83. C4, 1C
        mov     eax, dword [ebp-0CH]                    ; 13D0 _ 8B. 45, F4
        lea     ecx, [eax-3H]                           ; 13D3 _ 8D. 48, FD
        mov     eax, dword [ebp-10H]                    ; 13D6 _ 8B. 45, F0
        lea     edx, [eax-3H]                           ; 13D9 _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 13DC _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 13DF _ 8B. 00
        push    ecx                                     ; 13E1 _ 51
        push    edx                                     ; 13E2 _ 52
        push    2                                       ; 13E3 _ 6A, 02
        push    2                                       ; 13E5 _ 6A, 02
        push    8                                       ; 13E7 _ 6A, 08
        push    dword [ebp-10H]                         ; 13E9 _ FF. 75, F0
        push    eax                                     ; 13EC _ 50
        call    boxfill8                                ; 13ED _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 13F2 _ 83. C4, 1C
        mov     eax, dword [ebp-10H]                    ; 13F5 _ 8B. 45, F0
        lea     edx, [eax-4H]                           ; 13F8 _ 8D. 50, FC
        mov     eax, dword [ebp+0CH]                    ; 13FB _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 13FE _ 8B. 00
        push    20                                      ; 1400 _ 6A, 14
        push    edx                                     ; 1402 _ 52
        push    3                                       ; 1403 _ 6A, 03
        push    3                                       ; 1405 _ 6A, 03
        push    12                                      ; 1407 _ 6A, 0C
        push    dword [ebp-10H]                         ; 1409 _ FF. 75, F0
        push    eax                                     ; 140C _ 50
        call    boxfill8                                ; 140D _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1412 _ 83. C4, 1C
        mov     eax, dword [ebp-0CH]                    ; 1415 _ 8B. 45, F4
        lea     ebx, [eax-2H]                           ; 1418 _ 8D. 58, FE
        mov     eax, dword [ebp-10H]                    ; 141B _ 8B. 45, F0
        lea     ecx, [eax-2H]                           ; 141E _ 8D. 48, FE
        mov     eax, dword [ebp-0CH]                    ; 1421 _ 8B. 45, F4
        lea     edx, [eax-2H]                           ; 1424 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 1427 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 142A _ 8B. 00
        push    ebx                                     ; 142C _ 53
        push    ecx                                     ; 142D _ 51
        push    edx                                     ; 142E _ 52
        push    1                                       ; 142F _ 6A, 01
        push    15                                      ; 1431 _ 6A, 0F
        push    dword [ebp-10H]                         ; 1433 _ FF. 75, F0
        push    eax                                     ; 1436 _ 50
        call    boxfill8                                ; 1437 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 143C _ 83. C4, 1C
        mov     eax, dword [ebp-0CH]                    ; 143F _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 1442 _ 8D. 58, FF
        mov     eax, dword [ebp-10H]                    ; 1445 _ 8B. 45, F0
        lea     ecx, [eax-1H]                           ; 1448 _ 8D. 48, FF
        mov     eax, dword [ebp-0CH]                    ; 144B _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 144E _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1451 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1454 _ 8B. 00
        push    ebx                                     ; 1456 _ 53
        push    ecx                                     ; 1457 _ 51
        push    edx                                     ; 1458 _ 52
        push    0                                       ; 1459 _ 6A, 00
        push    0                                       ; 145B _ 6A, 00
        push    dword [ebp-10H]                         ; 145D _ FF. 75, F0
        push    eax                                     ; 1460 _ 50
        call    boxfill8                                ; 1461 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1466 _ 83. C4, 1C
        sub     esp, 8                                  ; 1469 _ 83. EC, 08
        push    dword [ebp+10H]                         ; 146C _ FF. 75, 10
        push    7                                       ; 146F _ 6A, 07
        push    4                                       ; 1471 _ 6A, 04
        push    24                                      ; 1473 _ 6A, 18
        push    dword [ebp+0CH]                         ; 1475 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1478 _ FF. 75, 08
        call    showString                              ; 147B _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1480 _ 83. C4, 20
        mov     dword [ebp-14H], 0                      ; 1483 _ C7. 45, EC, 00000000
        jmp     ?_069                                   ; 148A _ E9, 00000083

?_062:  mov     dword [ebp-18H], 0                      ; 148F _ C7. 45, E8, 00000000
        jmp     ?_068                                   ; 1496 _ EB, 70

?_063:  mov     eax, dword [ebp-14H]                    ; 1498 _ 8B. 45, EC
        shl     eax, 4                                  ; 149B _ C1. E0, 04
        mov     edx, eax                                ; 149E _ 89. C2
        mov     eax, dword [ebp-18H]                    ; 14A0 _ 8B. 45, E8
        add     eax, edx                                ; 14A3 _ 01. D0
        add     eax, closebtn.1866                      ; 14A5 _ 05, 00000160(d)
        movzx   eax, byte [eax]                         ; 14AA _ 0F B6. 00
        mov     byte [ebp-19H], al                      ; 14AD _ 88. 45, E7
        cmp     byte [ebp-19H], 64                      ; 14B0 _ 80. 7D, E7, 40
        jnz     ?_064                                   ; 14B4 _ 75, 06
        mov     byte [ebp-19H], 0                       ; 14B6 _ C6. 45, E7, 00
        jmp     ?_067                                   ; 14BA _ EB, 1C

?_064:  cmp     byte [ebp-19H], 36                      ; 14BC _ 80. 7D, E7, 24
        jnz     ?_065                                   ; 14C0 _ 75, 06
        mov     byte [ebp-19H], 15                      ; 14C2 _ C6. 45, E7, 0F
        jmp     ?_067                                   ; 14C6 _ EB, 10

?_065:  cmp     byte [ebp-19H], 81                      ; 14C8 _ 80. 7D, E7, 51
        jnz     ?_066                                   ; 14CC _ 75, 06
        mov     byte [ebp-19H], 8                       ; 14CE _ C6. 45, E7, 08
        jmp     ?_067                                   ; 14D2 _ EB, 04

?_066:  mov     byte [ebp-19H], 7                       ; 14D4 _ C6. 45, E7, 07
?_067:  mov     eax, dword [ebp+0CH]                    ; 14D8 _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 14DB _ 8B. 10
        mov     eax, dword [ebp-14H]                    ; 14DD _ 8B. 45, EC
        lea     ecx, [eax+5H]                           ; 14E0 _ 8D. 48, 05
        mov     eax, dword [ebp+0CH]                    ; 14E3 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 14E6 _ 8B. 40, 04
        imul    ecx, eax                                ; 14E9 _ 0F AF. C8
        mov     eax, dword [ebp+0CH]                    ; 14EC _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 14EF _ 8B. 40, 04
        lea     ebx, [eax-15H]                          ; 14F2 _ 8D. 58, EB
        mov     eax, dword [ebp-18H]                    ; 14F5 _ 8B. 45, E8
        add     eax, ebx                                ; 14F8 _ 01. D8
        add     eax, ecx                                ; 14FA _ 01. C8
        add     edx, eax                                ; 14FC _ 01. C2
        movzx   eax, byte [ebp-19H]                     ; 14FE _ 0F B6. 45, E7
        mov     byte [edx], al                          ; 1502 _ 88. 02
        add     dword [ebp-18H], 1                      ; 1504 _ 83. 45, E8, 01
?_068:  cmp     dword [ebp-18H], 15                     ; 1508 _ 83. 7D, E8, 0F
        jle     ?_063                                   ; 150C _ 7E, 8A
        add     dword [ebp-14H], 1                      ; 150E _ 83. 45, EC, 01
?_069:  cmp     dword [ebp-14H], 13                     ; 1512 _ 83. 7D, EC, 0D
        jle     ?_062                                   ; 1516 _ 0F 8E, FFFFFF73
        nop                                             ; 151C _ 90
        mov     ebx, dword [ebp-4H]                     ; 151D _ 8B. 5D, FC
        leave                                           ; 1520 _ C9
        ret                                             ; 1521 _ C3
; make_window8 End of function

message_box:; Function begin
        push    ebp                                     ; 1522 _ 55
        mov     ebp, esp                                ; 1523 _ 89. E5
        sub     esp, 24                                 ; 1525 _ 83. EC, 18
        sub     esp, 12                                 ; 1528 _ 83. EC, 0C
        push    dword [ebp+8H]                          ; 152B _ FF. 75, 08
        call    sheet_alloc                             ; 152E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1533 _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 1536 _ 89. 45, F0
        mov     eax, dword [memman]                     ; 1539 _ A1, 00000000(d)
        sub     esp, 8                                  ; 153E _ 83. EC, 08
        push    10880                                   ; 1541 _ 68, 00002A80
        push    eax                                     ; 1546 _ 50
        call    memman_alloc_4k                         ; 1547 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 154C _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 154F _ 89. 45, F4
        sub     esp, 12                                 ; 1552 _ 83. EC, 0C
        push    -1                                      ; 1555 _ 6A, FF
        push    68                                      ; 1557 _ 6A, 44
        push    160                                     ; 1559 _ 68, 000000A0
        push    dword [ebp-0CH]                         ; 155E _ FF. 75, F4
        push    dword [ebp-10H]                         ; 1561 _ FF. 75, F0
        call    sheet_setbuf                            ; 1564 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1569 _ 83. C4, 20
        sub     esp, 4                                  ; 156C _ 83. EC, 04
        push    dword [ebp+0CH]                         ; 156F _ FF. 75, 0C
        push    dword [ebp-10H]                         ; 1572 _ FF. 75, F0
        push    dword [ebp+8H]                          ; 1575 _ FF. 75, 08
        call    make_window8                            ; 1578 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 157D _ 83. C4, 10
        sub     esp, 8                                  ; 1580 _ 83. EC, 08
        push    ?_131                                   ; 1583 _ 68, 00000063(d)
        push    0                                       ; 1588 _ 6A, 00
        push    28                                      ; 158A _ 6A, 1C
        push    24                                      ; 158C _ 6A, 18
        push    dword [ebp-10H]                         ; 158E _ FF. 75, F0
        push    dword [ebp+8H]                          ; 1591 _ FF. 75, 08
        call    showString                              ; 1594 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1599 _ 83. C4, 20
        sub     esp, 8                                  ; 159C _ 83. EC, 08
        push    ?_132                                   ; 159F _ 68, 0000006F(d)
        push    0                                       ; 15A4 _ 6A, 00
        push    44                                      ; 15A6 _ 6A, 2C
        push    24                                      ; 15A8 _ 6A, 18
        push    dword [ebp-10H]                         ; 15AA _ FF. 75, F0
        push    dword [ebp+8H]                          ; 15AD _ FF. 75, 08
        call    showString                              ; 15B0 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 15B5 _ 83. C4, 20
        push    72                                      ; 15B8 _ 6A, 48
        push    80                                      ; 15BA _ 6A, 50
        push    dword [ebp-10H]                         ; 15BC _ FF. 75, F0
        push    dword [ebp+8H]                          ; 15BF _ FF. 75, 08
        call    sheet_slide                             ; 15C2 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 15C7 _ 83. C4, 10
        sub     esp, 4                                  ; 15CA _ 83. EC, 04
        push    1                                       ; 15CD _ 6A, 01
        push    dword [ebp-10H]                         ; 15CF _ FF. 75, F0
        push    dword [ebp+8H]                          ; 15D2 _ FF. 75, 08
        call    sheet_updown                            ; 15D5 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 15DA _ 83. C4, 10
        mov     eax, dword [ebp-10H]                    ; 15DD _ 8B. 45, F0
        leave                                           ; 15E0 _ C9
        ret                                             ; 15E1 _ C3
; message_box End of function

memman_init:; Function begin
        push    ebp                                     ; 15E2 _ 55
        mov     ebp, esp                                ; 15E3 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 15E5 _ 8B. 45, 08
        mov     dword [eax], 0                          ; 15E8 _ C7. 00, 00000000
        mov     eax, dword [ebp+8H]                     ; 15EE _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 15F1 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 15F8 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 15FB _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 1602 _ 8B. 45, 08
        mov     dword [eax+0CH], 0                      ; 1605 _ C7. 40, 0C, 00000000
        nop                                             ; 160C _ 90
        pop     ebp                                     ; 160D _ 5D
        ret                                             ; 160E _ C3
; memman_init End of function

memman_total:; Function begin
        push    ebp                                     ; 160F _ 55
        mov     ebp, esp                                ; 1610 _ 89. E5
        sub     esp, 16                                 ; 1612 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 1615 _ C7. 45, FC, 00000000
        mov     dword [ebp-8H], 0                       ; 161C _ C7. 45, F8, 00000000
        jmp     ?_071                                   ; 1623 _ EB, 14

?_070:  mov     eax, dword [ebp+8H]                     ; 1625 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1628 _ 8B. 55, F8
        add     edx, 2                                  ; 162B _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 162E _ 8B. 44 D0, 04
        add     dword [ebp-4H], eax                     ; 1632 _ 01. 45, FC
        add     dword [ebp-8H], 1                       ; 1635 _ 83. 45, F8, 01
?_071:  mov     eax, dword [ebp+8H]                     ; 1639 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 163C _ 8B. 00
        cmp     dword [ebp-8H], eax                     ; 163E _ 39. 45, F8
        jc      ?_070                                   ; 1641 _ 72, E2
        mov     eax, dword [ebp-4H]                     ; 1643 _ 8B. 45, FC
        leave                                           ; 1646 _ C9
        ret                                             ; 1647 _ C3
; memman_total End of function

memman_alloc:; Function begin
        push    ebp                                     ; 1648 _ 55
        mov     ebp, esp                                ; 1649 _ 89. E5
        sub     esp, 16                                 ; 164B _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 164E _ C7. 45, F8, 00000000
        jmp     ?_075                                   ; 1655 _ E9, 00000085

?_072:  mov     eax, dword [ebp+8H]                     ; 165A _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 165D _ 8B. 55, F8
        add     edx, 2                                  ; 1660 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 1663 _ 8B. 44 D0, 04
        cmp     dword [ebp+0CH], eax                    ; 1667 _ 39. 45, 0C
        ja      ?_074                                   ; 166A _ 77, 6F
        mov     eax, dword [ebp+8H]                     ; 166C _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 166F _ 8B. 55, F8
        add     edx, 2                                  ; 1672 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 1675 _ 8B. 04 D0
        mov     dword [ebp-4H], eax                     ; 1678 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 167B _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 167E _ 8B. 55, F8
        add     edx, 2                                  ; 1681 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 1684 _ 8B. 14 D0
        mov     eax, dword [ebp+0CH]                    ; 1687 _ 8B. 45, 0C
        lea     ecx, [edx+eax]                          ; 168A _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 168D _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1690 _ 8B. 55, F8
        add     edx, 2                                  ; 1693 _ 83. C2, 02
        mov     dword [eax+edx*8], ecx                  ; 1696 _ 89. 0C D0
        mov     eax, dword [ebp+8H]                     ; 1699 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 169C _ 8B. 55, F8
        add     edx, 2                                  ; 169F _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 16A2 _ 8B. 44 D0, 04
        sub     eax, dword [ebp+0CH]                    ; 16A6 _ 2B. 45, 0C
        mov     edx, eax                                ; 16A9 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 16AB _ 8B. 45, 08
        mov     ecx, dword [ebp-8H]                     ; 16AE _ 8B. 4D, F8
        add     ecx, 2                                  ; 16B1 _ 83. C1, 02
        mov     dword [eax+ecx*8+4H], edx               ; 16B4 _ 89. 54 C8, 04
        mov     eax, dword [ebp+8H]                     ; 16B8 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 16BB _ 8B. 55, F8
        add     edx, 2                                  ; 16BE _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 16C1 _ 8B. 44 D0, 04
        test    eax, eax                                ; 16C5 _ 85. C0
        jnz     ?_073                                   ; 16C7 _ 75, 0D
        mov     eax, dword [ebp+8H]                     ; 16C9 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 16CC _ 8B. 00
        lea     edx, [eax-1H]                           ; 16CE _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 16D1 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 16D4 _ 89. 10
?_073:  mov     eax, dword [ebp-4H]                     ; 16D6 _ 8B. 45, FC
        jmp     ?_076                                   ; 16D9 _ EB, 17

?_074:  add     dword [ebp-8H], 1                       ; 16DB _ 83. 45, F8, 01
?_075:  mov     eax, dword [ebp+8H]                     ; 16DF _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 16E2 _ 8B. 00
        cmp     dword [ebp-8H], eax                     ; 16E4 _ 39. 45, F8
        jc      ?_072                                   ; 16E7 _ 0F 82, FFFFFF6D
        mov     eax, 0                                  ; 16ED _ B8, 00000000
?_076:  leave                                           ; 16F2 _ C9
        ret                                             ; 16F3 _ C3
; memman_alloc End of function

memman_free:; Function begin
        push    ebp                                     ; 16F4 _ 55
        mov     ebp, esp                                ; 16F5 _ 89. E5
        push    ebx                                     ; 16F7 _ 53
        sub     esp, 16                                 ; 16F8 _ 83. EC, 10
        mov     dword [ebp-0CH], 0                      ; 16FB _ C7. 45, F4, 00000000
        jmp     ?_078                                   ; 1702 _ EB, 15

?_077:  mov     eax, dword [ebp+8H]                     ; 1704 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1707 _ 8B. 55, F4
        add     edx, 2                                  ; 170A _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 170D _ 8B. 04 D0
        cmp     dword [ebp+0CH], eax                    ; 1710 _ 39. 45, 0C
        jc      ?_079                                   ; 1713 _ 72, 10
        add     dword [ebp-0CH], 1                      ; 1715 _ 83. 45, F4, 01
?_078:  mov     eax, dword [ebp+8H]                     ; 1719 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 171C _ 8B. 00
        cmp     dword [ebp-0CH], eax                    ; 171E _ 39. 45, F4
        jl      ?_077                                   ; 1721 _ 7C, E1
        jmp     ?_080                                   ; 1723 _ EB, 01

?_079:  nop                                             ; 1725 _ 90
?_080:  cmp     dword [ebp-0CH], 0                      ; 1726 _ 83. 7D, F4, 00
        jle     ?_082                                   ; 172A _ 0F 8E, 000000B9
        mov     eax, dword [ebp-0CH]                    ; 1730 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1733 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1736 _ 8B. 45, 08
        add     edx, 2                                  ; 1739 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 173C _ 8B. 14 D0
        mov     eax, dword [ebp-0CH]                    ; 173F _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 1742 _ 8D. 48, FF
        mov     eax, dword [ebp+8H]                     ; 1745 _ 8B. 45, 08
        add     ecx, 2                                  ; 1748 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 174B _ 8B. 44 C8, 04
        add     eax, edx                                ; 174F _ 01. D0
        cmp     dword [ebp+0CH], eax                    ; 1751 _ 39. 45, 0C
        jne     ?_082                                   ; 1754 _ 0F 85, 0000008F
        mov     eax, dword [ebp-0CH]                    ; 175A _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 175D _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1760 _ 8B. 45, 08
        add     edx, 2                                  ; 1763 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 1766 _ 8B. 54 D0, 04
        mov     eax, dword [ebp-0CH]                    ; 176A _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 176D _ 8D. 58, FF
        mov     eax, dword [ebp+10H]                    ; 1770 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 1773 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1776 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 1779 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 177C _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 1780 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1783 _ 8B. 00
        test    eax, eax                                ; 1785 _ 85. C0
        jle     ?_081                                   ; 1787 _ 7E, 56
        mov     edx, dword [ebp+0CH]                    ; 1789 _ 8B. 55, 0C
        mov     eax, dword [ebp+10H]                    ; 178C _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 178F _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1792 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1795 _ 8B. 55, F4
        add     edx, 2                                  ; 1798 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 179B _ 8B. 04 D0
        cmp     ecx, eax                                ; 179E _ 39. C1
        jnz     ?_081                                   ; 17A0 _ 75, 3D
        mov     eax, dword [ebp-0CH]                    ; 17A2 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 17A5 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 17A8 _ 8B. 45, 08
        add     edx, 2                                  ; 17AB _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 17AE _ 8B. 54 D0, 04
        mov     eax, dword [ebp+8H]                     ; 17B2 _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 17B5 _ 8B. 4D, F4
        add     ecx, 2                                  ; 17B8 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 17BB _ 8B. 44 C8, 04
        mov     ecx, dword [ebp-0CH]                    ; 17BF _ 8B. 4D, F4
        lea     ebx, [ecx-1H]                           ; 17C2 _ 8D. 59, FF
        lea     ecx, [edx+eax]                          ; 17C5 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 17C8 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 17CB _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 17CE _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 17D2 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 17D5 _ 8B. 00
        lea     edx, [eax-1H]                           ; 17D7 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 17DA _ 8B. 45, 08
        mov     dword [eax], edx                        ; 17DD _ 89. 10
?_081:  mov     eax, 0                                  ; 17DF _ B8, 00000000
        jmp     ?_088                                   ; 17E4 _ E9, 0000011B

?_082:  mov     eax, dword [ebp+8H]                     ; 17E9 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 17EC _ 8B. 00
        test    eax, eax                                ; 17EE _ 85. C0
        jle     ?_083                                   ; 17F0 _ 7E, 52
        mov     edx, dword [ebp+0CH]                    ; 17F2 _ 8B. 55, 0C
        mov     eax, dword [ebp+10H]                    ; 17F5 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 17F8 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 17FB _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 17FE _ 8B. 55, F4
        add     edx, 2                                  ; 1801 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 1804 _ 8B. 04 D0
        cmp     ecx, eax                                ; 1807 _ 39. C1
        jnz     ?_083                                   ; 1809 _ 75, 39
        mov     eax, dword [ebp+8H]                     ; 180B _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 180E _ 8B. 55, F4
        add     edx, 2                                  ; 1811 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 1814 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 1818 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 181B _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 181E _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1821 _ 8B. 55, F4
        add     edx, 2                                  ; 1824 _ 83. C2, 02
        mov     dword [eax+edx*8+4H], ecx               ; 1827 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 182B _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 182E _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 1831 _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 1834 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 1837 _ 89. 14 C8
        mov     eax, 0                                  ; 183A _ B8, 00000000
        jmp     ?_088                                   ; 183F _ E9, 000000C0

?_083:  mov     eax, dword [ebp+8H]                     ; 1844 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1847 _ 8B. 00
        cmp     eax, 4095                               ; 1849 _ 3D, 00000FFF
        jg      ?_087                                   ; 184E _ 0F 8F, 00000087
        mov     eax, dword [ebp+8H]                     ; 1854 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1857 _ 8B. 00
        lea     edx, [eax+1H]                           ; 1859 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 185C _ 8B. 45, 08
        mov     dword [eax], edx                        ; 185F _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 1861 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1864 _ 8B. 00
        mov     dword [ebp-8H], eax                     ; 1866 _ 89. 45, F8
        jmp     ?_085                                   ; 1869 _ EB, 28

?_084:  mov     eax, dword [ebp-8H]                     ; 186B _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 186E _ 8D. 50, FF
        mov     ecx, dword [ebp+8H]                     ; 1871 _ 8B. 4D, 08
        mov     eax, dword [ebp-8H]                     ; 1874 _ 8B. 45, F8
        lea     ebx, [eax+2H]                           ; 1877 _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 187A _ 8B. 45, 08
        add     edx, 2                                  ; 187D _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 1880 _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 1883 _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 1885 _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 1888 _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 188B _ 89. 54 D9, 04
        sub     dword [ebp-8H], 1                       ; 188F _ 83. 6D, F8, 01
?_085:  mov     eax, dword [ebp-8H]                     ; 1893 _ 8B. 45, F8
        cmp     eax, dword [ebp-0CH]                    ; 1896 _ 3B. 45, F4
        jg      ?_084                                   ; 1899 _ 7F, D0
        mov     eax, dword [ebp+8H]                     ; 189B _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 189E _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 18A1 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 18A4 _ 8B. 00
        cmp     edx, eax                                ; 18A6 _ 39. C2
        jge     ?_086                                   ; 18A8 _ 7D, 0B
        mov     eax, dword [ebp+8H]                     ; 18AA _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 18AD _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 18AF _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 18B2 _ 89. 50, 04
?_086:  mov     eax, dword [ebp+8H]                     ; 18B5 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 18B8 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 18BB _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 18BE _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 18C1 _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 18C4 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 18C7 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 18CA _ 8D. 4A, 02
        mov     edx, dword [ebp+10H]                    ; 18CD _ 8B. 55, 10
        mov     dword [eax+ecx*8+4H], edx               ; 18D0 _ 89. 54 C8, 04
        mov     eax, 0                                  ; 18D4 _ B8, 00000000
        jmp     ?_088                                   ; 18D9 _ EB, 29

?_087:  mov     eax, dword [ebp+8H]                     ; 18DB _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 18DE _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 18E1 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 18E4 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 18E7 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 18EA _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 18ED _ 8B. 40, 08
        mov     edx, eax                                ; 18F0 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 18F2 _ 8B. 45, 10
        add     eax, edx                                ; 18F5 _ 01. D0
        mov     edx, eax                                ; 18F7 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 18F9 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 18FC _ 89. 50, 08
        mov     eax, 4294967295                         ; 18FF _ B8, FFFFFFFF
?_088:  add     esp, 16                                 ; 1904 _ 83. C4, 10
        pop     ebx                                     ; 1907 _ 5B
        pop     ebp                                     ; 1908 _ 5D
        ret                                             ; 1909 _ C3
; memman_free End of function

memman_alloc_4k:; Function begin
        push    ebp                                     ; 190A _ 55
        mov     ebp, esp                                ; 190B _ 89. E5
        sub     esp, 16                                 ; 190D _ 83. EC, 10
        mov     eax, dword [ebp+0CH]                    ; 1910 _ 8B. 45, 0C
        add     eax, 4095                               ; 1913 _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 1918 _ 25, FFFFF000
        mov     dword [ebp+0CH], eax                    ; 191D _ 89. 45, 0C
        push    dword [ebp+0CH]                         ; 1920 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1923 _ FF. 75, 08
        call    memman_alloc                            ; 1926 _ E8, FFFFFFFC(rel)
        add     esp, 8                                  ; 192B _ 83. C4, 08
        mov     dword [ebp-4H], eax                     ; 192E _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 1931 _ 8B. 45, FC
        leave                                           ; 1934 _ C9
        ret                                             ; 1935 _ C3
; memman_alloc_4k End of function

memman_free_4k:; Function begin
        push    ebp                                     ; 1936 _ 55
        mov     ebp, esp                                ; 1937 _ 89. E5
        sub     esp, 16                                 ; 1939 _ 83. EC, 10
        mov     eax, dword [ebp+10H]                    ; 193C _ 8B. 45, 10
        add     eax, 4095                               ; 193F _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 1944 _ 25, FFFFF000
        mov     dword [ebp+10H], eax                    ; 1949 _ 89. 45, 10
        push    dword [ebp+10H]                         ; 194C _ FF. 75, 10
        push    dword [ebp+0CH]                         ; 194F _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1952 _ FF. 75, 08
        call    memman_free                             ; 1955 _ E8, FFFFFFFC(rel)
        add     esp, 12                                 ; 195A _ 83. C4, 0C
        mov     dword [ebp-4H], eax                     ; 195D _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 1960 _ 8B. 45, FC
        leave                                           ; 1963 _ C9
        ret                                             ; 1964 _ C3
; memman_free_4k End of function

shtctl_init:; Function begin
        push    ebp                                     ; 1965 _ 55
        mov     ebp, esp                                ; 1966 _ 89. E5
        sub     esp, 24                                 ; 1968 _ 83. EC, 18
        sub     esp, 8                                  ; 196B _ 83. EC, 08
        push    9232                                    ; 196E _ 68, 00002410
        push    dword [ebp+8H]                          ; 1973 _ FF. 75, 08
        call    memman_alloc_4k                         ; 1976 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 197B _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 197E _ 89. 45, F4
        cmp     dword [ebp-0CH], 0                      ; 1981 _ 83. 7D, F4, 00
        jnz     ?_089                                   ; 1985 _ 75, 07
        mov     eax, 0                                  ; 1987 _ B8, 00000000
        jmp     ?_092                                   ; 198C _ EB, 54

?_089:  mov     eax, dword [ebp-0CH]                    ; 198E _ 8B. 45, F4
        mov     edx, dword [ebp+0CH]                    ; 1991 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 1994 _ 89. 10
        mov     eax, dword [ebp-0CH]                    ; 1996 _ 8B. 45, F4
        mov     edx, dword [ebp+10H]                    ; 1999 _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 199C _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 199F _ 8B. 45, F4
        mov     edx, dword [ebp+14H]                    ; 19A2 _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 19A5 _ 89. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 19A8 _ 8B. 45, F4
        mov     dword [eax+0CH], -1                     ; 19AB _ C7. 40, 0C, FFFFFFFF
        mov     dword [ebp-10H], 0                      ; 19B2 _ C7. 45, F0, 00000000
        jmp     ?_091                                   ; 19B9 _ EB, 1B

?_090:  mov     eax, dword [ebp-0CH]                    ; 19BB _ 8B. 45, F4
        mov     edx, dword [ebp-10H]                    ; 19BE _ 8B. 55, F0
        add     edx, 33                                 ; 19C1 _ 83. C2, 21
        shl     edx, 5                                  ; 19C4 _ C1. E2, 05
        add     eax, edx                                ; 19C7 _ 01. D0
        add     eax, 12                                 ; 19C9 _ 83. C0, 0C
        mov     dword [eax], 0                          ; 19CC _ C7. 00, 00000000
        add     dword [ebp-10H], 1                      ; 19D2 _ 83. 45, F0, 01
?_091:  cmp     dword [ebp-10H], 255                    ; 19D6 _ 81. 7D, F0, 000000FF
        jle     ?_090                                   ; 19DD _ 7E, DC
        mov     eax, dword [ebp-0CH]                    ; 19DF _ 8B. 45, F4
?_092:  leave                                           ; 19E2 _ C9
        ret                                             ; 19E3 _ C3
; shtctl_init End of function

sheet_alloc:; Function begin
        push    ebp                                     ; 19E4 _ 55
        mov     ebp, esp                                ; 19E5 _ 89. E5
        sub     esp, 16                                 ; 19E7 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 19EA _ C7. 45, F8, 00000000
        jmp     ?_095                                   ; 19F1 _ EB, 57

?_093:  mov     eax, dword [ebp+8H]                     ; 19F3 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 19F6 _ 8B. 55, F8
        add     edx, 33                                 ; 19F9 _ 83. C2, 21
        shl     edx, 5                                  ; 19FC _ C1. E2, 05
        add     eax, edx                                ; 19FF _ 01. D0
        add     eax, 12                                 ; 1A01 _ 83. C0, 0C
        mov     eax, dword [eax]                        ; 1A04 _ 8B. 00
        test    eax, eax                                ; 1A06 _ 85. C0
        jnz     ?_094                                   ; 1A08 _ 75, 3C
        mov     eax, dword [ebp-8H]                     ; 1A0A _ 8B. 45, F8
        shl     eax, 5                                  ; 1A0D _ C1. E0, 05
        lea     edx, [eax+410H]                         ; 1A10 _ 8D. 90, 00000410
        mov     eax, dword [ebp+8H]                     ; 1A16 _ 8B. 45, 08
        add     eax, edx                                ; 1A19 _ 01. D0
        mov     dword [ebp-4H], eax                     ; 1A1B _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 1A1E _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1A21 _ 8B. 55, F8
        lea     ecx, [edx+4H]                           ; 1A24 _ 8D. 4A, 04
        mov     edx, dword [ebp-4H]                     ; 1A27 _ 8B. 55, FC
        mov     dword [eax+ecx*4], edx                  ; 1A2A _ 89. 14 88
        mov     eax, dword [ebp-4H]                     ; 1A2D _ 8B. 45, FC
        mov     dword [eax+1CH], 1                      ; 1A30 _ C7. 40, 1C, 00000001
        mov     eax, dword [ebp-4H]                     ; 1A37 _ 8B. 45, FC
        mov     dword [eax+18H], -1                     ; 1A3A _ C7. 40, 18, FFFFFFFF
        mov     eax, dword [ebp-4H]                     ; 1A41 _ 8B. 45, FC
        jmp     ?_096                                   ; 1A44 _ EB, 12

?_094:  add     dword [ebp-8H], 1                       ; 1A46 _ 83. 45, F8, 01
?_095:  cmp     dword [ebp-8H], 255                     ; 1A4A _ 81. 7D, F8, 000000FF
        jle     ?_093                                   ; 1A51 _ 7E, A0
        mov     eax, 0                                  ; 1A53 _ B8, 00000000
?_096:  leave                                           ; 1A58 _ C9
        ret                                             ; 1A59 _ C3
; sheet_alloc End of function

sheet_setbuf:; Function begin
        push    ebp                                     ; 1A5A _ 55
        mov     ebp, esp                                ; 1A5B _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 1A5D _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 1A60 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 1A63 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 1A65 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 1A68 _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 1A6B _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1A6E _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 1A71 _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 1A74 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 1A77 _ 8B. 45, 08
        mov     edx, dword [ebp+18H]                    ; 1A7A _ 8B. 55, 18
        mov     dword [eax+14H], edx                    ; 1A7D _ 89. 50, 14
        nop                                             ; 1A80 _ 90
        pop     ebp                                     ; 1A81 _ 5D
        ret                                             ; 1A82 _ C3
; sheet_setbuf End of function

sheet_updown:; Function begin
        push    ebp                                     ; 1A83 _ 55
        mov     ebp, esp                                ; 1A84 _ 89. E5
        push    ebx                                     ; 1A86 _ 53
        sub     esp, 20                                 ; 1A87 _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 1A8A _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 1A8D _ 8B. 40, 18
        mov     dword [ebp-0CH], eax                    ; 1A90 _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 1A93 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1A96 _ 8B. 40, 0C
        add     eax, 1                                  ; 1A99 _ 83. C0, 01
        cmp     dword [ebp+10H], eax                    ; 1A9C _ 39. 45, 10
        jle     ?_097                                   ; 1A9F _ 7E, 0C
        mov     eax, dword [ebp+8H]                     ; 1AA1 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1AA4 _ 8B. 40, 0C
        add     eax, 1                                  ; 1AA7 _ 83. C0, 01
        mov     dword [ebp+10H], eax                    ; 1AAA _ 89. 45, 10
?_097:  cmp     dword [ebp+10H], -1                     ; 1AAD _ 83. 7D, 10, FF
        jge     ?_098                                   ; 1AB1 _ 7D, 07
        mov     dword [ebp+10H], -1                     ; 1AB3 _ C7. 45, 10, FFFFFFFF
?_098:  mov     eax, dword [ebp+0CH]                    ; 1ABA _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 1ABD _ 8B. 55, 10
        mov     dword [eax+18H], edx                    ; 1AC0 _ 89. 50, 18
        mov     eax, dword [ebp-0CH]                    ; 1AC3 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 1AC6 _ 3B. 45, 10
        jle     ?_105                                   ; 1AC9 _ 0F 8E, 0000013F
        cmp     dword [ebp+10H], 0                      ; 1ACF _ 83. 7D, 10, 00
        js      ?_101                                   ; 1AD3 _ 0F 88, 00000094
        mov     eax, dword [ebp-0CH]                    ; 1AD9 _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 1ADC _ 89. 45, F0
        jmp     ?_100                                   ; 1ADF _ EB, 31

?_099:  mov     eax, dword [ebp-10H]                    ; 1AE1 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 1AE4 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1AE7 _ 8B. 45, 08
        add     edx, 4                                  ; 1AEA _ 83. C2, 04
        mov     edx, dword [eax+edx*4]                  ; 1AED _ 8B. 14 90
        mov     eax, dword [ebp+8H]                     ; 1AF0 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 1AF3 _ 8B. 4D, F0
        add     ecx, 4                                  ; 1AF6 _ 83. C1, 04
        mov     dword [eax+ecx*4], edx                  ; 1AF9 _ 89. 14 88
        mov     eax, dword [ebp+8H]                     ; 1AFC _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 1AFF _ 8B. 55, F0
        add     edx, 4                                  ; 1B02 _ 83. C2, 04
        mov     eax, dword [eax+edx*4]                  ; 1B05 _ 8B. 04 90
        mov     edx, dword [ebp-10H]                    ; 1B08 _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 1B0B _ 89. 50, 18
        sub     dword [ebp-10H], 1                      ; 1B0E _ 83. 6D, F0, 01
?_100:  mov     eax, dword [ebp-10H]                    ; 1B12 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 1B15 _ 3B. 45, 10
        jg      ?_099                                   ; 1B18 _ 7F, C7
        mov     eax, dword [ebp+8H]                     ; 1B1A _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 1B1D _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 1B20 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 1B23 _ 8B. 55, 0C
        mov     dword [eax+ecx*4], edx                  ; 1B26 _ 89. 14 88
        mov     eax, dword [ebp+0CH]                    ; 1B29 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1B2C _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1B2F _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 1B32 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 1B35 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 1B38 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 1B3B _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 1B3E _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1B41 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 1B44 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 1B47 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1B4A _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1B4D _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 1B50 _ 8B. 40, 0C
        sub     esp, 8                                  ; 1B53 _ 83. EC, 08
        push    dword [ebp+10H]                         ; 1B56 _ FF. 75, 10
        push    ebx                                     ; 1B59 _ 53
        push    ecx                                     ; 1B5A _ 51
        push    edx                                     ; 1B5B _ 52
        push    eax                                     ; 1B5C _ 50
        push    dword [ebp+8H]                          ; 1B5D _ FF. 75, 08
        call    sheet_refreshsub                        ; 1B60 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1B65 _ 83. C4, 20
        jmp     ?_112                                   ; 1B68 _ E9, 000001AC

?_101:  mov     eax, dword [ebp+8H]                     ; 1B6D _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1B70 _ 8B. 40, 0C
        cmp     dword [ebp-0CH], eax                    ; 1B73 _ 39. 45, F4
        jge     ?_104                                   ; 1B76 _ 7D, 44
        mov     eax, dword [ebp-0CH]                    ; 1B78 _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 1B7B _ 89. 45, F0
        jmp     ?_103                                   ; 1B7E _ EB, 31

?_102:  mov     eax, dword [ebp-10H]                    ; 1B80 _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 1B83 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1B86 _ 8B. 45, 08
        add     edx, 4                                  ; 1B89 _ 83. C2, 04
        mov     edx, dword [eax+edx*4]                  ; 1B8C _ 8B. 14 90
        mov     eax, dword [ebp+8H]                     ; 1B8F _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 1B92 _ 8B. 4D, F0
        add     ecx, 4                                  ; 1B95 _ 83. C1, 04
        mov     dword [eax+ecx*4], edx                  ; 1B98 _ 89. 14 88
        mov     eax, dword [ebp+8H]                     ; 1B9B _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 1B9E _ 8B. 55, F0
        add     edx, 4                                  ; 1BA1 _ 83. C2, 04
        mov     eax, dword [eax+edx*4]                  ; 1BA4 _ 8B. 04 90
        mov     edx, dword [ebp-10H]                    ; 1BA7 _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 1BAA _ 89. 50, 18
        add     dword [ebp-10H], 1                      ; 1BAD _ 83. 45, F0, 01
?_103:  mov     eax, dword [ebp+8H]                     ; 1BB1 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1BB4 _ 8B. 40, 0C
        cmp     dword [ebp-10H], eax                    ; 1BB7 _ 39. 45, F0
        jl      ?_102                                   ; 1BBA _ 7C, C4
?_104:  mov     eax, dword [ebp+8H]                     ; 1BBC _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1BBF _ 8B. 40, 0C
        lea     edx, [eax-1H]                           ; 1BC2 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1BC5 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 1BC8 _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 1BCB _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1BCE _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1BD1 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 1BD4 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 1BD7 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 1BDA _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 1BDD _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 1BE0 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1BE3 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 1BE6 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 1BE9 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1BEC _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1BEF _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 1BF2 _ 8B. 40, 0C
        sub     esp, 8                                  ; 1BF5 _ 83. EC, 08
        push    0                                       ; 1BF8 _ 6A, 00
        push    ebx                                     ; 1BFA _ 53
        push    ecx                                     ; 1BFB _ 51
        push    edx                                     ; 1BFC _ 52
        push    eax                                     ; 1BFD _ 50
        push    dword [ebp+8H]                          ; 1BFE _ FF. 75, 08
        call    sheet_refreshsub                        ; 1C01 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1C06 _ 83. C4, 20
        jmp     ?_112                                   ; 1C09 _ E9, 0000010B

?_105:  mov     eax, dword [ebp-0CH]                    ; 1C0E _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 1C11 _ 3B. 45, 10
        jge     ?_112                                   ; 1C14 _ 0F 8D, 000000FF
        cmp     dword [ebp-0CH], 0                      ; 1C1A _ 83. 7D, F4, 00
        js      ?_108                                   ; 1C1E _ 78, 52
        mov     eax, dword [ebp-0CH]                    ; 1C20 _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 1C23 _ 89. 45, F0
        jmp     ?_107                                   ; 1C26 _ EB, 31

?_106:  mov     eax, dword [ebp-10H]                    ; 1C28 _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 1C2B _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1C2E _ 8B. 45, 08
        add     edx, 4                                  ; 1C31 _ 83. C2, 04
        mov     edx, dword [eax+edx*4]                  ; 1C34 _ 8B. 14 90
        mov     eax, dword [ebp+8H]                     ; 1C37 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 1C3A _ 8B. 4D, F0
        add     ecx, 4                                  ; 1C3D _ 83. C1, 04
        mov     dword [eax+ecx*4], edx                  ; 1C40 _ 89. 14 88
        mov     eax, dword [ebp+8H]                     ; 1C43 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 1C46 _ 8B. 55, F0
        add     edx, 4                                  ; 1C49 _ 83. C2, 04
        mov     eax, dword [eax+edx*4]                  ; 1C4C _ 8B. 04 90
        mov     edx, dword [ebp-10H]                    ; 1C4F _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 1C52 _ 89. 50, 18
        add     dword [ebp-10H], 1                      ; 1C55 _ 83. 45, F0, 01
?_107:  mov     eax, dword [ebp-10H]                    ; 1C59 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 1C5C _ 3B. 45, 10
        jl      ?_106                                   ; 1C5F _ 7C, C7
        mov     eax, dword [ebp+8H]                     ; 1C61 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 1C64 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 1C67 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 1C6A _ 8B. 55, 0C
        mov     dword [eax+ecx*4], edx                  ; 1C6D _ 89. 14 88
        jmp     ?_111                                   ; 1C70 _ EB, 68

?_108:  mov     eax, dword [ebp+8H]                     ; 1C72 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1C75 _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 1C78 _ 89. 45, F0
        jmp     ?_110                                   ; 1C7B _ EB, 37

?_109:  mov     eax, dword [ebp-10H]                    ; 1C7D _ 8B. 45, F0
        lea     ecx, [eax+1H]                           ; 1C80 _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 1C83 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 1C86 _ 8B. 55, F0
        add     edx, 4                                  ; 1C89 _ 83. C2, 04
        mov     edx, dword [eax+edx*4]                  ; 1C8C _ 8B. 14 90
        mov     eax, dword [ebp+8H]                     ; 1C8F _ 8B. 45, 08
        add     ecx, 4                                  ; 1C92 _ 83. C1, 04
        mov     dword [eax+ecx*4], edx                  ; 1C95 _ 89. 14 88
        mov     eax, dword [ebp-10H]                    ; 1C98 _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 1C9B _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1C9E _ 8B. 45, 08
        add     edx, 4                                  ; 1CA1 _ 83. C2, 04
        mov     eax, dword [eax+edx*4]                  ; 1CA4 _ 8B. 04 90
        mov     edx, dword [ebp-10H]                    ; 1CA7 _ 8B. 55, F0
        add     edx, 1                                  ; 1CAA _ 83. C2, 01
        mov     dword [eax+18H], edx                    ; 1CAD _ 89. 50, 18
        sub     dword [ebp-10H], 1                      ; 1CB0 _ 83. 6D, F0, 01
?_110:  mov     eax, dword [ebp-10H]                    ; 1CB4 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 1CB7 _ 3B. 45, 10
        jge     ?_109                                   ; 1CBA _ 7D, C1
        mov     eax, dword [ebp+8H]                     ; 1CBC _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 1CBF _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 1CC2 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 1CC5 _ 8B. 55, 0C
        mov     dword [eax+ecx*4], edx                  ; 1CC8 _ 89. 14 88
        mov     eax, dword [ebp+8H]                     ; 1CCB _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1CCE _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 1CD1 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1CD4 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 1CD7 _ 89. 50, 0C
?_111:  mov     eax, dword [ebp+0CH]                    ; 1CDA _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1CDD _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1CE0 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 1CE3 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 1CE6 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 1CE9 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 1CEC _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 1CEF _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1CF2 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 1CF5 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 1CF8 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1CFB _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1CFE _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 1D01 _ 8B. 40, 0C
        sub     esp, 8                                  ; 1D04 _ 83. EC, 08
        push    dword [ebp+10H]                         ; 1D07 _ FF. 75, 10
        push    ebx                                     ; 1D0A _ 53
        push    ecx                                     ; 1D0B _ 51
        push    edx                                     ; 1D0C _ 52
        push    eax                                     ; 1D0D _ 50
        push    dword [ebp+8H]                          ; 1D0E _ FF. 75, 08
        call    sheet_refreshsub                        ; 1D11 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1D16 _ 83. C4, 20
?_112:  nop                                             ; 1D19 _ 90
        mov     ebx, dword [ebp-4H]                     ; 1D1A _ 8B. 5D, FC
        leave                                           ; 1D1D _ C9
        ret                                             ; 1D1E _ C3
; sheet_updown End of function

sheet_refresh:; Function begin
        push    ebp                                     ; 1D1F _ 55
        mov     ebp, esp                                ; 1D20 _ 89. E5
        push    edi                                     ; 1D22 _ 57
        push    esi                                     ; 1D23 _ 56
        push    ebx                                     ; 1D24 _ 53
        sub     esp, 12                                 ; 1D25 _ 83. EC, 0C
        mov     eax, dword [ebp+0CH]                    ; 1D28 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 1D2B _ 8B. 40, 18
        test    eax, eax                                ; 1D2E _ 85. C0
        js      ?_113                                   ; 1D30 _ 78, 47
        mov     eax, dword [ebp+0CH]                    ; 1D32 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 1D35 _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 1D38 _ 8B. 55, 0C
        mov     ecx, dword [edx+10H]                    ; 1D3B _ 8B. 4A, 10
        mov     edx, dword [ebp+1CH]                    ; 1D3E _ 8B. 55, 1C
        lea     esi, [ecx+edx]                          ; 1D41 _ 8D. 34 11
        mov     edx, dword [ebp+0CH]                    ; 1D44 _ 8B. 55, 0C
        mov     ecx, dword [edx+0CH]                    ; 1D47 _ 8B. 4A, 0C
        mov     edx, dword [ebp+18H]                    ; 1D4A _ 8B. 55, 18
        lea     ebx, [ecx+edx]                          ; 1D4D _ 8D. 1C 11
        mov     edx, dword [ebp+0CH]                    ; 1D50 _ 8B. 55, 0C
        mov     ecx, dword [edx+10H]                    ; 1D53 _ 8B. 4A, 10
        mov     edx, dword [ebp+14H]                    ; 1D56 _ 8B. 55, 14
        add     ecx, edx                                ; 1D59 _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 1D5B _ 8B. 55, 0C
        mov     edi, dword [edx+0CH]                    ; 1D5E _ 8B. 7A, 0C
        mov     edx, dword [ebp+10H]                    ; 1D61 _ 8B. 55, 10
        add     edx, edi                                ; 1D64 _ 01. FA
        sub     esp, 8                                  ; 1D66 _ 83. EC, 08
        push    eax                                     ; 1D69 _ 50
        push    esi                                     ; 1D6A _ 56
        push    ebx                                     ; 1D6B _ 53
        push    ecx                                     ; 1D6C _ 51
        push    edx                                     ; 1D6D _ 52
        push    dword [ebp+8H]                          ; 1D6E _ FF. 75, 08
        call    sheet_refreshsub                        ; 1D71 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1D76 _ 83. C4, 20
?_113:  mov     eax, 0                                  ; 1D79 _ B8, 00000000
        lea     esp, [ebp-0CH]                          ; 1D7E _ 8D. 65, F4
        pop     ebx                                     ; 1D81 _ 5B
        pop     esi                                     ; 1D82 _ 5E
        pop     edi                                     ; 1D83 _ 5F
        pop     ebp                                     ; 1D84 _ 5D
        ret                                             ; 1D85 _ C3
; sheet_refresh End of function

sheet_slide_mouse:; Function begin
        push    ebp                                     ; 1D86 _ 55
        mov     ebp, esp                                ; 1D87 _ 89. E5
        push    ebx                                     ; 1D89 _ 53
        sub     esp, 20                                 ; 1D8A _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 1D8D _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 1D90 _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 1D93 _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 1D96 _ 8B. 45, 0C
        mov     eax, dword [eax+10H]                    ; 1D99 _ 8B. 40, 10
        mov     dword [ebp-0CH], eax                    ; 1D9C _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 1D9F _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 1DA2 _ 8B. 55, 10
        mov     dword [eax+0CH], edx                    ; 1DA5 _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 1DA8 _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 1DAB _ 8B. 55, 14
        mov     dword [eax+10H], edx                    ; 1DAE _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1DB1 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 1DB4 _ 8B. 40, 18
        test    eax, eax                                ; 1DB7 _ 85. C0
        js      ?_114                                   ; 1DB9 _ 78, 57
        mov     eax, dword [ebp-0CH]                    ; 1DBB _ 8B. 45, F4
        lea     edx, [eax+10H]                          ; 1DBE _ 8D. 50, 10
        mov     eax, dword [ebp-10H]                    ; 1DC1 _ 8B. 45, F0
        add     eax, 16                                 ; 1DC4 _ 83. C0, 10
        sub     esp, 8                                  ; 1DC7 _ 83. EC, 08
        push    0                                       ; 1DCA _ 6A, 00
        push    edx                                     ; 1DCC _ 52
        push    eax                                     ; 1DCD _ 50
        push    dword [ebp-0CH]                         ; 1DCE _ FF. 75, F4
        push    dword [ebp-10H]                         ; 1DD1 _ FF. 75, F0
        push    dword [ebp+8H]                          ; 1DD4 _ FF. 75, 08
        call    sheet_refreshsub                        ; 1DD7 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1DDC _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 1DDF _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 1DE2 _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 1DE5 _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 1DE8 _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 1DEB _ 8B. 55, 14
        add     ecx, edx                                ; 1DEE _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 1DF0 _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 1DF3 _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 1DF6 _ 8B. 55, 10
        add     edx, ebx                                ; 1DF9 _ 01. DA
        sub     esp, 8                                  ; 1DFB _ 83. EC, 08
        push    eax                                     ; 1DFE _ 50
        push    ecx                                     ; 1DFF _ 51
        push    edx                                     ; 1E00 _ 52
        push    dword [ebp+14H]                         ; 1E01 _ FF. 75, 14
        push    dword [ebp+10H]                         ; 1E04 _ FF. 75, 10
        push    dword [ebp+8H]                          ; 1E07 _ FF. 75, 08
        call    sheet_refreshsub                        ; 1E0A _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1E0F _ 83. C4, 20
?_114:  nop                                             ; 1E12 _ 90
        mov     ebx, dword [ebp-4H]                     ; 1E13 _ 8B. 5D, FC
        leave                                           ; 1E16 _ C9
        ret                                             ; 1E17 _ C3
; sheet_slide_mouse End of function

sheet_slide:; Function begin
        push    ebp                                     ; 1E18 _ 55
        mov     ebp, esp                                ; 1E19 _ 89. E5
        push    ebx                                     ; 1E1B _ 53
        sub     esp, 20                                 ; 1E1C _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 1E1F _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 1E22 _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 1E25 _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 1E28 _ 8B. 45, 0C
        mov     eax, dword [eax+10H]                    ; 1E2B _ 8B. 40, 10
        mov     dword [ebp-0CH], eax                    ; 1E2E _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 1E31 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 1E34 _ 8B. 55, 10
        mov     dword [eax+0CH], edx                    ; 1E37 _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 1E3A _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 1E3D _ 8B. 55, 14
        mov     dword [eax+10H], edx                    ; 1E40 _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1E43 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 1E46 _ 8B. 40, 18
        test    eax, eax                                ; 1E49 _ 85. C0
        js      ?_115                                   ; 1E4B _ 78, 61
        mov     eax, dword [ebp+0CH]                    ; 1E4D _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 1E50 _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 1E53 _ 8B. 45, F4
        add     edx, eax                                ; 1E56 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 1E58 _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 1E5B _ 8B. 48, 04
        mov     eax, dword [ebp-10H]                    ; 1E5E _ 8B. 45, F0
        add     eax, ecx                                ; 1E61 _ 01. C8
        sub     esp, 8                                  ; 1E63 _ 83. EC, 08
        push    0                                       ; 1E66 _ 6A, 00
        push    edx                                     ; 1E68 _ 52
        push    eax                                     ; 1E69 _ 50
        push    dword [ebp-0CH]                         ; 1E6A _ FF. 75, F4
        push    dword [ebp-10H]                         ; 1E6D _ FF. 75, F0
        push    dword [ebp+8H]                          ; 1E70 _ FF. 75, 08
        call    sheet_refreshsub                        ; 1E73 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1E78 _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 1E7B _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 1E7E _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 1E81 _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 1E84 _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 1E87 _ 8B. 55, 14
        add     ecx, edx                                ; 1E8A _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 1E8C _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 1E8F _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 1E92 _ 8B. 55, 10
        add     edx, ebx                                ; 1E95 _ 01. DA
        sub     esp, 8                                  ; 1E97 _ 83. EC, 08
        push    eax                                     ; 1E9A _ 50
        push    ecx                                     ; 1E9B _ 51
        push    edx                                     ; 1E9C _ 52
        push    dword [ebp+14H]                         ; 1E9D _ FF. 75, 14
        push    dword [ebp+10H]                         ; 1EA0 _ FF. 75, 10
        push    dword [ebp+8H]                          ; 1EA3 _ FF. 75, 08
        call    sheet_refreshsub                        ; 1EA6 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1EAB _ 83. C4, 20
?_115:  nop                                             ; 1EAE _ 90
        mov     ebx, dword [ebp-4H]                     ; 1EAF _ 8B. 5D, FC
        leave                                           ; 1EB2 _ C9
        ret                                             ; 1EB3 _ C3
; sheet_slide End of function

sheet_refreshsub:; Function begin
        push    ebp                                     ; 1EB4 _ 55
        mov     ebp, esp                                ; 1EB5 _ 89. E5
        sub     esp, 48                                 ; 1EB7 _ 83. EC, 30
        mov     eax, dword [ebp+8H]                     ; 1EBA _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1EBD _ 8B. 00
        mov     dword [ebp-14H], eax                    ; 1EBF _ 89. 45, EC
        mov     eax, dword [ebp+1CH]                    ; 1EC2 _ 8B. 45, 1C
        mov     dword [ebp-20H], eax                    ; 1EC5 _ 89. 45, E0
        jmp     ?_122                                   ; 1EC8 _ E9, 000000ED

?_116:  mov     eax, dword [ebp+8H]                     ; 1ECD _ 8B. 45, 08
        mov     edx, dword [ebp-20H]                    ; 1ED0 _ 8B. 55, E0
        add     edx, 4                                  ; 1ED3 _ 83. C2, 04
        mov     eax, dword [eax+edx*4]                  ; 1ED6 _ 8B. 04 90
        mov     dword [ebp-10H], eax                    ; 1ED9 _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 1EDC _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 1EDF _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 1EE1 _ 89. 45, F4
        mov     dword [ebp-18H], 0                      ; 1EE4 _ C7. 45, E8, 00000000
        jmp     ?_121                                   ; 1EEB _ E9, 000000B7

?_117:  mov     eax, dword [ebp-10H]                    ; 1EF0 _ 8B. 45, F0
        mov     edx, dword [eax+10H]                    ; 1EF3 _ 8B. 50, 10
        mov     eax, dword [ebp-18H]                    ; 1EF6 _ 8B. 45, E8
        add     eax, edx                                ; 1EF9 _ 01. D0
        mov     dword [ebp-8H], eax                     ; 1EFB _ 89. 45, F8
        mov     dword [ebp-1CH], 0                      ; 1EFE _ C7. 45, E4, 00000000
        jmp     ?_120                                   ; 1F05 _ E9, 0000008A

?_118:  mov     eax, dword [ebp-10H]                    ; 1F0A _ 8B. 45, F0
        mov     edx, dword [eax+0CH]                    ; 1F0D _ 8B. 50, 0C
        mov     eax, dword [ebp-1CH]                    ; 1F10 _ 8B. 45, E4
        add     eax, edx                                ; 1F13 _ 01. D0
        mov     dword [ebp-4H], eax                     ; 1F15 _ 89. 45, FC
        mov     eax, dword [ebp+0CH]                    ; 1F18 _ 8B. 45, 0C
        cmp     eax, dword [ebp-4H]                     ; 1F1B _ 3B. 45, FC
        jg      ?_119                                   ; 1F1E _ 7F, 70
        mov     eax, dword [ebp-4H]                     ; 1F20 _ 8B. 45, FC
        cmp     eax, dword [ebp+14H]                    ; 1F23 _ 3B. 45, 14
        jge     ?_119                                   ; 1F26 _ 7D, 68
        mov     eax, dword [ebp+10H]                    ; 1F28 _ 8B. 45, 10
        cmp     eax, dword [ebp-8H]                     ; 1F2B _ 3B. 45, F8
        jg      ?_119                                   ; 1F2E _ 7F, 60
        mov     eax, dword [ebp-8H]                     ; 1F30 _ 8B. 45, F8
        cmp     eax, dword [ebp+18H]                    ; 1F33 _ 3B. 45, 18
        jge     ?_119                                   ; 1F36 _ 7D, 58
        mov     eax, dword [ebp-10H]                    ; 1F38 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 1F3B _ 8B. 40, 04
        imul    eax, dword [ebp-18H]                    ; 1F3E _ 0F AF. 45, E8
        mov     edx, eax                                ; 1F42 _ 89. C2
        mov     eax, dword [ebp-1CH]                    ; 1F44 _ 8B. 45, E4
        add     eax, edx                                ; 1F47 _ 01. D0
        mov     edx, eax                                ; 1F49 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 1F4B _ 8B. 45, F4
        add     eax, edx                                ; 1F4E _ 01. D0
        movzx   eax, byte [eax]                         ; 1F50 _ 0F B6. 00
        mov     byte [ebp-21H], al                      ; 1F53 _ 88. 45, DF
        movzx   edx, byte [ebp-21H]                     ; 1F56 _ 0F B6. 55, DF
        mov     eax, dword [ebp-10H]                    ; 1F5A _ 8B. 45, F0
        mov     eax, dword [eax+14H]                    ; 1F5D _ 8B. 40, 14
        cmp     edx, eax                                ; 1F60 _ 39. C2
        jz      ?_119                                   ; 1F62 _ 74, 2C
        mov     eax, dword [ebp+8H]                     ; 1F64 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 1F67 _ 8B. 40, 04
        sub     eax, 1                                  ; 1F6A _ 83. E8, 01
        cmp     dword [ebp-4H], eax                     ; 1F6D _ 39. 45, FC
        jg      ?_119                                   ; 1F70 _ 7F, 1E
        mov     eax, dword [ebp+8H]                     ; 1F72 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 1F75 _ 8B. 40, 04
        imul    eax, dword [ebp-8H]                     ; 1F78 _ 0F AF. 45, F8
        mov     edx, eax                                ; 1F7C _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 1F7E _ 8B. 45, FC
        add     eax, edx                                ; 1F81 _ 01. D0
        mov     edx, eax                                ; 1F83 _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 1F85 _ 8B. 45, EC
        add     edx, eax                                ; 1F88 _ 01. C2
        movzx   eax, byte [ebp-21H]                     ; 1F8A _ 0F B6. 45, DF
        mov     byte [edx], al                          ; 1F8E _ 88. 02
?_119:  add     dword [ebp-1CH], 1                      ; 1F90 _ 83. 45, E4, 01
?_120:  mov     eax, dword [ebp-10H]                    ; 1F94 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 1F97 _ 8B. 40, 04
        cmp     dword [ebp-1CH], eax                    ; 1F9A _ 39. 45, E4
        jl      ?_118                                   ; 1F9D _ 0F 8C, FFFFFF67
        add     dword [ebp-18H], 1                      ; 1FA3 _ 83. 45, E8, 01
?_121:  mov     eax, dword [ebp-10H]                    ; 1FA7 _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 1FAA _ 8B. 40, 08
        cmp     dword [ebp-18H], eax                    ; 1FAD _ 39. 45, E8
        jl      ?_117                                   ; 1FB0 _ 0F 8C, FFFFFF3A
        add     dword [ebp-20H], 1                      ; 1FB6 _ 83. 45, E0, 01
?_122:  mov     eax, dword [ebp+8H]                     ; 1FBA _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1FBD _ 8B. 40, 0C
        cmp     dword [ebp-20H], eax                    ; 1FC0 _ 39. 45, E0
        jle     ?_116                                   ; 1FC3 _ 0F 8E, FFFFFF04
        nop                                             ; 1FC9 _ 90
        leave                                           ; 1FCA _ C9
        ret                                             ; 1FCB _ C3
; sheet_refreshsub End of function


SECTION .rodata align=1 noexecute                       ; section number 2, const

?_123:                                                  ; byte
        db 77H, 69H, 6EH, 64H, 64H, 6FH, 77H, 6EH       ; 0000 _ winddown
        db 00H                                          ; 0008 _ .

?_124:                                                  ; byte
        db 69H, 6DH, 70H, 72H, 6FH, 76H, 65H, 20H       ; 0009 _ improve 
        db 73H, 74H, 72H, 69H, 6EH, 67H, 20H, 73H       ; 0011 _ string s
        db 68H, 6FH, 77H, 69H, 6EH, 67H, 21H, 00H       ; 0019 _ howing!.

?_125:                                                  ; byte
        db 70H, 61H, 67H, 65H, 20H, 69H, 73H, 3AH       ; 0021 _ page is:
        db 20H, 00H                                     ; 0029 _  .

?_126:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 002B _ BaseAddr
        db 4CH, 3AH, 20H, 00H                           ; 0033 _ L: .

?_127:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0037 _ BaseAddr
        db 48H, 3AH, 20H, 00H                           ; 003F _ H: .

?_128:                                                  ; byte
        db 4CH, 65H, 6EH, 67H, 74H, 68H, 4CH, 6FH       ; 0043 _ LengthLo
        db 77H, 3AH, 20H, 00H                           ; 004B _ w: .

?_129:                                                  ; byte
        db 4CH, 65H, 6EH, 67H, 74H, 68H, 48H, 69H       ; 004F _ LengthHi
        db 67H, 68H, 3AH, 20H, 00H                      ; 0057 _ gh: .

?_130:                                                  ; byte
        db 54H, 79H, 70H, 65H, 3AH, 20H, 00H            ; 005C _ Type: .

?_131:                                                  ; byte
        db 57H, 65H, 6CH, 65H, 63H, 6FH, 6DH, 65H       ; 0063 _ Welecome
        db 20H, 74H, 6FH, 00H                           ; 006B _  to.

?_132:                                                  ; byte
        db 6DH, 79H, 4FH, 53H, 00H                      ; 006F _ myOS.


SECTION .eh_frame align=4 noexecute                     ; section number 3, const

        db 14H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0000 _ ........
        db 01H, 7AH, 52H, 00H, 01H, 7CH, 08H, 01H       ; 0008 _ .zR..|..
        db 1BH, 0CH, 04H, 04H, 88H, 01H, 00H, 00H       ; 0010 _ ........
        db 18H, 00H, 00H, 00H, 1CH, 00H, 00H, 00H       ; 0018 _ ........
        dd CMain-$-20H                                  ; 0020 _ 00000000 (rel)
        dd 0000039DH, 080E4100H                         ; 0024 _ 925 135151872 
        dd 0D420285H, 03834405H                         ; 002C _ 222429829 58934277 
        dd 0000001CH, 00000038H                         ; 0034 _ 28 56 
        dd CMain-$+361H                                 ; 003C _ 0000039D (rel)
        dd 00000021H, 080E4100H                         ; 0040 _ 33 135151872 
        dd 0D420285H, 0CC55D05H                         ; 0048 _ 222429829 214260997 
        dd 00000404H, 0000001CH                         ; 0050 _ 1028 28 
        dd 00000058H                                    ; 0058 _ 88 
        dd CMain-$+362H                                 ; 005C _ 000003BE (rel)
        dd 0000001DH, 080E4100H                         ; 0060 _ 29 135151872 
        dd 0D420285H, 0CC55905H                         ; 0068 _ 222429829 214259973 
        dd 00000404H, 0000001CH                         ; 0070 _ 1028 28 
        dd 00000078H                                    ; 0078 _ 120 
        dd CMain-$+35FH                                 ; 007C _ 000003DB (rel)
        dd 000000ACH, 080E4100H                         ; 0080 _ 172 135151872 
        dd 0D420285H, 0C5A80205H                        ; 0088 _ 222429829 -978845179 
        dd 0004040CH, 0000001CH                         ; 0090 _ 263180 28 
        dd 00000098H                                    ; 0098 _ 152 
        dd CMain-$+3EBH                                 ; 009C _ 00000487 (rel)
        dd 00000052H, 080E4100H                         ; 00A0 _ 82 135151872 
        dd 0D420285H, 0C54E0205H                        ; 00A8 _ 222429829 -984743419 
        dd 0004040CH, 00000020H                         ; 00B0 _ 263180 32 
        dd 000000B8H                                    ; 00B8 _ 184 
        dd CMain-$+41DH                                 ; 00BC _ 000004D9 (rel)
        dd 00000084H, 080E4100H                         ; 00C0 _ 132 135151872 
        dd 0D420285H, 03834405H                         ; 00C8 _ 222429829 58934277 
        dd 0C3C57C02H, 0004040CH                        ; 00D0 _ -1010467838 263180 
        dd 0000001CH, 000000DCH                         ; 00D8 _ 28 220 
        dd CMain-$+47DH                                 ; 00E0 _ 0000055D (rel)
        dd 00000191H, 080E4100H                         ; 00E4 _ 401 135151872 
        dd 0D420285H, 018D0305H                         ; 00EC _ 222429829 26018565 
        dd 04040CC5H, 0000001CH                         ; 00F4 _ 67374277 28 
        dd 000000FCH                                    ; 00FC _ 252 
        dd CMain-$+5EEH                                 ; 0100 _ 000006EE (rel)
        dd 000000DAH, 080E4100H                         ; 0104 _ 218 135151872 
        dd 0D420285H, 0C5D60205H                        ; 010C _ 222429829 -975830523 
        dd 0004040CH, 00000020H                         ; 0114 _ 263180 32 
        dd 0000011CH                                    ; 011C _ 284 
        dd CMain-$+6A8H                                 ; 0120 _ 000007C8 (rel)
        dd 0000006FH, 080E4100H                         ; 0124 _ 111 135151872 
        dd 0D420285H, 03834405H                         ; 012C _ 222429829 58934277 
        dd 41C36602H, 04040CC5H                         ; 0134 _ 1103324674 67374277 
        dd 0000001CH, 00000140H                         ; 013C _ 28 320 
        dd CMain-$+6F3H                                 ; 0144 _ 00000837 (rel)
        dd 0000005FH, 080E4100H                         ; 0148 _ 95 135151872 
        dd 0D420285H, 0C55B0205H                        ; 0150 _ 222429829 -983891451 
        dd 0004040CH, 0000001CH                         ; 0158 _ 263180 28 
        dd 00000160H                                    ; 0160 _ 352 
        dd CMain-$+732H                                 ; 0164 _ 00000896 (rel)
        dd 00000024H, 080E4100H                         ; 0168 _ 36 135151872 
        dd 0D420285H, 0CC56005H                         ; 0170 _ 222429829 214261765 
        dd 00000404H, 0000001CH                         ; 0178 _ 1028 28 
        dd 00000180H                                    ; 0180 _ 384 
        dd CMain-$+736H                                 ; 0184 _ 000008BA (rel)
        dd 00000048H, 080E4100H                         ; 0188 _ 72 135151872 
        dd 0D420285H, 0C5440205H                        ; 0190 _ 222429829 -985398779 
        dd 0004040CH, 0000001CH                         ; 0198 _ 263180 28 
        dd 000001A0H                                    ; 01A0 _ 416 
        dd CMain-$+75EH                                 ; 01A4 _ 00000902 (rel)
        dd 0000007DH, 080E4100H                         ; 01A8 _ 125 135151872 
        dd 0D420285H, 0C5790205H                        ; 01B0 _ 222429829 -981925371 
        dd 0004040CH, 0000001CH                         ; 01B8 _ 263180 28 
        dd 000001C0H                                    ; 01C0 _ 448 
        dd ?_028-$+1C4H                                 ; 01C4 _ 0000097F (rel)
        dd 00000020H, 080E4100H                         ; 01C8 _ 32 135151872 
        dd 0D420285H, 0CC55C05H                         ; 01D0 _ 222429829 214260741 
        dd 00000404H, 0000001CH                         ; 01D8 _ 1028 28 
        dd 000001E0H                                    ; 01E0 _ 480 
        dd ?_028-$+1E4H                                 ; 01E4 _ 0000099F (rel)
        dd 00000031H, 080E4100H                         ; 01E8 _ 49 135151872 
        dd 0D420285H, 0CC56D05H                         ; 01F0 _ 222429829 214265093 
        dd 00000404H, 0000001CH                         ; 01F8 _ 1028 28 
        dd 00000200H                                    ; 0200 _ 512 
        dd CMain-$+7CCH                                 ; 0204 _ 000009D0 (rel)
        dd 0000003EH, 080E4100H                         ; 0208 _ 62 135151872 
        dd 0D420285H, 0CC57A05H                         ; 0210 _ 222429829 214268421 
        dd 00000404H, 0000001CH                         ; 0218 _ 1028 28 
        dd 00000220H                                    ; 0220 _ 544 
        dd CMain-$+7EAH                                 ; 0224 _ 00000A0E (rel)
        dd 0000004FH, 080E4100H                         ; 0228 _ 79 135151872 
        dd 0D420285H, 0C54B0205H                        ; 0230 _ 222429829 -984940027 
        dd 0004040CH, 0000001CH                         ; 0238 _ 263180 28 
        dd 00000240H                                    ; 0240 _ 576 
        dd CMain-$+819H                                 ; 0244 _ 00000A5D (rel)
        dd 0000003EH, 080E4100H                         ; 0248 _ 62 135151872 
        dd 0D420285H, 0CC57A05H                         ; 0250 _ 222429829 214268421 
        dd 00000404H, 0000001CH                         ; 0258 _ 1028 28 
        dd 00000260H                                    ; 0260 _ 608 
        dd intHandlerFromC-$+264H                       ; 0264 _ 00000A9B (rel)
        dd 00000080H, 080E4100H                         ; 0268 _ 128 135151872 
        dd 0D420285H, 0C57C0205H                        ; 0270 _ 222429829 -981728763 
        dd 0004040CH, 0000001CH                         ; 0278 _ 263180 28 
        dd 00000280H                                    ; 0280 _ 640 
        dd CMain-$+897H                                 ; 0284 _ 00000B1B (rel)
        dd 00000070H, 080E4100H                         ; 0288 _ 112 135151872 
        dd 0D420285H, 0C56C0205H                        ; 0290 _ 222429829 -982777339 
        dd 0004040CH, 0000001CH                         ; 0298 _ 263180 28 
        dd 000002A0H                                    ; 02A0 _ 672 
        dd CMain-$+8E7H                                 ; 02A4 _ 00000B8B (rel)
        dd 00000015H, 080E4100H                         ; 02A8 _ 21 135151872 
        dd 0D420285H, 0CC55105H                         ; 02B0 _ 222429829 214257925 
        dd 00000404H, 0000001CH                         ; 02B8 _ 1028 28 
        dd 000002C0H                                    ; 02C0 _ 704 
        dd CMain-$+8DCH                                 ; 02C4 _ 00000BA0 (rel)
        dd 0000013FH, 080E4100H                         ; 02C8 _ 319 135151872 
        dd 0D420285H, 013B0305H                         ; 02D0 _ 222429829 20644613 
        dd 04040CC5H, 0000001CH                         ; 02D8 _ 67374277 28 
        dd 000002E0H                                    ; 02E0 _ 736 
        dd CMain-$+9FBH                                 ; 02E4 _ 00000CDF (rel)
        dd 00000109H, 080E4100H                         ; 02E8 _ 265 135151872 
        dd 0D420285H, 01050305H                         ; 02F0 _ 222429829 17105669 
        dd 04040CC5H, 0000001CH                         ; 02F8 _ 67374277 28 
        dd 00000300H                                    ; 0300 _ 768 
        dd CMain-$+0AE4H                                ; 0304 _ 00000DE8 (rel)
        dd 00000078H, 080E4100H                         ; 0308 _ 120 135151872 
        dd 0D420285H, 0C5740205H                        ; 0310 _ 222429829 -982253051 
        dd 0004040CH, 0000001CH                         ; 0318 _ 263180 28 
        dd 00000320H                                    ; 0320 _ 800 
        dd CMain-$+0B3CH                                ; 0324 _ 00000E60 (rel)
        dd 00000266H, 080E4100H                         ; 0328 _ 614 135151872 
        dd 0D420285H, 02620305H                         ; 0330 _ 222429829 39977733 
        dd 04040CC5H, 00000020H                         ; 0338 _ 67374277 32 
        dd 00000340H                                    ; 0340 _ 832 
        dd CMain-$+0D82H                                ; 0344 _ 000010C6 (rel)
        dd 0000021DH, 080E4100H                         ; 0348 _ 541 135151872 
        dd 0D420285H, 03834105H                         ; 0350 _ 222429829 58933509 
        dd 0C5021803H, 04040CC3H                        ; 0358 _ -989718525 67374275 
        dd 00000020H, 00000364H                         ; 0360 _ 32 868 
        dd CMain-$+0F7BH                                ; 0368 _ 000012E3 (rel)
        dd 0000023FH, 080E4100H                         ; 036C _ 575 135151872 
        dd 0D420285H, 03834405H                         ; 0374 _ 222429829 58934277 
        dd 0C5023703H, 04040CC3H                        ; 037C _ -989710589 67374275 
        dd 0000001CH, 00000388H                         ; 0384 _ 28 904 
        dd CMain-$+1196H                                ; 038C _ 00001522 (rel)
        dd 000000C0H, 080E4100H                         ; 0390 _ 192 135151872 
        dd 0D420285H, 0C5BC0205H                        ; 0398 _ 222429829 -977534459 
        dd 0004040CH, 00000014H                         ; 03A0 _ 263180 20 
        dd 00000000H, 00527A01H                         ; 03A8 _ 0 5405185 
        dd 01087C01H, 04040C1BH                         ; 03B0 _ 17333249 67374107 
        dd 00000188H, 0000001CH                         ; 03B8 _ 392 28 
        dd 0000001CH                                    ; 03C0 _ 28 
        dd CMain-$+121EH                                ; 03C4 _ 000015E2 (rel)
        dd 0000002DH, 080E4100H                         ; 03C8 _ 45 135151872 
        dd 0D420285H, 0CC56905H                         ; 03D0 _ 222429829 214264069 
        dd 00000404H, 0000001CH                         ; 03D8 _ 1028 28 
        dd 0000003CH                                    ; 03E0 _ 60 
        dd CMain-$+122BH                                ; 03E4 _ 0000160F (rel)
        dd 00000039H, 080E4100H                         ; 03E8 _ 57 135151872 
        dd 0D420285H, 0CC57505H                         ; 03F0 _ 222429829 214267141 
        dd 00000404H, 0000001CH                         ; 03F8 _ 1028 28 
        dd 0000005CH                                    ; 0400 _ 92 
        dd CMain-$+1244H                                ; 0404 _ 00001648 (rel)
        dd 000000ACH, 080E4100H                         ; 0408 _ 172 135151872 
        dd 0D420285H, 0C5A80205H                        ; 0410 _ 222429829 -978845179 
        dd 0004040CH, 00000024H                         ; 0418 _ 263180 36 
        dd 0000007CH                                    ; 0420 _ 124 
        dd CMain-$+12D0H                                ; 0424 _ 000016F4 (rel)
        dd 00000216H, 080E4100H                         ; 0428 _ 534 135151872 
        dd 0D420285H, 03834405H                         ; 0430 _ 222429829 58934277 
        dd 0C3020D03H, 040CC541H                        ; 0438 _ -1023275773 67945793 
        dd 00000004H, 0000001CH                         ; 0440 _ 4 28 
        dd 000000A4H                                    ; 0448 _ 164 
        dd CMain-$+14BEH                                ; 044C _ 0000190A (rel)
        dd 0000002CH, 080E4100H                         ; 0450 _ 44 135151872 
        dd 0D420285H, 0CC56805H                         ; 0458 _ 222429829 214263813 
        dd 00000404H, 0000001CH                         ; 0460 _ 1028 28 
        dd 000000C4H                                    ; 0468 _ 196 
        dd CMain-$+14CAH                                ; 046C _ 00001936 (rel)
        dd 0000002FH, 080E4100H                         ; 0470 _ 47 135151872 
        dd 0D420285H, 0CC56B05H                         ; 0478 _ 222429829 214264581 
        dd 00000404H, 00000014H                         ; 0480 _ 1028 20 
        dd 00000000H, 00527A01H                         ; 0488 _ 0 5405185 
        dd 01087C01H, 04040C1BH                         ; 0490 _ 17333249 67374107 
        dd 00000188H, 0000001CH                         ; 0498 _ 392 28 
        dd 0000001CH                                    ; 04A0 _ 28 
        dd CMain-$+14C1H                                ; 04A4 _ 00001965 (rel)
        dd 0000007FH, 080E4100H                         ; 04A8 _ 127 135151872 
        dd 0D420285H, 0C57B0205H                        ; 04B0 _ 222429829 -981794299 
        dd 0004040CH, 0000001CH                         ; 04B8 _ 263180 28 
        dd 0000003CH                                    ; 04C0 _ 60 
        dd CMain-$+1520H                                ; 04C4 _ 000019E4 (rel)
        dd 00000076H, 080E4100H                         ; 04C8 _ 118 135151872 
        dd 0D420285H, 0C5720205H                        ; 04D0 _ 222429829 -982384123 
        dd 0004040CH, 0000001CH                         ; 04D8 _ 263180 28 
        dd 0000005CH                                    ; 04E0 _ 92 
        dd CMain-$+1576H                                ; 04E4 _ 00001A5A (rel)
        dd 00000029H, 080E4100H                         ; 04E8 _ 41 135151872 
        dd 0D420285H, 0CC56505H                         ; 04F0 _ 222429829 214263045 
        dd 00000404H, 00000020H                         ; 04F8 _ 1028 32 
        dd 0000007CH                                    ; 0500 _ 124 
        dd CMain-$+157FH                                ; 0504 _ 00001A83 (rel)
        dd 0000029CH, 080E4100H                         ; 0508 _ 668 135151872 
        dd 0D420285H, 03834405H                         ; 0510 _ 222429829 58934277 
        dd 0C5029403H, 04040CC3H                        ; 0518 _ -989686781 67374275 
        dd 00000028H, 000000A0H                         ; 0520 _ 40 160 
        dd CMain-$+17F7H                                ; 0528 _ 00001D1F (rel)
        dd 00000067H, 080E4100H                         ; 052C _ 103 135151872 
        dd 0D420285H, 03874605H                         ; 0534 _ 222429829 59196933 
        dd 05830486H, 41C35A02H                         ; 053C _ 92472454 1103321602 
        dd 41C741C6H, 04040CC5H                         ; 0544 _ 1103577542 67374277 
        dd 00000020H, 000000CCH                         ; 054C _ 32 204 
        dd CMain-$+1832H                                ; 0554 _ 00001D86 (rel)
        dd 00000092H, 080E4100H                         ; 0558 _ 146 135151872 
        dd 0D420285H, 03834405H                         ; 0560 _ 222429829 58934277 
        dd 0C3C58A02H, 0004040CH                        ; 0568 _ -1010464254 263180 
        dd 00000020H, 000000F0H                         ; 0570 _ 32 240 
        dd CMain-$+18A0H                                ; 0578 _ 00001E18 (rel)
        dd 0000009CH, 080E4100H                         ; 057C _ 156 135151872 
        dd 0D420285H, 03834405H                         ; 0584 _ 222429829 58934277 
        dd 0C3C59402H, 0004040CH                        ; 058C _ -1010461694 263180 
        dd 0000001CH, 00000114H                         ; 0594 _ 28 276 
        dd CMain-$+1918H                                ; 059C _ 00001EB4 (rel)
        dd 00000118H, 080E4100H                         ; 05A0 _ 280 135151872 
        dd 0D420285H, 01140305H                         ; 05A8 _ 222429829 18088709 
        dd 04040CC5H                                    ; 05B0 _ 67374277 


SECTION .data   align=32 noexecute                      ; section number 4, data

keyval:                                                 ; byte
        db 30H, 78H                                     ; 0000 _ 0x

?_133:  db 00H                                          ; 0002 _ .

?_134:  db 00H, 00H, 00H, 00H, 00H                      ; 0003 _ .....

memman: dd 00100000H, 00000000H                         ; 0008 _ 1048576 0 
        dd 00000000H, 00000000H                         ; 0010 _ 0 0 
        dd 00000000H, 00000000H                         ; 0018 _ 0 0 

table_rgb.1678:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 00H, 0FFH     ; 0020 _ ........
        db 00H, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH   ; 0028 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0030 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0038 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 0040 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 0048 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0050 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0058 _ ........

cursor.1735:                                            ; byte
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

closebtn.1866:                                          ; byte
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

?_135:  resw    1                                       ; 0004

?_136:  resw    1                                       ; 0006

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

str.1779:                                               ; byte
        resb    1                                       ; 0208

?_137:  resb    9                                       ; 0209

?_138:  resb    1                                       ; 0212


