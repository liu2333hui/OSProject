; Disassembly of file: /home/bobkuo/eclipse-workspace/nasmCode/ckernel21.o
; Wed Apr 29 20:35:35 2020
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
extern io_hlt                                           ; near
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
        mov     dword [ebp-28H], eax                    ; 001C _ 89. 45, D8
        movzx   eax, word [?_136]                       ; 001F _ 0F B7. 05, 00000004(d)
        cwde                                            ; 0026 _ 98
        mov     dword [xsize], eax                      ; 0027 _ A3, 00000200(d)
        movzx   eax, word [?_137]                       ; 002C _ 0F B7. 05, 00000006(d)
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
        sub     esp, 8                                  ; 01F8 _ 83. EC, 08
        push    ?_124                                   ; 01FB _ 68, 00000000(d)
        push    dword [ebp-10H]                         ; 0200 _ FF. 75, F0
        call    message_box                             ; 0203 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0208 _ 83. C4, 10
        sub     esp, 4                                  ; 020B _ 83. EC, 04
        push    0                                       ; 020E _ 6A, 00
        push    dword [ebp-20H]                         ; 0210 _ FF. 75, E0
        push    dword [ebp-10H]                         ; 0213 _ FF. 75, F0
        call    sheet_updown                            ; 0216 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 021B _ 83. C4, 10
        sub     esp, 4                                  ; 021E _ 83. EC, 04
        push    100                                     ; 0221 _ 6A, 64
        push    dword [ebp-1CH]                         ; 0223 _ FF. 75, E4
        push    dword [ebp-10H]                         ; 0226 _ FF. 75, F0
        call    sheet_updown                            ; 0229 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 022E _ 83. C4, 10
        call    io_sti                                  ; 0231 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 0236 _ 83. EC, 0C
        push    mdec                                    ; 0239 _ 68, 000000E0(d)
        call    enable_mouse                            ; 023E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0243 _ 83. C4, 10
        mov     dword [ebp-0CH], 0                      ; 0246 _ C7. 45, F4, 00000000
        mov     dword [ebp-2CH], 0                      ; 024D _ C7. 45, D4, 00000000
?_001:  call    io_cli                                  ; 0254 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 0259 _ 83. EC, 0C
        push    keyinfo                                 ; 025C _ 68, 00000020(d)
        call    fifo8_status                            ; 0261 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0266 _ 83. C4, 10
        mov     ebx, eax                                ; 0269 _ 89. C3
        sub     esp, 12                                 ; 026B _ 83. EC, 0C
        push    mouseinfo                               ; 026E _ 68, 00000008(d)
        call    fifo8_status                            ; 0273 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0278 _ 83. C4, 10
        add     eax, ebx                                ; 027B _ 01. D8
        test    eax, eax                                ; 027D _ 85. C0
        jnz     ?_002                                   ; 027F _ 75, 0C
        call    io_sti                                  ; 0281 _ E8, FFFFFFFC(rel)
        call    io_hlt                                  ; 0286 _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 028B _ EB, C7
; CMain End of function

?_002:  ; Local function
        sub     esp, 12                                 ; 028D _ 83. EC, 0C
        push    keyinfo                                 ; 0290 _ 68, 00000020(d)
        call    fifo8_status                            ; 0295 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 029A _ 83. C4, 10
        test    eax, eax                                ; 029D _ 85. C0
        jz      ?_003                                   ; 029F _ 74, 6F
        call    io_sti                                  ; 02A1 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 02A6 _ 83. EC, 0C
        push    keyinfo                                 ; 02A9 _ 68, 00000020(d)
        call    fifo8_get                               ; 02AE _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 02B3 _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 02B6 _ 89. 45, F4
        cmp     dword [ebp-0CH], 28                     ; 02B9 _ 83. 7D, F4, 1C
        jnz     ?_001                                   ; 02BD _ 75, 95
        mov     ecx, dword [xsize]                      ; 02BF _ 8B. 0D, 00000200(d)
        mov     edx, dword [ebp-2CH]                    ; 02C5 _ 8B. 55, D4
        mov     eax, edx                                ; 02C8 _ 89. D0
        shl     eax, 2                                  ; 02CA _ C1. E0, 02
        add     eax, edx                                ; 02CD _ 01. D0
        shl     eax, 2                                  ; 02CF _ C1. E0, 02
        mov     edx, eax                                ; 02D2 _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 02D4 _ 8B. 45, EC
        add     eax, edx                                ; 02D7 _ 01. D0
        sub     esp, 4                                  ; 02D9 _ 83. EC, 04
        push    7                                       ; 02DC _ 6A, 07
        push    ecx                                     ; 02DE _ 51
        push    dword [ebp-2CH]                         ; 02DF _ FF. 75, D4
        push    dword [ebp-28H]                         ; 02E2 _ FF. 75, D8
        push    eax                                     ; 02E5 _ 50
        push    dword [ebp-20H]                         ; 02E6 _ FF. 75, E0
        push    dword [ebp-10H]                         ; 02E9 _ FF. 75, F0
        call    showMemoryInfo                          ; 02EC _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 02F1 _ 83. C4, 20
        add     dword [ebp-2CH], 1                      ; 02F4 _ 83. 45, D4, 01
        mov     eax, dword [ebp-2CH]                    ; 02F8 _ 8B. 45, D4
        cmp     eax, dword [ebp-18H]                    ; 02FB _ 3B. 45, E8
        jle     ?_001                                   ; 02FE _ 0F 8E, FFFFFF50
        mov     dword [ebp-2CH], 0                      ; 0304 _ C7. 45, D4, 00000000
        jmp     ?_001                                   ; 030B _ E9, FFFFFF44

?_003:  ; Local function
        sub     esp, 12                                 ; 0310 _ 83. EC, 0C
        push    mouseinfo                               ; 0313 _ 68, 00000008(d)
        call    fifo8_status                            ; 0318 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 031D _ 83. C4, 10
        test    eax, eax                                ; 0320 _ 85. C0
        je      ?_001                                   ; 0322 _ 0F 84, FFFFFF2C
        call    io_sti                                  ; 0328 _ E8, FFFFFFFC(rel)
        sub     esp, 4                                  ; 032D _ 83. EC, 04
        push    dword [ebp-1CH]                         ; 0330 _ FF. 75, E4
        push    dword [ebp-20H]                         ; 0333 _ FF. 75, E0
        push    dword [ebp-10H]                         ; 0336 _ FF. 75, F0
        call    show_mouse_info                         ; 0339 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 033E _ 83. C4, 10
        jmp     ?_001                                   ; 0341 _ E9, FFFFFF0E

initBootInfo:; Function begin
        push    ebp                                     ; 0346 _ 55
        mov     ebp, esp                                ; 0347 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 0349 _ 8B. 45, 08
        mov     dword [eax], 655360                     ; 034C _ C7. 00, 000A0000
        mov     eax, dword [ebp+8H]                     ; 0352 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 320                      ; 0355 _ 66: C7. 40, 04, 0140
        mov     eax, dword [ebp+8H]                     ; 035B _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 200                      ; 035E _ 66: C7. 40, 06, 00C8
        nop                                             ; 0364 _ 90
        pop     ebp                                     ; 0365 _ 5D
        ret                                             ; 0366 _ C3
; initBootInfo End of function

init_palette:; Function begin
        push    ebp                                     ; 0367 _ 55
        mov     ebp, esp                                ; 0368 _ 89. E5
        sub     esp, 8                                  ; 036A _ 83. EC, 08
        sub     esp, 4                                  ; 036D _ 83. EC, 04
        push    table_rgb.1669                          ; 0370 _ 68, 00000020(d)
        push    15                                      ; 0375 _ 6A, 0F
        push    0                                       ; 0377 _ 6A, 00
        call    set_palette                             ; 0379 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 037E _ 83. C4, 10
        nop                                             ; 0381 _ 90
        leave                                           ; 0382 _ C9
        ret                                             ; 0383 _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 0384 _ 55
        mov     ebp, esp                                ; 0385 _ 89. E5
        sub     esp, 24                                 ; 0387 _ 83. EC, 18
        call    io_load_eflags                          ; 038A _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 038F _ 89. 45, F4
        call    io_cli                                  ; 0392 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0397 _ 83. EC, 08
        push    dword [ebp+8H]                          ; 039A _ FF. 75, 08
        push    968                                     ; 039D _ 68, 000003C8
        call    io_out8                                 ; 03A2 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03A7 _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 03AA _ 8B. 45, 08
        mov     dword [ebp-10H], eax                    ; 03AD _ 89. 45, F0
        jmp     ?_005                                   ; 03B0 _ EB, 65

?_004:  mov     eax, dword [ebp+10H]                    ; 03B2 _ 8B. 45, 10
        movzx   eax, byte [eax]                         ; 03B5 _ 0F B6. 00
        shr     al, 2                                   ; 03B8 _ C0. E8, 02
        movzx   eax, al                                 ; 03BB _ 0F B6. C0
        sub     esp, 8                                  ; 03BE _ 83. EC, 08
        push    eax                                     ; 03C1 _ 50
        push    969                                     ; 03C2 _ 68, 000003C9
        call    io_out8                                 ; 03C7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03CC _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 03CF _ 8B. 45, 10
        add     eax, 1                                  ; 03D2 _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 03D5 _ 0F B6. 00
        shr     al, 2                                   ; 03D8 _ C0. E8, 02
        movzx   eax, al                                 ; 03DB _ 0F B6. C0
        sub     esp, 8                                  ; 03DE _ 83. EC, 08
        push    eax                                     ; 03E1 _ 50
        push    969                                     ; 03E2 _ 68, 000003C9
        call    io_out8                                 ; 03E7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03EC _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 03EF _ 8B. 45, 10
        add     eax, 2                                  ; 03F2 _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 03F5 _ 0F B6. 00
        shr     al, 2                                   ; 03F8 _ C0. E8, 02
        movzx   eax, al                                 ; 03FB _ 0F B6. C0
        sub     esp, 8                                  ; 03FE _ 83. EC, 08
        push    eax                                     ; 0401 _ 50
        push    969                                     ; 0402 _ 68, 000003C9
        call    io_out8                                 ; 0407 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 040C _ 83. C4, 10
        add     dword [ebp+10H], 3                      ; 040F _ 83. 45, 10, 03
        add     dword [ebp-10H], 1                      ; 0413 _ 83. 45, F0, 01
?_005:  mov     eax, dword [ebp-10H]                    ; 0417 _ 8B. 45, F0
        cmp     eax, dword [ebp+0CH]                    ; 041A _ 3B. 45, 0C
        jle     ?_004                                   ; 041D _ 7E, 93
        sub     esp, 12                                 ; 041F _ 83. EC, 0C
        push    dword [ebp-0CH]                         ; 0422 _ FF. 75, F4
        call    io_store_eflags                         ; 0425 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 042A _ 83. C4, 10
        nop                                             ; 042D _ 90
        leave                                           ; 042E _ C9
        ret                                             ; 042F _ C3
; set_palette End of function

boxfill8:; Function begin
        push    ebp                                     ; 0430 _ 55
        mov     ebp, esp                                ; 0431 _ 89. E5
        sub     esp, 20                                 ; 0433 _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 0436 _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 0439 _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 043C _ 8B. 45, 18
        mov     dword [ebp-4H], eax                     ; 043F _ 89. 45, FC
        jmp     ?_009                                   ; 0442 _ EB, 33

?_006:  mov     eax, dword [ebp+14H]                    ; 0444 _ 8B. 45, 14
        mov     dword [ebp-8H], eax                     ; 0447 _ 89. 45, F8
        jmp     ?_008                                   ; 044A _ EB, 1F

?_007:  mov     eax, dword [ebp-4H]                     ; 044C _ 8B. 45, FC
        imul    eax, dword [ebp+0CH]                    ; 044F _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0453 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0455 _ 8B. 45, F8
        add     eax, edx                                ; 0458 _ 01. D0
        mov     edx, eax                                ; 045A _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 045C _ 8B. 45, 08
        add     edx, eax                                ; 045F _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0461 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0465 _ 88. 02
        add     dword [ebp-8H], 1                       ; 0467 _ 83. 45, F8, 01
?_008:  mov     eax, dword [ebp-8H]                     ; 046B _ 8B. 45, F8
        cmp     eax, dword [ebp+1CH]                    ; 046E _ 3B. 45, 1C
        jle     ?_007                                   ; 0471 _ 7E, D9
        add     dword [ebp-4H], 1                       ; 0473 _ 83. 45, FC, 01
?_009:  mov     eax, dword [ebp-4H]                     ; 0477 _ 8B. 45, FC
        cmp     eax, dword [ebp+20H]                    ; 047A _ 3B. 45, 20
        jle     ?_006                                   ; 047D _ 7E, C5
        nop                                             ; 047F _ 90
        leave                                           ; 0480 _ C9
        ret                                             ; 0481 _ C3
; boxfill8 End of function

showString:; Function begin
        push    ebp                                     ; 0482 _ 55
        mov     ebp, esp                                ; 0483 _ 89. E5
        push    ebx                                     ; 0485 _ 53
        sub     esp, 36                                 ; 0486 _ 83. EC, 24
        mov     eax, dword [ebp+18H]                    ; 0489 _ 8B. 45, 18
        mov     byte [ebp-1CH], al                      ; 048C _ 88. 45, E4
        mov     eax, dword [ebp+10H]                    ; 048F _ 8B. 45, 10
        mov     dword [ebp-0CH], eax                    ; 0492 _ 89. 45, F4
        jmp     ?_011                                   ; 0495 _ EB, 3E

?_010:  mov     eax, dword [ebp+1CH]                    ; 0497 _ 8B. 45, 1C
        movzx   eax, byte [eax]                         ; 049A _ 0F B6. 00
        movzx   eax, al                                 ; 049D _ 0F B6. C0
        shl     eax, 4                                  ; 04A0 _ C1. E0, 04
        lea     ebx, [systemFont+eax]                   ; 04A3 _ 8D. 98, 00000000(d)
        movsx   ecx, byte [ebp-1CH]                     ; 04A9 _ 0F BE. 4D, E4
        mov     eax, dword [ebp+0CH]                    ; 04AD _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 04B0 _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 04B3 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 04B6 _ 8B. 00
        sub     esp, 8                                  ; 04B8 _ 83. EC, 08
        push    ebx                                     ; 04BB _ 53
        push    ecx                                     ; 04BC _ 51
        push    dword [ebp+14H]                         ; 04BD _ FF. 75, 14
        push    dword [ebp+10H]                         ; 04C0 _ FF. 75, 10
        push    edx                                     ; 04C3 _ 52
        push    eax                                     ; 04C4 _ 50
        call    showChar8                               ; 04C5 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 04CA _ 83. C4, 20
        add     dword [ebp+1CH], 1                      ; 04CD _ 83. 45, 1C, 01
        add     dword [ebp+10H], 8                      ; 04D1 _ 83. 45, 10, 08
?_011:  mov     eax, dword [ebp+1CH]                    ; 04D5 _ 8B. 45, 1C
        movzx   eax, byte [eax]                         ; 04D8 _ 0F B6. 00
        test    al, al                                  ; 04DB _ 84. C0
        jnz     ?_010                                   ; 04DD _ 75, B8
        mov     eax, dword [ebp+14H]                    ; 04DF _ 8B. 45, 14
        add     eax, 16                                 ; 04E2 _ 83. C0, 10
        sub     esp, 8                                  ; 04E5 _ 83. EC, 08
        push    eax                                     ; 04E8 _ 50
        push    dword [ebp+10H]                         ; 04E9 _ FF. 75, 10
        push    dword [ebp+14H]                         ; 04EC _ FF. 75, 14
        push    dword [ebp-0CH]                         ; 04EF _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 04F2 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 04F5 _ FF. 75, 08
        call    sheet_refresh                           ; 04F8 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 04FD _ 83. C4, 20
        nop                                             ; 0500 _ 90
        mov     ebx, dword [ebp-4H]                     ; 0501 _ 8B. 5D, FC
        leave                                           ; 0504 _ C9
        ret                                             ; 0505 _ C3
; showString End of function

showChar8:; Function begin
        push    ebp                                     ; 0506 _ 55
        mov     ebp, esp                                ; 0507 _ 89. E5
        sub     esp, 20                                 ; 0509 _ 83. EC, 14
        mov     eax, dword [ebp+18H]                    ; 050C _ 8B. 45, 18
        mov     byte [ebp-14H], al                      ; 050F _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 0512 _ C7. 45, FC, 00000000
        jmp     ?_021                                   ; 0519 _ E9, 0000016C

?_012:  mov     edx, dword [ebp-4H]                     ; 051E _ 8B. 55, FC
        mov     eax, dword [ebp+1CH]                    ; 0521 _ 8B. 45, 1C
        add     eax, edx                                ; 0524 _ 01. D0
        movzx   eax, byte [eax]                         ; 0526 _ 0F B6. 00
        mov     byte [ebp-5H], al                       ; 0529 _ 88. 45, FB
        cmp     byte [ebp-5H], 0                        ; 052C _ 80. 7D, FB, 00
        jns     ?_013                                   ; 0530 _ 79, 20
        mov     edx, dword [ebp+14H]                    ; 0532 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0535 _ 8B. 45, FC
        add     eax, edx                                ; 0538 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 053A _ 0F AF. 45, 0C
        mov     edx, eax                                ; 053E _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0540 _ 8B. 45, 10
        add     eax, edx                                ; 0543 _ 01. D0
        mov     edx, eax                                ; 0545 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0547 _ 8B. 45, 08
        add     edx, eax                                ; 054A _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 054C _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0550 _ 88. 02
?_013:  movsx   eax, byte [ebp-5H]                      ; 0552 _ 0F BE. 45, FB
        and     eax, 40H                                ; 0556 _ 83. E0, 40
        test    eax, eax                                ; 0559 _ 85. C0
        jz      ?_014                                   ; 055B _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 055D _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0560 _ 8B. 45, FC
        add     eax, edx                                ; 0563 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0565 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0569 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 056B _ 8B. 45, 10
        add     eax, edx                                ; 056E _ 01. D0
        lea     edx, [eax+1H]                           ; 0570 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0573 _ 8B. 45, 08
        add     edx, eax                                ; 0576 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0578 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 057C _ 88. 02
?_014:  movsx   eax, byte [ebp-5H]                      ; 057E _ 0F BE. 45, FB
        and     eax, 20H                                ; 0582 _ 83. E0, 20
        test    eax, eax                                ; 0585 _ 85. C0
        jz      ?_015                                   ; 0587 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 0589 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 058C _ 8B. 45, FC
        add     eax, edx                                ; 058F _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0591 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0595 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0597 _ 8B. 45, 10
        add     eax, edx                                ; 059A _ 01. D0
        lea     edx, [eax+2H]                           ; 059C _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 059F _ 8B. 45, 08
        add     edx, eax                                ; 05A2 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 05A4 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 05A8 _ 88. 02
?_015:  movsx   eax, byte [ebp-5H]                      ; 05AA _ 0F BE. 45, FB
        and     eax, 10H                                ; 05AE _ 83. E0, 10
        test    eax, eax                                ; 05B1 _ 85. C0
        jz      ?_016                                   ; 05B3 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 05B5 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 05B8 _ 8B. 45, FC
        add     eax, edx                                ; 05BB _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 05BD _ 0F AF. 45, 0C
        mov     edx, eax                                ; 05C1 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 05C3 _ 8B. 45, 10
        add     eax, edx                                ; 05C6 _ 01. D0
        lea     edx, [eax+3H]                           ; 05C8 _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 05CB _ 8B. 45, 08
        add     edx, eax                                ; 05CE _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 05D0 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 05D4 _ 88. 02
?_016:  movsx   eax, byte [ebp-5H]                      ; 05D6 _ 0F BE. 45, FB
        and     eax, 08H                                ; 05DA _ 83. E0, 08
        test    eax, eax                                ; 05DD _ 85. C0
        jz      ?_017                                   ; 05DF _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 05E1 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 05E4 _ 8B. 45, FC
        add     eax, edx                                ; 05E7 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 05E9 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 05ED _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 05EF _ 8B. 45, 10
        add     eax, edx                                ; 05F2 _ 01. D0
        lea     edx, [eax+4H]                           ; 05F4 _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 05F7 _ 8B. 45, 08
        add     edx, eax                                ; 05FA _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 05FC _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0600 _ 88. 02
?_017:  movsx   eax, byte [ebp-5H]                      ; 0602 _ 0F BE. 45, FB
        and     eax, 04H                                ; 0606 _ 83. E0, 04
        test    eax, eax                                ; 0609 _ 85. C0
        jz      ?_018                                   ; 060B _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 060D _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0610 _ 8B. 45, FC
        add     eax, edx                                ; 0613 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0615 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0619 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 061B _ 8B. 45, 10
        add     eax, edx                                ; 061E _ 01. D0
        lea     edx, [eax+5H]                           ; 0620 _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 0623 _ 8B. 45, 08
        add     edx, eax                                ; 0626 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0628 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 062C _ 88. 02
