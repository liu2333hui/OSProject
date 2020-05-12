; Disassembly of file: /home/bobkuo/eclipse-workspace/nasmCode/ckernel26.o
; Thu May  7 22:43:46 2020
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
global mouse_decode: function
global computeMousePosition: function
global show_mouse_info: function
global showMemoryInfo: function
global init_screen8: function
global make_window8: function
global message_box: function
global intHandlerFromTimer: function
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
global sheet_refreshmap: function
global init_pit: function
global timer_alloc: function
global timer_free: function
global timer_init: function
global timer_setdata: function
global timer_settime: function
global fifo8_init: function
global fifo8_put: function
global fifo8_get: function
global fifo8_status: function
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
        mov     dword [ebp-34H], eax                    ; 001C _ 89. 45, CC
        movzx   eax, word [?_170]                       ; 001F _ 0F B7. 05, 00000004(d)
        cwde                                            ; 0026 _ 98
        mov     dword [xsize], eax                      ; 0027 _ A3, 00000200(d)
        movzx   eax, word [?_171]                       ; 002C _ 0F B7. 05, 00000006(d)
        cwde                                            ; 0033 _ 98
        mov     dword [ysize], eax                      ; 0034 _ A3, 00000204(d)
        mov     eax, dword [bootInfo]                   ; 0039 _ A1, 00000000(d)
        mov     dword [ebp-30H], eax                    ; 003E _ 89. 45, D0
        mov     dword [ebp-2CH], 0                      ; 0041 _ C7. 45, D4, 00000000
        mov     dword [ebp-28H], 0                      ; 0048 _ C7. 45, D8, 00000000
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
        mov     dword [ebp-24H], eax                    ; 008F _ 89. 45, DC
        call    get_adr_buffer                          ; 0092 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 0097 _ 89. 45, E0
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
        push    dword [ebp-34H]                         ; 00D9 _ FF. 75, CC
        push    eax                                     ; 00DC _ 50
        call    shtctl_init                             ; 00DD _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00E2 _ 83. C4, 10
        mov     dword [ebp-1CH], eax                    ; 00E5 _ 89. 45, E4
        sub     esp, 12                                 ; 00E8 _ 83. EC, 0C
        push    dword [ebp-1CH]                         ; 00EB _ FF. 75, E4
        call    sheet_alloc                             ; 00EE _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00F3 _ 83. C4, 10
        mov     dword [ebp-2CH], eax                    ; 00F6 _ 89. 45, D4
        sub     esp, 12                                 ; 00F9 _ 83. EC, 0C
        push    dword [ebp-1CH]                         ; 00FC _ FF. 75, E4
        call    sheet_alloc                             ; 00FF _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0104 _ 83. C4, 10
        mov     dword [ebp-28H], eax                    ; 0107 _ 89. 45, D8
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
        push    dword [ebp-2CH]                         ; 014A _ FF. 75, D4
        call    sheet_setbuf                            ; 014D _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0152 _ 83. C4, 20
        sub     esp, 12                                 ; 0155 _ 83. EC, 0C
        push    99                                      ; 0158 _ 6A, 63
        push    16                                      ; 015A _ 6A, 10
        push    16                                      ; 015C _ 6A, 10
        push    buf_mouse                               ; 015E _ 68, 00000100(d)
        push    dword [ebp-28H]                         ; 0163 _ FF. 75, D8
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
        push    dword [ebp-2CH]                         ; 01A3 _ FF. 75, D4
        push    dword [ebp-1CH]                         ; 01A6 _ FF. 75, E4
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
        push    dword [ebp-28H]                         ; 01EA _ FF. 75, D8
        push    dword [ebp-1CH]                         ; 01ED _ FF. 75, E4
        call    sheet_slide                             ; 01F0 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 01F5 _ 83. C4, 10
        sub     esp, 8                                  ; 01F8 _ 83. EC, 08
        push    ?_156                                   ; 01FB _ 68, 00000000(d)
        push    dword [ebp-1CH]                         ; 0200 _ FF. 75, E4
        call    message_box                             ; 0203 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0208 _ 83. C4, 10
        mov     dword [ebp-18H], eax                    ; 020B _ 89. 45, E8
        sub     esp, 4                                  ; 020E _ 83. EC, 04
        push    0                                       ; 0211 _ 6A, 00
        push    dword [ebp-2CH]                         ; 0213 _ FF. 75, D4
        push    dword [ebp-1CH]                         ; 0216 _ FF. 75, E4
        call    sheet_updown                            ; 0219 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 021E _ 83. C4, 10
        sub     esp, 4                                  ; 0221 _ 83. EC, 04
        push    100                                     ; 0224 _ 6A, 64
        push    dword [ebp-28H]                         ; 0226 _ FF. 75, D8
        push    dword [ebp-1CH]                         ; 0229 _ FF. 75, E4
        call    sheet_updown                            ; 022C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0231 _ 83. C4, 10
        mov     eax, dword [memman]                     ; 0234 _ A1, 00000000(d)
        sub     esp, 12                                 ; 0239 _ 83. EC, 0C
        push    eax                                     ; 023C _ 50
        call    init_pit                                ; 023D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0242 _ 83. C4, 10
        mov     dword [timerctl], eax                   ; 0245 _ A3, 00000208(d)
        sub     esp, 4                                  ; 024A _ 83. EC, 04
        push    timerbuf1                               ; 024D _ 68, 00000260(d)
        push    8                                       ; 0252 _ 6A, 08
        push    timerfifo1                              ; 0254 _ 68, 00000218(d)
        call    fifo8_init                              ; 0259 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 025E _ 83. C4, 10
        mov     eax, dword [timerctl]                   ; 0261 _ A1, 00000208(d)
        sub     esp, 12                                 ; 0266 _ 83. EC, 0C
        push    eax                                     ; 0269 _ 50
        call    timer_alloc                             ; 026A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 026F _ 83. C4, 10
        mov     dword [timer1], eax                     ; 0272 _ A3, 0000020C(d)
        mov     eax, dword [timerctl]                   ; 0277 _ A1, 00000208(d)
        sub     esp, 12                                 ; 027C _ 83. EC, 0C
        push    eax                                     ; 027F _ 50
        call    timer_alloc                             ; 0280 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0285 _ 83. C4, 10
        mov     dword [timer2], eax                     ; 0288 _ A3, 00000210(d)
        mov     eax, dword [timerctl]                   ; 028D _ A1, 00000208(d)
        sub     esp, 12                                 ; 0292 _ 83. EC, 0C
        push    eax                                     ; 0295 _ 50
        call    timer_alloc                             ; 0296 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 029B _ 83. C4, 10
        mov     dword [timer3], eax                     ; 029E _ A3, 00000214(d)
        mov     edx, dword [timer1]                     ; 02A3 _ 8B. 15, 0000020C(d)
        mov     eax, dword [timerctl]                   ; 02A9 _ A1, 00000208(d)
        push    10                                      ; 02AE _ 6A, 0A
        push    timerfifo1                              ; 02B0 _ 68, 00000218(d)
        push    edx                                     ; 02B5 _ 52
        push    eax                                     ; 02B6 _ 50
        call    timer_init                              ; 02B7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 02BC _ 83. C4, 10
        mov     edx, dword [timer2]                     ; 02BF _ 8B. 15, 00000210(d)
        mov     eax, dword [timerctl]                   ; 02C5 _ A1, 00000208(d)
        push    2                                       ; 02CA _ 6A, 02
        push    timerfifo1                              ; 02CC _ 68, 00000218(d)
        push    edx                                     ; 02D1 _ 52
        push    eax                                     ; 02D2 _ 50
        call    timer_init                              ; 02D3 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 02D8 _ 83. C4, 10
        mov     edx, dword [timer3]                     ; 02DB _ 8B. 15, 00000214(d)
        mov     eax, dword [timerctl]                   ; 02E1 _ A1, 00000208(d)
        push    1                                       ; 02E6 _ 6A, 01
        push    timerfifo1                              ; 02E8 _ 68, 00000218(d)
        push    edx                                     ; 02ED _ 52
        push    eax                                     ; 02EE _ 50
        call    timer_init                              ; 02EF _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 02F4 _ 83. C4, 10
        mov     edx, dword [timer1]                     ; 02F7 _ 8B. 15, 0000020C(d)
        mov     eax, dword [timerctl]                   ; 02FD _ A1, 00000208(d)
        sub     esp, 4                                  ; 0302 _ 83. EC, 04
        push    500                                     ; 0305 _ 68, 000001F4
        push    edx                                     ; 030A _ 52
        push    eax                                     ; 030B _ 50
        call    timer_settime                           ; 030C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0311 _ 83. C4, 10
        mov     edx, dword [timer2]                     ; 0314 _ 8B. 15, 00000210(d)
        mov     eax, dword [timerctl]                   ; 031A _ A1, 00000208(d)
        sub     esp, 4                                  ; 031F _ 83. EC, 04
        push    300                                     ; 0322 _ 68, 0000012C
        push    edx                                     ; 0327 _ 52
        push    eax                                     ; 0328 _ 50
        call    timer_settime                           ; 0329 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 032E _ 83. C4, 10
        mov     edx, dword [timer3]                     ; 0331 _ 8B. 15, 00000214(d)
        mov     eax, dword [timerctl]                   ; 0337 _ A1, 00000208(d)
        sub     esp, 4                                  ; 033C _ 83. EC, 04
        push    50                                      ; 033F _ 6A, 32
        push    edx                                     ; 0341 _ 52
        push    eax                                     ; 0342 _ 50
        call    timer_settime                           ; 0343 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0348 _ 83. C4, 10
        call    io_sti                                  ; 034B _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 0350 _ 83. EC, 0C
        push    mdec                                    ; 0353 _ 68, 000000E0(d)
        call    enable_mouse                            ; 0358 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 035D _ 83. C4, 10
        mov     dword [ebp-14H], 0                      ; 0360 _ C7. 45, EC, 00000000
        mov     dword [ebp-38H], 0                      ; 0367 _ C7. 45, C8, 00000000
        mov     dword [ebp-10H], 0                      ; 036E _ C7. 45, F0, 00000000
?_001:  mov     eax, dword [timer1]                     ; 0375 _ A1, 0000020C(d)
        mov     eax, dword [eax+4H]                     ; 037A _ 8B. 40, 04
        sub     esp, 12                                 ; 037D _ 83. EC, 0C
        push    eax                                     ; 0380 _ 50
        call    intToHexStr                             ; 0381 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0386 _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 0389 _ 89. 45, F4
        mov     eax, dword [ebp-18H]                    ; 038C _ 8B. 45, E8
        mov     eax, dword [eax]                        ; 038F _ 8B. 00
        sub     esp, 4                                  ; 0391 _ 83. EC, 04
        push    43                                      ; 0394 _ 6A, 2B
        push    119                                     ; 0396 _ 6A, 77
        push    28                                      ; 0398 _ 6A, 1C
        push    40                                      ; 039A _ 6A, 28
        push    8                                       ; 039C _ 6A, 08
        push    160                                     ; 039E _ 68, 000000A0
        push    eax                                     ; 03A3 _ 50
        call    boxfill8                                ; 03A4 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 03A9 _ 83. C4, 20
        sub     esp, 8                                  ; 03AC _ 83. EC, 08
        push    dword [ebp-0CH]                         ; 03AF _ FF. 75, F4
        push    0                                       ; 03B2 _ 6A, 00
        push    28                                      ; 03B4 _ 6A, 1C
        push    40                                      ; 03B6 _ 6A, 28
        push    dword [ebp-18H]                         ; 03B8 _ FF. 75, E8
        push    dword [ebp-1CH]                         ; 03BB _ FF. 75, E4
        call    showString                              ; 03BE _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 03C3 _ 83. C4, 20
        call    io_cli                                  ; 03C6 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 03CB _ 83. EC, 0C
        push    keyinfo                                 ; 03CE _ 68, 00000020(d)
        call    fifo8_status                            ; 03D3 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03D8 _ 83. C4, 10
        mov     ebx, eax                                ; 03DB _ 89. C3
        sub     esp, 12                                 ; 03DD _ 83. EC, 0C
        push    mouseinfo                               ; 03E0 _ 68, 00000008(d)
        call    fifo8_status                            ; 03E5 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03EA _ 83. C4, 10
        add     ebx, eax                                ; 03ED _ 01. C3
        sub     esp, 12                                 ; 03EF _ 83. EC, 0C
        push    timerfifo1                              ; 03F2 _ 68, 00000218(d)
        call    fifo8_status                            ; 03F7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03FC _ 83. C4, 10
        add     eax, ebx                                ; 03FF _ 01. D8
        test    eax, eax                                ; 0401 _ 85. C0
        jnz     ?_002                                   ; 0403 _ 75, 0A
        call    io_sti                                  ; 0405 _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 040A _ E9, FFFFFF66
; CMain End of function

?_002:  ; Local function
        sub     esp, 12                                 ; 040F _ 83. EC, 0C
        push    keyinfo                                 ; 0412 _ 68, 00000020(d)
        call    fifo8_status                            ; 0417 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 041C _ 83. C4, 10
        test    eax, eax                                ; 041F _ 85. C0
        jz      ?_003                                   ; 0421 _ 74, 77
        call    io_sti                                  ; 0423 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 0428 _ 83. EC, 0C
        push    keyinfo                                 ; 042B _ 68, 00000020(d)
        call    fifo8_get                               ; 0430 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0435 _ 83. C4, 10
        mov     dword [ebp-14H], eax                    ; 0438 _ 89. 45, EC
        cmp     dword [ebp-14H], 28                     ; 043B _ 83. 7D, EC, 1C
        jne     ?_001                                   ; 043F _ 0F 85, FFFFFF30
        mov     ebx, dword [xsize]                      ; 0445 _ 8B. 1D, 00000200(d)
        mov     ecx, dword [buf_back]                   ; 044B _ 8B. 0D, 000000F8(d)
        mov     edx, dword [ebp-38H]                    ; 0451 _ 8B. 55, C8
        mov     eax, edx                                ; 0454 _ 89. D0
        shl     eax, 2                                  ; 0456 _ C1. E0, 02
        add     eax, edx                                ; 0459 _ 01. D0
        shl     eax, 2                                  ; 045B _ C1. E0, 02
        mov     edx, eax                                ; 045E _ 89. C2
        mov     eax, dword [ebp-20H]                    ; 0460 _ 8B. 45, E0
        add     eax, edx                                ; 0463 _ 01. D0
        sub     esp, 4                                  ; 0465 _ 83. EC, 04
        push    7                                       ; 0468 _ 6A, 07
        push    ebx                                     ; 046A _ 53
        push    dword [ebp-38H]                         ; 046B _ FF. 75, C8
        push    ecx                                     ; 046E _ 51
        push    eax                                     ; 046F _ 50
        push    dword [ebp-2CH]                         ; 0470 _ FF. 75, D4
        push    dword [ebp-1CH]                         ; 0473 _ FF. 75, E4
        call    showMemoryInfo                          ; 0476 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 047B _ 83. C4, 20
        add     dword [ebp-38H], 1                      ; 047E _ 83. 45, C8, 01
        mov     eax, dword [ebp-38H]                    ; 0482 _ 8B. 45, C8
        cmp     eax, dword [ebp-24H]                    ; 0485 _ 3B. 45, DC
        jle     ?_001                                   ; 0488 _ 0F 8E, FFFFFEE7
        mov     dword [ebp-38H], 0                      ; 048E _ C7. 45, C8, 00000000
        jmp     ?_001                                   ; 0495 _ E9, FFFFFEDB

?_003:  ; Local function
        sub     esp, 12                                 ; 049A _ 83. EC, 0C
        push    mouseinfo                               ; 049D _ 68, 00000008(d)
        call    fifo8_status                            ; 04A2 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 04A7 _ 83. C4, 10
        test    eax, eax                                ; 04AA _ 85. C0
        jz      ?_004                                   ; 04AC _ 74, 19
        sub     esp, 4                                  ; 04AE _ 83. EC, 04
        push    dword [ebp-28H]                         ; 04B1 _ FF. 75, D8
        push    dword [ebp-2CH]                         ; 04B4 _ FF. 75, D4
        push    dword [ebp-1CH]                         ; 04B7 _ FF. 75, E4
        call    show_mouse_info                         ; 04BA _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 04BF _ 83. C4, 10
        jmp     ?_001                                   ; 04C2 _ E9, FFFFFEAE

?_004:  ; Local function
        sub     esp, 12                                 ; 04C7 _ 83. EC, 0C
        push    timerfifo1                              ; 04CA _ 68, 00000218(d)
        call    fifo8_status                            ; 04CF _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 04D4 _ 83. C4, 10
        test    eax, eax                                ; 04D7 _ 85. C0
        je      ?_001                                   ; 04D9 _ 0F 84, FFFFFE96
        call    io_sti                                  ; 04DF _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 04E4 _ 83. EC, 0C
        push    timerfifo1                              ; 04E7 _ 68, 00000218(d)
        call    fifo8_get                               ; 04EC _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 04F1 _ 83. C4, 10
        mov     dword [timerID.1718], eax               ; 04F4 _ A3, 00000278(d)
        mov     eax, dword [timerID.1718]               ; 04F9 _ A1, 00000278(d)
        cmp     eax, 10                                 ; 04FE _ 83. F8, 0A
        jnz     ?_005                                   ; 0501 _ 75, 21
        sub     esp, 8                                  ; 0503 _ 83. EC, 08
        push    ?_157                                   ; 0506 _ 68, 00000009(d)
        push    7                                       ; 050B _ 6A, 07
        push    32                                      ; 050D _ 6A, 20
        push    0                                       ; 050F _ 6A, 00
        push    dword [ebp-2CH]                         ; 0511 _ FF. 75, D4
        push    dword [ebp-1CH]                         ; 0514 _ FF. 75, E4
        call    showString                              ; 0517 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 051C _ 83. C4, 20
        jmp     ?_008                                   ; 051F _ E9, 000000AF

?_005:  mov     eax, dword [timerID.1718]               ; 0524 _ A1, 00000278(d)
        cmp     eax, 2                                  ; 0529 _ 83. F8, 02
        jnz     ?_006                                   ; 052C _ 75, 21
        sub     esp, 8                                  ; 052E _ 83. EC, 08
        push    ?_158                                   ; 0531 _ 68, 00000014(d)
        push    7                                       ; 0536 _ 6A, 07
        push    16                                      ; 0538 _ 6A, 10
        push    0                                       ; 053A _ 6A, 00
        push    dword [ebp-2CH]                         ; 053C _ FF. 75, D4
        push    dword [ebp-1CH]                         ; 053F _ FF. 75, E4
        call    showString                              ; 0542 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0547 _ 83. C4, 20
        jmp     ?_008                                   ; 054A _ E9, 00000084

?_006:  mov     eax, dword [timerID.1718]               ; 054F _ A1, 00000278(d)
        cmp     eax, 1                                  ; 0554 _ 83. F8, 01
        jnz     ?_007                                   ; 0557 _ 75, 3E
        mov     edx, dword [timer3]                     ; 0559 _ 8B. 15, 00000214(d)
        mov     eax, dword [timerctl]                   ; 055F _ A1, 00000208(d)
        sub     esp, 4                                  ; 0564 _ 83. EC, 04
        push    0                                       ; 0567 _ 6A, 00
        push    edx                                     ; 0569 _ 52
        push    eax                                     ; 056A _ 50
        call    timer_setdata                           ; 056B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0570 _ 83. C4, 10
        mov     edx, dword [xsize]                      ; 0573 _ 8B. 15, 00000200(d)
        mov     eax, dword [buf_back]                   ; 0579 _ A1, 000000F8(d)
        sub     esp, 4                                  ; 057E _ 83. EC, 04
        push    111                                     ; 0581 _ 6A, 6F
        push    15                                      ; 0583 _ 6A, 0F
        push    96                                      ; 0585 _ 6A, 60
        push    8                                       ; 0587 _ 6A, 08
        push    7                                       ; 0589 _ 6A, 07
        push    edx                                     ; 058B _ 52
        push    eax                                     ; 058C _ 50
        call    boxfill8                                ; 058D _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0592 _ 83. C4, 20
        jmp     ?_008                                   ; 0595 _ EB, 3C

?_007:  mov     edx, dword [timer3]                     ; 0597 _ 8B. 15, 00000214(d)
        mov     eax, dword [timerctl]                   ; 059D _ A1, 00000208(d)
        sub     esp, 4                                  ; 05A2 _ 83. EC, 04
        push    1                                       ; 05A5 _ 6A, 01
        push    edx                                     ; 05A7 _ 52
        push    eax                                     ; 05A8 _ 50
        call    timer_setdata                           ; 05A9 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 05AE _ 83. C4, 10
        mov     edx, dword [xsize]                      ; 05B1 _ 8B. 15, 00000200(d)
        mov     eax, dword [buf_back]                   ; 05B7 _ A1, 000000F8(d)
        sub     esp, 4                                  ; 05BC _ 83. EC, 04
        push    111                                     ; 05BF _ 6A, 6F
        push    15                                      ; 05C1 _ 6A, 0F
        push    96                                      ; 05C3 _ 6A, 60
        push    8                                       ; 05C5 _ 6A, 08
        push    14                                      ; 05C7 _ 6A, 0E
        push    edx                                     ; 05C9 _ 52
        push    eax                                     ; 05CA _ 50
        call    boxfill8                                ; 05CB _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 05D0 _ 83. C4, 20
?_008:  mov     eax, dword [timerID.1718]               ; 05D3 _ A1, 00000278(d)
        cmp     eax, 1                                  ; 05D8 _ 83. F8, 01
        jz      ?_009                                   ; 05DB _ 74, 0D
        mov     eax, dword [timerID.1718]               ; 05DD _ A1, 00000278(d)
        test    eax, eax                                ; 05E2 _ 85. C0
        jne     ?_001                                   ; 05E4 _ 0F 85, FFFFFD8B
?_009:  mov     edx, dword [timer3]                     ; 05EA _ 8B. 15, 00000214(d)
        mov     eax, dword [timerctl]                   ; 05F0 _ A1, 00000208(d)
        sub     esp, 4                                  ; 05F5 _ 83. EC, 04
        push    50                                      ; 05F8 _ 6A, 32
        push    edx                                     ; 05FA _ 52
        push    eax                                     ; 05FB _ 50
        call    timer_settime                           ; 05FC _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0601 _ 83. C4, 10
        sub     esp, 8                                  ; 0604 _ 83. EC, 08
        push    112                                     ; 0607 _ 6A, 70
        push    16                                      ; 0609 _ 6A, 10
        push    96                                      ; 060B _ 6A, 60
        push    8                                       ; 060D _ 6A, 08
        push    dword [ebp-2CH]                         ; 060F _ FF. 75, D4
        push    dword [ebp-1CH]                         ; 0612 _ FF. 75, E4
        call    sheet_refresh                           ; 0615 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 061A _ 83. C4, 20
        jmp     ?_001                                   ; 061D _ E9, FFFFFD53

initBootInfo:; Function begin
        push    ebp                                     ; 0622 _ 55
        mov     ebp, esp                                ; 0623 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 0625 _ 8B. 45, 08
        mov     dword [eax], 655360                     ; 0628 _ C7. 00, 000A0000
        mov     eax, dword [ebp+8H]                     ; 062E _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 320                      ; 0631 _ 66: C7. 40, 04, 0140
        mov     eax, dword [ebp+8H]                     ; 0637 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 200                      ; 063A _ 66: C7. 40, 06, 00C8
        nop                                             ; 0640 _ 90
        pop     ebp                                     ; 0641 _ 5D
        ret                                             ; 0642 _ C3
; initBootInfo End of function

init_palette:; Function begin
        push    ebp                                     ; 0643 _ 55
        mov     ebp, esp                                ; 0644 _ 89. E5
        sub     esp, 8                                  ; 0646 _ 83. EC, 08
        sub     esp, 4                                  ; 0649 _ 83. EC, 04
        push    table_rgb.1727                          ; 064C _ 68, 00000020(d)
        push    15                                      ; 0651 _ 6A, 0F
        push    0                                       ; 0653 _ 6A, 00
        call    set_palette                             ; 0655 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 065A _ 83. C4, 10
        nop                                             ; 065D _ 90
        leave                                           ; 065E _ C9
        ret                                             ; 065F _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 0660 _ 55
        mov     ebp, esp                                ; 0661 _ 89. E5
        sub     esp, 24                                 ; 0663 _ 83. EC, 18
        call    io_load_eflags                          ; 0666 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 066B _ 89. 45, F4
        call    io_cli                                  ; 066E _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0673 _ 83. EC, 08
        push    dword [ebp+8H]                          ; 0676 _ FF. 75, 08
        push    968                                     ; 0679 _ 68, 000003C8
        call    io_out8                                 ; 067E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0683 _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 0686 _ 8B. 45, 08
        mov     dword [ebp-10H], eax                    ; 0689 _ 89. 45, F0
        jmp     ?_011                                   ; 068C _ EB, 65

?_010:  mov     eax, dword [ebp+10H]                    ; 068E _ 8B. 45, 10
        movzx   eax, byte [eax]                         ; 0691 _ 0F B6. 00
        shr     al, 2                                   ; 0694 _ C0. E8, 02
        movzx   eax, al                                 ; 0697 _ 0F B6. C0
        sub     esp, 8                                  ; 069A _ 83. EC, 08
        push    eax                                     ; 069D _ 50
        push    969                                     ; 069E _ 68, 000003C9
        call    io_out8                                 ; 06A3 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 06A8 _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 06AB _ 8B. 45, 10
        add     eax, 1                                  ; 06AE _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 06B1 _ 0F B6. 00
        shr     al, 2                                   ; 06B4 _ C0. E8, 02
        movzx   eax, al                                 ; 06B7 _ 0F B6. C0
        sub     esp, 8                                  ; 06BA _ 83. EC, 08
        push    eax                                     ; 06BD _ 50
        push    969                                     ; 06BE _ 68, 000003C9
        call    io_out8                                 ; 06C3 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 06C8 _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 06CB _ 8B. 45, 10
        add     eax, 2                                  ; 06CE _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 06D1 _ 0F B6. 00
        shr     al, 2                                   ; 06D4 _ C0. E8, 02
        movzx   eax, al                                 ; 06D7 _ 0F B6. C0
        sub     esp, 8                                  ; 06DA _ 83. EC, 08
        push    eax                                     ; 06DD _ 50
        push    969                                     ; 06DE _ 68, 000003C9
        call    io_out8                                 ; 06E3 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 06E8 _ 83. C4, 10
        add     dword [ebp+10H], 3                      ; 06EB _ 83. 45, 10, 03
        add     dword [ebp-10H], 1                      ; 06EF _ 83. 45, F0, 01
?_011:  mov     eax, dword [ebp-10H]                    ; 06F3 _ 8B. 45, F0
        cmp     eax, dword [ebp+0CH]                    ; 06F6 _ 3B. 45, 0C
        jle     ?_010                                   ; 06F9 _ 7E, 93
        sub     esp, 12                                 ; 06FB _ 83. EC, 0C
        push    dword [ebp-0CH]                         ; 06FE _ FF. 75, F4
        call    io_store_eflags                         ; 0701 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0706 _ 83. C4, 10
        nop                                             ; 0709 _ 90
        leave                                           ; 070A _ C9
        ret                                             ; 070B _ C3
; set_palette End of function

boxfill8:; Function begin
        push    ebp                                     ; 070C _ 55
        mov     ebp, esp                                ; 070D _ 89. E5
        sub     esp, 20                                 ; 070F _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 0712 _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 0715 _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 0718 _ 8B. 45, 18
        mov     dword [ebp-4H], eax                     ; 071B _ 89. 45, FC
        jmp     ?_015                                   ; 071E _ EB, 33

