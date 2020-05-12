; Disassembly of file: /home/bobkuo/eclipse-workspace/nasmCode/ckernel27.o
; Mon May 11 10:39:14 2020
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
        movzx   eax, word [?_171]                       ; 001F _ 0F B7. 05, 00000004(d)
        cwde                                            ; 0026 _ 98
        mov     dword [xsize], eax                      ; 0027 _ A3, 00000200(d)
        movzx   eax, word [?_172]                       ; 002C _ 0F B7. 05, 00000006(d)
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
        push    ?_157                                   ; 01FB _ 68, 00000000(d)
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
        mov     byte [charData.1741], 0                 ; 0375 _ C6. 05, 00000278(d), 00
        mov     byte [?_173], 0                         ; 037C _ C6. 05, 00000279(d), 00
?_001:  mov     eax, dword [timer1]                     ; 0383 _ A1, 0000020C(d)
        mov     eax, dword [eax+4H]                     ; 0388 _ 8B. 40, 04
        sub     esp, 12                                 ; 038B _ 83. EC, 0C
        push    eax                                     ; 038E _ 50
        call    intToHexStr                             ; 038F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0394 _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 0397 _ 89. 45, F4
        mov     eax, dword [ebp-18H]                    ; 039A _ 8B. 45, E8
        mov     eax, dword [eax]                        ; 039D _ 8B. 00
        sub     esp, 4                                  ; 039F _ 83. EC, 04
        push    43                                      ; 03A2 _ 6A, 2B
        push    119                                     ; 03A4 _ 6A, 77
        push    28                                      ; 03A6 _ 6A, 1C
        push    40                                      ; 03A8 _ 6A, 28
        push    8                                       ; 03AA _ 6A, 08
        push    160                                     ; 03AC _ 68, 000000A0
        push    eax                                     ; 03B1 _ 50
        call    boxfill8                                ; 03B2 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 03B7 _ 83. C4, 20
        call    io_cli                                  ; 03BA _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 03BF _ 83. EC, 0C
        push    keyinfo                                 ; 03C2 _ 68, 00000020(d)
        call    fifo8_status                            ; 03C7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03CC _ 83. C4, 10
        mov     ebx, eax                                ; 03CF _ 89. C3
        sub     esp, 12                                 ; 03D1 _ 83. EC, 0C
        push    mouseinfo                               ; 03D4 _ 68, 00000008(d)
        call    fifo8_status                            ; 03D9 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03DE _ 83. C4, 10
        add     ebx, eax                                ; 03E1 _ 01. C3
        sub     esp, 12                                 ; 03E3 _ 83. EC, 0C
        push    timerfifo1                              ; 03E6 _ 68, 00000218(d)
        call    fifo8_status                            ; 03EB _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03F0 _ 83. C4, 10
        add     eax, ebx                                ; 03F3 _ 01. D8
        test    eax, eax                                ; 03F5 _ 85. C0
        jnz     ?_002                                   ; 03F7 _ 75, 07
        call    io_sti                                  ; 03F9 _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 03FE _ EB, 83
; CMain End of function

?_002:  ; Local function
        sub     esp, 12                                 ; 0400 _ 83. EC, 0C
        push    keyinfo                                 ; 0403 _ 68, 00000020(d)
        call    fifo8_status                            ; 0408 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 040D _ 83. C4, 10
        test    eax, eax                                ; 0410 _ 85. C0
        je      ?_004                                   ; 0412 _ 0F 84, 000000B7
        call    io_sti                                  ; 0418 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 041D _ 83. EC, 0C
        push    keyinfo                                 ; 0420 _ 68, 00000020(d)
        call    fifo8_get                               ; 0425 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 042A _ 83. C4, 10
        mov     dword [ebp-14H], eax                    ; 042D _ 89. 45, EC
        cmp     dword [ebp-14H], 28                     ; 0430 _ 83. 7D, EC, 1C
        jnz     ?_003                                   ; 0434 _ 75, 55
        mov     ebx, dword [xsize]                      ; 0436 _ 8B. 1D, 00000200(d)
        mov     ecx, dword [buf_back]                   ; 043C _ 8B. 0D, 000000F8(d)
        mov     edx, dword [ebp-38H]                    ; 0442 _ 8B. 55, C8
        mov     eax, edx                                ; 0445 _ 89. D0
        shl     eax, 2                                  ; 0447 _ C1. E0, 02
        add     eax, edx                                ; 044A _ 01. D0
        shl     eax, 2                                  ; 044C _ C1. E0, 02
        mov     edx, eax                                ; 044F _ 89. C2
        mov     eax, dword [ebp-20H]                    ; 0451 _ 8B. 45, E0
        add     eax, edx                                ; 0454 _ 01. D0
        sub     esp, 4                                  ; 0456 _ 83. EC, 04
        push    7                                       ; 0459 _ 6A, 07
        push    ebx                                     ; 045B _ 53
        push    dword [ebp-38H]                         ; 045C _ FF. 75, C8
        push    ecx                                     ; 045F _ 51
        push    eax                                     ; 0460 _ 50
        push    dword [ebp-2CH]                         ; 0461 _ FF. 75, D4
        push    dword [ebp-1CH]                         ; 0464 _ FF. 75, E4
        call    showMemoryInfo                          ; 0467 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 046C _ 83. C4, 20
        add     dword [ebp-38H], 1                      ; 046F _ 83. 45, C8, 01
        mov     eax, dword [ebp-38H]                    ; 0473 _ 8B. 45, C8
        cmp     eax, dword [ebp-24H]                    ; 0476 _ 3B. 45, DC
        jle     ?_001                                   ; 0479 _ 0F 8E, FFFFFF04
        mov     dword [ebp-38H], 0                      ; 047F _ C7. 45, C8, 00000000
        jmp     ?_001                                   ; 0486 _ E9, FFFFFEF8

?_003:  mov     eax, dword [ebp-14H]                    ; 048B _ 8B. 45, EC
        add     eax, keytable                           ; 048E _ 05, 00000020(d)
        movzx   eax, byte [eax]                         ; 0493 _ 0F B6. 00
        test    al, al                                  ; 0496 _ 84. C0
        je      ?_001                                   ; 0498 _ 0F 84, FFFFFEE5
        mov     eax, dword [ebp-14H]                    ; 049E _ 8B. 45, EC
        add     eax, keytable                           ; 04A1 _ 05, 00000020(d)
        movzx   eax, byte [eax]                         ; 04A6 _ 0F B6. 00
        mov     byte [charData.1741], al                ; 04A9 _ A2, 00000278(d)
        sub     esp, 8                                  ; 04AE _ 83. EC, 08
        push    charData.1741                           ; 04B1 _ 68, 00000278(d)
        push    0                                       ; 04B6 _ 6A, 00
        push    28                                      ; 04B8 _ 6A, 1C
        push    40                                      ; 04BA _ 6A, 28
        push    dword [ebp-18H]                         ; 04BC _ FF. 75, E8
        push    dword [ebp-1CH]                         ; 04BF _ FF. 75, E4
        call    showString                              ; 04C2 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 04C7 _ 83. C4, 20
        jmp     ?_001                                   ; 04CA _ E9, FFFFFEB4

?_004:  ; Local function
        sub     esp, 12                                 ; 04CF _ 83. EC, 0C
        push    mouseinfo                               ; 04D2 _ 68, 00000008(d)
        call    fifo8_status                            ; 04D7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 04DC _ 83. C4, 10
        test    eax, eax                                ; 04DF _ 85. C0
        jz      ?_005                                   ; 04E1 _ 74, 19
        sub     esp, 4                                  ; 04E3 _ 83. EC, 04
        push    dword [ebp-28H]                         ; 04E6 _ FF. 75, D8
        push    dword [ebp-2CH]                         ; 04E9 _ FF. 75, D4
        push    dword [ebp-1CH]                         ; 04EC _ FF. 75, E4
        call    show_mouse_info                         ; 04EF _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 04F4 _ 83. C4, 10
        jmp     ?_001                                   ; 04F7 _ E9, FFFFFE87

?_005:  ; Local function
        sub     esp, 12                                 ; 04FC _ 83. EC, 0C
        push    timerfifo1                              ; 04FF _ 68, 00000218(d)
        call    fifo8_status                            ; 0504 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0509 _ 83. C4, 10
        test    eax, eax                                ; 050C _ 85. C0
        je      ?_001                                   ; 050E _ 0F 84, FFFFFE6F
        call    io_sti                                  ; 0514 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 0519 _ 83. EC, 0C
        push    timerfifo1                              ; 051C _ 68, 00000218(d)
        call    fifo8_get                               ; 0521 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0526 _ 83. C4, 10
        mov     dword [timerID.1740], eax               ; 0529 _ A3, 0000027C(d)
        mov     eax, dword [timerID.1740]               ; 052E _ A1, 0000027C(d)
        cmp     eax, 10                                 ; 0533 _ 83. F8, 0A
        jnz     ?_006                                   ; 0536 _ 75, 21
        sub     esp, 8                                  ; 0538 _ 83. EC, 08
        push    ?_158                                   ; 053B _ 68, 00000009(d)
        push    7                                       ; 0540 _ 6A, 07
        push    32                                      ; 0542 _ 6A, 20
        push    0                                       ; 0544 _ 6A, 00
        push    dword [ebp-2CH]                         ; 0546 _ FF. 75, D4
        push    dword [ebp-1CH]                         ; 0549 _ FF. 75, E4
        call    showString                              ; 054C _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0551 _ 83. C4, 20
        jmp     ?_009                                   ; 0554 _ E9, 000000AF

?_006:  mov     eax, dword [timerID.1740]               ; 0559 _ A1, 0000027C(d)
        cmp     eax, 2                                  ; 055E _ 83. F8, 02
        jnz     ?_007                                   ; 0561 _ 75, 21
        sub     esp, 8                                  ; 0563 _ 83. EC, 08
        push    ?_159                                   ; 0566 _ 68, 00000014(d)
        push    7                                       ; 056B _ 6A, 07
        push    16                                      ; 056D _ 6A, 10
        push    0                                       ; 056F _ 6A, 00
        push    dword [ebp-2CH]                         ; 0571 _ FF. 75, D4
        push    dword [ebp-1CH]                         ; 0574 _ FF. 75, E4
        call    showString                              ; 0577 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 057C _ 83. C4, 20
        jmp     ?_009                                   ; 057F _ E9, 00000084

?_007:  mov     eax, dword [timerID.1740]               ; 0584 _ A1, 0000027C(d)
        cmp     eax, 1                                  ; 0589 _ 83. F8, 01
        jnz     ?_008                                   ; 058C _ 75, 3E
        mov     edx, dword [timer3]                     ; 058E _ 8B. 15, 00000214(d)
        mov     eax, dword [timerctl]                   ; 0594 _ A1, 00000208(d)
        sub     esp, 4                                  ; 0599 _ 83. EC, 04
        push    0                                       ; 059C _ 6A, 00
        push    edx                                     ; 059E _ 52
        push    eax                                     ; 059F _ 50
        call    timer_setdata                           ; 05A0 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 05A5 _ 83. C4, 10
        mov     edx, dword [xsize]                      ; 05A8 _ 8B. 15, 00000200(d)
        mov     eax, dword [buf_back]                   ; 05AE _ A1, 000000F8(d)
        sub     esp, 4                                  ; 05B3 _ 83. EC, 04
        push    111                                     ; 05B6 _ 6A, 6F
        push    15                                      ; 05B8 _ 6A, 0F
        push    96                                      ; 05BA _ 6A, 60
        push    8                                       ; 05BC _ 6A, 08
        push    7                                       ; 05BE _ 6A, 07
        push    edx                                     ; 05C0 _ 52
        push    eax                                     ; 05C1 _ 50
        call    boxfill8                                ; 05C2 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 05C7 _ 83. C4, 20
        jmp     ?_009                                   ; 05CA _ EB, 3C

?_008:  mov     edx, dword [timer3]                     ; 05CC _ 8B. 15, 00000214(d)
        mov     eax, dword [timerctl]                   ; 05D2 _ A1, 00000208(d)
        sub     esp, 4                                  ; 05D7 _ 83. EC, 04
        push    1                                       ; 05DA _ 6A, 01
        push    edx                                     ; 05DC _ 52
        push    eax                                     ; 05DD _ 50
        call    timer_setdata                           ; 05DE _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 05E3 _ 83. C4, 10
        mov     edx, dword [xsize]                      ; 05E6 _ 8B. 15, 00000200(d)
        mov     eax, dword [buf_back]                   ; 05EC _ A1, 000000F8(d)
        sub     esp, 4                                  ; 05F1 _ 83. EC, 04
        push    111                                     ; 05F4 _ 6A, 6F
        push    15                                      ; 05F6 _ 6A, 0F
        push    96                                      ; 05F8 _ 6A, 60
        push    8                                       ; 05FA _ 6A, 08
        push    14                                      ; 05FC _ 6A, 0E
        push    edx                                     ; 05FE _ 52
        push    eax                                     ; 05FF _ 50
        call    boxfill8                                ; 0600 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0605 _ 83. C4, 20
?_009:  mov     eax, dword [timerID.1740]               ; 0608 _ A1, 0000027C(d)
        cmp     eax, 1                                  ; 060D _ 83. F8, 01
        jz      ?_010                                   ; 0610 _ 74, 0D
        mov     eax, dword [timerID.1740]               ; 0612 _ A1, 0000027C(d)
        test    eax, eax                                ; 0617 _ 85. C0
        jne     ?_001                                   ; 0619 _ 0F 85, FFFFFD64
?_010:  mov     edx, dword [timer3]                     ; 061F _ 8B. 15, 00000214(d)
        mov     eax, dword [timerctl]                   ; 0625 _ A1, 00000208(d)
        sub     esp, 4                                  ; 062A _ 83. EC, 04
        push    50                                      ; 062D _ 6A, 32
        push    edx                                     ; 062F _ 52
        push    eax                                     ; 0630 _ 50
        call    timer_settime                           ; 0631 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0636 _ 83. C4, 10
        sub     esp, 8                                  ; 0639 _ 83. EC, 08
        push    112                                     ; 063C _ 6A, 70
        push    16                                      ; 063E _ 6A, 10
        push    96                                      ; 0640 _ 6A, 60
        push    8                                       ; 0642 _ 6A, 08
        push    dword [ebp-2CH]                         ; 0644 _ FF. 75, D4
        push    dword [ebp-1CH]                         ; 0647 _ FF. 75, E4
        call    sheet_refresh                           ; 064A _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 064F _ 83. C4, 20
        jmp     ?_001                                   ; 0652 _ E9, FFFFFD2C

initBootInfo:; Function begin
        push    ebp                                     ; 0657 _ 55
        mov     ebp, esp                                ; 0658 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 065A _ 8B. 45, 08
        mov     dword [eax], -402653184                 ; 065D _ C7. 00, E8000000
        mov     eax, dword [ebp+8H]                     ; 0663 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 1280                     ; 0666 _ 66: C7. 40, 04, 0500
        mov     eax, dword [ebp+8H]                     ; 066C _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 1024                     ; 066F _ 66: C7. 40, 06, 0400
        nop                                             ; 0675 _ 90
        pop     ebp                                     ; 0676 _ 5D
        ret                                             ; 0677 _ C3
; initBootInfo End of function

init_palette:; Function begin
        push    ebp                                     ; 0678 _ 55
        mov     ebp, esp                                ; 0679 _ 89. E5
        sub     esp, 8                                  ; 067B _ 83. EC, 08
        sub     esp, 4                                  ; 067E _ 83. EC, 04
        push    table_rgb.1750                          ; 0681 _ 68, 00000080(d)
        push    15                                      ; 0686 _ 6A, 0F
        push    0                                       ; 0688 _ 6A, 00
        call    set_palette                             ; 068A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 068F _ 83. C4, 10
        nop                                             ; 0692 _ 90
        leave                                           ; 0693 _ C9
        ret                                             ; 0694 _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 0695 _ 55
        mov     ebp, esp                                ; 0696 _ 89. E5
        sub     esp, 24                                 ; 0698 _ 83. EC, 18
        call    io_load_eflags                          ; 069B _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 06A0 _ 89. 45, F4
        call    io_cli                                  ; 06A3 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 06A8 _ 83. EC, 08
        push    dword [ebp+8H]                          ; 06AB _ FF. 75, 08
        push    968                                     ; 06AE _ 68, 000003C8
        call    io_out8                                 ; 06B3 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 06B8 _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 06BB _ 8B. 45, 08
        mov     dword [ebp-10H], eax                    ; 06BE _ 89. 45, F0
        jmp     ?_012                                   ; 06C1 _ EB, 65

?_011:  mov     eax, dword [ebp+10H]                    ; 06C3 _ 8B. 45, 10
        movzx   eax, byte [eax]                         ; 06C6 _ 0F B6. 00
        shr     al, 2                                   ; 06C9 _ C0. E8, 02
        movzx   eax, al                                 ; 06CC _ 0F B6. C0
        sub     esp, 8                                  ; 06CF _ 83. EC, 08
        push    eax                                     ; 06D2 _ 50
        push    969                                     ; 06D3 _ 68, 000003C9
        call    io_out8                                 ; 06D8 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 06DD _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 06E0 _ 8B. 45, 10
        add     eax, 1                                  ; 06E3 _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 06E6 _ 0F B6. 00
        shr     al, 2                                   ; 06E9 _ C0. E8, 02
        movzx   eax, al                                 ; 06EC _ 0F B6. C0
        sub     esp, 8                                  ; 06EF _ 83. EC, 08
        push    eax                                     ; 06F2 _ 50
        push    969                                     ; 06F3 _ 68, 000003C9
        call    io_out8                                 ; 06F8 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 06FD _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 0700 _ 8B. 45, 10
        add     eax, 2                                  ; 0703 _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 0706 _ 0F B6. 00
        shr     al, 2                                   ; 0709 _ C0. E8, 02
        movzx   eax, al                                 ; 070C _ 0F B6. C0
        sub     esp, 8                                  ; 070F _ 83. EC, 08
        push    eax                                     ; 0712 _ 50
        push    969                                     ; 0713 _ 68, 000003C9
        call    io_out8                                 ; 0718 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 071D _ 83. C4, 10
        add     dword [ebp+10H], 3                      ; 0720 _ 83. 45, 10, 03
        add     dword [ebp-10H], 1                      ; 0724 _ 83. 45, F0, 01
?_012:  mov     eax, dword [ebp-10H]                    ; 0728 _ 8B. 45, F0
        cmp     eax, dword [ebp+0CH]                    ; 072B _ 3B. 45, 0C
        jle     ?_011                                   ; 072E _ 7E, 93
        sub     esp, 12                                 ; 0730 _ 83. EC, 0C
        push    dword [ebp-0CH]                         ; 0733 _ FF. 75, F4
        call    io_store_eflags                         ; 0736 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 073B _ 83. C4, 10
        nop                                             ; 073E _ 90
        leave                                           ; 073F _ C9
        ret                                             ; 0740 _ C3
; set_palette End of function

boxfill8:; Function begin
        push    ebp                                     ; 0741 _ 55
        mov     ebp, esp                                ; 0742 _ 89. E5
        sub     esp, 20                                 ; 0744 _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 0747 _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 074A _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 074D _ 8B. 45, 18
        mov     dword [ebp-4H], eax                     ; 0750 _ 89. 45, FC
        jmp     ?_016                                   ; 0753 _ EB, 33

?_013:  mov     eax, dword [ebp+14H]                    ; 0755 _ 8B. 45, 14
        mov     dword [ebp-8H], eax                     ; 0758 _ 89. 45, F8
        jmp     ?_015                                   ; 075B _ EB, 1F

?_014:  mov     eax, dword [ebp-4H]                     ; 075D _ 8B. 45, FC
        imul    eax, dword [ebp+0CH]                    ; 0760 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0764 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0766 _ 8B. 45, F8
        add     eax, edx                                ; 0769 _ 01. D0
        mov     edx, eax                                ; 076B _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 076D _ 8B. 45, 08
        add     edx, eax                                ; 0770 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0772 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0776 _ 88. 02
        add     dword [ebp-8H], 1                       ; 0778 _ 83. 45, F8, 01
?_015:  mov     eax, dword [ebp-8H]                     ; 077C _ 8B. 45, F8
        cmp     eax, dword [ebp+1CH]                    ; 077F _ 3B. 45, 1C
        jle     ?_014                                   ; 0782 _ 7E, D9
        add     dword [ebp-4H], 1                       ; 0784 _ 83. 45, FC, 01
?_016:  mov     eax, dword [ebp-4H]                     ; 0788 _ 8B. 45, FC
        cmp     eax, dword [ebp+20H]                    ; 078B _ 3B. 45, 20
        jle     ?_013                                   ; 078E _ 7E, C5
        nop                                             ; 0790 _ 90
        leave                                           ; 0791 _ C9
        ret                                             ; 0792 _ C3
; boxfill8 End of function

showString:; Function begin
        push    ebp                                     ; 0793 _ 55
        mov     ebp, esp                                ; 0794 _ 89. E5
        push    ebx                                     ; 0796 _ 53
        sub     esp, 36                                 ; 0797 _ 83. EC, 24
        mov     eax, dword [ebp+18H]                    ; 079A _ 8B. 45, 18
        mov     byte [ebp-1CH], al                      ; 079D _ 88. 45, E4
        mov     eax, dword [ebp+10H]                    ; 07A0 _ 8B. 45, 10
        mov     dword [ebp-0CH], eax                    ; 07A3 _ 89. 45, F4
        jmp     ?_018                                   ; 07A6 _ EB, 3E

?_017:  mov     eax, dword [ebp+1CH]                    ; 07A8 _ 8B. 45, 1C
        movzx   eax, byte [eax]                         ; 07AB _ 0F B6. 00
        movzx   eax, al                                 ; 07AE _ 0F B6. C0
        shl     eax, 4                                  ; 07B1 _ C1. E0, 04
        lea     ebx, [systemFont+eax]                   ; 07B4 _ 8D. 98, 00000000(d)
        movsx   ecx, byte [ebp-1CH]                     ; 07BA _ 0F BE. 4D, E4
        mov     eax, dword [ebp+0CH]                    ; 07BE _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 07C1 _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 07C4 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 07C7 _ 8B. 00
        sub     esp, 8                                  ; 07C9 _ 83. EC, 08
        push    ebx                                     ; 07CC _ 53
        push    ecx                                     ; 07CD _ 51
        push    dword [ebp+14H]                         ; 07CE _ FF. 75, 14
        push    dword [ebp+10H]                         ; 07D1 _ FF. 75, 10
        push    edx                                     ; 07D4 _ 52
        push    eax                                     ; 07D5 _ 50
        call    showChar8                               ; 07D6 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 07DB _ 83. C4, 20
        add     dword [ebp+1CH], 1                      ; 07DE _ 83. 45, 1C, 01
        add     dword [ebp+10H], 8                      ; 07E2 _ 83. 45, 10, 08
?_018:  mov     eax, dword [ebp+1CH]                    ; 07E6 _ 8B. 45, 1C
        movzx   eax, byte [eax]                         ; 07E9 _ 0F B6. 00
        test    al, al                                  ; 07EC _ 84. C0
        jnz     ?_017                                   ; 07EE _ 75, B8
        mov     eax, dword [ebp+14H]                    ; 07F0 _ 8B. 45, 14
        add     eax, 16                                 ; 07F3 _ 83. C0, 10
        sub     esp, 8                                  ; 07F6 _ 83. EC, 08
        push    eax                                     ; 07F9 _ 50
        push    dword [ebp+10H]                         ; 07FA _ FF. 75, 10
        push    dword [ebp+14H]                         ; 07FD _ FF. 75, 14
        push    dword [ebp-0CH]                         ; 0800 _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 0803 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0806 _ FF. 75, 08
        call    sheet_refresh                           ; 0809 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 080E _ 83. C4, 20
        nop                                             ; 0811 _ 90
        mov     ebx, dword [ebp-4H]                     ; 0812 _ 8B. 5D, FC
        leave                                           ; 0815 _ C9
        ret                                             ; 0816 _ C3
; showString End of function

showChar8:; Function begin
        push    ebp                                     ; 0817 _ 55
        mov     ebp, esp                                ; 0818 _ 89. E5
        sub     esp, 20                                 ; 081A _ 83. EC, 14
        mov     eax, dword [ebp+18H]                    ; 081D _ 8B. 45, 18
        mov     byte [ebp-14H], al                      ; 0820 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 0823 _ C7. 45, FC, 00000000
        jmp     ?_028                                   ; 082A _ E9, 0000016C

?_019:  mov     edx, dword [ebp-4H]                     ; 082F _ 8B. 55, FC
        mov     eax, dword [ebp+1CH]                    ; 0832 _ 8B. 45, 1C
        add     eax, edx                                ; 0835 _ 01. D0
        movzx   eax, byte [eax]                         ; 0837 _ 0F B6. 00
        mov     byte [ebp-5H], al                       ; 083A _ 88. 45, FB
        cmp     byte [ebp-5H], 0                        ; 083D _ 80. 7D, FB, 00
        jns     ?_020                                   ; 0841 _ 79, 20
        mov     edx, dword [ebp+14H]                    ; 0843 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0846 _ 8B. 45, FC
        add     eax, edx                                ; 0849 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 084B _ 0F AF. 45, 0C
        mov     edx, eax                                ; 084F _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0851 _ 8B. 45, 10
        add     eax, edx                                ; 0854 _ 01. D0
        mov     edx, eax                                ; 0856 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0858 _ 8B. 45, 08
        add     edx, eax                                ; 085B _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 085D _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0861 _ 88. 02
?_020:  movsx   eax, byte [ebp-5H]                      ; 0863 _ 0F BE. 45, FB
        and     eax, 40H                                ; 0867 _ 83. E0, 40
        test    eax, eax                                ; 086A _ 85. C0
        jz      ?_021                                   ; 086C _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 086E _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0871 _ 8B. 45, FC
        add     eax, edx                                ; 0874 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0876 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 087A _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 087C _ 8B. 45, 10
        add     eax, edx                                ; 087F _ 01. D0
        lea     edx, [eax+1H]                           ; 0881 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0884 _ 8B. 45, 08
        add     edx, eax                                ; 0887 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0889 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 088D _ 88. 02
?_021:  movsx   eax, byte [ebp-5H]                      ; 088F _ 0F BE. 45, FB
        and     eax, 20H                                ; 0893 _ 83. E0, 20
        test    eax, eax                                ; 0896 _ 85. C0
        jz      ?_022                                   ; 0898 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 089A _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 089D _ 8B. 45, FC
        add     eax, edx                                ; 08A0 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 08A2 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 08A6 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 08A8 _ 8B. 45, 10
        add     eax, edx                                ; 08AB _ 01. D0
        lea     edx, [eax+2H]                           ; 08AD _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 08B0 _ 8B. 45, 08
        add     edx, eax                                ; 08B3 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 08B5 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 08B9 _ 88. 02
?_022:  movsx   eax, byte [ebp-5H]                      ; 08BB _ 0F BE. 45, FB
        and     eax, 10H                                ; 08BF _ 83. E0, 10
        test    eax, eax                                ; 08C2 _ 85. C0
        jz      ?_023                                   ; 08C4 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 08C6 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 08C9 _ 8B. 45, FC
        add     eax, edx                                ; 08CC _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 08CE _ 0F AF. 45, 0C
        mov     edx, eax                                ; 08D2 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 08D4 _ 8B. 45, 10
        add     eax, edx                                ; 08D7 _ 01. D0
        lea     edx, [eax+3H]                           ; 08D9 _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 08DC _ 8B. 45, 08
        add     edx, eax                                ; 08DF _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 08E1 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 08E5 _ 88. 02