?_018:  movsx   eax, byte [ebp-5H]                      ; 062E _ 0F BE. 45, FB
        and     eax, 02H                                ; 0632 _ 83. E0, 02
        test    eax, eax                                ; 0635 _ 85. C0
        jz      ?_019                                   ; 0637 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 0639 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 063C _ 8B. 45, FC
        add     eax, edx                                ; 063F _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0641 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0645 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0647 _ 8B. 45, 10
        add     eax, edx                                ; 064A _ 01. D0
        lea     edx, [eax+6H]                           ; 064C _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 064F _ 8B. 45, 08
        add     edx, eax                                ; 0652 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0654 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0658 _ 88. 02
?_019:  movsx   eax, byte [ebp-5H]                      ; 065A _ 0F BE. 45, FB
        and     eax, 01H                                ; 065E _ 83. E0, 01
        test    eax, eax                                ; 0661 _ 85. C0
        jz      ?_020                                   ; 0663 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 0665 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0668 _ 8B. 45, FC
        add     eax, edx                                ; 066B _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 066D _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0671 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0673 _ 8B. 45, 10
        add     eax, edx                                ; 0676 _ 01. D0
        lea     edx, [eax+7H]                           ; 0678 _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 067B _ 8B. 45, 08
        add     edx, eax                                ; 067E _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0680 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0684 _ 88. 02
?_020:  add     dword [ebp-4H], 1                       ; 0686 _ 83. 45, FC, 01
?_021:  cmp     dword [ebp-4H], 15                      ; 068A _ 83. 7D, FC, 0F
        jle     ?_012                                   ; 068E _ 0F 8E, FFFFFE8A
        nop                                             ; 0694 _ 90
        leave                                           ; 0695 _ C9
        ret                                             ; 0696 _ C3
; showChar8 End of function

init_mouse_cursor:; Function begin
        push    ebp                                     ; 0697 _ 55
        mov     ebp, esp                                ; 0698 _ 89. E5
        sub     esp, 20                                 ; 069A _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 069D _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 06A0 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 06A3 _ C7. 45, FC, 00000000
        jmp     ?_028                                   ; 06AA _ E9, 000000B5

?_022:  mov     dword [ebp-8H], 0                       ; 06AF _ C7. 45, F8, 00000000
        jmp     ?_027                                   ; 06B6 _ E9, 0000009B

?_023:  mov     eax, dword [ebp-4H]                     ; 06BB _ 8B. 45, FC
        shl     eax, 4                                  ; 06BE _ C1. E0, 04
        mov     edx, eax                                ; 06C1 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 06C3 _ 8B. 45, F8
        add     eax, edx                                ; 06C6 _ 01. D0
        add     eax, cursor.1726                        ; 06C8 _ 05, 00000060(d)
        movzx   eax, byte [eax]                         ; 06CD _ 0F B6. 00
        cmp     al, 42                                  ; 06D0 _ 3C, 2A
        jnz     ?_024                                   ; 06D2 _ 75, 19
        mov     eax, dword [ebp-4H]                     ; 06D4 _ 8B. 45, FC
        shl     eax, 4                                  ; 06D7 _ C1. E0, 04
        mov     edx, eax                                ; 06DA _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 06DC _ 8B. 45, F8
        add     eax, edx                                ; 06DF _ 01. D0
        mov     edx, eax                                ; 06E1 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 06E3 _ 8B. 45, 08
        add     eax, edx                                ; 06E6 _ 01. D0
        mov     byte [eax], 0                           ; 06E8 _ C6. 00, 00
        jmp     ?_026                                   ; 06EB _ EB, 65

?_024:  mov     eax, dword [ebp-4H]                     ; 06ED _ 8B. 45, FC
        shl     eax, 4                                  ; 06F0 _ C1. E0, 04
        mov     edx, eax                                ; 06F3 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 06F5 _ 8B. 45, F8
        add     eax, edx                                ; 06F8 _ 01. D0
        add     eax, cursor.1726                        ; 06FA _ 05, 00000060(d)
        movzx   eax, byte [eax]                         ; 06FF _ 0F B6. 00
        cmp     al, 79                                  ; 0702 _ 3C, 4F
        jnz     ?_025                                   ; 0704 _ 75, 19
        mov     eax, dword [ebp-4H]                     ; 0706 _ 8B. 45, FC
        shl     eax, 4                                  ; 0709 _ C1. E0, 04
        mov     edx, eax                                ; 070C _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 070E _ 8B. 45, F8
        add     eax, edx                                ; 0711 _ 01. D0
        mov     edx, eax                                ; 0713 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0715 _ 8B. 45, 08
        add     eax, edx                                ; 0718 _ 01. D0
        mov     byte [eax], 7                           ; 071A _ C6. 00, 07
        jmp     ?_026                                   ; 071D _ EB, 33

?_025:  mov     eax, dword [ebp-4H]                     ; 071F _ 8B. 45, FC
        shl     eax, 4                                  ; 0722 _ C1. E0, 04
        mov     edx, eax                                ; 0725 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0727 _ 8B. 45, F8
        add     eax, edx                                ; 072A _ 01. D0
        add     eax, cursor.1726                        ; 072C _ 05, 00000060(d)
        movzx   eax, byte [eax]                         ; 0731 _ 0F B6. 00
        cmp     al, 46                                  ; 0734 _ 3C, 2E
        jnz     ?_026                                   ; 0736 _ 75, 1A
        mov     eax, dword [ebp-4H]                     ; 0738 _ 8B. 45, FC
        shl     eax, 4                                  ; 073B _ C1. E0, 04
        mov     edx, eax                                ; 073E _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0740 _ 8B. 45, F8
        add     eax, edx                                ; 0743 _ 01. D0
        mov     edx, eax                                ; 0745 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0747 _ 8B. 45, 08
        add     edx, eax                                ; 074A _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 074C _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0750 _ 88. 02
?_026:  add     dword [ebp-8H], 1                       ; 0752 _ 83. 45, F8, 01
?_027:  cmp     dword [ebp-8H], 15                      ; 0756 _ 83. 7D, F8, 0F
        jle     ?_023                                   ; 075A _ 0F 8E, FFFFFF5B
        add     dword [ebp-4H], 1                       ; 0760 _ 83. 45, FC, 01
?_028:  cmp     dword [ebp-4H], 15                      ; 0764 _ 83. 7D, FC, 0F
        jle     ?_022                                   ; 0768 _ 0F 8E, FFFFFF41
        nop                                             ; 076E _ 90
        leave                                           ; 076F _ C9
        ret                                             ; 0770 _ C3
; init_mouse_cursor End of function

putblock:; Function begin
        push    ebp                                     ; 0771 _ 55
        mov     ebp, esp                                ; 0772 _ 89. E5
        push    ebx                                     ; 0774 _ 53
        sub     esp, 16                                 ; 0775 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 0778 _ C7. 45, F8, 00000000
        jmp     ?_032                                   ; 077F _ EB, 50

?_029:  mov     dword [ebp-0CH], 0                      ; 0781 _ C7. 45, F4, 00000000
        jmp     ?_031                                   ; 0788 _ EB, 3B

?_030:  mov     eax, dword [ebp-8H]                     ; 078A _ 8B. 45, F8
        imul    eax, dword [ebp+24H]                    ; 078D _ 0F AF. 45, 24
        mov     edx, eax                                ; 0791 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 0793 _ 8B. 45, F4
        add     eax, edx                                ; 0796 _ 01. D0
        mov     edx, eax                                ; 0798 _ 89. C2
        mov     eax, dword [ebp+20H]                    ; 079A _ 8B. 45, 20
        add     eax, edx                                ; 079D _ 01. D0
        mov     ecx, dword [ebp+1CH]                    ; 079F _ 8B. 4D, 1C
        mov     edx, dword [ebp-8H]                     ; 07A2 _ 8B. 55, F8
        add     edx, ecx                                ; 07A5 _ 01. CA
        imul    edx, dword [ebp+0CH]                    ; 07A7 _ 0F AF. 55, 0C
        mov     ebx, dword [ebp+18H]                    ; 07AB _ 8B. 5D, 18
        mov     ecx, dword [ebp-0CH]                    ; 07AE _ 8B. 4D, F4
        add     ecx, ebx                                ; 07B1 _ 01. D9
        add     edx, ecx                                ; 07B3 _ 01. CA
        mov     ecx, edx                                ; 07B5 _ 89. D1
        mov     edx, dword [ebp+8H]                     ; 07B7 _ 8B. 55, 08
        add     edx, ecx                                ; 07BA _ 01. CA
        movzx   eax, byte [eax]                         ; 07BC _ 0F B6. 00
        mov     byte [edx], al                          ; 07BF _ 88. 02
        add     dword [ebp-0CH], 1                      ; 07C1 _ 83. 45, F4, 01
?_031:  mov     eax, dword [ebp-0CH]                    ; 07C5 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 07C8 _ 3B. 45, 10
        jl      ?_030                                   ; 07CB _ 7C, BD
        add     dword [ebp-8H], 1                       ; 07CD _ 83. 45, F8, 01
?_032:  mov     eax, dword [ebp-8H]                     ; 07D1 _ 8B. 45, F8
        cmp     eax, dword [ebp+14H]                    ; 07D4 _ 3B. 45, 14
        jl      ?_029                                   ; 07D7 _ 7C, A8
        nop                                             ; 07D9 _ 90
        add     esp, 16                                 ; 07DA _ 83. C4, 10
        pop     ebx                                     ; 07DD _ 5B
        pop     ebp                                     ; 07DE _ 5D
        ret                                             ; 07DF _ C3
; putblock End of function

intHandlerFromC:; Function begin
        push    ebp                                     ; 07E0 _ 55
        mov     ebp, esp                                ; 07E1 _ 89. E5
        sub     esp, 24                                 ; 07E3 _ 83. EC, 18
        mov     eax, dword [bootInfo]                   ; 07E6 _ A1, 00000000(d)
        mov     dword [ebp-14H], eax                    ; 07EB _ 89. 45, EC
        movzx   eax, word [?_136]                       ; 07EE _ 0F B7. 05, 00000004(d)
        cwde                                            ; 07F5 _ 98
        mov     dword [ebp-10H], eax                    ; 07F6 _ 89. 45, F0
        movzx   eax, word [?_137]                       ; 07F9 _ 0F B7. 05, 00000006(d)
        cwde                                            ; 0800 _ 98
        mov     dword [ebp-0CH], eax                    ; 0801 _ 89. 45, F4
        sub     esp, 8                                  ; 0804 _ 83. EC, 08
        push    33                                      ; 0807 _ 6A, 21
        push    32                                      ; 0809 _ 6A, 20
        call    io_out8                                 ; 080B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0810 _ 83. C4, 10
        mov     byte [ebp-15H], 0                       ; 0813 _ C6. 45, EB, 00
        sub     esp, 12                                 ; 0817 _ 83. EC, 0C
        push    96                                      ; 081A _ 6A, 60
        call    io_in8                                  ; 081C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0821 _ 83. C4, 10
        mov     byte [ebp-15H], al                      ; 0824 _ 88. 45, EB
        movzx   eax, byte [ebp-15H]                     ; 0827 _ 0F B6. 45, EB
        sub     esp, 8                                  ; 082B _ 83. EC, 08
        push    eax                                     ; 082E _ 50
        push    keyinfo                                 ; 082F _ 68, 00000020(d)
        call    fifo8_put                               ; 0834 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0839 _ 83. C4, 10
        nop                                             ; 083C _ 90
        leave                                           ; 083D _ C9
        ret                                             ; 083E _ C3
; intHandlerFromC End of function

charToHexVal:; Function begin
        push    ebp                                     ; 083F _ 55
        mov     ebp, esp                                ; 0840 _ 89. E5
        sub     esp, 4                                  ; 0842 _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 0845 _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 0848 _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 084B _ 80. 7D, FC, 09
        jle     ?_033                                   ; 084F _ 7E, 09
        movzx   eax, byte [ebp-4H]                      ; 0851 _ 0F B6. 45, FC
        add     eax, 55                                 ; 0855 _ 83. C0, 37
        jmp     ?_034                                   ; 0858 _ EB, 07

?_033:  movzx   eax, byte [ebp-4H]                      ; 085A _ 0F B6. 45, FC
        add     eax, 48                                 ; 085E _ 83. C0, 30
?_034:  leave                                           ; 0861 _ C9
        ret                                             ; 0862 _ C3
; charToHexVal End of function

charToHexStr:; Function begin
        push    ebp                                     ; 0863 _ 55
        mov     ebp, esp                                ; 0864 _ 89. E5
        sub     esp, 20                                 ; 0866 _ 83. EC, 14
        mov     eax, dword [ebp+8H]                     ; 0869 _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 086C _ 88. 45, EC
        movzx   eax, byte [ebp-14H]                     ; 086F _ 0F B6. 45, EC
        and     eax, 0FH                                ; 0873 _ 83. E0, 0F
        mov     byte [ebp-1H], al                       ; 0876 _ 88. 45, FF
        movsx   eax, byte [ebp-1H]                      ; 0879 _ 0F BE. 45, FF
        push    eax                                     ; 087D _ 50
        call    charToHexVal                            ; 087E _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 0883 _ 83. C4, 04
        mov     byte [?_135], al                        ; 0886 _ A2, 00000003(d)
        shr     byte [ebp-14H], 4                       ; 088B _ C0. 6D, EC, 04
        movzx   eax, byte [ebp-14H]                     ; 088F _ 0F B6. 45, EC
        movsx   eax, al                                 ; 0893 _ 0F BE. C0
        push    eax                                     ; 0896 _ 50
        call    charToHexVal                            ; 0897 _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 089C _ 83. C4, 04
        mov     byte [?_134], al                        ; 089F _ A2, 00000002(d)
        mov     eax, keyval                             ; 08A4 _ B8, 00000000(d)
        leave                                           ; 08A9 _ C9
        ret                                             ; 08AA _ C3
; charToHexStr End of function

intToHexStr:; Function begin
        push    ebp                                     ; 08AB _ 55
        mov     ebp, esp                                ; 08AC _ 89. E5
        sub     esp, 16                                 ; 08AE _ 83. EC, 10
        mov     byte [str.1770], 48                     ; 08B1 _ C6. 05, 00000208(d), 30
        mov     byte [?_138], 88                        ; 08B8 _ C6. 05, 00000209(d), 58
        mov     byte [?_139], 0                         ; 08BF _ C6. 05, 00000212(d), 00
        mov     dword [ebp-8H], 2                       ; 08C6 _ C7. 45, F8, 00000002
        mov     dword [ebp-0CH], 7                      ; 08CD _ C7. 45, F4, 00000007
        jmp     ?_038                                   ; 08D4 _ EB, 45

?_035:  mov     eax, dword [ebp+8H]                     ; 08D6 _ 8B. 45, 08
        and     eax, 0FH                                ; 08D9 _ 83. E0, 0F
        mov     dword [ebp-4H], eax                     ; 08DC _ 89. 45, FC
        cmp     dword [ebp-4H], 9                       ; 08DF _ 83. 7D, FC, 09
        jg      ?_036                                   ; 08E3 _ 7F, 18
        mov     eax, dword [ebp-4H]                     ; 08E5 _ 8B. 45, FC
        lea     ecx, [eax+30H]                          ; 08E8 _ 8D. 48, 30
        mov     edx, dword [ebp-8H]                     ; 08EB _ 8B. 55, F8
        mov     eax, dword [ebp-0CH]                    ; 08EE _ 8B. 45, F4
        add     eax, edx                                ; 08F1 _ 01. D0
        mov     edx, ecx                                ; 08F3 _ 89. CA
        mov     byte [str.1770+eax], dl                 ; 08F5 _ 88. 90, 00000208(d)
        jmp     ?_037                                   ; 08FB _ EB, 16

?_036:  mov     eax, dword [ebp-4H]                     ; 08FD _ 8B. 45, FC
        lea     ecx, [eax+37H]                          ; 0900 _ 8D. 48, 37
        mov     edx, dword [ebp-8H]                     ; 0903 _ 8B. 55, F8
        mov     eax, dword [ebp-0CH]                    ; 0906 _ 8B. 45, F4
        add     eax, edx                                ; 0909 _ 01. D0
        mov     edx, ecx                                ; 090B _ 89. CA
        mov     byte [str.1770+eax], dl                 ; 090D _ 88. 90, 00000208(d)
?_037:  shr     dword [ebp+8H], 4                       ; 0913 _ C1. 6D, 08, 04
        sub     dword [ebp-0CH], 1                      ; 0917 _ 83. 6D, F4, 01
?_038:  cmp     dword [ebp-0CH], 0                      ; 091B _ 83. 7D, F4, 00
        jns     ?_035                                   ; 091F _ 79, B5
        mov     eax, str.1770                           ; 0921 _ B8, 00000208(d)
        leave                                           ; 0926 _ C9
        ret                                             ; 0927 _ C3
; intToHexStr End of function

wait_KBC_sendReady:; Function begin
        push    ebp                                     ; 0928 _ 55
        mov     ebp, esp                                ; 0929 _ 89. E5
        sub     esp, 8                                  ; 092B _ 83. EC, 08
?_039:  sub     esp, 12                                 ; 092E _ 83. EC, 0C
        push    100                                     ; 0931 _ 6A, 64
        call    io_in8                                  ; 0933 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0938 _ 83. C4, 10
        and     eax, 02H                                ; 093B _ 83. E0, 02
        test    eax, eax                                ; 093E _ 85. C0
        jz      ?_040                                   ; 0940 _ 74, 02
        jmp     ?_039                                   ; 0942 _ EB, EA
; wait_KBC_sendReady End of function

?_040:  ; Local function
        nop                                             ; 0944 _ 90
        nop                                             ; 0945 _ 90
        leave                                           ; 0946 _ C9
        ret                                             ; 0947 _ C3

init_keyboard:; Function begin
        push    ebp                                     ; 0948 _ 55
        mov     ebp, esp                                ; 0949 _ 89. E5
        sub     esp, 8                                  ; 094B _ 83. EC, 08
        call    wait_KBC_sendReady                      ; 094E _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0953 _ 83. EC, 08
        push    96                                      ; 0956 _ 6A, 60
        push    100                                     ; 0958 _ 6A, 64
        call    io_out8                                 ; 095A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 095F _ 83. C4, 10
        call    wait_KBC_sendReady                      ; 0962 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0967 _ 83. EC, 08
        push    71                                      ; 096A _ 6A, 47
        push    96                                      ; 096C _ 6A, 60
        call    io_out8                                 ; 096E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0973 _ 83. C4, 10
        nop                                             ; 0976 _ 90
        leave                                           ; 0977 _ C9
        ret                                             ; 0978 _ C3
; init_keyboard End of function

enable_mouse:; Function begin
        push    ebp                                     ; 0979 _ 55
        mov     ebp, esp                                ; 097A _ 89. E5
        sub     esp, 8                                  ; 097C _ 83. EC, 08
        call    wait_KBC_sendReady                      ; 097F _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0984 _ 83. EC, 08
        push    212                                     ; 0987 _ 68, 000000D4
        push    100                                     ; 098C _ 6A, 64
        call    io_out8                                 ; 098E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0993 _ 83. C4, 10
        call    wait_KBC_sendReady                      ; 0996 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 099B _ 83. EC, 08
        push    244                                     ; 099E _ 68, 000000F4
        push    96                                      ; 09A3 _ 6A, 60
        call    io_out8                                 ; 09A5 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 09AA _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 09AD _ 8B. 45, 08
        mov     byte [eax+3H], 0                        ; 09B0 _ C6. 40, 03, 00
        nop                                             ; 09B4 _ 90
        leave                                           ; 09B5 _ C9
        ret                                             ; 09B6 _ C3
; enable_mouse End of function