?_012:  mov     eax, dword [ebp+14H]                    ; 0720 _ 8B. 45, 14
        mov     dword [ebp-8H], eax                     ; 0723 _ 89. 45, F8
        jmp     ?_014                                   ; 0726 _ EB, 1F

?_013:  mov     eax, dword [ebp-4H]                     ; 0728 _ 8B. 45, FC
        imul    eax, dword [ebp+0CH]                    ; 072B _ 0F AF. 45, 0C
        mov     edx, eax                                ; 072F _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0731 _ 8B. 45, F8
        add     eax, edx                                ; 0734 _ 01. D0
        mov     edx, eax                                ; 0736 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0738 _ 8B. 45, 08
        add     edx, eax                                ; 073B _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 073D _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0741 _ 88. 02
        add     dword [ebp-8H], 1                       ; 0743 _ 83. 45, F8, 01
?_014:  mov     eax, dword [ebp-8H]                     ; 0747 _ 8B. 45, F8
        cmp     eax, dword [ebp+1CH]                    ; 074A _ 3B. 45, 1C
        jle     ?_013                                   ; 074D _ 7E, D9
        add     dword [ebp-4H], 1                       ; 074F _ 83. 45, FC, 01
?_015:  mov     eax, dword [ebp-4H]                     ; 0753 _ 8B. 45, FC
        cmp     eax, dword [ebp+20H]                    ; 0756 _ 3B. 45, 20
        jle     ?_012                                   ; 0759 _ 7E, C5
        nop                                             ; 075B _ 90
        leave                                           ; 075C _ C9
        ret                                             ; 075D _ C3
; boxfill8 End of function

showString:; Function begin
        push    ebp                                     ; 075E _ 55
        mov     ebp, esp                                ; 075F _ 89. E5
        push    ebx                                     ; 0761 _ 53
        sub     esp, 36                                 ; 0762 _ 83. EC, 24
        mov     eax, dword [ebp+18H]                    ; 0765 _ 8B. 45, 18
        mov     byte [ebp-1CH], al                      ; 0768 _ 88. 45, E4
        mov     eax, dword [ebp+10H]                    ; 076B _ 8B. 45, 10
        mov     dword [ebp-0CH], eax                    ; 076E _ 89. 45, F4
        jmp     ?_017                                   ; 0771 _ EB, 3E

?_016:  mov     eax, dword [ebp+1CH]                    ; 0773 _ 8B. 45, 1C
        movzx   eax, byte [eax]                         ; 0776 _ 0F B6. 00
        movzx   eax, al                                 ; 0779 _ 0F B6. C0
        shl     eax, 4                                  ; 077C _ C1. E0, 04
        lea     ebx, [systemFont+eax]                   ; 077F _ 8D. 98, 00000000(d)
        movsx   ecx, byte [ebp-1CH]                     ; 0785 _ 0F BE. 4D, E4
        mov     eax, dword [ebp+0CH]                    ; 0789 _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 078C _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 078F _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 0792 _ 8B. 00
        sub     esp, 8                                  ; 0794 _ 83. EC, 08
        push    ebx                                     ; 0797 _ 53
        push    ecx                                     ; 0798 _ 51
        push    dword [ebp+14H]                         ; 0799 _ FF. 75, 14
        push    dword [ebp+10H]                         ; 079C _ FF. 75, 10
        push    edx                                     ; 079F _ 52
        push    eax                                     ; 07A0 _ 50
        call    showChar8                               ; 07A1 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 07A6 _ 83. C4, 20
        add     dword [ebp+1CH], 1                      ; 07A9 _ 83. 45, 1C, 01
        add     dword [ebp+10H], 8                      ; 07AD _ 83. 45, 10, 08
?_017:  mov     eax, dword [ebp+1CH]                    ; 07B1 _ 8B. 45, 1C
        movzx   eax, byte [eax]                         ; 07B4 _ 0F B6. 00
        test    al, al                                  ; 07B7 _ 84. C0
        jnz     ?_016                                   ; 07B9 _ 75, B8
        mov     eax, dword [ebp+14H]                    ; 07BB _ 8B. 45, 14
        add     eax, 16                                 ; 07BE _ 83. C0, 10
        sub     esp, 8                                  ; 07C1 _ 83. EC, 08
        push    eax                                     ; 07C4 _ 50
        push    dword [ebp+10H]                         ; 07C5 _ FF. 75, 10
        push    dword [ebp+14H]                         ; 07C8 _ FF. 75, 14
        push    dword [ebp-0CH]                         ; 07CB _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 07CE _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 07D1 _ FF. 75, 08
        call    sheet_refresh                           ; 07D4 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 07D9 _ 83. C4, 20
        nop                                             ; 07DC _ 90
        mov     ebx, dword [ebp-4H]                     ; 07DD _ 8B. 5D, FC
        leave                                           ; 07E0 _ C9
        ret                                             ; 07E1 _ C3
; showString End of function

showChar8:; Function begin
        push    ebp                                     ; 07E2 _ 55
        mov     ebp, esp                                ; 07E3 _ 89. E5
        sub     esp, 20                                 ; 07E5 _ 83. EC, 14
        mov     eax, dword [ebp+18H]                    ; 07E8 _ 8B. 45, 18
        mov     byte [ebp-14H], al                      ; 07EB _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 07EE _ C7. 45, FC, 00000000
        jmp     ?_027                                   ; 07F5 _ E9, 0000016C

?_018:  mov     edx, dword [ebp-4H]                     ; 07FA _ 8B. 55, FC
        mov     eax, dword [ebp+1CH]                    ; 07FD _ 8B. 45, 1C
        add     eax, edx                                ; 0800 _ 01. D0
        movzx   eax, byte [eax]                         ; 0802 _ 0F B6. 00
        mov     byte [ebp-5H], al                       ; 0805 _ 88. 45, FB
        cmp     byte [ebp-5H], 0                        ; 0808 _ 80. 7D, FB, 00
        jns     ?_019                                   ; 080C _ 79, 20
        mov     edx, dword [ebp+14H]                    ; 080E _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0811 _ 8B. 45, FC
        add     eax, edx                                ; 0814 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0816 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 081A _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 081C _ 8B. 45, 10
        add     eax, edx                                ; 081F _ 01. D0
        mov     edx, eax                                ; 0821 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0823 _ 8B. 45, 08
        add     edx, eax                                ; 0826 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0828 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 082C _ 88. 02
?_019:  movsx   eax, byte [ebp-5H]                      ; 082E _ 0F BE. 45, FB
        and     eax, 40H                                ; 0832 _ 83. E0, 40
        test    eax, eax                                ; 0835 _ 85. C0
        jz      ?_020                                   ; 0837 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 0839 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 083C _ 8B. 45, FC
        add     eax, edx                                ; 083F _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0841 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0845 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0847 _ 8B. 45, 10
        add     eax, edx                                ; 084A _ 01. D0
        lea     edx, [eax+1H]                           ; 084C _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 084F _ 8B. 45, 08
        add     edx, eax                                ; 0852 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0854 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0858 _ 88. 02
?_020:  movsx   eax, byte [ebp-5H]                      ; 085A _ 0F BE. 45, FB
        and     eax, 20H                                ; 085E _ 83. E0, 20
        test    eax, eax                                ; 0861 _ 85. C0
        jz      ?_021                                   ; 0863 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 0865 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0868 _ 8B. 45, FC
        add     eax, edx                                ; 086B _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 086D _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0871 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0873 _ 8B. 45, 10
        add     eax, edx                                ; 0876 _ 01. D0
        lea     edx, [eax+2H]                           ; 0878 _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 087B _ 8B. 45, 08
        add     edx, eax                                ; 087E _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0880 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0884 _ 88. 02
?_021:  movsx   eax, byte [ebp-5H]                      ; 0886 _ 0F BE. 45, FB
        and     eax, 10H                                ; 088A _ 83. E0, 10
        test    eax, eax                                ; 088D _ 85. C0
        jz      ?_022                                   ; 088F _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 0891 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0894 _ 8B. 45, FC
        add     eax, edx                                ; 0897 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0899 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 089D _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 089F _ 8B. 45, 10
        add     eax, edx                                ; 08A2 _ 01. D0
        lea     edx, [eax+3H]                           ; 08A4 _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 08A7 _ 8B. 45, 08
        add     edx, eax                                ; 08AA _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 08AC _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 08B0 _ 88. 02
?_022:  movsx   eax, byte [ebp-5H]                      ; 08B2 _ 0F BE. 45, FB
        and     eax, 08H                                ; 08B6 _ 83. E0, 08
        test    eax, eax                                ; 08B9 _ 85. C0
        jz      ?_023                                   ; 08BB _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 08BD _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 08C0 _ 8B. 45, FC
        add     eax, edx                                ; 08C3 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 08C5 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 08C9 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 08CB _ 8B. 45, 10
        add     eax, edx                                ; 08CE _ 01. D0
        lea     edx, [eax+4H]                           ; 08D0 _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 08D3 _ 8B. 45, 08
        add     edx, eax                                ; 08D6 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 08D8 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 08DC _ 88. 02
?_023:  movsx   eax, byte [ebp-5H]                      ; 08DE _ 0F BE. 45, FB
        and     eax, 04H                                ; 08E2 _ 83. E0, 04
        test    eax, eax                                ; 08E5 _ 85. C0
        jz      ?_024                                   ; 08E7 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 08E9 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 08EC _ 8B. 45, FC
        add     eax, edx                                ; 08EF _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 08F1 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 08F5 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 08F7 _ 8B. 45, 10
        add     eax, edx                                ; 08FA _ 01. D0
        lea     edx, [eax+5H]                           ; 08FC _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 08FF _ 8B. 45, 08
        add     edx, eax                                ; 0902 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0904 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0908 _ 88. 02
?_024:  movsx   eax, byte [ebp-5H]                      ; 090A _ 0F BE. 45, FB
        and     eax, 02H                                ; 090E _ 83. E0, 02
        test    eax, eax                                ; 0911 _ 85. C0
        jz      ?_025                                   ; 0913 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 0915 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0918 _ 8B. 45, FC
        add     eax, edx                                ; 091B _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 091D _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0921 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0923 _ 8B. 45, 10
        add     eax, edx                                ; 0926 _ 01. D0
        lea     edx, [eax+6H]                           ; 0928 _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 092B _ 8B. 45, 08
        add     edx, eax                                ; 092E _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0930 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0934 _ 88. 02
?_025:  movsx   eax, byte [ebp-5H]                      ; 0936 _ 0F BE. 45, FB
        and     eax, 01H                                ; 093A _ 83. E0, 01
        test    eax, eax                                ; 093D _ 85. C0
        jz      ?_026                                   ; 093F _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 0941 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0944 _ 8B. 45, FC
        add     eax, edx                                ; 0947 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0949 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 094D _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 094F _ 8B. 45, 10
        add     eax, edx                                ; 0952 _ 01. D0
        lea     edx, [eax+7H]                           ; 0954 _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 0957 _ 8B. 45, 08
        add     edx, eax                                ; 095A _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 095C _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0960 _ 88. 02
?_026:  add     dword [ebp-4H], 1                       ; 0962 _ 83. 45, FC, 01
?_027:  cmp     dword [ebp-4H], 15                      ; 0966 _ 83. 7D, FC, 0F
        jle     ?_018                                   ; 096A _ 0F 8E, FFFFFE8A
        nop                                             ; 0970 _ 90
        leave                                           ; 0971 _ C9
        ret                                             ; 0972 _ C3
; showChar8 End of function

init_mouse_cursor:; Function begin
        push    ebp                                     ; 0973 _ 55
        mov     ebp, esp                                ; 0974 _ 89. E5
        sub     esp, 20                                 ; 0976 _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 0979 _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 097C _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 097F _ C7. 45, FC, 00000000
        jmp     ?_034                                   ; 0986 _ E9, 000000B5

?_028:  mov     dword [ebp-8H], 0                       ; 098B _ C7. 45, F8, 00000000
        jmp     ?_033                                   ; 0992 _ E9, 0000009B

?_029:  mov     eax, dword [ebp-4H]                     ; 0997 _ 8B. 45, FC
        shl     eax, 4                                  ; 099A _ C1. E0, 04
        mov     edx, eax                                ; 099D _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 099F _ 8B. 45, F8
        add     eax, edx                                ; 09A2 _ 01. D0
        add     eax, cursor.1784                        ; 09A4 _ 05, 00000060(d)
        movzx   eax, byte [eax]                         ; 09A9 _ 0F B6. 00
        cmp     al, 42                                  ; 09AC _ 3C, 2A
        jnz     ?_030                                   ; 09AE _ 75, 19
        mov     eax, dword [ebp-4H]                     ; 09B0 _ 8B. 45, FC
        shl     eax, 4                                  ; 09B3 _ C1. E0, 04
        mov     edx, eax                                ; 09B6 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 09B8 _ 8B. 45, F8
        add     eax, edx                                ; 09BB _ 01. D0
        mov     edx, eax                                ; 09BD _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 09BF _ 8B. 45, 08
        add     eax, edx                                ; 09C2 _ 01. D0
        mov     byte [eax], 0                           ; 09C4 _ C6. 00, 00
        jmp     ?_032                                   ; 09C7 _ EB, 65

?_030:  mov     eax, dword [ebp-4H]                     ; 09C9 _ 8B. 45, FC
        shl     eax, 4                                  ; 09CC _ C1. E0, 04
        mov     edx, eax                                ; 09CF _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 09D1 _ 8B. 45, F8
        add     eax, edx                                ; 09D4 _ 01. D0
        add     eax, cursor.1784                        ; 09D6 _ 05, 00000060(d)
        movzx   eax, byte [eax]                         ; 09DB _ 0F B6. 00
        cmp     al, 79                                  ; 09DE _ 3C, 4F
        jnz     ?_031                                   ; 09E0 _ 75, 19
        mov     eax, dword [ebp-4H]                     ; 09E2 _ 8B. 45, FC
        shl     eax, 4                                  ; 09E5 _ C1. E0, 04
        mov     edx, eax                                ; 09E8 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 09EA _ 8B. 45, F8
        add     eax, edx                                ; 09ED _ 01. D0
        mov     edx, eax                                ; 09EF _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 09F1 _ 8B. 45, 08
        add     eax, edx                                ; 09F4 _ 01. D0
        mov     byte [eax], 7                           ; 09F6 _ C6. 00, 07
        jmp     ?_032                                   ; 09F9 _ EB, 33

?_031:  mov     eax, dword [ebp-4H]                     ; 09FB _ 8B. 45, FC
        shl     eax, 4                                  ; 09FE _ C1. E0, 04
        mov     edx, eax                                ; 0A01 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0A03 _ 8B. 45, F8
        add     eax, edx                                ; 0A06 _ 01. D0
        add     eax, cursor.1784                        ; 0A08 _ 05, 00000060(d)
        movzx   eax, byte [eax]                         ; 0A0D _ 0F B6. 00
        cmp     al, 46                                  ; 0A10 _ 3C, 2E
        jnz     ?_032                                   ; 0A12 _ 75, 1A
        mov     eax, dword [ebp-4H]                     ; 0A14 _ 8B. 45, FC
        shl     eax, 4                                  ; 0A17 _ C1. E0, 04
        mov     edx, eax                                ; 0A1A _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0A1C _ 8B. 45, F8
        add     eax, edx                                ; 0A1F _ 01. D0
        mov     edx, eax                                ; 0A21 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0A23 _ 8B. 45, 08
        add     edx, eax                                ; 0A26 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0A28 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0A2C _ 88. 02
?_032:  add     dword [ebp-8H], 1                       ; 0A2E _ 83. 45, F8, 01
?_033:  cmp     dword [ebp-8H], 15                      ; 0A32 _ 83. 7D, F8, 0F
        jle     ?_029                                   ; 0A36 _ 0F 8E, FFFFFF5B
        add     dword [ebp-4H], 1                       ; 0A3C _ 83. 45, FC, 01
?_034:  cmp     dword [ebp-4H], 15                      ; 0A40 _ 83. 7D, FC, 0F
        jle     ?_028                                   ; 0A44 _ 0F 8E, FFFFFF41
        nop                                             ; 0A4A _ 90
        leave                                           ; 0A4B _ C9
        ret                                             ; 0A4C _ C3
; init_mouse_cursor End of function

putblock:; Function begin
        push    ebp                                     ; 0A4D _ 55
        mov     ebp, esp                                ; 0A4E _ 89. E5
        push    ebx                                     ; 0A50 _ 53
        sub     esp, 16                                 ; 0A51 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 0A54 _ C7. 45, F8, 00000000
        jmp     ?_038                                   ; 0A5B _ EB, 50

?_035:  mov     dword [ebp-0CH], 0                      ; 0A5D _ C7. 45, F4, 00000000
        jmp     ?_037                                   ; 0A64 _ EB, 3B

?_036:  mov     eax, dword [ebp-8H]                     ; 0A66 _ 8B. 45, F8
        imul    eax, dword [ebp+24H]                    ; 0A69 _ 0F AF. 45, 24
        mov     edx, eax                                ; 0A6D _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 0A6F _ 8B. 45, F4
        add     eax, edx                                ; 0A72 _ 01. D0
        mov     edx, eax                                ; 0A74 _ 89. C2
        mov     eax, dword [ebp+20H]                    ; 0A76 _ 8B. 45, 20
        add     eax, edx                                ; 0A79 _ 01. D0
        mov     ecx, dword [ebp+1CH]                    ; 0A7B _ 8B. 4D, 1C
        mov     edx, dword [ebp-8H]                     ; 0A7E _ 8B. 55, F8
        add     edx, ecx                                ; 0A81 _ 01. CA
        imul    edx, dword [ebp+0CH]                    ; 0A83 _ 0F AF. 55, 0C
        mov     ebx, dword [ebp+18H]                    ; 0A87 _ 8B. 5D, 18
        mov     ecx, dword [ebp-0CH]                    ; 0A8A _ 8B. 4D, F4
        add     ecx, ebx                                ; 0A8D _ 01. D9
        add     edx, ecx                                ; 0A8F _ 01. CA
        mov     ecx, edx                                ; 0A91 _ 89. D1
        mov     edx, dword [ebp+8H]                     ; 0A93 _ 8B. 55, 08
        add     edx, ecx                                ; 0A96 _ 01. CA
        movzx   eax, byte [eax]                         ; 0A98 _ 0F B6. 00
        mov     byte [edx], al                          ; 0A9B _ 88. 02
        add     dword [ebp-0CH], 1                      ; 0A9D _ 83. 45, F4, 01
?_037:  mov     eax, dword [ebp-0CH]                    ; 0AA1 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 0AA4 _ 3B. 45, 10
        jl      ?_036                                   ; 0AA7 _ 7C, BD
        add     dword [ebp-8H], 1                       ; 0AA9 _ 83. 45, F8, 01
?_038:  mov     eax, dword [ebp-8H]                     ; 0AAD _ 8B. 45, F8
        cmp     eax, dword [ebp+14H]                    ; 0AB0 _ 3B. 45, 14
        jl      ?_035                                   ; 0AB3 _ 7C, A8
        nop                                             ; 0AB5 _ 90
        add     esp, 16                                 ; 0AB6 _ 83. C4, 10
        pop     ebx                                     ; 0AB9 _ 5B
        pop     ebp                                     ; 0ABA _ 5D
        ret                                             ; 0ABB _ C3
; putblock End of function

intHandlerFromC:; Function begin
        push    ebp                                     ; 0ABC _ 55
        mov     ebp, esp                                ; 0ABD _ 89. E5
        sub     esp, 24                                 ; 0ABF _ 83. EC, 18
        mov     eax, dword [bootInfo]                   ; 0AC2 _ A1, 00000000(d)
        mov     dword [ebp-14H], eax                    ; 0AC7 _ 89. 45, EC
        movzx   eax, word [?_170]                       ; 0ACA _ 0F B7. 05, 00000004(d)
        cwde                                            ; 0AD1 _ 98
        mov     dword [ebp-10H], eax                    ; 0AD2 _ 89. 45, F0
        movzx   eax, word [?_171]                       ; 0AD5 _ 0F B7. 05, 00000006(d)
        cwde                                            ; 0ADC _ 98
        mov     dword [ebp-0CH], eax                    ; 0ADD _ 89. 45, F4
        sub     esp, 8                                  ; 0AE0 _ 83. EC, 08
        push    32                                      ; 0AE3 _ 6A, 20
        push    32                                      ; 0AE5 _ 6A, 20
        call    io_out8                                 ; 0AE7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0AEC _ 83. C4, 10
        mov     byte [ebp-15H], 0                       ; 0AEF _ C6. 45, EB, 00
        sub     esp, 12                                 ; 0AF3 _ 83. EC, 0C
        push    96                                      ; 0AF6 _ 6A, 60
        call    io_in8                                  ; 0AF8 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0AFD _ 83. C4, 10
        mov     byte [ebp-15H], al                      ; 0B00 _ 88. 45, EB
        movzx   eax, byte [ebp-15H]                     ; 0B03 _ 0F B6. 45, EB
        sub     esp, 8                                  ; 0B07 _ 83. EC, 08
        push    eax                                     ; 0B0A _ 50
        push    keyinfo                                 ; 0B0B _ 68, 00000020(d)
        call    fifo8_put                               ; 0B10 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0B15 _ 83. C4, 10
        nop                                             ; 0B18 _ 90
        leave                                           ; 0B19 _ C9
        ret                                             ; 0B1A _ C3
; intHandlerFromC End of function

charToHexVal:; Function begin
        push    ebp                                     ; 0B1B _ 55
        mov     ebp, esp                                ; 0B1C _ 89. E5
        sub     esp, 4                                  ; 0B1E _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 0B21 _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 0B24 _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 0B27 _ 80. 7D, FC, 09
        jle     ?_039                                   ; 0B2B _ 7E, 09
        movzx   eax, byte [ebp-4H]                      ; 0B2D _ 0F B6. 45, FC
        add     eax, 55                                 ; 0B31 _ 83. C0, 37
        jmp     ?_040                                   ; 0B34 _ EB, 07

?_039:  movzx   eax, byte [ebp-4H]                      ; 0B36 _ 0F B6. 45, FC
        add     eax, 48                                 ; 0B3A _ 83. C0, 30
?_040:  leave                                           ; 0B3D _ C9
        ret                                             ; 0B3E _ C3
; charToHexVal End of function

charToHexStr:; Function begin
        push    ebp                                     ; 0B3F _ 55
        mov     ebp, esp                                ; 0B40 _ 89. E5
        sub     esp, 20                                 ; 0B42 _ 83. EC, 14
        mov     eax, dword [ebp+8H]                     ; 0B45 _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 0B48 _ 88. 45, EC
        movzx   eax, byte [ebp-14H]                     ; 0B4B _ 0F B6. 45, EC
        and     eax, 0FH                                ; 0B4F _ 83. E0, 0F
        mov     byte [ebp-1H], al                       ; 0B52 _ 88. 45, FF
        movsx   eax, byte [ebp-1H]                      ; 0B55 _ 0F BE. 45, FF
        push    eax                                     ; 0B59 _ 50
        call    charToHexVal                            ; 0B5A _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 0B5F _ 83. C4, 04
        mov     byte [?_169], al                        ; 0B62 _ A2, 00000003(d)
        shr     byte [ebp-14H], 4                       ; 0B67 _ C0. 6D, EC, 04
        movzx   eax, byte [ebp-14H]                     ; 0B6B _ 0F B6. 45, EC
        movsx   eax, al                                 ; 0B6F _ 0F BE. C0
        push    eax                                     ; 0B72 _ 50
        call    charToHexVal                            ; 0B73 _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 0B78 _ 83. C4, 04
        mov     byte [?_168], al                        ; 0B7B _ A2, 00000002(d)
        mov     eax, keyval                             ; 0B80 _ B8, 00000000(d)
        leave                                           ; 0B85 _ C9
        ret                                             ; 0B86 _ C3
; charToHexStr End of function

intToHexStr:; Function begin
        push    ebp                                     ; 0B87 _ 55
        mov     ebp, esp                                ; 0B88 _ 89. E5
        sub     esp, 16                                 ; 0B8A _ 83. EC, 10
        mov     byte [str.1828], 48                     ; 0B8D _ C6. 05, 0000027C(d), 30
        mov     byte [?_172], 88                        ; 0B94 _ C6. 05, 0000027D(d), 58
        mov     byte [?_173], 0                         ; 0B9B _ C6. 05, 00000286(d), 00
        mov     dword [ebp-8H], 2                       ; 0BA2 _ C7. 45, F8, 00000002
        mov     dword [ebp-0CH], 7                      ; 0BA9 _ C7. 45, F4, 00000007
        jmp     ?_044                                   ; 0BB0 _ EB, 45

?_041:  mov     eax, dword [ebp+8H]                     ; 0BB2 _ 8B. 45, 08
        and     eax, 0FH                                ; 0BB5 _ 83. E0, 0F
        mov     dword [ebp-4H], eax                     ; 0BB8 _ 89. 45, FC
        cmp     dword [ebp-4H], 9                       ; 0BBB _ 83. 7D, FC, 09
        jg      ?_042                                   ; 0BBF _ 7F, 18
        mov     eax, dword [ebp-4H]                     ; 0BC1 _ 8B. 45, FC
        lea     ecx, [eax+30H]                          ; 0BC4 _ 8D. 48, 30
        mov     edx, dword [ebp-8H]                     ; 0BC7 _ 8B. 55, F8
        mov     eax, dword [ebp-0CH]                    ; 0BCA _ 8B. 45, F4
        add     eax, edx                                ; 0BCD _ 01. D0
        mov     edx, ecx                                ; 0BCF _ 89. CA
        mov     byte [str.1828+eax], dl                 ; 0BD1 _ 88. 90, 0000027C(d)
        jmp     ?_043                                   ; 0BD7 _ EB, 16

?_042:  mov     eax, dword [ebp-4H]                     ; 0BD9 _ 8B. 45, FC
        lea     ecx, [eax+37H]                          ; 0BDC _ 8D. 48, 37
        mov     edx, dword [ebp-8H]                     ; 0BDF _ 8B. 55, F8
        mov     eax, dword [ebp-0CH]                    ; 0BE2 _ 8B. 45, F4
        add     eax, edx                                ; 0BE5 _ 01. D0
        mov     edx, ecx                                ; 0BE7 _ 89. CA
        mov     byte [str.1828+eax], dl                 ; 0BE9 _ 88. 90, 0000027C(d)
?_043:  shr     dword [ebp+8H], 4                       ; 0BEF _ C1. 6D, 08, 04
        sub     dword [ebp-0CH], 1                      ; 0BF3 _ 83. 6D, F4, 01
?_044:  cmp     dword [ebp-0CH], 0                      ; 0BF7 _ 83. 7D, F4, 00
        jns     ?_041                                   ; 0BFB _ 79, B5
        mov     eax, str.1828                           ; 0BFD _ B8, 0000027C(d)
        leave                                           ; 0C02 _ C9
        ret                                             ; 0C03 _ C3
; intToHexStr End of function

wait_KBC_sendReady:; Function begin
        push    ebp                                     ; 0C04 _ 55
        mov     ebp, esp                                ; 0C05 _ 89. E5
        sub     esp, 8                                  ; 0C07 _ 83. EC, 08
?_045:  sub     esp, 12                                 ; 0C0A _ 83. EC, 0C
        push    100                                     ; 0C0D _ 6A, 64
        call    io_in8                                  ; 0C0F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0C14 _ 83. C4, 10
        and     eax, 02H                                ; 0C17 _ 83. E0, 02
        test    eax, eax                                ; 0C1A _ 85. C0
        jz      ?_046                                   ; 0C1C _ 74, 02
        jmp     ?_045                                   ; 0C1E _ EB, EA
; wait_KBC_sendReady End of function