?_023:  movsx   eax, byte [ebp-5H]                      ; 08E7 _ 0F BE. 45, FB
        and     eax, 08H                                ; 08EB _ 83. E0, 08
        test    eax, eax                                ; 08EE _ 85. C0
        jz      ?_024                                   ; 08F0 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 08F2 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 08F5 _ 8B. 45, FC
        add     eax, edx                                ; 08F8 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 08FA _ 0F AF. 45, 0C
        mov     edx, eax                                ; 08FE _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0900 _ 8B. 45, 10
        add     eax, edx                                ; 0903 _ 01. D0
        lea     edx, [eax+4H]                           ; 0905 _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0908 _ 8B. 45, 08
        add     edx, eax                                ; 090B _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 090D _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0911 _ 88. 02
?_024:  movsx   eax, byte [ebp-5H]                      ; 0913 _ 0F BE. 45, FB
        and     eax, 04H                                ; 0917 _ 83. E0, 04
        test    eax, eax                                ; 091A _ 85. C0
        jz      ?_025                                   ; 091C _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 091E _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0921 _ 8B. 45, FC
        add     eax, edx                                ; 0924 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0926 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 092A _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 092C _ 8B. 45, 10
        add     eax, edx                                ; 092F _ 01. D0
        lea     edx, [eax+5H]                           ; 0931 _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 0934 _ 8B. 45, 08
        add     edx, eax                                ; 0937 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0939 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 093D _ 88. 02
?_025:  movsx   eax, byte [ebp-5H]                      ; 093F _ 0F BE. 45, FB
        and     eax, 02H                                ; 0943 _ 83. E0, 02
        test    eax, eax                                ; 0946 _ 85. C0
        jz      ?_026                                   ; 0948 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 094A _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 094D _ 8B. 45, FC
        add     eax, edx                                ; 0950 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0952 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0956 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0958 _ 8B. 45, 10
        add     eax, edx                                ; 095B _ 01. D0
        lea     edx, [eax+6H]                           ; 095D _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 0960 _ 8B. 45, 08
        add     edx, eax                                ; 0963 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0965 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0969 _ 88. 02
?_026:  movsx   eax, byte [ebp-5H]                      ; 096B _ 0F BE. 45, FB
        and     eax, 01H                                ; 096F _ 83. E0, 01
        test    eax, eax                                ; 0972 _ 85. C0
        jz      ?_027                                   ; 0974 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 0976 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0979 _ 8B. 45, FC
        add     eax, edx                                ; 097C _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 097E _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0982 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0984 _ 8B. 45, 10
        add     eax, edx                                ; 0987 _ 01. D0
        lea     edx, [eax+7H]                           ; 0989 _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 098C _ 8B. 45, 08
        add     edx, eax                                ; 098F _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0991 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0995 _ 88. 02
?_027:  add     dword [ebp-4H], 1                       ; 0997 _ 83. 45, FC, 01
?_028:  cmp     dword [ebp-4H], 15                      ; 099B _ 83. 7D, FC, 0F
        jle     ?_019                                   ; 099F _ 0F 8E, FFFFFE8A
        nop                                             ; 09A5 _ 90
        leave                                           ; 09A6 _ C9
        ret                                             ; 09A7 _ C3
; showChar8 End of function

init_mouse_cursor:; Function begin
        push    ebp                                     ; 09A8 _ 55
        mov     ebp, esp                                ; 09A9 _ 89. E5
        sub     esp, 20                                 ; 09AB _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 09AE _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 09B1 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 09B4 _ C7. 45, FC, 00000000
        jmp     ?_035                                   ; 09BB _ E9, 000000B5

?_029:  mov     dword [ebp-8H], 0                       ; 09C0 _ C7. 45, F8, 00000000
        jmp     ?_034                                   ; 09C7 _ E9, 0000009B

?_030:  mov     eax, dword [ebp-4H]                     ; 09CC _ 8B. 45, FC
        shl     eax, 4                                  ; 09CF _ C1. E0, 04
        mov     edx, eax                                ; 09D2 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 09D4 _ 8B. 45, F8
        add     eax, edx                                ; 09D7 _ 01. D0
        add     eax, cursor.1807                        ; 09D9 _ 05, 000000C0(d)
        movzx   eax, byte [eax]                         ; 09DE _ 0F B6. 00
        cmp     al, 42                                  ; 09E1 _ 3C, 2A
        jnz     ?_031                                   ; 09E3 _ 75, 19
        mov     eax, dword [ebp-4H]                     ; 09E5 _ 8B. 45, FC
        shl     eax, 4                                  ; 09E8 _ C1. E0, 04
        mov     edx, eax                                ; 09EB _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 09ED _ 8B. 45, F8
        add     eax, edx                                ; 09F0 _ 01. D0
        mov     edx, eax                                ; 09F2 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 09F4 _ 8B. 45, 08
        add     eax, edx                                ; 09F7 _ 01. D0
        mov     byte [eax], 0                           ; 09F9 _ C6. 00, 00
        jmp     ?_033                                   ; 09FC _ EB, 65

?_031:  mov     eax, dword [ebp-4H]                     ; 09FE _ 8B. 45, FC
        shl     eax, 4                                  ; 0A01 _ C1. E0, 04
        mov     edx, eax                                ; 0A04 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0A06 _ 8B. 45, F8
        add     eax, edx                                ; 0A09 _ 01. D0
        add     eax, cursor.1807                        ; 0A0B _ 05, 000000C0(d)
        movzx   eax, byte [eax]                         ; 0A10 _ 0F B6. 00
        cmp     al, 79                                  ; 0A13 _ 3C, 4F
        jnz     ?_032                                   ; 0A15 _ 75, 19
        mov     eax, dword [ebp-4H]                     ; 0A17 _ 8B. 45, FC
        shl     eax, 4                                  ; 0A1A _ C1. E0, 04
        mov     edx, eax                                ; 0A1D _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0A1F _ 8B. 45, F8
        add     eax, edx                                ; 0A22 _ 01. D0
        mov     edx, eax                                ; 0A24 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0A26 _ 8B. 45, 08
        add     eax, edx                                ; 0A29 _ 01. D0
        mov     byte [eax], 7                           ; 0A2B _ C6. 00, 07
        jmp     ?_033                                   ; 0A2E _ EB, 33

?_032:  mov     eax, dword [ebp-4H]                     ; 0A30 _ 8B. 45, FC
        shl     eax, 4                                  ; 0A33 _ C1. E0, 04
        mov     edx, eax                                ; 0A36 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0A38 _ 8B. 45, F8
        add     eax, edx                                ; 0A3B _ 01. D0
        add     eax, cursor.1807                        ; 0A3D _ 05, 000000C0(d)
        movzx   eax, byte [eax]                         ; 0A42 _ 0F B6. 00
        cmp     al, 46                                  ; 0A45 _ 3C, 2E
        jnz     ?_033                                   ; 0A47 _ 75, 1A
        mov     eax, dword [ebp-4H]                     ; 0A49 _ 8B. 45, FC
        shl     eax, 4                                  ; 0A4C _ C1. E0, 04
        mov     edx, eax                                ; 0A4F _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0A51 _ 8B. 45, F8
        add     eax, edx                                ; 0A54 _ 01. D0
        mov     edx, eax                                ; 0A56 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0A58 _ 8B. 45, 08
        add     edx, eax                                ; 0A5B _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0A5D _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0A61 _ 88. 02
?_033:  add     dword [ebp-8H], 1                       ; 0A63 _ 83. 45, F8, 01
?_034:  cmp     dword [ebp-8H], 15                      ; 0A67 _ 83. 7D, F8, 0F
        jle     ?_030                                   ; 0A6B _ 0F 8E, FFFFFF5B
        add     dword [ebp-4H], 1                       ; 0A71 _ 83. 45, FC, 01
?_035:  cmp     dword [ebp-4H], 15                      ; 0A75 _ 83. 7D, FC, 0F
        jle     ?_029                                   ; 0A79 _ 0F 8E, FFFFFF41
        nop                                             ; 0A7F _ 90
        leave                                           ; 0A80 _ C9
        ret                                             ; 0A81 _ C3
; init_mouse_cursor End of function

putblock:; Function begin
        push    ebp                                     ; 0A82 _ 55
        mov     ebp, esp                                ; 0A83 _ 89. E5
        push    ebx                                     ; 0A85 _ 53
        sub     esp, 16                                 ; 0A86 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 0A89 _ C7. 45, F8, 00000000
        jmp     ?_039                                   ; 0A90 _ EB, 50

?_036:  mov     dword [ebp-0CH], 0                      ; 0A92 _ C7. 45, F4, 00000000
        jmp     ?_038                                   ; 0A99 _ EB, 3B

?_037:  mov     eax, dword [ebp-8H]                     ; 0A9B _ 8B. 45, F8
        imul    eax, dword [ebp+24H]                    ; 0A9E _ 0F AF. 45, 24
        mov     edx, eax                                ; 0AA2 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 0AA4 _ 8B. 45, F4
        add     eax, edx                                ; 0AA7 _ 01. D0
        mov     edx, eax                                ; 0AA9 _ 89. C2
        mov     eax, dword [ebp+20H]                    ; 0AAB _ 8B. 45, 20
        add     eax, edx                                ; 0AAE _ 01. D0
        mov     ecx, dword [ebp+1CH]                    ; 0AB0 _ 8B. 4D, 1C
        mov     edx, dword [ebp-8H]                     ; 0AB3 _ 8B. 55, F8
        add     edx, ecx                                ; 0AB6 _ 01. CA
        imul    edx, dword [ebp+0CH]                    ; 0AB8 _ 0F AF. 55, 0C
        mov     ebx, dword [ebp+18H]                    ; 0ABC _ 8B. 5D, 18
        mov     ecx, dword [ebp-0CH]                    ; 0ABF _ 8B. 4D, F4
        add     ecx, ebx                                ; 0AC2 _ 01. D9
        add     edx, ecx                                ; 0AC4 _ 01. CA
        mov     ecx, edx                                ; 0AC6 _ 89. D1
        mov     edx, dword [ebp+8H]                     ; 0AC8 _ 8B. 55, 08
        add     edx, ecx                                ; 0ACB _ 01. CA
        movzx   eax, byte [eax]                         ; 0ACD _ 0F B6. 00
        mov     byte [edx], al                          ; 0AD0 _ 88. 02
        add     dword [ebp-0CH], 1                      ; 0AD2 _ 83. 45, F4, 01
?_038:  mov     eax, dword [ebp-0CH]                    ; 0AD6 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 0AD9 _ 3B. 45, 10
        jl      ?_037                                   ; 0ADC _ 7C, BD
        add     dword [ebp-8H], 1                       ; 0ADE _ 83. 45, F8, 01
?_039:  mov     eax, dword [ebp-8H]                     ; 0AE2 _ 8B. 45, F8
        cmp     eax, dword [ebp+14H]                    ; 0AE5 _ 3B. 45, 14
        jl      ?_036                                   ; 0AE8 _ 7C, A8
        nop                                             ; 0AEA _ 90
        add     esp, 16                                 ; 0AEB _ 83. C4, 10
        pop     ebx                                     ; 0AEE _ 5B
        pop     ebp                                     ; 0AEF _ 5D
        ret                                             ; 0AF0 _ C3
; putblock End of function

intHandlerFromC:; Function begin
        push    ebp                                     ; 0AF1 _ 55
        mov     ebp, esp                                ; 0AF2 _ 89. E5
        sub     esp, 24                                 ; 0AF4 _ 83. EC, 18
        mov     eax, dword [bootInfo]                   ; 0AF7 _ A1, 00000000(d)
        mov     dword [ebp-14H], eax                    ; 0AFC _ 89. 45, EC
        movzx   eax, word [?_171]                       ; 0AFF _ 0F B7. 05, 00000004(d)
        cwde                                            ; 0B06 _ 98
        mov     dword [ebp-10H], eax                    ; 0B07 _ 89. 45, F0
        movzx   eax, word [?_172]                       ; 0B0A _ 0F B7. 05, 00000006(d)
        cwde                                            ; 0B11 _ 98
        mov     dword [ebp-0CH], eax                    ; 0B12 _ 89. 45, F4
        sub     esp, 8                                  ; 0B15 _ 83. EC, 08
        push    32                                      ; 0B18 _ 6A, 20
        push    32                                      ; 0B1A _ 6A, 20
        call    io_out8                                 ; 0B1C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0B21 _ 83. C4, 10
        mov     byte [ebp-15H], 0                       ; 0B24 _ C6. 45, EB, 00
        sub     esp, 12                                 ; 0B28 _ 83. EC, 0C
        push    96                                      ; 0B2B _ 6A, 60
        call    io_in8                                  ; 0B2D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0B32 _ 83. C4, 10
        mov     byte [ebp-15H], al                      ; 0B35 _ 88. 45, EB
        movzx   eax, byte [ebp-15H]                     ; 0B38 _ 0F B6. 45, EB
        sub     esp, 8                                  ; 0B3C _ 83. EC, 08
        push    eax                                     ; 0B3F _ 50
        push    keyinfo                                 ; 0B40 _ 68, 00000020(d)
        call    fifo8_put                               ; 0B45 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0B4A _ 83. C4, 10
        nop                                             ; 0B4D _ 90
        leave                                           ; 0B4E _ C9
        ret                                             ; 0B4F _ C3
; intHandlerFromC End of function

charToHexVal:; Function begin
        push    ebp                                     ; 0B50 _ 55
        mov     ebp, esp                                ; 0B51 _ 89. E5
        sub     esp, 4                                  ; 0B53 _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 0B56 _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 0B59 _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 0B5C _ 80. 7D, FC, 09
        jle     ?_040                                   ; 0B60 _ 7E, 09
        movzx   eax, byte [ebp-4H]                      ; 0B62 _ 0F B6. 45, FC
        add     eax, 55                                 ; 0B66 _ 83. C0, 37
        jmp     ?_041                                   ; 0B69 _ EB, 07

?_040:  movzx   eax, byte [ebp-4H]                      ; 0B6B _ 0F B6. 45, FC
        add     eax, 48                                 ; 0B6F _ 83. C0, 30
?_041:  leave                                           ; 0B72 _ C9
        ret                                             ; 0B73 _ C3
; charToHexVal End of function

charToHexStr:; Function begin
        push    ebp                                     ; 0B74 _ 55
        mov     ebp, esp                                ; 0B75 _ 89. E5
        sub     esp, 20                                 ; 0B77 _ 83. EC, 14
        mov     eax, dword [ebp+8H]                     ; 0B7A _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 0B7D _ 88. 45, EC
        movzx   eax, byte [ebp-14H]                     ; 0B80 _ 0F B6. 45, EC
        and     eax, 0FH                                ; 0B84 _ 83. E0, 0F
        mov     byte [ebp-1H], al                       ; 0B87 _ 88. 45, FF
        movsx   eax, byte [ebp-1H]                      ; 0B8A _ 0F BE. 45, FF
        push    eax                                     ; 0B8E _ 50
        call    charToHexVal                            ; 0B8F _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 0B94 _ 83. C4, 04
        mov     byte [?_170], al                        ; 0B97 _ A2, 00000003(d)
        shr     byte [ebp-14H], 4                       ; 0B9C _ C0. 6D, EC, 04
        movzx   eax, byte [ebp-14H]                     ; 0BA0 _ 0F B6. 45, EC
        movsx   eax, al                                 ; 0BA4 _ 0F BE. C0
        push    eax                                     ; 0BA7 _ 50
        call    charToHexVal                            ; 0BA8 _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 0BAD _ 83. C4, 04
        mov     byte [?_169], al                        ; 0BB0 _ A2, 00000002(d)
        mov     eax, keyval                             ; 0BB5 _ B8, 00000000(d)
        leave                                           ; 0BBA _ C9
        ret                                             ; 0BBB _ C3
; charToHexStr End of function

intToHexStr:; Function begin
        push    ebp                                     ; 0BBC _ 55
        mov     ebp, esp                                ; 0BBD _ 89. E5
        sub     esp, 16                                 ; 0BBF _ 83. EC, 10
        mov     byte [str.1851], 48                     ; 0BC2 _ C6. 05, 00000280(d), 30
        mov     byte [?_174], 88                        ; 0BC9 _ C6. 05, 00000281(d), 58
        mov     byte [?_175], 0                         ; 0BD0 _ C6. 05, 0000028A(d), 00
        mov     dword [ebp-8H], 2                       ; 0BD7 _ C7. 45, F8, 00000002
        mov     dword [ebp-0CH], 7                      ; 0BDE _ C7. 45, F4, 00000007
        jmp     ?_045                                   ; 0BE5 _ EB, 45

?_042:  mov     eax, dword [ebp+8H]                     ; 0BE7 _ 8B. 45, 08
        and     eax, 0FH                                ; 0BEA _ 83. E0, 0F
        mov     dword [ebp-4H], eax                     ; 0BED _ 89. 45, FC
        cmp     dword [ebp-4H], 9                       ; 0BF0 _ 83. 7D, FC, 09
        jg      ?_043                                   ; 0BF4 _ 7F, 18
        mov     eax, dword [ebp-4H]                     ; 0BF6 _ 8B. 45, FC
        lea     ecx, [eax+30H]                          ; 0BF9 _ 8D. 48, 30
        mov     edx, dword [ebp-8H]                     ; 0BFC _ 8B. 55, F8
        mov     eax, dword [ebp-0CH]                    ; 0BFF _ 8B. 45, F4
        add     eax, edx                                ; 0C02 _ 01. D0
        mov     edx, ecx                                ; 0C04 _ 89. CA
        mov     byte [str.1851+eax], dl                 ; 0C06 _ 88. 90, 00000280(d)
        jmp     ?_044                                   ; 0C0C _ EB, 16

?_043:  mov     eax, dword [ebp-4H]                     ; 0C0E _ 8B. 45, FC
        lea     ecx, [eax+37H]                          ; 0C11 _ 8D. 48, 37
        mov     edx, dword [ebp-8H]                     ; 0C14 _ 8B. 55, F8
        mov     eax, dword [ebp-0CH]                    ; 0C17 _ 8B. 45, F4
        add     eax, edx                                ; 0C1A _ 01. D0
        mov     edx, ecx                                ; 0C1C _ 89. CA
        mov     byte [str.1851+eax], dl                 ; 0C1E _ 88. 90, 00000280(d)
?_044:  shr     dword [ebp+8H], 4                       ; 0C24 _ C1. 6D, 08, 04
        sub     dword [ebp-0CH], 1                      ; 0C28 _ 83. 6D, F4, 01
?_045:  cmp     dword [ebp-0CH], 0                      ; 0C2C _ 83. 7D, F4, 00
        jns     ?_042                                   ; 0C30 _ 79, B5
        mov     eax, str.1851                           ; 0C32 _ B8, 00000280(d)
        leave                                           ; 0C37 _ C9
        ret                                             ; 0C38 _ C3
; intToHexStr End of function

wait_KBC_sendReady:; Function begin
        push    ebp                                     ; 0C39 _ 55
        mov     ebp, esp                                ; 0C3A _ 89. E5
        sub     esp, 8                                  ; 0C3C _ 83. EC, 08
?_046:  sub     esp, 12                                 ; 0C3F _ 83. EC, 0C
        push    100                                     ; 0C42 _ 6A, 64
        call    io_in8                                  ; 0C44 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0C49 _ 83. C4, 10
        and     eax, 02H                                ; 0C4C _ 83. E0, 02
        test    eax, eax                                ; 0C4F _ 85. C0
        jz      ?_047                                   ; 0C51 _ 74, 02
        jmp     ?_046                                   ; 0C53 _ EB, EA
; wait_KBC_sendReady End of function

?_047:  ; Local function
        nop                                             ; 0C55 _ 90
        nop                                             ; 0C56 _ 90
        leave                                           ; 0C57 _ C9
        ret                                             ; 0C58 _ C3

init_keyboard:; Function begin
        push    ebp                                     ; 0C59 _ 55
        mov     ebp, esp                                ; 0C5A _ 89. E5
        sub     esp, 8                                  ; 0C5C _ 83. EC, 08
        call    wait_KBC_sendReady                      ; 0C5F _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0C64 _ 83. EC, 08
        push    96                                      ; 0C67 _ 6A, 60
        push    100                                     ; 0C69 _ 6A, 64
        call    io_out8                                 ; 0C6B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0C70 _ 83. C4, 10
        call    wait_KBC_sendReady                      ; 0C73 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0C78 _ 83. EC, 08
        push    71                                      ; 0C7B _ 6A, 47
        push    96                                      ; 0C7D _ 6A, 60
        call    io_out8                                 ; 0C7F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0C84 _ 83. C4, 10
        nop                                             ; 0C87 _ 90
        leave                                           ; 0C88 _ C9
        ret                                             ; 0C89 _ C3
; init_keyboard End of function

enable_mouse:; Function begin
        push    ebp                                     ; 0C8A _ 55
        mov     ebp, esp                                ; 0C8B _ 89. E5
        sub     esp, 8                                  ; 0C8D _ 83. EC, 08
        call    wait_KBC_sendReady                      ; 0C90 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0C95 _ 83. EC, 08
        push    212                                     ; 0C98 _ 68, 000000D4
        push    100                                     ; 0C9D _ 6A, 64
        call    io_out8                                 ; 0C9F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0CA4 _ 83. C4, 10
        call    wait_KBC_sendReady                      ; 0CA7 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0CAC _ 83. EC, 08
        push    244                                     ; 0CAF _ 68, 000000F4
        push    96                                      ; 0CB4 _ 6A, 60
        call    io_out8                                 ; 0CB6 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0CBB _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 0CBE _ 8B. 45, 08
        mov     byte [eax+3H], 0                        ; 0CC1 _ C6. 40, 03, 00
        nop                                             ; 0CC5 _ 90
        leave                                           ; 0CC6 _ C9
        ret                                             ; 0CC7 _ C3
; enable_mouse End of function

intHandlerFromMouse:; Function begin
        push    ebp                                     ; 0CC8 _ 55
        mov     ebp, esp                                ; 0CC9 _ 89. E5
        sub     esp, 24                                 ; 0CCB _ 83. EC, 18
        sub     esp, 8                                  ; 0CCE _ 83. EC, 08
        push    32                                      ; 0CD1 _ 6A, 20
        push    160                                     ; 0CD3 _ 68, 000000A0
        call    io_out8                                 ; 0CD8 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0CDD _ 83. C4, 10
        sub     esp, 8                                  ; 0CE0 _ 83. EC, 08
        push    32                                      ; 0CE3 _ 6A, 20
        push    32                                      ; 0CE5 _ 6A, 20
        call    io_out8                                 ; 0CE7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0CEC _ 83. C4, 10
        sub     esp, 12                                 ; 0CEF _ 83. EC, 0C
        push    96                                      ; 0CF2 _ 6A, 60
        call    io_in8                                  ; 0CF4 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0CF9 _ 83. C4, 10
        mov     byte [ebp-9H], al                       ; 0CFC _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 0CFF _ 0F B6. 45, F7
        sub     esp, 8                                  ; 0D03 _ 83. EC, 08
        push    eax                                     ; 0D06 _ 50
        push    mouseinfo                               ; 0D07 _ 68, 00000008(d)
        call    fifo8_put                               ; 0D0C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0D11 _ 83. C4, 10
        nop                                             ; 0D14 _ 90
        leave                                           ; 0D15 _ C9
        ret                                             ; 0D16 _ C3
; intHandlerFromMouse End of function

mouse_decode:; Function begin
        push    ebp                                     ; 0D17 _ 55
        mov     ebp, esp                                ; 0D18 _ 89. E5
        sub     esp, 4                                  ; 0D1A _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 0D1D _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 0D20 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0D23 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 0D26 _ 0F B6. 40, 03
        test    al, al                                  ; 0D2A _ 84. C0
        jnz     ?_049                                   ; 0D2C _ 75, 17
        cmp     byte [ebp-4H], -6                       ; 0D2E _ 80. 7D, FC, FA
        jnz     ?_048                                   ; 0D32 _ 75, 07
        mov     eax, dword [ebp+8H]                     ; 0D34 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 0D37 _ C6. 40, 03, 01
?_048:  mov     eax, 0                                  ; 0D3B _ B8, 00000000
        jmp     ?_056                                   ; 0D40 _ E9, 0000010F

?_049:  mov     eax, dword [ebp+8H]                     ; 0D45 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 0D48 _ 0F B6. 40, 03
        cmp     al, 1                                   ; 0D4C _ 3C, 01
        jnz     ?_051                                   ; 0D4E _ 75, 28
        movzx   eax, byte [ebp-4H]                      ; 0D50 _ 0F B6. 45, FC
        and     eax, 0C8H                               ; 0D54 _ 25, 000000C8
        cmp     eax, 8                                  ; 0D59 _ 83. F8, 08
        jnz     ?_050                                   ; 0D5C _ 75, 10
        mov     eax, dword [ebp+8H]                     ; 0D5E _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 0D61 _ 0F B6. 55, FC
        mov     byte [eax], dl                          ; 0D65 _ 88. 10
        mov     eax, dword [ebp+8H]                     ; 0D67 _ 8B. 45, 08
        mov     byte [eax+3H], 2                        ; 0D6A _ C6. 40, 03, 02
?_050:  mov     eax, 0                                  ; 0D6E _ B8, 00000000
        jmp     ?_056                                   ; 0D73 _ E9, 000000DC

?_051:  mov     eax, dword [ebp+8H]                     ; 0D78 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 0D7B _ 0F B6. 40, 03
        cmp     al, 2                                   ; 0D7F _ 3C, 02
        jnz     ?_052                                   ; 0D81 _ 75, 1B
        mov     eax, dword [ebp+8H]                     ; 0D83 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 0D86 _ 0F B6. 55, FC
        mov     byte [eax+1H], dl                       ; 0D8A _ 88. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0D8D _ 8B. 45, 08
        mov     byte [eax+3H], 3                        ; 0D90 _ C6. 40, 03, 03
        mov     eax, 0                                  ; 0D94 _ B8, 00000000
        jmp     ?_056                                   ; 0D99 _ E9, 000000B6

?_052:  mov     eax, dword [ebp+8H]                     ; 0D9E _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 0DA1 _ 0F B6. 40, 03
        cmp     al, 3                                   ; 0DA5 _ 3C, 03
        jne     ?_055                                   ; 0DA7 _ 0F 85, 000000A2
        mov     eax, dword [ebp+8H]                     ; 0DAD _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 0DB0 _ 0F B6. 55, FC
        mov     byte [eax+2H], dl                       ; 0DB4 _ 88. 50, 02
        mov     eax, dword [ebp+8H]                     ; 0DB7 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 0DBA _ C6. 40, 03, 01
        mov     eax, dword [ebp+8H]                     ; 0DBE _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 0DC1 _ 0F B6. 00
        movzx   eax, al                                 ; 0DC4 _ 0F B6. C0
        and     eax, 07H                                ; 0DC7 _ 83. E0, 07
        mov     edx, eax                                ; 0DCA _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0DCC _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 0DCF _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 0DD2 _ 8B. 45, 08
        movzx   eax, byte [eax+1H]                      ; 0DD5 _ 0F B6. 40, 01
        movzx   edx, al                                 ; 0DD9 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 0DDC _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 0DDF _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0DE2 _ 8B. 45, 08
        movzx   eax, byte [eax+2H]                      ; 0DE5 _ 0F B6. 40, 02
        movzx   edx, al                                 ; 0DE9 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 0DEC _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0DEF _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 0DF2 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 0DF5 _ 0F B6. 00
        movzx   eax, al                                 ; 0DF8 _ 0F B6. C0
        and     eax, 10H                                ; 0DFB _ 83. E0, 10
        test    eax, eax                                ; 0DFE _ 85. C0
        jz      ?_053                                   ; 0E00 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 0E02 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0E05 _ 8B. 40, 04
        or      eax, 0FFFFFF00H                         ; 0E08 _ 0D, FFFFFF00
        mov     edx, eax                                ; 0E0D _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0E0F _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 0E12 _ 89. 50, 04