intHandlerFromMouse:; Function begin
        push    ebp                                     ; 09B7 _ 55
        mov     ebp, esp                                ; 09B8 _ 89. E5
        sub     esp, 24                                 ; 09BA _ 83. EC, 18
        sub     esp, 8                                  ; 09BD _ 83. EC, 08
        push    32                                      ; 09C0 _ 6A, 20
        push    160                                     ; 09C2 _ 68, 000000A0
        call    io_out8                                 ; 09C7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 09CC _ 83. C4, 10
        sub     esp, 8                                  ; 09CF _ 83. EC, 08
        push    32                                      ; 09D2 _ 6A, 20
        push    32                                      ; 09D4 _ 6A, 20
        call    io_out8                                 ; 09D6 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 09DB _ 83. C4, 10
        sub     esp, 12                                 ; 09DE _ 83. EC, 0C
        push    96                                      ; 09E1 _ 6A, 60
        call    io_in8                                  ; 09E3 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 09E8 _ 83. C4, 10
        mov     byte [ebp-9H], al                       ; 09EB _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 09EE _ 0F B6. 45, F7
        sub     esp, 8                                  ; 09F2 _ 83. EC, 08
        push    eax                                     ; 09F5 _ 50
        push    mouseinfo                               ; 09F6 _ 68, 00000008(d)
        call    fifo8_put                               ; 09FB _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0A00 _ 83. C4, 10
        nop                                             ; 0A03 _ 90
        leave                                           ; 0A04 _ C9
        ret                                             ; 0A05 _ C3
; intHandlerFromMouse End of function

fifo8_init:; Function begin
        push    ebp                                     ; 0A06 _ 55
        mov     ebp, esp                                ; 0A07 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 0A09 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 0A0C _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 0A0F _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 0A12 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 0A15 _ 8B. 55, 10
        mov     dword [eax], edx                        ; 0A18 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 0A1A _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 0A1D _ 8B. 55, 0C
        mov     dword [eax+10H], edx                    ; 0A20 _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 0A23 _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 0A26 _ C7. 40, 14, 00000000
        mov     eax, dword [ebp+8H]                     ; 0A2D _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 0A30 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 0A37 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 0A3A _ C7. 40, 08, 00000000
        nop                                             ; 0A41 _ 90
        pop     ebp                                     ; 0A42 _ 5D
        ret                                             ; 0A43 _ C3
; fifo8_init End of function

fifo8_put:; Function begin
        push    ebp                                     ; 0A44 _ 55
        mov     ebp, esp                                ; 0A45 _ 89. E5
        sub     esp, 4                                  ; 0A47 _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 0A4A _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 0A4D _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0A50 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0A53 _ 8B. 40, 10
        test    eax, eax                                ; 0A56 _ 85. C0
        jnz     ?_041                                   ; 0A58 _ 75, 18
        mov     eax, dword [ebp+8H]                     ; 0A5A _ 8B. 45, 08
        mov     eax, dword [eax+14H]                    ; 0A5D _ 8B. 40, 14
        or      eax, 01H                                ; 0A60 _ 83. C8, 01
        mov     edx, eax                                ; 0A63 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0A65 _ 8B. 45, 08
        mov     dword [eax+14H], edx                    ; 0A68 _ 89. 50, 14
        mov     eax, 4294967295                         ; 0A6B _ B8, FFFFFFFF
        jmp     ?_043                                   ; 0A70 _ EB, 50

?_041:  mov     eax, dword [ebp+8H]                     ; 0A72 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 0A75 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 0A77 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0A7A _ 8B. 40, 04
        add     edx, eax                                ; 0A7D _ 01. C2
        movzx   eax, byte [ebp-4H]                      ; 0A7F _ 0F B6. 45, FC
        mov     byte [edx], al                          ; 0A83 _ 88. 02
        mov     eax, dword [ebp+8H]                     ; 0A85 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0A88 _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 0A8B _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0A8E _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 0A91 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0A94 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 0A97 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0A9A _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0A9D _ 8B. 40, 0C
        cmp     edx, eax                                ; 0AA0 _ 39. C2
        jnz     ?_042                                   ; 0AA2 _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 0AA4 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 0AA7 _ C7. 40, 04, 00000000
?_042:  mov     eax, dword [ebp+8H]                     ; 0AAE _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0AB1 _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 0AB4 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 0AB7 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 0ABA _ 89. 50, 10
        mov     eax, 0                                  ; 0ABD _ B8, 00000000
?_043:  leave                                           ; 0AC2 _ C9
        ret                                             ; 0AC3 _ C3
; fifo8_put End of function

fifo8_get:; Function begin
        push    ebp                                     ; 0AC4 _ 55
        mov     ebp, esp                                ; 0AC5 _ 89. E5
        sub     esp, 16                                 ; 0AC7 _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 0ACA _ 8B. 45, 08
        mov     edx, dword [eax+10H]                    ; 0ACD _ 8B. 50, 10
        mov     eax, dword [ebp+8H]                     ; 0AD0 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0AD3 _ 8B. 40, 0C
        cmp     edx, eax                                ; 0AD6 _ 39. C2
        jnz     ?_044                                   ; 0AD8 _ 75, 07
        mov     eax, 4294967295                         ; 0ADA _ B8, FFFFFFFF
        jmp     ?_046                                   ; 0ADF _ EB, 51

?_044:  mov     eax, dword [ebp+8H]                     ; 0AE1 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 0AE4 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 0AE6 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0AE9 _ 8B. 40, 08
        add     eax, edx                                ; 0AEC _ 01. D0
        movzx   eax, byte [eax]                         ; 0AEE _ 0F B6. 00
        movzx   eax, al                                 ; 0AF1 _ 0F B6. C0
        mov     dword [ebp-4H], eax                     ; 0AF4 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0AF7 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0AFA _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 0AFD _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0B00 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0B03 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 0B06 _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 0B09 _ 8B. 50, 08
        mov     eax, dword [ebp+8H]                     ; 0B0C _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0B0F _ 8B. 40, 0C
        cmp     edx, eax                                ; 0B12 _ 39. C2
        jnz     ?_045                                   ; 0B14 _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 0B16 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 0B19 _ C7. 40, 08, 00000000
?_045:  mov     eax, dword [ebp+8H]                     ; 0B20 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0B23 _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 0B26 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0B29 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 0B2C _ 89. 50, 10
        mov     eax, dword [ebp-4H]                     ; 0B2F _ 8B. 45, FC
?_046:  leave                                           ; 0B32 _ C9
        ret                                             ; 0B33 _ C3
; fifo8_get End of function

fifo8_status:; Function begin
        push    ebp                                     ; 0B34 _ 55
        mov     ebp, esp                                ; 0B35 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 0B37 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 0B3A _ 8B. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 0B3D _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0B40 _ 8B. 40, 10
        sub     edx, eax                                ; 0B43 _ 29. C2
        mov     eax, edx                                ; 0B45 _ 89. D0
        pop     ebp                                     ; 0B47 _ 5D
        ret                                             ; 0B48 _ C3
; fifo8_status End of function

mouse_decode:; Function begin
        push    ebp                                     ; 0B49 _ 55
        mov     ebp, esp                                ; 0B4A _ 89. E5
        sub     esp, 4                                  ; 0B4C _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 0B4F _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 0B52 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0B55 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 0B58 _ 0F B6. 40, 03
        test    al, al                                  ; 0B5C _ 84. C0
        jnz     ?_048                                   ; 0B5E _ 75, 17
        cmp     byte [ebp-4H], -6                       ; 0B60 _ 80. 7D, FC, FA
        jnz     ?_047                                   ; 0B64 _ 75, 07
        mov     eax, dword [ebp+8H]                     ; 0B66 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 0B69 _ C6. 40, 03, 01
?_047:  mov     eax, 0                                  ; 0B6D _ B8, 00000000
        jmp     ?_055                                   ; 0B72 _ E9, 0000010F

?_048:  mov     eax, dword [ebp+8H]                     ; 0B77 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 0B7A _ 0F B6. 40, 03
        cmp     al, 1                                   ; 0B7E _ 3C, 01
        jnz     ?_050                                   ; 0B80 _ 75, 28
        movzx   eax, byte [ebp-4H]                      ; 0B82 _ 0F B6. 45, FC
        and     eax, 0C8H                               ; 0B86 _ 25, 000000C8
        cmp     eax, 8                                  ; 0B8B _ 83. F8, 08
        jnz     ?_049                                   ; 0B8E _ 75, 10
        mov     eax, dword [ebp+8H]                     ; 0B90 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 0B93 _ 0F B6. 55, FC
        mov     byte [eax], dl                          ; 0B97 _ 88. 10
        mov     eax, dword [ebp+8H]                     ; 0B99 _ 8B. 45, 08
        mov     byte [eax+3H], 2                        ; 0B9C _ C6. 40, 03, 02
?_049:  mov     eax, 0                                  ; 0BA0 _ B8, 00000000
        jmp     ?_055                                   ; 0BA5 _ E9, 000000DC

?_050:  mov     eax, dword [ebp+8H]                     ; 0BAA _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 0BAD _ 0F B6. 40, 03
        cmp     al, 2                                   ; 0BB1 _ 3C, 02
        jnz     ?_051                                   ; 0BB3 _ 75, 1B
        mov     eax, dword [ebp+8H]                     ; 0BB5 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 0BB8 _ 0F B6. 55, FC
        mov     byte [eax+1H], dl                       ; 0BBC _ 88. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0BBF _ 8B. 45, 08
        mov     byte [eax+3H], 3                        ; 0BC2 _ C6. 40, 03, 03
        mov     eax, 0                                  ; 0BC6 _ B8, 00000000
        jmp     ?_055                                   ; 0BCB _ E9, 000000B6

?_051:  mov     eax, dword [ebp+8H]                     ; 0BD0 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 0BD3 _ 0F B6. 40, 03
        cmp     al, 3                                   ; 0BD7 _ 3C, 03
        jne     ?_054                                   ; 0BD9 _ 0F 85, 000000A2
        mov     eax, dword [ebp+8H]                     ; 0BDF _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 0BE2 _ 0F B6. 55, FC
        mov     byte [eax+2H], dl                       ; 0BE6 _ 88. 50, 02
        mov     eax, dword [ebp+8H]                     ; 0BE9 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 0BEC _ C6. 40, 03, 01
        mov     eax, dword [ebp+8H]                     ; 0BF0 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 0BF3 _ 0F B6. 00
        movzx   eax, al                                 ; 0BF6 _ 0F B6. C0
        and     eax, 07H                                ; 0BF9 _ 83. E0, 07
        mov     edx, eax                                ; 0BFC _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0BFE _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 0C01 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 0C04 _ 8B. 45, 08
        movzx   eax, byte [eax+1H]                      ; 0C07 _ 0F B6. 40, 01
        movzx   edx, al                                 ; 0C0B _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 0C0E _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 0C11 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0C14 _ 8B. 45, 08
        movzx   eax, byte [eax+2H]                      ; 0C17 _ 0F B6. 40, 02
        movzx   edx, al                                 ; 0C1B _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 0C1E _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0C21 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 0C24 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 0C27 _ 0F B6. 00
        movzx   eax, al                                 ; 0C2A _ 0F B6. C0
        and     eax, 10H                                ; 0C2D _ 83. E0, 10
        test    eax, eax                                ; 0C30 _ 85. C0
        jz      ?_052                                   ; 0C32 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 0C34 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0C37 _ 8B. 40, 04
        or      eax, 0FFFFFF00H                         ; 0C3A _ 0D, FFFFFF00
        mov     edx, eax                                ; 0C3F _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0C41 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 0C44 _ 89. 50, 04
?_052:  mov     eax, dword [ebp+8H]                     ; 0C47 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 0C4A _ 0F B6. 00
        movzx   eax, al                                 ; 0C4D _ 0F B6. C0
        and     eax, 20H                                ; 0C50 _ 83. E0, 20
        test    eax, eax                                ; 0C53 _ 85. C0
        jz      ?_053                                   ; 0C55 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 0C57 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0C5A _ 8B. 40, 08
        or      eax, 0FFFFFF00H                         ; 0C5D _ 0D, FFFFFF00
        mov     edx, eax                                ; 0C62 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0C64 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0C67 _ 89. 50, 08
?_053:  mov     eax, dword [ebp+8H]                     ; 0C6A _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0C6D _ 8B. 40, 08
        neg     eax                                     ; 0C70 _ F7. D8
        mov     edx, eax                                ; 0C72 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0C74 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0C77 _ 89. 50, 08
        mov     eax, 1                                  ; 0C7A _ B8, 00000001
        jmp     ?_055                                   ; 0C7F _ EB, 05

?_054:  mov     eax, 4294967295                         ; 0C81 _ B8, FFFFFFFF
?_055:  leave                                           ; 0C86 _ C9
        ret                                             ; 0C87 _ C3
; mouse_decode End of function

computeMousePosition:; Function begin
        push    ebp                                     ; 0C88 _ 55
        mov     ebp, esp                                ; 0C89 _ 89. E5
        sub     esp, 24                                 ; 0C8B _ 83. EC, 18
        movzx   eax, word [?_136]                       ; 0C8E _ 0F B7. 05, 00000004(d)
        cwde                                            ; 0C95 _ 98
        mov     dword [ebp-14H], eax                    ; 0C96 _ 89. 45, EC
        movzx   eax, word [?_137]                       ; 0C99 _ 0F B7. 05, 00000006(d)
        cwde                                            ; 0CA0 _ 98
        mov     dword [ebp-10H], eax                    ; 0CA1 _ 89. 45, F0
        mov     eax, dword [ebp+10H]                    ; 0CA4 _ 8B. 45, 10
        mov     dword [eax+4H], 16                      ; 0CA7 _ C7. 40, 04, 00000010
        mov     eax, dword [ebp+10H]                    ; 0CAE _ 8B. 45, 10
        mov     dword [eax+8H], 16                      ; 0CB1 _ C7. 40, 08, 00000010
        mov     eax, dword [ebp+14H]                    ; 0CB8 _ 8B. 45, 14
        mov     edx, dword [eax+4H]                     ; 0CBB _ 8B. 50, 04
        mov     eax, dword [mx]                         ; 0CBE _ A1, 000000F0(d)
        add     eax, edx                                ; 0CC3 _ 01. D0
        mov     dword [mx], eax                         ; 0CC5 _ A3, 000000F0(d)
        mov     eax, dword [ebp+14H]                    ; 0CCA _ 8B. 45, 14
        mov     edx, dword [eax+8H]                     ; 0CCD _ 8B. 50, 08
        mov     eax, dword [my]                         ; 0CD0 _ A1, 000000F4(d)
        add     eax, edx                                ; 0CD5 _ 01. D0
        mov     dword [my], eax                         ; 0CD7 _ A3, 000000F4(d)
        mov     eax, dword [mx]                         ; 0CDC _ A1, 000000F0(d)
        test    eax, eax                                ; 0CE1 _ 85. C0
        jns     ?_056                                   ; 0CE3 _ 79, 0A
        mov     dword [mx], 0                           ; 0CE5 _ C7. 05, 000000F0(d), 00000000
?_056:  mov     eax, dword [my]                         ; 0CEF _ A1, 000000F4(d)
        test    eax, eax                                ; 0CF4 _ 85. C0
        jns     ?_057                                   ; 0CF6 _ 79, 0A
        mov     dword [my], 0                           ; 0CF8 _ C7. 05, 000000F4(d), 00000000
?_057:  mov     eax, dword [ebp-10H]                    ; 0D02 _ 8B. 45, F0
        lea     edx, [eax-10H]                          ; 0D05 _ 8D. 50, F0
        mov     eax, dword [my]                         ; 0D08 _ A1, 000000F4(d)
        cmp     edx, eax                                ; 0D0D _ 39. C2
        jge     ?_058                                   ; 0D0F _ 7D, 10
        mov     eax, dword [my]                         ; 0D11 _ A1, 000000F4(d)
        mov     edx, dword [ebp-10H]                    ; 0D16 _ 8B. 55, F0
        sub     edx, eax                                ; 0D19 _ 29. C2
        mov     eax, dword [ebp+10H]                    ; 0D1B _ 8B. 45, 10
        mov     dword [eax+8H], edx                     ; 0D1E _ 89. 50, 08
?_058:  mov     dword [ebp-0CH], 1                      ; 0D21 _ C7. 45, F4, 00000001
        mov     eax, dword [ebp-14H]                    ; 0D28 _ 8B. 45, EC
        sub     eax, dword [ebp-0CH]                    ; 0D2B _ 2B. 45, F4
        mov     edx, eax                                ; 0D2E _ 89. C2
        mov     eax, dword [mx]                         ; 0D30 _ A1, 000000F0(d)
        cmp     edx, eax                                ; 0D35 _ 39. C2
        jge     ?_059                                   ; 0D37 _ 7D, 14
        mov     eax, dword [ebp-14H]                    ; 0D39 _ 8B. 45, EC
        sub     eax, dword [ebp-0CH]                    ; 0D3C _ 2B. 45, F4
        mov     dword [mx], eax                         ; 0D3F _ A3, 000000F0(d)
        mov     eax, dword [ebp+10H]                    ; 0D44 _ 8B. 45, 10
        mov     edx, dword [ebp-0CH]                    ; 0D47 _ 8B. 55, F4
        mov     dword [eax+4H], edx                     ; 0D4A _ 89. 50, 04
?_059:  mov     eax, dword [ebp-10H]                    ; 0D4D _ 8B. 45, F0
        sub     eax, dword [ebp-0CH]                    ; 0D50 _ 2B. 45, F4
        mov     edx, eax                                ; 0D53 _ 89. C2
        mov     eax, dword [my]                         ; 0D55 _ A1, 000000F4(d)
        cmp     edx, eax                                ; 0D5A _ 39. C2
        jge     ?_060                                   ; 0D5C _ 7D, 14
        mov     eax, dword [ebp-10H]                    ; 0D5E _ 8B. 45, F0
        sub     eax, dword [ebp-0CH]                    ; 0D61 _ 2B. 45, F4
        mov     dword [my], eax                         ; 0D64 _ A3, 000000F4(d)
        mov     eax, dword [ebp+10H]                    ; 0D69 _ 8B. 45, 10
        mov     edx, dword [ebp-0CH]                    ; 0D6C _ 8B. 55, F4
        mov     dword [eax+8H], edx                     ; 0D6F _ 89. 50, 08
?_060:  sub     esp, 8                                  ; 0D72 _ 83. EC, 08
        push    ?_125                                   ; 0D75 _ 68, 00000009(d)
        push    7                                       ; 0D7A _ 6A, 07
        push    0                                       ; 0D7C _ 6A, 00
        push    0                                       ; 0D7E _ 6A, 00
        push    dword [ebp+0CH]                         ; 0D80 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0D83 _ FF. 75, 08
        call    showString                              ; 0D86 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0D8B _ 83. C4, 20
        nop                                             ; 0D8E _ 90
        leave                                           ; 0D8F _ C9
        ret                                             ; 0D90 _ C3
; computeMousePosition End of function

show_mouse_info:; Function begin
        push    ebp                                     ; 0D91 _ 55
        mov     ebp, esp                                ; 0D92 _ 89. E5
        sub     esp, 24                                 ; 0D94 _ 83. EC, 18
        mov     eax, dword [buf_back]                   ; 0D97 _ A1, 000000F8(d)
        mov     dword [ebp-0CH], eax                    ; 0D9C _ 89. 45, F4
        mov     byte [ebp-0DH], 0                       ; 0D9F _ C6. 45, F3, 00
        push    mouseinfo                               ; 0DA3 _ 68, 00000008(d)
        call    fifo8_get                               ; 0DA8 _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 0DAD _ 83. C4, 04
        mov     byte [ebp-0DH], al                      ; 0DB0 _ 88. 45, F3
        movzx   eax, byte [ebp-0DH]                     ; 0DB3 _ 0F B6. 45, F3
        push    eax                                     ; 0DB7 _ 50
        push    mdec                                    ; 0DB8 _ 68, 000000E0(d)
        call    mouse_decode                            ; 0DBD _ E8, FFFFFFFC(rel)
        add     esp, 8                                  ; 0DC2 _ 83. C4, 08
        cmp     eax, 1                                  ; 0DC5 _ 83. F8, 01
        jnz     ?_061                                   ; 0DC8 _ 75, 31
        push    mdec                                    ; 0DCA _ 68, 000000E0(d)
        push    dword [ebp+10H]                         ; 0DCF _ FF. 75, 10
        push    dword [ebp+0CH]                         ; 0DD2 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0DD5 _ FF. 75, 08
        call    computeMousePosition                    ; 0DD8 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0DDD _ 83. C4, 10
        mov     edx, dword [my]                         ; 0DE0 _ 8B. 15, 000000F4(d)
        mov     eax, dword [mx]                         ; 0DE6 _ A1, 000000F0(d)
        push    edx                                     ; 0DEB _ 52
        push    eax                                     ; 0DEC _ 50
        push    dword [ebp+10H]                         ; 0DED _ FF. 75, 10
        push    dword [ebp+8H]                          ; 0DF0 _ FF. 75, 08
        call    sheet_slide_mouse                       ; 0DF3 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0DF8 _ 83. C4, 10
?_061:  nop                                             ; 0DFB _ 90
        leave                                           ; 0DFC _ C9
        ret                                             ; 0DFD _ C3
; show_mouse_info End of function