?_046:  ; Local function
        nop                                             ; 0C20 _ 90
        nop                                             ; 0C21 _ 90
        leave                                           ; 0C22 _ C9
        ret                                             ; 0C23 _ C3

init_keyboard:; Function begin
        push    ebp                                     ; 0C24 _ 55
        mov     ebp, esp                                ; 0C25 _ 89. E5
        sub     esp, 8                                  ; 0C27 _ 83. EC, 08
        call    wait_KBC_sendReady                      ; 0C2A _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0C2F _ 83. EC, 08
        push    96                                      ; 0C32 _ 6A, 60
        push    100                                     ; 0C34 _ 6A, 64
        call    io_out8                                 ; 0C36 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0C3B _ 83. C4, 10
        call    wait_KBC_sendReady                      ; 0C3E _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0C43 _ 83. EC, 08
        push    71                                      ; 0C46 _ 6A, 47
        push    96                                      ; 0C48 _ 6A, 60
        call    io_out8                                 ; 0C4A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0C4F _ 83. C4, 10
        nop                                             ; 0C52 _ 90
        leave                                           ; 0C53 _ C9
        ret                                             ; 0C54 _ C3
; init_keyboard End of function

enable_mouse:; Function begin
        push    ebp                                     ; 0C55 _ 55
        mov     ebp, esp                                ; 0C56 _ 89. E5
        sub     esp, 8                                  ; 0C58 _ 83. EC, 08
        call    wait_KBC_sendReady                      ; 0C5B _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0C60 _ 83. EC, 08
        push    212                                     ; 0C63 _ 68, 000000D4
        push    100                                     ; 0C68 _ 6A, 64
        call    io_out8                                 ; 0C6A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0C6F _ 83. C4, 10
        call    wait_KBC_sendReady                      ; 0C72 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0C77 _ 83. EC, 08
        push    244                                     ; 0C7A _ 68, 000000F4
        push    96                                      ; 0C7F _ 6A, 60
        call    io_out8                                 ; 0C81 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0C86 _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 0C89 _ 8B. 45, 08
        mov     byte [eax+3H], 0                        ; 0C8C _ C6. 40, 03, 00
        nop                                             ; 0C90 _ 90
        leave                                           ; 0C91 _ C9
        ret                                             ; 0C92 _ C3
; enable_mouse End of function

intHandlerFromMouse:; Function begin
        push    ebp                                     ; 0C93 _ 55
        mov     ebp, esp                                ; 0C94 _ 89. E5
        sub     esp, 24                                 ; 0C96 _ 83. EC, 18
        sub     esp, 8                                  ; 0C99 _ 83. EC, 08
        push    32                                      ; 0C9C _ 6A, 20
        push    160                                     ; 0C9E _ 68, 000000A0
        call    io_out8                                 ; 0CA3 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0CA8 _ 83. C4, 10
        sub     esp, 8                                  ; 0CAB _ 83. EC, 08
        push    32                                      ; 0CAE _ 6A, 20
        push    32                                      ; 0CB0 _ 6A, 20
        call    io_out8                                 ; 0CB2 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0CB7 _ 83. C4, 10
        sub     esp, 12                                 ; 0CBA _ 83. EC, 0C
        push    96                                      ; 0CBD _ 6A, 60
        call    io_in8                                  ; 0CBF _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0CC4 _ 83. C4, 10
        mov     byte [ebp-9H], al                       ; 0CC7 _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 0CCA _ 0F B6. 45, F7
        sub     esp, 8                                  ; 0CCE _ 83. EC, 08
        push    eax                                     ; 0CD1 _ 50
        push    mouseinfo                               ; 0CD2 _ 68, 00000008(d)
        call    fifo8_put                               ; 0CD7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0CDC _ 83. C4, 10
        nop                                             ; 0CDF _ 90
        leave                                           ; 0CE0 _ C9
        ret                                             ; 0CE1 _ C3
; intHandlerFromMouse End of function

mouse_decode:; Function begin
        push    ebp                                     ; 0CE2 _ 55
        mov     ebp, esp                                ; 0CE3 _ 89. E5
        sub     esp, 4                                  ; 0CE5 _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 0CE8 _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 0CEB _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0CEE _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 0CF1 _ 0F B6. 40, 03
        test    al, al                                  ; 0CF5 _ 84. C0
        jnz     ?_048                                   ; 0CF7 _ 75, 17
        cmp     byte [ebp-4H], -6                       ; 0CF9 _ 80. 7D, FC, FA
        jnz     ?_047                                   ; 0CFD _ 75, 07
        mov     eax, dword [ebp+8H]                     ; 0CFF _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 0D02 _ C6. 40, 03, 01
?_047:  mov     eax, 0                                  ; 0D06 _ B8, 00000000
        jmp     ?_055                                   ; 0D0B _ E9, 0000010F

?_048:  mov     eax, dword [ebp+8H]                     ; 0D10 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 0D13 _ 0F B6. 40, 03
        cmp     al, 1                                   ; 0D17 _ 3C, 01
        jnz     ?_050                                   ; 0D19 _ 75, 28
        movzx   eax, byte [ebp-4H]                      ; 0D1B _ 0F B6. 45, FC
        and     eax, 0C8H                               ; 0D1F _ 25, 000000C8
        cmp     eax, 8                                  ; 0D24 _ 83. F8, 08
        jnz     ?_049                                   ; 0D27 _ 75, 10
        mov     eax, dword [ebp+8H]                     ; 0D29 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 0D2C _ 0F B6. 55, FC
        mov     byte [eax], dl                          ; 0D30 _ 88. 10
        mov     eax, dword [ebp+8H]                     ; 0D32 _ 8B. 45, 08
        mov     byte [eax+3H], 2                        ; 0D35 _ C6. 40, 03, 02
?_049:  mov     eax, 0                                  ; 0D39 _ B8, 00000000
        jmp     ?_055                                   ; 0D3E _ E9, 000000DC

?_050:  mov     eax, dword [ebp+8H]                     ; 0D43 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 0D46 _ 0F B6. 40, 03
        cmp     al, 2                                   ; 0D4A _ 3C, 02
        jnz     ?_051                                   ; 0D4C _ 75, 1B
        mov     eax, dword [ebp+8H]                     ; 0D4E _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 0D51 _ 0F B6. 55, FC
        mov     byte [eax+1H], dl                       ; 0D55 _ 88. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0D58 _ 8B. 45, 08
        mov     byte [eax+3H], 3                        ; 0D5B _ C6. 40, 03, 03
        mov     eax, 0                                  ; 0D5F _ B8, 00000000
        jmp     ?_055                                   ; 0D64 _ E9, 000000B6

?_051:  mov     eax, dword [ebp+8H]                     ; 0D69 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 0D6C _ 0F B6. 40, 03
        cmp     al, 3                                   ; 0D70 _ 3C, 03
        jne     ?_054                                   ; 0D72 _ 0F 85, 000000A2
        mov     eax, dword [ebp+8H]                     ; 0D78 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 0D7B _ 0F B6. 55, FC
        mov     byte [eax+2H], dl                       ; 0D7F _ 88. 50, 02
        mov     eax, dword [ebp+8H]                     ; 0D82 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 0D85 _ C6. 40, 03, 01
        mov     eax, dword [ebp+8H]                     ; 0D89 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 0D8C _ 0F B6. 00
        movzx   eax, al                                 ; 0D8F _ 0F B6. C0
        and     eax, 07H                                ; 0D92 _ 83. E0, 07
        mov     edx, eax                                ; 0D95 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0D97 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 0D9A _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 0D9D _ 8B. 45, 08
        movzx   eax, byte [eax+1H]                      ; 0DA0 _ 0F B6. 40, 01
        movzx   edx, al                                 ; 0DA4 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 0DA7 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 0DAA _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0DAD _ 8B. 45, 08
        movzx   eax, byte [eax+2H]                      ; 0DB0 _ 0F B6. 40, 02
        movzx   edx, al                                 ; 0DB4 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 0DB7 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0DBA _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 0DBD _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 0DC0 _ 0F B6. 00
        movzx   eax, al                                 ; 0DC3 _ 0F B6. C0
        and     eax, 10H                                ; 0DC6 _ 83. E0, 10
        test    eax, eax                                ; 0DC9 _ 85. C0
        jz      ?_052                                   ; 0DCB _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 0DCD _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0DD0 _ 8B. 40, 04
        or      eax, 0FFFFFF00H                         ; 0DD3 _ 0D, FFFFFF00
        mov     edx, eax                                ; 0DD8 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0DDA _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 0DDD _ 89. 50, 04
?_052:  mov     eax, dword [ebp+8H]                     ; 0DE0 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 0DE3 _ 0F B6. 00
        movzx   eax, al                                 ; 0DE6 _ 0F B6. C0
        and     eax, 20H                                ; 0DE9 _ 83. E0, 20
        test    eax, eax                                ; 0DEC _ 85. C0
        jz      ?_053                                   ; 0DEE _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 0DF0 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0DF3 _ 8B. 40, 08
        or      eax, 0FFFFFF00H                         ; 0DF6 _ 0D, FFFFFF00
        mov     edx, eax                                ; 0DFB _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0DFD _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0E00 _ 89. 50, 08
?_053:  mov     eax, dword [ebp+8H]                     ; 0E03 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0E06 _ 8B. 40, 08
        neg     eax                                     ; 0E09 _ F7. D8
        mov     edx, eax                                ; 0E0B _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0E0D _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0E10 _ 89. 50, 08
        mov     eax, 1                                  ; 0E13 _ B8, 00000001
        jmp     ?_055                                   ; 0E18 _ EB, 05

?_054:  mov     eax, 4294967295                         ; 0E1A _ B8, FFFFFFFF
?_055:  leave                                           ; 0E1F _ C9
        ret                                             ; 0E20 _ C3
; mouse_decode End of function

computeMousePosition:; Function begin
        push    ebp                                     ; 0E21 _ 55
        mov     ebp, esp                                ; 0E22 _ 89. E5
        sub     esp, 24                                 ; 0E24 _ 83. EC, 18
        movzx   eax, word [?_170]                       ; 0E27 _ 0F B7. 05, 00000004(d)
        cwde                                            ; 0E2E _ 98
        mov     dword [ebp-14H], eax                    ; 0E2F _ 89. 45, EC
        movzx   eax, word [?_171]                       ; 0E32 _ 0F B7. 05, 00000006(d)
        cwde                                            ; 0E39 _ 98
        mov     dword [ebp-10H], eax                    ; 0E3A _ 89. 45, F0
        mov     eax, dword [ebp+10H]                    ; 0E3D _ 8B. 45, 10
        mov     dword [eax+4H], 16                      ; 0E40 _ C7. 40, 04, 00000010
        mov     eax, dword [ebp+10H]                    ; 0E47 _ 8B. 45, 10
        mov     dword [eax+8H], 16                      ; 0E4A _ C7. 40, 08, 00000010
        mov     eax, dword [ebp+14H]                    ; 0E51 _ 8B. 45, 14
        mov     edx, dword [eax+4H]                     ; 0E54 _ 8B. 50, 04
        mov     eax, dword [mx]                         ; 0E57 _ A1, 000000F0(d)
        add     eax, edx                                ; 0E5C _ 01. D0
        mov     dword [mx], eax                         ; 0E5E _ A3, 000000F0(d)
        mov     eax, dword [ebp+14H]                    ; 0E63 _ 8B. 45, 14
        mov     edx, dword [eax+8H]                     ; 0E66 _ 8B. 50, 08
        mov     eax, dword [my]                         ; 0E69 _ A1, 000000F4(d)
        add     eax, edx                                ; 0E6E _ 01. D0
        mov     dword [my], eax                         ; 0E70 _ A3, 000000F4(d)
        mov     eax, dword [mx]                         ; 0E75 _ A1, 000000F0(d)
        test    eax, eax                                ; 0E7A _ 85. C0
        jns     ?_056                                   ; 0E7C _ 79, 0A
        mov     dword [mx], 0                           ; 0E7E _ C7. 05, 000000F0(d), 00000000
?_056:  mov     eax, dword [my]                         ; 0E88 _ A1, 000000F4(d)
        test    eax, eax                                ; 0E8D _ 85. C0
        jns     ?_057                                   ; 0E8F _ 79, 0A
        mov     dword [my], 0                           ; 0E91 _ C7. 05, 000000F4(d), 00000000
?_057:  mov     eax, dword [ebp-10H]                    ; 0E9B _ 8B. 45, F0
        lea     edx, [eax-10H]                          ; 0E9E _ 8D. 50, F0
        mov     eax, dword [my]                         ; 0EA1 _ A1, 000000F4(d)
        cmp     edx, eax                                ; 0EA6 _ 39. C2
        jge     ?_058                                   ; 0EA8 _ 7D, 10
        mov     eax, dword [my]                         ; 0EAA _ A1, 000000F4(d)
        mov     edx, dword [ebp-10H]                    ; 0EAF _ 8B. 55, F0
        sub     edx, eax                                ; 0EB2 _ 29. C2
        mov     eax, dword [ebp+10H]                    ; 0EB4 _ 8B. 45, 10
        mov     dword [eax+8H], edx                     ; 0EB7 _ 89. 50, 08
?_058:  mov     dword [ebp-0CH], 1                      ; 0EBA _ C7. 45, F4, 00000001
        mov     eax, dword [ebp-14H]                    ; 0EC1 _ 8B. 45, EC
        sub     eax, dword [ebp-0CH]                    ; 0EC4 _ 2B. 45, F4
        mov     edx, eax                                ; 0EC7 _ 89. C2
        mov     eax, dword [mx]                         ; 0EC9 _ A1, 000000F0(d)
        cmp     edx, eax                                ; 0ECE _ 39. C2
        jge     ?_059                                   ; 0ED0 _ 7D, 14
        mov     eax, dword [ebp-14H]                    ; 0ED2 _ 8B. 45, EC
        sub     eax, dword [ebp-0CH]                    ; 0ED5 _ 2B. 45, F4
        mov     dword [mx], eax                         ; 0ED8 _ A3, 000000F0(d)
        mov     eax, dword [ebp+10H]                    ; 0EDD _ 8B. 45, 10
        mov     edx, dword [ebp-0CH]                    ; 0EE0 _ 8B. 55, F4
        mov     dword [eax+4H], edx                     ; 0EE3 _ 89. 50, 04
?_059:  mov     eax, dword [ebp-10H]                    ; 0EE6 _ 8B. 45, F0
        sub     eax, dword [ebp-0CH]                    ; 0EE9 _ 2B. 45, F4
        mov     edx, eax                                ; 0EEC _ 89. C2
        mov     eax, dword [my]                         ; 0EEE _ A1, 000000F4(d)
        cmp     edx, eax                                ; 0EF3 _ 39. C2
        jge     ?_060                                   ; 0EF5 _ 7D, 14
        mov     eax, dword [ebp-10H]                    ; 0EF7 _ 8B. 45, F0
        sub     eax, dword [ebp-0CH]                    ; 0EFA _ 2B. 45, F4
        mov     dword [my], eax                         ; 0EFD _ A3, 000000F4(d)
        mov     eax, dword [ebp+10H]                    ; 0F02 _ 8B. 45, 10
        mov     edx, dword [ebp-0CH]                    ; 0F05 _ 8B. 55, F4
        mov     dword [eax+8H], edx                     ; 0F08 _ 89. 50, 08
?_060:  sub     esp, 8                                  ; 0F0B _ 83. EC, 08
        push    ?_159                                   ; 0F0E _ 68, 0000001C(d)
        push    7                                       ; 0F13 _ 6A, 07
        push    0                                       ; 0F15 _ 6A, 00
        push    0                                       ; 0F17 _ 6A, 00
        push    dword [ebp+0CH]                         ; 0F19 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0F1C _ FF. 75, 08
        call    showString                              ; 0F1F _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0F24 _ 83. C4, 20
        nop                                             ; 0F27 _ 90
        leave                                           ; 0F28 _ C9
        ret                                             ; 0F29 _ C3
; computeMousePosition End of function

show_mouse_info:; Function begin
        push    ebp                                     ; 0F2A _ 55
        mov     ebp, esp                                ; 0F2B _ 89. E5
        sub     esp, 24                                 ; 0F2D _ 83. EC, 18
        mov     eax, dword [buf_back]                   ; 0F30 _ A1, 000000F8(d)
        mov     dword [ebp-0CH], eax                    ; 0F35 _ 89. 45, F4
        mov     byte [ebp-0DH], 0                       ; 0F38 _ C6. 45, F3, 00
        call    io_sti                                  ; 0F3C _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 0F41 _ 83. EC, 0C
        push    mouseinfo                               ; 0F44 _ 68, 00000008(d)
        call    fifo8_get                               ; 0F49 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0F4E _ 83. C4, 10
        mov     byte [ebp-0DH], al                      ; 0F51 _ 88. 45, F3
        movzx   eax, byte [ebp-0DH]                     ; 0F54 _ 0F B6. 45, F3
        sub     esp, 8                                  ; 0F58 _ 83. EC, 08
        push    eax                                     ; 0F5B _ 50
        push    mdec                                    ; 0F5C _ 68, 000000E0(d)
        call    mouse_decode                            ; 0F61 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0F66 _ 83. C4, 10
        cmp     eax, 1                                  ; 0F69 _ 83. F8, 01
        jnz     ?_061                                   ; 0F6C _ 75, 31
        push    mdec                                    ; 0F6E _ 68, 000000E0(d)
        push    dword [ebp+10H]                         ; 0F73 _ FF. 75, 10
        push    dword [ebp+0CH]                         ; 0F76 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0F79 _ FF. 75, 08
        call    computeMousePosition                    ; 0F7C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0F81 _ 83. C4, 10
        mov     edx, dword [my]                         ; 0F84 _ 8B. 15, 000000F4(d)
        mov     eax, dword [mx]                         ; 0F8A _ A1, 000000F0(d)
        push    edx                                     ; 0F8F _ 52
        push    eax                                     ; 0F90 _ 50
        push    dword [ebp+10H]                         ; 0F91 _ FF. 75, 10
        push    dword [ebp+8H]                          ; 0F94 _ FF. 75, 08
        call    sheet_slide_mouse                       ; 0F97 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0F9C _ 83. C4, 10
?_061:  nop                                             ; 0F9F _ 90
        leave                                           ; 0FA0 _ C9
        ret                                             ; 0FA1 _ C3
; show_mouse_info End of function

showMemoryInfo:; Function begin
        push    ebp                                     ; 0FA2 _ 55
        mov     ebp, esp                                ; 0FA3 _ 89. E5
        sub     esp, 56                                 ; 0FA5 _ 83. EC, 38
        mov     dword [ebp-30H], 0                      ; 0FA8 _ C7. 45, D0, 00000000
        mov     dword [ebp-2CH], 0                      ; 0FAF _ C7. 45, D4, 00000000
        mov     dword [ebp-28H], 104                    ; 0FB6 _ C7. 45, D8, 00000068
        mov     dword [ebp-24H], 80                     ; 0FBD _ C7. 45, DC, 00000050
        mov     edx, dword [ysize]                      ; 0FC4 _ 8B. 15, 00000204(d)
        mov     eax, dword [ebp+0CH]                    ; 0FCA _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 0FCD _ 8B. 00
        sub     esp, 4                                  ; 0FCF _ 83. EC, 04
        push    edx                                     ; 0FD2 _ 52
        push    dword [ebp+1CH]                         ; 0FD3 _ FF. 75, 1C
        push    eax                                     ; 0FD6 _ 50
        call    init_screen8                            ; 0FD7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0FDC _ 83. C4, 10
        mov     eax, dword [ebp+20H]                    ; 0FDF _ 8B. 45, 20
        movsx   eax, al                                 ; 0FE2 _ 0F BE. C0
        sub     esp, 8                                  ; 0FE5 _ 83. EC, 08
        push    ?_160                                   ; 0FE8 _ 68, 00000034(d)
        push    eax                                     ; 0FED _ 50
        push    dword [ebp-2CH]                         ; 0FEE _ FF. 75, D4
        push    dword [ebp-30H]                         ; 0FF1 _ FF. 75, D0
        push    dword [ebp+0CH]                         ; 0FF4 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0FF7 _ FF. 75, 08
        call    showString                              ; 0FFA _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0FFF _ 83. C4, 20
        mov     eax, dword [ebp+18H]                    ; 1002 _ 8B. 45, 18
        sub     esp, 12                                 ; 1005 _ 83. EC, 0C
        push    eax                                     ; 1008 _ 50
        call    intToHexStr                             ; 1009 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 100E _ 83. C4, 10
        mov     dword [ebp-20H], eax                    ; 1011 _ 89. 45, E0
        mov     eax, dword [ebp+20H]                    ; 1014 _ 8B. 45, 20
        movsx   eax, al                                 ; 1017 _ 0F BE. C0
        sub     esp, 8                                  ; 101A _ 83. EC, 08
        push    dword [ebp-20H]                         ; 101D _ FF. 75, E0
        push    eax                                     ; 1020 _ 50
        push    dword [ebp-2CH]                         ; 1021 _ FF. 75, D4
        push    dword [ebp-28H]                         ; 1024 _ FF. 75, D8
        push    dword [ebp+0CH]                         ; 1027 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 102A _ FF. 75, 08
        call    showString                              ; 102D _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1032 _ 83. C4, 20
        add     dword [ebp-2CH], 16                     ; 1035 _ 83. 45, D4, 10
        mov     eax, dword [ebp+20H]                    ; 1039 _ 8B. 45, 20
        movsx   eax, al                                 ; 103C _ 0F BE. C0
        sub     esp, 8                                  ; 103F _ 83. EC, 08
        push    ?_161                                   ; 1042 _ 68, 0000003E(d)
        push    eax                                     ; 1047 _ 50
        push    dword [ebp-2CH]                         ; 1048 _ FF. 75, D4
        push    dword [ebp-30H]                         ; 104B _ FF. 75, D0
        push    dword [ebp+0CH]                         ; 104E _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1051 _ FF. 75, 08
        call    showString                              ; 1054 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1059 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 105C _ 8B. 45, 10
        mov     eax, dword [eax]                        ; 105F _ 8B. 00
        sub     esp, 12                                 ; 1061 _ 83. EC, 0C
        push    eax                                     ; 1064 _ 50
        call    intToHexStr                             ; 1065 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 106A _ 83. C4, 10
        mov     dword [ebp-1CH], eax                    ; 106D _ 89. 45, E4
        mov     eax, dword [ebp+20H]                    ; 1070 _ 8B. 45, 20
        movsx   eax, al                                 ; 1073 _ 0F BE. C0
        sub     esp, 8                                  ; 1076 _ 83. EC, 08
        push    dword [ebp-1CH]                         ; 1079 _ FF. 75, E4
        push    eax                                     ; 107C _ 50
        push    dword [ebp-2CH]                         ; 107D _ FF. 75, D4
        push    dword [ebp-28H]                         ; 1080 _ FF. 75, D8
        push    dword [ebp+0CH]                         ; 1083 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1086 _ FF. 75, 08
        call    showString                              ; 1089 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 108E _ 83. C4, 20
        add     dword [ebp-2CH], 16                     ; 1091 _ 83. 45, D4, 10
        mov     eax, dword [ebp+20H]                    ; 1095 _ 8B. 45, 20
        movsx   eax, al                                 ; 1098 _ 0F BE. C0
        sub     esp, 8                                  ; 109B _ 83. EC, 08
        push    ?_162                                   ; 109E _ 68, 0000004A(d)
        push    eax                                     ; 10A3 _ 50
        push    dword [ebp-2CH]                         ; 10A4 _ FF. 75, D4
        push    dword [ebp-30H]                         ; 10A7 _ FF. 75, D0
        push    dword [ebp+0CH]                         ; 10AA _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 10AD _ FF. 75, 08
        call    showString                              ; 10B0 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 10B5 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 10B8 _ 8B. 45, 10
        mov     eax, dword [eax+4H]                     ; 10BB _ 8B. 40, 04
        sub     esp, 12                                 ; 10BE _ 83. EC, 0C
        push    eax                                     ; 10C1 _ 50
        call    intToHexStr                             ; 10C2 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 10C7 _ 83. C4, 10
        mov     dword [ebp-18H], eax                    ; 10CA _ 89. 45, E8
        mov     eax, dword [ebp+20H]                    ; 10CD _ 8B. 45, 20
        movsx   eax, al                                 ; 10D0 _ 0F BE. C0
        sub     esp, 8                                  ; 10D3 _ 83. EC, 08
        push    dword [ebp-18H]                         ; 10D6 _ FF. 75, E8
        push    eax                                     ; 10D9 _ 50
        push    dword [ebp-2CH]                         ; 10DA _ FF. 75, D4
        push    dword [ebp-28H]                         ; 10DD _ FF. 75, D8
        push    dword [ebp+0CH]                         ; 10E0 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 10E3 _ FF. 75, 08
        call    showString                              ; 10E6 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 10EB _ 83. C4, 20
        add     dword [ebp-2CH], 16                     ; 10EE _ 83. 45, D4, 10
        mov     eax, dword [ebp+20H]                    ; 10F2 _ 8B. 45, 20
        movsx   eax, al                                 ; 10F5 _ 0F BE. C0
        sub     esp, 8                                  ; 10F8 _ 83. EC, 08
        push    ?_163                                   ; 10FB _ 68, 00000056(d)
        push    eax                                     ; 1100 _ 50
        push    dword [ebp-2CH]                         ; 1101 _ FF. 75, D4
        push    dword [ebp-30H]                         ; 1104 _ FF. 75, D0
        push    dword [ebp+0CH]                         ; 1107 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 110A _ FF. 75, 08
        call    showString                              ; 110D _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1112 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 1115 _ 8B. 45, 10
        mov     eax, dword [eax+8H]                     ; 1118 _ 8B. 40, 08
        sub     esp, 12                                 ; 111B _ 83. EC, 0C
        push    eax                                     ; 111E _ 50
        call    intToHexStr                             ; 111F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1124 _ 83. C4, 10
        mov     dword [ebp-14H], eax                    ; 1127 _ 89. 45, EC
        mov     eax, dword [ebp+20H]                    ; 112A _ 8B. 45, 20
        movsx   eax, al                                 ; 112D _ 0F BE. C0
        sub     esp, 8                                  ; 1130 _ 83. EC, 08
        push    dword [ebp-14H]                         ; 1133 _ FF. 75, EC
        push    eax                                     ; 1136 _ 50
        push    dword [ebp-2CH]                         ; 1137 _ FF. 75, D4
        push    dword [ebp-28H]                         ; 113A _ FF. 75, D8
        push    dword [ebp+0CH]                         ; 113D _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1140 _ FF. 75, 08
        call    showString                              ; 1143 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1148 _ 83. C4, 20
        add     dword [ebp-2CH], 16                     ; 114B _ 83. 45, D4, 10
        mov     eax, dword [ebp+20H]                    ; 114F _ 8B. 45, 20
        movsx   eax, al                                 ; 1152 _ 0F BE. C0
        sub     esp, 8                                  ; 1155 _ 83. EC, 08
        push    ?_164                                   ; 1158 _ 68, 00000062(d)
        push    eax                                     ; 115D _ 50
        push    dword [ebp-2CH]                         ; 115E _ FF. 75, D4
        push    dword [ebp-30H]                         ; 1161 _ FF. 75, D0
        push    dword [ebp+0CH]                         ; 1164 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1167 _ FF. 75, 08
        call    showString                              ; 116A _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 116F _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 1172 _ 8B. 45, 10
        mov     eax, dword [eax+0CH]                    ; 1175 _ 8B. 40, 0C
        sub     esp, 12                                 ; 1178 _ 83. EC, 0C
        push    eax                                     ; 117B _ 50
        call    intToHexStr                             ; 117C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1181 _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 1184 _ 89. 45, F0
        mov     eax, dword [ebp+20H]                    ; 1187 _ 8B. 45, 20
        movsx   eax, al                                 ; 118A _ 0F BE. C0
        sub     esp, 8                                  ; 118D _ 83. EC, 08
        push    dword [ebp-10H]                         ; 1190 _ FF. 75, F0
        push    eax                                     ; 1193 _ 50
        push    dword [ebp-2CH]                         ; 1194 _ FF. 75, D4
        push    dword [ebp-28H]                         ; 1197 _ FF. 75, D8
        push    dword [ebp+0CH]                         ; 119A _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 119D _ FF. 75, 08
        call    showString                              ; 11A0 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 11A5 _ 83. C4, 20
        add     dword [ebp-2CH], 16                     ; 11A8 _ 83. 45, D4, 10
        mov     eax, dword [ebp+20H]                    ; 11AC _ 8B. 45, 20
        movsx   eax, al                                 ; 11AF _ 0F BE. C0
        sub     esp, 8                                  ; 11B2 _ 83. EC, 08
        push    ?_165                                   ; 11B5 _ 68, 0000006F(d)
        push    eax                                     ; 11BA _ 50
        push    dword [ebp-2CH]                         ; 11BB _ FF. 75, D4
        push    dword [ebp-30H]                         ; 11BE _ FF. 75, D0
        push    dword [ebp+0CH]                         ; 11C1 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 11C4 _ FF. 75, 08
        call    showString                              ; 11C7 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 11CC _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 11CF _ 8B. 45, 10
        mov     eax, dword [eax+10H]                    ; 11D2 _ 8B. 40, 10
        sub     esp, 12                                 ; 11D5 _ 83. EC, 0C
        push    eax                                     ; 11D8 _ 50
        call    intToHexStr                             ; 11D9 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 11DE _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 11E1 _ 89. 45, F4
        mov     eax, dword [ebp+20H]                    ; 11E4 _ 8B. 45, 20
        movsx   eax, al                                 ; 11E7 _ 0F BE. C0
        sub     esp, 8                                  ; 11EA _ 83. EC, 08
        push    dword [ebp-0CH]                         ; 11ED _ FF. 75, F4
        push    eax                                     ; 11F0 _ 50
        push    dword [ebp-2CH]                         ; 11F1 _ FF. 75, D4
        push    dword [ebp-28H]                         ; 11F4 _ FF. 75, D8
        push    dword [ebp+0CH]                         ; 11F7 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 11FA _ FF. 75, 08
        call    showString                              ; 11FD _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1202 _ 83. C4, 20
        nop                                             ; 1205 _ 90
        leave                                           ; 1206 _ C9
        ret                                             ; 1207 _ C3