?_053:  mov     eax, dword [ebp+8H]                     ; 0E15 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 0E18 _ 0F B6. 00
        movzx   eax, al                                 ; 0E1B _ 0F B6. C0
        and     eax, 20H                                ; 0E1E _ 83. E0, 20
        test    eax, eax                                ; 0E21 _ 85. C0
        jz      ?_054                                   ; 0E23 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 0E25 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0E28 _ 8B. 40, 08
        or      eax, 0FFFFFF00H                         ; 0E2B _ 0D, FFFFFF00
        mov     edx, eax                                ; 0E30 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0E32 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0E35 _ 89. 50, 08
?_054:  mov     eax, dword [ebp+8H]                     ; 0E38 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0E3B _ 8B. 40, 08
        neg     eax                                     ; 0E3E _ F7. D8
        mov     edx, eax                                ; 0E40 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0E42 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0E45 _ 89. 50, 08
        mov     eax, 1                                  ; 0E48 _ B8, 00000001
        jmp     ?_056                                   ; 0E4D _ EB, 05

?_055:  mov     eax, 4294967295                         ; 0E4F _ B8, FFFFFFFF
?_056:  leave                                           ; 0E54 _ C9
        ret                                             ; 0E55 _ C3
; mouse_decode End of function

computeMousePosition:; Function begin
        push    ebp                                     ; 0E56 _ 55
        mov     ebp, esp                                ; 0E57 _ 89. E5
        sub     esp, 24                                 ; 0E59 _ 83. EC, 18
        movzx   eax, word [?_171]                       ; 0E5C _ 0F B7. 05, 00000004(d)
        cwde                                            ; 0E63 _ 98
        mov     dword [ebp-14H], eax                    ; 0E64 _ 89. 45, EC
        movzx   eax, word [?_172]                       ; 0E67 _ 0F B7. 05, 00000006(d)
        cwde                                            ; 0E6E _ 98
        mov     dword [ebp-10H], eax                    ; 0E6F _ 89. 45, F0
        mov     eax, dword [ebp+10H]                    ; 0E72 _ 8B. 45, 10
        mov     dword [eax+4H], 16                      ; 0E75 _ C7. 40, 04, 00000010
        mov     eax, dword [ebp+10H]                    ; 0E7C _ 8B. 45, 10
        mov     dword [eax+8H], 16                      ; 0E7F _ C7. 40, 08, 00000010
        mov     eax, dword [ebp+14H]                    ; 0E86 _ 8B. 45, 14
        mov     edx, dword [eax+4H]                     ; 0E89 _ 8B. 50, 04
        mov     eax, dword [mx]                         ; 0E8C _ A1, 000000F0(d)
        add     eax, edx                                ; 0E91 _ 01. D0
        mov     dword [mx], eax                         ; 0E93 _ A3, 000000F0(d)
        mov     eax, dword [ebp+14H]                    ; 0E98 _ 8B. 45, 14
        mov     edx, dword [eax+8H]                     ; 0E9B _ 8B. 50, 08
        mov     eax, dword [my]                         ; 0E9E _ A1, 000000F4(d)
        add     eax, edx                                ; 0EA3 _ 01. D0
        mov     dword [my], eax                         ; 0EA5 _ A3, 000000F4(d)
        mov     eax, dword [mx]                         ; 0EAA _ A1, 000000F0(d)
        test    eax, eax                                ; 0EAF _ 85. C0
        jns     ?_057                                   ; 0EB1 _ 79, 0A
        mov     dword [mx], 0                           ; 0EB3 _ C7. 05, 000000F0(d), 00000000
?_057:  mov     eax, dword [my]                         ; 0EBD _ A1, 000000F4(d)
        test    eax, eax                                ; 0EC2 _ 85. C0
        jns     ?_058                                   ; 0EC4 _ 79, 0A
        mov     dword [my], 0                           ; 0EC6 _ C7. 05, 000000F4(d), 00000000
?_058:  mov     eax, dword [ebp-10H]                    ; 0ED0 _ 8B. 45, F0
        lea     edx, [eax-10H]                          ; 0ED3 _ 8D. 50, F0
        mov     eax, dword [my]                         ; 0ED6 _ A1, 000000F4(d)
        cmp     edx, eax                                ; 0EDB _ 39. C2
        jge     ?_059                                   ; 0EDD _ 7D, 10
        mov     eax, dword [my]                         ; 0EDF _ A1, 000000F4(d)
        mov     edx, dword [ebp-10H]                    ; 0EE4 _ 8B. 55, F0
        sub     edx, eax                                ; 0EE7 _ 29. C2
        mov     eax, dword [ebp+10H]                    ; 0EE9 _ 8B. 45, 10
        mov     dword [eax+8H], edx                     ; 0EEC _ 89. 50, 08
?_059:  mov     dword [ebp-0CH], 1                      ; 0EEF _ C7. 45, F4, 00000001
        mov     eax, dword [ebp-14H]                    ; 0EF6 _ 8B. 45, EC
        sub     eax, dword [ebp-0CH]                    ; 0EF9 _ 2B. 45, F4
        mov     edx, eax                                ; 0EFC _ 89. C2
        mov     eax, dword [mx]                         ; 0EFE _ A1, 000000F0(d)
        cmp     edx, eax                                ; 0F03 _ 39. C2
        jge     ?_060                                   ; 0F05 _ 7D, 14
        mov     eax, dword [ebp-14H]                    ; 0F07 _ 8B. 45, EC
        sub     eax, dword [ebp-0CH]                    ; 0F0A _ 2B. 45, F4
        mov     dword [mx], eax                         ; 0F0D _ A3, 000000F0(d)
        mov     eax, dword [ebp+10H]                    ; 0F12 _ 8B. 45, 10
        mov     edx, dword [ebp-0CH]                    ; 0F15 _ 8B. 55, F4
        mov     dword [eax+4H], edx                     ; 0F18 _ 89. 50, 04
?_060:  mov     eax, dword [ebp-10H]                    ; 0F1B _ 8B. 45, F0
        sub     eax, dword [ebp-0CH]                    ; 0F1E _ 2B. 45, F4
        mov     edx, eax                                ; 0F21 _ 89. C2
        mov     eax, dword [my]                         ; 0F23 _ A1, 000000F4(d)
        cmp     edx, eax                                ; 0F28 _ 39. C2
        jge     ?_061                                   ; 0F2A _ 7D, 14
        mov     eax, dword [ebp-10H]                    ; 0F2C _ 8B. 45, F0
        sub     eax, dword [ebp-0CH]                    ; 0F2F _ 2B. 45, F4
        mov     dword [my], eax                         ; 0F32 _ A3, 000000F4(d)
        mov     eax, dword [ebp+10H]                    ; 0F37 _ 8B. 45, 10
        mov     edx, dword [ebp-0CH]                    ; 0F3A _ 8B. 55, F4
        mov     dword [eax+8H], edx                     ; 0F3D _ 89. 50, 08
?_061:  sub     esp, 8                                  ; 0F40 _ 83. EC, 08
        push    ?_160                                   ; 0F43 _ 68, 0000001C(d)
        push    7                                       ; 0F48 _ 6A, 07
        push    0                                       ; 0F4A _ 6A, 00
        push    0                                       ; 0F4C _ 6A, 00
        push    dword [ebp+0CH]                         ; 0F4E _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0F51 _ FF. 75, 08
        call    showString                              ; 0F54 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0F59 _ 83. C4, 20
        nop                                             ; 0F5C _ 90
        leave                                           ; 0F5D _ C9
        ret                                             ; 0F5E _ C3
; computeMousePosition End of function

show_mouse_info:; Function begin
        push    ebp                                     ; 0F5F _ 55
        mov     ebp, esp                                ; 0F60 _ 89. E5
        sub     esp, 24                                 ; 0F62 _ 83. EC, 18
        mov     eax, dword [buf_back]                   ; 0F65 _ A1, 000000F8(d)
        mov     dword [ebp-0CH], eax                    ; 0F6A _ 89. 45, F4
        mov     byte [ebp-0DH], 0                       ; 0F6D _ C6. 45, F3, 00
        call    io_sti                                  ; 0F71 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 0F76 _ 83. EC, 0C
        push    mouseinfo                               ; 0F79 _ 68, 00000008(d)
        call    fifo8_get                               ; 0F7E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0F83 _ 83. C4, 10
        mov     byte [ebp-0DH], al                      ; 0F86 _ 88. 45, F3
        movzx   eax, byte [ebp-0DH]                     ; 0F89 _ 0F B6. 45, F3
        sub     esp, 8                                  ; 0F8D _ 83. EC, 08
        push    eax                                     ; 0F90 _ 50
        push    mdec                                    ; 0F91 _ 68, 000000E0(d)
        call    mouse_decode                            ; 0F96 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0F9B _ 83. C4, 10
        cmp     eax, 1                                  ; 0F9E _ 83. F8, 01
        jnz     ?_062                                   ; 0FA1 _ 75, 31
        push    mdec                                    ; 0FA3 _ 68, 000000E0(d)
        push    dword [ebp+10H]                         ; 0FA8 _ FF. 75, 10
        push    dword [ebp+0CH]                         ; 0FAB _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0FAE _ FF. 75, 08
        call    computeMousePosition                    ; 0FB1 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0FB6 _ 83. C4, 10
        mov     edx, dword [my]                         ; 0FB9 _ 8B. 15, 000000F4(d)
        mov     eax, dword [mx]                         ; 0FBF _ A1, 000000F0(d)
        push    edx                                     ; 0FC4 _ 52
        push    eax                                     ; 0FC5 _ 50
        push    dword [ebp+10H]                         ; 0FC6 _ FF. 75, 10
        push    dword [ebp+8H]                          ; 0FC9 _ FF. 75, 08
        call    sheet_slide_mouse                       ; 0FCC _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0FD1 _ 83. C4, 10
?_062:  nop                                             ; 0FD4 _ 90
        leave                                           ; 0FD5 _ C9
        ret                                             ; 0FD6 _ C3
; show_mouse_info End of function

showMemoryInfo:; Function begin
        push    ebp                                     ; 0FD7 _ 55
        mov     ebp, esp                                ; 0FD8 _ 89. E5
        sub     esp, 56                                 ; 0FDA _ 83. EC, 38
        mov     dword [ebp-30H], 0                      ; 0FDD _ C7. 45, D0, 00000000
        mov     dword [ebp-2CH], 0                      ; 0FE4 _ C7. 45, D4, 00000000
        mov     dword [ebp-28H], 104                    ; 0FEB _ C7. 45, D8, 00000068
        mov     dword [ebp-24H], 80                     ; 0FF2 _ C7. 45, DC, 00000050
        mov     edx, dword [ysize]                      ; 0FF9 _ 8B. 15, 00000204(d)
        mov     eax, dword [ebp+0CH]                    ; 0FFF _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1002 _ 8B. 00
        sub     esp, 4                                  ; 1004 _ 83. EC, 04
        push    edx                                     ; 1007 _ 52
        push    dword [ebp+1CH]                         ; 1008 _ FF. 75, 1C
        push    eax                                     ; 100B _ 50
        call    init_screen8                            ; 100C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1011 _ 83. C4, 10
        mov     eax, dword [ebp+20H]                    ; 1014 _ 8B. 45, 20
        movsx   eax, al                                 ; 1017 _ 0F BE. C0
        sub     esp, 8                                  ; 101A _ 83. EC, 08
        push    ?_161                                   ; 101D _ 68, 00000034(d)
        push    eax                                     ; 1022 _ 50
        push    dword [ebp-2CH]                         ; 1023 _ FF. 75, D4
        push    dword [ebp-30H]                         ; 1026 _ FF. 75, D0
        push    dword [ebp+0CH]                         ; 1029 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 102C _ FF. 75, 08
        call    showString                              ; 102F _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1034 _ 83. C4, 20
        mov     eax, dword [ebp+18H]                    ; 1037 _ 8B. 45, 18
        sub     esp, 12                                 ; 103A _ 83. EC, 0C
        push    eax                                     ; 103D _ 50
        call    intToHexStr                             ; 103E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1043 _ 83. C4, 10
        mov     dword [ebp-20H], eax                    ; 1046 _ 89. 45, E0
        mov     eax, dword [ebp+20H]                    ; 1049 _ 8B. 45, 20
        movsx   eax, al                                 ; 104C _ 0F BE. C0
        sub     esp, 8                                  ; 104F _ 83. EC, 08
        push    dword [ebp-20H]                         ; 1052 _ FF. 75, E0
        push    eax                                     ; 1055 _ 50
        push    dword [ebp-2CH]                         ; 1056 _ FF. 75, D4
        push    dword [ebp-28H]                         ; 1059 _ FF. 75, D8
        push    dword [ebp+0CH]                         ; 105C _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 105F _ FF. 75, 08
        call    showString                              ; 1062 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1067 _ 83. C4, 20
        add     dword [ebp-2CH], 16                     ; 106A _ 83. 45, D4, 10
        mov     eax, dword [ebp+20H]                    ; 106E _ 8B. 45, 20
        movsx   eax, al                                 ; 1071 _ 0F BE. C0
        sub     esp, 8                                  ; 1074 _ 83. EC, 08
        push    ?_162                                   ; 1077 _ 68, 0000003E(d)
        push    eax                                     ; 107C _ 50
        push    dword [ebp-2CH]                         ; 107D _ FF. 75, D4
        push    dword [ebp-30H]                         ; 1080 _ FF. 75, D0
        push    dword [ebp+0CH]                         ; 1083 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1086 _ FF. 75, 08
        call    showString                              ; 1089 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 108E _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 1091 _ 8B. 45, 10
        mov     eax, dword [eax]                        ; 1094 _ 8B. 00
        sub     esp, 12                                 ; 1096 _ 83. EC, 0C
        push    eax                                     ; 1099 _ 50
        call    intToHexStr                             ; 109A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 109F _ 83. C4, 10
        mov     dword [ebp-1CH], eax                    ; 10A2 _ 89. 45, E4
        mov     eax, dword [ebp+20H]                    ; 10A5 _ 8B. 45, 20
        movsx   eax, al                                 ; 10A8 _ 0F BE. C0
        sub     esp, 8                                  ; 10AB _ 83. EC, 08
        push    dword [ebp-1CH]                         ; 10AE _ FF. 75, E4
        push    eax                                     ; 10B1 _ 50
        push    dword [ebp-2CH]                         ; 10B2 _ FF. 75, D4
        push    dword [ebp-28H]                         ; 10B5 _ FF. 75, D8
        push    dword [ebp+0CH]                         ; 10B8 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 10BB _ FF. 75, 08
        call    showString                              ; 10BE _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 10C3 _ 83. C4, 20
        add     dword [ebp-2CH], 16                     ; 10C6 _ 83. 45, D4, 10
        mov     eax, dword [ebp+20H]                    ; 10CA _ 8B. 45, 20
        movsx   eax, al                                 ; 10CD _ 0F BE. C0
        sub     esp, 8                                  ; 10D0 _ 83. EC, 08
        push    ?_163                                   ; 10D3 _ 68, 0000004A(d)
        push    eax                                     ; 10D8 _ 50
        push    dword [ebp-2CH]                         ; 10D9 _ FF. 75, D4
        push    dword [ebp-30H]                         ; 10DC _ FF. 75, D0
        push    dword [ebp+0CH]                         ; 10DF _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 10E2 _ FF. 75, 08
        call    showString                              ; 10E5 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 10EA _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 10ED _ 8B. 45, 10
        mov     eax, dword [eax+4H]                     ; 10F0 _ 8B. 40, 04
        sub     esp, 12                                 ; 10F3 _ 83. EC, 0C
        push    eax                                     ; 10F6 _ 50
        call    intToHexStr                             ; 10F7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 10FC _ 83. C4, 10
        mov     dword [ebp-18H], eax                    ; 10FF _ 89. 45, E8
        mov     eax, dword [ebp+20H]                    ; 1102 _ 8B. 45, 20
        movsx   eax, al                                 ; 1105 _ 0F BE. C0
        sub     esp, 8                                  ; 1108 _ 83. EC, 08
        push    dword [ebp-18H]                         ; 110B _ FF. 75, E8
        push    eax                                     ; 110E _ 50
        push    dword [ebp-2CH]                         ; 110F _ FF. 75, D4
        push    dword [ebp-28H]                         ; 1112 _ FF. 75, D8
        push    dword [ebp+0CH]                         ; 1115 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1118 _ FF. 75, 08
        call    showString                              ; 111B _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1120 _ 83. C4, 20
        add     dword [ebp-2CH], 16                     ; 1123 _ 83. 45, D4, 10
        mov     eax, dword [ebp+20H]                    ; 1127 _ 8B. 45, 20
        movsx   eax, al                                 ; 112A _ 0F BE. C0
        sub     esp, 8                                  ; 112D _ 83. EC, 08
        push    ?_164                                   ; 1130 _ 68, 00000056(d)
        push    eax                                     ; 1135 _ 50
        push    dword [ebp-2CH]                         ; 1136 _ FF. 75, D4
        push    dword [ebp-30H]                         ; 1139 _ FF. 75, D0
        push    dword [ebp+0CH]                         ; 113C _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 113F _ FF. 75, 08
        call    showString                              ; 1142 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1147 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 114A _ 8B. 45, 10
        mov     eax, dword [eax+8H]                     ; 114D _ 8B. 40, 08
        sub     esp, 12                                 ; 1150 _ 83. EC, 0C
        push    eax                                     ; 1153 _ 50
        call    intToHexStr                             ; 1154 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1159 _ 83. C4, 10
        mov     dword [ebp-14H], eax                    ; 115C _ 89. 45, EC
        mov     eax, dword [ebp+20H]                    ; 115F _ 8B. 45, 20
        movsx   eax, al                                 ; 1162 _ 0F BE. C0
        sub     esp, 8                                  ; 1165 _ 83. EC, 08
        push    dword [ebp-14H]                         ; 1168 _ FF. 75, EC
        push    eax                                     ; 116B _ 50
        push    dword [ebp-2CH]                         ; 116C _ FF. 75, D4
        push    dword [ebp-28H]                         ; 116F _ FF. 75, D8
        push    dword [ebp+0CH]                         ; 1172 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1175 _ FF. 75, 08
        call    showString                              ; 1178 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 117D _ 83. C4, 20
        add     dword [ebp-2CH], 16                     ; 1180 _ 83. 45, D4, 10
        mov     eax, dword [ebp+20H]                    ; 1184 _ 8B. 45, 20
        movsx   eax, al                                 ; 1187 _ 0F BE. C0
        sub     esp, 8                                  ; 118A _ 83. EC, 08
        push    ?_165                                   ; 118D _ 68, 00000062(d)
        push    eax                                     ; 1192 _ 50
        push    dword [ebp-2CH]                         ; 1193 _ FF. 75, D4
        push    dword [ebp-30H]                         ; 1196 _ FF. 75, D0
        push    dword [ebp+0CH]                         ; 1199 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 119C _ FF. 75, 08
        call    showString                              ; 119F _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 11A4 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 11A7 _ 8B. 45, 10
        mov     eax, dword [eax+0CH]                    ; 11AA _ 8B. 40, 0C
        sub     esp, 12                                 ; 11AD _ 83. EC, 0C
        push    eax                                     ; 11B0 _ 50
        call    intToHexStr                             ; 11B1 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 11B6 _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 11B9 _ 89. 45, F0
        mov     eax, dword [ebp+20H]                    ; 11BC _ 8B. 45, 20
        movsx   eax, al                                 ; 11BF _ 0F BE. C0
        sub     esp, 8                                  ; 11C2 _ 83. EC, 08
        push    dword [ebp-10H]                         ; 11C5 _ FF. 75, F0
        push    eax                                     ; 11C8 _ 50
        push    dword [ebp-2CH]                         ; 11C9 _ FF. 75, D4
        push    dword [ebp-28H]                         ; 11CC _ FF. 75, D8
        push    dword [ebp+0CH]                         ; 11CF _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 11D2 _ FF. 75, 08
        call    showString                              ; 11D5 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 11DA _ 83. C4, 20
        add     dword [ebp-2CH], 16                     ; 11DD _ 83. 45, D4, 10
        mov     eax, dword [ebp+20H]                    ; 11E1 _ 8B. 45, 20
        movsx   eax, al                                 ; 11E4 _ 0F BE. C0
        sub     esp, 8                                  ; 11E7 _ 83. EC, 08
        push    ?_166                                   ; 11EA _ 68, 0000006F(d)
        push    eax                                     ; 11EF _ 50
        push    dword [ebp-2CH]                         ; 11F0 _ FF. 75, D4
        push    dword [ebp-30H]                         ; 11F3 _ FF. 75, D0
        push    dword [ebp+0CH]                         ; 11F6 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 11F9 _ FF. 75, 08
        call    showString                              ; 11FC _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1201 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 1204 _ 8B. 45, 10
        mov     eax, dword [eax+10H]                    ; 1207 _ 8B. 40, 10
        sub     esp, 12                                 ; 120A _ 83. EC, 0C
        push    eax                                     ; 120D _ 50
        call    intToHexStr                             ; 120E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1213 _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 1216 _ 89. 45, F4
        mov     eax, dword [ebp+20H]                    ; 1219 _ 8B. 45, 20
        movsx   eax, al                                 ; 121C _ 0F BE. C0
        sub     esp, 8                                  ; 121F _ 83. EC, 08
        push    dword [ebp-0CH]                         ; 1222 _ FF. 75, F4
        push    eax                                     ; 1225 _ 50
        push    dword [ebp-2CH]                         ; 1226 _ FF. 75, D4
        push    dword [ebp-28H]                         ; 1229 _ FF. 75, D8
        push    dword [ebp+0CH]                         ; 122C _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 122F _ FF. 75, 08
        call    showString                              ; 1232 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1237 _ 83. C4, 20
        nop                                             ; 123A _ 90
        leave                                           ; 123B _ C9
        ret                                             ; 123C _ C3
; showMemoryInfo End of function