showMemoryInfo:; Function begin
        push    ebp                                     ; 0DFE _ 55
        mov     ebp, esp                                ; 0DFF _ 89. E5
        sub     esp, 56                                 ; 0E01 _ 83. EC, 38
        mov     dword [ebp-30H], 0                      ; 0E04 _ C7. 45, D0, 00000000
        mov     dword [ebp-2CH], 0                      ; 0E0B _ C7. 45, D4, 00000000
        mov     dword [ebp-28H], 104                    ; 0E12 _ C7. 45, D8, 00000068
        mov     dword [ebp-24H], 80                     ; 0E19 _ C7. 45, DC, 00000050
        mov     edx, dword [ysize]                      ; 0E20 _ 8B. 15, 00000204(d)
        mov     eax, dword [ebp+0CH]                    ; 0E26 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 0E29 _ 8B. 00
        sub     esp, 4                                  ; 0E2B _ 83. EC, 04
        push    edx                                     ; 0E2E _ 52
        push    dword [ebp+1CH]                         ; 0E2F _ FF. 75, 1C
        push    eax                                     ; 0E32 _ 50
        call    init_screen8                            ; 0E33 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0E38 _ 83. C4, 10
        mov     eax, dword [ebp+20H]                    ; 0E3B _ 8B. 45, 20
        movsx   eax, al                                 ; 0E3E _ 0F BE. C0
        sub     esp, 8                                  ; 0E41 _ 83. EC, 08
        push    ?_126                                   ; 0E44 _ 68, 00000021(d)
        push    eax                                     ; 0E49 _ 50
        push    dword [ebp-2CH]                         ; 0E4A _ FF. 75, D4
        push    dword [ebp-30H]                         ; 0E4D _ FF. 75, D0
        push    dword [ebp+0CH]                         ; 0E50 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0E53 _ FF. 75, 08
        call    showString                              ; 0E56 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0E5B _ 83. C4, 20
        mov     eax, dword [ebp+18H]                    ; 0E5E _ 8B. 45, 18
        sub     esp, 12                                 ; 0E61 _ 83. EC, 0C
        push    eax                                     ; 0E64 _ 50
        call    intToHexStr                             ; 0E65 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0E6A _ 83. C4, 10
        mov     dword [ebp-20H], eax                    ; 0E6D _ 89. 45, E0
        mov     eax, dword [ebp+20H]                    ; 0E70 _ 8B. 45, 20
        movsx   eax, al                                 ; 0E73 _ 0F BE. C0
        sub     esp, 8                                  ; 0E76 _ 83. EC, 08
        push    dword [ebp-20H]                         ; 0E79 _ FF. 75, E0
        push    eax                                     ; 0E7C _ 50
        push    dword [ebp-2CH]                         ; 0E7D _ FF. 75, D4
        push    dword [ebp-28H]                         ; 0E80 _ FF. 75, D8
        push    dword [ebp+0CH]                         ; 0E83 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0E86 _ FF. 75, 08
        call    showString                              ; 0E89 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0E8E _ 83. C4, 20
        add     dword [ebp-2CH], 16                     ; 0E91 _ 83. 45, D4, 10
        mov     eax, dword [ebp+20H]                    ; 0E95 _ 8B. 45, 20
        movsx   eax, al                                 ; 0E98 _ 0F BE. C0
        sub     esp, 8                                  ; 0E9B _ 83. EC, 08
        push    ?_127                                   ; 0E9E _ 68, 0000002B(d)
        push    eax                                     ; 0EA3 _ 50
        push    dword [ebp-2CH]                         ; 0EA4 _ FF. 75, D4
        push    dword [ebp-30H]                         ; 0EA7 _ FF. 75, D0
        push    dword [ebp+0CH]                         ; 0EAA _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0EAD _ FF. 75, 08
        call    showString                              ; 0EB0 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0EB5 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0EB8 _ 8B. 45, 10
        mov     eax, dword [eax]                        ; 0EBB _ 8B. 00
        sub     esp, 12                                 ; 0EBD _ 83. EC, 0C
        push    eax                                     ; 0EC0 _ 50
        call    intToHexStr                             ; 0EC1 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0EC6 _ 83. C4, 10
        mov     dword [ebp-1CH], eax                    ; 0EC9 _ 89. 45, E4
        mov     eax, dword [ebp+20H]                    ; 0ECC _ 8B. 45, 20
        movsx   eax, al                                 ; 0ECF _ 0F BE. C0
        sub     esp, 8                                  ; 0ED2 _ 83. EC, 08
        push    dword [ebp-1CH]                         ; 0ED5 _ FF. 75, E4
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
        push    ?_128                                   ; 0EFA _ 68, 00000037(d)
        push    eax                                     ; 0EFF _ 50
        push    dword [ebp-2CH]                         ; 0F00 _ FF. 75, D4
        push    dword [ebp-30H]                         ; 0F03 _ FF. 75, D0
        push    dword [ebp+0CH]                         ; 0F06 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0F09 _ FF. 75, 08
        call    showString                              ; 0F0C _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0F11 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0F14 _ 8B. 45, 10
        mov     eax, dword [eax+4H]                     ; 0F17 _ 8B. 40, 04
        sub     esp, 12                                 ; 0F1A _ 83. EC, 0C
        push    eax                                     ; 0F1D _ 50
        call    intToHexStr                             ; 0F1E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0F23 _ 83. C4, 10
        mov     dword [ebp-18H], eax                    ; 0F26 _ 89. 45, E8
        mov     eax, dword [ebp+20H]                    ; 0F29 _ 8B. 45, 20
        movsx   eax, al                                 ; 0F2C _ 0F BE. C0
        sub     esp, 8                                  ; 0F2F _ 83. EC, 08
        push    dword [ebp-18H]                         ; 0F32 _ FF. 75, E8
        push    eax                                     ; 0F35 _ 50
        push    dword [ebp-2CH]                         ; 0F36 _ FF. 75, D4
        push    dword [ebp-28H]                         ; 0F39 _ FF. 75, D8
        push    dword [ebp+0CH]                         ; 0F3C _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0F3F _ FF. 75, 08
        call    showString                              ; 0F42 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0F47 _ 83. C4, 20
        add     dword [ebp-2CH], 16                     ; 0F4A _ 83. 45, D4, 10
        mov     eax, dword [ebp+20H]                    ; 0F4E _ 8B. 45, 20
        movsx   eax, al                                 ; 0F51 _ 0F BE. C0
        sub     esp, 8                                  ; 0F54 _ 83. EC, 08
        push    ?_129                                   ; 0F57 _ 68, 00000043(d)
        push    eax                                     ; 0F5C _ 50
        push    dword [ebp-2CH]                         ; 0F5D _ FF. 75, D4
        push    dword [ebp-30H]                         ; 0F60 _ FF. 75, D0
        push    dword [ebp+0CH]                         ; 0F63 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0F66 _ FF. 75, 08
        call    showString                              ; 0F69 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0F6E _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0F71 _ 8B. 45, 10
        mov     eax, dword [eax+8H]                     ; 0F74 _ 8B. 40, 08
        sub     esp, 12                                 ; 0F77 _ 83. EC, 0C
        push    eax                                     ; 0F7A _ 50
        call    intToHexStr                             ; 0F7B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0F80 _ 83. C4, 10
        mov     dword [ebp-14H], eax                    ; 0F83 _ 89. 45, EC
        mov     eax, dword [ebp+20H]                    ; 0F86 _ 8B. 45, 20
        movsx   eax, al                                 ; 0F89 _ 0F BE. C0
        sub     esp, 8                                  ; 0F8C _ 83. EC, 08
        push    dword [ebp-14H]                         ; 0F8F _ FF. 75, EC
        push    eax                                     ; 0F92 _ 50
        push    dword [ebp-2CH]                         ; 0F93 _ FF. 75, D4
        push    dword [ebp-28H]                         ; 0F96 _ FF. 75, D8
        push    dword [ebp+0CH]                         ; 0F99 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0F9C _ FF. 75, 08
        call    showString                              ; 0F9F _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0FA4 _ 83. C4, 20
        add     dword [ebp-2CH], 16                     ; 0FA7 _ 83. 45, D4, 10
        mov     eax, dword [ebp+20H]                    ; 0FAB _ 8B. 45, 20
        movsx   eax, al                                 ; 0FAE _ 0F BE. C0
        sub     esp, 8                                  ; 0FB1 _ 83. EC, 08
        push    ?_130                                   ; 0FB4 _ 68, 0000004F(d)
        push    eax                                     ; 0FB9 _ 50
        push    dword [ebp-2CH]                         ; 0FBA _ FF. 75, D4
        push    dword [ebp-30H]                         ; 0FBD _ FF. 75, D0
        push    dword [ebp+0CH]                         ; 0FC0 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0FC3 _ FF. 75, 08
        call    showString                              ; 0FC6 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0FCB _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0FCE _ 8B. 45, 10
        mov     eax, dword [eax+0CH]                    ; 0FD1 _ 8B. 40, 0C
        sub     esp, 12                                 ; 0FD4 _ 83. EC, 0C
        push    eax                                     ; 0FD7 _ 50
        call    intToHexStr                             ; 0FD8 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0FDD _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 0FE0 _ 89. 45, F0
        mov     eax, dword [ebp+20H]                    ; 0FE3 _ 8B. 45, 20
        movsx   eax, al                                 ; 0FE6 _ 0F BE. C0
        sub     esp, 8                                  ; 0FE9 _ 83. EC, 08
        push    dword [ebp-10H]                         ; 0FEC _ FF. 75, F0
        push    eax                                     ; 0FEF _ 50
        push    dword [ebp-2CH]                         ; 0FF0 _ FF. 75, D4
        push    dword [ebp-28H]                         ; 0FF3 _ FF. 75, D8
        push    dword [ebp+0CH]                         ; 0FF6 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0FF9 _ FF. 75, 08
        call    showString                              ; 0FFC _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1001 _ 83. C4, 20
        add     dword [ebp-2CH], 16                     ; 1004 _ 83. 45, D4, 10
        mov     eax, dword [ebp+20H]                    ; 1008 _ 8B. 45, 20
        movsx   eax, al                                 ; 100B _ 0F BE. C0
        sub     esp, 8                                  ; 100E _ 83. EC, 08
        push    ?_131                                   ; 1011 _ 68, 0000005C(d)
        push    eax                                     ; 1016 _ 50
        push    dword [ebp-2CH]                         ; 1017 _ FF. 75, D4
        push    dword [ebp-30H]                         ; 101A _ FF. 75, D0
        push    dword [ebp+0CH]                         ; 101D _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1020 _ FF. 75, 08
        call    showString                              ; 1023 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1028 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 102B _ 8B. 45, 10
        mov     eax, dword [eax+10H]                    ; 102E _ 8B. 40, 10
        sub     esp, 12                                 ; 1031 _ 83. EC, 0C
        push    eax                                     ; 1034 _ 50
        call    intToHexStr                             ; 1035 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 103A _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 103D _ 89. 45, F4
        mov     eax, dword [ebp+20H]                    ; 1040 _ 8B. 45, 20
        movsx   eax, al                                 ; 1043 _ 0F BE. C0
        sub     esp, 8                                  ; 1046 _ 83. EC, 08
        push    dword [ebp-0CH]                         ; 1049 _ FF. 75, F4
        push    eax                                     ; 104C _ 50
        push    dword [ebp-2CH]                         ; 104D _ FF. 75, D4
        push    dword [ebp-28H]                         ; 1050 _ FF. 75, D8
        push    dword [ebp+0CH]                         ; 1053 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1056 _ FF. 75, 08
        call    showString                              ; 1059 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 105E _ 83. C4, 20
        nop                                             ; 1061 _ 90
        leave                                           ; 1062 _ C9
        ret                                             ; 1063 _ C3
; showMemoryInfo End of function

init_screen8:; Function begin
        push    ebp                                     ; 1064 _ 55
        mov     ebp, esp                                ; 1065 _ 89. E5
        push    ebx                                     ; 1067 _ 53
        mov     eax, dword [ebp+10H]                    ; 1068 _ 8B. 45, 10
        lea     edx, [eax-1DH]                          ; 106B _ 8D. 50, E3
        mov     eax, dword [ebp+0CH]                    ; 106E _ 8B. 45, 0C
        sub     eax, 1                                  ; 1071 _ 83. E8, 01
        push    edx                                     ; 1074 _ 52
        push    eax                                     ; 1075 _ 50
        push    0                                       ; 1076 _ 6A, 00
        push    0                                       ; 1078 _ 6A, 00
        push    14                                      ; 107A _ 6A, 0E
        push    dword [ebp+0CH]                         ; 107C _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 107F _ FF. 75, 08
        call    boxfill8                                ; 1082 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1087 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 108A _ 8B. 45, 10
        lea     ecx, [eax-1CH]                          ; 108D _ 8D. 48, E4
        mov     eax, dword [ebp+0CH]                    ; 1090 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 1093 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 1096 _ 8B. 45, 10
        sub     eax, 28                                 ; 1099 _ 83. E8, 1C
        push    ecx                                     ; 109C _ 51
        push    edx                                     ; 109D _ 52
        push    eax                                     ; 109E _ 50
        push    0                                       ; 109F _ 6A, 00
        push    8                                       ; 10A1 _ 6A, 08
        push    dword [ebp+0CH]                         ; 10A3 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 10A6 _ FF. 75, 08
        call    boxfill8                                ; 10A9 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 10AE _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 10B1 _ 8B. 45, 10
        lea     ecx, [eax-1BH]                          ; 10B4 _ 8D. 48, E5
        mov     eax, dword [ebp+0CH]                    ; 10B7 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 10BA _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 10BD _ 8B. 45, 10
        sub     eax, 27                                 ; 10C0 _ 83. E8, 1B
        push    ecx                                     ; 10C3 _ 51
        push    edx                                     ; 10C4 _ 52
        push    eax                                     ; 10C5 _ 50
        push    0                                       ; 10C6 _ 6A, 00
        push    7                                       ; 10C8 _ 6A, 07
        push    dword [ebp+0CH]                         ; 10CA _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 10CD _ FF. 75, 08
        call    boxfill8                                ; 10D0 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 10D5 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 10D8 _ 8B. 45, 10
        lea     ecx, [eax-1H]                           ; 10DB _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 10DE _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 10E1 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 10E4 _ 8B. 45, 10
        sub     eax, 26                                 ; 10E7 _ 83. E8, 1A
        push    ecx                                     ; 10EA _ 51
        push    edx                                     ; 10EB _ 52
        push    eax                                     ; 10EC _ 50
        push    0                                       ; 10ED _ 6A, 00
        push    8                                       ; 10EF _ 6A, 08
        push    dword [ebp+0CH]                         ; 10F1 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 10F4 _ FF. 75, 08
        call    boxfill8                                ; 10F7 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 10FC _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 10FF _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 1102 _ 8D. 50, E8
        mov     eax, dword [ebp+10H]                    ; 1105 _ 8B. 45, 10
        sub     eax, 24                                 ; 1108 _ 83. E8, 18
        push    edx                                     ; 110B _ 52
        push    59                                      ; 110C _ 6A, 3B
        push    eax                                     ; 110E _ 50
        push    3                                       ; 110F _ 6A, 03
        push    7                                       ; 1111 _ 6A, 07
        push    dword [ebp+0CH]                         ; 1113 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1116 _ FF. 75, 08
        call    boxfill8                                ; 1119 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 111E _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 1121 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 1124 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 1127 _ 8B. 45, 10
        sub     eax, 24                                 ; 112A _ 83. E8, 18
        push    edx                                     ; 112D _ 52
        push    2                                       ; 112E _ 6A, 02
        push    eax                                     ; 1130 _ 50
        push    2                                       ; 1131 _ 6A, 02
        push    7                                       ; 1133 _ 6A, 07
        push    dword [ebp+0CH]                         ; 1135 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1138 _ FF. 75, 08
        call    boxfill8                                ; 113B _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1140 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 1143 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 1146 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 1149 _ 8B. 45, 10
        sub     eax, 4                                  ; 114C _ 83. E8, 04
        push    edx                                     ; 114F _ 52
        push    59                                      ; 1150 _ 6A, 3B
        push    eax                                     ; 1152 _ 50
        push    3                                       ; 1153 _ 6A, 03
        push    15                                      ; 1155 _ 6A, 0F
        push    dword [ebp+0CH]                         ; 1157 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 115A _ FF. 75, 08
        call    boxfill8                                ; 115D _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1162 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 1165 _ 8B. 45, 10
        lea     edx, [eax-5H]                           ; 1168 _ 8D. 50, FB
        mov     eax, dword [ebp+10H]                    ; 116B _ 8B. 45, 10
        sub     eax, 23                                 ; 116E _ 83. E8, 17
        push    edx                                     ; 1171 _ 52
        push    59                                      ; 1172 _ 6A, 3B
        push    eax                                     ; 1174 _ 50
        push    59                                      ; 1175 _ 6A, 3B
        push    15                                      ; 1177 _ 6A, 0F
        push    dword [ebp+0CH]                         ; 1179 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 117C _ FF. 75, 08
        call    boxfill8                                ; 117F _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1184 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 1187 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 118A _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 118D _ 8B. 45, 10
        sub     eax, 3                                  ; 1190 _ 83. E8, 03
        push    edx                                     ; 1193 _ 52
        push    59                                      ; 1194 _ 6A, 3B
        push    eax                                     ; 1196 _ 50
        push    2                                       ; 1197 _ 6A, 02
        push    0                                       ; 1199 _ 6A, 00
        push    dword [ebp+0CH]                         ; 119B _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 119E _ FF. 75, 08
        call    boxfill8                                ; 11A1 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 11A6 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 11A9 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 11AC _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 11AF _ 8B. 45, 10
        sub     eax, 24                                 ; 11B2 _ 83. E8, 18
        push    edx                                     ; 11B5 _ 52
        push    60                                      ; 11B6 _ 6A, 3C
        push    eax                                     ; 11B8 _ 50
        push    60                                      ; 11B9 _ 6A, 3C
        push    0                                       ; 11BB _ 6A, 00
        push    dword [ebp+0CH]                         ; 11BD _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 11C0 _ FF. 75, 08
        call    boxfill8                                ; 11C3 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 11C8 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 11CB _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 11CE _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 11D1 _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 11D4 _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 11D7 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 11DA _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 11DD _ 8B. 45, 0C
        sub     eax, 47                                 ; 11E0 _ 83. E8, 2F
        push    ebx                                     ; 11E3 _ 53
        push    ecx                                     ; 11E4 _ 51
        push    edx                                     ; 11E5 _ 52
        push    eax                                     ; 11E6 _ 50
        push    7                                       ; 11E7 _ 6A, 07
        push    dword [ebp+0CH]                         ; 11E9 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 11EC _ FF. 75, 08
        call    boxfill8                                ; 11EF _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 11F4 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 11F7 _ 8B. 45, 10
        lea     ebx, [eax-4H]                           ; 11FA _ 8D. 58, FC
        mov     eax, dword [ebp+0CH]                    ; 11FD _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 1200 _ 8D. 48, FD
        mov     eax, dword [ebp+10H]                    ; 1203 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 1206 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 1209 _ 8B. 45, 0C
        sub     eax, 3                                  ; 120C _ 83. E8, 03
        push    ebx                                     ; 120F _ 53
        push    ecx                                     ; 1210 _ 51
        push    edx                                     ; 1211 _ 52
        push    eax                                     ; 1212 _ 50
        push    7                                       ; 1213 _ 6A, 07
        push    dword [ebp+0CH]                         ; 1215 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1218 _ FF. 75, 08
        call    boxfill8                                ; 121B _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1220 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 1223 _ 8B. 45, 10
        lea     ebx, [eax-18H]                          ; 1226 _ 8D. 58, E8
        mov     eax, dword [ebp+0CH]                    ; 1229 _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 122C _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 122F _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 1232 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 1235 _ 8B. 45, 0C
        sub     eax, 47                                 ; 1238 _ 83. E8, 2F
        push    ebx                                     ; 123B _ 53
        push    ecx                                     ; 123C _ 51
        push    edx                                     ; 123D _ 52
        push    eax                                     ; 123E _ 50
        push    15                                      ; 123F _ 6A, 0F
        push    dword [ebp+0CH]                         ; 1241 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1244 _ FF. 75, 08
        call    boxfill8                                ; 1247 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 124C _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 124F _ 8B. 45, 10
        lea     ebx, [eax-4H]                           ; 1252 _ 8D. 58, FC
        mov     eax, dword [ebp+0CH]                    ; 1255 _ 8B. 45, 0C
        lea     ecx, [eax-2FH]                          ; 1258 _ 8D. 48, D1
        mov     eax, dword [ebp+10H]                    ; 125B _ 8B. 45, 10
        lea     edx, [eax-17H]                          ; 125E _ 8D. 50, E9
        mov     eax, dword [ebp+0CH]                    ; 1261 _ 8B. 45, 0C
        sub     eax, 47                                 ; 1264 _ 83. E8, 2F
        push    ebx                                     ; 1267 _ 53
        push    ecx                                     ; 1268 _ 51
        push    edx                                     ; 1269 _ 52
        push    eax                                     ; 126A _ 50
        push    15                                      ; 126B _ 6A, 0F
        push    dword [ebp+0CH]                         ; 126D _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1270 _ FF. 75, 08
        call    boxfill8                                ; 1273 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1278 _ 83. C4, 1C
        nop                                             ; 127B _ 90
        mov     ebx, dword [ebp-4H]                     ; 127C _ 8B. 5D, FC
        leave                                           ; 127F _ C9
        ret                                             ; 1280 _ C3