; showMemoryInfo End of function

init_screen8:; Function begin
        push    ebp                                     ; 1208 _ 55
        mov     ebp, esp                                ; 1209 _ 89. E5
        push    ebx                                     ; 120B _ 53
        mov     eax, dword [ebp+10H]                    ; 120C _ 8B. 45, 10
        lea     edx, [eax-1DH]                          ; 120F _ 8D. 50, E3
        mov     eax, dword [ebp+0CH]                    ; 1212 _ 8B. 45, 0C
        sub     eax, 1                                  ; 1215 _ 83. E8, 01
        push    edx                                     ; 1218 _ 52
        push    eax                                     ; 1219 _ 50
        push    0                                       ; 121A _ 6A, 00
        push    0                                       ; 121C _ 6A, 00
        push    14                                      ; 121E _ 6A, 0E
        push    dword [ebp+0CH]                         ; 1220 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1223 _ FF. 75, 08
        call    boxfill8                                ; 1226 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 122B _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 122E _ 8B. 45, 10
        lea     ecx, [eax-1CH]                          ; 1231 _ 8D. 48, E4
        mov     eax, dword [ebp+0CH]                    ; 1234 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 1237 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 123A _ 8B. 45, 10
        sub     eax, 28                                 ; 123D _ 83. E8, 1C
        push    ecx                                     ; 1240 _ 51
        push    edx                                     ; 1241 _ 52
        push    eax                                     ; 1242 _ 50
        push    0                                       ; 1243 _ 6A, 00
        push    8                                       ; 1245 _ 6A, 08
        push    dword [ebp+0CH]                         ; 1247 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 124A _ FF. 75, 08
        call    boxfill8                                ; 124D _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1252 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 1255 _ 8B. 45, 10
        lea     ecx, [eax-1BH]                          ; 1258 _ 8D. 48, E5
        mov     eax, dword [ebp+0CH]                    ; 125B _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 125E _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 1261 _ 8B. 45, 10
        sub     eax, 27                                 ; 1264 _ 83. E8, 1B
        push    ecx                                     ; 1267 _ 51
        push    edx                                     ; 1268 _ 52
        push    eax                                     ; 1269 _ 50
        push    0                                       ; 126A _ 6A, 00
        push    7                                       ; 126C _ 6A, 07
        push    dword [ebp+0CH]                         ; 126E _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1271 _ FF. 75, 08
        call    boxfill8                                ; 1274 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1279 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 127C _ 8B. 45, 10
        lea     ecx, [eax-1H]                           ; 127F _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 1282 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 1285 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 1288 _ 8B. 45, 10
        sub     eax, 26                                 ; 128B _ 83. E8, 1A
        push    ecx                                     ; 128E _ 51
        push    edx                                     ; 128F _ 52
        push    eax                                     ; 1290 _ 50
        push    0                                       ; 1291 _ 6A, 00
        push    8                                       ; 1293 _ 6A, 08
        push    dword [ebp+0CH]                         ; 1295 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1298 _ FF. 75, 08
        call    boxfill8                                ; 129B _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 12A0 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 12A3 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 12A6 _ 8D. 50, E8
        mov     eax, dword [ebp+10H]                    ; 12A9 _ 8B. 45, 10
        sub     eax, 24                                 ; 12AC _ 83. E8, 18
        push    edx                                     ; 12AF _ 52
        push    59                                      ; 12B0 _ 6A, 3B
        push    eax                                     ; 12B2 _ 50
        push    3                                       ; 12B3 _ 6A, 03
        push    7                                       ; 12B5 _ 6A, 07
        push    dword [ebp+0CH]                         ; 12B7 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 12BA _ FF. 75, 08
        call    boxfill8                                ; 12BD _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 12C2 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 12C5 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 12C8 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 12CB _ 8B. 45, 10
        sub     eax, 24                                 ; 12CE _ 83. E8, 18
        push    edx                                     ; 12D1 _ 52
        push    2                                       ; 12D2 _ 6A, 02
        push    eax                                     ; 12D4 _ 50
        push    2                                       ; 12D5 _ 6A, 02
        push    7                                       ; 12D7 _ 6A, 07
        push    dword [ebp+0CH]                         ; 12D9 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 12DC _ FF. 75, 08
        call    boxfill8                                ; 12DF _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 12E4 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 12E7 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 12EA _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 12ED _ 8B. 45, 10
        sub     eax, 4                                  ; 12F0 _ 83. E8, 04
        push    edx                                     ; 12F3 _ 52
        push    59                                      ; 12F4 _ 6A, 3B
        push    eax                                     ; 12F6 _ 50
        push    3                                       ; 12F7 _ 6A, 03
        push    15                                      ; 12F9 _ 6A, 0F
        push    dword [ebp+0CH]                         ; 12FB _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 12FE _ FF. 75, 08
        call    boxfill8                                ; 1301 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1306 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 1309 _ 8B. 45, 10
        lea     edx, [eax-5H]                           ; 130C _ 8D. 50, FB
        mov     eax, dword [ebp+10H]                    ; 130F _ 8B. 45, 10
        sub     eax, 23                                 ; 1312 _ 83. E8, 17
        push    edx                                     ; 1315 _ 52
        push    59                                      ; 1316 _ 6A, 3B
        push    eax                                     ; 1318 _ 50
        push    59                                      ; 1319 _ 6A, 3B
        push    15                                      ; 131B _ 6A, 0F
        push    dword [ebp+0CH]                         ; 131D _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1320 _ FF. 75, 08
        call    boxfill8                                ; 1323 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1328 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 132B _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 132E _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 1331 _ 8B. 45, 10
        sub     eax, 3                                  ; 1334 _ 83. E8, 03
        push    edx                                     ; 1337 _ 52
        push    59                                      ; 1338 _ 6A, 3B
        push    eax                                     ; 133A _ 50
        push    2                                       ; 133B _ 6A, 02
        push    0                                       ; 133D _ 6A, 00
        push    dword [ebp+0CH]                         ; 133F _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1342 _ FF. 75, 08
        call    boxfill8                                ; 1345 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 134A _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 134D _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 1350 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 1353 _ 8B. 45, 10
        sub     eax, 24                                 ; 1356 _ 83. E8, 18
        push    edx                                     ; 1359 _ 52
        push    60                                      ; 135A _ 6A, 3C
        push    eax                                     ; 135C _ 50
        push    60                                      ; 135D _ 6A, 3C
        push    0                                       ; 135F _ 6A, 00
        push    dword [ebp+0CH]                         ; 1361 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1364 _ FF. 75, 08
        call    boxfill8                                ; 1367 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 136C _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 136F _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 1372 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 1375 _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 1378 _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 137B _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 137E _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 1381 _ 8B. 45, 0C
        sub     eax, 47                                 ; 1384 _ 83. E8, 2F
        push    ebx                                     ; 1387 _ 53
        push    ecx                                     ; 1388 _ 51
        push    edx                                     ; 1389 _ 52
        push    eax                                     ; 138A _ 50
        push    7                                       ; 138B _ 6A, 07
        push    dword [ebp+0CH]                         ; 138D _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1390 _ FF. 75, 08
        call    boxfill8                                ; 1393 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1398 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 139B _ 8B. 45, 10
        lea     ebx, [eax-4H]                           ; 139E _ 8D. 58, FC
        mov     eax, dword [ebp+0CH]                    ; 13A1 _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 13A4 _ 8D. 48, FD
        mov     eax, dword [ebp+10H]                    ; 13A7 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 13AA _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 13AD _ 8B. 45, 0C
        sub     eax, 3                                  ; 13B0 _ 83. E8, 03
        push    ebx                                     ; 13B3 _ 53
        push    ecx                                     ; 13B4 _ 51
        push    edx                                     ; 13B5 _ 52
        push    eax                                     ; 13B6 _ 50
        push    7                                       ; 13B7 _ 6A, 07
        push    dword [ebp+0CH]                         ; 13B9 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 13BC _ FF. 75, 08
        call    boxfill8                                ; 13BF _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 13C4 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 13C7 _ 8B. 45, 10
        lea     ebx, [eax-18H]                          ; 13CA _ 8D. 58, E8
        mov     eax, dword [ebp+0CH]                    ; 13CD _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 13D0 _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 13D3 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 13D6 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 13D9 _ 8B. 45, 0C
        sub     eax, 47                                 ; 13DC _ 83. E8, 2F
        push    ebx                                     ; 13DF _ 53
        push    ecx                                     ; 13E0 _ 51
        push    edx                                     ; 13E1 _ 52
        push    eax                                     ; 13E2 _ 50
        push    15                                      ; 13E3 _ 6A, 0F
        push    dword [ebp+0CH]                         ; 13E5 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 13E8 _ FF. 75, 08
        call    boxfill8                                ; 13EB _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 13F0 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 13F3 _ 8B. 45, 10
        lea     ebx, [eax-4H]                           ; 13F6 _ 8D. 58, FC
        mov     eax, dword [ebp+0CH]                    ; 13F9 _ 8B. 45, 0C
        lea     ecx, [eax-2FH]                          ; 13FC _ 8D. 48, D1
        mov     eax, dword [ebp+10H]                    ; 13FF _ 8B. 45, 10
        lea     edx, [eax-17H]                          ; 1402 _ 8D. 50, E9
        mov     eax, dword [ebp+0CH]                    ; 1405 _ 8B. 45, 0C
        sub     eax, 47                                 ; 1408 _ 83. E8, 2F
        push    ebx                                     ; 140B _ 53
        push    ecx                                     ; 140C _ 51
        push    edx                                     ; 140D _ 52
        push    eax                                     ; 140E _ 50
        push    15                                      ; 140F _ 6A, 0F
        push    dword [ebp+0CH]                         ; 1411 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1414 _ FF. 75, 08
        call    boxfill8                                ; 1417 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 141C _ 83. C4, 1C
        nop                                             ; 141F _ 90
        mov     ebx, dword [ebp-4H]                     ; 1420 _ 8B. 5D, FC
        leave                                           ; 1423 _ C9
        ret                                             ; 1424 _ C3
; init_screen8 End of function

make_window8:; Function begin
        push    ebp                                     ; 1425 _ 55
        mov     ebp, esp                                ; 1426 _ 89. E5
        push    ebx                                     ; 1428 _ 53
        sub     esp, 36                                 ; 1429 _ 83. EC, 24
        mov     eax, dword [ebp+0CH]                    ; 142C _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 142F _ 8B. 40, 04
        mov     dword [ebp-10H], eax                    ; 1432 _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 1435 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 1438 _ 8B. 40, 08
        mov     dword [ebp-0CH], eax                    ; 143B _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 143E _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 1441 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1444 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1447 _ 8B. 00
        push    0                                       ; 1449 _ 6A, 00
        push    edx                                     ; 144B _ 52
        push    0                                       ; 144C _ 6A, 00
        push    0                                       ; 144E _ 6A, 00
        push    8                                       ; 1450 _ 6A, 08
        push    dword [ebp-10H]                         ; 1452 _ FF. 75, F0
        push    eax                                     ; 1455 _ 50
        call    boxfill8                                ; 1456 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 145B _ 83. C4, 1C
        mov     eax, dword [ebp-10H]                    ; 145E _ 8B. 45, F0
        lea     edx, [eax-2H]                           ; 1461 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 1464 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1467 _ 8B. 00
        push    1                                       ; 1469 _ 6A, 01
        push    edx                                     ; 146B _ 52
        push    1                                       ; 146C _ 6A, 01
        push    1                                       ; 146E _ 6A, 01
        push    7                                       ; 1470 _ 6A, 07
        push    dword [ebp-10H]                         ; 1472 _ FF. 75, F0
        push    eax                                     ; 1475 _ 50
        call    boxfill8                                ; 1476 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 147B _ 83. C4, 1C
        mov     eax, dword [ebp-0CH]                    ; 147E _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1481 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1484 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1487 _ 8B. 00
        push    edx                                     ; 1489 _ 52
        push    0                                       ; 148A _ 6A, 00
        push    0                                       ; 148C _ 6A, 00
        push    0                                       ; 148E _ 6A, 00
        push    8                                       ; 1490 _ 6A, 08
        push    dword [ebp-10H]                         ; 1492 _ FF. 75, F0
        push    eax                                     ; 1495 _ 50
        call    boxfill8                                ; 1496 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 149B _ 83. C4, 1C
        mov     eax, dword [ebp-0CH]                    ; 149E _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 14A1 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 14A4 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 14A7 _ 8B. 00
        push    edx                                     ; 14A9 _ 52
        push    1                                       ; 14AA _ 6A, 01
        push    1                                       ; 14AC _ 6A, 01
        push    1                                       ; 14AE _ 6A, 01
        push    8                                       ; 14B0 _ 6A, 08
        push    dword [ebp-10H]                         ; 14B2 _ FF. 75, F0
        push    eax                                     ; 14B5 _ 50
        call    boxfill8                                ; 14B6 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 14BB _ 83. C4, 1C
        mov     eax, dword [ebp-0CH]                    ; 14BE _ 8B. 45, F4
        lea     ebx, [eax-2H]                           ; 14C1 _ 8D. 58, FE
        mov     eax, dword [ebp-10H]                    ; 14C4 _ 8B. 45, F0
        lea     ecx, [eax-2H]                           ; 14C7 _ 8D. 48, FE
        mov     eax, dword [ebp-10H]                    ; 14CA _ 8B. 45, F0
        lea     edx, [eax-2H]                           ; 14CD _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 14D0 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 14D3 _ 8B. 00
        push    ebx                                     ; 14D5 _ 53
        push    ecx                                     ; 14D6 _ 51
        push    1                                       ; 14D7 _ 6A, 01
        push    edx                                     ; 14D9 _ 52
        push    15                                      ; 14DA _ 6A, 0F
        push    dword [ebp-10H]                         ; 14DC _ FF. 75, F0
        push    eax                                     ; 14DF _ 50
        call    boxfill8                                ; 14E0 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 14E5 _ 83. C4, 1C
        mov     eax, dword [ebp-0CH]                    ; 14E8 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 14EB _ 8D. 58, FF
        mov     eax, dword [ebp-10H]                    ; 14EE _ 8B. 45, F0
        lea     ecx, [eax-1H]                           ; 14F1 _ 8D. 48, FF
        mov     eax, dword [ebp-10H]                    ; 14F4 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 14F7 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 14FA _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 14FD _ 8B. 00
        push    ebx                                     ; 14FF _ 53
        push    ecx                                     ; 1500 _ 51
        push    0                                       ; 1501 _ 6A, 00
        push    edx                                     ; 1503 _ 52
        push    0                                       ; 1504 _ 6A, 00
        push    dword [ebp-10H]                         ; 1506 _ FF. 75, F0
        push    eax                                     ; 1509 _ 50
        call    boxfill8                                ; 150A _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 150F _ 83. C4, 1C
        mov     eax, dword [ebp-0CH]                    ; 1512 _ 8B. 45, F4
        lea     ecx, [eax-3H]                           ; 1515 _ 8D. 48, FD
        mov     eax, dword [ebp-10H]                    ; 1518 _ 8B. 45, F0
        lea     edx, [eax-3H]                           ; 151B _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 151E _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1521 _ 8B. 00
        push    ecx                                     ; 1523 _ 51
        push    edx                                     ; 1524 _ 52
        push    2                                       ; 1525 _ 6A, 02
        push    2                                       ; 1527 _ 6A, 02
        push    8                                       ; 1529 _ 6A, 08
        push    dword [ebp-10H]                         ; 152B _ FF. 75, F0
        push    eax                                     ; 152E _ 50
        call    boxfill8                                ; 152F _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1534 _ 83. C4, 1C
        mov     eax, dword [ebp-10H]                    ; 1537 _ 8B. 45, F0
        lea     edx, [eax-4H]                           ; 153A _ 8D. 50, FC
        mov     eax, dword [ebp+0CH]                    ; 153D _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1540 _ 8B. 00
        push    20                                      ; 1542 _ 6A, 14
        push    edx                                     ; 1544 _ 52
        push    3                                       ; 1545 _ 6A, 03
        push    3                                       ; 1547 _ 6A, 03
        push    12                                      ; 1549 _ 6A, 0C
        push    dword [ebp-10H]                         ; 154B _ FF. 75, F0
        push    eax                                     ; 154E _ 50
        call    boxfill8                                ; 154F _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1554 _ 83. C4, 1C
        mov     eax, dword [ebp-0CH]                    ; 1557 _ 8B. 45, F4
        lea     ebx, [eax-2H]                           ; 155A _ 8D. 58, FE
        mov     eax, dword [ebp-10H]                    ; 155D _ 8B. 45, F0
        lea     ecx, [eax-2H]                           ; 1560 _ 8D. 48, FE
        mov     eax, dword [ebp-0CH]                    ; 1563 _ 8B. 45, F4
        lea     edx, [eax-2H]                           ; 1566 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 1569 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 156C _ 8B. 00
        push    ebx                                     ; 156E _ 53
        push    ecx                                     ; 156F _ 51
        push    edx                                     ; 1570 _ 52
        push    1                                       ; 1571 _ 6A, 01
        push    15                                      ; 1573 _ 6A, 0F
        push    dword [ebp-10H]                         ; 1575 _ FF. 75, F0
        push    eax                                     ; 1578 _ 50
        call    boxfill8                                ; 1579 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 157E _ 83. C4, 1C
        mov     eax, dword [ebp-0CH]                    ; 1581 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 1584 _ 8D. 58, FF
        mov     eax, dword [ebp-10H]                    ; 1587 _ 8B. 45, F0
        lea     ecx, [eax-1H]                           ; 158A _ 8D. 48, FF
        mov     eax, dword [ebp-0CH]                    ; 158D _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1590 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1593 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1596 _ 8B. 00
        push    ebx                                     ; 1598 _ 53
        push    ecx                                     ; 1599 _ 51
        push    edx                                     ; 159A _ 52
        push    0                                       ; 159B _ 6A, 00
        push    0                                       ; 159D _ 6A, 00
        push    dword [ebp-10H]                         ; 159F _ FF. 75, F0
        push    eax                                     ; 15A2 _ 50
        call    boxfill8                                ; 15A3 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 15A8 _ 83. C4, 1C
        sub     esp, 8                                  ; 15AB _ 83. EC, 08
        push    dword [ebp+10H]                         ; 15AE _ FF. 75, 10
        push    7                                       ; 15B1 _ 6A, 07
        push    4                                       ; 15B3 _ 6A, 04
        push    24                                      ; 15B5 _ 6A, 18
        push    dword [ebp+0CH]                         ; 15B7 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 15BA _ FF. 75, 08
        call    showString                              ; 15BD _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 15C2 _ 83. C4, 20
        mov     dword [ebp-14H], 0                      ; 15C5 _ C7. 45, EC, 00000000
        jmp     ?_069                                   ; 15CC _ E9, 00000083

?_062:  mov     dword [ebp-18H], 0                      ; 15D1 _ C7. 45, E8, 00000000
        jmp     ?_068                                   ; 15D8 _ EB, 70

?_063:  mov     eax, dword [ebp-14H]                    ; 15DA _ 8B. 45, EC
        shl     eax, 4                                  ; 15DD _ C1. E0, 04
        mov     edx, eax                                ; 15E0 _ 89. C2
        mov     eax, dword [ebp-18H]                    ; 15E2 _ 8B. 45, E8
        add     eax, edx                                ; 15E5 _ 01. D0
        add     eax, closebtn.1899                      ; 15E7 _ 05, 00000160(d)
        movzx   eax, byte [eax]                         ; 15EC _ 0F B6. 00
        mov     byte [ebp-19H], al                      ; 15EF _ 88. 45, E7
        cmp     byte [ebp-19H], 64                      ; 15F2 _ 80. 7D, E7, 40
        jnz     ?_064                                   ; 15F6 _ 75, 06
        mov     byte [ebp-19H], 0                       ; 15F8 _ C6. 45, E7, 00
        jmp     ?_067                                   ; 15FC _ EB, 1C

?_064:  cmp     byte [ebp-19H], 36                      ; 15FE _ 80. 7D, E7, 24
        jnz     ?_065                                   ; 1602 _ 75, 06
        mov     byte [ebp-19H], 15                      ; 1604 _ C6. 45, E7, 0F
        jmp     ?_067                                   ; 1608 _ EB, 10

?_065:  cmp     byte [ebp-19H], 81                      ; 160A _ 80. 7D, E7, 51
        jnz     ?_066                                   ; 160E _ 75, 06
        mov     byte [ebp-19H], 8                       ; 1610 _ C6. 45, E7, 08
        jmp     ?_067                                   ; 1614 _ EB, 04

?_066:  mov     byte [ebp-19H], 7                       ; 1616 _ C6. 45, E7, 07
?_067:  mov     eax, dword [ebp+0CH]                    ; 161A _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 161D _ 8B. 10
        mov     eax, dword [ebp-14H]                    ; 161F _ 8B. 45, EC
        lea     ecx, [eax+5H]                           ; 1622 _ 8D. 48, 05
        mov     eax, dword [ebp+0CH]                    ; 1625 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1628 _ 8B. 40, 04
        imul    ecx, eax                                ; 162B _ 0F AF. C8
        mov     eax, dword [ebp+0CH]                    ; 162E _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1631 _ 8B. 40, 04
        lea     ebx, [eax-15H]                          ; 1634 _ 8D. 58, EB
        mov     eax, dword [ebp-18H]                    ; 1637 _ 8B. 45, E8
        add     eax, ebx                                ; 163A _ 01. D8
        add     eax, ecx                                ; 163C _ 01. C8
        add     edx, eax                                ; 163E _ 01. C2
        movzx   eax, byte [ebp-19H]                     ; 1640 _ 0F B6. 45, E7
        mov     byte [edx], al                          ; 1644 _ 88. 02
        add     dword [ebp-18H], 1                      ; 1646 _ 83. 45, E8, 01
?_068:  cmp     dword [ebp-18H], 15                     ; 164A _ 83. 7D, E8, 0F
        jle     ?_063                                   ; 164E _ 7E, 8A
        add     dword [ebp-14H], 1                      ; 1650 _ 83. 45, EC, 01
?_069:  cmp     dword [ebp-14H], 13                     ; 1654 _ 83. 7D, EC, 0D
        jle     ?_062                                   ; 1658 _ 0F 8E, FFFFFF73
        nop                                             ; 165E _ 90
        mov     ebx, dword [ebp-4H]                     ; 165F _ 8B. 5D, FC
        leave                                           ; 1662 _ C9
        ret                                             ; 1663 _ C3
; make_window8 End of function

message_box:; Function begin
        push    ebp                                     ; 1664 _ 55
        mov     ebp, esp                                ; 1665 _ 89. E5
        sub     esp, 24                                 ; 1667 _ 83. EC, 18
        sub     esp, 12                                 ; 166A _ 83. EC, 0C
        push    dword [ebp+8H]                          ; 166D _ FF. 75, 08
        call    sheet_alloc                             ; 1670 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1675 _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 1678 _ 89. 45, F0
        mov     eax, dword [memman]                     ; 167B _ A1, 00000000(d)
        sub     esp, 8                                  ; 1680 _ 83. EC, 08
        push    10880                                   ; 1683 _ 68, 00002A80
        push    eax                                     ; 1688 _ 50
        call    memman_alloc_4k                         ; 1689 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 168E _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 1691 _ 89. 45, F4
        sub     esp, 12                                 ; 1694 _ 83. EC, 0C
        push    -1                                      ; 1697 _ 6A, FF
        push    68                                      ; 1699 _ 6A, 44
        push    160                                     ; 169B _ 68, 000000A0
        push    dword [ebp-0CH]                         ; 16A0 _ FF. 75, F4
        push    dword [ebp-10H]                         ; 16A3 _ FF. 75, F0
        call    sheet_setbuf                            ; 16A6 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 16AB _ 83. C4, 20
        sub     esp, 4                                  ; 16AE _ 83. EC, 04
        push    dword [ebp+0CH]                         ; 16B1 _ FF. 75, 0C
        push    dword [ebp-10H]                         ; 16B4 _ FF. 75, F0
        push    dword [ebp+8H]                          ; 16B7 _ FF. 75, 08
        call    make_window8                            ; 16BA _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 16BF _ 83. C4, 10
        sub     esp, 8                                  ; 16C2 _ 83. EC, 08
        push    ?_166                                   ; 16C5 _ 68, 00000076(d)
        push    0                                       ; 16CA _ 6A, 00
        push    28                                      ; 16CC _ 6A, 1C
        push    24                                      ; 16CE _ 6A, 18
        push    dword [ebp-10H]                         ; 16D0 _ FF. 75, F0
        push    dword [ebp+8H]                          ; 16D3 _ FF. 75, 08
        call    showString                              ; 16D6 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 16DB _ 83. C4, 20
        sub     esp, 8                                  ; 16DE _ 83. EC, 08
        push    ?_167                                   ; 16E1 _ 68, 00000082(d)
        push    0                                       ; 16E6 _ 6A, 00
        push    44                                      ; 16E8 _ 6A, 2C
        push    24                                      ; 16EA _ 6A, 18
        push    dword [ebp-10H]                         ; 16EC _ FF. 75, F0
        push    dword [ebp+8H]                          ; 16EF _ FF. 75, 08
        call    showString                              ; 16F2 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 16F7 _ 83. C4, 20
        push    72                                      ; 16FA _ 6A, 48
        push    80                                      ; 16FC _ 6A, 50
        push    dword [ebp-10H]                         ; 16FE _ FF. 75, F0
        push    dword [ebp+8H]                          ; 1701 _ FF. 75, 08
        call    sheet_slide                             ; 1704 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1709 _ 83. C4, 10
        sub     esp, 4                                  ; 170C _ 83. EC, 04
        push    1                                       ; 170F _ 6A, 01
        push    dword [ebp-10H]                         ; 1711 _ FF. 75, F0
        push    dword [ebp+8H]                          ; 1714 _ FF. 75, 08
        call    sheet_updown                            ; 1717 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 171C _ 83. C4, 10
        mov     eax, dword [ebp-10H]                    ; 171F _ 8B. 45, F0
        leave                                           ; 1722 _ C9
        ret                                             ; 1723 _ C3