init_screen8:; Function begin
        push    ebp                                     ; 123D _ 55
        mov     ebp, esp                                ; 123E _ 89. E5
        push    ebx                                     ; 1240 _ 53
        mov     eax, dword [ebp+10H]                    ; 1241 _ 8B. 45, 10
        lea     edx, [eax-1DH]                          ; 1244 _ 8D. 50, E3
        mov     eax, dword [ebp+0CH]                    ; 1247 _ 8B. 45, 0C
        sub     eax, 1                                  ; 124A _ 83. E8, 01
        push    edx                                     ; 124D _ 52
        push    eax                                     ; 124E _ 50
        push    0                                       ; 124F _ 6A, 00
        push    0                                       ; 1251 _ 6A, 00
        push    14                                      ; 1253 _ 6A, 0E
        push    dword [ebp+0CH]                         ; 1255 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1258 _ FF. 75, 08
        call    boxfill8                                ; 125B _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1260 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 1263 _ 8B. 45, 10
        lea     ecx, [eax-1CH]                          ; 1266 _ 8D. 48, E4
        mov     eax, dword [ebp+0CH]                    ; 1269 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 126C _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 126F _ 8B. 45, 10
        sub     eax, 28                                 ; 1272 _ 83. E8, 1C
        push    ecx                                     ; 1275 _ 51
        push    edx                                     ; 1276 _ 52
        push    eax                                     ; 1277 _ 50
        push    0                                       ; 1278 _ 6A, 00
        push    8                                       ; 127A _ 6A, 08
        push    dword [ebp+0CH]                         ; 127C _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 127F _ FF. 75, 08
        call    boxfill8                                ; 1282 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1287 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 128A _ 8B. 45, 10
        lea     ecx, [eax-1BH]                          ; 128D _ 8D. 48, E5
        mov     eax, dword [ebp+0CH]                    ; 1290 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 1293 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 1296 _ 8B. 45, 10
        sub     eax, 27                                 ; 1299 _ 83. E8, 1B
        push    ecx                                     ; 129C _ 51
        push    edx                                     ; 129D _ 52
        push    eax                                     ; 129E _ 50
        push    0                                       ; 129F _ 6A, 00
        push    7                                       ; 12A1 _ 6A, 07
        push    dword [ebp+0CH]                         ; 12A3 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 12A6 _ FF. 75, 08
        call    boxfill8                                ; 12A9 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 12AE _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 12B1 _ 8B. 45, 10
        lea     ecx, [eax-1H]                           ; 12B4 _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 12B7 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 12BA _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 12BD _ 8B. 45, 10
        sub     eax, 26                                 ; 12C0 _ 83. E8, 1A
        push    ecx                                     ; 12C3 _ 51
        push    edx                                     ; 12C4 _ 52
        push    eax                                     ; 12C5 _ 50
        push    0                                       ; 12C6 _ 6A, 00
        push    8                                       ; 12C8 _ 6A, 08
        push    dword [ebp+0CH]                         ; 12CA _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 12CD _ FF. 75, 08
        call    boxfill8                                ; 12D0 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 12D5 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 12D8 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 12DB _ 8D. 50, E8
        mov     eax, dword [ebp+10H]                    ; 12DE _ 8B. 45, 10
        sub     eax, 24                                 ; 12E1 _ 83. E8, 18
        push    edx                                     ; 12E4 _ 52
        push    59                                      ; 12E5 _ 6A, 3B
        push    eax                                     ; 12E7 _ 50
        push    3                                       ; 12E8 _ 6A, 03
        push    7                                       ; 12EA _ 6A, 07
        push    dword [ebp+0CH]                         ; 12EC _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 12EF _ FF. 75, 08
        call    boxfill8                                ; 12F2 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 12F7 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 12FA _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 12FD _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 1300 _ 8B. 45, 10
        sub     eax, 24                                 ; 1303 _ 83. E8, 18
        push    edx                                     ; 1306 _ 52
        push    2                                       ; 1307 _ 6A, 02
        push    eax                                     ; 1309 _ 50
        push    2                                       ; 130A _ 6A, 02
        push    7                                       ; 130C _ 6A, 07
        push    dword [ebp+0CH]                         ; 130E _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1311 _ FF. 75, 08
        call    boxfill8                                ; 1314 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1319 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 131C _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 131F _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 1322 _ 8B. 45, 10
        sub     eax, 4                                  ; 1325 _ 83. E8, 04
        push    edx                                     ; 1328 _ 52
        push    59                                      ; 1329 _ 6A, 3B
        push    eax                                     ; 132B _ 50
        push    3                                       ; 132C _ 6A, 03
        push    15                                      ; 132E _ 6A, 0F
        push    dword [ebp+0CH]                         ; 1330 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1333 _ FF. 75, 08
        call    boxfill8                                ; 1336 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 133B _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 133E _ 8B. 45, 10
        lea     edx, [eax-5H]                           ; 1341 _ 8D. 50, FB
        mov     eax, dword [ebp+10H]                    ; 1344 _ 8B. 45, 10
        sub     eax, 23                                 ; 1347 _ 83. E8, 17
        push    edx                                     ; 134A _ 52
        push    59                                      ; 134B _ 6A, 3B
        push    eax                                     ; 134D _ 50
        push    59                                      ; 134E _ 6A, 3B
        push    15                                      ; 1350 _ 6A, 0F
        push    dword [ebp+0CH]                         ; 1352 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1355 _ FF. 75, 08
        call    boxfill8                                ; 1358 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 135D _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 1360 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 1363 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 1366 _ 8B. 45, 10
        sub     eax, 3                                  ; 1369 _ 83. E8, 03
        push    edx                                     ; 136C _ 52
        push    59                                      ; 136D _ 6A, 3B
        push    eax                                     ; 136F _ 50
        push    2                                       ; 1370 _ 6A, 02
        push    0                                       ; 1372 _ 6A, 00
        push    dword [ebp+0CH]                         ; 1374 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1377 _ FF. 75, 08
        call    boxfill8                                ; 137A _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 137F _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 1382 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 1385 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 1388 _ 8B. 45, 10
        sub     eax, 24                                 ; 138B _ 83. E8, 18
        push    edx                                     ; 138E _ 52
        push    60                                      ; 138F _ 6A, 3C
        push    eax                                     ; 1391 _ 50
        push    60                                      ; 1392 _ 6A, 3C
        push    0                                       ; 1394 _ 6A, 00
        push    dword [ebp+0CH]                         ; 1396 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1399 _ FF. 75, 08
        call    boxfill8                                ; 139C _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 13A1 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 13A4 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 13A7 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 13AA _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 13AD _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 13B0 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 13B3 _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 13B6 _ 8B. 45, 0C
        sub     eax, 47                                 ; 13B9 _ 83. E8, 2F
        push    ebx                                     ; 13BC _ 53
        push    ecx                                     ; 13BD _ 51
        push    edx                                     ; 13BE _ 52
        push    eax                                     ; 13BF _ 50
        push    7                                       ; 13C0 _ 6A, 07
        push    dword [ebp+0CH]                         ; 13C2 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 13C5 _ FF. 75, 08
        call    boxfill8                                ; 13C8 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 13CD _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 13D0 _ 8B. 45, 10
        lea     ebx, [eax-4H]                           ; 13D3 _ 8D. 58, FC
        mov     eax, dword [ebp+0CH]                    ; 13D6 _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 13D9 _ 8D. 48, FD
        mov     eax, dword [ebp+10H]                    ; 13DC _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 13DF _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 13E2 _ 8B. 45, 0C
        sub     eax, 3                                  ; 13E5 _ 83. E8, 03
        push    ebx                                     ; 13E8 _ 53
        push    ecx                                     ; 13E9 _ 51
        push    edx                                     ; 13EA _ 52
        push    eax                                     ; 13EB _ 50
        push    7                                       ; 13EC _ 6A, 07
        push    dword [ebp+0CH]                         ; 13EE _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 13F1 _ FF. 75, 08
        call    boxfill8                                ; 13F4 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 13F9 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 13FC _ 8B. 45, 10
        lea     ebx, [eax-18H]                          ; 13FF _ 8D. 58, E8
        mov     eax, dword [ebp+0CH]                    ; 1402 _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 1405 _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 1408 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 140B _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 140E _ 8B. 45, 0C
        sub     eax, 47                                 ; 1411 _ 83. E8, 2F
        push    ebx                                     ; 1414 _ 53
        push    ecx                                     ; 1415 _ 51
        push    edx                                     ; 1416 _ 52
        push    eax                                     ; 1417 _ 50
        push    15                                      ; 1418 _ 6A, 0F
        push    dword [ebp+0CH]                         ; 141A _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 141D _ FF. 75, 08
        call    boxfill8                                ; 1420 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1425 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 1428 _ 8B. 45, 10
        lea     ebx, [eax-4H]                           ; 142B _ 8D. 58, FC
        mov     eax, dword [ebp+0CH]                    ; 142E _ 8B. 45, 0C
        lea     ecx, [eax-2FH]                          ; 1431 _ 8D. 48, D1
        mov     eax, dword [ebp+10H]                    ; 1434 _ 8B. 45, 10
        lea     edx, [eax-17H]                          ; 1437 _ 8D. 50, E9
        mov     eax, dword [ebp+0CH]                    ; 143A _ 8B. 45, 0C
        sub     eax, 47                                 ; 143D _ 83. E8, 2F
        push    ebx                                     ; 1440 _ 53
        push    ecx                                     ; 1441 _ 51
        push    edx                                     ; 1442 _ 52
        push    eax                                     ; 1443 _ 50
        push    15                                      ; 1444 _ 6A, 0F
        push    dword [ebp+0CH]                         ; 1446 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1449 _ FF. 75, 08
        call    boxfill8                                ; 144C _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1451 _ 83. C4, 1C
        nop                                             ; 1454 _ 90
        mov     ebx, dword [ebp-4H]                     ; 1455 _ 8B. 5D, FC
        leave                                           ; 1458 _ C9
        ret                                             ; 1459 _ C3
; init_screen8 End of function

make_window8:; Function begin
        push    ebp                                     ; 145A _ 55
        mov     ebp, esp                                ; 145B _ 89. E5
        push    ebx                                     ; 145D _ 53
        sub     esp, 36                                 ; 145E _ 83. EC, 24
        mov     eax, dword [ebp+0CH]                    ; 1461 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1464 _ 8B. 40, 04
        mov     dword [ebp-10H], eax                    ; 1467 _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 146A _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 146D _ 8B. 40, 08
        mov     dword [ebp-0CH], eax                    ; 1470 _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 1473 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 1476 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1479 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 147C _ 8B. 00
        push    0                                       ; 147E _ 6A, 00
        push    edx                                     ; 1480 _ 52
        push    0                                       ; 1481 _ 6A, 00
        push    0                                       ; 1483 _ 6A, 00
        push    8                                       ; 1485 _ 6A, 08
        push    dword [ebp-10H]                         ; 1487 _ FF. 75, F0
        push    eax                                     ; 148A _ 50
        call    boxfill8                                ; 148B _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1490 _ 83. C4, 1C
        mov     eax, dword [ebp-10H]                    ; 1493 _ 8B. 45, F0
        lea     edx, [eax-2H]                           ; 1496 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 1499 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 149C _ 8B. 00
        push    1                                       ; 149E _ 6A, 01
        push    edx                                     ; 14A0 _ 52
        push    1                                       ; 14A1 _ 6A, 01
        push    1                                       ; 14A3 _ 6A, 01
        push    7                                       ; 14A5 _ 6A, 07
        push    dword [ebp-10H]                         ; 14A7 _ FF. 75, F0
        push    eax                                     ; 14AA _ 50
        call    boxfill8                                ; 14AB _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 14B0 _ 83. C4, 1C
        mov     eax, dword [ebp-0CH]                    ; 14B3 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 14B6 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 14B9 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 14BC _ 8B. 00
        push    edx                                     ; 14BE _ 52
        push    0                                       ; 14BF _ 6A, 00
        push    0                                       ; 14C1 _ 6A, 00
        push    0                                       ; 14C3 _ 6A, 00
        push    8                                       ; 14C5 _ 6A, 08
        push    dword [ebp-10H]                         ; 14C7 _ FF. 75, F0
        push    eax                                     ; 14CA _ 50
        call    boxfill8                                ; 14CB _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 14D0 _ 83. C4, 1C
        mov     eax, dword [ebp-0CH]                    ; 14D3 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 14D6 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 14D9 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 14DC _ 8B. 00
        push    edx                                     ; 14DE _ 52
        push    1                                       ; 14DF _ 6A, 01
        push    1                                       ; 14E1 _ 6A, 01
        push    1                                       ; 14E3 _ 6A, 01
        push    8                                       ; 14E5 _ 6A, 08
        push    dword [ebp-10H]                         ; 14E7 _ FF. 75, F0
        push    eax                                     ; 14EA _ 50
        call    boxfill8                                ; 14EB _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 14F0 _ 83. C4, 1C
        mov     eax, dword [ebp-0CH]                    ; 14F3 _ 8B. 45, F4
        lea     ebx, [eax-2H]                           ; 14F6 _ 8D. 58, FE
        mov     eax, dword [ebp-10H]                    ; 14F9 _ 8B. 45, F0
        lea     ecx, [eax-2H]                           ; 14FC _ 8D. 48, FE
        mov     eax, dword [ebp-10H]                    ; 14FF _ 8B. 45, F0
        lea     edx, [eax-2H]                           ; 1502 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 1505 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1508 _ 8B. 00
        push    ebx                                     ; 150A _ 53
        push    ecx                                     ; 150B _ 51
        push    1                                       ; 150C _ 6A, 01
        push    edx                                     ; 150E _ 52
        push    15                                      ; 150F _ 6A, 0F
        push    dword [ebp-10H]                         ; 1511 _ FF. 75, F0
        push    eax                                     ; 1514 _ 50
        call    boxfill8                                ; 1515 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 151A _ 83. C4, 1C
        mov     eax, dword [ebp-0CH]                    ; 151D _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 1520 _ 8D. 58, FF
        mov     eax, dword [ebp-10H]                    ; 1523 _ 8B. 45, F0
        lea     ecx, [eax-1H]                           ; 1526 _ 8D. 48, FF
        mov     eax, dword [ebp-10H]                    ; 1529 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 152C _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 152F _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1532 _ 8B. 00
        push    ebx                                     ; 1534 _ 53
        push    ecx                                     ; 1535 _ 51
        push    0                                       ; 1536 _ 6A, 00
        push    edx                                     ; 1538 _ 52
        push    0                                       ; 1539 _ 6A, 00
        push    dword [ebp-10H]                         ; 153B _ FF. 75, F0
        push    eax                                     ; 153E _ 50
        call    boxfill8                                ; 153F _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1544 _ 83. C4, 1C
        mov     eax, dword [ebp-0CH]                    ; 1547 _ 8B. 45, F4
        lea     ecx, [eax-3H]                           ; 154A _ 8D. 48, FD
        mov     eax, dword [ebp-10H]                    ; 154D _ 8B. 45, F0
        lea     edx, [eax-3H]                           ; 1550 _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 1553 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1556 _ 8B. 00
        push    ecx                                     ; 1558 _ 51
        push    edx                                     ; 1559 _ 52
        push    2                                       ; 155A _ 6A, 02
        push    2                                       ; 155C _ 6A, 02
        push    8                                       ; 155E _ 6A, 08
        push    dword [ebp-10H]                         ; 1560 _ FF. 75, F0
        push    eax                                     ; 1563 _ 50
        call    boxfill8                                ; 1564 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1569 _ 83. C4, 1C
        mov     eax, dword [ebp-10H]                    ; 156C _ 8B. 45, F0
        lea     edx, [eax-4H]                           ; 156F _ 8D. 50, FC
        mov     eax, dword [ebp+0CH]                    ; 1572 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1575 _ 8B. 00
        push    20                                      ; 1577 _ 6A, 14
        push    edx                                     ; 1579 _ 52
        push    3                                       ; 157A _ 6A, 03
        push    3                                       ; 157C _ 6A, 03
        push    12                                      ; 157E _ 6A, 0C
        push    dword [ebp-10H]                         ; 1580 _ FF. 75, F0
        push    eax                                     ; 1583 _ 50
        call    boxfill8                                ; 1584 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1589 _ 83. C4, 1C
        mov     eax, dword [ebp-0CH]                    ; 158C _ 8B. 45, F4
        lea     ebx, [eax-2H]                           ; 158F _ 8D. 58, FE
        mov     eax, dword [ebp-10H]                    ; 1592 _ 8B. 45, F0
        lea     ecx, [eax-2H]                           ; 1595 _ 8D. 48, FE
        mov     eax, dword [ebp-0CH]                    ; 1598 _ 8B. 45, F4
        lea     edx, [eax-2H]                           ; 159B _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 159E _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 15A1 _ 8B. 00
        push    ebx                                     ; 15A3 _ 53
        push    ecx                                     ; 15A4 _ 51
        push    edx                                     ; 15A5 _ 52
        push    1                                       ; 15A6 _ 6A, 01
        push    15                                      ; 15A8 _ 6A, 0F
        push    dword [ebp-10H]                         ; 15AA _ FF. 75, F0
        push    eax                                     ; 15AD _ 50
        call    boxfill8                                ; 15AE _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 15B3 _ 83. C4, 1C
        mov     eax, dword [ebp-0CH]                    ; 15B6 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 15B9 _ 8D. 58, FF
        mov     eax, dword [ebp-10H]                    ; 15BC _ 8B. 45, F0
        lea     ecx, [eax-1H]                           ; 15BF _ 8D. 48, FF
        mov     eax, dword [ebp-0CH]                    ; 15C2 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 15C5 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 15C8 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 15CB _ 8B. 00
        push    ebx                                     ; 15CD _ 53
        push    ecx                                     ; 15CE _ 51
        push    edx                                     ; 15CF _ 52
        push    0                                       ; 15D0 _ 6A, 00
        push    0                                       ; 15D2 _ 6A, 00
        push    dword [ebp-10H]                         ; 15D4 _ FF. 75, F0
        push    eax                                     ; 15D7 _ 50
        call    boxfill8                                ; 15D8 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 15DD _ 83. C4, 1C
        sub     esp, 8                                  ; 15E0 _ 83. EC, 08
        push    dword [ebp+10H]                         ; 15E3 _ FF. 75, 10
        push    7                                       ; 15E6 _ 6A, 07
        push    4                                       ; 15E8 _ 6A, 04
        push    24                                      ; 15EA _ 6A, 18
        push    dword [ebp+0CH]                         ; 15EC _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 15EF _ FF. 75, 08
        call    showString                              ; 15F2 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 15F7 _ 83. C4, 20
        mov     dword [ebp-14H], 0                      ; 15FA _ C7. 45, EC, 00000000
        jmp     ?_070                                   ; 1601 _ E9, 00000083

?_063:  mov     dword [ebp-18H], 0                      ; 1606 _ C7. 45, E8, 00000000
        jmp     ?_069                                   ; 160D _ EB, 70

?_064:  mov     eax, dword [ebp-14H]                    ; 160F _ 8B. 45, EC
        shl     eax, 4                                  ; 1612 _ C1. E0, 04
        mov     edx, eax                                ; 1615 _ 89. C2
        mov     eax, dword [ebp-18H]                    ; 1617 _ 8B. 45, E8
        add     eax, edx                                ; 161A _ 01. D0
        add     eax, closebtn.1922                      ; 161C _ 05, 000001C0(d)
        movzx   eax, byte [eax]                         ; 1621 _ 0F B6. 00
        mov     byte [ebp-19H], al                      ; 1624 _ 88. 45, E7
        cmp     byte [ebp-19H], 64                      ; 1627 _ 80. 7D, E7, 40
        jnz     ?_065                                   ; 162B _ 75, 06
        mov     byte [ebp-19H], 0                       ; 162D _ C6. 45, E7, 00
        jmp     ?_068                                   ; 1631 _ EB, 1C

?_065:  cmp     byte [ebp-19H], 36                      ; 1633 _ 80. 7D, E7, 24
        jnz     ?_066                                   ; 1637 _ 75, 06
        mov     byte [ebp-19H], 15                      ; 1639 _ C6. 45, E7, 0F
        jmp     ?_068                                   ; 163D _ EB, 10

?_066:  cmp     byte [ebp-19H], 81                      ; 163F _ 80. 7D, E7, 51
        jnz     ?_067                                   ; 1643 _ 75, 06
        mov     byte [ebp-19H], 8                       ; 1645 _ C6. 45, E7, 08
        jmp     ?_068                                   ; 1649 _ EB, 04

?_067:  mov     byte [ebp-19H], 7                       ; 164B _ C6. 45, E7, 07
?_068:  mov     eax, dword [ebp+0CH]                    ; 164F _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 1652 _ 8B. 10
        mov     eax, dword [ebp-14H]                    ; 1654 _ 8B. 45, EC
        lea     ecx, [eax+5H]                           ; 1657 _ 8D. 48, 05
        mov     eax, dword [ebp+0CH]                    ; 165A _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 165D _ 8B. 40, 04
        imul    ecx, eax                                ; 1660 _ 0F AF. C8
        mov     eax, dword [ebp+0CH]                    ; 1663 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1666 _ 8B. 40, 04
        lea     ebx, [eax-15H]                          ; 1669 _ 8D. 58, EB
        mov     eax, dword [ebp-18H]                    ; 166C _ 8B. 45, E8
        add     eax, ebx                                ; 166F _ 01. D8
        add     eax, ecx                                ; 1671 _ 01. C8
        add     edx, eax                                ; 1673 _ 01. C2
        movzx   eax, byte [ebp-19H]                     ; 1675 _ 0F B6. 45, E7
        mov     byte [edx], al                          ; 1679 _ 88. 02
        add     dword [ebp-18H], 1                      ; 167B _ 83. 45, E8, 01
?_069:  cmp     dword [ebp-18H], 15                     ; 167F _ 83. 7D, E8, 0F
        jle     ?_064                                   ; 1683 _ 7E, 8A
        add     dword [ebp-14H], 1                      ; 1685 _ 83. 45, EC, 01
?_070:  cmp     dword [ebp-14H], 13                     ; 1689 _ 83. 7D, EC, 0D
        jle     ?_063                                   ; 168D _ 0F 8E, FFFFFF73
        nop                                             ; 1693 _ 90
        mov     ebx, dword [ebp-4H]                     ; 1694 _ 8B. 5D, FC
        leave                                           ; 1697 _ C9
        ret                                             ; 1698 _ C3
; make_window8 End of function

message_box:; Function begin
        push    ebp                                     ; 1699 _ 55
        mov     ebp, esp                                ; 169A _ 89. E5
        sub     esp, 24                                 ; 169C _ 83. EC, 18
        sub     esp, 12                                 ; 169F _ 83. EC, 0C
        push    dword [ebp+8H]                          ; 16A2 _ FF. 75, 08
        call    sheet_alloc                             ; 16A5 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 16AA _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 16AD _ 89. 45, F0
        mov     eax, dword [memman]                     ; 16B0 _ A1, 00000000(d)
        sub     esp, 8                                  ; 16B5 _ 83. EC, 08
        push    10880                                   ; 16B8 _ 68, 00002A80
        push    eax                                     ; 16BD _ 50
        call    memman_alloc_4k                         ; 16BE _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 16C3 _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 16C6 _ 89. 45, F4
        sub     esp, 12                                 ; 16C9 _ 83. EC, 0C
        push    -1                                      ; 16CC _ 6A, FF
        push    68                                      ; 16CE _ 6A, 44
        push    160                                     ; 16D0 _ 68, 000000A0
        push    dword [ebp-0CH]                         ; 16D5 _ FF. 75, F4
        push    dword [ebp-10H]                         ; 16D8 _ FF. 75, F0
        call    sheet_setbuf                            ; 16DB _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 16E0 _ 83. C4, 20
        sub     esp, 4                                  ; 16E3 _ 83. EC, 04
        push    dword [ebp+0CH]                         ; 16E6 _ FF. 75, 0C
        push    dword [ebp-10H]                         ; 16E9 _ FF. 75, F0
        push    dword [ebp+8H]                          ; 16EC _ FF. 75, 08
        call    make_window8                            ; 16EF _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 16F4 _ 83. C4, 10
        sub     esp, 8                                  ; 16F7 _ 83. EC, 08
        push    ?_167                                   ; 16FA _ 68, 00000076(d)
        push    0                                       ; 16FF _ 6A, 00
        push    28                                      ; 1701 _ 6A, 1C
        push    24                                      ; 1703 _ 6A, 18
        push    dword [ebp-10H]                         ; 1705 _ FF. 75, F0
        push    dword [ebp+8H]                          ; 1708 _ FF. 75, 08
        call    showString                              ; 170B _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1710 _ 83. C4, 20
        sub     esp, 8                                  ; 1713 _ 83. EC, 08
        push    ?_168                                   ; 1716 _ 68, 00000082(d)
        push    0                                       ; 171B _ 6A, 00
        push    44                                      ; 171D _ 6A, 2C
        push    24                                      ; 171F _ 6A, 18
        push    dword [ebp-10H]                         ; 1721 _ FF. 75, F0
        push    dword [ebp+8H]                          ; 1724 _ FF. 75, 08
        call    showString                              ; 1727 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 172C _ 83. C4, 20
        push    72                                      ; 172F _ 6A, 48
        push    80                                      ; 1731 _ 6A, 50
        push    dword [ebp-10H]                         ; 1733 _ FF. 75, F0
        push    dword [ebp+8H]                          ; 1736 _ FF. 75, 08
        call    sheet_slide                             ; 1739 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 173E _ 83. C4, 10
        sub     esp, 4                                  ; 1741 _ 83. EC, 04
        push    1                                       ; 1744 _ 6A, 01
        push    dword [ebp-10H]                         ; 1746 _ FF. 75, F0
        push    dword [ebp+8H]                          ; 1749 _ FF. 75, 08
        call    sheet_updown                            ; 174C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1751 _ 83. C4, 10
        mov     eax, dword [ebp-10H]                    ; 1754 _ 8B. 45, F0
        leave                                           ; 1757 _ C9
        ret                                             ; 1758 _ C3
; message_box End of function

intHandlerFromTimer:; Function begin
        push    ebp                                     ; 1759 _ 55
        mov     ebp, esp                                ; 175A _ 89. E5
        sub     esp, 24                                 ; 175C _ 83. EC, 18
        sub     esp, 8                                  ; 175F _ 83. EC, 08
        push    96                                      ; 1762 _ 6A, 60
        push    32                                      ; 1764 _ 6A, 20
        call    io_out8                                 ; 1766 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 176B _ 83. C4, 10
        mov     eax, dword [timerctl]                   ; 176E _ A1, 00000208(d)
        mov     edx, dword [eax]                        ; 1773 _ 8B. 10
        add     edx, 1                                  ; 1775 _ 83. C2, 01
        mov     dword [eax], edx                        ; 1778 _ 89. 10
        mov     dword [ebp-0CH], 0                      ; 177A _ C7. 45, F4, 00000000
        jmp     ?_073                                   ; 1781 _ E9, 00000088

?_071:  mov     eax, dword [timerctl]                   ; 1786 _ A1, 00000208(d)
        mov     edx, dword [ebp-0CH]                    ; 178B _ 8B. 55, F4
        shl     edx, 4                                  ; 178E _ C1. E2, 04
        add     eax, edx                                ; 1791 _ 01. D0
        add     eax, 4                                  ; 1793 _ 83. C0, 04
        mov     eax, dword [eax]                        ; 1796 _ 8B. 00
        cmp     eax, 2                                  ; 1798 _ 83. F8, 02
        jnz     ?_072                                   ; 179B _ 75, 6D
        mov     eax, dword [timerctl]                   ; 179D _ A1, 00000208(d)
        mov     edx, dword [ebp-0CH]                    ; 17A2 _ 8B. 55, F4
        shl     edx, 4                                  ; 17A5 _ C1. E2, 04
        add     edx, eax                                ; 17A8 _ 01. C2
        add     edx, 8                                  ; 17AA _ 83. C2, 08
        mov     edx, dword [edx]                        ; 17AD _ 8B. 12
        sub     edx, 1                                  ; 17AF _ 83. EA, 01
        mov     ecx, dword [ebp-0CH]                    ; 17B2 _ 8B. 4D, F4
        shl     ecx, 4                                  ; 17B5 _ C1. E1, 04
        add     eax, ecx                                ; 17B8 _ 01. C8
        add     eax, 8                                  ; 17BA _ 83. C0, 08
        mov     dword [eax], edx                        ; 17BD _ 89. 10
        mov     eax, dword [timerctl]                   ; 17BF _ A1, 00000208(d)
        mov     edx, dword [ebp-0CH]                    ; 17C4 _ 8B. 55, F4
        shl     edx, 4                                  ; 17C7 _ C1. E2, 04
        add     eax, edx                                ; 17CA _ 01. D0
        add     eax, 8                                  ; 17CC _ 83. C0, 08
        mov     eax, dword [eax]                        ; 17CF _ 8B. 00
        test    eax, eax                                ; 17D1 _ 85. C0
        jnz     ?_072                                   ; 17D3 _ 75, 35
        mov     eax, dword [timerctl]                   ; 17D5 _ A1, 00000208(d)
        mov     edx, dword [ebp-0CH]                    ; 17DA _ 8B. 55, F4
        shl     edx, 4                                  ; 17DD _ C1. E2, 04
        add     eax, edx                                ; 17E0 _ 01. D0
        add     eax, 16                                 ; 17E2 _ 83. C0, 10
        movzx   eax, byte [eax]                         ; 17E5 _ 0F B6. 00
        movzx   edx, al                                 ; 17E8 _ 0F B6. D0
        mov     eax, dword [timerctl]                   ; 17EB _ A1, 00000208(d)
        mov     ecx, dword [ebp-0CH]                    ; 17F0 _ 8B. 4D, F4
        shl     ecx, 4                                  ; 17F3 _ C1. E1, 04
        add     eax, ecx                                ; 17F6 _ 01. C8
        add     eax, 12                                 ; 17F8 _ 83. C0, 0C
        mov     eax, dword [eax]                        ; 17FB _ 8B. 00
        sub     esp, 8                                  ; 17FD _ 83. EC, 08
        push    edx                                     ; 1800 _ 52
        push    eax                                     ; 1801 _ 50
        call    fifo8_put                               ; 1802 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1807 _ 83. C4, 10
?_072:  add     dword [ebp-0CH], 1                      ; 180A _ 83. 45, F4, 01
?_073:  cmp     dword [ebp-0CH], 499                    ; 180E _ 81. 7D, F4, 000001F3
        jle     ?_071                                   ; 1815 _ 0F 8E, FFFFFF6B
        nop                                             ; 181B _ 90
        leave                                           ; 181C _ C9
        ret                                             ; 181D _ C3
; intHandlerFromTimer End of function

memman_init:; Function begin
        push    ebp                                     ; 181E _ 55
        mov     ebp, esp                                ; 181F _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 1821 _ 8B. 45, 08
        mov     dword [eax], 0                          ; 1824 _ C7. 00, 00000000
        mov     eax, dword [ebp+8H]                     ; 182A _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 182D _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 1834 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 1837 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 183E _ 8B. 45, 08
        mov     dword [eax+0CH], 0                      ; 1841 _ C7. 40, 0C, 00000000
        nop                                             ; 1848 _ 90
        pop     ebp                                     ; 1849 _ 5D
        ret                                             ; 184A _ C3
; memman_init End of function

memman_total:; Function begin
        push    ebp                                     ; 184B _ 55
        mov     ebp, esp                                ; 184C _ 89. E5
        sub     esp, 16                                 ; 184E _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 1851 _ C7. 45, FC, 00000000
        mov     dword [ebp-8H], 0                       ; 1858 _ C7. 45, F8, 00000000
        jmp     ?_075                                   ; 185F _ EB, 14

?_074:  mov     eax, dword [ebp+8H]                     ; 1861 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1864 _ 8B. 55, F8
        add     edx, 2                                  ; 1867 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 186A _ 8B. 44 D0, 04
        add     dword [ebp-4H], eax                     ; 186E _ 01. 45, FC
        add     dword [ebp-8H], 1                       ; 1871 _ 83. 45, F8, 01