; init_screen8 End of function

make_window8:; Function begin
        push    ebp                                     ; 1281 _ 55
        mov     ebp, esp                                ; 1282 _ 89. E5
        push    ebx                                     ; 1284 _ 53
        sub     esp, 36                                 ; 1285 _ 83. EC, 24
        mov     eax, dword [ebp+0CH]                    ; 1288 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 128B _ 8B. 40, 04
        mov     dword [ebp-10H], eax                    ; 128E _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 1291 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 1294 _ 8B. 40, 08
        mov     dword [ebp-0CH], eax                    ; 1297 _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 129A _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 129D _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 12A0 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 12A3 _ 8B. 00
        push    0                                       ; 12A5 _ 6A, 00
        push    edx                                     ; 12A7 _ 52
        push    0                                       ; 12A8 _ 6A, 00
        push    0                                       ; 12AA _ 6A, 00
        push    8                                       ; 12AC _ 6A, 08
        push    dword [ebp-10H]                         ; 12AE _ FF. 75, F0
        push    eax                                     ; 12B1 _ 50
        call    boxfill8                                ; 12B2 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 12B7 _ 83. C4, 1C
        mov     eax, dword [ebp-10H]                    ; 12BA _ 8B. 45, F0
        lea     edx, [eax-2H]                           ; 12BD _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 12C0 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 12C3 _ 8B. 00
        push    1                                       ; 12C5 _ 6A, 01
        push    edx                                     ; 12C7 _ 52
        push    1                                       ; 12C8 _ 6A, 01
        push    1                                       ; 12CA _ 6A, 01
        push    7                                       ; 12CC _ 6A, 07
        push    dword [ebp-10H]                         ; 12CE _ FF. 75, F0
        push    eax                                     ; 12D1 _ 50
        call    boxfill8                                ; 12D2 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 12D7 _ 83. C4, 1C
        mov     eax, dword [ebp-0CH]                    ; 12DA _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 12DD _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 12E0 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 12E3 _ 8B. 00
        push    edx                                     ; 12E5 _ 52
        push    0                                       ; 12E6 _ 6A, 00
        push    0                                       ; 12E8 _ 6A, 00
        push    0                                       ; 12EA _ 6A, 00
        push    8                                       ; 12EC _ 6A, 08
        push    dword [ebp-10H]                         ; 12EE _ FF. 75, F0
        push    eax                                     ; 12F1 _ 50
        call    boxfill8                                ; 12F2 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 12F7 _ 83. C4, 1C
        mov     eax, dword [ebp-0CH]                    ; 12FA _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 12FD _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1300 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1303 _ 8B. 00
        push    edx                                     ; 1305 _ 52
        push    1                                       ; 1306 _ 6A, 01
        push    1                                       ; 1308 _ 6A, 01
        push    1                                       ; 130A _ 6A, 01
        push    8                                       ; 130C _ 6A, 08
        push    dword [ebp-10H]                         ; 130E _ FF. 75, F0
        push    eax                                     ; 1311 _ 50
        call    boxfill8                                ; 1312 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1317 _ 83. C4, 1C
        mov     eax, dword [ebp-0CH]                    ; 131A _ 8B. 45, F4
        lea     ebx, [eax-2H]                           ; 131D _ 8D. 58, FE
        mov     eax, dword [ebp-10H]                    ; 1320 _ 8B. 45, F0
        lea     ecx, [eax-2H]                           ; 1323 _ 8D. 48, FE
        mov     eax, dword [ebp-10H]                    ; 1326 _ 8B. 45, F0
        lea     edx, [eax-2H]                           ; 1329 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 132C _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 132F _ 8B. 00
        push    ebx                                     ; 1331 _ 53
        push    ecx                                     ; 1332 _ 51
        push    1                                       ; 1333 _ 6A, 01
        push    edx                                     ; 1335 _ 52
        push    15                                      ; 1336 _ 6A, 0F
        push    dword [ebp-10H]                         ; 1338 _ FF. 75, F0
        push    eax                                     ; 133B _ 50
        call    boxfill8                                ; 133C _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1341 _ 83. C4, 1C
        mov     eax, dword [ebp-0CH]                    ; 1344 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 1347 _ 8D. 58, FF
        mov     eax, dword [ebp-10H]                    ; 134A _ 8B. 45, F0
        lea     ecx, [eax-1H]                           ; 134D _ 8D. 48, FF
        mov     eax, dword [ebp-10H]                    ; 1350 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 1353 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1356 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1359 _ 8B. 00
        push    ebx                                     ; 135B _ 53
        push    ecx                                     ; 135C _ 51
        push    0                                       ; 135D _ 6A, 00
        push    edx                                     ; 135F _ 52
        push    0                                       ; 1360 _ 6A, 00
        push    dword [ebp-10H]                         ; 1362 _ FF. 75, F0
        push    eax                                     ; 1365 _ 50
        call    boxfill8                                ; 1366 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 136B _ 83. C4, 1C
        mov     eax, dword [ebp-0CH]                    ; 136E _ 8B. 45, F4
        lea     ecx, [eax-3H]                           ; 1371 _ 8D. 48, FD
        mov     eax, dword [ebp-10H]                    ; 1374 _ 8B. 45, F0
        lea     edx, [eax-3H]                           ; 1377 _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 137A _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 137D _ 8B. 00
        push    ecx                                     ; 137F _ 51
        push    edx                                     ; 1380 _ 52
        push    2                                       ; 1381 _ 6A, 02
        push    2                                       ; 1383 _ 6A, 02
        push    8                                       ; 1385 _ 6A, 08
        push    dword [ebp-10H]                         ; 1387 _ FF. 75, F0
        push    eax                                     ; 138A _ 50
        call    boxfill8                                ; 138B _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1390 _ 83. C4, 1C
        mov     eax, dword [ebp-10H]                    ; 1393 _ 8B. 45, F0
        lea     edx, [eax-4H]                           ; 1396 _ 8D. 50, FC
        mov     eax, dword [ebp+0CH]                    ; 1399 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 139C _ 8B. 00
        push    20                                      ; 139E _ 6A, 14
        push    edx                                     ; 13A0 _ 52
        push    3                                       ; 13A1 _ 6A, 03
        push    3                                       ; 13A3 _ 6A, 03
        push    12                                      ; 13A5 _ 6A, 0C
        push    dword [ebp-10H]                         ; 13A7 _ FF. 75, F0
        push    eax                                     ; 13AA _ 50
        call    boxfill8                                ; 13AB _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 13B0 _ 83. C4, 1C
        mov     eax, dword [ebp-0CH]                    ; 13B3 _ 8B. 45, F4
        lea     ebx, [eax-2H]                           ; 13B6 _ 8D. 58, FE
        mov     eax, dword [ebp-10H]                    ; 13B9 _ 8B. 45, F0
        lea     ecx, [eax-2H]                           ; 13BC _ 8D. 48, FE
        mov     eax, dword [ebp-0CH]                    ; 13BF _ 8B. 45, F4
        lea     edx, [eax-2H]                           ; 13C2 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 13C5 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 13C8 _ 8B. 00
        push    ebx                                     ; 13CA _ 53
        push    ecx                                     ; 13CB _ 51
        push    edx                                     ; 13CC _ 52
        push    1                                       ; 13CD _ 6A, 01
        push    15                                      ; 13CF _ 6A, 0F
        push    dword [ebp-10H]                         ; 13D1 _ FF. 75, F0
        push    eax                                     ; 13D4 _ 50
        call    boxfill8                                ; 13D5 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 13DA _ 83. C4, 1C
        mov     eax, dword [ebp-0CH]                    ; 13DD _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 13E0 _ 8D. 58, FF
        mov     eax, dword [ebp-10H]                    ; 13E3 _ 8B. 45, F0
        lea     ecx, [eax-1H]                           ; 13E6 _ 8D. 48, FF
        mov     eax, dword [ebp-0CH]                    ; 13E9 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 13EC _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 13EF _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 13F2 _ 8B. 00
        push    ebx                                     ; 13F4 _ 53
        push    ecx                                     ; 13F5 _ 51
        push    edx                                     ; 13F6 _ 52
        push    0                                       ; 13F7 _ 6A, 00
        push    0                                       ; 13F9 _ 6A, 00
        push    dword [ebp-10H]                         ; 13FB _ FF. 75, F0
        push    eax                                     ; 13FE _ 50
        call    boxfill8                                ; 13FF _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1404 _ 83. C4, 1C
        sub     esp, 8                                  ; 1407 _ 83. EC, 08
        push    dword [ebp+10H]                         ; 140A _ FF. 75, 10
        push    7                                       ; 140D _ 6A, 07
        push    4                                       ; 140F _ 6A, 04
        push    24                                      ; 1411 _ 6A, 18
        push    dword [ebp+0CH]                         ; 1413 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1416 _ FF. 75, 08
        call    showString                              ; 1419 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 141E _ 83. C4, 20
        mov     dword [ebp-14H], 0                      ; 1421 _ C7. 45, EC, 00000000
        jmp     ?_069                                   ; 1428 _ E9, 00000083

?_062:  mov     dword [ebp-18H], 0                      ; 142D _ C7. 45, E8, 00000000
        jmp     ?_068                                   ; 1434 _ EB, 70

?_063:  mov     eax, dword [ebp-14H]                    ; 1436 _ 8B. 45, EC
        shl     eax, 4                                  ; 1439 _ C1. E0, 04
        mov     edx, eax                                ; 143C _ 89. C2
        mov     eax, dword [ebp-18H]                    ; 143E _ 8B. 45, E8
        add     eax, edx                                ; 1441 _ 01. D0
        add     eax, closebtn.1857                      ; 1443 _ 05, 00000160(d)
        movzx   eax, byte [eax]                         ; 1448 _ 0F B6. 00
        mov     byte [ebp-19H], al                      ; 144B _ 88. 45, E7
        cmp     byte [ebp-19H], 64                      ; 144E _ 80. 7D, E7, 40
        jnz     ?_064                                   ; 1452 _ 75, 06
        mov     byte [ebp-19H], 0                       ; 1454 _ C6. 45, E7, 00
        jmp     ?_067                                   ; 1458 _ EB, 1C

?_064:  cmp     byte [ebp-19H], 36                      ; 145A _ 80. 7D, E7, 24
        jnz     ?_065                                   ; 145E _ 75, 06
        mov     byte [ebp-19H], 15                      ; 1460 _ C6. 45, E7, 0F
        jmp     ?_067                                   ; 1464 _ EB, 10

?_065:  cmp     byte [ebp-19H], 81                      ; 1466 _ 80. 7D, E7, 51
        jnz     ?_066                                   ; 146A _ 75, 06
        mov     byte [ebp-19H], 8                       ; 146C _ C6. 45, E7, 08
        jmp     ?_067                                   ; 1470 _ EB, 04

?_066:  mov     byte [ebp-19H], 7                       ; 1472 _ C6. 45, E7, 07
?_067:  mov     eax, dword [ebp+0CH]                    ; 1476 _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 1479 _ 8B. 10
        mov     eax, dword [ebp-14H]                    ; 147B _ 8B. 45, EC
        lea     ecx, [eax+5H]                           ; 147E _ 8D. 48, 05
        mov     eax, dword [ebp+0CH]                    ; 1481 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1484 _ 8B. 40, 04
        imul    ecx, eax                                ; 1487 _ 0F AF. C8
        mov     eax, dword [ebp+0CH]                    ; 148A _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 148D _ 8B. 40, 04
        lea     ebx, [eax-15H]                          ; 1490 _ 8D. 58, EB
        mov     eax, dword [ebp-18H]                    ; 1493 _ 8B. 45, E8
        add     eax, ebx                                ; 1496 _ 01. D8
        add     eax, ecx                                ; 1498 _ 01. C8
        add     edx, eax                                ; 149A _ 01. C2
        movzx   eax, byte [ebp-19H]                     ; 149C _ 0F B6. 45, E7
        mov     byte [edx], al                          ; 14A0 _ 88. 02
        add     dword [ebp-18H], 1                      ; 14A2 _ 83. 45, E8, 01
?_068:  cmp     dword [ebp-18H], 15                     ; 14A6 _ 83. 7D, E8, 0F
        jle     ?_063                                   ; 14AA _ 7E, 8A
        add     dword [ebp-14H], 1                      ; 14AC _ 83. 45, EC, 01
?_069:  cmp     dword [ebp-14H], 13                     ; 14B0 _ 83. 7D, EC, 0D
        jle     ?_062                                   ; 14B4 _ 0F 8E, FFFFFF73
        nop                                             ; 14BA _ 90
        mov     ebx, dword [ebp-4H]                     ; 14BB _ 8B. 5D, FC
        leave                                           ; 14BE _ C9
        ret                                             ; 14BF _ C3
; make_window8 End of function

message_box:; Function begin
        push    ebp                                     ; 14C0 _ 55
        mov     ebp, esp                                ; 14C1 _ 89. E5
        sub     esp, 24                                 ; 14C3 _ 83. EC, 18
        sub     esp, 12                                 ; 14C6 _ 83. EC, 0C
        push    dword [ebp+8H]                          ; 14C9 _ FF. 75, 08
        call    sheet_alloc                             ; 14CC _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 14D1 _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 14D4 _ 89. 45, F0
        mov     eax, dword [memman]                     ; 14D7 _ A1, 00000000(d)
        sub     esp, 8                                  ; 14DC _ 83. EC, 08
        push    10880                                   ; 14DF _ 68, 00002A80
        push    eax                                     ; 14E4 _ 50
        call    memman_alloc_4k                         ; 14E5 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 14EA _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 14ED _ 89. 45, F4
        sub     esp, 12                                 ; 14F0 _ 83. EC, 0C
        push    -1                                      ; 14F3 _ 6A, FF
        push    68                                      ; 14F5 _ 6A, 44
        push    160                                     ; 14F7 _ 68, 000000A0
        push    dword [ebp-0CH]                         ; 14FC _ FF. 75, F4
        push    dword [ebp-10H]                         ; 14FF _ FF. 75, F0
        call    sheet_setbuf                            ; 1502 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1507 _ 83. C4, 20
        sub     esp, 4                                  ; 150A _ 83. EC, 04
        push    dword [ebp+0CH]                         ; 150D _ FF. 75, 0C
        push    dword [ebp-10H]                         ; 1510 _ FF. 75, F0
        push    dword [ebp+8H]                          ; 1513 _ FF. 75, 08
        call    make_window8                            ; 1516 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 151B _ 83. C4, 10
        sub     esp, 8                                  ; 151E _ 83. EC, 08
        push    ?_132                                   ; 1521 _ 68, 00000063(d)
        push    0                                       ; 1526 _ 6A, 00
        push    28                                      ; 1528 _ 6A, 1C
        push    24                                      ; 152A _ 6A, 18
        push    dword [ebp-10H]                         ; 152C _ FF. 75, F0
        push    dword [ebp+8H]                          ; 152F _ FF. 75, 08
        call    showString                              ; 1532 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1537 _ 83. C4, 20
        sub     esp, 8                                  ; 153A _ 83. EC, 08
        push    ?_133                                   ; 153D _ 68, 0000006F(d)
        push    0                                       ; 1542 _ 6A, 00
        push    44                                      ; 1544 _ 6A, 2C
        push    24                                      ; 1546 _ 6A, 18
        push    dword [ebp-10H]                         ; 1548 _ FF. 75, F0
        push    dword [ebp+8H]                          ; 154B _ FF. 75, 08
        call    showString                              ; 154E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1553 _ 83. C4, 20
        push    72                                      ; 1556 _ 6A, 48
        push    80                                      ; 1558 _ 6A, 50
        push    dword [ebp-10H]                         ; 155A _ FF. 75, F0
        push    dword [ebp+8H]                          ; 155D _ FF. 75, 08
        call    sheet_slide                             ; 1560 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1565 _ 83. C4, 10
        sub     esp, 4                                  ; 1568 _ 83. EC, 04
        push    1                                       ; 156B _ 6A, 01
        push    dword [ebp-10H]                         ; 156D _ FF. 75, F0
        push    dword [ebp+8H]                          ; 1570 _ FF. 75, 08
        call    sheet_updown                            ; 1573 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1578 _ 83. C4, 10
        nop                                             ; 157B _ 90
        leave                                           ; 157C _ C9
        ret                                             ; 157D _ C3
; message_box End of function

memman_init:; Function begin
        push    ebp                                     ; 157E _ 55
        mov     ebp, esp                                ; 157F _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 1581 _ 8B. 45, 08
        mov     dword [eax], 0                          ; 1584 _ C7. 00, 00000000
        mov     eax, dword [ebp+8H]                     ; 158A _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 158D _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 1594 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 1597 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 159E _ 8B. 45, 08
        mov     dword [eax+0CH], 0                      ; 15A1 _ C7. 40, 0C, 00000000
        nop                                             ; 15A8 _ 90
        pop     ebp                                     ; 15A9 _ 5D
        ret                                             ; 15AA _ C3
; memman_init End of function

memman_total:; Function begin
        push    ebp                                     ; 15AB _ 55
        mov     ebp, esp                                ; 15AC _ 89. E5
        sub     esp, 16                                 ; 15AE _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 15B1 _ C7. 45, FC, 00000000
        mov     dword [ebp-8H], 0                       ; 15B8 _ C7. 45, F8, 00000000
        jmp     ?_071                                   ; 15BF _ EB, 14

?_070:  mov     eax, dword [ebp+8H]                     ; 15C1 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 15C4 _ 8B. 55, F8
        add     edx, 2                                  ; 15C7 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 15CA _ 8B. 44 D0, 04
        add     dword [ebp-4H], eax                     ; 15CE _ 01. 45, FC
        add     dword [ebp-8H], 1                       ; 15D1 _ 83. 45, F8, 01
?_071:  mov     eax, dword [ebp+8H]                     ; 15D5 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 15D8 _ 8B. 00
        cmp     dword [ebp-8H], eax                     ; 15DA _ 39. 45, F8
        jc      ?_070                                   ; 15DD _ 72, E2
        mov     eax, dword [ebp-4H]                     ; 15DF _ 8B. 45, FC
        leave                                           ; 15E2 _ C9
        ret                                             ; 15E3 _ C3
; memman_total End of function

memman_alloc:; Function begin
        push    ebp                                     ; 15E4 _ 55
        mov     ebp, esp                                ; 15E5 _ 89. E5
        sub     esp, 16                                 ; 15E7 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 15EA _ C7. 45, F8, 00000000
        jmp     ?_075                                   ; 15F1 _ E9, 00000085

?_072:  mov     eax, dword [ebp+8H]                     ; 15F6 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 15F9 _ 8B. 55, F8
        add     edx, 2                                  ; 15FC _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 15FF _ 8B. 44 D0, 04
        cmp     dword [ebp+0CH], eax                    ; 1603 _ 39. 45, 0C
        ja      ?_074                                   ; 1606 _ 77, 6F
        mov     eax, dword [ebp+8H]                     ; 1608 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 160B _ 8B. 55, F8
        add     edx, 2                                  ; 160E _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 1611 _ 8B. 04 D0
        mov     dword [ebp-4H], eax                     ; 1614 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 1617 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 161A _ 8B. 55, F8
        add     edx, 2                                  ; 161D _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 1620 _ 8B. 14 D0
        mov     eax, dword [ebp+0CH]                    ; 1623 _ 8B. 45, 0C
        lea     ecx, [edx+eax]                          ; 1626 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1629 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 162C _ 8B. 55, F8
        add     edx, 2                                  ; 162F _ 83. C2, 02
        mov     dword [eax+edx*8], ecx                  ; 1632 _ 89. 0C D0
        mov     eax, dword [ebp+8H]                     ; 1635 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1638 _ 8B. 55, F8
        add     edx, 2                                  ; 163B _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 163E _ 8B. 44 D0, 04
        sub     eax, dword [ebp+0CH]                    ; 1642 _ 2B. 45, 0C
        mov     edx, eax                                ; 1645 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1647 _ 8B. 45, 08
        mov     ecx, dword [ebp-8H]                     ; 164A _ 8B. 4D, F8
        add     ecx, 2                                  ; 164D _ 83. C1, 02
        mov     dword [eax+ecx*8+4H], edx               ; 1650 _ 89. 54 C8, 04
        mov     eax, dword [ebp+8H]                     ; 1654 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1657 _ 8B. 55, F8
        add     edx, 2                                  ; 165A _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 165D _ 8B. 44 D0, 04
        test    eax, eax                                ; 1661 _ 85. C0
        jnz     ?_073                                   ; 1663 _ 75, 0D
        mov     eax, dword [ebp+8H]                     ; 1665 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1668 _ 8B. 00
        lea     edx, [eax-1H]                           ; 166A _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 166D _ 8B. 45, 08
        mov     dword [eax], edx                        ; 1670 _ 89. 10