; message_box End of function

intHandlerFromTimer:; Function begin
        push    ebp                                     ; 1724 _ 55
        mov     ebp, esp                                ; 1725 _ 89. E5
        sub     esp, 24                                 ; 1727 _ 83. EC, 18
        sub     esp, 8                                  ; 172A _ 83. EC, 08
        push    96                                      ; 172D _ 6A, 60
        push    32                                      ; 172F _ 6A, 20
        call    io_out8                                 ; 1731 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1736 _ 83. C4, 10
        mov     eax, dword [timerctl]                   ; 1739 _ A1, 00000208(d)
        mov     edx, dword [eax]                        ; 173E _ 8B. 10
        add     edx, 1                                  ; 1740 _ 83. C2, 01
        mov     dword [eax], edx                        ; 1743 _ 89. 10
        mov     dword [ebp-0CH], 0                      ; 1745 _ C7. 45, F4, 00000000
        jmp     ?_072                                   ; 174C _ E9, 00000088

?_070:  mov     eax, dword [timerctl]                   ; 1751 _ A1, 00000208(d)
        mov     edx, dword [ebp-0CH]                    ; 1756 _ 8B. 55, F4
        shl     edx, 4                                  ; 1759 _ C1. E2, 04
        add     eax, edx                                ; 175C _ 01. D0
        add     eax, 4                                  ; 175E _ 83. C0, 04
        mov     eax, dword [eax]                        ; 1761 _ 8B. 00
        cmp     eax, 2                                  ; 1763 _ 83. F8, 02
        jnz     ?_071                                   ; 1766 _ 75, 6D
        mov     eax, dword [timerctl]                   ; 1768 _ A1, 00000208(d)
        mov     edx, dword [ebp-0CH]                    ; 176D _ 8B. 55, F4
        shl     edx, 4                                  ; 1770 _ C1. E2, 04
        add     edx, eax                                ; 1773 _ 01. C2
        add     edx, 8                                  ; 1775 _ 83. C2, 08
        mov     edx, dword [edx]                        ; 1778 _ 8B. 12
        sub     edx, 1                                  ; 177A _ 83. EA, 01
        mov     ecx, dword [ebp-0CH]                    ; 177D _ 8B. 4D, F4
        shl     ecx, 4                                  ; 1780 _ C1. E1, 04
        add     eax, ecx                                ; 1783 _ 01. C8
        add     eax, 8                                  ; 1785 _ 83. C0, 08
        mov     dword [eax], edx                        ; 1788 _ 89. 10
        mov     eax, dword [timerctl]                   ; 178A _ A1, 00000208(d)
        mov     edx, dword [ebp-0CH]                    ; 178F _ 8B. 55, F4
        shl     edx, 4                                  ; 1792 _ C1. E2, 04
        add     eax, edx                                ; 1795 _ 01. D0
        add     eax, 8                                  ; 1797 _ 83. C0, 08
        mov     eax, dword [eax]                        ; 179A _ 8B. 00
        test    eax, eax                                ; 179C _ 85. C0
        jnz     ?_071                                   ; 179E _ 75, 35
        mov     eax, dword [timerctl]                   ; 17A0 _ A1, 00000208(d)
        mov     edx, dword [ebp-0CH]                    ; 17A5 _ 8B. 55, F4
        shl     edx, 4                                  ; 17A8 _ C1. E2, 04
        add     eax, edx                                ; 17AB _ 01. D0
        add     eax, 16                                 ; 17AD _ 83. C0, 10
        movzx   eax, byte [eax]                         ; 17B0 _ 0F B6. 00
        movzx   edx, al                                 ; 17B3 _ 0F B6. D0
        mov     eax, dword [timerctl]                   ; 17B6 _ A1, 00000208(d)
        mov     ecx, dword [ebp-0CH]                    ; 17BB _ 8B. 4D, F4
        shl     ecx, 4                                  ; 17BE _ C1. E1, 04
        add     eax, ecx                                ; 17C1 _ 01. C8
        add     eax, 12                                 ; 17C3 _ 83. C0, 0C
        mov     eax, dword [eax]                        ; 17C6 _ 8B. 00
        sub     esp, 8                                  ; 17C8 _ 83. EC, 08
        push    edx                                     ; 17CB _ 52
        push    eax                                     ; 17CC _ 50
        call    fifo8_put                               ; 17CD _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 17D2 _ 83. C4, 10
?_071:  add     dword [ebp-0CH], 1                      ; 17D5 _ 83. 45, F4, 01
?_072:  cmp     dword [ebp-0CH], 499                    ; 17D9 _ 81. 7D, F4, 000001F3
        jle     ?_070                                   ; 17E0 _ 0F 8E, FFFFFF6B
        nop                                             ; 17E6 _ 90
        leave                                           ; 17E7 _ C9
        ret                                             ; 17E8 _ C3
; intHandlerFromTimer End of function

memman_init:; Function begin
        push    ebp                                     ; 17E9 _ 55
        mov     ebp, esp                                ; 17EA _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 17EC _ 8B. 45, 08
        mov     dword [eax], 0                          ; 17EF _ C7. 00, 00000000
        mov     eax, dword [ebp+8H]                     ; 17F5 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 17F8 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 17FF _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 1802 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 1809 _ 8B. 45, 08
        mov     dword [eax+0CH], 0                      ; 180C _ C7. 40, 0C, 00000000
        nop                                             ; 1813 _ 90
        pop     ebp                                     ; 1814 _ 5D
        ret                                             ; 1815 _ C3
; memman_init End of function

memman_total:; Function begin
        push    ebp                                     ; 1816 _ 55
        mov     ebp, esp                                ; 1817 _ 89. E5
        sub     esp, 16                                 ; 1819 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 181C _ C7. 45, FC, 00000000
        mov     dword [ebp-8H], 0                       ; 1823 _ C7. 45, F8, 00000000
        jmp     ?_074                                   ; 182A _ EB, 14

?_073:  mov     eax, dword [ebp+8H]                     ; 182C _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 182F _ 8B. 55, F8
        add     edx, 2                                  ; 1832 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 1835 _ 8B. 44 D0, 04
        add     dword [ebp-4H], eax                     ; 1839 _ 01. 45, FC
        add     dword [ebp-8H], 1                       ; 183C _ 83. 45, F8, 01
?_074:  mov     eax, dword [ebp+8H]                     ; 1840 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1843 _ 8B. 00
        cmp     dword [ebp-8H], eax                     ; 1845 _ 39. 45, F8
        jc      ?_073                                   ; 1848 _ 72, E2
        mov     eax, dword [ebp-4H]                     ; 184A _ 8B. 45, FC
        leave                                           ; 184D _ C9
        ret                                             ; 184E _ C3
; memman_total End of function

memman_alloc:; Function begin
        push    ebp                                     ; 184F _ 55
        mov     ebp, esp                                ; 1850 _ 89. E5
        sub     esp, 16                                 ; 1852 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 1855 _ C7. 45, F8, 00000000
        jmp     ?_078                                   ; 185C _ E9, 00000085

?_075:  mov     eax, dword [ebp+8H]                     ; 1861 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1864 _ 8B. 55, F8
        add     edx, 2                                  ; 1867 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 186A _ 8B. 44 D0, 04
        cmp     dword [ebp+0CH], eax                    ; 186E _ 39. 45, 0C
        ja      ?_077                                   ; 1871 _ 77, 6F
        mov     eax, dword [ebp+8H]                     ; 1873 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1876 _ 8B. 55, F8
        add     edx, 2                                  ; 1879 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 187C _ 8B. 04 D0
        mov     dword [ebp-4H], eax                     ; 187F _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 1882 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1885 _ 8B. 55, F8
        add     edx, 2                                  ; 1888 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 188B _ 8B. 14 D0
        mov     eax, dword [ebp+0CH]                    ; 188E _ 8B. 45, 0C
        lea     ecx, [edx+eax]                          ; 1891 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1894 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1897 _ 8B. 55, F8
        add     edx, 2                                  ; 189A _ 83. C2, 02
        mov     dword [eax+edx*8], ecx                  ; 189D _ 89. 0C D0
        mov     eax, dword [ebp+8H]                     ; 18A0 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 18A3 _ 8B. 55, F8
        add     edx, 2                                  ; 18A6 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 18A9 _ 8B. 44 D0, 04
        sub     eax, dword [ebp+0CH]                    ; 18AD _ 2B. 45, 0C
        mov     edx, eax                                ; 18B0 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 18B2 _ 8B. 45, 08
        mov     ecx, dword [ebp-8H]                     ; 18B5 _ 8B. 4D, F8
        add     ecx, 2                                  ; 18B8 _ 83. C1, 02
        mov     dword [eax+ecx*8+4H], edx               ; 18BB _ 89. 54 C8, 04
        mov     eax, dword [ebp+8H]                     ; 18BF _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 18C2 _ 8B. 55, F8
        add     edx, 2                                  ; 18C5 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 18C8 _ 8B. 44 D0, 04
        test    eax, eax                                ; 18CC _ 85. C0
        jnz     ?_076                                   ; 18CE _ 75, 0D
        mov     eax, dword [ebp+8H]                     ; 18D0 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 18D3 _ 8B. 00
        lea     edx, [eax-1H]                           ; 18D5 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 18D8 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 18DB _ 89. 10
?_076:  mov     eax, dword [ebp-4H]                     ; 18DD _ 8B. 45, FC
        jmp     ?_079                                   ; 18E0 _ EB, 17

?_077:  add     dword [ebp-8H], 1                       ; 18E2 _ 83. 45, F8, 01
?_078:  mov     eax, dword [ebp+8H]                     ; 18E6 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 18E9 _ 8B. 00
        cmp     dword [ebp-8H], eax                     ; 18EB _ 39. 45, F8
        jc      ?_075                                   ; 18EE _ 0F 82, FFFFFF6D
        mov     eax, 0                                  ; 18F4 _ B8, 00000000
?_079:  leave                                           ; 18F9 _ C9
        ret                                             ; 18FA _ C3
; memman_alloc End of function

memman_free:; Function begin
        push    ebp                                     ; 18FB _ 55
        mov     ebp, esp                                ; 18FC _ 89. E5
        push    ebx                                     ; 18FE _ 53
        sub     esp, 16                                 ; 18FF _ 83. EC, 10
        mov     dword [ebp-0CH], 0                      ; 1902 _ C7. 45, F4, 00000000
        jmp     ?_081                                   ; 1909 _ EB, 15

?_080:  mov     eax, dword [ebp+8H]                     ; 190B _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 190E _ 8B. 55, F4
        add     edx, 2                                  ; 1911 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 1914 _ 8B. 04 D0
        cmp     dword [ebp+0CH], eax                    ; 1917 _ 39. 45, 0C
        jc      ?_082                                   ; 191A _ 72, 10
        add     dword [ebp-0CH], 1                      ; 191C _ 83. 45, F4, 01
?_081:  mov     eax, dword [ebp+8H]                     ; 1920 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1923 _ 8B. 00
        cmp     dword [ebp-0CH], eax                    ; 1925 _ 39. 45, F4
        jl      ?_080                                   ; 1928 _ 7C, E1
        jmp     ?_083                                   ; 192A _ EB, 01

?_082:  nop                                             ; 192C _ 90
?_083:  cmp     dword [ebp-0CH], 0                      ; 192D _ 83. 7D, F4, 00
        jle     ?_085                                   ; 1931 _ 0F 8E, 000000B9
        mov     eax, dword [ebp-0CH]                    ; 1937 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 193A _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 193D _ 8B. 45, 08
        add     edx, 2                                  ; 1940 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 1943 _ 8B. 14 D0
        mov     eax, dword [ebp-0CH]                    ; 1946 _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 1949 _ 8D. 48, FF
        mov     eax, dword [ebp+8H]                     ; 194C _ 8B. 45, 08
        add     ecx, 2                                  ; 194F _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 1952 _ 8B. 44 C8, 04
        add     eax, edx                                ; 1956 _ 01. D0
        cmp     dword [ebp+0CH], eax                    ; 1958 _ 39. 45, 0C
        jne     ?_085                                   ; 195B _ 0F 85, 0000008F
        mov     eax, dword [ebp-0CH]                    ; 1961 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1964 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1967 _ 8B. 45, 08
        add     edx, 2                                  ; 196A _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 196D _ 8B. 54 D0, 04
        mov     eax, dword [ebp-0CH]                    ; 1971 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 1974 _ 8D. 58, FF
        mov     eax, dword [ebp+10H]                    ; 1977 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 197A _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 197D _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 1980 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 1983 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 1987 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 198A _ 8B. 00
        test    eax, eax                                ; 198C _ 85. C0
        jle     ?_084                                   ; 198E _ 7E, 56
        mov     edx, dword [ebp+0CH]                    ; 1990 _ 8B. 55, 0C
        mov     eax, dword [ebp+10H]                    ; 1993 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 1996 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1999 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 199C _ 8B. 55, F4
        add     edx, 2                                  ; 199F _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 19A2 _ 8B. 04 D0
        cmp     ecx, eax                                ; 19A5 _ 39. C1
        jnz     ?_084                                   ; 19A7 _ 75, 3D
        mov     eax, dword [ebp-0CH]                    ; 19A9 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 19AC _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 19AF _ 8B. 45, 08
        add     edx, 2                                  ; 19B2 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 19B5 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+8H]                     ; 19B9 _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 19BC _ 8B. 4D, F4
        add     ecx, 2                                  ; 19BF _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 19C2 _ 8B. 44 C8, 04
        mov     ecx, dword [ebp-0CH]                    ; 19C6 _ 8B. 4D, F4
        lea     ebx, [ecx-1H]                           ; 19C9 _ 8D. 59, FF
        lea     ecx, [edx+eax]                          ; 19CC _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 19CF _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 19D2 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 19D5 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 19D9 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 19DC _ 8B. 00
        lea     edx, [eax-1H]                           ; 19DE _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 19E1 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 19E4 _ 89. 10
?_084:  mov     eax, 0                                  ; 19E6 _ B8, 00000000
        jmp     ?_091                                   ; 19EB _ E9, 0000011B

?_085:  mov     eax, dword [ebp+8H]                     ; 19F0 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 19F3 _ 8B. 00
        test    eax, eax                                ; 19F5 _ 85. C0
        jle     ?_086                                   ; 19F7 _ 7E, 52
        mov     edx, dword [ebp+0CH]                    ; 19F9 _ 8B. 55, 0C
        mov     eax, dword [ebp+10H]                    ; 19FC _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 19FF _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1A02 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1A05 _ 8B. 55, F4
        add     edx, 2                                  ; 1A08 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 1A0B _ 8B. 04 D0
        cmp     ecx, eax                                ; 1A0E _ 39. C1
        jnz     ?_086                                   ; 1A10 _ 75, 39
        mov     eax, dword [ebp+8H]                     ; 1A12 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1A15 _ 8B. 55, F4
        add     edx, 2                                  ; 1A18 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 1A1B _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 1A1F _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 1A22 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1A25 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1A28 _ 8B. 55, F4
        add     edx, 2                                  ; 1A2B _ 83. C2, 02
        mov     dword [eax+edx*8+4H], ecx               ; 1A2E _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 1A32 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1A35 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 1A38 _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 1A3B _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 1A3E _ 89. 14 C8
        mov     eax, 0                                  ; 1A41 _ B8, 00000000
        jmp     ?_091                                   ; 1A46 _ E9, 000000C0

?_086:  mov     eax, dword [ebp+8H]                     ; 1A4B _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1A4E _ 8B. 00
        cmp     eax, 4095                               ; 1A50 _ 3D, 00000FFF
        jg      ?_090                                   ; 1A55 _ 0F 8F, 00000087
        mov     eax, dword [ebp+8H]                     ; 1A5B _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1A5E _ 8B. 00
        lea     edx, [eax+1H]                           ; 1A60 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1A63 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 1A66 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 1A68 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1A6B _ 8B. 00
        mov     dword [ebp-8H], eax                     ; 1A6D _ 89. 45, F8
        jmp     ?_088                                   ; 1A70 _ EB, 28

?_087:  mov     eax, dword [ebp-8H]                     ; 1A72 _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 1A75 _ 8D. 50, FF
        mov     ecx, dword [ebp+8H]                     ; 1A78 _ 8B. 4D, 08
        mov     eax, dword [ebp-8H]                     ; 1A7B _ 8B. 45, F8
        lea     ebx, [eax+2H]                           ; 1A7E _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 1A81 _ 8B. 45, 08
        add     edx, 2                                  ; 1A84 _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 1A87 _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 1A8A _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 1A8C _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 1A8F _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 1A92 _ 89. 54 D9, 04
        sub     dword [ebp-8H], 1                       ; 1A96 _ 83. 6D, F8, 01
?_088:  mov     eax, dword [ebp-8H]                     ; 1A9A _ 8B. 45, F8
        cmp     eax, dword [ebp-0CH]                    ; 1A9D _ 3B. 45, F4
        jg      ?_087                                   ; 1AA0 _ 7F, D0
        mov     eax, dword [ebp+8H]                     ; 1AA2 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1AA5 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1AA8 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1AAB _ 8B. 00
        cmp     edx, eax                                ; 1AAD _ 39. C2
        jge     ?_089                                   ; 1AAF _ 7D, 0B
        mov     eax, dword [ebp+8H]                     ; 1AB1 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 1AB4 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 1AB6 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 1AB9 _ 89. 50, 04
?_089:  mov     eax, dword [ebp+8H]                     ; 1ABC _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1ABF _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 1AC2 _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 1AC5 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 1AC8 _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 1ACB _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1ACE _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 1AD1 _ 8D. 4A, 02
        mov     edx, dword [ebp+10H]                    ; 1AD4 _ 8B. 55, 10
        mov     dword [eax+ecx*8+4H], edx               ; 1AD7 _ 89. 54 C8, 04
        mov     eax, 0                                  ; 1ADB _ B8, 00000000
        jmp     ?_091                                   ; 1AE0 _ EB, 29

?_090:  mov     eax, dword [ebp+8H]                     ; 1AE2 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1AE5 _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 1AE8 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1AEB _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 1AEE _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 1AF1 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 1AF4 _ 8B. 40, 08
        mov     edx, eax                                ; 1AF7 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 1AF9 _ 8B. 45, 10
        add     eax, edx                                ; 1AFC _ 01. D0
        mov     edx, eax                                ; 1AFE _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1B00 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 1B03 _ 89. 50, 08
        mov     eax, 4294967295                         ; 1B06 _ B8, FFFFFFFF
?_091:  add     esp, 16                                 ; 1B0B _ 83. C4, 10
        pop     ebx                                     ; 1B0E _ 5B
        pop     ebp                                     ; 1B0F _ 5D
        ret                                             ; 1B10 _ C3
; memman_free End of function

memman_alloc_4k:; Function begin
        push    ebp                                     ; 1B11 _ 55
        mov     ebp, esp                                ; 1B12 _ 89. E5
        sub     esp, 16                                 ; 1B14 _ 83. EC, 10
        mov     eax, dword [ebp+0CH]                    ; 1B17 _ 8B. 45, 0C
        add     eax, 4095                               ; 1B1A _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 1B1F _ 25, FFFFF000
        mov     dword [ebp+0CH], eax                    ; 1B24 _ 89. 45, 0C
        push    dword [ebp+0CH]                         ; 1B27 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1B2A _ FF. 75, 08
        call    memman_alloc                            ; 1B2D _ E8, FFFFFFFC(rel)
        add     esp, 8                                  ; 1B32 _ 83. C4, 08
        mov     dword [ebp-4H], eax                     ; 1B35 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 1B38 _ 8B. 45, FC
        leave                                           ; 1B3B _ C9
        ret                                             ; 1B3C _ C3
; memman_alloc_4k End of function

memman_free_4k:; Function begin
        push    ebp                                     ; 1B3D _ 55
        mov     ebp, esp                                ; 1B3E _ 89. E5
        sub     esp, 16                                 ; 1B40 _ 83. EC, 10
        mov     eax, dword [ebp+10H]                    ; 1B43 _ 8B. 45, 10
        add     eax, 4095                               ; 1B46 _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 1B4B _ 25, FFFFF000
        mov     dword [ebp+10H], eax                    ; 1B50 _ 89. 45, 10
        push    dword [ebp+10H]                         ; 1B53 _ FF. 75, 10
        push    dword [ebp+0CH]                         ; 1B56 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1B59 _ FF. 75, 08
        call    memman_free                             ; 1B5C _ E8, FFFFFFFC(rel)
        add     esp, 12                                 ; 1B61 _ 83. C4, 0C
        mov     dword [ebp-4H], eax                     ; 1B64 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 1B67 _ 8B. 45, FC
        leave                                           ; 1B6A _ C9
        ret                                             ; 1B6B _ C3
; memman_free_4k End of function

shtctl_init:; Function begin
        push    ebp                                     ; 1B6C _ 55
        mov     ebp, esp                                ; 1B6D _ 89. E5
        sub     esp, 24                                 ; 1B6F _ 83. EC, 18
        sub     esp, 8                                  ; 1B72 _ 83. EC, 08
        push    9232                                    ; 1B75 _ 68, 00002410
        push    dword [ebp+8H]                          ; 1B7A _ FF. 75, 08
        call    memman_alloc_4k                         ; 1B7D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1B82 _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 1B85 _ 89. 45, F4
        cmp     dword [ebp-0CH], 0                      ; 1B88 _ 83. 7D, F4, 00
        jnz     ?_092                                   ; 1B8C _ 75, 0A
        mov     eax, 0                                  ; 1B8E _ B8, 00000000
        jmp     ?_096                                   ; 1B93 _ E9, 0000009A

?_092:  mov     eax, dword [ebp-0CH]                    ; 1B98 _ 8B. 45, F4
        mov     edx, dword [ebp+0CH]                    ; 1B9B _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 1B9E _ 89. 10
        mov     eax, dword [ebp-0CH]                    ; 1BA0 _ 8B. 45, F4
        mov     edx, dword [ebp+10H]                    ; 1BA3 _ 8B. 55, 10
        mov     dword [eax+8H], edx                     ; 1BA6 _ 89. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 1BA9 _ 8B. 45, F4
        mov     edx, dword [ebp+14H]                    ; 1BAC _ 8B. 55, 14
        mov     dword [eax+0CH], edx                    ; 1BAF _ 89. 50, 0C
        mov     eax, dword [ebp-0CH]                    ; 1BB2 _ 8B. 45, F4
        mov     dword [eax+10H], -1                     ; 1BB5 _ C7. 40, 10, FFFFFFFF
        mov     dword [ebp-10H], 0                      ; 1BBC _ C7. 45, F0, 00000000
        jmp     ?_094                                   ; 1BC3 _ EB, 1B

?_093:  mov     eax, dword [ebp-0CH]                    ; 1BC5 _ 8B. 45, F4
        mov     edx, dword [ebp-10H]                    ; 1BC8 _ 8B. 55, F0
        add     edx, 33                                 ; 1BCB _ 83. C2, 21
        shl     edx, 5                                  ; 1BCE _ C1. E2, 05
        add     eax, edx                                ; 1BD1 _ 01. D0
        add     eax, 16                                 ; 1BD3 _ 83. C0, 10
        mov     dword [eax], 0                          ; 1BD6 _ C7. 00, 00000000
        add     dword [ebp-10H], 1                      ; 1BDC _ 83. 45, F0, 01
?_094:  cmp     dword [ebp-10H], 255                    ; 1BE0 _ 81. 7D, F0, 000000FF
        jle     ?_093                                   ; 1BE7 _ 7E, DC
        mov     eax, dword [ebp+10H]                    ; 1BE9 _ 8B. 45, 10
        imul    eax, dword [ebp+14H]                    ; 1BEC _ 0F AF. 45, 14
        sub     esp, 8                                  ; 1BF0 _ 83. EC, 08
        push    eax                                     ; 1BF3 _ 50
        push    dword [ebp+8H]                          ; 1BF4 _ FF. 75, 08
        call    memman_alloc_4k                         ; 1BF7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1BFC _ 83. C4, 10
        mov     edx, eax                                ; 1BFF _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 1C01 _ 8B. 45, F4
        mov     dword [eax+4H], edx                     ; 1C04 _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 1C07 _ 8B. 45, F4
        mov     eax, dword [eax+4H]                     ; 1C0A _ 8B. 40, 04
        test    eax, eax                                ; 1C0D _ 85. C0
        jnz     ?_095                                   ; 1C0F _ 75, 1E
        mov     eax, dword [ebp-0CH]                    ; 1C11 _ 8B. 45, F4
        sub     esp, 4                                  ; 1C14 _ 83. EC, 04
        push    9232                                    ; 1C17 _ 68, 00002410
        push    eax                                     ; 1C1C _ 50
        push    dword [ebp+8H]                          ; 1C1D _ FF. 75, 08
        call    memman_free_4k                          ; 1C20 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1C25 _ 83. C4, 10
        mov     eax, 0                                  ; 1C28 _ B8, 00000000
        jmp     ?_096                                   ; 1C2D _ EB, 03

?_095:  mov     eax, dword [ebp-0CH]                    ; 1C2F _ 8B. 45, F4
?_096:  leave                                           ; 1C32 _ C9
        ret                                             ; 1C33 _ C3
; shtctl_init End of function

sheet_alloc:; Function begin
        push    ebp                                     ; 1C34 _ 55
        mov     ebp, esp                                ; 1C35 _ 89. E5
        sub     esp, 16                                 ; 1C37 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 1C3A _ C7. 45, F8, 00000000
        jmp     ?_099                                   ; 1C41 _ EB, 5B

?_097:  mov     eax, dword [ebp+8H]                     ; 1C43 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1C46 _ 8B. 55, F8
        add     edx, 33                                 ; 1C49 _ 83. C2, 21
        shl     edx, 5                                  ; 1C4C _ C1. E2, 05
        add     eax, edx                                ; 1C4F _ 01. D0
        add     eax, 16                                 ; 1C51 _ 83. C0, 10
        mov     eax, dword [eax]                        ; 1C54 _ 8B. 00
        test    eax, eax                                ; 1C56 _ 85. C0
        jnz     ?_098                                   ; 1C58 _ 75, 40
        mov     eax, dword [ebp-8H]                     ; 1C5A _ 8B. 45, F8
        shl     eax, 5                                  ; 1C5D _ C1. E0, 05
        lea     edx, [eax+410H]                         ; 1C60 _ 8D. 90, 00000410
        mov     eax, dword [ebp+8H]                     ; 1C66 _ 8B. 45, 08
        add     eax, edx                                ; 1C69 _ 01. D0
        add     eax, 4                                  ; 1C6B _ 83. C0, 04
        mov     dword [ebp-4H], eax                     ; 1C6E _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 1C71 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1C74 _ 8B. 55, F8
        lea     ecx, [edx+4H]                           ; 1C77 _ 8D. 4A, 04
        mov     edx, dword [ebp-4H]                     ; 1C7A _ 8B. 55, FC
        mov     dword [eax+ecx*4+4H], edx               ; 1C7D _ 89. 54 88, 04
        mov     eax, dword [ebp-4H]                     ; 1C81 _ 8B. 45, FC
        mov     dword [eax+1CH], 1                      ; 1C84 _ C7. 40, 1C, 00000001
        mov     eax, dword [ebp-4H]                     ; 1C8B _ 8B. 45, FC
        mov     dword [eax+18H], -1                     ; 1C8E _ C7. 40, 18, FFFFFFFF
        mov     eax, dword [ebp-4H]                     ; 1C95 _ 8B. 45, FC
        jmp     ?_100                                   ; 1C98 _ EB, 12