?_075:  mov     eax, dword [ebp+8H]                     ; 1875 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1878 _ 8B. 00
        cmp     dword [ebp-8H], eax                     ; 187A _ 39. 45, F8
        jc      ?_074                                   ; 187D _ 72, E2
        mov     eax, dword [ebp-4H]                     ; 187F _ 8B. 45, FC
        leave                                           ; 1882 _ C9
        ret                                             ; 1883 _ C3
; memman_total End of function

memman_alloc:; Function begin
        push    ebp                                     ; 1884 _ 55
        mov     ebp, esp                                ; 1885 _ 89. E5
        sub     esp, 16                                 ; 1887 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 188A _ C7. 45, F8, 00000000
        jmp     ?_079                                   ; 1891 _ E9, 00000085

?_076:  mov     eax, dword [ebp+8H]                     ; 1896 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1899 _ 8B. 55, F8
        add     edx, 2                                  ; 189C _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 189F _ 8B. 44 D0, 04
        cmp     dword [ebp+0CH], eax                    ; 18A3 _ 39. 45, 0C
        ja      ?_078                                   ; 18A6 _ 77, 6F
        mov     eax, dword [ebp+8H]                     ; 18A8 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 18AB _ 8B. 55, F8
        add     edx, 2                                  ; 18AE _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 18B1 _ 8B. 04 D0
        mov     dword [ebp-4H], eax                     ; 18B4 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 18B7 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 18BA _ 8B. 55, F8
        add     edx, 2                                  ; 18BD _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 18C0 _ 8B. 14 D0
        mov     eax, dword [ebp+0CH]                    ; 18C3 _ 8B. 45, 0C
        lea     ecx, [edx+eax]                          ; 18C6 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 18C9 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 18CC _ 8B. 55, F8
        add     edx, 2                                  ; 18CF _ 83. C2, 02
        mov     dword [eax+edx*8], ecx                  ; 18D2 _ 89. 0C D0
        mov     eax, dword [ebp+8H]                     ; 18D5 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 18D8 _ 8B. 55, F8
        add     edx, 2                                  ; 18DB _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 18DE _ 8B. 44 D0, 04
        sub     eax, dword [ebp+0CH]                    ; 18E2 _ 2B. 45, 0C
        mov     edx, eax                                ; 18E5 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 18E7 _ 8B. 45, 08
        mov     ecx, dword [ebp-8H]                     ; 18EA _ 8B. 4D, F8
        add     ecx, 2                                  ; 18ED _ 83. C1, 02
        mov     dword [eax+ecx*8+4H], edx               ; 18F0 _ 89. 54 C8, 04
        mov     eax, dword [ebp+8H]                     ; 18F4 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 18F7 _ 8B. 55, F8
        add     edx, 2                                  ; 18FA _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 18FD _ 8B. 44 D0, 04
        test    eax, eax                                ; 1901 _ 85. C0
        jnz     ?_077                                   ; 1903 _ 75, 0D
        mov     eax, dword [ebp+8H]                     ; 1905 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1908 _ 8B. 00
        lea     edx, [eax-1H]                           ; 190A _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 190D _ 8B. 45, 08
        mov     dword [eax], edx                        ; 1910 _ 89. 10
?_077:  mov     eax, dword [ebp-4H]                     ; 1912 _ 8B. 45, FC
        jmp     ?_080                                   ; 1915 _ EB, 17

?_078:  add     dword [ebp-8H], 1                       ; 1917 _ 83. 45, F8, 01
?_079:  mov     eax, dword [ebp+8H]                     ; 191B _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 191E _ 8B. 00
        cmp     dword [ebp-8H], eax                     ; 1920 _ 39. 45, F8
        jc      ?_076                                   ; 1923 _ 0F 82, FFFFFF6D
        mov     eax, 0                                  ; 1929 _ B8, 00000000
?_080:  leave                                           ; 192E _ C9
        ret                                             ; 192F _ C3
; memman_alloc End of function

memman_free:; Function begin
        push    ebp                                     ; 1930 _ 55
        mov     ebp, esp                                ; 1931 _ 89. E5
        push    ebx                                     ; 1933 _ 53
        sub     esp, 16                                 ; 1934 _ 83. EC, 10
        mov     dword [ebp-0CH], 0                      ; 1937 _ C7. 45, F4, 00000000
        jmp     ?_082                                   ; 193E _ EB, 15

?_081:  mov     eax, dword [ebp+8H]                     ; 1940 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1943 _ 8B. 55, F4
        add     edx, 2                                  ; 1946 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 1949 _ 8B. 04 D0
        cmp     dword [ebp+0CH], eax                    ; 194C _ 39. 45, 0C
        jc      ?_083                                   ; 194F _ 72, 10
        add     dword [ebp-0CH], 1                      ; 1951 _ 83. 45, F4, 01
?_082:  mov     eax, dword [ebp+8H]                     ; 1955 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1958 _ 8B. 00
        cmp     dword [ebp-0CH], eax                    ; 195A _ 39. 45, F4
        jl      ?_081                                   ; 195D _ 7C, E1
        jmp     ?_084                                   ; 195F _ EB, 01

?_083:  nop                                             ; 1961 _ 90
?_084:  cmp     dword [ebp-0CH], 0                      ; 1962 _ 83. 7D, F4, 00
        jle     ?_086                                   ; 1966 _ 0F 8E, 000000B9
        mov     eax, dword [ebp-0CH]                    ; 196C _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 196F _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1972 _ 8B. 45, 08
        add     edx, 2                                  ; 1975 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 1978 _ 8B. 14 D0
        mov     eax, dword [ebp-0CH]                    ; 197B _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 197E _ 8D. 48, FF
        mov     eax, dword [ebp+8H]                     ; 1981 _ 8B. 45, 08
        add     ecx, 2                                  ; 1984 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 1987 _ 8B. 44 C8, 04
        add     eax, edx                                ; 198B _ 01. D0
        cmp     dword [ebp+0CH], eax                    ; 198D _ 39. 45, 0C
        jne     ?_086                                   ; 1990 _ 0F 85, 0000008F
        mov     eax, dword [ebp-0CH]                    ; 1996 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1999 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 199C _ 8B. 45, 08
        add     edx, 2                                  ; 199F _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 19A2 _ 8B. 54 D0, 04
        mov     eax, dword [ebp-0CH]                    ; 19A6 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 19A9 _ 8D. 58, FF
        mov     eax, dword [ebp+10H]                    ; 19AC _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 19AF _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 19B2 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 19B5 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 19B8 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 19BC _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 19BF _ 8B. 00
        test    eax, eax                                ; 19C1 _ 85. C0
        jle     ?_085                                   ; 19C3 _ 7E, 56
        mov     edx, dword [ebp+0CH]                    ; 19C5 _ 8B. 55, 0C
        mov     eax, dword [ebp+10H]                    ; 19C8 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 19CB _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 19CE _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 19D1 _ 8B. 55, F4
        add     edx, 2                                  ; 19D4 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 19D7 _ 8B. 04 D0
        cmp     ecx, eax                                ; 19DA _ 39. C1
        jnz     ?_085                                   ; 19DC _ 75, 3D
        mov     eax, dword [ebp-0CH]                    ; 19DE _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 19E1 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 19E4 _ 8B. 45, 08
        add     edx, 2                                  ; 19E7 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 19EA _ 8B. 54 D0, 04
        mov     eax, dword [ebp+8H]                     ; 19EE _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 19F1 _ 8B. 4D, F4
        add     ecx, 2                                  ; 19F4 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 19F7 _ 8B. 44 C8, 04
        mov     ecx, dword [ebp-0CH]                    ; 19FB _ 8B. 4D, F4
        lea     ebx, [ecx-1H]                           ; 19FE _ 8D. 59, FF
        lea     ecx, [edx+eax]                          ; 1A01 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1A04 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 1A07 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 1A0A _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 1A0E _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1A11 _ 8B. 00
        lea     edx, [eax-1H]                           ; 1A13 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1A16 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 1A19 _ 89. 10
?_085:  mov     eax, 0                                  ; 1A1B _ B8, 00000000
        jmp     ?_092                                   ; 1A20 _ E9, 0000011B

?_086:  mov     eax, dword [ebp+8H]                     ; 1A25 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1A28 _ 8B. 00
        test    eax, eax                                ; 1A2A _ 85. C0
        jle     ?_087                                   ; 1A2C _ 7E, 52
        mov     edx, dword [ebp+0CH]                    ; 1A2E _ 8B. 55, 0C
        mov     eax, dword [ebp+10H]                    ; 1A31 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 1A34 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1A37 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1A3A _ 8B. 55, F4
        add     edx, 2                                  ; 1A3D _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 1A40 _ 8B. 04 D0
        cmp     ecx, eax                                ; 1A43 _ 39. C1
        jnz     ?_087                                   ; 1A45 _ 75, 39
        mov     eax, dword [ebp+8H]                     ; 1A47 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1A4A _ 8B. 55, F4
        add     edx, 2                                  ; 1A4D _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 1A50 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 1A54 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 1A57 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1A5A _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1A5D _ 8B. 55, F4
        add     edx, 2                                  ; 1A60 _ 83. C2, 02
        mov     dword [eax+edx*8+4H], ecx               ; 1A63 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 1A67 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1A6A _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 1A6D _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 1A70 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 1A73 _ 89. 14 C8
        mov     eax, 0                                  ; 1A76 _ B8, 00000000
        jmp     ?_092                                   ; 1A7B _ E9, 000000C0

?_087:  mov     eax, dword [ebp+8H]                     ; 1A80 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1A83 _ 8B. 00
        cmp     eax, 4095                               ; 1A85 _ 3D, 00000FFF
        jg      ?_091                                   ; 1A8A _ 0F 8F, 00000087
        mov     eax, dword [ebp+8H]                     ; 1A90 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1A93 _ 8B. 00
        lea     edx, [eax+1H]                           ; 1A95 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1A98 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 1A9B _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 1A9D _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1AA0 _ 8B. 00
        mov     dword [ebp-8H], eax                     ; 1AA2 _ 89. 45, F8
        jmp     ?_089                                   ; 1AA5 _ EB, 28

?_088:  mov     eax, dword [ebp-8H]                     ; 1AA7 _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 1AAA _ 8D. 50, FF
        mov     ecx, dword [ebp+8H]                     ; 1AAD _ 8B. 4D, 08
        mov     eax, dword [ebp-8H]                     ; 1AB0 _ 8B. 45, F8
        lea     ebx, [eax+2H]                           ; 1AB3 _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 1AB6 _ 8B. 45, 08
        add     edx, 2                                  ; 1AB9 _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 1ABC _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 1ABF _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 1AC1 _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 1AC4 _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 1AC7 _ 89. 54 D9, 04
        sub     dword [ebp-8H], 1                       ; 1ACB _ 83. 6D, F8, 01
?_089:  mov     eax, dword [ebp-8H]                     ; 1ACF _ 8B. 45, F8
        cmp     eax, dword [ebp-0CH]                    ; 1AD2 _ 3B. 45, F4
        jg      ?_088                                   ; 1AD5 _ 7F, D0
        mov     eax, dword [ebp+8H]                     ; 1AD7 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1ADA _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1ADD _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1AE0 _ 8B. 00
        cmp     edx, eax                                ; 1AE2 _ 39. C2
        jge     ?_090                                   ; 1AE4 _ 7D, 0B
        mov     eax, dword [ebp+8H]                     ; 1AE6 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 1AE9 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 1AEB _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 1AEE _ 89. 50, 04
?_090:  mov     eax, dword [ebp+8H]                     ; 1AF1 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1AF4 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 1AF7 _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 1AFA _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 1AFD _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 1B00 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1B03 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 1B06 _ 8D. 4A, 02
        mov     edx, dword [ebp+10H]                    ; 1B09 _ 8B. 55, 10
        mov     dword [eax+ecx*8+4H], edx               ; 1B0C _ 89. 54 C8, 04
        mov     eax, 0                                  ; 1B10 _ B8, 00000000
        jmp     ?_092                                   ; 1B15 _ EB, 29

?_091:  mov     eax, dword [ebp+8H]                     ; 1B17 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1B1A _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 1B1D _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1B20 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 1B23 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 1B26 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 1B29 _ 8B. 40, 08
        mov     edx, eax                                ; 1B2C _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 1B2E _ 8B. 45, 10
        add     eax, edx                                ; 1B31 _ 01. D0
        mov     edx, eax                                ; 1B33 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1B35 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 1B38 _ 89. 50, 08
        mov     eax, 4294967295                         ; 1B3B _ B8, FFFFFFFF
?_092:  add     esp, 16                                 ; 1B40 _ 83. C4, 10
        pop     ebx                                     ; 1B43 _ 5B
        pop     ebp                                     ; 1B44 _ 5D
        ret                                             ; 1B45 _ C3
; memman_free End of function

memman_alloc_4k:; Function begin
        push    ebp                                     ; 1B46 _ 55
        mov     ebp, esp                                ; 1B47 _ 89. E5
        sub     esp, 16                                 ; 1B49 _ 83. EC, 10
        mov     eax, dword [ebp+0CH]                    ; 1B4C _ 8B. 45, 0C
        add     eax, 4095                               ; 1B4F _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 1B54 _ 25, FFFFF000
        mov     dword [ebp+0CH], eax                    ; 1B59 _ 89. 45, 0C
        push    dword [ebp+0CH]                         ; 1B5C _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1B5F _ FF. 75, 08
        call    memman_alloc                            ; 1B62 _ E8, FFFFFFFC(rel)
        add     esp, 8                                  ; 1B67 _ 83. C4, 08
        mov     dword [ebp-4H], eax                     ; 1B6A _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 1B6D _ 8B. 45, FC
        leave                                           ; 1B70 _ C9
        ret                                             ; 1B71 _ C3
; memman_alloc_4k End of function

memman_free_4k:; Function begin
        push    ebp                                     ; 1B72 _ 55
        mov     ebp, esp                                ; 1B73 _ 89. E5
        sub     esp, 16                                 ; 1B75 _ 83. EC, 10
        mov     eax, dword [ebp+10H]                    ; 1B78 _ 8B. 45, 10
        add     eax, 4095                               ; 1B7B _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 1B80 _ 25, FFFFF000
        mov     dword [ebp+10H], eax                    ; 1B85 _ 89. 45, 10
        push    dword [ebp+10H]                         ; 1B88 _ FF. 75, 10
        push    dword [ebp+0CH]                         ; 1B8B _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1B8E _ FF. 75, 08
        call    memman_free                             ; 1B91 _ E8, FFFFFFFC(rel)
        add     esp, 12                                 ; 1B96 _ 83. C4, 0C
        mov     dword [ebp-4H], eax                     ; 1B99 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 1B9C _ 8B. 45, FC
        leave                                           ; 1B9F _ C9
        ret                                             ; 1BA0 _ C3
; memman_free_4k End of function

shtctl_init:; Function begin
        push    ebp                                     ; 1BA1 _ 55
        mov     ebp, esp                                ; 1BA2 _ 89. E5
        sub     esp, 24                                 ; 1BA4 _ 83. EC, 18
        sub     esp, 8                                  ; 1BA7 _ 83. EC, 08
        push    9232                                    ; 1BAA _ 68, 00002410
        push    dword [ebp+8H]                          ; 1BAF _ FF. 75, 08
        call    memman_alloc_4k                         ; 1BB2 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1BB7 _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 1BBA _ 89. 45, F4
        cmp     dword [ebp-0CH], 0                      ; 1BBD _ 83. 7D, F4, 00
        jnz     ?_093                                   ; 1BC1 _ 75, 0A
        mov     eax, 0                                  ; 1BC3 _ B8, 00000000
        jmp     ?_097                                   ; 1BC8 _ E9, 0000009A

?_093:  mov     eax, dword [ebp-0CH]                    ; 1BCD _ 8B. 45, F4
        mov     edx, dword [ebp+0CH]                    ; 1BD0 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 1BD3 _ 89. 10
        mov     eax, dword [ebp-0CH]                    ; 1BD5 _ 8B. 45, F4
        mov     edx, dword [ebp+10H]                    ; 1BD8 _ 8B. 55, 10
        mov     dword [eax+8H], edx                     ; 1BDB _ 89. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 1BDE _ 8B. 45, F4
        mov     edx, dword [ebp+14H]                    ; 1BE1 _ 8B. 55, 14
        mov     dword [eax+0CH], edx                    ; 1BE4 _ 89. 50, 0C
        mov     eax, dword [ebp-0CH]                    ; 1BE7 _ 8B. 45, F4
        mov     dword [eax+10H], -1                     ; 1BEA _ C7. 40, 10, FFFFFFFF
        mov     dword [ebp-10H], 0                      ; 1BF1 _ C7. 45, F0, 00000000
        jmp     ?_095                                   ; 1BF8 _ EB, 1B

?_094:  mov     eax, dword [ebp-0CH]                    ; 1BFA _ 8B. 45, F4
        mov     edx, dword [ebp-10H]                    ; 1BFD _ 8B. 55, F0
        add     edx, 33                                 ; 1C00 _ 83. C2, 21
        shl     edx, 5                                  ; 1C03 _ C1. E2, 05
        add     eax, edx                                ; 1C06 _ 01. D0
        add     eax, 16                                 ; 1C08 _ 83. C0, 10
        mov     dword [eax], 0                          ; 1C0B _ C7. 00, 00000000
        add     dword [ebp-10H], 1                      ; 1C11 _ 83. 45, F0, 01
?_095:  cmp     dword [ebp-10H], 255                    ; 1C15 _ 81. 7D, F0, 000000FF
        jle     ?_094                                   ; 1C1C _ 7E, DC
        mov     eax, dword [ebp+10H]                    ; 1C1E _ 8B. 45, 10
        imul    eax, dword [ebp+14H]                    ; 1C21 _ 0F AF. 45, 14
        sub     esp, 8                                  ; 1C25 _ 83. EC, 08
        push    eax                                     ; 1C28 _ 50
        push    dword [ebp+8H]                          ; 1C29 _ FF. 75, 08
        call    memman_alloc_4k                         ; 1C2C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1C31 _ 83. C4, 10
        mov     edx, eax                                ; 1C34 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 1C36 _ 8B. 45, F4
        mov     dword [eax+4H], edx                     ; 1C39 _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 1C3C _ 8B. 45, F4
        mov     eax, dword [eax+4H]                     ; 1C3F _ 8B. 40, 04
        test    eax, eax                                ; 1C42 _ 85. C0
        jnz     ?_096                                   ; 1C44 _ 75, 1E
        mov     eax, dword [ebp-0CH]                    ; 1C46 _ 8B. 45, F4
        sub     esp, 4                                  ; 1C49 _ 83. EC, 04
        push    9232                                    ; 1C4C _ 68, 00002410
        push    eax                                     ; 1C51 _ 50
        push    dword [ebp+8H]                          ; 1C52 _ FF. 75, 08
        call    memman_free_4k                          ; 1C55 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1C5A _ 83. C4, 10
        mov     eax, 0                                  ; 1C5D _ B8, 00000000
        jmp     ?_097                                   ; 1C62 _ EB, 03

?_096:  mov     eax, dword [ebp-0CH]                    ; 1C64 _ 8B. 45, F4
?_097:  leave                                           ; 1C67 _ C9
        ret                                             ; 1C68 _ C3
; shtctl_init End of function

sheet_alloc:; Function begin
        push    ebp                                     ; 1C69 _ 55
        mov     ebp, esp                                ; 1C6A _ 89. E5
        sub     esp, 16                                 ; 1C6C _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 1C6F _ C7. 45, F8, 00000000
        jmp     ?_100                                   ; 1C76 _ EB, 5B

?_098:  mov     eax, dword [ebp+8H]                     ; 1C78 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1C7B _ 8B. 55, F8
        add     edx, 33                                 ; 1C7E _ 83. C2, 21
        shl     edx, 5                                  ; 1C81 _ C1. E2, 05
        add     eax, edx                                ; 1C84 _ 01. D0
        add     eax, 16                                 ; 1C86 _ 83. C0, 10
        mov     eax, dword [eax]                        ; 1C89 _ 8B. 00
        test    eax, eax                                ; 1C8B _ 85. C0
        jnz     ?_099                                   ; 1C8D _ 75, 40
        mov     eax, dword [ebp-8H]                     ; 1C8F _ 8B. 45, F8
        shl     eax, 5                                  ; 1C92 _ C1. E0, 05
        lea     edx, [eax+410H]                         ; 1C95 _ 8D. 90, 00000410
        mov     eax, dword [ebp+8H]                     ; 1C9B _ 8B. 45, 08
        add     eax, edx                                ; 1C9E _ 01. D0
        add     eax, 4                                  ; 1CA0 _ 83. C0, 04
        mov     dword [ebp-4H], eax                     ; 1CA3 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 1CA6 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1CA9 _ 8B. 55, F8
        lea     ecx, [edx+4H]                           ; 1CAC _ 8D. 4A, 04
        mov     edx, dword [ebp-4H]                     ; 1CAF _ 8B. 55, FC
        mov     dword [eax+ecx*4+4H], edx               ; 1CB2 _ 89. 54 88, 04
        mov     eax, dword [ebp-4H]                     ; 1CB6 _ 8B. 45, FC
        mov     dword [eax+1CH], 1                      ; 1CB9 _ C7. 40, 1C, 00000001
        mov     eax, dword [ebp-4H]                     ; 1CC0 _ 8B. 45, FC
        mov     dword [eax+18H], -1                     ; 1CC3 _ C7. 40, 18, FFFFFFFF
        mov     eax, dword [ebp-4H]                     ; 1CCA _ 8B. 45, FC
        jmp     ?_101                                   ; 1CCD _ EB, 12

?_099:  add     dword [ebp-8H], 1                       ; 1CCF _ 83. 45, F8, 01
?_100:  cmp     dword [ebp-8H], 255                     ; 1CD3 _ 81. 7D, F8, 000000FF
        jle     ?_098                                   ; 1CDA _ 7E, 9C
        mov     eax, 0                                  ; 1CDC _ B8, 00000000
?_101:  leave                                           ; 1CE1 _ C9
        ret                                             ; 1CE2 _ C3
; sheet_alloc End of function

sheet_setbuf:; Function begin
        push    ebp                                     ; 1CE3 _ 55
        mov     ebp, esp                                ; 1CE4 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 1CE6 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 1CE9 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 1CEC _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 1CEE _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 1CF1 _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 1CF4 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1CF7 _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 1CFA _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 1CFD _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 1D00 _ 8B. 45, 08
        mov     edx, dword [ebp+18H]                    ; 1D03 _ 8B. 55, 18
        mov     dword [eax+14H], edx                    ; 1D06 _ 89. 50, 14
        nop                                             ; 1D09 _ 90
        pop     ebp                                     ; 1D0A _ 5D
        ret                                             ; 1D0B _ C3
; sheet_setbuf End of function

sheet_updown:; Function begin
        push    ebp                                     ; 1D0C _ 55
        mov     ebp, esp                                ; 1D0D _ 89. E5
        push    esi                                     ; 1D0F _ 56
        push    ebx                                     ; 1D10 _ 53
        sub     esp, 16                                 ; 1D11 _ 83. EC, 10
        mov     eax, dword [ebp+0CH]                    ; 1D14 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 1D17 _ 8B. 40, 18
        mov     dword [ebp-0CH], eax                    ; 1D1A _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 1D1D _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 1D20 _ 8B. 40, 10
        add     eax, 1                                  ; 1D23 _ 83. C0, 01
        cmp     dword [ebp+10H], eax                    ; 1D26 _ 39. 45, 10
        jle     ?_102                                   ; 1D29 _ 7E, 0C
        mov     eax, dword [ebp+8H]                     ; 1D2B _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 1D2E _ 8B. 40, 10
        add     eax, 1                                  ; 1D31 _ 83. C0, 01
        mov     dword [ebp+10H], eax                    ; 1D34 _ 89. 45, 10
?_102:  cmp     dword [ebp+10H], -1                     ; 1D37 _ 83. 7D, 10, FF
        jge     ?_103                                   ; 1D3B _ 7D, 07
        mov     dword [ebp+10H], -1                     ; 1D3D _ C7. 45, 10, FFFFFFFF
?_103:  mov     eax, dword [ebp+0CH]                    ; 1D44 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 1D47 _ 8B. 55, 10
        mov     dword [eax+18H], edx                    ; 1D4A _ 89. 50, 18
        mov     eax, dword [ebp-0CH]                    ; 1D4D _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 1D50 _ 3B. 45, 10
        jle     ?_110                                   ; 1D53 _ 0F 8E, 000001CB
        cmp     dword [ebp+10H], 0                      ; 1D59 _ 83. 7D, 10, 00
        js      ?_106                                   ; 1D5D _ 0F 88, 000000DF
        mov     eax, dword [ebp-0CH]                    ; 1D63 _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 1D66 _ 89. 45, F0
        jmp     ?_105                                   ; 1D69 _ EB, 34

?_104:  mov     eax, dword [ebp-10H]                    ; 1D6B _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 1D6E _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1D71 _ 8B. 45, 08
        add     edx, 4                                  ; 1D74 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 1D77 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 1D7B _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 1D7E _ 8B. 4D, F0
        add     ecx, 4                                  ; 1D81 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 1D84 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 1D88 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 1D8B _ 8B. 55, F0
        add     edx, 4                                  ; 1D8E _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 1D91 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 1D95 _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 1D98 _ 89. 50, 18
        sub     dword [ebp-10H], 1                      ; 1D9B _ 83. 6D, F0, 01
?_105:  mov     eax, dword [ebp-10H]                    ; 1D9F _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 1DA2 _ 3B. 45, 10
        jg      ?_104                                   ; 1DA5 _ 7F, C4
        mov     eax, dword [ebp+8H]                     ; 1DA7 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 1DAA _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 1DAD _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 1DB0 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 1DB3 _ 89. 54 88, 04
        mov     eax, dword [ebp+10H]                    ; 1DB7 _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 1DBA _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 1DBD _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1DC0 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1DC3 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 1DC6 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 1DC9 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 1DCC _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 1DCF _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 1DD2 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1DD5 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 1DD8 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 1DDB _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1DDE _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1DE1 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 1DE4 _ 8B. 40, 0C
        sub     esp, 8                                  ; 1DE7 _ 83. EC, 08
        push    esi                                     ; 1DEA _ 56
        push    ebx                                     ; 1DEB _ 53
        push    ecx                                     ; 1DEC _ 51
        push    edx                                     ; 1DED _ 52
        push    eax                                     ; 1DEE _ 50
        push    dword [ebp+8H]                          ; 1DEF _ FF. 75, 08
        call    sheet_refreshmap                        ; 1DF2 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1DF7 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 1DFA _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 1DFD _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 1E00 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1E03 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1E06 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 1E09 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 1E0C _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 1E0F _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 1E12 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 1E15 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1E18 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 1E1B _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 1E1E _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1E21 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1E24 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 1E27 _ 8B. 40, 0C
        sub     esp, 8                                  ; 1E2A _ 83. EC, 08
        push    esi                                     ; 1E2D _ 56
        push    ebx                                     ; 1E2E _ 53
        push    ecx                                     ; 1E2F _ 51
        push    edx                                     ; 1E30 _ 52
        push    eax                                     ; 1E31 _ 50
        push    dword [ebp+8H]                          ; 1E32 _ FF. 75, 08
        call    sheet_refreshsub                        ; 1E35 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1E3A _ 83. C4, 20
        jmp     ?_117                                   ; 1E3D _ E9, 00000238