?_073:  mov     eax, dword [ebp-4H]                     ; 1672 _ 8B. 45, FC
        jmp     ?_076                                   ; 1675 _ EB, 17

?_074:  add     dword [ebp-8H], 1                       ; 1677 _ 83. 45, F8, 01
?_075:  mov     eax, dword [ebp+8H]                     ; 167B _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 167E _ 8B. 00
        cmp     dword [ebp-8H], eax                     ; 1680 _ 39. 45, F8
        jc      ?_072                                   ; 1683 _ 0F 82, FFFFFF6D
        mov     eax, 0                                  ; 1689 _ B8, 00000000
?_076:  leave                                           ; 168E _ C9
        ret                                             ; 168F _ C3
; memman_alloc End of function

memman_free:; Function begin
        push    ebp                                     ; 1690 _ 55
        mov     ebp, esp                                ; 1691 _ 89. E5
        push    ebx                                     ; 1693 _ 53
        sub     esp, 16                                 ; 1694 _ 83. EC, 10
        mov     dword [ebp-0CH], 0                      ; 1697 _ C7. 45, F4, 00000000
        jmp     ?_078                                   ; 169E _ EB, 15

?_077:  mov     eax, dword [ebp+8H]                     ; 16A0 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 16A3 _ 8B. 55, F4
        add     edx, 2                                  ; 16A6 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 16A9 _ 8B. 04 D0
        cmp     dword [ebp+0CH], eax                    ; 16AC _ 39. 45, 0C
        jc      ?_079                                   ; 16AF _ 72, 10
        add     dword [ebp-0CH], 1                      ; 16B1 _ 83. 45, F4, 01
?_078:  mov     eax, dword [ebp+8H]                     ; 16B5 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 16B8 _ 8B. 00
        cmp     dword [ebp-0CH], eax                    ; 16BA _ 39. 45, F4
        jl      ?_077                                   ; 16BD _ 7C, E1
        jmp     ?_080                                   ; 16BF _ EB, 01

?_079:  nop                                             ; 16C1 _ 90
?_080:  cmp     dword [ebp-0CH], 0                      ; 16C2 _ 83. 7D, F4, 00
        jle     ?_082                                   ; 16C6 _ 0F 8E, 000000B9
        mov     eax, dword [ebp-0CH]                    ; 16CC _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 16CF _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 16D2 _ 8B. 45, 08
        add     edx, 2                                  ; 16D5 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 16D8 _ 8B. 14 D0
        mov     eax, dword [ebp-0CH]                    ; 16DB _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 16DE _ 8D. 48, FF
        mov     eax, dword [ebp+8H]                     ; 16E1 _ 8B. 45, 08
        add     ecx, 2                                  ; 16E4 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 16E7 _ 8B. 44 C8, 04
        add     eax, edx                                ; 16EB _ 01. D0
        cmp     dword [ebp+0CH], eax                    ; 16ED _ 39. 45, 0C
        jne     ?_082                                   ; 16F0 _ 0F 85, 0000008F
        mov     eax, dword [ebp-0CH]                    ; 16F6 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 16F9 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 16FC _ 8B. 45, 08
        add     edx, 2                                  ; 16FF _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 1702 _ 8B. 54 D0, 04
        mov     eax, dword [ebp-0CH]                    ; 1706 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 1709 _ 8D. 58, FF
        mov     eax, dword [ebp+10H]                    ; 170C _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 170F _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1712 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 1715 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 1718 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 171C _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 171F _ 8B. 00
        test    eax, eax                                ; 1721 _ 85. C0
        jle     ?_081                                   ; 1723 _ 7E, 56
        mov     edx, dword [ebp+0CH]                    ; 1725 _ 8B. 55, 0C
        mov     eax, dword [ebp+10H]                    ; 1728 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 172B _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 172E _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1731 _ 8B. 55, F4
        add     edx, 2                                  ; 1734 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 1737 _ 8B. 04 D0
        cmp     ecx, eax                                ; 173A _ 39. C1
        jnz     ?_081                                   ; 173C _ 75, 3D
        mov     eax, dword [ebp-0CH]                    ; 173E _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1741 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1744 _ 8B. 45, 08
        add     edx, 2                                  ; 1747 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 174A _ 8B. 54 D0, 04
        mov     eax, dword [ebp+8H]                     ; 174E _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 1751 _ 8B. 4D, F4
        add     ecx, 2                                  ; 1754 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 1757 _ 8B. 44 C8, 04
        mov     ecx, dword [ebp-0CH]                    ; 175B _ 8B. 4D, F4
        lea     ebx, [ecx-1H]                           ; 175E _ 8D. 59, FF
        lea     ecx, [edx+eax]                          ; 1761 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1764 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 1767 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 176A _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 176E _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1771 _ 8B. 00
        lea     edx, [eax-1H]                           ; 1773 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1776 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 1779 _ 89. 10
?_081:  mov     eax, 0                                  ; 177B _ B8, 00000000
        jmp     ?_088                                   ; 1780 _ E9, 0000011B

?_082:  mov     eax, dword [ebp+8H]                     ; 1785 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1788 _ 8B. 00
        test    eax, eax                                ; 178A _ 85. C0
        jle     ?_083                                   ; 178C _ 7E, 52
        mov     edx, dword [ebp+0CH]                    ; 178E _ 8B. 55, 0C
        mov     eax, dword [ebp+10H]                    ; 1791 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 1794 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1797 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 179A _ 8B. 55, F4
        add     edx, 2                                  ; 179D _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 17A0 _ 8B. 04 D0
        cmp     ecx, eax                                ; 17A3 _ 39. C1
        jnz     ?_083                                   ; 17A5 _ 75, 39
        mov     eax, dword [ebp+8H]                     ; 17A7 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 17AA _ 8B. 55, F4
        add     edx, 2                                  ; 17AD _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 17B0 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 17B4 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 17B7 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 17BA _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 17BD _ 8B. 55, F4
        add     edx, 2                                  ; 17C0 _ 83. C2, 02
        mov     dword [eax+edx*8+4H], ecx               ; 17C3 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 17C7 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 17CA _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 17CD _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 17D0 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 17D3 _ 89. 14 C8
        mov     eax, 0                                  ; 17D6 _ B8, 00000000
        jmp     ?_088                                   ; 17DB _ E9, 000000C0

?_083:  mov     eax, dword [ebp+8H]                     ; 17E0 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 17E3 _ 8B. 00
        cmp     eax, 4095                               ; 17E5 _ 3D, 00000FFF
        jg      ?_087                                   ; 17EA _ 0F 8F, 00000087
        mov     eax, dword [ebp+8H]                     ; 17F0 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 17F3 _ 8B. 00
        lea     edx, [eax+1H]                           ; 17F5 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 17F8 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 17FB _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 17FD _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1800 _ 8B. 00
        mov     dword [ebp-8H], eax                     ; 1802 _ 89. 45, F8
        jmp     ?_085                                   ; 1805 _ EB, 28

?_084:  mov     eax, dword [ebp-8H]                     ; 1807 _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 180A _ 8D. 50, FF
        mov     ecx, dword [ebp+8H]                     ; 180D _ 8B. 4D, 08
        mov     eax, dword [ebp-8H]                     ; 1810 _ 8B. 45, F8
        lea     ebx, [eax+2H]                           ; 1813 _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 1816 _ 8B. 45, 08
        add     edx, 2                                  ; 1819 _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 181C _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 181F _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 1821 _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 1824 _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 1827 _ 89. 54 D9, 04
        sub     dword [ebp-8H], 1                       ; 182B _ 83. 6D, F8, 01
?_085:  mov     eax, dword [ebp-8H]                     ; 182F _ 8B. 45, F8
        cmp     eax, dword [ebp-0CH]                    ; 1832 _ 3B. 45, F4
        jg      ?_084                                   ; 1835 _ 7F, D0
        mov     eax, dword [ebp+8H]                     ; 1837 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 183A _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 183D _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1840 _ 8B. 00
        cmp     edx, eax                                ; 1842 _ 39. C2
        jge     ?_086                                   ; 1844 _ 7D, 0B
        mov     eax, dword [ebp+8H]                     ; 1846 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 1849 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 184B _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 184E _ 89. 50, 04
?_086:  mov     eax, dword [ebp+8H]                     ; 1851 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1854 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 1857 _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 185A _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 185D _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 1860 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1863 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 1866 _ 8D. 4A, 02
        mov     edx, dword [ebp+10H]                    ; 1869 _ 8B. 55, 10
        mov     dword [eax+ecx*8+4H], edx               ; 186C _ 89. 54 C8, 04
        mov     eax, 0                                  ; 1870 _ B8, 00000000
        jmp     ?_088                                   ; 1875 _ EB, 29

?_087:  mov     eax, dword [ebp+8H]                     ; 1877 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 187A _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 187D _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1880 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 1883 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 1886 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 1889 _ 8B. 40, 08
        mov     edx, eax                                ; 188C _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 188E _ 8B. 45, 10
        add     eax, edx                                ; 1891 _ 01. D0
        mov     edx, eax                                ; 1893 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1895 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 1898 _ 89. 50, 08
        mov     eax, 4294967295                         ; 189B _ B8, FFFFFFFF
?_088:  add     esp, 16                                 ; 18A0 _ 83. C4, 10
        pop     ebx                                     ; 18A3 _ 5B
        pop     ebp                                     ; 18A4 _ 5D
        ret                                             ; 18A5 _ C3
; memman_free End of function

memman_alloc_4k:; Function begin
        push    ebp                                     ; 18A6 _ 55
        mov     ebp, esp                                ; 18A7 _ 89. E5
        sub     esp, 16                                 ; 18A9 _ 83. EC, 10
        mov     eax, dword [ebp+0CH]                    ; 18AC _ 8B. 45, 0C
        add     eax, 4095                               ; 18AF _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 18B4 _ 25, FFFFF000
        mov     dword [ebp+0CH], eax                    ; 18B9 _ 89. 45, 0C
        push    dword [ebp+0CH]                         ; 18BC _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 18BF _ FF. 75, 08
        call    memman_alloc                            ; 18C2 _ E8, FFFFFFFC(rel)
        add     esp, 8                                  ; 18C7 _ 83. C4, 08
        mov     dword [ebp-4H], eax                     ; 18CA _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 18CD _ 8B. 45, FC
        leave                                           ; 18D0 _ C9
        ret                                             ; 18D1 _ C3
; memman_alloc_4k End of function

memman_free_4k:; Function begin
        push    ebp                                     ; 18D2 _ 55
        mov     ebp, esp                                ; 18D3 _ 89. E5
        sub     esp, 16                                 ; 18D5 _ 83. EC, 10
        mov     eax, dword [ebp+10H]                    ; 18D8 _ 8B. 45, 10
        add     eax, 4095                               ; 18DB _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 18E0 _ 25, FFFFF000
        mov     dword [ebp+10H], eax                    ; 18E5 _ 89. 45, 10
        push    dword [ebp+10H]                         ; 18E8 _ FF. 75, 10
        push    dword [ebp+0CH]                         ; 18EB _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 18EE _ FF. 75, 08
        call    memman_free                             ; 18F1 _ E8, FFFFFFFC(rel)
        add     esp, 12                                 ; 18F6 _ 83. C4, 0C
        mov     dword [ebp-4H], eax                     ; 18F9 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 18FC _ 8B. 45, FC
        leave                                           ; 18FF _ C9
        ret                                             ; 1900 _ C3
; memman_free_4k End of function

shtctl_init:; Function begin
        push    ebp                                     ; 1901 _ 55
        mov     ebp, esp                                ; 1902 _ 89. E5
        sub     esp, 24                                 ; 1904 _ 83. EC, 18
        sub     esp, 8                                  ; 1907 _ 83. EC, 08
        push    9232                                    ; 190A _ 68, 00002410
        push    dword [ebp+8H]                          ; 190F _ FF. 75, 08
        call    memman_alloc_4k                         ; 1912 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1917 _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 191A _ 89. 45, F4
        cmp     dword [ebp-0CH], 0                      ; 191D _ 83. 7D, F4, 00
        jnz     ?_089                                   ; 1921 _ 75, 07
        mov     eax, 0                                  ; 1923 _ B8, 00000000
        jmp     ?_092                                   ; 1928 _ EB, 54

?_089:  mov     eax, dword [ebp-0CH]                    ; 192A _ 8B. 45, F4
        mov     edx, dword [ebp+0CH]                    ; 192D _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 1930 _ 89. 10
        mov     eax, dword [ebp-0CH]                    ; 1932 _ 8B. 45, F4
        mov     edx, dword [ebp+10H]                    ; 1935 _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 1938 _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 193B _ 8B. 45, F4
        mov     edx, dword [ebp+14H]                    ; 193E _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 1941 _ 89. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 1944 _ 8B. 45, F4
        mov     dword [eax+0CH], -1                     ; 1947 _ C7. 40, 0C, FFFFFFFF
        mov     dword [ebp-10H], 0                      ; 194E _ C7. 45, F0, 00000000
        jmp     ?_091                                   ; 1955 _ EB, 1B

?_090:  mov     eax, dword [ebp-0CH]                    ; 1957 _ 8B. 45, F4
        mov     edx, dword [ebp-10H]                    ; 195A _ 8B. 55, F0
        add     edx, 33                                 ; 195D _ 83. C2, 21
        shl     edx, 5                                  ; 1960 _ C1. E2, 05
        add     eax, edx                                ; 1963 _ 01. D0
        add     eax, 12                                 ; 1965 _ 83. C0, 0C
        mov     dword [eax], 0                          ; 1968 _ C7. 00, 00000000
        add     dword [ebp-10H], 1                      ; 196E _ 83. 45, F0, 01
?_091:  cmp     dword [ebp-10H], 255                    ; 1972 _ 81. 7D, F0, 000000FF
        jle     ?_090                                   ; 1979 _ 7E, DC
        mov     eax, dword [ebp-0CH]                    ; 197B _ 8B. 45, F4
?_092:  leave                                           ; 197E _ C9
        ret                                             ; 197F _ C3
; shtctl_init End of function

sheet_alloc:; Function begin
        push    ebp                                     ; 1980 _ 55
        mov     ebp, esp                                ; 1981 _ 89. E5
        sub     esp, 16                                 ; 1983 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 1986 _ C7. 45, F8, 00000000
        jmp     ?_095                                   ; 198D _ EB, 57

?_093:  mov     eax, dword [ebp+8H]                     ; 198F _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1992 _ 8B. 55, F8
        add     edx, 33                                 ; 1995 _ 83. C2, 21
        shl     edx, 5                                  ; 1998 _ C1. E2, 05
        add     eax, edx                                ; 199B _ 01. D0
        add     eax, 12                                 ; 199D _ 83. C0, 0C
        mov     eax, dword [eax]                        ; 19A0 _ 8B. 00
        test    eax, eax                                ; 19A2 _ 85. C0
        jnz     ?_094                                   ; 19A4 _ 75, 3C
        mov     eax, dword [ebp-8H]                     ; 19A6 _ 8B. 45, F8
        shl     eax, 5                                  ; 19A9 _ C1. E0, 05
        lea     edx, [eax+410H]                         ; 19AC _ 8D. 90, 00000410
        mov     eax, dword [ebp+8H]                     ; 19B2 _ 8B. 45, 08
        add     eax, edx                                ; 19B5 _ 01. D0
        mov     dword [ebp-4H], eax                     ; 19B7 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 19BA _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 19BD _ 8B. 55, F8
        lea     ecx, [edx+4H]                           ; 19C0 _ 8D. 4A, 04
        mov     edx, dword [ebp-4H]                     ; 19C3 _ 8B. 55, FC
        mov     dword [eax+ecx*4], edx                  ; 19C6 _ 89. 14 88
        mov     eax, dword [ebp-4H]                     ; 19C9 _ 8B. 45, FC
        mov     dword [eax+1CH], 1                      ; 19CC _ C7. 40, 1C, 00000001
        mov     eax, dword [ebp-4H]                     ; 19D3 _ 8B. 45, FC
        mov     dword [eax+18H], -1                     ; 19D6 _ C7. 40, 18, FFFFFFFF
        mov     eax, dword [ebp-4H]                     ; 19DD _ 8B. 45, FC
        jmp     ?_096                                   ; 19E0 _ EB, 12

?_094:  add     dword [ebp-8H], 1                       ; 19E2 _ 83. 45, F8, 01
?_095:  cmp     dword [ebp-8H], 255                     ; 19E6 _ 81. 7D, F8, 000000FF
        jle     ?_093                                   ; 19ED _ 7E, A0
        mov     eax, 0                                  ; 19EF _ B8, 00000000
?_096:  leave                                           ; 19F4 _ C9
        ret                                             ; 19F5 _ C3
; sheet_alloc End of function

sheet_setbuf:; Function begin
        push    ebp                                     ; 19F6 _ 55
        mov     ebp, esp                                ; 19F7 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 19F9 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 19FC _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 19FF _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 1A01 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 1A04 _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 1A07 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1A0A _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 1A0D _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 1A10 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 1A13 _ 8B. 45, 08
        mov     edx, dword [ebp+18H]                    ; 1A16 _ 8B. 55, 18
        mov     dword [eax+14H], edx                    ; 1A19 _ 89. 50, 14
        nop                                             ; 1A1C _ 90
        pop     ebp                                     ; 1A1D _ 5D
        ret                                             ; 1A1E _ C3
; sheet_setbuf End of function

sheet_updown:; Function begin
        push    ebp                                     ; 1A1F _ 55
        mov     ebp, esp                                ; 1A20 _ 89. E5
        push    ebx                                     ; 1A22 _ 53
        sub     esp, 20                                 ; 1A23 _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 1A26 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 1A29 _ 8B. 40, 18
        mov     dword [ebp-0CH], eax                    ; 1A2C _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 1A2F _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1A32 _ 8B. 40, 0C
        add     eax, 1                                  ; 1A35 _ 83. C0, 01
        cmp     dword [ebp+10H], eax                    ; 1A38 _ 39. 45, 10
        jle     ?_097                                   ; 1A3B _ 7E, 0C
        mov     eax, dword [ebp+8H]                     ; 1A3D _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1A40 _ 8B. 40, 0C
        add     eax, 1                                  ; 1A43 _ 83. C0, 01
        mov     dword [ebp+10H], eax                    ; 1A46 _ 89. 45, 10
?_097:  cmp     dword [ebp+10H], -1                     ; 1A49 _ 83. 7D, 10, FF
        jge     ?_098                                   ; 1A4D _ 7D, 07
        mov     dword [ebp+10H], -1                     ; 1A4F _ C7. 45, 10, FFFFFFFF
?_098:  mov     eax, dword [ebp+0CH]                    ; 1A56 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 1A59 _ 8B. 55, 10
        mov     dword [eax+18H], edx                    ; 1A5C _ 89. 50, 18
        mov     eax, dword [ebp-0CH]                    ; 1A5F _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 1A62 _ 3B. 45, 10
        jle     ?_106                                   ; 1A65 _ 0F 8E, 000000F7
        cmp     dword [ebp+10H], 0                      ; 1A6B _ 83. 7D, 10, 00
        js      ?_101                                   ; 1A6F _ 78, 52
        mov     eax, dword [ebp-0CH]                    ; 1A71 _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 1A74 _ 89. 45, F0
        jmp     ?_100                                   ; 1A77 _ EB, 31

?_099:  mov     eax, dword [ebp-10H]                    ; 1A79 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 1A7C _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1A7F _ 8B. 45, 08
        add     edx, 4                                  ; 1A82 _ 83. C2, 04
        mov     edx, dword [eax+edx*4]                  ; 1A85 _ 8B. 14 90
        mov     eax, dword [ebp+8H]                     ; 1A88 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 1A8B _ 8B. 4D, F0
        add     ecx, 4                                  ; 1A8E _ 83. C1, 04
        mov     dword [eax+ecx*4], edx                  ; 1A91 _ 89. 14 88
        mov     eax, dword [ebp+8H]                     ; 1A94 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 1A97 _ 8B. 55, F0
        add     edx, 4                                  ; 1A9A _ 83. C2, 04
        mov     eax, dword [eax+edx*4]                  ; 1A9D _ 8B. 04 90
        mov     edx, dword [ebp-10H]                    ; 1AA0 _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 1AA3 _ 89. 50, 18
        sub     dword [ebp-10H], 1                      ; 1AA6 _ 83. 6D, F0, 01