?_098:  add     dword [ebp-8H], 1                       ; 1C9A _ 83. 45, F8, 01
?_099:  cmp     dword [ebp-8H], 255                     ; 1C9E _ 81. 7D, F8, 000000FF
        jle     ?_097                                   ; 1CA5 _ 7E, 9C
        mov     eax, 0                                  ; 1CA7 _ B8, 00000000
?_100:  leave                                           ; 1CAC _ C9
        ret                                             ; 1CAD _ C3
; sheet_alloc End of function

sheet_setbuf:; Function begin
        push    ebp                                     ; 1CAE _ 55
        mov     ebp, esp                                ; 1CAF _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 1CB1 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 1CB4 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 1CB7 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 1CB9 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 1CBC _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 1CBF _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1CC2 _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 1CC5 _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 1CC8 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 1CCB _ 8B. 45, 08
        mov     edx, dword [ebp+18H]                    ; 1CCE _ 8B. 55, 18
        mov     dword [eax+14H], edx                    ; 1CD1 _ 89. 50, 14
        nop                                             ; 1CD4 _ 90
        pop     ebp                                     ; 1CD5 _ 5D
        ret                                             ; 1CD6 _ C3
; sheet_setbuf End of function

sheet_updown:; Function begin
        push    ebp                                     ; 1CD7 _ 55
        mov     ebp, esp                                ; 1CD8 _ 89. E5
        push    esi                                     ; 1CDA _ 56
        push    ebx                                     ; 1CDB _ 53
        sub     esp, 16                                 ; 1CDC _ 83. EC, 10
        mov     eax, dword [ebp+0CH]                    ; 1CDF _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 1CE2 _ 8B. 40, 18
        mov     dword [ebp-0CH], eax                    ; 1CE5 _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 1CE8 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 1CEB _ 8B. 40, 10
        add     eax, 1                                  ; 1CEE _ 83. C0, 01
        cmp     dword [ebp+10H], eax                    ; 1CF1 _ 39. 45, 10
        jle     ?_101                                   ; 1CF4 _ 7E, 0C
        mov     eax, dword [ebp+8H]                     ; 1CF6 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 1CF9 _ 8B. 40, 10
        add     eax, 1                                  ; 1CFC _ 83. C0, 01
        mov     dword [ebp+10H], eax                    ; 1CFF _ 89. 45, 10
?_101:  cmp     dword [ebp+10H], -1                     ; 1D02 _ 83. 7D, 10, FF
        jge     ?_102                                   ; 1D06 _ 7D, 07
        mov     dword [ebp+10H], -1                     ; 1D08 _ C7. 45, 10, FFFFFFFF
?_102:  mov     eax, dword [ebp+0CH]                    ; 1D0F _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 1D12 _ 8B. 55, 10
        mov     dword [eax+18H], edx                    ; 1D15 _ 89. 50, 18
        mov     eax, dword [ebp-0CH]                    ; 1D18 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 1D1B _ 3B. 45, 10
        jle     ?_109                                   ; 1D1E _ 0F 8E, 000001CB
        cmp     dword [ebp+10H], 0                      ; 1D24 _ 83. 7D, 10, 00
        js      ?_105                                   ; 1D28 _ 0F 88, 000000DF
        mov     eax, dword [ebp-0CH]                    ; 1D2E _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 1D31 _ 89. 45, F0
        jmp     ?_104                                   ; 1D34 _ EB, 34

?_103:  mov     eax, dword [ebp-10H]                    ; 1D36 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 1D39 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1D3C _ 8B. 45, 08
        add     edx, 4                                  ; 1D3F _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 1D42 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 1D46 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 1D49 _ 8B. 4D, F0
        add     ecx, 4                                  ; 1D4C _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 1D4F _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 1D53 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 1D56 _ 8B. 55, F0
        add     edx, 4                                  ; 1D59 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 1D5C _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 1D60 _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 1D63 _ 89. 50, 18
        sub     dword [ebp-10H], 1                      ; 1D66 _ 83. 6D, F0, 01
?_104:  mov     eax, dword [ebp-10H]                    ; 1D6A _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 1D6D _ 3B. 45, 10
        jg      ?_103                                   ; 1D70 _ 7F, C4
        mov     eax, dword [ebp+8H]                     ; 1D72 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 1D75 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 1D78 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 1D7B _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 1D7E _ 89. 54 88, 04
        mov     eax, dword [ebp+10H]                    ; 1D82 _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 1D85 _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 1D88 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1D8B _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1D8E _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 1D91 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 1D94 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 1D97 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 1D9A _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 1D9D _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1DA0 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 1DA3 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 1DA6 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1DA9 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1DAC _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 1DAF _ 8B. 40, 0C
        sub     esp, 8                                  ; 1DB2 _ 83. EC, 08
        push    esi                                     ; 1DB5 _ 56
        push    ebx                                     ; 1DB6 _ 53
        push    ecx                                     ; 1DB7 _ 51
        push    edx                                     ; 1DB8 _ 52
        push    eax                                     ; 1DB9 _ 50
        push    dword [ebp+8H]                          ; 1DBA _ FF. 75, 08
        call    sheet_refreshmap                        ; 1DBD _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1DC2 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 1DC5 _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 1DC8 _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 1DCB _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1DCE _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1DD1 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 1DD4 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 1DD7 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 1DDA _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 1DDD _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 1DE0 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1DE3 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 1DE6 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 1DE9 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1DEC _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1DEF _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 1DF2 _ 8B. 40, 0C
        sub     esp, 8                                  ; 1DF5 _ 83. EC, 08
        push    esi                                     ; 1DF8 _ 56
        push    ebx                                     ; 1DF9 _ 53
        push    ecx                                     ; 1DFA _ 51
        push    edx                                     ; 1DFB _ 52
        push    eax                                     ; 1DFC _ 50
        push    dword [ebp+8H]                          ; 1DFD _ FF. 75, 08
        call    sheet_refreshsub                        ; 1E00 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1E05 _ 83. C4, 20
        jmp     ?_116                                   ; 1E08 _ E9, 00000238

?_105:  mov     eax, dword [ebp+8H]                     ; 1E0D _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 1E10 _ 8B. 40, 10
        cmp     dword [ebp-0CH], eax                    ; 1E13 _ 39. 45, F4
        jge     ?_108                                   ; 1E16 _ 7D, 47
        mov     eax, dword [ebp-0CH]                    ; 1E18 _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 1E1B _ 89. 45, F0
        jmp     ?_107                                   ; 1E1E _ EB, 34

?_106:  mov     eax, dword [ebp-10H]                    ; 1E20 _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 1E23 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1E26 _ 8B. 45, 08
        add     edx, 4                                  ; 1E29 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 1E2C _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 1E30 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 1E33 _ 8B. 4D, F0
        add     ecx, 4                                  ; 1E36 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 1E39 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 1E3D _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 1E40 _ 8B. 55, F0
        add     edx, 4                                  ; 1E43 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 1E46 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 1E4A _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 1E4D _ 89. 50, 18
        add     dword [ebp-10H], 1                      ; 1E50 _ 83. 45, F0, 01
?_107:  mov     eax, dword [ebp+8H]                     ; 1E54 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 1E57 _ 8B. 40, 10
        cmp     dword [ebp-10H], eax                    ; 1E5A _ 39. 45, F0
        jl      ?_106                                   ; 1E5D _ 7C, C1
?_108:  mov     eax, dword [ebp+8H]                     ; 1E5F _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 1E62 _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 1E65 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1E68 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 1E6B _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1E6E _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1E71 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1E74 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 1E77 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 1E7A _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 1E7D _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 1E80 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 1E83 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1E86 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 1E89 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 1E8C _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1E8F _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1E92 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 1E95 _ 8B. 40, 0C
        sub     esp, 8                                  ; 1E98 _ 83. EC, 08
        push    0                                       ; 1E9B _ 6A, 00
        push    ebx                                     ; 1E9D _ 53
        push    ecx                                     ; 1E9E _ 51
        push    edx                                     ; 1E9F _ 52
        push    eax                                     ; 1EA0 _ 50
        push    dword [ebp+8H]                          ; 1EA1 _ FF. 75, 08
        call    sheet_refreshmap                        ; 1EA4 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1EA9 _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 1EAC _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1EAF _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1EB2 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 1EB5 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 1EB8 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 1EBB _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 1EBE _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 1EC1 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1EC4 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 1EC7 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 1ECA _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1ECD _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1ED0 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 1ED3 _ 8B. 40, 0C
        sub     esp, 8                                  ; 1ED6 _ 83. EC, 08
        push    0                                       ; 1ED9 _ 6A, 00
        push    ebx                                     ; 1EDB _ 53
        push    ecx                                     ; 1EDC _ 51
        push    edx                                     ; 1EDD _ 52
        push    eax                                     ; 1EDE _ 50
        push    dword [ebp+8H]                          ; 1EDF _ FF. 75, 08
        call    sheet_refreshsub                        ; 1EE2 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1EE7 _ 83. C4, 20
        jmp     ?_116                                   ; 1EEA _ E9, 00000156

?_109:  mov     eax, dword [ebp-0CH]                    ; 1EEF _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 1EF2 _ 3B. 45, 10
        jge     ?_116                                   ; 1EF5 _ 0F 8D, 0000014A
        cmp     dword [ebp-0CH], 0                      ; 1EFB _ 83. 7D, F4, 00
        js      ?_112                                   ; 1EFF _ 78, 56
        mov     eax, dword [ebp-0CH]                    ; 1F01 _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 1F04 _ 89. 45, F0
        jmp     ?_111                                   ; 1F07 _ EB, 34

?_110:  mov     eax, dword [ebp-10H]                    ; 1F09 _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 1F0C _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1F0F _ 8B. 45, 08
        add     edx, 4                                  ; 1F12 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 1F15 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 1F19 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 1F1C _ 8B. 4D, F0
        add     ecx, 4                                  ; 1F1F _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 1F22 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 1F26 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 1F29 _ 8B. 55, F0
        add     edx, 4                                  ; 1F2C _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 1F2F _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 1F33 _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 1F36 _ 89. 50, 18
        add     dword [ebp-10H], 1                      ; 1F39 _ 83. 45, F0, 01
?_111:  mov     eax, dword [ebp-10H]                    ; 1F3D _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 1F40 _ 3B. 45, 10
        jl      ?_110                                   ; 1F43 _ 7C, C4
        mov     eax, dword [ebp+8H]                     ; 1F45 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 1F48 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 1F4B _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 1F4E _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 1F51 _ 89. 54 88, 04
        jmp     ?_115                                   ; 1F55 _ EB, 6C

?_112:  mov     eax, dword [ebp+8H]                     ; 1F57 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 1F5A _ 8B. 40, 10
        mov     dword [ebp-10H], eax                    ; 1F5D _ 89. 45, F0
        jmp     ?_114                                   ; 1F60 _ EB, 3A

?_113:  mov     eax, dword [ebp-10H]                    ; 1F62 _ 8B. 45, F0
        lea     ecx, [eax+1H]                           ; 1F65 _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 1F68 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 1F6B _ 8B. 55, F0
        add     edx, 4                                  ; 1F6E _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 1F71 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 1F75 _ 8B. 45, 08
        add     ecx, 4                                  ; 1F78 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 1F7B _ 89. 54 88, 04
        mov     eax, dword [ebp-10H]                    ; 1F7F _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 1F82 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1F85 _ 8B. 45, 08
        add     edx, 4                                  ; 1F88 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 1F8B _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 1F8F _ 8B. 55, F0
        add     edx, 1                                  ; 1F92 _ 83. C2, 01
        mov     dword [eax+18H], edx                    ; 1F95 _ 89. 50, 18
        sub     dword [ebp-10H], 1                      ; 1F98 _ 83. 6D, F0, 01
?_114:  mov     eax, dword [ebp-10H]                    ; 1F9C _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 1F9F _ 3B. 45, 10
        jge     ?_113                                   ; 1FA2 _ 7D, BE
        mov     eax, dword [ebp+8H]                     ; 1FA4 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 1FA7 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 1FAA _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 1FAD _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 1FB0 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 1FB4 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 1FB7 _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 1FBA _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1FBD _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 1FC0 _ 89. 50, 10
?_115:  mov     eax, dword [ebp+0CH]                    ; 1FC3 _ 8B. 45, 0C
        mov     ecx, dword [eax+18H]                    ; 1FC6 _ 8B. 48, 18
        mov     eax, dword [ebp+0CH]                    ; 1FC9 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1FCC _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1FCF _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 1FD2 _ 8B. 40, 08
        lea     esi, [edx+eax]                          ; 1FD5 _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 1FD8 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 1FDB _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 1FDE _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1FE1 _ 8B. 40, 04
        lea     ebx, [edx+eax]                          ; 1FE4 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 1FE7 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1FEA _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1FED _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 1FF0 _ 8B. 40, 0C
        sub     esp, 8                                  ; 1FF3 _ 83. EC, 08
        push    ecx                                     ; 1FF6 _ 51
        push    esi                                     ; 1FF7 _ 56
        push    ebx                                     ; 1FF8 _ 53
        push    edx                                     ; 1FF9 _ 52
        push    eax                                     ; 1FFA _ 50
        push    dword [ebp+8H]                          ; 1FFB _ FF. 75, 08
        call    sheet_refreshmap                        ; 1FFE _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2003 _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 2006 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2009 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 200C _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 200F _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 2012 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 2015 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 2018 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 201B _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 201E _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 2021 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 2024 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2027 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 202A _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 202D _ 8B. 40, 0C
        sub     esp, 8                                  ; 2030 _ 83. EC, 08
        push    dword [ebp+10H]                         ; 2033 _ FF. 75, 10
        push    ebx                                     ; 2036 _ 53
        push    ecx                                     ; 2037 _ 51
        push    edx                                     ; 2038 _ 52
        push    eax                                     ; 2039 _ 50
        push    dword [ebp+8H]                          ; 203A _ FF. 75, 08
        call    sheet_refreshsub                        ; 203D _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2042 _ 83. C4, 20
?_116:  nop                                             ; 2045 _ 90
        lea     esp, [ebp-8H]                           ; 2046 _ 8D. 65, F8
        pop     ebx                                     ; 2049 _ 5B
        pop     esi                                     ; 204A _ 5E
        pop     ebp                                     ; 204B _ 5D
        ret                                             ; 204C _ C3
; sheet_updown End of function

sheet_refresh:; Function begin
        push    ebp                                     ; 204D _ 55
        mov     ebp, esp                                ; 204E _ 89. E5
        push    edi                                     ; 2050 _ 57
        push    esi                                     ; 2051 _ 56
        push    ebx                                     ; 2052 _ 53
        sub     esp, 12                                 ; 2053 _ 83. EC, 0C
        mov     eax, dword [ebp+0CH]                    ; 2056 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 2059 _ 8B. 40, 18
        test    eax, eax                                ; 205C _ 85. C0
        js      ?_117                                   ; 205E _ 78, 47
        mov     eax, dword [ebp+0CH]                    ; 2060 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 2063 _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 2066 _ 8B. 55, 0C
        mov     ecx, dword [edx+10H]                    ; 2069 _ 8B. 4A, 10
        mov     edx, dword [ebp+1CH]                    ; 206C _ 8B. 55, 1C
        lea     esi, [ecx+edx]                          ; 206F _ 8D. 34 11
        mov     edx, dword [ebp+0CH]                    ; 2072 _ 8B. 55, 0C
        mov     ecx, dword [edx+0CH]                    ; 2075 _ 8B. 4A, 0C
        mov     edx, dword [ebp+18H]                    ; 2078 _ 8B. 55, 18
        lea     ebx, [ecx+edx]                          ; 207B _ 8D. 1C 11
        mov     edx, dword [ebp+0CH]                    ; 207E _ 8B. 55, 0C
        mov     ecx, dword [edx+10H]                    ; 2081 _ 8B. 4A, 10
        mov     edx, dword [ebp+14H]                    ; 2084 _ 8B. 55, 14
        add     ecx, edx                                ; 2087 _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 2089 _ 8B. 55, 0C
        mov     edi, dword [edx+0CH]                    ; 208C _ 8B. 7A, 0C
        mov     edx, dword [ebp+10H]                    ; 208F _ 8B. 55, 10
        add     edx, edi                                ; 2092 _ 01. FA
        sub     esp, 8                                  ; 2094 _ 83. EC, 08
        push    eax                                     ; 2097 _ 50
        push    esi                                     ; 2098 _ 56
        push    ebx                                     ; 2099 _ 53
        push    ecx                                     ; 209A _ 51
        push    edx                                     ; 209B _ 52
        push    dword [ebp+8H]                          ; 209C _ FF. 75, 08
        call    sheet_refreshsub                        ; 209F _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 20A4 _ 83. C4, 20
?_117:  mov     eax, 0                                  ; 20A7 _ B8, 00000000
        lea     esp, [ebp-0CH]                          ; 20AC _ 8D. 65, F4
        pop     ebx                                     ; 20AF _ 5B
        pop     esi                                     ; 20B0 _ 5E
        pop     edi                                     ; 20B1 _ 5F
        pop     ebp                                     ; 20B2 _ 5D
        ret                                             ; 20B3 _ C3
; sheet_refresh End of function

sheet_slide_mouse:; Function begin
        push    ebp                                     ; 20B4 _ 55
        mov     ebp, esp                                ; 20B5 _ 89. E5
        push    ebx                                     ; 20B7 _ 53
        sub     esp, 20                                 ; 20B8 _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 20BB _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 20BE _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 20C1 _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 20C4 _ 8B. 45, 0C
        mov     eax, dword [eax+10H]                    ; 20C7 _ 8B. 40, 10
        mov     dword [ebp-0CH], eax                    ; 20CA _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 20CD _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 20D0 _ 8B. 55, 10
        mov     dword [eax+0CH], edx                    ; 20D3 _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 20D6 _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 20D9 _ 8B. 55, 14
        mov     dword [eax+10H], edx                    ; 20DC _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 20DF _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 20E2 _ 8B. 40, 18
        test    eax, eax                                ; 20E5 _ 85. C0
        js      ?_118                                   ; 20E7 _ 0F 88, 000000AE
        mov     eax, dword [ebp-0CH]                    ; 20ED _ 8B. 45, F4
        lea     edx, [eax+10H]                          ; 20F0 _ 8D. 50, 10
        mov     eax, dword [ebp-10H]                    ; 20F3 _ 8B. 45, F0
        add     eax, 16                                 ; 20F6 _ 83. C0, 10
        sub     esp, 8                                  ; 20F9 _ 83. EC, 08
        push    0                                       ; 20FC _ 6A, 00
        push    edx                                     ; 20FE _ 52
        push    eax                                     ; 20FF _ 50
        push    dword [ebp-0CH]                         ; 2100 _ FF. 75, F4
        push    dword [ebp-10H]                         ; 2103 _ FF. 75, F0
        push    dword [ebp+8H]                          ; 2106 _ FF. 75, 08
        call    sheet_refreshmap                        ; 2109 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 210E _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 2111 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 2114 _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 2117 _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 211A _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 211D _ 8B. 55, 14
        add     ecx, edx                                ; 2120 _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 2122 _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 2125 _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 2128 _ 8B. 55, 10
        add     edx, ebx                                ; 212B _ 01. DA
        sub     esp, 8                                  ; 212D _ 83. EC, 08
        push    eax                                     ; 2130 _ 50
        push    ecx                                     ; 2131 _ 51
        push    edx                                     ; 2132 _ 52
        push    dword [ebp+14H]                         ; 2133 _ FF. 75, 14
        push    dword [ebp+10H]                         ; 2136 _ FF. 75, 10
        push    dword [ebp+8H]                          ; 2139 _ FF. 75, 08
        call    sheet_refreshmap                        ; 213C _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2141 _ 83. C4, 20
        mov     eax, dword [ebp-0CH]                    ; 2144 _ 8B. 45, F4
        lea     edx, [eax+10H]                          ; 2147 _ 8D. 50, 10
        mov     eax, dword [ebp-10H]                    ; 214A _ 8B. 45, F0
        add     eax, 16                                 ; 214D _ 83. C0, 10
        sub     esp, 8                                  ; 2150 _ 83. EC, 08
        push    0                                       ; 2153 _ 6A, 00
        push    edx                                     ; 2155 _ 52
        push    eax                                     ; 2156 _ 50
        push    dword [ebp-0CH]                         ; 2157 _ FF. 75, F4
        push    dword [ebp-10H]                         ; 215A _ FF. 75, F0
        push    dword [ebp+8H]                          ; 215D _ FF. 75, 08
        call    sheet_refreshsub                        ; 2160 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2165 _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 2168 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 216B _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 216E _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 2171 _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 2174 _ 8B. 55, 14
        add     ecx, edx                                ; 2177 _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 2179 _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 217C _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 217F _ 8B. 55, 10
        add     edx, ebx                                ; 2182 _ 01. DA
        sub     esp, 8                                  ; 2184 _ 83. EC, 08
        push    eax                                     ; 2187 _ 50
        push    ecx                                     ; 2188 _ 51
        push    edx                                     ; 2189 _ 52
        push    dword [ebp+14H]                         ; 218A _ FF. 75, 14
        push    dword [ebp+10H]                         ; 218D _ FF. 75, 10
        push    dword [ebp+8H]                          ; 2190 _ FF. 75, 08
        call    sheet_refreshsub                        ; 2193 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2198 _ 83. C4, 20
?_118:  nop                                             ; 219B _ 90
        mov     ebx, dword [ebp-4H]                     ; 219C _ 8B. 5D, FC
        leave                                           ; 219F _ C9
        ret                                             ; 21A0 _ C3
; sheet_slide_mouse End of function

sheet_slide:; Function begin
        push    ebp                                     ; 21A1 _ 55
        mov     ebp, esp                                ; 21A2 _ 89. E5
        push    ebx                                     ; 21A4 _ 53
        sub     esp, 20                                 ; 21A5 _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 21A8 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 21AB _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 21AE _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 21B1 _ 8B. 45, 0C
        mov     eax, dword [eax+10H]                    ; 21B4 _ 8B. 40, 10
        mov     dword [ebp-0CH], eax                    ; 21B7 _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 21BA _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 21BD _ 8B. 55, 10
        mov     dword [eax+0CH], edx                    ; 21C0 _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 21C3 _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 21C6 _ 8B. 55, 14
        mov     dword [eax+10H], edx                    ; 21C9 _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 21CC _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 21CF _ 8B. 40, 18
        test    eax, eax                                ; 21D2 _ 85. C0
        js      ?_119                                   ; 21D4 _ 0F 88, 000000C2
        mov     eax, dword [ebp+0CH]                    ; 21DA _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 21DD _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 21E0 _ 8B. 45, F4
        add     edx, eax                                ; 21E3 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 21E5 _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 21E8 _ 8B. 48, 04
        mov     eax, dword [ebp-10H]                    ; 21EB _ 8B. 45, F0
        add     eax, ecx                                ; 21EE _ 01. C8
        sub     esp, 8                                  ; 21F0 _ 83. EC, 08
        push    0                                       ; 21F3 _ 6A, 00
        push    edx                                     ; 21F5 _ 52
        push    eax                                     ; 21F6 _ 50
        push    dword [ebp-0CH]                         ; 21F7 _ FF. 75, F4
        push    dword [ebp-10H]                         ; 21FA _ FF. 75, F0
        push    dword [ebp+8H]                          ; 21FD _ FF. 75, 08
        call    sheet_refreshmap                        ; 2200 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2205 _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 2208 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 220B _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 220E _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 2211 _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 2214 _ 8B. 55, 14
        add     ecx, edx                                ; 2217 _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 2219 _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 221C _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 221F _ 8B. 55, 10
        add     edx, ebx                                ; 2222 _ 01. DA
        sub     esp, 8                                  ; 2224 _ 83. EC, 08
        push    eax                                     ; 2227 _ 50
        push    ecx                                     ; 2228 _ 51
        push    edx                                     ; 2229 _ 52
        push    dword [ebp+14H]                         ; 222A _ FF. 75, 14
        push    dword [ebp+10H]                         ; 222D _ FF. 75, 10
        push    dword [ebp+8H]                          ; 2230 _ FF. 75, 08
        call    sheet_refreshmap                        ; 2233 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2238 _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 223B _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 223E _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 2241 _ 8B. 45, F4
        add     edx, eax                                ; 2244 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 2246 _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 2249 _ 8B. 48, 04
        mov     eax, dword [ebp-10H]                    ; 224C _ 8B. 45, F0
        add     eax, ecx                                ; 224F _ 01. C8
        sub     esp, 8                                  ; 2251 _ 83. EC, 08
        push    0                                       ; 2254 _ 6A, 00
        push    edx                                     ; 2256 _ 52
        push    eax                                     ; 2257 _ 50
        push    dword [ebp-0CH]                         ; 2258 _ FF. 75, F4
        push    dword [ebp-10H]                         ; 225B _ FF. 75, F0
        push    dword [ebp+8H]                          ; 225E _ FF. 75, 08
        call    sheet_refreshsub                        ; 2261 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2266 _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 2269 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 226C _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 226F _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 2272 _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 2275 _ 8B. 55, 14
        add     ecx, edx                                ; 2278 _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 227A _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 227D _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 2280 _ 8B. 55, 10
        add     edx, ebx                                ; 2283 _ 01. DA
        sub     esp, 8                                  ; 2285 _ 83. EC, 08
        push    eax                                     ; 2288 _ 50
        push    ecx                                     ; 2289 _ 51
        push    edx                                     ; 228A _ 52
        push    dword [ebp+14H]                         ; 228B _ FF. 75, 14
        push    dword [ebp+10H]                         ; 228E _ FF. 75, 10
        push    dword [ebp+8H]                          ; 2291 _ FF. 75, 08
        call    sheet_refreshsub                        ; 2294 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2299 _ 83. C4, 20
?_119:  nop                                             ; 229C _ 90
        mov     ebx, dword [ebp-4H]                     ; 229D _ 8B. 5D, FC
        leave                                           ; 22A0 _ C9
        ret                                             ; 22A1 _ C3
; sheet_slide End of function

sheet_refreshsub:; Function begin
        push    ebp                                     ; 22A2 _ 55
        mov     ebp, esp                                ; 22A3 _ 89. E5
        sub     esp, 48                                 ; 22A5 _ 83. EC, 30
        mov     eax, dword [ebp+8H]                     ; 22A8 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 22AB _ 8B. 00
        mov     dword [ebp-18H], eax                    ; 22AD _ 89. 45, E8
        mov     eax, dword [ebp+8H]                     ; 22B0 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 22B3 _ 8B. 40, 04
        mov     dword [ebp-14H], eax                    ; 22B6 _ 89. 45, EC
        mov     eax, dword [ebp+1CH]                    ; 22B9 _ 8B. 45, 1C
        mov     dword [ebp-24H], eax                    ; 22BC _ 89. 45, DC
        jmp     ?_126                                   ; 22BF _ E9, 00000118