?_106:  mov     eax, dword [ebp+8H]                     ; 1E42 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 1E45 _ 8B. 40, 10
        cmp     dword [ebp-0CH], eax                    ; 1E48 _ 39. 45, F4
        jge     ?_109                                   ; 1E4B _ 7D, 47
        mov     eax, dword [ebp-0CH]                    ; 1E4D _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 1E50 _ 89. 45, F0
        jmp     ?_108                                   ; 1E53 _ EB, 34

?_107:  mov     eax, dword [ebp-10H]                    ; 1E55 _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 1E58 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1E5B _ 8B. 45, 08
        add     edx, 4                                  ; 1E5E _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 1E61 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 1E65 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 1E68 _ 8B. 4D, F0
        add     ecx, 4                                  ; 1E6B _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 1E6E _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 1E72 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 1E75 _ 8B. 55, F0
        add     edx, 4                                  ; 1E78 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 1E7B _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 1E7F _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 1E82 _ 89. 50, 18
        add     dword [ebp-10H], 1                      ; 1E85 _ 83. 45, F0, 01
?_108:  mov     eax, dword [ebp+8H]                     ; 1E89 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 1E8C _ 8B. 40, 10
        cmp     dword [ebp-10H], eax                    ; 1E8F _ 39. 45, F0
        jl      ?_107                                   ; 1E92 _ 7C, C1
?_109:  mov     eax, dword [ebp+8H]                     ; 1E94 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 1E97 _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 1E9A _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1E9D _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 1EA0 _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1EA3 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1EA6 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1EA9 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 1EAC _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 1EAF _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 1EB2 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 1EB5 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 1EB8 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1EBB _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 1EBE _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 1EC1 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1EC4 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1EC7 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 1ECA _ 8B. 40, 0C
        sub     esp, 8                                  ; 1ECD _ 83. EC, 08
        push    0                                       ; 1ED0 _ 6A, 00
        push    ebx                                     ; 1ED2 _ 53
        push    ecx                                     ; 1ED3 _ 51
        push    edx                                     ; 1ED4 _ 52
        push    eax                                     ; 1ED5 _ 50
        push    dword [ebp+8H]                          ; 1ED6 _ FF. 75, 08
        call    sheet_refreshmap                        ; 1ED9 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1EDE _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 1EE1 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1EE4 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1EE7 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 1EEA _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 1EED _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 1EF0 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 1EF3 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 1EF6 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1EF9 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 1EFC _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 1EFF _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1F02 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1F05 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 1F08 _ 8B. 40, 0C
        sub     esp, 8                                  ; 1F0B _ 83. EC, 08
        push    0                                       ; 1F0E _ 6A, 00
        push    ebx                                     ; 1F10 _ 53
        push    ecx                                     ; 1F11 _ 51
        push    edx                                     ; 1F12 _ 52
        push    eax                                     ; 1F13 _ 50
        push    dword [ebp+8H]                          ; 1F14 _ FF. 75, 08
        call    sheet_refreshsub                        ; 1F17 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1F1C _ 83. C4, 20
        jmp     ?_117                                   ; 1F1F _ E9, 00000156

?_110:  mov     eax, dword [ebp-0CH]                    ; 1F24 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 1F27 _ 3B. 45, 10
        jge     ?_117                                   ; 1F2A _ 0F 8D, 0000014A
        cmp     dword [ebp-0CH], 0                      ; 1F30 _ 83. 7D, F4, 00
        js      ?_113                                   ; 1F34 _ 78, 56
        mov     eax, dword [ebp-0CH]                    ; 1F36 _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 1F39 _ 89. 45, F0
        jmp     ?_112                                   ; 1F3C _ EB, 34

?_111:  mov     eax, dword [ebp-10H]                    ; 1F3E _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 1F41 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1F44 _ 8B. 45, 08
        add     edx, 4                                  ; 1F47 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 1F4A _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 1F4E _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 1F51 _ 8B. 4D, F0
        add     ecx, 4                                  ; 1F54 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 1F57 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 1F5B _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 1F5E _ 8B. 55, F0
        add     edx, 4                                  ; 1F61 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 1F64 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 1F68 _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 1F6B _ 89. 50, 18
        add     dword [ebp-10H], 1                      ; 1F6E _ 83. 45, F0, 01
?_112:  mov     eax, dword [ebp-10H]                    ; 1F72 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 1F75 _ 3B. 45, 10
        jl      ?_111                                   ; 1F78 _ 7C, C4
        mov     eax, dword [ebp+8H]                     ; 1F7A _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 1F7D _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 1F80 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 1F83 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 1F86 _ 89. 54 88, 04
        jmp     ?_116                                   ; 1F8A _ EB, 6C

?_113:  mov     eax, dword [ebp+8H]                     ; 1F8C _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 1F8F _ 8B. 40, 10
        mov     dword [ebp-10H], eax                    ; 1F92 _ 89. 45, F0
        jmp     ?_115                                   ; 1F95 _ EB, 3A

?_114:  mov     eax, dword [ebp-10H]                    ; 1F97 _ 8B. 45, F0
        lea     ecx, [eax+1H]                           ; 1F9A _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 1F9D _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 1FA0 _ 8B. 55, F0
        add     edx, 4                                  ; 1FA3 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 1FA6 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 1FAA _ 8B. 45, 08
        add     ecx, 4                                  ; 1FAD _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 1FB0 _ 89. 54 88, 04
        mov     eax, dword [ebp-10H]                    ; 1FB4 _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 1FB7 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1FBA _ 8B. 45, 08
        add     edx, 4                                  ; 1FBD _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 1FC0 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 1FC4 _ 8B. 55, F0
        add     edx, 1                                  ; 1FC7 _ 83. C2, 01
        mov     dword [eax+18H], edx                    ; 1FCA _ 89. 50, 18
        sub     dword [ebp-10H], 1                      ; 1FCD _ 83. 6D, F0, 01
?_115:  mov     eax, dword [ebp-10H]                    ; 1FD1 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 1FD4 _ 3B. 45, 10
        jge     ?_114                                   ; 1FD7 _ 7D, BE
        mov     eax, dword [ebp+8H]                     ; 1FD9 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 1FDC _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 1FDF _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 1FE2 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 1FE5 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 1FE9 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 1FEC _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 1FEF _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1FF2 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 1FF5 _ 89. 50, 10
?_116:  mov     eax, dword [ebp+0CH]                    ; 1FF8 _ 8B. 45, 0C
        mov     ecx, dword [eax+18H]                    ; 1FFB _ 8B. 48, 18
        mov     eax, dword [ebp+0CH]                    ; 1FFE _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2001 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2004 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 2007 _ 8B. 40, 08
        lea     esi, [edx+eax]                          ; 200A _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 200D _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 2010 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2013 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2016 _ 8B. 40, 04
        lea     ebx, [edx+eax]                          ; 2019 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 201C _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 201F _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2022 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2025 _ 8B. 40, 0C
        sub     esp, 8                                  ; 2028 _ 83. EC, 08
        push    ecx                                     ; 202B _ 51
        push    esi                                     ; 202C _ 56
        push    ebx                                     ; 202D _ 53
        push    edx                                     ; 202E _ 52
        push    eax                                     ; 202F _ 50
        push    dword [ebp+8H]                          ; 2030 _ FF. 75, 08
        call    sheet_refreshmap                        ; 2033 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2038 _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 203B _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 203E _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2041 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 2044 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 2047 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 204A _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 204D _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2050 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2053 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 2056 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 2059 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 205C _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 205F _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2062 _ 8B. 40, 0C
        sub     esp, 8                                  ; 2065 _ 83. EC, 08
        push    dword [ebp+10H]                         ; 2068 _ FF. 75, 10
        push    ebx                                     ; 206B _ 53
        push    ecx                                     ; 206C _ 51
        push    edx                                     ; 206D _ 52
        push    eax                                     ; 206E _ 50
        push    dword [ebp+8H]                          ; 206F _ FF. 75, 08
        call    sheet_refreshsub                        ; 2072 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2077 _ 83. C4, 20
?_117:  nop                                             ; 207A _ 90
        lea     esp, [ebp-8H]                           ; 207B _ 8D. 65, F8
        pop     ebx                                     ; 207E _ 5B
        pop     esi                                     ; 207F _ 5E
        pop     ebp                                     ; 2080 _ 5D
        ret                                             ; 2081 _ C3
; sheet_updown End of function

sheet_refresh:; Function begin
        push    ebp                                     ; 2082 _ 55
        mov     ebp, esp                                ; 2083 _ 89. E5
        push    edi                                     ; 2085 _ 57
        push    esi                                     ; 2086 _ 56
        push    ebx                                     ; 2087 _ 53
        sub     esp, 12                                 ; 2088 _ 83. EC, 0C
        mov     eax, dword [ebp+0CH]                    ; 208B _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 208E _ 8B. 40, 18
        test    eax, eax                                ; 2091 _ 85. C0
        js      ?_118                                   ; 2093 _ 78, 47
        mov     eax, dword [ebp+0CH]                    ; 2095 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 2098 _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 209B _ 8B. 55, 0C
        mov     ecx, dword [edx+10H]                    ; 209E _ 8B. 4A, 10
        mov     edx, dword [ebp+1CH]                    ; 20A1 _ 8B. 55, 1C
        lea     esi, [ecx+edx]                          ; 20A4 _ 8D. 34 11
        mov     edx, dword [ebp+0CH]                    ; 20A7 _ 8B. 55, 0C
        mov     ecx, dword [edx+0CH]                    ; 20AA _ 8B. 4A, 0C
        mov     edx, dword [ebp+18H]                    ; 20AD _ 8B. 55, 18
        lea     ebx, [ecx+edx]                          ; 20B0 _ 8D. 1C 11
        mov     edx, dword [ebp+0CH]                    ; 20B3 _ 8B. 55, 0C
        mov     ecx, dword [edx+10H]                    ; 20B6 _ 8B. 4A, 10
        mov     edx, dword [ebp+14H]                    ; 20B9 _ 8B. 55, 14
        add     ecx, edx                                ; 20BC _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 20BE _ 8B. 55, 0C
        mov     edi, dword [edx+0CH]                    ; 20C1 _ 8B. 7A, 0C
        mov     edx, dword [ebp+10H]                    ; 20C4 _ 8B. 55, 10
        add     edx, edi                                ; 20C7 _ 01. FA
        sub     esp, 8                                  ; 20C9 _ 83. EC, 08
        push    eax                                     ; 20CC _ 50
        push    esi                                     ; 20CD _ 56
        push    ebx                                     ; 20CE _ 53
        push    ecx                                     ; 20CF _ 51
        push    edx                                     ; 20D0 _ 52
        push    dword [ebp+8H]                          ; 20D1 _ FF. 75, 08
        call    sheet_refreshsub                        ; 20D4 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 20D9 _ 83. C4, 20
?_118:  mov     eax, 0                                  ; 20DC _ B8, 00000000
        lea     esp, [ebp-0CH]                          ; 20E1 _ 8D. 65, F4
        pop     ebx                                     ; 20E4 _ 5B
        pop     esi                                     ; 20E5 _ 5E
        pop     edi                                     ; 20E6 _ 5F
        pop     ebp                                     ; 20E7 _ 5D
        ret                                             ; 20E8 _ C3
; sheet_refresh End of function

sheet_slide_mouse:; Function begin
        push    ebp                                     ; 20E9 _ 55
        mov     ebp, esp                                ; 20EA _ 89. E5
        push    ebx                                     ; 20EC _ 53
        sub     esp, 20                                 ; 20ED _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 20F0 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 20F3 _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 20F6 _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 20F9 _ 8B. 45, 0C
        mov     eax, dword [eax+10H]                    ; 20FC _ 8B. 40, 10
        mov     dword [ebp-0CH], eax                    ; 20FF _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 2102 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 2105 _ 8B. 55, 10
        mov     dword [eax+0CH], edx                    ; 2108 _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 210B _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 210E _ 8B. 55, 14
        mov     dword [eax+10H], edx                    ; 2111 _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2114 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 2117 _ 8B. 40, 18
        test    eax, eax                                ; 211A _ 85. C0
        js      ?_119                                   ; 211C _ 0F 88, 000000AE
        mov     eax, dword [ebp-0CH]                    ; 2122 _ 8B. 45, F4
        lea     edx, [eax+10H]                          ; 2125 _ 8D. 50, 10
        mov     eax, dword [ebp-10H]                    ; 2128 _ 8B. 45, F0
        add     eax, 16                                 ; 212B _ 83. C0, 10
        sub     esp, 8                                  ; 212E _ 83. EC, 08
        push    0                                       ; 2131 _ 6A, 00
        push    edx                                     ; 2133 _ 52
        push    eax                                     ; 2134 _ 50
        push    dword [ebp-0CH]                         ; 2135 _ FF. 75, F4
        push    dword [ebp-10H]                         ; 2138 _ FF. 75, F0
        push    dword [ebp+8H]                          ; 213B _ FF. 75, 08
        call    sheet_refreshmap                        ; 213E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2143 _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 2146 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 2149 _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 214C _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 214F _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 2152 _ 8B. 55, 14
        add     ecx, edx                                ; 2155 _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 2157 _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 215A _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 215D _ 8B. 55, 10
        add     edx, ebx                                ; 2160 _ 01. DA
        sub     esp, 8                                  ; 2162 _ 83. EC, 08
        push    eax                                     ; 2165 _ 50
        push    ecx                                     ; 2166 _ 51
        push    edx                                     ; 2167 _ 52
        push    dword [ebp+14H]                         ; 2168 _ FF. 75, 14
        push    dword [ebp+10H]                         ; 216B _ FF. 75, 10
        push    dword [ebp+8H]                          ; 216E _ FF. 75, 08
        call    sheet_refreshmap                        ; 2171 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2176 _ 83. C4, 20
        mov     eax, dword [ebp-0CH]                    ; 2179 _ 8B. 45, F4
        lea     edx, [eax+10H]                          ; 217C _ 8D. 50, 10
        mov     eax, dword [ebp-10H]                    ; 217F _ 8B. 45, F0
        add     eax, 16                                 ; 2182 _ 83. C0, 10
        sub     esp, 8                                  ; 2185 _ 83. EC, 08
        push    0                                       ; 2188 _ 6A, 00
        push    edx                                     ; 218A _ 52
        push    eax                                     ; 218B _ 50
        push    dword [ebp-0CH]                         ; 218C _ FF. 75, F4
        push    dword [ebp-10H]                         ; 218F _ FF. 75, F0
        push    dword [ebp+8H]                          ; 2192 _ FF. 75, 08
        call    sheet_refreshsub                        ; 2195 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 219A _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 219D _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 21A0 _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 21A3 _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 21A6 _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 21A9 _ 8B. 55, 14
        add     ecx, edx                                ; 21AC _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 21AE _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 21B1 _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 21B4 _ 8B. 55, 10
        add     edx, ebx                                ; 21B7 _ 01. DA
        sub     esp, 8                                  ; 21B9 _ 83. EC, 08
        push    eax                                     ; 21BC _ 50
        push    ecx                                     ; 21BD _ 51
        push    edx                                     ; 21BE _ 52
        push    dword [ebp+14H]                         ; 21BF _ FF. 75, 14
        push    dword [ebp+10H]                         ; 21C2 _ FF. 75, 10
        push    dword [ebp+8H]                          ; 21C5 _ FF. 75, 08
        call    sheet_refreshsub                        ; 21C8 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 21CD _ 83. C4, 20
?_119:  nop                                             ; 21D0 _ 90
        mov     ebx, dword [ebp-4H]                     ; 21D1 _ 8B. 5D, FC
        leave                                           ; 21D4 _ C9
        ret                                             ; 21D5 _ C3
; sheet_slide_mouse End of function

sheet_slide:; Function begin
        push    ebp                                     ; 21D6 _ 55
        mov     ebp, esp                                ; 21D7 _ 89. E5
        push    ebx                                     ; 21D9 _ 53
        sub     esp, 20                                 ; 21DA _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 21DD _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 21E0 _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 21E3 _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 21E6 _ 8B. 45, 0C
        mov     eax, dword [eax+10H]                    ; 21E9 _ 8B. 40, 10
        mov     dword [ebp-0CH], eax                    ; 21EC _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 21EF _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 21F2 _ 8B. 55, 10
        mov     dword [eax+0CH], edx                    ; 21F5 _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 21F8 _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 21FB _ 8B. 55, 14
        mov     dword [eax+10H], edx                    ; 21FE _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2201 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 2204 _ 8B. 40, 18
        test    eax, eax                                ; 2207 _ 85. C0
        js      ?_120                                   ; 2209 _ 0F 88, 000000C2
        mov     eax, dword [ebp+0CH]                    ; 220F _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 2212 _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 2215 _ 8B. 45, F4
        add     edx, eax                                ; 2218 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 221A _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 221D _ 8B. 48, 04
        mov     eax, dword [ebp-10H]                    ; 2220 _ 8B. 45, F0
        add     eax, ecx                                ; 2223 _ 01. C8
        sub     esp, 8                                  ; 2225 _ 83. EC, 08
        push    0                                       ; 2228 _ 6A, 00
        push    edx                                     ; 222A _ 52
        push    eax                                     ; 222B _ 50
        push    dword [ebp-0CH]                         ; 222C _ FF. 75, F4
        push    dword [ebp-10H]                         ; 222F _ FF. 75, F0
        push    dword [ebp+8H]                          ; 2232 _ FF. 75, 08
        call    sheet_refreshmap                        ; 2235 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 223A _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 223D _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 2240 _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 2243 _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 2246 _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 2249 _ 8B. 55, 14
        add     ecx, edx                                ; 224C _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 224E _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 2251 _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 2254 _ 8B. 55, 10
        add     edx, ebx                                ; 2257 _ 01. DA
        sub     esp, 8                                  ; 2259 _ 83. EC, 08
        push    eax                                     ; 225C _ 50
        push    ecx                                     ; 225D _ 51
        push    edx                                     ; 225E _ 52
        push    dword [ebp+14H]                         ; 225F _ FF. 75, 14
        push    dword [ebp+10H]                         ; 2262 _ FF. 75, 10
        push    dword [ebp+8H]                          ; 2265 _ FF. 75, 08
        call    sheet_refreshmap                        ; 2268 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 226D _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 2270 _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 2273 _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 2276 _ 8B. 45, F4
        add     edx, eax                                ; 2279 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 227B _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 227E _ 8B. 48, 04
        mov     eax, dword [ebp-10H]                    ; 2281 _ 8B. 45, F0
        add     eax, ecx                                ; 2284 _ 01. C8
        sub     esp, 8                                  ; 2286 _ 83. EC, 08
        push    0                                       ; 2289 _ 6A, 00
        push    edx                                     ; 228B _ 52
        push    eax                                     ; 228C _ 50
        push    dword [ebp-0CH]                         ; 228D _ FF. 75, F4
        push    dword [ebp-10H]                         ; 2290 _ FF. 75, F0
        push    dword [ebp+8H]                          ; 2293 _ FF. 75, 08
        call    sheet_refreshsub                        ; 2296 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 229B _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 229E _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 22A1 _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 22A4 _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 22A7 _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 22AA _ 8B. 55, 14
        add     ecx, edx                                ; 22AD _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 22AF _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 22B2 _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 22B5 _ 8B. 55, 10
        add     edx, ebx                                ; 22B8 _ 01. DA
        sub     esp, 8                                  ; 22BA _ 83. EC, 08
        push    eax                                     ; 22BD _ 50
        push    ecx                                     ; 22BE _ 51
        push    edx                                     ; 22BF _ 52
        push    dword [ebp+14H]                         ; 22C0 _ FF. 75, 14
        push    dword [ebp+10H]                         ; 22C3 _ FF. 75, 10
        push    dword [ebp+8H]                          ; 22C6 _ FF. 75, 08
        call    sheet_refreshsub                        ; 22C9 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 22CE _ 83. C4, 20
?_120:  nop                                             ; 22D1 _ 90
        mov     ebx, dword [ebp-4H]                     ; 22D2 _ 8B. 5D, FC
        leave                                           ; 22D5 _ C9
        ret                                             ; 22D6 _ C3
; sheet_slide End of function

sheet_refreshsub:; Function begin
        push    ebp                                     ; 22D7 _ 55
        mov     ebp, esp                                ; 22D8 _ 89. E5
        sub     esp, 48                                 ; 22DA _ 83. EC, 30
        mov     eax, dword [ebp+8H]                     ; 22DD _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 22E0 _ 8B. 00
        mov     dword [ebp-18H], eax                    ; 22E2 _ 89. 45, E8
        mov     eax, dword [ebp+8H]                     ; 22E5 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 22E8 _ 8B. 40, 04
        mov     dword [ebp-14H], eax                    ; 22EB _ 89. 45, EC
        mov     eax, dword [ebp+1CH]                    ; 22EE _ 8B. 45, 1C
        mov     dword [ebp-24H], eax                    ; 22F1 _ 89. 45, DC
        jmp     ?_127                                   ; 22F4 _ E9, 00000118

?_121:  mov     eax, dword [ebp+8H]                     ; 22F9 _ 8B. 45, 08
        mov     edx, dword [ebp-24H]                    ; 22FC _ 8B. 55, DC
        add     edx, 4                                  ; 22FF _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 2302 _ 8B. 44 90, 04
        mov     dword [ebp-10H], eax                    ; 2306 _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 2309 _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 230C _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 230E _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 2311 _ 8B. 45, F0
        mov     edx, dword [ebp+8H]                     ; 2314 _ 8B. 55, 08
        add     edx, 1044                               ; 2317 _ 81. C2, 00000414
        sub     eax, edx                                ; 231D _ 29. D0
        sar     eax, 5                                  ; 231F _ C1. F8, 05
        mov     byte [ebp-26H], al                      ; 2322 _ 88. 45, DA
        mov     dword [ebp-1CH], 0                      ; 2325 _ C7. 45, E4, 00000000
        jmp     ?_126                                   ; 232C _ E9, 000000CD

?_122:  mov     eax, dword [ebp-10H]                    ; 2331 _ 8B. 45, F0
        mov     edx, dword [eax+10H]                    ; 2334 _ 8B. 50, 10
        mov     eax, dword [ebp-1CH]                    ; 2337 _ 8B. 45, E4
        add     eax, edx                                ; 233A _ 01. D0
        mov     dword [ebp-8H], eax                     ; 233C _ 89. 45, F8
        mov     dword [ebp-20H], 0                      ; 233F _ C7. 45, E0, 00000000
        jmp     ?_125                                   ; 2346 _ E9, 000000A0

?_123:  mov     eax, dword [ebp-10H]                    ; 234B _ 8B. 45, F0
        mov     edx, dword [eax+0CH]                    ; 234E _ 8B. 50, 0C
        mov     eax, dword [ebp-20H]                    ; 2351 _ 8B. 45, E0
        add     eax, edx                                ; 2354 _ 01. D0
        mov     dword [ebp-4H], eax                     ; 2356 _ 89. 45, FC
        mov     eax, dword [ebp+0CH]                    ; 2359 _ 8B. 45, 0C
        cmp     eax, dword [ebp-4H]                     ; 235C _ 3B. 45, FC
        jg      ?_124                                   ; 235F _ 0F 8F, 00000082
        mov     eax, dword [ebp-4H]                     ; 2365 _ 8B. 45, FC
        cmp     eax, dword [ebp+14H]                    ; 2368 _ 3B. 45, 14
        jge     ?_124                                   ; 236B _ 7D, 7A
        mov     eax, dword [ebp+10H]                    ; 236D _ 8B. 45, 10
        cmp     eax, dword [ebp-8H]                     ; 2370 _ 3B. 45, F8
        jg      ?_124                                   ; 2373 _ 7F, 72
        mov     eax, dword [ebp-8H]                     ; 2375 _ 8B. 45, F8
        cmp     eax, dword [ebp+18H]                    ; 2378 _ 3B. 45, 18
        jge     ?_124                                   ; 237B _ 7D, 6A
        mov     eax, dword [ebp-10H]                    ; 237D _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 2380 _ 8B. 40, 04
        imul    eax, dword [ebp-1CH]                    ; 2383 _ 0F AF. 45, E4
        mov     edx, eax                                ; 2387 _ 89. C2
        mov     eax, dword [ebp-20H]                    ; 2389 _ 8B. 45, E0
        add     eax, edx                                ; 238C _ 01. D0
        mov     edx, eax                                ; 238E _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 2390 _ 8B. 45, F4
        add     eax, edx                                ; 2393 _ 01. D0
        movzx   eax, byte [eax]                         ; 2395 _ 0F B6. 00
        mov     byte [ebp-25H], al                      ; 2398 _ 88. 45, DB
        mov     eax, dword [ebp+8H]                     ; 239B _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 239E _ 8B. 40, 08
        imul    eax, dword [ebp-8H]                     ; 23A1 _ 0F AF. 45, F8
        mov     edx, eax                                ; 23A5 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 23A7 _ 8B. 45, FC
        add     eax, edx                                ; 23AA _ 01. D0
        mov     edx, eax                                ; 23AC _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 23AE _ 8B. 45, EC
        add     eax, edx                                ; 23B1 _ 01. D0
        movzx   eax, byte [eax]                         ; 23B3 _ 0F B6. 00
        cmp     byte [ebp-26H], al                      ; 23B6 _ 38. 45, DA
        jnz     ?_124                                   ; 23B9 _ 75, 2C
        movzx   edx, byte [ebp-25H]                     ; 23BB _ 0F B6. 55, DB
        mov     eax, dword [ebp-10H]                    ; 23BF _ 8B. 45, F0
        mov     eax, dword [eax+14H]                    ; 23C2 _ 8B. 40, 14
        cmp     edx, eax                                ; 23C5 _ 39. C2
        jz      ?_124                                   ; 23C7 _ 74, 1E
        mov     eax, dword [ebp+8H]                     ; 23C9 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 23CC _ 8B. 40, 08
        imul    eax, dword [ebp-8H]                     ; 23CF _ 0F AF. 45, F8
        mov     edx, eax                                ; 23D3 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 23D5 _ 8B. 45, FC
        add     eax, edx                                ; 23D8 _ 01. D0
        mov     edx, eax                                ; 23DA _ 89. C2
        mov     eax, dword [ebp-18H]                    ; 23DC _ 8B. 45, E8
        add     edx, eax                                ; 23DF _ 01. C2
        movzx   eax, byte [ebp-25H]                     ; 23E1 _ 0F B6. 45, DB
        mov     byte [edx], al                          ; 23E5 _ 88. 02
?_124:  add     dword [ebp-20H], 1                      ; 23E7 _ 83. 45, E0, 01
?_125:  mov     eax, dword [ebp-10H]                    ; 23EB _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 23EE _ 8B. 40, 04
        cmp     dword [ebp-20H], eax                    ; 23F1 _ 39. 45, E0
        jl      ?_123                                   ; 23F4 _ 0F 8C, FFFFFF51
        add     dword [ebp-1CH], 1                      ; 23FA _ 83. 45, E4, 01
?_126:  mov     eax, dword [ebp-10H]                    ; 23FE _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 2401 _ 8B. 40, 08
        cmp     dword [ebp-1CH], eax                    ; 2404 _ 39. 45, E4
        jl      ?_122                                   ; 2407 _ 0F 8C, FFFFFF24
        add     dword [ebp-24H], 1                      ; 240D _ 83. 45, DC, 01