?_100:  mov     eax, dword [ebp-10H]                    ; 1AAA _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 1AAD _ 3B. 45, 10
        jg      ?_099                                   ; 1AB0 _ 7F, C7
        mov     eax, dword [ebp+8H]                     ; 1AB2 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 1AB5 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 1AB8 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 1ABB _ 8B. 55, 0C
        mov     dword [eax+ecx*4], edx                  ; 1ABE _ 89. 14 88
        jmp     ?_105                                   ; 1AC1 _ EB, 5E

?_101:  mov     eax, dword [ebp+8H]                     ; 1AC3 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1AC6 _ 8B. 40, 0C
        cmp     dword [ebp-0CH], eax                    ; 1AC9 _ 39. 45, F4
        jge     ?_104                                   ; 1ACC _ 7D, 44
        mov     eax, dword [ebp-0CH]                    ; 1ACE _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 1AD1 _ 89. 45, F0
        jmp     ?_103                                   ; 1AD4 _ EB, 31

?_102:  mov     eax, dword [ebp-10H]                    ; 1AD6 _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 1AD9 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1ADC _ 8B. 45, 08
        add     edx, 4                                  ; 1ADF _ 83. C2, 04
        mov     edx, dword [eax+edx*4]                  ; 1AE2 _ 8B. 14 90
        mov     eax, dword [ebp+8H]                     ; 1AE5 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 1AE8 _ 8B. 4D, F0
        add     ecx, 4                                  ; 1AEB _ 83. C1, 04
        mov     dword [eax+ecx*4], edx                  ; 1AEE _ 89. 14 88
        mov     eax, dword [ebp+8H]                     ; 1AF1 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 1AF4 _ 8B. 55, F0
        add     edx, 4                                  ; 1AF7 _ 83. C2, 04
        mov     eax, dword [eax+edx*4]                  ; 1AFA _ 8B. 04 90
        mov     edx, dword [ebp-10H]                    ; 1AFD _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 1B00 _ 89. 50, 18
        add     dword [ebp-10H], 1                      ; 1B03 _ 83. 45, F0, 01
?_103:  mov     eax, dword [ebp+8H]                     ; 1B07 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1B0A _ 8B. 40, 0C
        cmp     dword [ebp-10H], eax                    ; 1B0D _ 39. 45, F0
        jl      ?_102                                   ; 1B10 _ 7C, C4
?_104:  mov     eax, dword [ebp+8H]                     ; 1B12 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1B15 _ 8B. 40, 0C
        lea     edx, [eax-1H]                           ; 1B18 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1B1B _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 1B1E _ 89. 50, 0C
?_105:  mov     eax, dword [ebp+0CH]                    ; 1B21 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1B24 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1B27 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 1B2A _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 1B2D _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 1B30 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 1B33 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 1B36 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1B39 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 1B3C _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 1B3F _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1B42 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1B45 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 1B48 _ 8B. 40, 0C
        sub     esp, 12                                 ; 1B4B _ 83. EC, 0C
        push    ebx                                     ; 1B4E _ 53
        push    ecx                                     ; 1B4F _ 51
        push    edx                                     ; 1B50 _ 52
        push    eax                                     ; 1B51 _ 50
        push    dword [ebp+8H]                          ; 1B52 _ FF. 75, 08
        call    sheet_refreshsub                        ; 1B55 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1B5A _ 83. C4, 20
        jmp     ?_113                                   ; 1B5D _ E9, 00000108

?_106:  mov     eax, dword [ebp-0CH]                    ; 1B62 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 1B65 _ 3B. 45, 10
        jge     ?_113                                   ; 1B68 _ 0F 8D, 000000FC
        cmp     dword [ebp-0CH], 0                      ; 1B6E _ 83. 7D, F4, 00
        js      ?_109                                   ; 1B72 _ 78, 52
        mov     eax, dword [ebp-0CH]                    ; 1B74 _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 1B77 _ 89. 45, F0
        jmp     ?_108                                   ; 1B7A _ EB, 31

?_107:  mov     eax, dword [ebp-10H]                    ; 1B7C _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 1B7F _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1B82 _ 8B. 45, 08
        add     edx, 4                                  ; 1B85 _ 83. C2, 04
        mov     edx, dword [eax+edx*4]                  ; 1B88 _ 8B. 14 90
        mov     eax, dword [ebp+8H]                     ; 1B8B _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 1B8E _ 8B. 4D, F0
        add     ecx, 4                                  ; 1B91 _ 83. C1, 04
        mov     dword [eax+ecx*4], edx                  ; 1B94 _ 89. 14 88
        mov     eax, dword [ebp+8H]                     ; 1B97 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 1B9A _ 8B. 55, F0
        add     edx, 4                                  ; 1B9D _ 83. C2, 04
        mov     eax, dword [eax+edx*4]                  ; 1BA0 _ 8B. 04 90
        mov     edx, dword [ebp-10H]                    ; 1BA3 _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 1BA6 _ 89. 50, 18
        add     dword [ebp-10H], 1                      ; 1BA9 _ 83. 45, F0, 01
?_108:  mov     eax, dword [ebp-10H]                    ; 1BAD _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 1BB0 _ 3B. 45, 10
        jl      ?_107                                   ; 1BB3 _ 7C, C7
        mov     eax, dword [ebp+8H]                     ; 1BB5 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 1BB8 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 1BBB _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 1BBE _ 8B. 55, 0C
        mov     dword [eax+ecx*4], edx                  ; 1BC1 _ 89. 14 88
        jmp     ?_112                                   ; 1BC4 _ EB, 68

?_109:  mov     eax, dword [ebp+8H]                     ; 1BC6 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1BC9 _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 1BCC _ 89. 45, F0
        jmp     ?_111                                   ; 1BCF _ EB, 37

?_110:  mov     eax, dword [ebp-10H]                    ; 1BD1 _ 8B. 45, F0
        lea     ecx, [eax+1H]                           ; 1BD4 _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 1BD7 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 1BDA _ 8B. 55, F0
        add     edx, 4                                  ; 1BDD _ 83. C2, 04
        mov     edx, dword [eax+edx*4]                  ; 1BE0 _ 8B. 14 90
        mov     eax, dword [ebp+8H]                     ; 1BE3 _ 8B. 45, 08
        add     ecx, 4                                  ; 1BE6 _ 83. C1, 04
        mov     dword [eax+ecx*4], edx                  ; 1BE9 _ 89. 14 88
        mov     eax, dword [ebp-10H]                    ; 1BEC _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 1BEF _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1BF2 _ 8B. 45, 08
        add     edx, 4                                  ; 1BF5 _ 83. C2, 04
        mov     eax, dword [eax+edx*4]                  ; 1BF8 _ 8B. 04 90
        mov     edx, dword [ebp-10H]                    ; 1BFB _ 8B. 55, F0
        add     edx, 1                                  ; 1BFE _ 83. C2, 01
        mov     dword [eax+18H], edx                    ; 1C01 _ 89. 50, 18
        sub     dword [ebp-10H], 1                      ; 1C04 _ 83. 6D, F0, 01
?_111:  mov     eax, dword [ebp-10H]                    ; 1C08 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 1C0B _ 3B. 45, 10
        jge     ?_110                                   ; 1C0E _ 7D, C1
        mov     eax, dword [ebp+8H]                     ; 1C10 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 1C13 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 1C16 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 1C19 _ 8B. 55, 0C
        mov     dword [eax+ecx*4], edx                  ; 1C1C _ 89. 14 88
        mov     eax, dword [ebp+8H]                     ; 1C1F _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1C22 _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 1C25 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1C28 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 1C2B _ 89. 50, 0C
?_112:  mov     eax, dword [ebp+0CH]                    ; 1C2E _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1C31 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1C34 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 1C37 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 1C3A _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 1C3D _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 1C40 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 1C43 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1C46 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 1C49 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 1C4C _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1C4F _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1C52 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 1C55 _ 8B. 40, 0C
        sub     esp, 12                                 ; 1C58 _ 83. EC, 0C
        push    ebx                                     ; 1C5B _ 53
        push    ecx                                     ; 1C5C _ 51
        push    edx                                     ; 1C5D _ 52
        push    eax                                     ; 1C5E _ 50
        push    dword [ebp+8H]                          ; 1C5F _ FF. 75, 08
        call    sheet_refreshsub                        ; 1C62 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1C67 _ 83. C4, 20
?_113:  nop                                             ; 1C6A _ 90
        mov     ebx, dword [ebp-4H]                     ; 1C6B _ 8B. 5D, FC
        leave                                           ; 1C6E _ C9
        ret                                             ; 1C6F _ C3
; sheet_updown End of function

sheet_refresh:; Function begin
        push    ebp                                     ; 1C70 _ 55
        mov     ebp, esp                                ; 1C71 _ 89. E5
        push    esi                                     ; 1C73 _ 56
        push    ebx                                     ; 1C74 _ 53
        mov     eax, dword [ebp+0CH]                    ; 1C75 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 1C78 _ 8B. 40, 18
        test    eax, eax                                ; 1C7B _ 85. C0
        js      ?_114                                   ; 1C7D _ 78, 40
        mov     eax, dword [ebp+0CH]                    ; 1C7F _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1C82 _ 8B. 50, 10
        mov     eax, dword [ebp+1CH]                    ; 1C85 _ 8B. 45, 1C
        lea     ebx, [edx+eax]                          ; 1C88 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 1C8B _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 1C8E _ 8B. 50, 0C
        mov     eax, dword [ebp+18H]                    ; 1C91 _ 8B. 45, 18
        lea     ecx, [edx+eax]                          ; 1C94 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 1C97 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1C9A _ 8B. 50, 10
        mov     eax, dword [ebp+14H]                    ; 1C9D _ 8B. 45, 14
        add     edx, eax                                ; 1CA0 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 1CA2 _ 8B. 45, 0C
        mov     esi, dword [eax+0CH]                    ; 1CA5 _ 8B. 70, 0C
        mov     eax, dword [ebp+10H]                    ; 1CA8 _ 8B. 45, 10
        add     eax, esi                                ; 1CAB _ 01. F0
        sub     esp, 12                                 ; 1CAD _ 83. EC, 0C
        push    ebx                                     ; 1CB0 _ 53
        push    ecx                                     ; 1CB1 _ 51
        push    edx                                     ; 1CB2 _ 52
        push    eax                                     ; 1CB3 _ 50
        push    dword [ebp+8H]                          ; 1CB4 _ FF. 75, 08
        call    sheet_refreshsub                        ; 1CB7 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1CBC _ 83. C4, 20
?_114:  mov     eax, 0                                  ; 1CBF _ B8, 00000000
        lea     esp, [ebp-8H]                           ; 1CC4 _ 8D. 65, F8
        pop     ebx                                     ; 1CC7 _ 5B
        pop     esi                                     ; 1CC8 _ 5E
        pop     ebp                                     ; 1CC9 _ 5D
        ret                                             ; 1CCA _ C3
; sheet_refresh End of function

sheet_slide_mouse:; Function begin
        push    ebp                                     ; 1CCB _ 55
        mov     ebp, esp                                ; 1CCC _ 89. E5
        sub     esp, 24                                 ; 1CCE _ 83. EC, 18
        mov     eax, dword [ebp+0CH]                    ; 1CD1 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 1CD4 _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 1CD7 _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 1CDA _ 8B. 45, 0C
        mov     eax, dword [eax+10H]                    ; 1CDD _ 8B. 40, 10
        mov     dword [ebp-0CH], eax                    ; 1CE0 _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 1CE3 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 1CE6 _ 8B. 55, 10
        mov     dword [eax+0CH], edx                    ; 1CE9 _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 1CEC _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 1CEF _ 8B. 55, 14
        mov     dword [eax+10H], edx                    ; 1CF2 _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1CF5 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 1CF8 _ 8B. 40, 18
        test    eax, eax                                ; 1CFB _ 85. C0
        js      ?_115                                   ; 1CFD _ 78, 4E
        mov     eax, dword [ebp-0CH]                    ; 1CFF _ 8B. 45, F4
        lea     edx, [eax+10H]                          ; 1D02 _ 8D. 50, 10
        mov     eax, dword [ebp-10H]                    ; 1D05 _ 8B. 45, F0
        add     eax, 16                                 ; 1D08 _ 83. C0, 10
        sub     esp, 12                                 ; 1D0B _ 83. EC, 0C
        push    edx                                     ; 1D0E _ 52
        push    eax                                     ; 1D0F _ 50
        push    dword [ebp-0CH]                         ; 1D10 _ FF. 75, F4
        push    dword [ebp-10H]                         ; 1D13 _ FF. 75, F0
        push    dword [ebp+8H]                          ; 1D16 _ FF. 75, 08
        call    sheet_refreshsub                        ; 1D19 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1D1E _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 1D21 _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 1D24 _ 8B. 50, 08
        mov     eax, dword [ebp+14H]                    ; 1D27 _ 8B. 45, 14
        add     edx, eax                                ; 1D2A _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 1D2C _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 1D2F _ 8B. 48, 04
        mov     eax, dword [ebp+10H]                    ; 1D32 _ 8B. 45, 10
        add     eax, ecx                                ; 1D35 _ 01. C8
        sub     esp, 12                                 ; 1D37 _ 83. EC, 0C
        push    edx                                     ; 1D3A _ 52
        push    eax                                     ; 1D3B _ 50
        push    dword [ebp+14H]                         ; 1D3C _ FF. 75, 14
        push    dword [ebp+10H]                         ; 1D3F _ FF. 75, 10
        push    dword [ebp+8H]                          ; 1D42 _ FF. 75, 08
        call    sheet_refreshsub                        ; 1D45 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1D4A _ 83. C4, 20
?_115:  nop                                             ; 1D4D _ 90
        leave                                           ; 1D4E _ C9
        ret                                             ; 1D4F _ C3
; sheet_slide_mouse End of function

sheet_slide:; Function begin
        push    ebp                                     ; 1D50 _ 55
        mov     ebp, esp                                ; 1D51 _ 89. E5
        sub     esp, 24                                 ; 1D53 _ 83. EC, 18
        mov     eax, dword [ebp+0CH]                    ; 1D56 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 1D59 _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 1D5C _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 1D5F _ 8B. 45, 0C
        mov     eax, dword [eax+10H]                    ; 1D62 _ 8B. 40, 10
        mov     dword [ebp-0CH], eax                    ; 1D65 _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 1D68 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 1D6B _ 8B. 55, 10
        mov     dword [eax+0CH], edx                    ; 1D6E _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 1D71 _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 1D74 _ 8B. 55, 14
        mov     dword [eax+10H], edx                    ; 1D77 _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1D7A _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 1D7D _ 8B. 40, 18
        test    eax, eax                                ; 1D80 _ 85. C0
        js      ?_116                                   ; 1D82 _ 78, 58
        mov     eax, dword [ebp+0CH]                    ; 1D84 _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 1D87 _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 1D8A _ 8B. 45, F4
        add     edx, eax                                ; 1D8D _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 1D8F _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 1D92 _ 8B. 48, 04
        mov     eax, dword [ebp-10H]                    ; 1D95 _ 8B. 45, F0
        add     eax, ecx                                ; 1D98 _ 01. C8
        sub     esp, 12                                 ; 1D9A _ 83. EC, 0C
        push    edx                                     ; 1D9D _ 52
        push    eax                                     ; 1D9E _ 50
        push    dword [ebp-0CH]                         ; 1D9F _ FF. 75, F4
        push    dword [ebp-10H]                         ; 1DA2 _ FF. 75, F0
        push    dword [ebp+8H]                          ; 1DA5 _ FF. 75, 08
        call    sheet_refreshsub                        ; 1DA8 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1DAD _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 1DB0 _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 1DB3 _ 8B. 50, 08
        mov     eax, dword [ebp+14H]                    ; 1DB6 _ 8B. 45, 14
        add     edx, eax                                ; 1DB9 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 1DBB _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 1DBE _ 8B. 48, 04
        mov     eax, dword [ebp+10H]                    ; 1DC1 _ 8B. 45, 10
        add     eax, ecx                                ; 1DC4 _ 01. C8
        sub     esp, 12                                 ; 1DC6 _ 83. EC, 0C
        push    edx                                     ; 1DC9 _ 52
        push    eax                                     ; 1DCA _ 50
        push    dword [ebp+14H]                         ; 1DCB _ FF. 75, 14
        push    dword [ebp+10H]                         ; 1DCE _ FF. 75, 10
        push    dword [ebp+8H]                          ; 1DD1 _ FF. 75, 08
        call    sheet_refreshsub                        ; 1DD4 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1DD9 _ 83. C4, 20
?_116:  nop                                             ; 1DDC _ 90
        leave                                           ; 1DDD _ C9
        ret                                             ; 1DDE _ C3
; sheet_slide End of function

sheet_refreshsub:; Function begin
        push    ebp                                     ; 1DDF _ 55
        mov     ebp, esp                                ; 1DE0 _ 89. E5
        sub     esp, 48                                 ; 1DE2 _ 83. EC, 30
        mov     eax, dword [ebp+8H]                     ; 1DE5 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1DE8 _ 8B. 00
        mov     dword [ebp-14H], eax                    ; 1DEA _ 89. 45, EC
        mov     dword [ebp-20H], 0                      ; 1DED _ C7. 45, E0, 00000000
        jmp     ?_123                                   ; 1DF4 _ E9, 000000ED

?_117:  mov     eax, dword [ebp+8H]                     ; 1DF9 _ 8B. 45, 08
        mov     edx, dword [ebp-20H]                    ; 1DFC _ 8B. 55, E0
        add     edx, 4                                  ; 1DFF _ 83. C2, 04
        mov     eax, dword [eax+edx*4]                  ; 1E02 _ 8B. 04 90
        mov     dword [ebp-10H], eax                    ; 1E05 _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 1E08 _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 1E0B _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 1E0D _ 89. 45, F4
        mov     dword [ebp-18H], 0                      ; 1E10 _ C7. 45, E8, 00000000
        jmp     ?_122                                   ; 1E17 _ E9, 000000B7

?_118:  mov     eax, dword [ebp-10H]                    ; 1E1C _ 8B. 45, F0
        mov     edx, dword [eax+10H]                    ; 1E1F _ 8B. 50, 10
        mov     eax, dword [ebp-18H]                    ; 1E22 _ 8B. 45, E8
        add     eax, edx                                ; 1E25 _ 01. D0
        mov     dword [ebp-8H], eax                     ; 1E27 _ 89. 45, F8
        mov     dword [ebp-1CH], 0                      ; 1E2A _ C7. 45, E4, 00000000
        jmp     ?_121                                   ; 1E31 _ E9, 0000008A