?_120:  mov     eax, dword [ebp+8H]                     ; 22C4 _ 8B. 45, 08
        mov     edx, dword [ebp-24H]                    ; 22C7 _ 8B. 55, DC
        add     edx, 4                                  ; 22CA _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 22CD _ 8B. 44 90, 04
        mov     dword [ebp-10H], eax                    ; 22D1 _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 22D4 _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 22D7 _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 22D9 _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 22DC _ 8B. 45, F0
        mov     edx, dword [ebp+8H]                     ; 22DF _ 8B. 55, 08
        add     edx, 1044                               ; 22E2 _ 81. C2, 00000414
        sub     eax, edx                                ; 22E8 _ 29. D0
        sar     eax, 5                                  ; 22EA _ C1. F8, 05
        mov     byte [ebp-26H], al                      ; 22ED _ 88. 45, DA
        mov     dword [ebp-1CH], 0                      ; 22F0 _ C7. 45, E4, 00000000
        jmp     ?_125                                   ; 22F7 _ E9, 000000CD

?_121:  mov     eax, dword [ebp-10H]                    ; 22FC _ 8B. 45, F0
        mov     edx, dword [eax+10H]                    ; 22FF _ 8B. 50, 10
        mov     eax, dword [ebp-1CH]                    ; 2302 _ 8B. 45, E4
        add     eax, edx                                ; 2305 _ 01. D0
        mov     dword [ebp-8H], eax                     ; 2307 _ 89. 45, F8
        mov     dword [ebp-20H], 0                      ; 230A _ C7. 45, E0, 00000000
        jmp     ?_124                                   ; 2311 _ E9, 000000A0

?_122:  mov     eax, dword [ebp-10H]                    ; 2316 _ 8B. 45, F0
        mov     edx, dword [eax+0CH]                    ; 2319 _ 8B. 50, 0C
        mov     eax, dword [ebp-20H]                    ; 231C _ 8B. 45, E0
        add     eax, edx                                ; 231F _ 01. D0
        mov     dword [ebp-4H], eax                     ; 2321 _ 89. 45, FC
        mov     eax, dword [ebp+0CH]                    ; 2324 _ 8B. 45, 0C
        cmp     eax, dword [ebp-4H]                     ; 2327 _ 3B. 45, FC
        jg      ?_123                                   ; 232A _ 0F 8F, 00000082
        mov     eax, dword [ebp-4H]                     ; 2330 _ 8B. 45, FC
        cmp     eax, dword [ebp+14H]                    ; 2333 _ 3B. 45, 14
        jge     ?_123                                   ; 2336 _ 7D, 7A
        mov     eax, dword [ebp+10H]                    ; 2338 _ 8B. 45, 10
        cmp     eax, dword [ebp-8H]                     ; 233B _ 3B. 45, F8
        jg      ?_123                                   ; 233E _ 7F, 72
        mov     eax, dword [ebp-8H]                     ; 2340 _ 8B. 45, F8
        cmp     eax, dword [ebp+18H]                    ; 2343 _ 3B. 45, 18
        jge     ?_123                                   ; 2346 _ 7D, 6A
        mov     eax, dword [ebp-10H]                    ; 2348 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 234B _ 8B. 40, 04
        imul    eax, dword [ebp-1CH]                    ; 234E _ 0F AF. 45, E4
        mov     edx, eax                                ; 2352 _ 89. C2
        mov     eax, dword [ebp-20H]                    ; 2354 _ 8B. 45, E0
        add     eax, edx                                ; 2357 _ 01. D0
        mov     edx, eax                                ; 2359 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 235B _ 8B. 45, F4
        add     eax, edx                                ; 235E _ 01. D0
        movzx   eax, byte [eax]                         ; 2360 _ 0F B6. 00
        mov     byte [ebp-25H], al                      ; 2363 _ 88. 45, DB
        mov     eax, dword [ebp+8H]                     ; 2366 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2369 _ 8B. 40, 08
        imul    eax, dword [ebp-8H]                     ; 236C _ 0F AF. 45, F8
        mov     edx, eax                                ; 2370 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 2372 _ 8B. 45, FC
        add     eax, edx                                ; 2375 _ 01. D0
        mov     edx, eax                                ; 2377 _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 2379 _ 8B. 45, EC
        add     eax, edx                                ; 237C _ 01. D0
        movzx   eax, byte [eax]                         ; 237E _ 0F B6. 00
        cmp     byte [ebp-26H], al                      ; 2381 _ 38. 45, DA
        jnz     ?_123                                   ; 2384 _ 75, 2C
        movzx   edx, byte [ebp-25H]                     ; 2386 _ 0F B6. 55, DB
        mov     eax, dword [ebp-10H]                    ; 238A _ 8B. 45, F0
        mov     eax, dword [eax+14H]                    ; 238D _ 8B. 40, 14
        cmp     edx, eax                                ; 2390 _ 39. C2
        jz      ?_123                                   ; 2392 _ 74, 1E
        mov     eax, dword [ebp+8H]                     ; 2394 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2397 _ 8B. 40, 08
        imul    eax, dword [ebp-8H]                     ; 239A _ 0F AF. 45, F8
        mov     edx, eax                                ; 239E _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 23A0 _ 8B. 45, FC
        add     eax, edx                                ; 23A3 _ 01. D0
        mov     edx, eax                                ; 23A5 _ 89. C2
        mov     eax, dword [ebp-18H]                    ; 23A7 _ 8B. 45, E8
        add     edx, eax                                ; 23AA _ 01. C2
        movzx   eax, byte [ebp-25H]                     ; 23AC _ 0F B6. 45, DB
        mov     byte [edx], al                          ; 23B0 _ 88. 02
?_123:  add     dword [ebp-20H], 1                      ; 23B2 _ 83. 45, E0, 01
?_124:  mov     eax, dword [ebp-10H]                    ; 23B6 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 23B9 _ 8B. 40, 04
        cmp     dword [ebp-20H], eax                    ; 23BC _ 39. 45, E0
        jl      ?_122                                   ; 23BF _ 0F 8C, FFFFFF51
        add     dword [ebp-1CH], 1                      ; 23C5 _ 83. 45, E4, 01
?_125:  mov     eax, dword [ebp-10H]                    ; 23C9 _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 23CC _ 8B. 40, 08
        cmp     dword [ebp-1CH], eax                    ; 23CF _ 39. 45, E4
        jl      ?_121                                   ; 23D2 _ 0F 8C, FFFFFF24
        add     dword [ebp-24H], 1                      ; 23D8 _ 83. 45, DC, 01
?_126:  mov     eax, dword [ebp+8H]                     ; 23DC _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 23DF _ 8B. 40, 10
        cmp     dword [ebp-24H], eax                    ; 23E2 _ 39. 45, DC
        jle     ?_120                                   ; 23E5 _ 0F 8E, FFFFFED9
        nop                                             ; 23EB _ 90
        leave                                           ; 23EC _ C9
        ret                                             ; 23ED _ C3
; sheet_refreshsub End of function

sheet_refreshmap:; Function begin
        push    ebp                                     ; 23EE _ 55
        mov     ebp, esp                                ; 23EF _ 89. E5
        sub     esp, 64                                 ; 23F1 _ 83. EC, 40
        mov     eax, dword [ebp+8H]                     ; 23F4 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 23F7 _ 8B. 40, 04
        mov     dword [ebp-14H], eax                    ; 23FA _ 89. 45, EC
        cmp     dword [ebp+0CH], 0                      ; 23FD _ 83. 7D, 0C, 00
        jns     ?_127                                   ; 2401 _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 2403 _ C7. 45, 0C, 00000000
?_127:  cmp     dword [ebp+10H], 0                      ; 240A _ 83. 7D, 10, 00
        jns     ?_128                                   ; 240E _ 79, 07
        mov     dword [ebp+10H], 0                      ; 2410 _ C7. 45, 10, 00000000
?_128:  mov     eax, dword [ebp+8H]                     ; 2417 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 241A _ 8B. 40, 08
        cmp     dword [ebp+14H], eax                    ; 241D _ 39. 45, 14
        jle     ?_129                                   ; 2420 _ 7E, 09
        mov     eax, dword [ebp+8H]                     ; 2422 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2425 _ 8B. 40, 08
        mov     dword [ebp+14H], eax                    ; 2428 _ 89. 45, 14
?_129:  mov     eax, dword [ebp+8H]                     ; 242B _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 242E _ 8B. 40, 0C
        cmp     dword [ebp+18H], eax                    ; 2431 _ 39. 45, 18
        jle     ?_130                                   ; 2434 _ 7E, 09
        mov     eax, dword [ebp+8H]                     ; 2436 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2439 _ 8B. 40, 0C
        mov     dword [ebp+18H], eax                    ; 243C _ 89. 45, 18
?_130:  mov     eax, dword [ebp+1CH]                    ; 243F _ 8B. 45, 1C
        mov     dword [ebp-30H], eax                    ; 2442 _ 89. 45, D0
        jmp     ?_141                                   ; 2445 _ E9, 00000140

?_131:  mov     eax, dword [ebp+8H]                     ; 244A _ 8B. 45, 08
        mov     edx, dword [ebp-30H]                    ; 244D _ 8B. 55, D0
        add     edx, 4                                  ; 2450 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 2453 _ 8B. 44 90, 04
        mov     dword [ebp-10H], eax                    ; 2457 _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 245A _ 8B. 45, F0
        mov     edx, dword [ebp+8H]                     ; 245D _ 8B. 55, 08
        add     edx, 1044                               ; 2460 _ 81. C2, 00000414
        sub     eax, edx                                ; 2466 _ 29. D0
        sar     eax, 5                                  ; 2468 _ C1. F8, 05
        mov     byte [ebp-31H], al                      ; 246B _ 88. 45, CF
        mov     eax, dword [ebp-10H]                    ; 246E _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 2471 _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 2473 _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 2476 _ 8B. 45, F0
        mov     eax, dword [eax+0CH]                    ; 2479 _ 8B. 40, 0C
        mov     edx, dword [ebp+0CH]                    ; 247C _ 8B. 55, 0C
        sub     edx, eax                                ; 247F _ 29. C2
        mov     eax, edx                                ; 2481 _ 89. D0
        mov     dword [ebp-24H], eax                    ; 2483 _ 89. 45, DC
        mov     eax, dword [ebp-10H]                    ; 2486 _ 8B. 45, F0
        mov     eax, dword [eax+10H]                    ; 2489 _ 8B. 40, 10
        mov     edx, dword [ebp+10H]                    ; 248C _ 8B. 55, 10
        sub     edx, eax                                ; 248F _ 29. C2
        mov     eax, edx                                ; 2491 _ 89. D0
        mov     dword [ebp-20H], eax                    ; 2493 _ 89. 45, E0
        mov     eax, dword [ebp-10H]                    ; 2496 _ 8B. 45, F0
        mov     eax, dword [eax+0CH]                    ; 2499 _ 8B. 40, 0C
        mov     edx, dword [ebp+14H]                    ; 249C _ 8B. 55, 14
        sub     edx, eax                                ; 249F _ 29. C2
        mov     eax, edx                                ; 24A1 _ 89. D0
        mov     dword [ebp-1CH], eax                    ; 24A3 _ 89. 45, E4
        mov     eax, dword [ebp-10H]                    ; 24A6 _ 8B. 45, F0
        mov     eax, dword [eax+10H]                    ; 24A9 _ 8B. 40, 10
        mov     edx, dword [ebp+18H]                    ; 24AC _ 8B. 55, 18
        sub     edx, eax                                ; 24AF _ 29. C2
        mov     eax, edx                                ; 24B1 _ 89. D0
        mov     dword [ebp-18H], eax                    ; 24B3 _ 89. 45, E8
        cmp     dword [ebp-24H], 0                      ; 24B6 _ 83. 7D, DC, 00
        jns     ?_132                                   ; 24BA _ 79, 07
        mov     dword [ebp-24H], 0                      ; 24BC _ C7. 45, DC, 00000000
?_132:  cmp     dword [ebp-20H], 0                      ; 24C3 _ 83. 7D, E0, 00
        jns     ?_133                                   ; 24C7 _ 79, 07
        mov     dword [ebp-20H], 0                      ; 24C9 _ C7. 45, E0, 00000000
?_133:  mov     eax, dword [ebp-10H]                    ; 24D0 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 24D3 _ 8B. 40, 04
        cmp     dword [ebp-1CH], eax                    ; 24D6 _ 39. 45, E4
        jle     ?_134                                   ; 24D9 _ 7E, 09
        mov     eax, dword [ebp-10H]                    ; 24DB _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 24DE _ 8B. 40, 04
        mov     dword [ebp-1CH], eax                    ; 24E1 _ 89. 45, E4
?_134:  mov     eax, dword [ebp-10H]                    ; 24E4 _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 24E7 _ 8B. 40, 08
        cmp     dword [ebp-18H], eax                    ; 24EA _ 39. 45, E8
        jle     ?_135                                   ; 24ED _ 7E, 09
        mov     eax, dword [ebp-10H]                    ; 24EF _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 24F2 _ 8B. 40, 08
        mov     dword [ebp-18H], eax                    ; 24F5 _ 89. 45, E8
?_135:  mov     eax, dword [ebp-20H]                    ; 24F8 _ 8B. 45, E0
        mov     dword [ebp-28H], eax                    ; 24FB _ 89. 45, D8
        jmp     ?_140                                   ; 24FE _ EB, 7A

?_136:  mov     eax, dword [ebp-10H]                    ; 2500 _ 8B. 45, F0
        mov     edx, dword [eax+10H]                    ; 2503 _ 8B. 50, 10
        mov     eax, dword [ebp-28H]                    ; 2506 _ 8B. 45, D8
        add     eax, edx                                ; 2509 _ 01. D0
        mov     dword [ebp-8H], eax                     ; 250B _ 89. 45, F8
        mov     eax, dword [ebp-24H]                    ; 250E _ 8B. 45, DC
        mov     dword [ebp-2CH], eax                    ; 2511 _ 89. 45, D4
        jmp     ?_139                                   ; 2514 _ EB, 58

?_137:  mov     eax, dword [ebp-10H]                    ; 2516 _ 8B. 45, F0
        mov     edx, dword [eax+0CH]                    ; 2519 _ 8B. 50, 0C
        mov     eax, dword [ebp-2CH]                    ; 251C _ 8B. 45, D4
        add     eax, edx                                ; 251F _ 01. D0
        mov     dword [ebp-4H], eax                     ; 2521 _ 89. 45, FC
        mov     eax, dword [ebp-10H]                    ; 2524 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 2527 _ 8B. 40, 04
        imul    eax, dword [ebp-28H]                    ; 252A _ 0F AF. 45, D8
        mov     edx, eax                                ; 252E _ 89. C2
        mov     eax, dword [ebp-2CH]                    ; 2530 _ 8B. 45, D4
        add     eax, edx                                ; 2533 _ 01. D0
        mov     edx, eax                                ; 2535 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 2537 _ 8B. 45, F4
        add     eax, edx                                ; 253A _ 01. D0
        movzx   eax, byte [eax]                         ; 253C _ 0F B6. 00
        movzx   edx, al                                 ; 253F _ 0F B6. D0
        mov     eax, dword [ebp-10H]                    ; 2542 _ 8B. 45, F0
        mov     eax, dword [eax+14H]                    ; 2545 _ 8B. 40, 14
        cmp     edx, eax                                ; 2548 _ 39. C2
        jz      ?_138                                   ; 254A _ 74, 1E
        mov     eax, dword [ebp+8H]                     ; 254C _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 254F _ 8B. 40, 08
        imul    eax, dword [ebp-8H]                     ; 2552 _ 0F AF. 45, F8
        mov     edx, eax                                ; 2556 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 2558 _ 8B. 45, FC
        add     eax, edx                                ; 255B _ 01. D0
        mov     edx, eax                                ; 255D _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 255F _ 8B. 45, EC
        add     edx, eax                                ; 2562 _ 01. C2
        movzx   eax, byte [ebp-31H]                     ; 2564 _ 0F B6. 45, CF
        mov     byte [edx], al                          ; 2568 _ 88. 02
?_138:  add     dword [ebp-2CH], 1                      ; 256A _ 83. 45, D4, 01
?_139:  mov     eax, dword [ebp-2CH]                    ; 256E _ 8B. 45, D4
        cmp     eax, dword [ebp-1CH]                    ; 2571 _ 3B. 45, E4
        jl      ?_137                                   ; 2574 _ 7C, A0
        add     dword [ebp-28H], 1                      ; 2576 _ 83. 45, D8, 01
?_140:  mov     eax, dword [ebp-28H]                    ; 257A _ 8B. 45, D8
        cmp     eax, dword [ebp-18H]                    ; 257D _ 3B. 45, E8
        jl      ?_136                                   ; 2580 _ 0F 8C, FFFFFF7A
        add     dword [ebp-30H], 1                      ; 2586 _ 83. 45, D0, 01
?_141:  mov     eax, dword [ebp+8H]                     ; 258A _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 258D _ 8B. 40, 10
        cmp     dword [ebp-30H], eax                    ; 2590 _ 39. 45, D0
        jle     ?_131                                   ; 2593 _ 0F 8E, FFFFFEB1
        nop                                             ; 2599 _ 90
        leave                                           ; 259A _ C9
        ret                                             ; 259B _ C3
; sheet_refreshmap End of function

init_pit:; Function begin
        push    ebp                                     ; 259C _ 55
        mov     ebp, esp                                ; 259D _ 89. E5
        sub     esp, 24                                 ; 259F _ 83. EC, 18
        sub     esp, 8                                  ; 25A2 _ 83. EC, 08
        push    52                                      ; 25A5 _ 6A, 34
        push    67                                      ; 25A7 _ 6A, 43
        call    io_out8                                 ; 25A9 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 25AE _ 83. C4, 10
        sub     esp, 8                                  ; 25B1 _ 83. EC, 08
        push    156                                     ; 25B4 _ 68, 0000009C
        push    64                                      ; 25B9 _ 6A, 40
        call    io_out8                                 ; 25BB _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 25C0 _ 83. C4, 10
        sub     esp, 8                                  ; 25C3 _ 83. EC, 08
        push    46                                      ; 25C6 _ 6A, 2E
        push    64                                      ; 25C8 _ 6A, 40
        call    io_out8                                 ; 25CA _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 25CF _ 83. C4, 10
        sub     esp, 8                                  ; 25D2 _ 83. EC, 08
        push    8000                                    ; 25D5 _ 68, 00001F40
        push    dword [ebp+8H]                          ; 25DA _ FF. 75, 08
        call    memman_alloc_4k                         ; 25DD _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 25E2 _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 25E5 _ 89. 45, F4
        cmp     dword [ebp-0CH], 0                      ; 25E8 _ 83. 7D, F4, 00
        jnz     ?_142                                   ; 25EC _ 75, 07
        mov     eax, 0                                  ; 25EE _ B8, 00000000
        jmp     ?_145                                   ; 25F3 _ EB, 36

?_142:  mov     eax, dword [ebp-0CH]                    ; 25F5 _ 8B. 45, F4
        mov     dword [eax], 0                          ; 25F8 _ C7. 00, 00000000
        mov     dword [ebp-10H], 0                      ; 25FE _ C7. 45, F0, 00000000
        jmp     ?_144                                   ; 2605 _ EB, 18

?_143:  mov     eax, dword [ebp-0CH]                    ; 2607 _ 8B. 45, F4
        mov     edx, dword [ebp-10H]                    ; 260A _ 8B. 55, F0
        shl     edx, 4                                  ; 260D _ C1. E2, 04
        add     eax, edx                                ; 2610 _ 01. D0
        add     eax, 4                                  ; 2612 _ 83. C0, 04
        mov     dword [eax], 0                          ; 2615 _ C7. 00, 00000000
        add     dword [ebp-10H], 1                      ; 261B _ 83. 45, F0, 01
?_144:  cmp     dword [ebp-10H], 499                    ; 261F _ 81. 7D, F0, 000001F3
        jle     ?_143                                   ; 2626 _ 7E, DF
        mov     eax, dword [ebp-0CH]                    ; 2628 _ 8B. 45, F4
?_145:  leave                                           ; 262B _ C9
        ret                                             ; 262C _ C3
; init_pit End of function

timer_alloc:; Function begin
        push    ebp                                     ; 262D _ 55
        mov     ebp, esp                                ; 262E _ 89. E5
        sub     esp, 16                                 ; 2630 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 2633 _ C7. 45, FC, 00000000
        jmp     ?_148                                   ; 263A _ EB, 3E

?_146:  mov     eax, dword [ebp+8H]                     ; 263C _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 263F _ 8B. 55, FC
        shl     edx, 4                                  ; 2642 _ C1. E2, 04
        add     eax, edx                                ; 2645 _ 01. D0
        add     eax, 4                                  ; 2647 _ 83. C0, 04
        mov     eax, dword [eax]                        ; 264A _ 8B. 00
        test    eax, eax                                ; 264C _ 85. C0
        jnz     ?_147                                   ; 264E _ 75, 26
        mov     eax, dword [ebp+8H]                     ; 2650 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 2653 _ 8B. 55, FC
        shl     edx, 4                                  ; 2656 _ C1. E2, 04
        add     eax, edx                                ; 2659 _ 01. D0
        add     eax, 4                                  ; 265B _ 83. C0, 04
        mov     dword [eax], 1                          ; 265E _ C7. 00, 00000001
        mov     eax, dword [ebp-4H]                     ; 2664 _ 8B. 45, FC
        shl     eax, 4                                  ; 2667 _ C1. E0, 04
        mov     edx, eax                                ; 266A _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 266C _ 8B. 45, 08
        add     eax, edx                                ; 266F _ 01. D0
        add     eax, 4                                  ; 2671 _ 83. C0, 04
        jmp     ?_149                                   ; 2674 _ EB, 12

?_147:  add     dword [ebp-4H], 1                       ; 2676 _ 83. 45, FC, 01
?_148:  cmp     dword [ebp-4H], 499                     ; 267A _ 81. 7D, FC, 000001F3
        jle     ?_146                                   ; 2681 _ 7E, B9
        mov     eax, 0                                  ; 2683 _ B8, 00000000
?_149:  leave                                           ; 2688 _ C9
        ret                                             ; 2689 _ C3
; timer_alloc End of function

timer_free:; Function begin
        push    ebp                                     ; 268A _ 55
        mov     ebp, esp                                ; 268B _ 89. E5
        mov     eax, dword [ebp+0CH]                    ; 268D _ 8B. 45, 0C
        mov     dword [eax], 0                          ; 2690 _ C7. 00, 00000000
        nop                                             ; 2696 _ 90
        pop     ebp                                     ; 2697 _ 5D
        ret                                             ; 2698 _ C3
; timer_free End of function

timer_init:; Function begin
        push    ebp                                     ; 2699 _ 55
        mov     ebp, esp                                ; 269A _ 89. E5
        sub     esp, 4                                  ; 269C _ 83. EC, 04
        mov     eax, dword [ebp+14H]                    ; 269F _ 8B. 45, 14
        mov     byte [ebp-4H], al                       ; 26A2 _ 88. 45, FC
        mov     eax, dword [ebp+0CH]                    ; 26A5 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 26A8 _ 8B. 55, 10
        mov     dword [eax+8H], edx                     ; 26AB _ 89. 50, 08
        mov     eax, dword [ebp+0CH]                    ; 26AE _ 8B. 45, 0C
        movzx   edx, byte [ebp-4H]                      ; 26B1 _ 0F B6. 55, FC
        mov     byte [eax+0CH], dl                      ; 26B5 _ 88. 50, 0C
        nop                                             ; 26B8 _ 90
        leave                                           ; 26B9 _ C9
        ret                                             ; 26BA _ C3
; timer_init End of function

timer_setdata:; Function begin
        push    ebp                                     ; 26BB _ 55
        mov     ebp, esp                                ; 26BC _ 89. E5
        sub     esp, 4                                  ; 26BE _ 83. EC, 04
        mov     eax, dword [ebp+10H]                    ; 26C1 _ 8B. 45, 10
        mov     byte [ebp-4H], al                       ; 26C4 _ 88. 45, FC
        mov     eax, dword [ebp+0CH]                    ; 26C7 _ 8B. 45, 0C
        movzx   edx, byte [ebp-4H]                      ; 26CA _ 0F B6. 55, FC
        mov     byte [eax+0CH], dl                      ; 26CE _ 88. 50, 0C
        nop                                             ; 26D1 _ 90
        leave                                           ; 26D2 _ C9
        ret                                             ; 26D3 _ C3
; timer_setdata End of function

timer_settime:; Function begin
        push    ebp                                     ; 26D4 _ 55
        mov     ebp, esp                                ; 26D5 _ 89. E5
        mov     eax, dword [ebp+0CH]                    ; 26D7 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 26DA _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 26DD _ 89. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 26E0 _ 8B. 45, 0C
        mov     dword [eax], 2                          ; 26E3 _ C7. 00, 00000002
        nop                                             ; 26E9 _ 90
        pop     ebp                                     ; 26EA _ 5D
        ret                                             ; 26EB _ C3
; timer_settime End of function

fifo8_init:; Function begin
        push    ebp                                     ; 26EC _ 55
        mov     ebp, esp                                ; 26ED _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 26EF _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 26F2 _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 26F5 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 26F8 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 26FB _ 8B. 55, 10
        mov     dword [eax], edx                        ; 26FE _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 2700 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 2703 _ 8B. 55, 0C
        mov     dword [eax+10H], edx                    ; 2706 _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 2709 _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 270C _ C7. 40, 14, 00000000
        mov     eax, dword [ebp+8H]                     ; 2713 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 2716 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 271D _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 2720 _ C7. 40, 08, 00000000
        nop                                             ; 2727 _ 90
        pop     ebp                                     ; 2728 _ 5D
        ret                                             ; 2729 _ C3
; fifo8_init End of function

fifo8_put:; Function begin
        push    ebp                                     ; 272A _ 55
        mov     ebp, esp                                ; 272B _ 89. E5
        sub     esp, 4                                  ; 272D _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 2730 _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 2733 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 2736 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2739 _ 8B. 40, 10
        test    eax, eax                                ; 273C _ 85. C0
        jnz     ?_150                                   ; 273E _ 75, 18
        mov     eax, dword [ebp+8H]                     ; 2740 _ 8B. 45, 08
        mov     eax, dword [eax+14H]                    ; 2743 _ 8B. 40, 14
        or      eax, 01H                                ; 2746 _ 83. C8, 01
        mov     edx, eax                                ; 2749 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 274B _ 8B. 45, 08
        mov     dword [eax+14H], edx                    ; 274E _ 89. 50, 14
        mov     eax, 4294967295                         ; 2751 _ B8, FFFFFFFF
        jmp     ?_152                                   ; 2756 _ EB, 50

?_150:  mov     eax, dword [ebp+8H]                     ; 2758 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 275B _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 275D _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2760 _ 8B. 40, 04
        add     edx, eax                                ; 2763 _ 01. C2
        movzx   eax, byte [ebp-4H]                      ; 2765 _ 0F B6. 45, FC
        mov     byte [edx], al                          ; 2769 _ 88. 02
        mov     eax, dword [ebp+8H]                     ; 276B _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 276E _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 2771 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2774 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 2777 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 277A _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 277D _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 2780 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2783 _ 8B. 40, 0C
        cmp     edx, eax                                ; 2786 _ 39. C2
        jnz     ?_151                                   ; 2788 _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 278A _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 278D _ C7. 40, 04, 00000000
?_151:  mov     eax, dword [ebp+8H]                     ; 2794 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2797 _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 279A _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 279D _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 27A0 _ 89. 50, 10
        mov     eax, 0                                  ; 27A3 _ B8, 00000000
?_152:  leave                                           ; 27A8 _ C9
        ret                                             ; 27A9 _ C3
; fifo8_put End of function