?_127:  mov     eax, dword [ebp+8H]                     ; 2411 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2414 _ 8B. 40, 10
        cmp     dword [ebp-24H], eax                    ; 2417 _ 39. 45, DC
        jle     ?_121                                   ; 241A _ 0F 8E, FFFFFED9
        nop                                             ; 2420 _ 90
        leave                                           ; 2421 _ C9
        ret                                             ; 2422 _ C3
; sheet_refreshsub End of function

sheet_refreshmap:; Function begin
        push    ebp                                     ; 2423 _ 55
        mov     ebp, esp                                ; 2424 _ 89. E5
        sub     esp, 64                                 ; 2426 _ 83. EC, 40
        mov     eax, dword [ebp+8H]                     ; 2429 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 242C _ 8B. 40, 04
        mov     dword [ebp-14H], eax                    ; 242F _ 89. 45, EC
        cmp     dword [ebp+0CH], 0                      ; 2432 _ 83. 7D, 0C, 00
        jns     ?_128                                   ; 2436 _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 2438 _ C7. 45, 0C, 00000000
?_128:  cmp     dword [ebp+10H], 0                      ; 243F _ 83. 7D, 10, 00
        jns     ?_129                                   ; 2443 _ 79, 07
        mov     dword [ebp+10H], 0                      ; 2445 _ C7. 45, 10, 00000000
?_129:  mov     eax, dword [ebp+8H]                     ; 244C _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 244F _ 8B. 40, 08
        cmp     dword [ebp+14H], eax                    ; 2452 _ 39. 45, 14
        jle     ?_130                                   ; 2455 _ 7E, 09
        mov     eax, dword [ebp+8H]                     ; 2457 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 245A _ 8B. 40, 08
        mov     dword [ebp+14H], eax                    ; 245D _ 89. 45, 14
?_130:  mov     eax, dword [ebp+8H]                     ; 2460 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2463 _ 8B. 40, 0C
        cmp     dword [ebp+18H], eax                    ; 2466 _ 39. 45, 18
        jle     ?_131                                   ; 2469 _ 7E, 09
        mov     eax, dword [ebp+8H]                     ; 246B _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 246E _ 8B. 40, 0C
        mov     dword [ebp+18H], eax                    ; 2471 _ 89. 45, 18
?_131:  mov     eax, dword [ebp+1CH]                    ; 2474 _ 8B. 45, 1C
        mov     dword [ebp-30H], eax                    ; 2477 _ 89. 45, D0
        jmp     ?_142                                   ; 247A _ E9, 00000140

?_132:  mov     eax, dword [ebp+8H]                     ; 247F _ 8B. 45, 08
        mov     edx, dword [ebp-30H]                    ; 2482 _ 8B. 55, D0
        add     edx, 4                                  ; 2485 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 2488 _ 8B. 44 90, 04
        mov     dword [ebp-10H], eax                    ; 248C _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 248F _ 8B. 45, F0
        mov     edx, dword [ebp+8H]                     ; 2492 _ 8B. 55, 08
        add     edx, 1044                               ; 2495 _ 81. C2, 00000414
        sub     eax, edx                                ; 249B _ 29. D0
        sar     eax, 5                                  ; 249D _ C1. F8, 05
        mov     byte [ebp-31H], al                      ; 24A0 _ 88. 45, CF
        mov     eax, dword [ebp-10H]                    ; 24A3 _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 24A6 _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 24A8 _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 24AB _ 8B. 45, F0
        mov     eax, dword [eax+0CH]                    ; 24AE _ 8B. 40, 0C
        mov     edx, dword [ebp+0CH]                    ; 24B1 _ 8B. 55, 0C
        sub     edx, eax                                ; 24B4 _ 29. C2
        mov     eax, edx                                ; 24B6 _ 89. D0
        mov     dword [ebp-24H], eax                    ; 24B8 _ 89. 45, DC
        mov     eax, dword [ebp-10H]                    ; 24BB _ 8B. 45, F0
        mov     eax, dword [eax+10H]                    ; 24BE _ 8B. 40, 10
        mov     edx, dword [ebp+10H]                    ; 24C1 _ 8B. 55, 10
        sub     edx, eax                                ; 24C4 _ 29. C2
        mov     eax, edx                                ; 24C6 _ 89. D0
        mov     dword [ebp-20H], eax                    ; 24C8 _ 89. 45, E0
        mov     eax, dword [ebp-10H]                    ; 24CB _ 8B. 45, F0
        mov     eax, dword [eax+0CH]                    ; 24CE _ 8B. 40, 0C
        mov     edx, dword [ebp+14H]                    ; 24D1 _ 8B. 55, 14
        sub     edx, eax                                ; 24D4 _ 29. C2
        mov     eax, edx                                ; 24D6 _ 89. D0
        mov     dword [ebp-1CH], eax                    ; 24D8 _ 89. 45, E4
        mov     eax, dword [ebp-10H]                    ; 24DB _ 8B. 45, F0
        mov     eax, dword [eax+10H]                    ; 24DE _ 8B. 40, 10
        mov     edx, dword [ebp+18H]                    ; 24E1 _ 8B. 55, 18
        sub     edx, eax                                ; 24E4 _ 29. C2
        mov     eax, edx                                ; 24E6 _ 89. D0
        mov     dword [ebp-18H], eax                    ; 24E8 _ 89. 45, E8
        cmp     dword [ebp-24H], 0                      ; 24EB _ 83. 7D, DC, 00
        jns     ?_133                                   ; 24EF _ 79, 07
        mov     dword [ebp-24H], 0                      ; 24F1 _ C7. 45, DC, 00000000
?_133:  cmp     dword [ebp-20H], 0                      ; 24F8 _ 83. 7D, E0, 00
        jns     ?_134                                   ; 24FC _ 79, 07
        mov     dword [ebp-20H], 0                      ; 24FE _ C7. 45, E0, 00000000
?_134:  mov     eax, dword [ebp-10H]                    ; 2505 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 2508 _ 8B. 40, 04
        cmp     dword [ebp-1CH], eax                    ; 250B _ 39. 45, E4
        jle     ?_135                                   ; 250E _ 7E, 09
        mov     eax, dword [ebp-10H]                    ; 2510 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 2513 _ 8B. 40, 04
        mov     dword [ebp-1CH], eax                    ; 2516 _ 89. 45, E4
?_135:  mov     eax, dword [ebp-10H]                    ; 2519 _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 251C _ 8B. 40, 08
        cmp     dword [ebp-18H], eax                    ; 251F _ 39. 45, E8
        jle     ?_136                                   ; 2522 _ 7E, 09
        mov     eax, dword [ebp-10H]                    ; 2524 _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 2527 _ 8B. 40, 08
        mov     dword [ebp-18H], eax                    ; 252A _ 89. 45, E8
?_136:  mov     eax, dword [ebp-20H]                    ; 252D _ 8B. 45, E0
        mov     dword [ebp-28H], eax                    ; 2530 _ 89. 45, D8
        jmp     ?_141                                   ; 2533 _ EB, 7A

?_137:  mov     eax, dword [ebp-10H]                    ; 2535 _ 8B. 45, F0
        mov     edx, dword [eax+10H]                    ; 2538 _ 8B. 50, 10
        mov     eax, dword [ebp-28H]                    ; 253B _ 8B. 45, D8
        add     eax, edx                                ; 253E _ 01. D0
        mov     dword [ebp-8H], eax                     ; 2540 _ 89. 45, F8
        mov     eax, dword [ebp-24H]                    ; 2543 _ 8B. 45, DC
        mov     dword [ebp-2CH], eax                    ; 2546 _ 89. 45, D4
        jmp     ?_140                                   ; 2549 _ EB, 58

?_138:  mov     eax, dword [ebp-10H]                    ; 254B _ 8B. 45, F0
        mov     edx, dword [eax+0CH]                    ; 254E _ 8B. 50, 0C
        mov     eax, dword [ebp-2CH]                    ; 2551 _ 8B. 45, D4
        add     eax, edx                                ; 2554 _ 01. D0
        mov     dword [ebp-4H], eax                     ; 2556 _ 89. 45, FC
        mov     eax, dword [ebp-10H]                    ; 2559 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 255C _ 8B. 40, 04
        imul    eax, dword [ebp-28H]                    ; 255F _ 0F AF. 45, D8
        mov     edx, eax                                ; 2563 _ 89. C2
        mov     eax, dword [ebp-2CH]                    ; 2565 _ 8B. 45, D4
        add     eax, edx                                ; 2568 _ 01. D0
        mov     edx, eax                                ; 256A _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 256C _ 8B. 45, F4
        add     eax, edx                                ; 256F _ 01. D0
        movzx   eax, byte [eax]                         ; 2571 _ 0F B6. 00
        movzx   edx, al                                 ; 2574 _ 0F B6. D0
        mov     eax, dword [ebp-10H]                    ; 2577 _ 8B. 45, F0
        mov     eax, dword [eax+14H]                    ; 257A _ 8B. 40, 14
        cmp     edx, eax                                ; 257D _ 39. C2
        jz      ?_139                                   ; 257F _ 74, 1E
        mov     eax, dword [ebp+8H]                     ; 2581 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2584 _ 8B. 40, 08
        imul    eax, dword [ebp-8H]                     ; 2587 _ 0F AF. 45, F8
        mov     edx, eax                                ; 258B _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 258D _ 8B. 45, FC
        add     eax, edx                                ; 2590 _ 01. D0
        mov     edx, eax                                ; 2592 _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 2594 _ 8B. 45, EC
        add     edx, eax                                ; 2597 _ 01. C2
        movzx   eax, byte [ebp-31H]                     ; 2599 _ 0F B6. 45, CF
        mov     byte [edx], al                          ; 259D _ 88. 02
?_139:  add     dword [ebp-2CH], 1                      ; 259F _ 83. 45, D4, 01
?_140:  mov     eax, dword [ebp-2CH]                    ; 25A3 _ 8B. 45, D4
        cmp     eax, dword [ebp-1CH]                    ; 25A6 _ 3B. 45, E4
        jl      ?_138                                   ; 25A9 _ 7C, A0
        add     dword [ebp-28H], 1                      ; 25AB _ 83. 45, D8, 01
?_141:  mov     eax, dword [ebp-28H]                    ; 25AF _ 8B. 45, D8
        cmp     eax, dword [ebp-18H]                    ; 25B2 _ 3B. 45, E8
        jl      ?_137                                   ; 25B5 _ 0F 8C, FFFFFF7A
        add     dword [ebp-30H], 1                      ; 25BB _ 83. 45, D0, 01
?_142:  mov     eax, dword [ebp+8H]                     ; 25BF _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 25C2 _ 8B. 40, 10
        cmp     dword [ebp-30H], eax                    ; 25C5 _ 39. 45, D0
        jle     ?_132                                   ; 25C8 _ 0F 8E, FFFFFEB1
        nop                                             ; 25CE _ 90
        leave                                           ; 25CF _ C9
        ret                                             ; 25D0 _ C3
; sheet_refreshmap End of function

init_pit:; Function begin
        push    ebp                                     ; 25D1 _ 55
        mov     ebp, esp                                ; 25D2 _ 89. E5
        sub     esp, 24                                 ; 25D4 _ 83. EC, 18
        sub     esp, 8                                  ; 25D7 _ 83. EC, 08
        push    52                                      ; 25DA _ 6A, 34
        push    67                                      ; 25DC _ 6A, 43
        call    io_out8                                 ; 25DE _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 25E3 _ 83. C4, 10
        sub     esp, 8                                  ; 25E6 _ 83. EC, 08
        push    156                                     ; 25E9 _ 68, 0000009C
        push    64                                      ; 25EE _ 6A, 40
        call    io_out8                                 ; 25F0 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 25F5 _ 83. C4, 10
        sub     esp, 8                                  ; 25F8 _ 83. EC, 08
        push    46                                      ; 25FB _ 6A, 2E
        push    64                                      ; 25FD _ 6A, 40
        call    io_out8                                 ; 25FF _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2604 _ 83. C4, 10
        sub     esp, 8                                  ; 2607 _ 83. EC, 08
        push    8000                                    ; 260A _ 68, 00001F40
        push    dword [ebp+8H]                          ; 260F _ FF. 75, 08
        call    memman_alloc_4k                         ; 2612 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2617 _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 261A _ 89. 45, F4
        cmp     dword [ebp-0CH], 0                      ; 261D _ 83. 7D, F4, 00
        jnz     ?_143                                   ; 2621 _ 75, 07
        mov     eax, 0                                  ; 2623 _ B8, 00000000
        jmp     ?_146                                   ; 2628 _ EB, 36

?_143:  mov     eax, dword [ebp-0CH]                    ; 262A _ 8B. 45, F4
        mov     dword [eax], 0                          ; 262D _ C7. 00, 00000000
        mov     dword [ebp-10H], 0                      ; 2633 _ C7. 45, F0, 00000000
        jmp     ?_145                                   ; 263A _ EB, 18

?_144:  mov     eax, dword [ebp-0CH]                    ; 263C _ 8B. 45, F4
        mov     edx, dword [ebp-10H]                    ; 263F _ 8B. 55, F0
        shl     edx, 4                                  ; 2642 _ C1. E2, 04
        add     eax, edx                                ; 2645 _ 01. D0
        add     eax, 4                                  ; 2647 _ 83. C0, 04
        mov     dword [eax], 0                          ; 264A _ C7. 00, 00000000
        add     dword [ebp-10H], 1                      ; 2650 _ 83. 45, F0, 01
?_145:  cmp     dword [ebp-10H], 499                    ; 2654 _ 81. 7D, F0, 000001F3
        jle     ?_144                                   ; 265B _ 7E, DF
        mov     eax, dword [ebp-0CH]                    ; 265D _ 8B. 45, F4
?_146:  leave                                           ; 2660 _ C9
        ret                                             ; 2661 _ C3
; init_pit End of function

timer_alloc:; Function begin
        push    ebp                                     ; 2662 _ 55
        mov     ebp, esp                                ; 2663 _ 89. E5
        sub     esp, 16                                 ; 2665 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 2668 _ C7. 45, FC, 00000000
        jmp     ?_149                                   ; 266F _ EB, 3E

?_147:  mov     eax, dword [ebp+8H]                     ; 2671 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 2674 _ 8B. 55, FC
        shl     edx, 4                                  ; 2677 _ C1. E2, 04
        add     eax, edx                                ; 267A _ 01. D0
        add     eax, 4                                  ; 267C _ 83. C0, 04
        mov     eax, dword [eax]                        ; 267F _ 8B. 00
        test    eax, eax                                ; 2681 _ 85. C0
        jnz     ?_148                                   ; 2683 _ 75, 26
        mov     eax, dword [ebp+8H]                     ; 2685 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 2688 _ 8B. 55, FC
        shl     edx, 4                                  ; 268B _ C1. E2, 04
        add     eax, edx                                ; 268E _ 01. D0
        add     eax, 4                                  ; 2690 _ 83. C0, 04
        mov     dword [eax], 1                          ; 2693 _ C7. 00, 00000001
        mov     eax, dword [ebp-4H]                     ; 2699 _ 8B. 45, FC
        shl     eax, 4                                  ; 269C _ C1. E0, 04
        mov     edx, eax                                ; 269F _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 26A1 _ 8B. 45, 08
        add     eax, edx                                ; 26A4 _ 01. D0
        add     eax, 4                                  ; 26A6 _ 83. C0, 04
        jmp     ?_150                                   ; 26A9 _ EB, 12

?_148:  add     dword [ebp-4H], 1                       ; 26AB _ 83. 45, FC, 01
?_149:  cmp     dword [ebp-4H], 499                     ; 26AF _ 81. 7D, FC, 000001F3
        jle     ?_147                                   ; 26B6 _ 7E, B9
        mov     eax, 0                                  ; 26B8 _ B8, 00000000
?_150:  leave                                           ; 26BD _ C9
        ret                                             ; 26BE _ C3
; timer_alloc End of function

timer_free:; Function begin
        push    ebp                                     ; 26BF _ 55
        mov     ebp, esp                                ; 26C0 _ 89. E5
        mov     eax, dword [ebp+0CH]                    ; 26C2 _ 8B. 45, 0C
        mov     dword [eax], 0                          ; 26C5 _ C7. 00, 00000000
        nop                                             ; 26CB _ 90
        pop     ebp                                     ; 26CC _ 5D
        ret                                             ; 26CD _ C3
; timer_free End of function

timer_init:; Function begin
        push    ebp                                     ; 26CE _ 55
        mov     ebp, esp                                ; 26CF _ 89. E5
        sub     esp, 4                                  ; 26D1 _ 83. EC, 04
        mov     eax, dword [ebp+14H]                    ; 26D4 _ 8B. 45, 14
        mov     byte [ebp-4H], al                       ; 26D7 _ 88. 45, FC
        mov     eax, dword [ebp+0CH]                    ; 26DA _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 26DD _ 8B. 55, 10
        mov     dword [eax+8H], edx                     ; 26E0 _ 89. 50, 08
        mov     eax, dword [ebp+0CH]                    ; 26E3 _ 8B. 45, 0C
        movzx   edx, byte [ebp-4H]                      ; 26E6 _ 0F B6. 55, FC
        mov     byte [eax+0CH], dl                      ; 26EA _ 88. 50, 0C
        nop                                             ; 26ED _ 90
        leave                                           ; 26EE _ C9
        ret                                             ; 26EF _ C3
; timer_init End of function

timer_setdata:; Function begin
        push    ebp                                     ; 26F0 _ 55
        mov     ebp, esp                                ; 26F1 _ 89. E5
        sub     esp, 4                                  ; 26F3 _ 83. EC, 04
        mov     eax, dword [ebp+10H]                    ; 26F6 _ 8B. 45, 10
        mov     byte [ebp-4H], al                       ; 26F9 _ 88. 45, FC
        mov     eax, dword [ebp+0CH]                    ; 26FC _ 8B. 45, 0C
        movzx   edx, byte [ebp-4H]                      ; 26FF _ 0F B6. 55, FC
        mov     byte [eax+0CH], dl                      ; 2703 _ 88. 50, 0C
        nop                                             ; 2706 _ 90
        leave                                           ; 2707 _ C9
        ret                                             ; 2708 _ C3
; timer_setdata End of function

timer_settime:; Function begin
        push    ebp                                     ; 2709 _ 55
        mov     ebp, esp                                ; 270A _ 89. E5
        mov     eax, dword [ebp+0CH]                    ; 270C _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 270F _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 2712 _ 89. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 2715 _ 8B. 45, 0C
        mov     dword [eax], 2                          ; 2718 _ C7. 00, 00000002
        nop                                             ; 271E _ 90
        pop     ebp                                     ; 271F _ 5D
        ret                                             ; 2720 _ C3
; timer_settime End of function

fifo8_init:; Function begin
        push    ebp                                     ; 2721 _ 55
        mov     ebp, esp                                ; 2722 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 2724 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 2727 _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 272A _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 272D _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 2730 _ 8B. 55, 10
        mov     dword [eax], edx                        ; 2733 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 2735 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 2738 _ 8B. 55, 0C
        mov     dword [eax+10H], edx                    ; 273B _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 273E _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 2741 _ C7. 40, 14, 00000000
        mov     eax, dword [ebp+8H]                     ; 2748 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 274B _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 2752 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 2755 _ C7. 40, 08, 00000000
        nop                                             ; 275C _ 90
        pop     ebp                                     ; 275D _ 5D
        ret                                             ; 275E _ C3
; fifo8_init End of function

fifo8_put:; Function begin
        push    ebp                                     ; 275F _ 55
        mov     ebp, esp                                ; 2760 _ 89. E5
        sub     esp, 4                                  ; 2762 _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 2765 _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 2768 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 276B _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 276E _ 8B. 40, 10
        test    eax, eax                                ; 2771 _ 85. C0
        jnz     ?_151                                   ; 2773 _ 75, 18
        mov     eax, dword [ebp+8H]                     ; 2775 _ 8B. 45, 08
        mov     eax, dword [eax+14H]                    ; 2778 _ 8B. 40, 14
        or      eax, 01H                                ; 277B _ 83. C8, 01
        mov     edx, eax                                ; 277E _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2780 _ 8B. 45, 08
        mov     dword [eax+14H], edx                    ; 2783 _ 89. 50, 14
        mov     eax, 4294967295                         ; 2786 _ B8, FFFFFFFF
        jmp     ?_153                                   ; 278B _ EB, 50

?_151:  mov     eax, dword [ebp+8H]                     ; 278D _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 2790 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 2792 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2795 _ 8B. 40, 04
        add     edx, eax                                ; 2798 _ 01. C2
        movzx   eax, byte [ebp-4H]                      ; 279A _ 0F B6. 45, FC
        mov     byte [edx], al                          ; 279E _ 88. 02
        mov     eax, dword [ebp+8H]                     ; 27A0 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 27A3 _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 27A6 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 27A9 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 27AC _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 27AF _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 27B2 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 27B5 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 27B8 _ 8B. 40, 0C
        cmp     edx, eax                                ; 27BB _ 39. C2
        jnz     ?_152                                   ; 27BD _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 27BF _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 27C2 _ C7. 40, 04, 00000000
?_152:  mov     eax, dword [ebp+8H]                     ; 27C9 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 27CC _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 27CF _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 27D2 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 27D5 _ 89. 50, 10
        mov     eax, 0                                  ; 27D8 _ B8, 00000000
?_153:  leave                                           ; 27DD _ C9
        ret                                             ; 27DE _ C3
; fifo8_put End of function

fifo8_get:; Function begin
        push    ebp                                     ; 27DF _ 55
        mov     ebp, esp                                ; 27E0 _ 89. E5
        sub     esp, 16                                 ; 27E2 _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 27E5 _ 8B. 45, 08
        mov     edx, dword [eax+10H]                    ; 27E8 _ 8B. 50, 10
        mov     eax, dword [ebp+8H]                     ; 27EB _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 27EE _ 8B. 40, 0C
        cmp     edx, eax                                ; 27F1 _ 39. C2
        jnz     ?_154                                   ; 27F3 _ 75, 07
        mov     eax, 4294967295                         ; 27F5 _ B8, FFFFFFFF
        jmp     ?_156                                   ; 27FA _ EB, 51

?_154:  mov     eax, dword [ebp+8H]                     ; 27FC _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 27FF _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 2801 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2804 _ 8B. 40, 08
        add     eax, edx                                ; 2807 _ 01. D0
        movzx   eax, byte [eax]                         ; 2809 _ 0F B6. 00
        movzx   eax, al                                 ; 280C _ 0F B6. C0
        mov     dword [ebp-4H], eax                     ; 280F _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 2812 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2815 _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 2818 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 281B _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 281E _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 2821 _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 2824 _ 8B. 50, 08
        mov     eax, dword [ebp+8H]                     ; 2827 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 282A _ 8B. 40, 0C
        cmp     edx, eax                                ; 282D _ 39. C2
        jnz     ?_155                                   ; 282F _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 2831 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 2834 _ C7. 40, 08, 00000000
?_155:  mov     eax, dword [ebp+8H]                     ; 283B _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 283E _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 2841 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2844 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 2847 _ 89. 50, 10
        mov     eax, dword [ebp-4H]                     ; 284A _ 8B. 45, FC
?_156:  leave                                           ; 284D _ C9
        ret                                             ; 284E _ C3
; fifo8_get End of function

fifo8_status:; Function begin
        push    ebp                                     ; 284F _ 55
        mov     ebp, esp                                ; 2850 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 2852 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 2855 _ 8B. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 2858 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 285B _ 8B. 40, 10
        sub     edx, eax                                ; 285E _ 29. C2
        mov     eax, edx                                ; 2860 _ 89. D0
        pop     ebp                                     ; 2862 _ 5D
        ret                                             ; 2863 _ C3
; fifo8_status End of function


SECTION .rodata align=1 noexecute                       ; section number 2, const

?_157:                                                  ; byte
        db 77H, 69H, 6EH, 64H, 64H, 6FH, 77H, 6EH       ; 0000 _ winddown
        db 00H                                          ; 0008 _ .

?_158:                                                  ; byte
        db 4EH, 65H, 77H, 20H, 35H, 5BH, 73H, 65H       ; 0009 _ New 5[se
        db 63H, 5DH, 00H                                ; 0011 _ c].

?_159:                                                  ; byte
        db 33H, 20H, 5BH, 73H, 65H, 63H, 5DH, 00H       ; 0014 _ 3 [sec].

?_160:                                                  ; byte
        db 69H, 6DH, 70H, 72H, 6FH, 76H, 65H, 20H       ; 001C _ improve 
        db 73H, 74H, 72H, 69H, 6EH, 67H, 20H, 73H       ; 0024 _ string s
        db 68H, 6FH, 77H, 69H, 6EH, 67H, 21H, 00H       ; 002C _ howing!.

?_161:                                                  ; byte
        db 70H, 61H, 67H, 65H, 20H, 69H, 73H, 3AH       ; 0034 _ page is:
        db 20H, 00H                                     ; 003C _  .

?_162:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 003E _ BaseAddr
        db 4CH, 3AH, 20H, 00H                           ; 0046 _ L: .

?_163:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 004A _ BaseAddr
        db 48H, 3AH, 20H, 00H                           ; 0052 _ H: .

?_164:                                                  ; byte
        db 4CH, 65H, 6EH, 67H, 74H, 68H, 4CH, 6FH       ; 0056 _ LengthLo
        db 77H, 3AH, 20H, 00H                           ; 005E _ w: .

?_165:                                                  ; byte
        db 4CH, 65H, 6EH, 67H, 74H, 68H, 48H, 69H       ; 0062 _ LengthHi
        db 67H, 68H, 3AH, 20H, 00H                      ; 006A _ gh: .

?_166:                                                  ; byte
        db 54H, 79H, 70H, 65H, 3AH, 20H, 00H            ; 006F _ Type: .

?_167:                                                  ; byte
        db 57H, 65H, 6CH, 65H, 63H, 6FH, 6DH, 65H       ; 0076 _ Welecome
        db 20H, 74H, 6FH, 00H                           ; 007E _  to.

?_168:                                                  ; byte
        db 6DH, 79H, 4FH, 53H, 00H                      ; 0082 _ myOS.