?_119:  mov     eax, dword [ebp-10H]                    ; 1E36 _ 8B. 45, F0
        mov     edx, dword [eax+0CH]                    ; 1E39 _ 8B. 50, 0C
        mov     eax, dword [ebp-1CH]                    ; 1E3C _ 8B. 45, E4
        add     eax, edx                                ; 1E3F _ 01. D0
        mov     dword [ebp-4H], eax                     ; 1E41 _ 89. 45, FC
        mov     eax, dword [ebp+0CH]                    ; 1E44 _ 8B. 45, 0C
        cmp     eax, dword [ebp-4H]                     ; 1E47 _ 3B. 45, FC
        jg      ?_120                                   ; 1E4A _ 7F, 70
        mov     eax, dword [ebp-4H]                     ; 1E4C _ 8B. 45, FC
        cmp     eax, dword [ebp+14H]                    ; 1E4F _ 3B. 45, 14
        jge     ?_120                                   ; 1E52 _ 7D, 68
        mov     eax, dword [ebp+10H]                    ; 1E54 _ 8B. 45, 10
        cmp     eax, dword [ebp-8H]                     ; 1E57 _ 3B. 45, F8
        jg      ?_120                                   ; 1E5A _ 7F, 60
        mov     eax, dword [ebp-8H]                     ; 1E5C _ 8B. 45, F8
        cmp     eax, dword [ebp+18H]                    ; 1E5F _ 3B. 45, 18
        jge     ?_120                                   ; 1E62 _ 7D, 58
        mov     eax, dword [ebp-10H]                    ; 1E64 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 1E67 _ 8B. 40, 04
        imul    eax, dword [ebp-18H]                    ; 1E6A _ 0F AF. 45, E8
        mov     edx, eax                                ; 1E6E _ 89. C2
        mov     eax, dword [ebp-1CH]                    ; 1E70 _ 8B. 45, E4
        add     eax, edx                                ; 1E73 _ 01. D0
        mov     edx, eax                                ; 1E75 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 1E77 _ 8B. 45, F4
        add     eax, edx                                ; 1E7A _ 01. D0
        movzx   eax, byte [eax]                         ; 1E7C _ 0F B6. 00
        mov     byte [ebp-21H], al                      ; 1E7F _ 88. 45, DF
        movzx   edx, byte [ebp-21H]                     ; 1E82 _ 0F B6. 55, DF
        mov     eax, dword [ebp-10H]                    ; 1E86 _ 8B. 45, F0
        mov     eax, dword [eax+14H]                    ; 1E89 _ 8B. 40, 14
        cmp     edx, eax                                ; 1E8C _ 39. C2
        jz      ?_120                                   ; 1E8E _ 74, 2C
        mov     eax, dword [ebp+8H]                     ; 1E90 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 1E93 _ 8B. 40, 04
        sub     eax, 1                                  ; 1E96 _ 83. E8, 01
        cmp     dword [ebp-4H], eax                     ; 1E99 _ 39. 45, FC
        jg      ?_120                                   ; 1E9C _ 7F, 1E
        mov     eax, dword [ebp+8H]                     ; 1E9E _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 1EA1 _ 8B. 40, 04
        imul    eax, dword [ebp-8H]                     ; 1EA4 _ 0F AF. 45, F8
        mov     edx, eax                                ; 1EA8 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 1EAA _ 8B. 45, FC
        add     eax, edx                                ; 1EAD _ 01. D0
        mov     edx, eax                                ; 1EAF _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 1EB1 _ 8B. 45, EC
        add     edx, eax                                ; 1EB4 _ 01. C2
        movzx   eax, byte [ebp-21H]                     ; 1EB6 _ 0F B6. 45, DF
        mov     byte [edx], al                          ; 1EBA _ 88. 02
?_120:  add     dword [ebp-1CH], 1                      ; 1EBC _ 83. 45, E4, 01
?_121:  mov     eax, dword [ebp-10H]                    ; 1EC0 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 1EC3 _ 8B. 40, 04
        cmp     dword [ebp-1CH], eax                    ; 1EC6 _ 39. 45, E4
        jl      ?_119                                   ; 1EC9 _ 0F 8C, FFFFFF67
        add     dword [ebp-18H], 1                      ; 1ECF _ 83. 45, E8, 01
?_122:  mov     eax, dword [ebp-10H]                    ; 1ED3 _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 1ED6 _ 8B. 40, 08
        cmp     dword [ebp-18H], eax                    ; 1ED9 _ 39. 45, E8
        jl      ?_118                                   ; 1EDC _ 0F 8C, FFFFFF3A
        add     dword [ebp-20H], 1                      ; 1EE2 _ 83. 45, E0, 01
?_123:  mov     eax, dword [ebp+8H]                     ; 1EE6 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1EE9 _ 8B. 40, 0C
        cmp     dword [ebp-20H], eax                    ; 1EEC _ 39. 45, E0
        jle     ?_117                                   ; 1EEF _ 0F 8E, FFFFFF04
        nop                                             ; 1EF5 _ 90
        leave                                           ; 1EF6 _ C9
        ret                                             ; 1EF7 _ C3
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
        dd 00000346H, 080E4100H                         ; 0024 _ 838 135151872 
        dd 0D420285H, 03834405H                         ; 002C _ 222429829 58934277 
        dd 0000001CH, 00000038H                         ; 0034 _ 28 56 
        dd CMain-$+30AH                                 ; 003C _ 00000346 (rel)
        dd 00000021H, 080E4100H                         ; 0040 _ 33 135151872 
        dd 0D420285H, 0CC55D05H                         ; 0048 _ 222429829 214260997 
        dd 00000404H, 0000001CH                         ; 0050 _ 1028 28 
        dd 00000058H                                    ; 0058 _ 88 
        dd CMain-$+30BH                                 ; 005C _ 00000367 (rel)
        dd 0000001DH, 080E4100H                         ; 0060 _ 29 135151872 
        dd 0D420285H, 0CC55905H                         ; 0068 _ 222429829 214259973 
        dd 00000404H, 0000001CH                         ; 0070 _ 1028 28 
        dd 00000078H                                    ; 0078 _ 120 
        dd CMain-$+308H                                 ; 007C _ 00000384 (rel)
        dd 000000ACH, 080E4100H                         ; 0080 _ 172 135151872 
        dd 0D420285H, 0C5A80205H                        ; 0088 _ 222429829 -978845179 
        dd 0004040CH, 0000001CH                         ; 0090 _ 263180 28 
        dd 00000098H                                    ; 0098 _ 152 
        dd CMain-$+394H                                 ; 009C _ 00000430 (rel)
        dd 00000052H, 080E4100H                         ; 00A0 _ 82 135151872 
        dd 0D420285H, 0C54E0205H                        ; 00A8 _ 222429829 -984743419 
        dd 0004040CH, 00000020H                         ; 00B0 _ 263180 32 
        dd 000000B8H                                    ; 00B8 _ 184 
        dd CMain-$+3C6H                                 ; 00BC _ 00000482 (rel)
        dd 00000084H, 080E4100H                         ; 00C0 _ 132 135151872 
        dd 0D420285H, 03834405H                         ; 00C8 _ 222429829 58934277 
        dd 0C3C57C02H, 0004040CH                        ; 00D0 _ -1010467838 263180 
        dd 0000001CH, 000000DCH                         ; 00D8 _ 28 220 
        dd CMain-$+426H                                 ; 00E0 _ 00000506 (rel)
        dd 00000191H, 080E4100H                         ; 00E4 _ 401 135151872 
        dd 0D420285H, 018D0305H                         ; 00EC _ 222429829 26018565 
        dd 04040CC5H, 0000001CH                         ; 00F4 _ 67374277 28 
        dd 000000FCH                                    ; 00FC _ 252 
        dd CMain-$+597H                                 ; 0100 _ 00000697 (rel)
        dd 000000DAH, 080E4100H                         ; 0104 _ 218 135151872 
        dd 0D420285H, 0C5D60205H                        ; 010C _ 222429829 -975830523 
        dd 0004040CH, 00000020H                         ; 0114 _ 263180 32 
        dd 0000011CH                                    ; 011C _ 284 
        dd CMain-$+651H                                 ; 0120 _ 00000771 (rel)
        dd 0000006FH, 080E4100H                         ; 0124 _ 111 135151872 
        dd 0D420285H, 03834405H                         ; 012C _ 222429829 58934277 
        dd 41C36602H, 04040CC5H                         ; 0134 _ 1103324674 67374277 
        dd 0000001CH, 00000140H                         ; 013C _ 28 320 
        dd CMain-$+69CH                                 ; 0144 _ 000007E0 (rel)
        dd 0000005FH, 080E4100H                         ; 0148 _ 95 135151872 
        dd 0D420285H, 0C55B0205H                        ; 0150 _ 222429829 -983891451 
        dd 0004040CH, 0000001CH                         ; 0158 _ 263180 28 
        dd 00000160H                                    ; 0160 _ 352 
        dd CMain-$+6DBH                                 ; 0164 _ 0000083F (rel)
        dd 00000024H, 080E4100H                         ; 0168 _ 36 135151872 
        dd 0D420285H, 0CC56005H                         ; 0170 _ 222429829 214261765 
        dd 00000404H, 0000001CH                         ; 0178 _ 1028 28 
        dd 00000180H                                    ; 0180 _ 384 
        dd CMain-$+6DFH                                 ; 0184 _ 00000863 (rel)
        dd 00000048H, 080E4100H                         ; 0188 _ 72 135151872 
        dd 0D420285H, 0C5440205H                        ; 0190 _ 222429829 -985398779 
        dd 0004040CH, 0000001CH                         ; 0198 _ 263180 28 
        dd 000001A0H                                    ; 01A0 _ 416 
        dd CMain-$+707H                                 ; 01A4 _ 000008AB (rel)
        dd 0000007DH, 080E4100H                         ; 01A8 _ 125 135151872 
        dd 0D420285H, 0C5790205H                        ; 01B0 _ 222429829 -981925371 
        dd 0004040CH, 0000001CH                         ; 01B8 _ 263180 28 
        dd 000001C0H                                    ; 01C0 _ 448 
        dd ?_028-$+1C4H                                 ; 01C4 _ 00000928 (rel)
        dd 00000020H, 080E4100H                         ; 01C8 _ 32 135151872 
        dd 0D420285H, 0CC55C05H                         ; 01D0 _ 222429829 214260741 
        dd 00000404H, 0000001CH                         ; 01D8 _ 1028 28 
        dd 000001E0H                                    ; 01E0 _ 480 
        dd ?_028-$+1E4H                                 ; 01E4 _ 00000948 (rel)
        dd 00000031H, 080E4100H                         ; 01E8 _ 49 135151872 
        dd 0D420285H, 0CC56D05H                         ; 01F0 _ 222429829 214265093 
        dd 00000404H, 0000001CH                         ; 01F8 _ 1028 28 
        dd 00000200H                                    ; 0200 _ 512 
        dd CMain-$+775H                                 ; 0204 _ 00000979 (rel)
        dd 0000003EH, 080E4100H                         ; 0208 _ 62 135151872 
        dd 0D420285H, 0CC57A05H                         ; 0210 _ 222429829 214268421 
        dd 00000404H, 0000001CH                         ; 0218 _ 1028 28 
        dd 00000220H                                    ; 0220 _ 544 
        dd CMain-$+793H                                 ; 0224 _ 000009B7 (rel)
        dd 0000004FH, 080E4100H                         ; 0228 _ 79 135151872 
        dd 0D420285H, 0C54B0205H                        ; 0230 _ 222429829 -984940027 
        dd 0004040CH, 0000001CH                         ; 0238 _ 263180 28 
        dd 00000240H                                    ; 0240 _ 576 
        dd CMain-$+7C2H                                 ; 0244 _ 00000A06 (rel)
        dd 0000003EH, 080E4100H                         ; 0248 _ 62 135151872 
        dd 0D420285H, 0CC57A05H                         ; 0250 _ 222429829 214268421 
        dd 00000404H, 0000001CH                         ; 0258 _ 1028 28 
        dd 00000260H                                    ; 0260 _ 608 
        dd intHandlerFromC-$+264H                       ; 0264 _ 00000A44 (rel)
        dd 00000080H, 080E4100H                         ; 0268 _ 128 135151872 
        dd 0D420285H, 0C57C0205H                        ; 0270 _ 222429829 -981728763 
        dd 0004040CH, 0000001CH                         ; 0278 _ 263180 28 
        dd 00000280H                                    ; 0280 _ 640 
        dd CMain-$+840H                                 ; 0284 _ 00000AC4 (rel)
        dd 00000070H, 080E4100H                         ; 0288 _ 112 135151872 
        dd 0D420285H, 0C56C0205H                        ; 0290 _ 222429829 -982777339 
        dd 0004040CH, 0000001CH                         ; 0298 _ 263180 28 
        dd 000002A0H                                    ; 02A0 _ 672 
        dd CMain-$+890H                                 ; 02A4 _ 00000B34 (rel)
        dd 00000015H, 080E4100H                         ; 02A8 _ 21 135151872 
        dd 0D420285H, 0CC55105H                         ; 02B0 _ 222429829 214257925 
        dd 00000404H, 0000001CH                         ; 02B8 _ 1028 28 
        dd 000002C0H                                    ; 02C0 _ 704 
        dd CMain-$+885H                                 ; 02C4 _ 00000B49 (rel)
        dd 0000013FH, 080E4100H                         ; 02C8 _ 319 135151872 
        dd 0D420285H, 013B0305H                         ; 02D0 _ 222429829 20644613 
        dd 04040CC5H, 0000001CH                         ; 02D8 _ 67374277 28 
        dd 000002E0H                                    ; 02E0 _ 736 
        dd CMain-$+9A4H                                 ; 02E4 _ 00000C88 (rel)
        dd 00000109H, 080E4100H                         ; 02E8 _ 265 135151872 
        dd 0D420285H, 01050305H                         ; 02F0 _ 222429829 17105669 
        dd 04040CC5H, 0000001CH                         ; 02F8 _ 67374277 28 
        dd 00000300H                                    ; 0300 _ 768 
        dd CMain-$+0A8DH                                ; 0304 _ 00000D91 (rel)
        dd 0000006DH, 080E4100H                         ; 0308 _ 109 135151872 
        dd 0D420285H, 0C5690205H                        ; 0310 _ 222429829 -982973947 
        dd 0004040CH, 0000001CH                         ; 0318 _ 263180 28 
        dd 00000320H                                    ; 0320 _ 800 
        dd CMain-$+0ADAH                                ; 0324 _ 00000DFE (rel)
        dd 00000266H, 080E4100H                         ; 0328 _ 614 135151872 
        dd 0D420285H, 02620305H                         ; 0330 _ 222429829 39977733 
        dd 04040CC5H, 00000020H                         ; 0338 _ 67374277 32 
        dd 00000340H                                    ; 0340 _ 832 
        dd CMain-$+0D20H                                ; 0344 _ 00001064 (rel)
        dd 0000021DH, 080E4100H                         ; 0348 _ 541 135151872 
        dd 0D420285H, 03834105H                         ; 0350 _ 222429829 58933509 
        dd 0C5021803H, 04040CC3H                        ; 0358 _ -989718525 67374275 
        dd 00000020H, 00000364H                         ; 0360 _ 32 868 
        dd CMain-$+0F19H                                ; 0368 _ 00001281 (rel)
        dd 0000023FH, 080E4100H                         ; 036C _ 575 135151872 
        dd 0D420285H, 03834405H                         ; 0374 _ 222429829 58934277 
        dd 0C5023703H, 04040CC3H                        ; 037C _ -989710589 67374275 
        dd 0000001CH, 00000388H                         ; 0384 _ 28 904 
        dd CMain-$+1134H                                ; 038C _ 000014C0 (rel)
        dd 000000BEH, 080E4100H                         ; 0390 _ 190 135151872 
        dd 0D420285H, 0C5BA0205H                        ; 0398 _ 222429829 -977665531 
        dd 0004040CH, 00000014H                         ; 03A0 _ 263180 20 
        dd 00000000H, 00527A01H                         ; 03A8 _ 0 5405185 
        dd 01087C01H, 04040C1BH                         ; 03B0 _ 17333249 67374107 
        dd 00000188H, 0000001CH                         ; 03B8 _ 392 28 
        dd 0000001CH                                    ; 03C0 _ 28 
        dd CMain-$+11BAH                                ; 03C4 _ 0000157E (rel)
        dd 0000002DH, 080E4100H                         ; 03C8 _ 45 135151872 
        dd 0D420285H, 0CC56905H                         ; 03D0 _ 222429829 214264069 
        dd 00000404H, 0000001CH                         ; 03D8 _ 1028 28 
        dd 0000003CH                                    ; 03E0 _ 60 
        dd CMain-$+11C7H                                ; 03E4 _ 000015AB (rel)
        dd 00000039H, 080E4100H                         ; 03E8 _ 57 135151872 
        dd 0D420285H, 0CC57505H                         ; 03F0 _ 222429829 214267141 
        dd 00000404H, 0000001CH                         ; 03F8 _ 1028 28 
        dd 0000005CH                                    ; 0400 _ 92 
        dd CMain-$+11E0H                                ; 0404 _ 000015E4 (rel)
        dd 000000ACH, 080E4100H                         ; 0408 _ 172 135151872 
        dd 0D420285H, 0C5A80205H                        ; 0410 _ 222429829 -978845179 
        dd 0004040CH, 00000024H                         ; 0418 _ 263180 36 
        dd 0000007CH                                    ; 0420 _ 124 
        dd CMain-$+126CH                                ; 0424 _ 00001690 (rel)
        dd 00000216H, 080E4100H                         ; 0428 _ 534 135151872 
        dd 0D420285H, 03834405H                         ; 0430 _ 222429829 58934277 
        dd 0C3020D03H, 040CC541H                        ; 0438 _ -1023275773 67945793 
        dd 00000004H, 0000001CH                         ; 0440 _ 4 28 
        dd 000000A4H                                    ; 0448 _ 164 
        dd ?_064-$+44CH                                 ; 044C _ 000018A6 (rel)
        dd 0000002CH, 080E4100H                         ; 0450 _ 44 135151872 
        dd 0D420285H, 0CC56805H                         ; 0458 _ 222429829 214263813 
        dd 00000404H, 0000001CH                         ; 0460 _ 1028 28 
        dd 000000C4H                                    ; 0468 _ 196 
        dd ?_065-$+46CH                                 ; 046C _ 000018D2 (rel)
        dd 0000002FH, 080E4100H                         ; 0470 _ 47 135151872 
        dd 0D420285H, 0CC56B05H                         ; 0478 _ 222429829 214264581 
        dd 00000404H, 00000014H                         ; 0480 _ 1028 20 
        dd 00000000H, 00527A01H                         ; 0488 _ 0 5405185 
        dd 01087C01H, 04040C1BH                         ; 0490 _ 17333249 67374107 
        dd 00000188H, 0000001CH                         ; 0498 _ 392 28 
        dd 0000001CH                                    ; 04A0 _ 28 
        dd CMain-$+145DH                                ; 04A4 _ 00001901 (rel)
        dd 0000007FH, 080E4100H                         ; 04A8 _ 127 135151872 
        dd 0D420285H, 0C57B0205H                        ; 04B0 _ 222429829 -981794299 
        dd 0004040CH, 0000001CH                         ; 04B8 _ 263180 28 
        dd 0000003CH                                    ; 04C0 _ 60 
        dd CMain-$+14BCH                                ; 04C4 _ 00001980 (rel)
        dd 00000076H, 080E4100H                         ; 04C8 _ 118 135151872 
        dd 0D420285H, 0C5720205H                        ; 04D0 _ 222429829 -982384123 
        dd 0004040CH, 0000001CH                         ; 04D8 _ 263180 28 
        dd 0000005CH                                    ; 04E0 _ 92 
        dd CMain-$+1512H                                ; 04E4 _ 000019F6 (rel)
        dd 00000029H, 080E4100H                         ; 04E8 _ 41 135151872 
        dd 0D420285H, 0CC56505H                         ; 04F0 _ 222429829 214263045 
        dd 00000404H, 00000020H                         ; 04F8 _ 1028 32 
        dd 0000007CH                                    ; 0500 _ 124 
        dd CMain-$+151BH                                ; 0504 _ 00001A1F (rel)
        dd 00000251H, 080E4100H                         ; 0508 _ 593 135151872 
        dd 0D420285H, 03834405H                         ; 0510 _ 222429829 58934277 
        dd 0C5024903H, 04040CC3H                        ; 0518 _ -989705981 67374275 
        dd 00000024H, 000000A0H                         ; 0520 _ 36 160 
        dd CMain-$+1748H                                ; 0528 _ 00001C70 (rel)
        dd 0000005BH, 080E4100H                         ; 052C _ 91 135151872 
        dd 0D420285H, 03864205H                         ; 0534 _ 222429829 59130373 
        dd 53020483H, 41C641C3H                         ; 053C _ 1392641155 1103512003 
        dd 04040CC5H, 0000001CH                         ; 0544 _ 67374277 28 
        dd 000000C8H                                    ; 054C _ 200 
        dd ?_081-$+550H                                 ; 0550 _ 00001CCB (rel)
        dd 00000085H, 080E4100H                         ; 0554 _ 133 135151872 
        dd 0D420285H, 0C5810205H                        ; 055C _ 222429829 -981401083 
        dd 0004040CH, 0000001CH                         ; 0564 _ 263180 28 
        dd 000000E8H                                    ; 056C _ 232 
        dd ?_083-$+570H                                 ; 0570 _ 00001D50 (rel)
        dd 0000008FH, 080E4100H                         ; 0574 _ 143 135151872 
        dd 0D420285H, 0C58B0205H                        ; 057C _ 222429829 -980745723 
        dd 0004040CH, 0000001CH                         ; 0584 _ 263180 28 
        dd 00000108H                                    ; 058C _ 264 
        dd CMain-$+184FH                                ; 0590 _ 00001DDF (rel)
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

table_rgb.1669:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 00H, 0FFH     ; 0020 _ ........
        db 00H, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH   ; 0028 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0030 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0038 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 0040 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 0048 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0050 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0058 _ ........

cursor.1726:                                            ; byte
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

closebtn.1857:                                          ; byte
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

str.1770:                                               ; byte
        resb    1                                       ; 0208

?_138:  resb    9                                       ; 0209

?_139:  resb    1                                       ; 0212