fifo8_get:; Function begin
        push    ebp                                     ; 27AA _ 55
        mov     ebp, esp                                ; 27AB _ 89. E5
        sub     esp, 16                                 ; 27AD _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 27B0 _ 8B. 45, 08
        mov     edx, dword [eax+10H]                    ; 27B3 _ 8B. 50, 10
        mov     eax, dword [ebp+8H]                     ; 27B6 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 27B9 _ 8B. 40, 0C
        cmp     edx, eax                                ; 27BC _ 39. C2
        jnz     ?_153                                   ; 27BE _ 75, 07
        mov     eax, 4294967295                         ; 27C0 _ B8, FFFFFFFF
        jmp     ?_155                                   ; 27C5 _ EB, 51

?_153:  mov     eax, dword [ebp+8H]                     ; 27C7 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 27CA _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 27CC _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 27CF _ 8B. 40, 08
        add     eax, edx                                ; 27D2 _ 01. D0
        movzx   eax, byte [eax]                         ; 27D4 _ 0F B6. 00
        movzx   eax, al                                 ; 27D7 _ 0F B6. C0
        mov     dword [ebp-4H], eax                     ; 27DA _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 27DD _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 27E0 _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 27E3 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 27E6 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 27E9 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 27EC _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 27EF _ 8B. 50, 08
        mov     eax, dword [ebp+8H]                     ; 27F2 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 27F5 _ 8B. 40, 0C
        cmp     edx, eax                                ; 27F8 _ 39. C2
        jnz     ?_154                                   ; 27FA _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 27FC _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 27FF _ C7. 40, 08, 00000000
?_154:  mov     eax, dword [ebp+8H]                     ; 2806 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2809 _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 280C _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 280F _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 2812 _ 89. 50, 10
        mov     eax, dword [ebp-4H]                     ; 2815 _ 8B. 45, FC
?_155:  leave                                           ; 2818 _ C9
        ret                                             ; 2819 _ C3
; fifo8_get End of function

fifo8_status:; Function begin
        push    ebp                                     ; 281A _ 55
        mov     ebp, esp                                ; 281B _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 281D _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 2820 _ 8B. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 2823 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2826 _ 8B. 40, 10
        sub     edx, eax                                ; 2829 _ 29. C2
        mov     eax, edx                                ; 282B _ 89. D0
        pop     ebp                                     ; 282D _ 5D
        ret                                             ; 282E _ C3
; fifo8_status End of function


SECTION .rodata align=1 noexecute                       ; section number 2, const

?_156:                                                  ; byte
        db 77H, 69H, 6EH, 64H, 64H, 6FH, 77H, 6EH       ; 0000 _ winddown
        db 00H                                          ; 0008 _ .

?_157:                                                  ; byte
        db 4EH, 65H, 77H, 20H, 35H, 5BH, 73H, 65H       ; 0009 _ New 5[se
        db 63H, 5DH, 00H                                ; 0011 _ c].

?_158:                                                  ; byte
        db 33H, 20H, 5BH, 73H, 65H, 63H, 5DH, 00H       ; 0014 _ 3 [sec].

?_159:                                                  ; byte
        db 69H, 6DH, 70H, 72H, 6FH, 76H, 65H, 20H       ; 001C _ improve 
        db 73H, 74H, 72H, 69H, 6EH, 67H, 20H, 73H       ; 0024 _ string s
        db 68H, 6FH, 77H, 69H, 6EH, 67H, 21H, 00H       ; 002C _ howing!.

?_160:                                                  ; byte
        db 70H, 61H, 67H, 65H, 20H, 69H, 73H, 3AH       ; 0034 _ page is:
        db 20H, 00H                                     ; 003C _  .

?_161:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 003E _ BaseAddr
        db 4CH, 3AH, 20H, 00H                           ; 0046 _ L: .

?_162:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 004A _ BaseAddr
        db 48H, 3AH, 20H, 00H                           ; 0052 _ H: .

?_163:                                                  ; byte
        db 4CH, 65H, 6EH, 67H, 74H, 68H, 4CH, 6FH       ; 0056 _ LengthLo
        db 77H, 3AH, 20H, 00H                           ; 005E _ w: .

?_164:                                                  ; byte
        db 4CH, 65H, 6EH, 67H, 74H, 68H, 48H, 69H       ; 0062 _ LengthHi
        db 67H, 68H, 3AH, 20H, 00H                      ; 006A _ gh: .

?_165:                                                  ; byte
        db 54H, 79H, 70H, 65H, 3AH, 20H, 00H            ; 006F _ Type: .

?_166:                                                  ; byte
        db 57H, 65H, 6CH, 65H, 63H, 6FH, 6DH, 65H       ; 0076 _ Welecome
        db 20H, 74H, 6FH, 00H                           ; 007E _  to.

?_167:                                                  ; byte
        db 6DH, 79H, 4FH, 53H, 00H                      ; 0082 _ myOS.


SECTION .eh_frame align=4 noexecute                     ; section number 3, const

        db 14H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0000 _ ........
        db 01H, 7AH, 52H, 00H, 01H, 7CH, 08H, 01H       ; 0008 _ .zR..|..
        db 1BH, 0CH, 04H, 04H, 88H, 01H, 00H, 00H       ; 0010 _ ........
        db 18H, 00H, 00H, 00H, 1CH, 00H, 00H, 00H       ; 0018 _ ........
        dd CMain-$-20H                                  ; 0020 _ 00000000 (rel)
        dd 00000622H, 080E4100H                         ; 0024 _ 1570 135151872 
        dd 0D420285H, 03834405H                         ; 002C _ 222429829 58934277 
        dd 0000001CH, 00000038H                         ; 0034 _ 28 56 
        dd CMain-$+5E6H                                 ; 003C _ 00000622 (rel)
        dd 00000021H, 080E4100H                         ; 0040 _ 33 135151872 
        dd 0D420285H, 0CC55D05H                         ; 0048 _ 222429829 214260997 
        dd 00000404H, 0000001CH                         ; 0050 _ 1028 28 
        dd 00000058H                                    ; 0058 _ 88 
        dd CMain-$+5E7H                                 ; 005C _ 00000643 (rel)
        dd 0000001DH, 080E4100H                         ; 0060 _ 29 135151872 
        dd 0D420285H, 0CC55905H                         ; 0068 _ 222429829 214259973 
        dd 00000404H, 0000001CH                         ; 0070 _ 1028 28 
        dd 00000078H                                    ; 0078 _ 120 
        dd CMain-$+5E4H                                 ; 007C _ 00000660 (rel)
        dd 000000ACH, 080E4100H                         ; 0080 _ 172 135151872 
        dd 0D420285H, 0C5A80205H                        ; 0088 _ 222429829 -978845179 
        dd 0004040CH, 0000001CH                         ; 0090 _ 263180 28 
        dd 00000098H                                    ; 0098 _ 152 
        dd CMain-$+670H                                 ; 009C _ 0000070C (rel)
        dd 00000052H, 080E4100H                         ; 00A0 _ 82 135151872 
        dd 0D420285H, 0C54E0205H                        ; 00A8 _ 222429829 -984743419 
        dd 0004040CH, 00000020H                         ; 00B0 _ 263180 32 
        dd 000000B8H                                    ; 00B8 _ 184 
        dd CMain-$+6A2H                                 ; 00BC _ 0000075E (rel)
        dd 00000084H, 080E4100H                         ; 00C0 _ 132 135151872 
        dd 0D420285H, 03834405H                         ; 00C8 _ 222429829 58934277 
        dd 0C3C57C02H, 0004040CH                        ; 00D0 _ -1010467838 263180 
        dd 0000001CH, 000000DCH                         ; 00D8 _ 28 220 
        dd CMain-$+702H                                 ; 00E0 _ 000007E2 (rel)
        dd 00000191H, 080E4100H                         ; 00E4 _ 401 135151872 
        dd 0D420285H, 018D0305H                         ; 00EC _ 222429829 26018565 
        dd 04040CC5H, 0000001CH                         ; 00F4 _ 67374277 28 
        dd 000000FCH                                    ; 00FC _ 252 
        dd CMain-$+873H                                 ; 0100 _ 00000973 (rel)
        dd 000000DAH, 080E4100H                         ; 0104 _ 218 135151872 
        dd 0D420285H, 0C5D60205H                        ; 010C _ 222429829 -975830523 
        dd 0004040CH, 00000020H                         ; 0114 _ 263180 32 
        dd 0000011CH                                    ; 011C _ 284 
        dd CMain-$+92DH                                 ; 0120 _ 00000A4D (rel)
        dd 0000006FH, 080E4100H                         ; 0124 _ 111 135151872 
        dd 0D420285H, 03834405H                         ; 012C _ 222429829 58934277 
        dd 41C36602H, 04040CC5H                         ; 0134 _ 1103324674 67374277 
        dd 0000001CH, 00000140H                         ; 013C _ 28 320 
        dd CMain-$+978H                                 ; 0144 _ 00000ABC (rel)
        dd 0000005FH, 080E4100H                         ; 0148 _ 95 135151872 
        dd 0D420285H, 0C55B0205H                        ; 0150 _ 222429829 -983891451 
        dd 0004040CH, 0000001CH                         ; 0158 _ 263180 28 
        dd 00000160H                                    ; 0160 _ 352 
        dd CMain-$+9B7H                                 ; 0164 _ 00000B1B (rel)
        dd 00000024H, 080E4100H                         ; 0168 _ 36 135151872 
        dd 0D420285H, 0CC56005H                         ; 0170 _ 222429829 214261765 
        dd 00000404H, 0000001CH                         ; 0178 _ 1028 28 
        dd 00000180H                                    ; 0180 _ 384 
        dd CMain-$+9BBH                                 ; 0184 _ 00000B3F (rel)
        dd 00000048H, 080E4100H                         ; 0188 _ 72 135151872 
        dd 0D420285H, 0C5440205H                        ; 0190 _ 222429829 -985398779 
        dd 0004040CH, 0000001CH                         ; 0198 _ 263180 28 
        dd 000001A0H                                    ; 01A0 _ 416 
        dd CMain-$+9E3H                                 ; 01A4 _ 00000B87 (rel)
        dd 0000007DH, 080E4100H                         ; 01A8 _ 125 135151872 
        dd 0D420285H, 0C5790205H                        ; 01B0 _ 222429829 -981925371 
        dd 0004040CH, 0000001CH                         ; 01B8 _ 263180 28 
        dd 000001C0H                                    ; 01C0 _ 448 
        dd ?_034-$+1C4H                                 ; 01C4 _ 00000C04 (rel)
        dd 00000020H, 080E4100H                         ; 01C8 _ 32 135151872 
        dd 0D420285H, 0CC55C05H                         ; 01D0 _ 222429829 214260741 
        dd 00000404H, 0000001CH                         ; 01D8 _ 1028 28 
        dd 000001E0H                                    ; 01E0 _ 480 
        dd ?_034-$+1E4H                                 ; 01E4 _ 00000C24 (rel)
        dd 00000031H, 080E4100H                         ; 01E8 _ 49 135151872 
        dd 0D420285H, 0CC56D05H                         ; 01F0 _ 222429829 214265093 
        dd 00000404H, 0000001CH                         ; 01F8 _ 1028 28 
        dd 00000200H                                    ; 0200 _ 512 
        dd CMain-$+0A51H                                ; 0204 _ 00000C55 (rel)
        dd 0000003EH, 080E4100H                         ; 0208 _ 62 135151872 
        dd 0D420285H, 0CC57A05H                         ; 0210 _ 222429829 214268421 
        dd 00000404H, 0000001CH                         ; 0218 _ 1028 28 
        dd 00000220H                                    ; 0220 _ 544 
        dd CMain-$+0A6FH                                ; 0224 _ 00000C93 (rel)
        dd 0000004FH, 080E4100H                         ; 0228 _ 79 135151872 
        dd 0D420285H, 0C54B0205H                        ; 0230 _ 222429829 -984940027 
        dd 0004040CH, 0000001CH                         ; 0238 _ 263180 28 
        dd 00000240H                                    ; 0240 _ 576 
        dd CMain-$+0A9EH                                ; 0244 _ 00000CE2 (rel)
        dd 0000013FH, 080E4100H                         ; 0248 _ 319 135151872 
        dd 0D420285H, 013B0305H                         ; 0250 _ 222429829 20644613 
        dd 04040CC5H, 0000001CH                         ; 0258 _ 67374277 28 
        dd 00000260H                                    ; 0260 _ 608 
        dd CMain-$+0BBDH                                ; 0264 _ 00000E21 (rel)
        dd 00000109H, 080E4100H                         ; 0268 _ 265 135151872 
        dd 0D420285H, 01050305H                         ; 0270 _ 222429829 17105669 
        dd 04040CC5H, 0000001CH                         ; 0278 _ 67374277 28 
        dd 00000280H                                    ; 0280 _ 640 
        dd CMain-$+0CA6H                                ; 0284 _ 00000F2A (rel)
        dd 00000078H, 080E4100H                         ; 0288 _ 120 135151872 
        dd 0D420285H, 0C5740205H                        ; 0290 _ 222429829 -982253051 
        dd 0004040CH, 0000001CH                         ; 0298 _ 263180 28 
        dd 000002A0H                                    ; 02A0 _ 672 
        dd CMain-$+0CFEH                                ; 02A4 _ 00000FA2 (rel)
        dd 00000266H, 080E4100H                         ; 02A8 _ 614 135151872 
        dd 0D420285H, 02620305H                         ; 02B0 _ 222429829 39977733 
        dd 04040CC5H, 00000020H                         ; 02B8 _ 67374277 32 
        dd 000002C0H                                    ; 02C0 _ 704 
        dd CMain-$+0F44H                                ; 02C4 _ 00001208 (rel)
        dd 0000021DH, 080E4100H                         ; 02C8 _ 541 135151872 
        dd 0D420285H, 03834105H                         ; 02D0 _ 222429829 58933509 
        dd 0C5021803H, 04040CC3H                        ; 02D8 _ -989718525 67374275 
        dd 00000020H, 000002E4H                         ; 02E0 _ 32 740 
        dd CMain-$+113DH                                ; 02E8 _ 00001425 (rel)
        dd 0000023FH, 080E4100H                         ; 02EC _ 575 135151872 
        dd 0D420285H, 03834405H                         ; 02F4 _ 222429829 58934277 
        dd 0C5023703H, 04040CC3H                        ; 02FC _ -989710589 67374275 
        dd 0000001CH, 00000308H                         ; 0304 _ 28 776 
        dd CMain-$+1358H                                ; 030C _ 00001664 (rel)
        dd 000000C0H, 080E4100H                         ; 0310 _ 192 135151872 
        dd 0D420285H, 0C5BC0205H                        ; 0318 _ 222429829 -977534459 
        dd 0004040CH, 0000001CH                         ; 0320 _ 263180 28 
        dd 00000328H                                    ; 0328 _ 808 
        dd CMain-$+13F8H                                ; 032C _ 00001724 (rel)
        dd 000000C5H, 080E4100H                         ; 0330 _ 197 135151872 
        dd 0D420285H, 0C5C10205H                        ; 0338 _ 222429829 -977206779 
        dd 0004040CH, 00000014H                         ; 0340 _ 263180 20 
        dd 00000000H, 00527A01H                         ; 0348 _ 0 5405185 
        dd 01087C01H, 04040C1BH                         ; 0350 _ 17333249 67374107 
        dd 00000188H, 0000001CH                         ; 0358 _ 392 28 
        dd 0000001CH                                    ; 0360 _ 28 
        dd CMain-$+1485H                                ; 0364 _ 000017E9 (rel)
        dd 0000002DH, 080E4100H                         ; 0368 _ 45 135151872 
        dd 0D420285H, 0CC56905H                         ; 0370 _ 222429829 214264069 
        dd 00000404H, 0000001CH                         ; 0378 _ 1028 28 
        dd 0000003CH                                    ; 0380 _ 60 
        dd CMain-$+1492H                                ; 0384 _ 00001816 (rel)
        dd 00000039H, 080E4100H                         ; 0388 _ 57 135151872 
        dd 0D420285H, 0CC57505H                         ; 0390 _ 222429829 214267141 
        dd 00000404H, 0000001CH                         ; 0398 _ 1028 28 
        dd 0000005CH                                    ; 03A0 _ 92 
        dd CMain-$+14ABH                                ; 03A4 _ 0000184F (rel)
        dd 000000ACH, 080E4100H                         ; 03A8 _ 172 135151872 
        dd 0D420285H, 0C5A80205H                        ; 03B0 _ 222429829 -978845179 
        dd 0004040CH, 00000024H                         ; 03B8 _ 263180 36 
        dd 0000007CH                                    ; 03C0 _ 124 
        dd CMain-$+1537H                                ; 03C4 _ 000018FB (rel)
        dd 00000216H, 080E4100H                         ; 03C8 _ 534 135151872 
        dd 0D420285H, 03834405H                         ; 03D0 _ 222429829 58934277 
        dd 0C3020D03H, 040CC541H                        ; 03D8 _ -1023275773 67945793 
        dd 00000004H, 0000001CH                         ; 03E0 _ 4 28 
        dd 000000A4H                                    ; 03E8 _ 164 
        dd CMain-$+1725H                                ; 03EC _ 00001B11 (rel)
        dd 0000002CH, 080E4100H                         ; 03F0 _ 44 135151872 
        dd 0D420285H, 0CC56805H                         ; 03F8 _ 222429829 214263813 
        dd 00000404H, 0000001CH                         ; 0400 _ 1028 28 
        dd 000000C4H                                    ; 0408 _ 196 
        dd CMain-$+1731H                                ; 040C _ 00001B3D (rel)
        dd 0000002FH, 080E4100H                         ; 0410 _ 47 135151872 
        dd 0D420285H, 0CC56B05H                         ; 0418 _ 222429829 214264581 
        dd 00000404H, 00000014H                         ; 0420 _ 1028 20 
        dd 00000000H, 00527A01H                         ; 0428 _ 0 5405185 
        dd 01087C01H, 04040C1BH                         ; 0430 _ 17333249 67374107 
        dd 00000188H, 0000001CH                         ; 0438 _ 392 28 
        dd 0000001CH                                    ; 0440 _ 28 
        dd CMain-$+1728H                                ; 0444 _ 00001B6C (rel)
        dd 000000C8H, 080E4100H                         ; 0448 _ 200 135151872 
        dd 0D420285H, 0C5C40205H                        ; 0450 _ 222429829 -977010171 
        dd 0004040CH, 0000001CH                         ; 0458 _ 263180 28 
        dd 0000003CH                                    ; 0460 _ 60 
        dd CMain-$+17D0H                                ; 0464 _ 00001C34 (rel)
        dd 0000007AH, 080E4100H                         ; 0468 _ 122 135151872 
        dd 0D420285H, 0C5760205H                        ; 0470 _ 222429829 -982121979 
        dd 0004040CH, 0000001CH                         ; 0478 _ 263180 28 
        dd 0000005CH                                    ; 0480 _ 92 
        dd CMain-$+182AH                                ; 0484 _ 00001CAE (rel)
        dd 00000029H, 080E4100H                         ; 0488 _ 41 135151872 
        dd 0D420285H, 0CC56505H                         ; 0490 _ 222429829 214263045 
        dd 00000404H, 00000028H                         ; 0498 _ 1028 40 
        dd 0000007CH                                    ; 04A0 _ 124 
        dd CMain-$+1833H                                ; 04A4 _ 00001CD7 (rel)
        dd 00000376H, 080E4100H                         ; 04A8 _ 886 135151872 
        dd 0D420285H, 03864505H                         ; 04B0 _ 222429829 59131141 
        dd 6B030483H, 0C641C303H                        ; 04B8 _ 1795359875 -968768765 
        dd 040CC541H, 00000004H                         ; 04C0 _ 67945793 4 
        dd 00000028H, 000000A8H                         ; 04C8 _ 40 168 
        dd CMain-$+1B7DH                                ; 04D0 _ 0000204D (rel)
        dd 00000067H, 080E4100H                         ; 04D4 _ 103 135151872 
        dd 0D420285H, 03874605H                         ; 04DC _ 222429829 59196933 
        dd 05830486H, 41C35A02H                         ; 04E4 _ 92472454 1103321602 
        dd 41C741C6H, 04040CC5H                         ; 04EC _ 1103577542 67374277 
        dd 00000020H, 000000D4H                         ; 04F4 _ 32 212 
        dd CMain-$+1BB8H                                ; 04FC _ 000020B4 (rel)
        dd 000000EDH, 080E4100H                         ; 0500 _ 237 135151872 
        dd 0D420285H, 03834405H                         ; 0508 _ 222429829 58934277 
        dd 0C3C5E502H, 0004040CH                        ; 0510 _ -1010440958 263180 
        dd 00000020H, 000000F8H                         ; 0518 _ 32 248 
        dd CMain-$+1C81H                                ; 0520 _ 000021A1 (rel)
        dd 00000101H, 080E4100H                         ; 0524 _ 257 135151872 
        dd 0D420285H, 03834405H                         ; 052C _ 222429829 58934277 
        dd 0C3C5F902H, 0004040CH                        ; 0534 _ -1010435838 263180 
        dd 0000001CH, 0000011CH                         ; 053C _ 28 284 
        dd CMain-$+1D5EH                                ; 0544 _ 000022A2 (rel)
        dd 0000014CH, 080E4100H                         ; 0548 _ 332 135151872 
        dd 0D420285H, 01480305H                         ; 0550 _ 222429829 21496581 
        dd 04040CC5H, 0000001CH                         ; 0558 _ 67374277 28 
        dd 0000013CH                                    ; 0560 _ 316 
        dd CMain-$+1E8AH                                ; 0564 _ 000023EE (rel)
        dd 000001AEH, 080E4100H                         ; 0568 _ 430 135151872 
        dd 0D420285H, 01AA0305H                         ; 0570 _ 222429829 27919109 
        dd 04040CC5H, 00000014H                         ; 0578 _ 67374277 20 
        dd 00000000H, 00527A01H                         ; 0580 _ 0 5405185 
        dd 01087C01H, 04040C1BH                         ; 0588 _ 17333249 67374107 
        dd 00000188H, 0000001CH                         ; 0590 _ 392 28 
        dd 0000001CH                                    ; 0598 _ 28 
        dd CMain-$+2000H                                ; 059C _ 0000259C (rel)
        dd 00000091H, 080E4100H                         ; 05A0 _ 145 135151872 
        dd 0D420285H, 0C58D0205H                        ; 05A8 _ 222429829 -980614651 
        dd 0004040CH, 0000001CH                         ; 05B0 _ 263180 28 
        dd 0000003CH                                    ; 05B8 _ 60 
        dd CMain-$+2071H                                ; 05BC _ 0000262D (rel)
        dd 0000005DH, 080E4100H                         ; 05C0 _ 93 135151872 
        dd 0D420285H, 0C5590205H                        ; 05C8 _ 222429829 -984022523 
        dd 0004040CH, 0000001CH                         ; 05D0 _ 263180 28 
        dd 0000005CH                                    ; 05D8 _ 92 
        dd CMain-$+20AEH                                ; 05DC _ 0000268A (rel)
        dd 0000000FH, 080E4100H                         ; 05E0 _ 15 135151872 
        dd 0D420285H, 0CC54B05H                         ; 05E8 _ 222429829 214256389 
        dd 00000404H, 0000001CH                         ; 05F0 _ 1028 28 
        dd 0000007CH                                    ; 05F8 _ 124 
        dd CMain-$+209DH                                ; 05FC _ 00002699 (rel)
        dd 00000022H, 080E4100H                         ; 0600 _ 34 135151872 
        dd 0D420285H, 0CC55E05H                         ; 0608 _ 222429829 214261253 
        dd 00000404H, 0000001CH                         ; 0610 _ 1028 28 
        dd 0000009CH                                    ; 0618 _ 156 
        dd CMain-$+209FH                                ; 061C _ 000026BB (rel)
        dd 00000019H, 080E4100H                         ; 0620 _ 25 135151872 
        dd 0D420285H, 0CC55505H                         ; 0628 _ 222429829 214258949 
        dd 00000404H, 0000001CH                         ; 0630 _ 1028 28 
        dd 000000BCH                                    ; 0638 _ 188 
        dd CMain-$+2098H                                ; 063C _ 000026D4 (rel)
        dd 00000018H, 080E4100H                         ; 0640 _ 24 135151872 
        dd 0D420285H, 0CC55405H                         ; 0648 _ 222429829 214258693 
        dd 00000404H, 00000014H                         ; 0650 _ 1028 20 
        dd 00000000H, 00527A01H                         ; 0658 _ 0 5405185 
        dd 01087C01H, 04040C1BH                         ; 0660 _ 17333249 67374107 
        dd 00000188H, 0000001CH                         ; 0668 _ 392 28 
        dd 0000001CH                                    ; 0670 _ 28 
        dd CMain-$+2078H                                ; 0674 _ 000026EC (rel)
        dd 0000003EH, 080E4100H                         ; 0678 _ 62 135151872 
        dd 0D420285H, 0CC57A05H                         ; 0680 _ 222429829 214268421 
        dd 00000404H, 0000001CH                         ; 0688 _ 1028 28 
        dd 0000003CH                                    ; 0690 _ 60 
        dd CMain-$+2096H                                ; 0694 _ 0000272A (rel)
        dd 00000080H, 080E4100H                         ; 0698 _ 128 135151872 
        dd 0D420285H, 0C57C0205H                        ; 06A0 _ 222429829 -981728763 
        dd 0004040CH, 0000001CH                         ; 06A8 _ 263180 28 
        dd 0000005CH                                    ; 06B0 _ 92 
        dd CMain-$+20F6H                                ; 06B4 _ 000027AA (rel)
        dd 00000070H, 080E4100H                         ; 06B8 _ 112 135151872 
        dd 0D420285H, 0C56C0205H                        ; 06C0 _ 222429829 -982777339 
        dd 0004040CH, 0000001CH                         ; 06C8 _ 263180 28 
        dd 0000007CH                                    ; 06D0 _ 124 
        dd CMain-$+2146H                                ; 06D4 _ 0000281A (rel)
        dd 00000015H, 080E4100H                         ; 06D8 _ 21 135151872 
        dd 0D420285H, 0CC55105H                         ; 06E0 _ 222429829 214257925 
        dd 00000404H                                    ; 06E8 _ 1028 


SECTION .data   align=32 noexecute                      ; section number 4, data

keyval:                                                 ; byte
        db 30H, 78H                                     ; 0000 _ 0x

?_168:  db 00H                                          ; 0002 _ .

?_169:  db 00H, 00H, 00H, 00H, 00H                      ; 0003 _ .....

memman: dd 00100000H, 00000000H                         ; 0008 _ 1048576 0 
        dd 00000000H, 00000000H                         ; 0010 _ 0 0 
        dd 00000000H, 00000000H                         ; 0018 _ 0 0 

table_rgb.1727:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 00H, 0FFH     ; 0020 _ ........
        db 00H, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH   ; 0028 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0030 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0038 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 0040 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 0048 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0050 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0058 _ ........

cursor.1784:                                            ; byte
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

closebtn.1899:                                          ; byte
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

?_170:  resw    1                                       ; 0004

?_171:  resw    1                                       ; 0006

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

timerctl: resd  1                                       ; 0208

timer1: resd    1                                       ; 020C

timer2: resd    1                                       ; 0210

timer3: resd    1                                       ; 0214

timerfifo1:                                             ; byte
        resb    24                                      ; 0218

timerfifo2:                                             ; byte
        resb    24                                      ; 0230

timerfifo3:                                             ; byte
        resb    24                                      ; 0248

timerbuf1:                                              ; qword
        resq    1                                       ; 0260

timerbuf2:                                              ; qword
        resq    1                                       ; 0268

timerbuf3:                                              ; qword
        resq    1                                       ; 0270

timerID.1718:                                           ; dword
        resd    1                                       ; 0278

str.1828:                                               ; byte
        resb    1                                       ; 027C

?_172:  resb    9                                       ; 027D

?_173:  resb    1                                       ; 0286