SECTION .eh_frame align=4 noexecute                     ; section number 3, const

        db 14H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0000 _ ........
        db 01H, 7AH, 52H, 00H, 01H, 7CH, 08H, 01H       ; 0008 _ .zR..|..
        db 1BH, 0CH, 04H, 04H, 88H, 01H, 00H, 00H       ; 0010 _ ........
        db 18H, 00H, 00H, 00H, 1CH, 00H, 00H, 00H       ; 0018 _ ........
        dd CMain-$-20H                                  ; 0020 _ 00000000 (rel)
        dd 00000657H, 080E4100H                         ; 0024 _ 1623 135151872 
        dd 0D420285H, 03834405H                         ; 002C _ 222429829 58934277 
        dd 0000001CH, 00000038H                         ; 0034 _ 28 56 
        dd CMain-$+61BH                                 ; 003C _ 00000657 (rel)
        dd 00000021H, 080E4100H                         ; 0040 _ 33 135151872 
        dd 0D420285H, 0CC55D05H                         ; 0048 _ 222429829 214260997 
        dd 00000404H, 0000001CH                         ; 0050 _ 1028 28 
        dd 00000058H                                    ; 0058 _ 88 
        dd CMain-$+61CH                                 ; 005C _ 00000678 (rel)
        dd 0000001DH, 080E4100H                         ; 0060 _ 29 135151872 
        dd 0D420285H, 0CC55905H                         ; 0068 _ 222429829 214259973 
        dd 00000404H, 0000001CH                         ; 0070 _ 1028 28 
        dd 00000078H                                    ; 0078 _ 120 
        dd CMain-$+619H                                 ; 007C _ 00000695 (rel)
        dd 000000ACH, 080E4100H                         ; 0080 _ 172 135151872 
        dd 0D420285H, 0C5A80205H                        ; 0088 _ 222429829 -978845179 
        dd 0004040CH, 0000001CH                         ; 0090 _ 263180 28 
        dd 00000098H                                    ; 0098 _ 152 
        dd CMain-$+6A5H                                 ; 009C _ 00000741 (rel)
        dd 00000052H, 080E4100H                         ; 00A0 _ 82 135151872 
        dd 0D420285H, 0C54E0205H                        ; 00A8 _ 222429829 -984743419 
        dd 0004040CH, 00000020H                         ; 00B0 _ 263180 32 
        dd 000000B8H                                    ; 00B8 _ 184 
        dd CMain-$+6D7H                                 ; 00BC _ 00000793 (rel)
        dd 00000084H, 080E4100H                         ; 00C0 _ 132 135151872 
        dd 0D420285H, 03834405H                         ; 00C8 _ 222429829 58934277 
        dd 0C3C57C02H, 0004040CH                        ; 00D0 _ -1010467838 263180 
        dd 0000001CH, 000000DCH                         ; 00D8 _ 28 220 
        dd CMain-$+737H                                 ; 00E0 _ 00000817 (rel)
        dd 00000191H, 080E4100H                         ; 00E4 _ 401 135151872 
        dd 0D420285H, 018D0305H                         ; 00EC _ 222429829 26018565 
        dd 04040CC5H, 0000001CH                         ; 00F4 _ 67374277 28 
        dd 000000FCH                                    ; 00FC _ 252 
        dd CMain-$+8A8H                                 ; 0100 _ 000009A8 (rel)
        dd 000000DAH, 080E4100H                         ; 0104 _ 218 135151872 
        dd 0D420285H, 0C5D60205H                        ; 010C _ 222429829 -975830523 
        dd 0004040CH, 00000020H                         ; 0114 _ 263180 32 
        dd 0000011CH                                    ; 011C _ 284 
        dd CMain-$+962H                                 ; 0120 _ 00000A82 (rel)
        dd 0000006FH, 080E4100H                         ; 0124 _ 111 135151872 
        dd 0D420285H, 03834405H                         ; 012C _ 222429829 58934277 
        dd 41C36602H, 04040CC5H                         ; 0134 _ 1103324674 67374277 
        dd 0000001CH, 00000140H                         ; 013C _ 28 320 
        dd CMain-$+9ADH                                 ; 0144 _ 00000AF1 (rel)
        dd 0000005FH, 080E4100H                         ; 0148 _ 95 135151872 
        dd 0D420285H, 0C55B0205H                        ; 0150 _ 222429829 -983891451 
        dd 0004040CH, 0000001CH                         ; 0158 _ 263180 28 
        dd 00000160H                                    ; 0160 _ 352 
        dd CMain-$+9ECH                                 ; 0164 _ 00000B50 (rel)
        dd 00000024H, 080E4100H                         ; 0168 _ 36 135151872 
        dd 0D420285H, 0CC56005H                         ; 0170 _ 222429829 214261765 
        dd 00000404H, 0000001CH                         ; 0178 _ 1028 28 
        dd 00000180H                                    ; 0180 _ 384 
        dd CMain-$+9F0H                                 ; 0184 _ 00000B74 (rel)
        dd 00000048H, 080E4100H                         ; 0188 _ 72 135151872 
        dd 0D420285H, 0C5440205H                        ; 0190 _ 222429829 -985398779 
        dd 0004040CH, 0000001CH                         ; 0198 _ 263180 28 
        dd 000001A0H                                    ; 01A0 _ 416 
        dd CMain-$+0A18H                                ; 01A4 _ 00000BBC (rel)
        dd 0000007DH, 080E4100H                         ; 01A8 _ 125 135151872 
        dd 0D420285H, 0C5790205H                        ; 01B0 _ 222429829 -981925371 
        dd 0004040CH, 0000001CH                         ; 01B8 _ 263180 28 
        dd 000001C0H                                    ; 01C0 _ 448 
        dd ?_035-$+1C4H                                 ; 01C4 _ 00000C39 (rel)
        dd 00000020H, 080E4100H                         ; 01C8 _ 32 135151872 
        dd 0D420285H, 0CC55C05H                         ; 01D0 _ 222429829 214260741 
        dd 00000404H, 0000001CH                         ; 01D8 _ 1028 28 
        dd 000001E0H                                    ; 01E0 _ 480 
        dd ?_035-$+1E4H                                 ; 01E4 _ 00000C59 (rel)
        dd 00000031H, 080E4100H                         ; 01E8 _ 49 135151872 
        dd 0D420285H, 0CC56D05H                         ; 01F0 _ 222429829 214265093 
        dd 00000404H, 0000001CH                         ; 01F8 _ 1028 28 
        dd 00000200H                                    ; 0200 _ 512 
        dd CMain-$+0A86H                                ; 0204 _ 00000C8A (rel)
        dd 0000003EH, 080E4100H                         ; 0208 _ 62 135151872 
        dd 0D420285H, 0CC57A05H                         ; 0210 _ 222429829 214268421 
        dd 00000404H, 0000001CH                         ; 0218 _ 1028 28 
        dd 00000220H                                    ; 0220 _ 544 
        dd CMain-$+0AA4H                                ; 0224 _ 00000CC8 (rel)
        dd 0000004FH, 080E4100H                         ; 0228 _ 79 135151872 
        dd 0D420285H, 0C54B0205H                        ; 0230 _ 222429829 -984940027 
        dd 0004040CH, 0000001CH                         ; 0238 _ 263180 28 
        dd 00000240H                                    ; 0240 _ 576 
        dd CMain-$+0AD3H                                ; 0244 _ 00000D17 (rel)
        dd 0000013FH, 080E4100H                         ; 0248 _ 319 135151872 
        dd 0D420285H, 013B0305H                         ; 0250 _ 222429829 20644613 
        dd 04040CC5H, 0000001CH                         ; 0258 _ 67374277 28 
        dd 00000260H                                    ; 0260 _ 608 
        dd CMain-$+0BF2H                                ; 0264 _ 00000E56 (rel)
        dd 00000109H, 080E4100H                         ; 0268 _ 265 135151872 
        dd 0D420285H, 01050305H                         ; 0270 _ 222429829 17105669 
        dd 04040CC5H, 0000001CH                         ; 0278 _ 67374277 28 
        dd 00000280H                                    ; 0280 _ 640 
        dd CMain-$+0CDBH                                ; 0284 _ 00000F5F (rel)
        dd 00000078H, 080E4100H                         ; 0288 _ 120 135151872 
        dd 0D420285H, 0C5740205H                        ; 0290 _ 222429829 -982253051 
        dd 0004040CH, 0000001CH                         ; 0298 _ 263180 28 
        dd 000002A0H                                    ; 02A0 _ 672 
        dd CMain-$+0D33H                                ; 02A4 _ 00000FD7 (rel)
        dd 00000266H, 080E4100H                         ; 02A8 _ 614 135151872 
        dd 0D420285H, 02620305H                         ; 02B0 _ 222429829 39977733 
        dd 04040CC5H, 00000020H                         ; 02B8 _ 67374277 32 
        dd 000002C0H                                    ; 02C0 _ 704 
        dd CMain-$+0F79H                                ; 02C4 _ 0000123D (rel)
        dd 0000021DH, 080E4100H                         ; 02C8 _ 541 135151872 
        dd 0D420285H, 03834105H                         ; 02D0 _ 222429829 58933509 
        dd 0C5021803H, 04040CC3H                        ; 02D8 _ -989718525 67374275 
        dd 00000020H, 000002E4H                         ; 02E0 _ 32 740 
        dd CMain-$+1172H                                ; 02E8 _ 0000145A (rel)
        dd 0000023FH, 080E4100H                         ; 02EC _ 575 135151872 
        dd 0D420285H, 03834405H                         ; 02F4 _ 222429829 58934277 
        dd 0C5023703H, 04040CC3H                        ; 02FC _ -989710589 67374275 
        dd 0000001CH, 00000308H                         ; 0304 _ 28 776 
        dd CMain-$+138DH                                ; 030C _ 00001699 (rel)
        dd 000000C0H, 080E4100H                         ; 0310 _ 192 135151872 
        dd 0D420285H, 0C5BC0205H                        ; 0318 _ 222429829 -977534459 
        dd 0004040CH, 0000001CH                         ; 0320 _ 263180 28 
        dd 00000328H                                    ; 0328 _ 808 
        dd CMain-$+142DH                                ; 032C _ 00001759 (rel)
        dd 000000C5H, 080E4100H                         ; 0330 _ 197 135151872 
        dd 0D420285H, 0C5C10205H                        ; 0338 _ 222429829 -977206779 
        dd 0004040CH, 00000014H                         ; 0340 _ 263180 20 
        dd 00000000H, 00527A01H                         ; 0348 _ 0 5405185 
        dd 01087C01H, 04040C1BH                         ; 0350 _ 17333249 67374107 
        dd 00000188H, 0000001CH                         ; 0358 _ 392 28 
        dd 0000001CH                                    ; 0360 _ 28 
        dd CMain-$+14BAH                                ; 0364 _ 0000181E (rel)
        dd 0000002DH, 080E4100H                         ; 0368 _ 45 135151872 
        dd 0D420285H, 0CC56905H                         ; 0370 _ 222429829 214264069 
        dd 00000404H, 0000001CH                         ; 0378 _ 1028 28 
        dd 0000003CH                                    ; 0380 _ 60 
        dd CMain-$+14C7H                                ; 0384 _ 0000184B (rel)
        dd 00000039H, 080E4100H                         ; 0388 _ 57 135151872 
        dd 0D420285H, 0CC57505H                         ; 0390 _ 222429829 214267141 
        dd 00000404H, 0000001CH                         ; 0398 _ 1028 28 
        dd 0000005CH                                    ; 03A0 _ 92 
        dd CMain-$+14E0H                                ; 03A4 _ 00001884 (rel)
        dd 000000ACH, 080E4100H                         ; 03A8 _ 172 135151872 
        dd 0D420285H, 0C5A80205H                        ; 03B0 _ 222429829 -978845179 
        dd 0004040CH, 00000024H                         ; 03B8 _ 263180 36 
        dd 0000007CH                                    ; 03C0 _ 124 
        dd CMain-$+156CH                                ; 03C4 _ 00001930 (rel)
        dd 00000216H, 080E4100H                         ; 03C8 _ 534 135151872 
        dd 0D420285H, 03834405H                         ; 03D0 _ 222429829 58934277 
        dd 0C3020D03H, 040CC541H                        ; 03D8 _ -1023275773 67945793 
        dd 00000004H, 0000001CH                         ; 03E0 _ 4 28 
        dd 000000A4H                                    ; 03E8 _ 164 
        dd CMain-$+175AH                                ; 03EC _ 00001B46 (rel)
        dd 0000002CH, 080E4100H                         ; 03F0 _ 44 135151872 
        dd 0D420285H, 0CC56805H                         ; 03F8 _ 222429829 214263813 
        dd 00000404H, 0000001CH                         ; 0400 _ 1028 28 
        dd 000000C4H                                    ; 0408 _ 196 
        dd CMain-$+1766H                                ; 040C _ 00001B72 (rel)
        dd 0000002FH, 080E4100H                         ; 0410 _ 47 135151872 
        dd 0D420285H, 0CC56B05H                         ; 0418 _ 222429829 214264581 
        dd 00000404H, 00000014H                         ; 0420 _ 1028 20 
        dd 00000000H, 00527A01H                         ; 0428 _ 0 5405185 
        dd 01087C01H, 04040C1BH                         ; 0430 _ 17333249 67374107 
        dd 00000188H, 0000001CH                         ; 0438 _ 392 28 
        dd 0000001CH                                    ; 0440 _ 28 
        dd CMain-$+175DH                                ; 0444 _ 00001BA1 (rel)
        dd 000000C8H, 080E4100H                         ; 0448 _ 200 135151872 
        dd 0D420285H, 0C5C40205H                        ; 0450 _ 222429829 -977010171 
        dd 0004040CH, 0000001CH                         ; 0458 _ 263180 28 
        dd 0000003CH                                    ; 0460 _ 60 
        dd CMain-$+1805H                                ; 0464 _ 00001C69 (rel)
        dd 0000007AH, 080E4100H                         ; 0468 _ 122 135151872 
        dd 0D420285H, 0C5760205H                        ; 0470 _ 222429829 -982121979 
        dd 0004040CH, 0000001CH                         ; 0478 _ 263180 28 
        dd 0000005CH                                    ; 0480 _ 92 
        dd CMain-$+185FH                                ; 0484 _ 00001CE3 (rel)
        dd 00000029H, 080E4100H                         ; 0488 _ 41 135151872 
        dd 0D420285H, 0CC56505H                         ; 0490 _ 222429829 214263045 
        dd 00000404H, 00000028H                         ; 0498 _ 1028 40 
        dd 0000007CH                                    ; 04A0 _ 124 
        dd CMain-$+1868H                                ; 04A4 _ 00001D0C (rel)
        dd 00000376H, 080E4100H                         ; 04A8 _ 886 135151872 
        dd 0D420285H, 03864505H                         ; 04B0 _ 222429829 59131141 
        dd 6B030483H, 0C641C303H                        ; 04B8 _ 1795359875 -968768765 
        dd 040CC541H, 00000004H                         ; 04C0 _ 67945793 4 
        dd 00000028H, 000000A8H                         ; 04C8 _ 40 168 
        dd CMain-$+1BB2H                                ; 04D0 _ 00002082 (rel)
        dd 00000067H, 080E4100H                         ; 04D4 _ 103 135151872 
        dd 0D420285H, 03874605H                         ; 04DC _ 222429829 59196933 
        dd 05830486H, 41C35A02H                         ; 04E4 _ 92472454 1103321602 
        dd 41C741C6H, 04040CC5H                         ; 04EC _ 1103577542 67374277 
        dd 00000020H, 000000D4H                         ; 04F4 _ 32 212 
        dd CMain-$+1BEDH                                ; 04FC _ 000020E9 (rel)
        dd 000000EDH, 080E4100H                         ; 0500 _ 237 135151872 
        dd 0D420285H, 03834405H                         ; 0508 _ 222429829 58934277 
        dd 0C3C5E502H, 0004040CH                        ; 0510 _ -1010440958 263180 
        dd 00000020H, 000000F8H                         ; 0518 _ 32 248 
        dd CMain-$+1CB6H                                ; 0520 _ 000021D6 (rel)
        dd 00000101H, 080E4100H                         ; 0524 _ 257 135151872 
        dd 0D420285H, 03834405H                         ; 052C _ 222429829 58934277 
        dd 0C3C5F902H, 0004040CH                        ; 0534 _ -1010435838 263180 
        dd 0000001CH, 0000011CH                         ; 053C _ 28 284 
        dd CMain-$+1D93H                                ; 0544 _ 000022D7 (rel)
        dd 0000014CH, 080E4100H                         ; 0548 _ 332 135151872 
        dd 0D420285H, 01480305H                         ; 0550 _ 222429829 21496581 
        dd 04040CC5H, 0000001CH                         ; 0558 _ 67374277 28 
        dd 0000013CH                                    ; 0560 _ 316 
        dd CMain-$+1EBFH                                ; 0564 _ 00002423 (rel)
        dd 000001AEH, 080E4100H                         ; 0568 _ 430 135151872 
        dd 0D420285H, 01AA0305H                         ; 0570 _ 222429829 27919109 
        dd 04040CC5H, 00000014H                         ; 0578 _ 67374277 20 
        dd 00000000H, 00527A01H                         ; 0580 _ 0 5405185 
        dd 01087C01H, 04040C1BH                         ; 0588 _ 17333249 67374107 
        dd 00000188H, 0000001CH                         ; 0590 _ 392 28 
        dd 0000001CH                                    ; 0598 _ 28 
        dd CMain-$+2035H                                ; 059C _ 000025D1 (rel)
        dd 00000091H, 080E4100H                         ; 05A0 _ 145 135151872 
        dd 0D420285H, 0C58D0205H                        ; 05A8 _ 222429829 -980614651 
        dd 0004040CH, 0000001CH                         ; 05B0 _ 263180 28 
        dd 0000003CH                                    ; 05B8 _ 60 
        dd CMain-$+20A6H                                ; 05BC _ 00002662 (rel)
        dd 0000005DH, 080E4100H                         ; 05C0 _ 93 135151872 
        dd 0D420285H, 0C5590205H                        ; 05C8 _ 222429829 -984022523 
        dd 0004040CH, 0000001CH                         ; 05D0 _ 263180 28 
        dd 0000005CH                                    ; 05D8 _ 92 
        dd CMain-$+20E3H                                ; 05DC _ 000026BF (rel)
        dd 0000000FH, 080E4100H                         ; 05E0 _ 15 135151872 
        dd 0D420285H, 0CC54B05H                         ; 05E8 _ 222429829 214256389 
        dd 00000404H, 0000001CH                         ; 05F0 _ 1028 28 
        dd 0000007CH                                    ; 05F8 _ 124 
        dd CMain-$+20D2H                                ; 05FC _ 000026CE (rel)
        dd 00000022H, 080E4100H                         ; 0600 _ 34 135151872 
        dd 0D420285H, 0CC55E05H                         ; 0608 _ 222429829 214261253 
        dd 00000404H, 0000001CH                         ; 0610 _ 1028 28 
        dd 0000009CH                                    ; 0618 _ 156 
        dd CMain-$+20D4H                                ; 061C _ 000026F0 (rel)
        dd 00000019H, 080E4100H                         ; 0620 _ 25 135151872 
        dd 0D420285H, 0CC55505H                         ; 0628 _ 222429829 214258949 
        dd 00000404H, 0000001CH                         ; 0630 _ 1028 28 
        dd 000000BCH                                    ; 0638 _ 188 
        dd CMain-$+20CDH                                ; 063C _ 00002709 (rel)
        dd 00000018H, 080E4100H                         ; 0640 _ 24 135151872 
        dd 0D420285H, 0CC55405H                         ; 0648 _ 222429829 214258693 
        dd 00000404H, 00000014H                         ; 0650 _ 1028 20 
        dd 00000000H, 00527A01H                         ; 0658 _ 0 5405185 
        dd 01087C01H, 04040C1BH                         ; 0660 _ 17333249 67374107 
        dd 00000188H, 0000001CH                         ; 0668 _ 392 28 
        dd 0000001CH                                    ; 0670 _ 28 
        dd CMain-$+20ADH                                ; 0674 _ 00002721 (rel)
        dd 0000003EH, 080E4100H                         ; 0678 _ 62 135151872 
        dd 0D420285H, 0CC57A05H                         ; 0680 _ 222429829 214268421 
        dd 00000404H, 0000001CH                         ; 0688 _ 1028 28 
        dd 0000003CH                                    ; 0690 _ 60 
        dd CMain-$+20CBH                                ; 0694 _ 0000275F (rel)
        dd 00000080H, 080E4100H                         ; 0698 _ 128 135151872 
        dd 0D420285H, 0C57C0205H                        ; 06A0 _ 222429829 -981728763 
        dd 0004040CH, 0000001CH                         ; 06A8 _ 263180 28 
        dd 0000005CH                                    ; 06B0 _ 92 
        dd CMain-$+212BH                                ; 06B4 _ 000027DF (rel)
        dd 00000070H, 080E4100H                         ; 06B8 _ 112 135151872 
        dd 0D420285H, 0C56C0205H                        ; 06C0 _ 222429829 -982777339 
        dd 0004040CH, 0000001CH                         ; 06C8 _ 263180 28 
        dd 0000007CH                                    ; 06D0 _ 124 
        dd CMain-$+217BH                                ; 06D4 _ 0000284F (rel)
        dd 00000015H, 080E4100H                         ; 06D8 _ 21 135151872 
        dd 0D420285H, 0CC55105H                         ; 06E0 _ 222429829 214257925 
        dd 00000404H                                    ; 06E8 _ 1028 


SECTION .data   align=32 noexecute                      ; section number 4, data

keyval:                                                 ; byte
        db 30H, 78H                                     ; 0000 _ 0x

?_169:  db 00H                                          ; 0002 _ .

?_170:  db 00H, 00H, 00H, 00H, 00H                      ; 0003 _ .....

memman: dd 00100000H, 00000000H                         ; 0008 _ 1048576 0 
        dd 00000000H, 00000000H                         ; 0010 _ 0 0 
        dd 00000000H, 00000000H                         ; 0018 _ 0 0 

keytable:                                               ; byte
        db 00H, 00H, 31H, 32H, 33H, 34H, 35H, 36H       ; 0020 _ ..123456
        db 37H, 38H, 39H, 30H, 2DH, 5EH, 00H, 00H       ; 0028 _ 7890-^..
        db 51H, 57H, 45H, 52H, 54H, 59H, 55H, 49H       ; 0030 _ QWERTYUI
        db 4FH, 50H, 40H, 5BH, 00H, 00H, 41H, 53H       ; 0038 _ OP@[..AS
        db 44H, 46H, 47H, 48H, 4AH, 4BH, 4CH, 3BH       ; 0040 _ DFGHJKL;
        db 3AH, 00H, 00H, 5DH, 5AH, 58H, 43H, 56H       ; 0048 _ :..]ZXCV
        db 42H, 4EH, 4DH, 2CH, 2EH, 2FH, 00H, 2AH       ; 0050 _ BNM,./.*
        db 00H, 20H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0058 _ . ......
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 37H       ; 0060 _ .......7
        db 38H, 39H, 2DH, 34H, 35H, 36H, 2BH, 31H       ; 0068 _ 89-456+1
        db 32H, 33H, 30H, 2EH, 00H, 00H, 00H, 00H       ; 0070 _ 230.....
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0078 _ ........

table_rgb.1750:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 00H, 0FFH     ; 0080 _ ........
        db 00H, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH   ; 0088 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0090 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0098 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 00A0 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 00A8 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00B0 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00B8 _ ........

cursor.1807:                                            ; byte
        db 2AH, 2AH, 2AH, 2AH, 2AH, 2AH, 2AH, 2AH       ; 00C0 _ ********
        db 2AH, 2AH, 2AH, 2AH, 2AH, 2AH, 2EH, 2EH       ; 00C8 _ ******..
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 00D0 _ *OOOOOOO
        db 4FH, 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH       ; 00D8 _ OOOO*...
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 00E0 _ *OOOOOOO
        db 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH       ; 00E8 _ OOO*....
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 00F0 _ *OOOOOOO
        db 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 00F8 _ OO*.....
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 0100 _ *OOOOOOO
        db 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0108 _ O*......
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 0110 _ *OOOOOOO
        db 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0118 _ *.......
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 0120 _ *OOOOOOO
        db 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0128 _ *.......
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 0130 _ *OOOOOOO
        db 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0138 _ O*......
        db 2AH, 4FH, 4FH, 4FH, 4FH, 2AH, 2AH, 4FH       ; 0140 _ *OOOO**O
        db 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0148 _ OO*.....
        db 2AH, 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2AH       ; 0150 _ *OOO*..*
        db 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH       ; 0158 _ OOO*....
        db 2AH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH       ; 0160 _ *OO*....
        db 2AH, 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH       ; 0168 _ *OOO*...
        db 2AH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0170 _ *O*.....
        db 2EH, 2AH, 4FH, 4FH, 4FH, 2AH, 2EH, 2EH       ; 0178 _ .*OOO*..
        db 2AH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0180 _ **......
        db 2EH, 2EH, 2AH, 4FH, 4FH, 4FH, 2AH, 2EH       ; 0188 _ ..*OOO*.
        db 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0190 _ *.......
        db 2EH, 2EH, 2EH, 2AH, 4FH, 4FH, 4FH, 2AH       ; 0198 _ ...*OOO*
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 01A0 _ ........
        db 2EH, 2EH, 2EH, 2EH, 2AH, 4FH, 4FH, 2AH       ; 01A8 _ ....*OO*
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 01B0 _ ........
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2AH, 2AH, 2AH       ; 01B8 _ .....***

closebtn.1922:                                          ; byte
        db 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 01C0 _ OOOOOOOO
        db 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 40H       ; 01C8 _ OOOOOOO@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 51H       ; 01D0 _ OQQQQQQQ
        db 51H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 01D8 _ QQQQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 51H       ; 01E0 _ OQQQQQQQ
        db 51H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 01E8 _ QQQQQQ$@
        db 4FH, 51H, 51H, 51H, 40H, 40H, 51H, 51H       ; 01F0 _ OQQQ@@QQ
        db 51H, 51H, 40H, 40H, 51H, 51H, 24H, 40H       ; 01F8 _ QQ@@QQ$@
        db 4FH, 51H, 51H, 51H, 51H, 40H, 40H, 51H       ; 0200 _ OQQQQ@@Q
        db 51H, 40H, 40H, 51H, 51H, 51H, 24H, 40H       ; 0208 _ Q@@QQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 40H, 40H       ; 0210 _ OQQQQQ@@
        db 40H, 40H, 51H, 51H, 51H, 51H, 24H, 40H       ; 0218 _ @@QQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 40H       ; 0220 _ OQQQQQQ@
        db 40H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 0228 _ @QQQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 40H, 40H       ; 0230 _ OQQQQQ@@
        db 40H, 40H, 51H, 51H, 51H, 51H, 24H, 40H       ; 0238 _ @@QQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 40H, 40H, 51H       ; 0240 _ OQQQQ@@Q
        db 51H, 40H, 40H, 51H, 51H, 51H, 24H, 40H       ; 0248 _ Q@@QQQ$@
        db 4FH, 51H, 51H, 51H, 40H, 40H, 51H, 51H       ; 0250 _ OQQQ@@QQ
        db 51H, 51H, 40H, 40H, 51H, 51H, 24H, 40H       ; 0258 _ QQ@@QQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 51H       ; 0260 _ OQQQQQQQ
        db 51H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 0268 _ QQQQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 51H       ; 0270 _ OQQQQQQQ
        db 51H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 0278 _ QQQQQQ$@
        db 4FH, 24H, 24H, 24H, 24H, 24H, 24H, 24H       ; 0280 _ O$$$$$$$
        db 24H, 24H, 24H, 24H, 24H, 24H, 24H, 40H       ; 0288 _ $$$$$$$@
        db 40H, 40H, 40H, 40H, 40H, 40H, 40H, 40H       ; 0290 _ @@@@@@@@
        db 40H, 40H, 40H, 40H, 40H, 40H, 40H, 40H       ; 0298 _ @@@@@@@@


SECTION .bss    align=32 noexecute                      ; section number 5, bss

bootInfo:                                               ; qword
        resb    4                                       ; 0000

?_171:  resw    1                                       ; 0004

?_172:  resw    1                                       ; 0006

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

charData.1741:                                          ; word
        resb    1                                       ; 0278

?_173:  resb    3                                       ; 0279

timerID.1740:                                           ; dword
        resd    1                                       ; 027C

str.1851:                                               ; byte
        resb    1                                       ; 0280

?_174:  resb    9                                       ; 0281

?_175:  resb    1                                       ; 028A


