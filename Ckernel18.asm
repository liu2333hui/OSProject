; Disassembly of file: /home/bobkuo/eclipse-workspace/nasmCode/Ckernel18.o
; Mon Apr 27 21:52:55 2020
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
global eraseMouse: function
global drawMouse: function
global show_mouse_info: function
global showMemoryInfo: function
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
        push    bootInfo                                ; 000A _ 68, 00000100(d)
        call    initBootInfo                            ; 000F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0014 _ 83. C4, 10
        mov     eax, dword [bootInfo]                   ; 0017 _ A1, 00000100(d)
        mov     dword [ebp-34H], eax                    ; 001C _ 89. 45, CC
        movzx   eax, word [?_095]                       ; 001F _ 0F B7. 05, 00000104(d)
        cwde                                            ; 0026 _ 98
        mov     dword [ebp-30H], eax                    ; 0027 _ 89. 45, D0
        movzx   eax, word [?_096]                       ; 002A _ 0F B7. 05, 00000106(d)
        cwde                                            ; 0031 _ 98
        mov     dword [ebp-2CH], eax                    ; 0032 _ 89. 45, D4
        mov     eax, dword [bootInfo]                   ; 0035 _ A1, 00000100(d)
        mov     dword [ebp-28H], eax                    ; 003A _ 89. 45, D8
        call    init_palette                            ; 003D _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-2CH]                    ; 0042 _ 8B. 45, D4
        lea     edx, [eax-1DH]                          ; 0045 _ 8D. 50, E3
        mov     eax, dword [ebp-30H]                    ; 0048 _ 8B. 45, D0
        sub     eax, 1                                  ; 004B _ 83. E8, 01
        sub     esp, 4                                  ; 004E _ 83. EC, 04
        push    edx                                     ; 0051 _ 52
        push    eax                                     ; 0052 _ 50
        push    0                                       ; 0053 _ 6A, 00
        push    0                                       ; 0055 _ 6A, 00
        push    14                                      ; 0057 _ 6A, 0E
        push    dword [ebp-30H]                         ; 0059 _ FF. 75, D0
        push    dword [ebp-34H]                         ; 005C _ FF. 75, CC
        call    boxfill8                                ; 005F _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0064 _ 83. C4, 20
        mov     eax, dword [ebp-2CH]                    ; 0067 _ 8B. 45, D4
        lea     ecx, [eax-1CH]                          ; 006A _ 8D. 48, E4
        mov     eax, dword [ebp-30H]                    ; 006D _ 8B. 45, D0
        lea     edx, [eax-1H]                           ; 0070 _ 8D. 50, FF
        mov     eax, dword [ebp-2CH]                    ; 0073 _ 8B. 45, D4
        sub     eax, 28                                 ; 0076 _ 83. E8, 1C
        sub     esp, 4                                  ; 0079 _ 83. EC, 04
        push    ecx                                     ; 007C _ 51
        push    edx                                     ; 007D _ 52
        push    eax                                     ; 007E _ 50
        push    0                                       ; 007F _ 6A, 00
        push    8                                       ; 0081 _ 6A, 08
        push    dword [ebp-30H]                         ; 0083 _ FF. 75, D0
        push    dword [ebp-34H]                         ; 0086 _ FF. 75, CC
        call    boxfill8                                ; 0089 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 008E _ 83. C4, 20
        mov     eax, dword [ebp-2CH]                    ; 0091 _ 8B. 45, D4
        lea     ecx, [eax-1BH]                          ; 0094 _ 8D. 48, E5
        mov     eax, dword [ebp-30H]                    ; 0097 _ 8B. 45, D0
        lea     edx, [eax-1H]                           ; 009A _ 8D. 50, FF
        mov     eax, dword [ebp-2CH]                    ; 009D _ 8B. 45, D4
        sub     eax, 27                                 ; 00A0 _ 83. E8, 1B
        sub     esp, 4                                  ; 00A3 _ 83. EC, 04
        push    ecx                                     ; 00A6 _ 51
        push    edx                                     ; 00A7 _ 52
        push    eax                                     ; 00A8 _ 50
        push    0                                       ; 00A9 _ 6A, 00
        push    7                                       ; 00AB _ 6A, 07
        push    dword [ebp-30H]                         ; 00AD _ FF. 75, D0
        push    dword [ebp-34H]                         ; 00B0 _ FF. 75, CC
        call    boxfill8                                ; 00B3 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 00B8 _ 83. C4, 20
        mov     eax, dword [ebp-2CH]                    ; 00BB _ 8B. 45, D4
        lea     ecx, [eax-1H]                           ; 00BE _ 8D. 48, FF
        mov     eax, dword [ebp-30H]                    ; 00C1 _ 8B. 45, D0
        lea     edx, [eax-1H]                           ; 00C4 _ 8D. 50, FF
        mov     eax, dword [ebp-2CH]                    ; 00C7 _ 8B. 45, D4
        sub     eax, 26                                 ; 00CA _ 83. E8, 1A
        sub     esp, 4                                  ; 00CD _ 83. EC, 04
        push    ecx                                     ; 00D0 _ 51
        push    edx                                     ; 00D1 _ 52
        push    eax                                     ; 00D2 _ 50
        push    0                                       ; 00D3 _ 6A, 00
        push    8                                       ; 00D5 _ 6A, 08
        push    dword [ebp-30H]                         ; 00D7 _ FF. 75, D0
        push    dword [ebp-34H]                         ; 00DA _ FF. 75, CC
        call    boxfill8                                ; 00DD _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 00E2 _ 83. C4, 20
        mov     eax, dword [ebp-2CH]                    ; 00E5 _ 8B. 45, D4
        lea     edx, [eax-18H]                          ; 00E8 _ 8D. 50, E8
        mov     eax, dword [ebp-2CH]                    ; 00EB _ 8B. 45, D4
        sub     eax, 24                                 ; 00EE _ 83. E8, 18
        sub     esp, 4                                  ; 00F1 _ 83. EC, 04
        push    edx                                     ; 00F4 _ 52
        push    59                                      ; 00F5 _ 6A, 3B
        push    eax                                     ; 00F7 _ 50
        push    3                                       ; 00F8 _ 6A, 03
        push    7                                       ; 00FA _ 6A, 07
        push    dword [ebp-30H]                         ; 00FC _ FF. 75, D0
        push    dword [ebp-34H]                         ; 00FF _ FF. 75, CC
        call    boxfill8                                ; 0102 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0107 _ 83. C4, 20
        mov     eax, dword [ebp-2CH]                    ; 010A _ 8B. 45, D4
        lea     edx, [eax-4H]                           ; 010D _ 8D. 50, FC
        mov     eax, dword [ebp-2CH]                    ; 0110 _ 8B. 45, D4
        sub     eax, 24                                 ; 0113 _ 83. E8, 18
        sub     esp, 4                                  ; 0116 _ 83. EC, 04
        push    edx                                     ; 0119 _ 52
        push    2                                       ; 011A _ 6A, 02
        push    eax                                     ; 011C _ 50
        push    2                                       ; 011D _ 6A, 02
        push    7                                       ; 011F _ 6A, 07
        push    dword [ebp-30H]                         ; 0121 _ FF. 75, D0
        push    dword [ebp-34H]                         ; 0124 _ FF. 75, CC
        call    boxfill8                                ; 0127 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 012C _ 83. C4, 20
        mov     eax, dword [ebp-2CH]                    ; 012F _ 8B. 45, D4
        lea     edx, [eax-4H]                           ; 0132 _ 8D. 50, FC
        mov     eax, dword [ebp-2CH]                    ; 0135 _ 8B. 45, D4
        sub     eax, 4                                  ; 0138 _ 83. E8, 04
        sub     esp, 4                                  ; 013B _ 83. EC, 04
        push    edx                                     ; 013E _ 52
        push    59                                      ; 013F _ 6A, 3B
        push    eax                                     ; 0141 _ 50
        push    3                                       ; 0142 _ 6A, 03
        push    15                                      ; 0144 _ 6A, 0F
        push    dword [ebp-30H]                         ; 0146 _ FF. 75, D0
        push    dword [ebp-34H]                         ; 0149 _ FF. 75, CC
        call    boxfill8                                ; 014C _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0151 _ 83. C4, 20
        mov     eax, dword [ebp-2CH]                    ; 0154 _ 8B. 45, D4
        lea     edx, [eax-5H]                           ; 0157 _ 8D. 50, FB
        mov     eax, dword [ebp-2CH]                    ; 015A _ 8B. 45, D4
        sub     eax, 23                                 ; 015D _ 83. E8, 17
        sub     esp, 4                                  ; 0160 _ 83. EC, 04
        push    edx                                     ; 0163 _ 52
        push    59                                      ; 0164 _ 6A, 3B
        push    eax                                     ; 0166 _ 50
        push    59                                      ; 0167 _ 6A, 3B
        push    15                                      ; 0169 _ 6A, 0F
        push    dword [ebp-30H]                         ; 016B _ FF. 75, D0
        push    dword [ebp-34H]                         ; 016E _ FF. 75, CC
        call    boxfill8                                ; 0171 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0176 _ 83. C4, 20
        mov     eax, dword [ebp-2CH]                    ; 0179 _ 8B. 45, D4
        lea     edx, [eax-3H]                           ; 017C _ 8D. 50, FD
        mov     eax, dword [ebp-2CH]                    ; 017F _ 8B. 45, D4
        sub     eax, 3                                  ; 0182 _ 83. E8, 03
        sub     esp, 4                                  ; 0185 _ 83. EC, 04
        push    edx                                     ; 0188 _ 52
        push    59                                      ; 0189 _ 6A, 3B
        push    eax                                     ; 018B _ 50
        push    2                                       ; 018C _ 6A, 02
        push    0                                       ; 018E _ 6A, 00
        push    dword [ebp-30H]                         ; 0190 _ FF. 75, D0
        push    dword [ebp-34H]                         ; 0193 _ FF. 75, CC
        call    boxfill8                                ; 0196 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 019B _ 83. C4, 20
        mov     eax, dword [ebp-2CH]                    ; 019E _ 8B. 45, D4
        lea     edx, [eax-3H]                           ; 01A1 _ 8D. 50, FD
        mov     eax, dword [ebp-2CH]                    ; 01A4 _ 8B. 45, D4
        sub     eax, 24                                 ; 01A7 _ 83. E8, 18
        sub     esp, 4                                  ; 01AA _ 83. EC, 04
        push    edx                                     ; 01AD _ 52
        push    60                                      ; 01AE _ 6A, 3C
        push    eax                                     ; 01B0 _ 50
        push    60                                      ; 01B1 _ 6A, 3C
        push    0                                       ; 01B3 _ 6A, 00
        push    dword [ebp-30H]                         ; 01B5 _ FF. 75, D0
        push    dword [ebp-34H]                         ; 01B8 _ FF. 75, CC
        call    boxfill8                                ; 01BB _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 01C0 _ 83. C4, 20
        mov     eax, dword [ebp-2CH]                    ; 01C3 _ 8B. 45, D4
        lea     ebx, [eax-3H]                           ; 01C6 _ 8D. 58, FD
        mov     eax, dword [ebp-30H]                    ; 01C9 _ 8B. 45, D0
        lea     ecx, [eax-4H]                           ; 01CC _ 8D. 48, FC
        mov     eax, dword [ebp-2CH]                    ; 01CF _ 8B. 45, D4
        lea     edx, [eax-3H]                           ; 01D2 _ 8D. 50, FD
        mov     eax, dword [ebp-30H]                    ; 01D5 _ 8B. 45, D0
        sub     eax, 47                                 ; 01D8 _ 83. E8, 2F
        sub     esp, 4                                  ; 01DB _ 83. EC, 04
        push    ebx                                     ; 01DE _ 53
        push    ecx                                     ; 01DF _ 51
        push    edx                                     ; 01E0 _ 52
        push    eax                                     ; 01E1 _ 50
        push    7                                       ; 01E2 _ 6A, 07
        push    dword [ebp-30H]                         ; 01E4 _ FF. 75, D0
        push    dword [ebp-34H]                         ; 01E7 _ FF. 75, CC
        call    boxfill8                                ; 01EA _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 01EF _ 83. C4, 20
        mov     eax, dword [ebp-2CH]                    ; 01F2 _ 8B. 45, D4
        lea     ebx, [eax-4H]                           ; 01F5 _ 8D. 58, FC
        mov     eax, dword [ebp-30H]                    ; 01F8 _ 8B. 45, D0
        lea     ecx, [eax-3H]                           ; 01FB _ 8D. 48, FD
        mov     eax, dword [ebp-2CH]                    ; 01FE _ 8B. 45, D4
        lea     edx, [eax-18H]                          ; 0201 _ 8D. 50, E8
        mov     eax, dword [ebp-30H]                    ; 0204 _ 8B. 45, D0
        sub     eax, 3                                  ; 0207 _ 83. E8, 03
        sub     esp, 4                                  ; 020A _ 83. EC, 04
        push    ebx                                     ; 020D _ 53
        push    ecx                                     ; 020E _ 51
        push    edx                                     ; 020F _ 52
        push    eax                                     ; 0210 _ 50
        push    7                                       ; 0211 _ 6A, 07
        push    dword [ebp-30H]                         ; 0213 _ FF. 75, D0
        push    dword [ebp-34H]                         ; 0216 _ FF. 75, CC
        call    boxfill8                                ; 0219 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 021E _ 83. C4, 20
        mov     eax, dword [ebp-2CH]                    ; 0221 _ 8B. 45, D4
        lea     ebx, [eax-18H]                          ; 0224 _ 8D. 58, E8
        mov     eax, dword [ebp-30H]                    ; 0227 _ 8B. 45, D0
        lea     ecx, [eax-4H]                           ; 022A _ 8D. 48, FC
        mov     eax, dword [ebp-2CH]                    ; 022D _ 8B. 45, D4
        lea     edx, [eax-18H]                          ; 0230 _ 8D. 50, E8
        mov     eax, dword [ebp-30H]                    ; 0233 _ 8B. 45, D0
        sub     eax, 47                                 ; 0236 _ 83. E8, 2F
        sub     esp, 4                                  ; 0239 _ 83. EC, 04
        push    ebx                                     ; 023C _ 53
        push    ecx                                     ; 023D _ 51
        push    edx                                     ; 023E _ 52
        push    eax                                     ; 023F _ 50
        push    15                                      ; 0240 _ 6A, 0F
        push    dword [ebp-30H]                         ; 0242 _ FF. 75, D0
        push    dword [ebp-34H]                         ; 0245 _ FF. 75, CC
        call    boxfill8                                ; 0248 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 024D _ 83. C4, 20
        mov     eax, dword [ebp-2CH]                    ; 0250 _ 8B. 45, D4
        lea     ebx, [eax-4H]                           ; 0253 _ 8D. 58, FC
        mov     eax, dword [ebp-30H]                    ; 0256 _ 8B. 45, D0
        lea     ecx, [eax-2FH]                          ; 0259 _ 8D. 48, D1
        mov     eax, dword [ebp-2CH]                    ; 025C _ 8B. 45, D4
        lea     edx, [eax-17H]                          ; 025F _ 8D. 50, E9
        mov     eax, dword [ebp-30H]                    ; 0262 _ 8B. 45, D0
        sub     eax, 47                                 ; 0265 _ 83. E8, 2F
        sub     esp, 4                                  ; 0268 _ 83. EC, 04
        push    ebx                                     ; 026B _ 53
        push    ecx                                     ; 026C _ 51
        push    edx                                     ; 026D _ 52
        push    eax                                     ; 026E _ 50
        push    15                                      ; 026F _ 6A, 0F
        push    dword [ebp-30H]                         ; 0271 _ FF. 75, D0
        push    dword [ebp-34H]                         ; 0274 _ FF. 75, CC
        call    boxfill8                                ; 0277 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 027C _ 83. C4, 20
        call    get_memory_block_count                  ; 027F _ E8, FFFFFFFC(rel)
        mov     dword [ebp-24H], eax                    ; 0284 _ 89. 45, DC
        mov     eax, dword [ebp-24H]                    ; 0287 _ 8B. 45, DC
        sub     esp, 12                                 ; 028A _ 83. EC, 0C
        push    eax                                     ; 028D _ 50
        call    intToHexStr                             ; 028E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0293 _ 83. C4, 10
        mov     dword [ebp-20H], eax                    ; 0296 _ 89. 45, E0
        sub     esp, 8                                  ; 0299 _ 83. EC, 08
        push    dword [ebp-20H]                         ; 029C _ FF. 75, E0
        push    7                                       ; 029F _ 6A, 07
        push    40                                      ; 02A1 _ 6A, 28
        push    48                                      ; 02A3 _ 6A, 30
        push    dword [ebp-30H]                         ; 02A5 _ FF. 75, D0
        push    dword [ebp-34H]                         ; 02A8 _ FF. 75, CC
        call    showString                              ; 02AB _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 02B0 _ 83. C4, 20
        mov     eax, dword [ebp-30H]                    ; 02B3 _ 8B. 45, D0
        sub     eax, 16                                 ; 02B6 _ 83. E8, 10
        mov     edx, eax                                ; 02B9 _ 89. C2
        shr     edx, 31                                 ; 02BB _ C1. EA, 1F
        add     eax, edx                                ; 02BE _ 01. D0
        sar     eax, 1                                  ; 02C0 _ D1. F8
        mov     dword [mx], eax                         ; 02C2 _ A3, 000001F0(d)
        mov     eax, dword [ebp-2CH]                    ; 02C7 _ 8B. 45, D4
        sub     eax, 44                                 ; 02CA _ 83. E8, 2C
        mov     edx, eax                                ; 02CD _ 89. C2
        shr     edx, 31                                 ; 02CF _ C1. EA, 1F
        add     eax, edx                                ; 02D2 _ 01. D0
        sar     eax, 1                                  ; 02D4 _ D1. F8
        mov     dword [mx], eax                         ; 02D6 _ A3, 000001F0(d)
        sub     esp, 8                                  ; 02DB _ 83. EC, 08
        push    14                                      ; 02DE _ 6A, 0E
        push    mcursor                                 ; 02E0 _ 68, 00000000(d)
        call    init_mouse_cursor                       ; 02E5 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 02EA _ 83. C4, 10
        mov     edx, dword [my]                         ; 02ED _ 8B. 15, 000001F4(d)
        mov     eax, dword [mx]                         ; 02F3 _ A1, 000001F0(d)
        push    16                                      ; 02F8 _ 6A, 10
        push    mcursor                                 ; 02FA _ 68, 00000000(d)
        push    edx                                     ; 02FF _ 52
        push    eax                                     ; 0300 _ 50
        push    16                                      ; 0301 _ 6A, 10
        push    16                                      ; 0303 _ 6A, 10
        push    dword [ebp-30H]                         ; 0305 _ FF. 75, D0
        push    dword [ebp-34H]                         ; 0308 _ FF. 75, CC
        call    putblock                                ; 030B _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0310 _ 83. C4, 20
        sub     esp, 4                                  ; 0313 _ 83. EC, 04
        push    mousebuf                                ; 0316 _ 68, 00000140(d)
        push    128                                     ; 031B _ 68, 00000080
        push    mouseinfo                               ; 0320 _ 68, 00000108(d)
        call    fifo8_init                              ; 0325 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 032A _ 83. C4, 10
        sub     esp, 4                                  ; 032D _ 83. EC, 04
        push    keybuf                                  ; 0330 _ 68, 000001C0(d)
        push    32                                      ; 0335 _ 6A, 20
        push    keyinfo                                 ; 0337 _ 68, 00000120(d)
        call    fifo8_init                              ; 033C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0341 _ 83. C4, 10
        call    init_keyboard                           ; 0344 _ E8, FFFFFFFC(rel)
        call    enable_mouse                            ; 0349 _ E8, FFFFFFFC(rel)
        call    get_adr_buffer                          ; 034E _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 0353 _ 89. 45, E4
        mov     eax, dword [memman]                     ; 0356 _ A1, 00000000(d)
        sub     esp, 12                                 ; 035B _ 83. EC, 0C
        push    eax                                     ; 035E _ 50
        call    memman_init                             ; 035F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0364 _ 83. C4, 10
        mov     eax, dword [memman]                     ; 0367 _ A1, 00000000(d)
        sub     esp, 4                                  ; 036C _ 83. EC, 04
        push    534609920                               ; 036F _ 68, 1FDD8000
        push    1081344                                 ; 0374 _ 68, 00108000
        push    eax                                     ; 0379 _ 50
        call    memman_free                             ; 037A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 037F _ 83. C4, 10
        mov     eax, dword [memman]                     ; 0382 _ A1, 00000000(d)
        sub     esp, 12                                 ; 0387 _ 83. EC, 0C
        push    eax                                     ; 038A _ 50
        call    memman_total                            ; 038B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0390 _ 83. C4, 10
        shr     eax, 20                                 ; 0393 _ C1. E8, 14
        mov     dword [ebp-18H], eax                    ; 0396 _ 89. 45, E8
        mov     eax, dword [ebp-18H]                    ; 0399 _ 8B. 45, E8
        sub     esp, 12                                 ; 039C _ 83. EC, 0C
        push    eax                                     ; 039F _ 50
        call    intToHexStr                             ; 03A0 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03A5 _ 83. C4, 10
        mov     dword [ebp-14H], eax                    ; 03A8 _ 89. 45, EC
        sub     esp, 8                                  ; 03AB _ 83. EC, 08
        push    ?_085                                   ; 03AE _ 68, 00000000(d)
        push    7                                       ; 03B3 _ 6A, 07
        push    0                                       ; 03B5 _ 6A, 00
        push    0                                       ; 03B7 _ 6A, 00
        push    dword [ebp-30H]                         ; 03B9 _ FF. 75, D0
        push    dword [ebp-34H]                         ; 03BC _ FF. 75, CC
        call    showString                              ; 03BF _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 03C4 _ 83. C4, 20
        sub     esp, 8                                  ; 03C7 _ 83. EC, 08
        push    dword [ebp-14H]                         ; 03CA _ FF. 75, EC
        push    7                                       ; 03CD _ 6A, 07
        push    0                                       ; 03CF _ 6A, 00
        push    136                                     ; 03D1 _ 68, 00000088
        push    dword [ebp-30H]                         ; 03D6 _ FF. 75, D0
        push    dword [ebp-34H]                         ; 03D9 _ FF. 75, CC
        call    showString                              ; 03DC _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 03E1 _ 83. C4, 20
        sub     esp, 8                                  ; 03E4 _ 83. EC, 08
        push    ?_086                                   ; 03E7 _ 68, 0000000F(d)
        push    7                                       ; 03EC _ 6A, 07
        push    0                                       ; 03EE _ 6A, 00
        push    224                                     ; 03F0 _ 68, 000000E0
        push    dword [ebp-30H]                         ; 03F5 _ FF. 75, D0
        push    dword [ebp-34H]                         ; 03F8 _ FF. 75, CC
        call    showString                              ; 03FB _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0400 _ 83. C4, 20
        call    io_sti                                  ; 0403 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], 0                      ; 0408 _ C7. 45, F0, 00000000
        mov     dword [ebp-38H], 0                      ; 040F _ C7. 45, C8, 00000000
?_001:  sub     esp, 12                                 ; 0416 _ 83. EC, 0C
        push    keyinfo                                 ; 0419 _ 68, 00000120(d)
        call    fifo8_status                            ; 041E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0423 _ 83. C4, 10
        mov     ebx, eax                                ; 0426 _ 89. C3
        sub     esp, 12                                 ; 0428 _ 83. EC, 0C
        push    mouseinfo                               ; 042B _ 68, 00000108(d)
        call    fifo8_status                            ; 0430 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0435 _ 83. C4, 10
        add     eax, ebx                                ; 0438 _ 01. D8
        test    eax, eax                                ; 043A _ 85. C0
        jnz     ?_002                                   ; 043C _ 75, 07
        call    io_hlt                                  ; 043E _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 0443 _ EB, D1
; CMain End of function

?_002:  ; Local function
        sub     esp, 12                                 ; 0445 _ 83. EC, 0C
        push    keyinfo                                 ; 0448 _ 68, 00000120(d)
        call    fifo8_status                            ; 044D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0452 _ 83. C4, 10
        test    eax, eax                                ; 0455 _ 85. C0
        jz      ?_004                                   ; 0457 _ 74, 7E
        sub     esp, 12                                 ; 0459 _ 83. EC, 0C
        push    keyinfo                                 ; 045C _ 68, 00000120(d)
        call    fifo8_get                               ; 0461 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0466 _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 0469 _ 89. 45, F0
        cmp     dword [ebp-10H], 28                     ; 046C _ 83. 7D, F0, 1C
        jnz     ?_003                                   ; 0470 _ 75, 3E
        mov     edx, dword [ebp-38H]                    ; 0472 _ 8B. 55, C8
        mov     eax, edx                                ; 0475 _ 89. D0
        shl     eax, 2                                  ; 0477 _ C1. E0, 02
        add     eax, edx                                ; 047A _ 01. D0
        shl     eax, 2                                  ; 047C _ C1. E0, 02
        mov     edx, eax                                ; 047F _ 89. C2
        mov     eax, dword [ebp-1CH]                    ; 0481 _ 8B. 45, E4
        add     eax, edx                                ; 0484 _ 01. D0
        sub     esp, 12                                 ; 0486 _ 83. EC, 0C
        push    7                                       ; 0489 _ 6A, 07
        push    dword [ebp-30H]                         ; 048B _ FF. 75, D0
        push    dword [ebp-38H]                         ; 048E _ FF. 75, C8
        push    dword [ebp-34H]                         ; 0491 _ FF. 75, CC
        push    eax                                     ; 0494 _ 50
        call    showMemoryInfo                          ; 0495 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 049A _ 83. C4, 20
        add     dword [ebp-38H], 1                      ; 049D _ 83. 45, C8, 01
        mov     eax, dword [ebp-38H]                    ; 04A1 _ 8B. 45, C8
        cmp     eax, dword [ebp-24H]                    ; 04A4 _ 3B. 45, DC
        jle     ?_003                                   ; 04A7 _ 7E, 07
        mov     dword [ebp-38H], 0                      ; 04A9 _ C7. 45, C8, 00000000
?_003:  mov     eax, dword [ebp-10H]                    ; 04B0 _ 8B. 45, F0
        movzx   eax, al                                 ; 04B3 _ 0F B6. C0
        sub     esp, 12                                 ; 04B6 _ 83. EC, 0C
        push    eax                                     ; 04B9 _ 50
        call    charToHexStr                            ; 04BA _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 04BF _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 04C2 _ 89. 45, F4
        mov     eax, dword [showPos.1591]               ; 04C5 _ A1, 000001F8(d)
        add     eax, 32                                 ; 04CA _ 83. C0, 20
        mov     dword [showPos.1591], eax               ; 04CD _ A3, 000001F8(d)
        jmp     ?_001                                   ; 04D2 _ E9, FFFFFF3F

?_004:  ; Local function
        sub     esp, 12                                 ; 04D7 _ 83. EC, 0C
        push    mouseinfo                               ; 04DA _ 68, 00000108(d)
        call    fifo8_status                            ; 04DF _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 04E4 _ 83. C4, 10
        test    eax, eax                                ; 04E7 _ 85. C0
        je      ?_001                                   ; 04E9 _ 0F 84, FFFFFF27
        call    show_mouse_info                         ; 04EF _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 04F4 _ E9, FFFFFF1D

initBootInfo:; Function begin
        push    ebp                                     ; 04F9 _ 55
        mov     ebp, esp                                ; 04FA _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 04FC _ 8B. 45, 08
        mov     dword [eax], 655360                     ; 04FF _ C7. 00, 000A0000
        mov     eax, dword [ebp+8H]                     ; 0505 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 320                      ; 0508 _ 66: C7. 40, 04, 0140
        mov     eax, dword [ebp+8H]                     ; 050E _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 200                      ; 0511 _ 66: C7. 40, 06, 00C8
        nop                                             ; 0517 _ 90
        pop     ebp                                     ; 0518 _ 5D
        ret                                             ; 0519 _ C3
; initBootInfo End of function

init_palette:; Function begin
        push    ebp                                     ; 051A _ 55
        mov     ebp, esp                                ; 051B _ 89. E5
        sub     esp, 8                                  ; 051D _ 83. EC, 08
        sub     esp, 4                                  ; 0520 _ 83. EC, 04
        push    table_rgb.1600                          ; 0523 _ 68, 00000020(d)
        push    15                                      ; 0528 _ 6A, 0F
        push    0                                       ; 052A _ 6A, 00
        call    set_palette                             ; 052C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0531 _ 83. C4, 10
        nop                                             ; 0534 _ 90
        leave                                           ; 0535 _ C9
        ret                                             ; 0536 _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 0537 _ 55
        mov     ebp, esp                                ; 0538 _ 89. E5
        sub     esp, 24                                 ; 053A _ 83. EC, 18
        call    io_load_eflags                          ; 053D _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 0542 _ 89. 45, F4
        call    io_cli                                  ; 0545 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 054A _ 83. EC, 08
        push    dword [ebp+8H]                          ; 054D _ FF. 75, 08
        push    968                                     ; 0550 _ 68, 000003C8
        call    io_out8                                 ; 0555 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 055A _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 055D _ 8B. 45, 08
        mov     dword [ebp-10H], eax                    ; 0560 _ 89. 45, F0
        jmp     ?_006                                   ; 0563 _ EB, 65

?_005:  mov     eax, dword [ebp+10H]                    ; 0565 _ 8B. 45, 10
        movzx   eax, byte [eax]                         ; 0568 _ 0F B6. 00
        shr     al, 2                                   ; 056B _ C0. E8, 02
        movzx   eax, al                                 ; 056E _ 0F B6. C0
        sub     esp, 8                                  ; 0571 _ 83. EC, 08
        push    eax                                     ; 0574 _ 50
        push    969                                     ; 0575 _ 68, 000003C9
        call    io_out8                                 ; 057A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 057F _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 0582 _ 8B. 45, 10
        add     eax, 1                                  ; 0585 _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 0588 _ 0F B6. 00
        shr     al, 2                                   ; 058B _ C0. E8, 02
        movzx   eax, al                                 ; 058E _ 0F B6. C0
        sub     esp, 8                                  ; 0591 _ 83. EC, 08
        push    eax                                     ; 0594 _ 50
        push    969                                     ; 0595 _ 68, 000003C9
        call    io_out8                                 ; 059A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 059F _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 05A2 _ 8B. 45, 10
        add     eax, 2                                  ; 05A5 _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 05A8 _ 0F B6. 00
        shr     al, 2                                   ; 05AB _ C0. E8, 02
        movzx   eax, al                                 ; 05AE _ 0F B6. C0
        sub     esp, 8                                  ; 05B1 _ 83. EC, 08
        push    eax                                     ; 05B4 _ 50
        push    969                                     ; 05B5 _ 68, 000003C9
        call    io_out8                                 ; 05BA _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 05BF _ 83. C4, 10
        add     dword [ebp+10H], 3                      ; 05C2 _ 83. 45, 10, 03
        add     dword [ebp-10H], 1                      ; 05C6 _ 83. 45, F0, 01
?_006:  mov     eax, dword [ebp-10H]                    ; 05CA _ 8B. 45, F0
        cmp     eax, dword [ebp+0CH]                    ; 05CD _ 3B. 45, 0C
        jle     ?_005                                   ; 05D0 _ 7E, 93
        sub     esp, 12                                 ; 05D2 _ 83. EC, 0C
        push    dword [ebp-0CH]                         ; 05D5 _ FF. 75, F4
        call    io_store_eflags                         ; 05D8 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 05DD _ 83. C4, 10
        nop                                             ; 05E0 _ 90
        leave                                           ; 05E1 _ C9
        ret                                             ; 05E2 _ C3
; set_palette End of function

boxfill8:; Function begin
        push    ebp                                     ; 05E3 _ 55
        mov     ebp, esp                                ; 05E4 _ 89. E5
        sub     esp, 20                                 ; 05E6 _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 05E9 _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 05EC _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 05EF _ 8B. 45, 18
        mov     dword [ebp-4H], eax                     ; 05F2 _ 89. 45, FC
        jmp     ?_010                                   ; 05F5 _ EB, 33

?_007:  mov     eax, dword [ebp+14H]                    ; 05F7 _ 8B. 45, 14
        mov     dword [ebp-8H], eax                     ; 05FA _ 89. 45, F8
        jmp     ?_009                                   ; 05FD _ EB, 1F

?_008:  mov     eax, dword [ebp-4H]                     ; 05FF _ 8B. 45, FC
        imul    eax, dword [ebp+0CH]                    ; 0602 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0606 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0608 _ 8B. 45, F8
        add     eax, edx                                ; 060B _ 01. D0
        mov     edx, eax                                ; 060D _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 060F _ 8B. 45, 08
        add     edx, eax                                ; 0612 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0614 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0618 _ 88. 02
        add     dword [ebp-8H], 1                       ; 061A _ 83. 45, F8, 01
?_009:  mov     eax, dword [ebp-8H]                     ; 061E _ 8B. 45, F8
        cmp     eax, dword [ebp+1CH]                    ; 0621 _ 3B. 45, 1C
        jle     ?_008                                   ; 0624 _ 7E, D9
        add     dword [ebp-4H], 1                       ; 0626 _ 83. 45, FC, 01
?_010:  mov     eax, dword [ebp-4H]                     ; 062A _ 8B. 45, FC
        cmp     eax, dword [ebp+20H]                    ; 062D _ 3B. 45, 20
        jle     ?_007                                   ; 0630 _ 7E, C5
        nop                                             ; 0632 _ 90
        leave                                           ; 0633 _ C9
        ret                                             ; 0634 _ C3
; boxfill8 End of function

showString:; Function begin
        push    ebp                                     ; 0635 _ 55
        mov     ebp, esp                                ; 0636 _ 89. E5
        sub     esp, 24                                 ; 0638 _ 83. EC, 18
        mov     eax, dword [ebp+18H]                    ; 063B _ 8B. 45, 18
        mov     byte [ebp-0CH], al                      ; 063E _ 88. 45, F4
        jmp     ?_012                                   ; 0641 _ EB, 37

?_011:  mov     eax, dword [ebp+1CH]                    ; 0643 _ 8B. 45, 1C
        movzx   eax, byte [eax]                         ; 0646 _ 0F B6. 00
        movzx   eax, al                                 ; 0649 _ 0F B6. C0
        shl     eax, 4                                  ; 064C _ C1. E0, 04
        lea     edx, [systemFont+eax]                   ; 064F _ 8D. 90, 00000000(d)
        movsx   eax, byte [ebp-0CH]                     ; 0655 _ 0F BE. 45, F4
        sub     esp, 8                                  ; 0659 _ 83. EC, 08
        push    edx                                     ; 065C _ 52
        push    eax                                     ; 065D _ 50
        push    dword [ebp+14H]                         ; 065E _ FF. 75, 14
        push    dword [ebp+10H]                         ; 0661 _ FF. 75, 10
        push    dword [ebp+0CH]                         ; 0664 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0667 _ FF. 75, 08
        call    showChar8                               ; 066A _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 066F _ 83. C4, 20
        add     dword [ebp+1CH], 1                      ; 0672 _ 83. 45, 1C, 01
        add     dword [ebp+10H], 8                      ; 0676 _ 83. 45, 10, 08
?_012:  mov     eax, dword [ebp+1CH]                    ; 067A _ 8B. 45, 1C
        movzx   eax, byte [eax]                         ; 067D _ 0F B6. 00
        test    al, al                                  ; 0680 _ 84. C0
        jnz     ?_011                                   ; 0682 _ 75, BF
        nop                                             ; 0684 _ 90
        leave                                           ; 0685 _ C9
        ret                                             ; 0686 _ C3
; showString End of function

showChar8:; Function begin
        push    ebp                                     ; 0687 _ 55
        mov     ebp, esp                                ; 0688 _ 89. E5
        sub     esp, 20                                 ; 068A _ 83. EC, 14
        mov     eax, dword [ebp+18H]                    ; 068D _ 8B. 45, 18
        mov     byte [ebp-14H], al                      ; 0690 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 0693 _ C7. 45, FC, 00000000
        jmp     ?_022                                   ; 069A _ E9, 0000016C

?_013:  mov     edx, dword [ebp-4H]                     ; 069F _ 8B. 55, FC
        mov     eax, dword [ebp+1CH]                    ; 06A2 _ 8B. 45, 1C
        add     eax, edx                                ; 06A5 _ 01. D0
        movzx   eax, byte [eax]                         ; 06A7 _ 0F B6. 00
        mov     byte [ebp-5H], al                       ; 06AA _ 88. 45, FB
        cmp     byte [ebp-5H], 0                        ; 06AD _ 80. 7D, FB, 00
        jns     ?_014                                   ; 06B1 _ 79, 20
        mov     edx, dword [ebp+14H]                    ; 06B3 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 06B6 _ 8B. 45, FC
        add     eax, edx                                ; 06B9 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 06BB _ 0F AF. 45, 0C
        mov     edx, eax                                ; 06BF _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 06C1 _ 8B. 45, 10
        add     eax, edx                                ; 06C4 _ 01. D0
        mov     edx, eax                                ; 06C6 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 06C8 _ 8B. 45, 08
        add     edx, eax                                ; 06CB _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 06CD _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 06D1 _ 88. 02
?_014:  movsx   eax, byte [ebp-5H]                      ; 06D3 _ 0F BE. 45, FB
        and     eax, 40H                                ; 06D7 _ 83. E0, 40
        test    eax, eax                                ; 06DA _ 85. C0
        jz      ?_015                                   ; 06DC _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 06DE _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 06E1 _ 8B. 45, FC
        add     eax, edx                                ; 06E4 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 06E6 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 06EA _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 06EC _ 8B. 45, 10
        add     eax, edx                                ; 06EF _ 01. D0
        lea     edx, [eax+1H]                           ; 06F1 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 06F4 _ 8B. 45, 08
        add     edx, eax                                ; 06F7 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 06F9 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 06FD _ 88. 02
?_015:  movsx   eax, byte [ebp-5H]                      ; 06FF _ 0F BE. 45, FB
        and     eax, 20H                                ; 0703 _ 83. E0, 20
        test    eax, eax                                ; 0706 _ 85. C0
        jz      ?_016                                   ; 0708 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 070A _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 070D _ 8B. 45, FC
        add     eax, edx                                ; 0710 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0712 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0716 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0718 _ 8B. 45, 10
        add     eax, edx                                ; 071B _ 01. D0
        lea     edx, [eax+2H]                           ; 071D _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 0720 _ 8B. 45, 08
        add     edx, eax                                ; 0723 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0725 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0729 _ 88. 02
?_016:  movsx   eax, byte [ebp-5H]                      ; 072B _ 0F BE. 45, FB
        and     eax, 10H                                ; 072F _ 83. E0, 10
        test    eax, eax                                ; 0732 _ 85. C0
        jz      ?_017                                   ; 0734 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 0736 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0739 _ 8B. 45, FC
        add     eax, edx                                ; 073C _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 073E _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0742 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0744 _ 8B. 45, 10
        add     eax, edx                                ; 0747 _ 01. D0
        lea     edx, [eax+3H]                           ; 0749 _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 074C _ 8B. 45, 08
        add     edx, eax                                ; 074F _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0751 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0755 _ 88. 02
?_017:  movsx   eax, byte [ebp-5H]                      ; 0757 _ 0F BE. 45, FB
        and     eax, 08H                                ; 075B _ 83. E0, 08
        test    eax, eax                                ; 075E _ 85. C0
        jz      ?_018                                   ; 0760 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 0762 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0765 _ 8B. 45, FC
        add     eax, edx                                ; 0768 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 076A _ 0F AF. 45, 0C
        mov     edx, eax                                ; 076E _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0770 _ 8B. 45, 10
        add     eax, edx                                ; 0773 _ 01. D0
        lea     edx, [eax+4H]                           ; 0775 _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0778 _ 8B. 45, 08
        add     edx, eax                                ; 077B _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 077D _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0781 _ 88. 02
?_018:  movsx   eax, byte [ebp-5H]                      ; 0783 _ 0F BE. 45, FB
        and     eax, 04H                                ; 0787 _ 83. E0, 04
        test    eax, eax                                ; 078A _ 85. C0
        jz      ?_019                                   ; 078C _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 078E _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0791 _ 8B. 45, FC
        add     eax, edx                                ; 0794 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0796 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 079A _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 079C _ 8B. 45, 10
        add     eax, edx                                ; 079F _ 01. D0
        lea     edx, [eax+5H]                           ; 07A1 _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 07A4 _ 8B. 45, 08
        add     edx, eax                                ; 07A7 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 07A9 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 07AD _ 88. 02
?_019:  movsx   eax, byte [ebp-5H]                      ; 07AF _ 0F BE. 45, FB
        and     eax, 02H                                ; 07B3 _ 83. E0, 02
        test    eax, eax                                ; 07B6 _ 85. C0
        jz      ?_020                                   ; 07B8 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 07BA _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 07BD _ 8B. 45, FC
        add     eax, edx                                ; 07C0 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 07C2 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 07C6 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 07C8 _ 8B. 45, 10
        add     eax, edx                                ; 07CB _ 01. D0
        lea     edx, [eax+6H]                           ; 07CD _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 07D0 _ 8B. 45, 08
        add     edx, eax                                ; 07D3 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 07D5 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 07D9 _ 88. 02
?_020:  movsx   eax, byte [ebp-5H]                      ; 07DB _ 0F BE. 45, FB
        and     eax, 01H                                ; 07DF _ 83. E0, 01
        test    eax, eax                                ; 07E2 _ 85. C0
        jz      ?_021                                   ; 07E4 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 07E6 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 07E9 _ 8B. 45, FC
        add     eax, edx                                ; 07EC _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 07EE _ 0F AF. 45, 0C
        mov     edx, eax                                ; 07F2 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 07F4 _ 8B. 45, 10
        add     eax, edx                                ; 07F7 _ 01. D0
        lea     edx, [eax+7H]                           ; 07F9 _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 07FC _ 8B. 45, 08
        add     edx, eax                                ; 07FF _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0801 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0805 _ 88. 02
?_021:  add     dword [ebp-4H], 1                       ; 0807 _ 83. 45, FC, 01
?_022:  cmp     dword [ebp-4H], 15                      ; 080B _ 83. 7D, FC, 0F
        jle     ?_013                                   ; 080F _ 0F 8E, FFFFFE8A
        nop                                             ; 0815 _ 90
        leave                                           ; 0816 _ C9
        ret                                             ; 0817 _ C3
; showChar8 End of function

init_mouse_cursor:; Function begin
        push    ebp                                     ; 0818 _ 55
        mov     ebp, esp                                ; 0819 _ 89. E5
        sub     esp, 20                                 ; 081B _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 081E _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 0821 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 0824 _ C7. 45, FC, 00000000
        jmp     ?_029                                   ; 082B _ E9, 000000B5

?_023:  mov     dword [ebp-8H], 0                       ; 0830 _ C7. 45, F8, 00000000
        jmp     ?_028                                   ; 0837 _ E9, 0000009B

?_024:  mov     eax, dword [ebp-4H]                     ; 083C _ 8B. 45, FC
        shl     eax, 4                                  ; 083F _ C1. E0, 04
        mov     edx, eax                                ; 0842 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0844 _ 8B. 45, F8
        add     eax, edx                                ; 0847 _ 01. D0
        add     eax, cursor.1658                        ; 0849 _ 05, 00000060(d)
        movzx   eax, byte [eax]                         ; 084E _ 0F B6. 00
        cmp     al, 42                                  ; 0851 _ 3C, 2A
        jnz     ?_025                                   ; 0853 _ 75, 19
        mov     eax, dword [ebp-4H]                     ; 0855 _ 8B. 45, FC
        shl     eax, 4                                  ; 0858 _ C1. E0, 04
        mov     edx, eax                                ; 085B _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 085D _ 8B. 45, F8
        add     eax, edx                                ; 0860 _ 01. D0
        mov     edx, eax                                ; 0862 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0864 _ 8B. 45, 08
        add     eax, edx                                ; 0867 _ 01. D0
        mov     byte [eax], 0                           ; 0869 _ C6. 00, 00
        jmp     ?_027                                   ; 086C _ EB, 65

?_025:  mov     eax, dword [ebp-4H]                     ; 086E _ 8B. 45, FC
        shl     eax, 4                                  ; 0871 _ C1. E0, 04
        mov     edx, eax                                ; 0874 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0876 _ 8B. 45, F8
        add     eax, edx                                ; 0879 _ 01. D0
        add     eax, cursor.1658                        ; 087B _ 05, 00000060(d)
        movzx   eax, byte [eax]                         ; 0880 _ 0F B6. 00
        cmp     al, 79                                  ; 0883 _ 3C, 4F
        jnz     ?_026                                   ; 0885 _ 75, 19
        mov     eax, dword [ebp-4H]                     ; 0887 _ 8B. 45, FC
        shl     eax, 4                                  ; 088A _ C1. E0, 04
        mov     edx, eax                                ; 088D _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 088F _ 8B. 45, F8
        add     eax, edx                                ; 0892 _ 01. D0
        mov     edx, eax                                ; 0894 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0896 _ 8B. 45, 08
        add     eax, edx                                ; 0899 _ 01. D0
        mov     byte [eax], 7                           ; 089B _ C6. 00, 07
        jmp     ?_027                                   ; 089E _ EB, 33

?_026:  mov     eax, dword [ebp-4H]                     ; 08A0 _ 8B. 45, FC
        shl     eax, 4                                  ; 08A3 _ C1. E0, 04
        mov     edx, eax                                ; 08A6 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 08A8 _ 8B. 45, F8
        add     eax, edx                                ; 08AB _ 01. D0
        add     eax, cursor.1658                        ; 08AD _ 05, 00000060(d)
        movzx   eax, byte [eax]                         ; 08B2 _ 0F B6. 00
        cmp     al, 46                                  ; 08B5 _ 3C, 2E
        jnz     ?_027                                   ; 08B7 _ 75, 1A
        mov     eax, dword [ebp-4H]                     ; 08B9 _ 8B. 45, FC
        shl     eax, 4                                  ; 08BC _ C1. E0, 04
        mov     edx, eax                                ; 08BF _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 08C1 _ 8B. 45, F8
        add     eax, edx                                ; 08C4 _ 01. D0
        mov     edx, eax                                ; 08C6 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 08C8 _ 8B. 45, 08
        add     edx, eax                                ; 08CB _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 08CD _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 08D1 _ 88. 02
?_027:  add     dword [ebp-8H], 1                       ; 08D3 _ 83. 45, F8, 01
?_028:  cmp     dword [ebp-8H], 15                      ; 08D7 _ 83. 7D, F8, 0F
        jle     ?_024                                   ; 08DB _ 0F 8E, FFFFFF5B
        add     dword [ebp-4H], 1                       ; 08E1 _ 83. 45, FC, 01
?_029:  cmp     dword [ebp-4H], 15                      ; 08E5 _ 83. 7D, FC, 0F
        jle     ?_023                                   ; 08E9 _ 0F 8E, FFFFFF41
        nop                                             ; 08EF _ 90
        leave                                           ; 08F0 _ C9
        ret                                             ; 08F1 _ C3
; init_mouse_cursor End of function

putblock:; Function begin
        push    ebp                                     ; 08F2 _ 55
        mov     ebp, esp                                ; 08F3 _ 89. E5
        push    ebx                                     ; 08F5 _ 53
        sub     esp, 16                                 ; 08F6 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 08F9 _ C7. 45, F8, 00000000
        jmp     ?_033                                   ; 0900 _ EB, 50

?_030:  mov     dword [ebp-0CH], 0                      ; 0902 _ C7. 45, F4, 00000000
        jmp     ?_032                                   ; 0909 _ EB, 3B

?_031:  mov     eax, dword [ebp-8H]                     ; 090B _ 8B. 45, F8
        imul    eax, dword [ebp+24H]                    ; 090E _ 0F AF. 45, 24
        mov     edx, eax                                ; 0912 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 0914 _ 8B. 45, F4
        add     eax, edx                                ; 0917 _ 01. D0
        mov     edx, eax                                ; 0919 _ 89. C2
        mov     eax, dword [ebp+20H]                    ; 091B _ 8B. 45, 20
        add     eax, edx                                ; 091E _ 01. D0
        mov     ecx, dword [ebp+1CH]                    ; 0920 _ 8B. 4D, 1C
        mov     edx, dword [ebp-8H]                     ; 0923 _ 8B. 55, F8
        add     edx, ecx                                ; 0926 _ 01. CA
        imul    edx, dword [ebp+0CH]                    ; 0928 _ 0F AF. 55, 0C
        mov     ebx, dword [ebp+18H]                    ; 092C _ 8B. 5D, 18
        mov     ecx, dword [ebp-0CH]                    ; 092F _ 8B. 4D, F4
        add     ecx, ebx                                ; 0932 _ 01. D9
        add     edx, ecx                                ; 0934 _ 01. CA
        mov     ecx, edx                                ; 0936 _ 89. D1
        mov     edx, dword [ebp+8H]                     ; 0938 _ 8B. 55, 08
        add     edx, ecx                                ; 093B _ 01. CA
        movzx   eax, byte [eax]                         ; 093D _ 0F B6. 00
        mov     byte [edx], al                          ; 0940 _ 88. 02
        add     dword [ebp-0CH], 1                      ; 0942 _ 83. 45, F4, 01
?_032:  mov     eax, dword [ebp-0CH]                    ; 0946 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 0949 _ 3B. 45, 10
        jl      ?_031                                   ; 094C _ 7C, BD
        add     dword [ebp-8H], 1                       ; 094E _ 83. 45, F8, 01
?_033:  mov     eax, dword [ebp-8H]                     ; 0952 _ 8B. 45, F8
        cmp     eax, dword [ebp+14H]                    ; 0955 _ 3B. 45, 14
        jl      ?_030                                   ; 0958 _ 7C, A8
        nop                                             ; 095A _ 90
        add     esp, 16                                 ; 095B _ 83. C4, 10
        pop     ebx                                     ; 095E _ 5B
        pop     ebp                                     ; 095F _ 5D
        ret                                             ; 0960 _ C3
; putblock End of function

intHandlerFromC:; Function begin
        push    ebp                                     ; 0961 _ 55
        mov     ebp, esp                                ; 0962 _ 89. E5
        sub     esp, 24                                 ; 0964 _ 83. EC, 18
        mov     eax, dword [bootInfo]                   ; 0967 _ A1, 00000100(d)
        mov     dword [ebp-14H], eax                    ; 096C _ 89. 45, EC
        movzx   eax, word [?_095]                       ; 096F _ 0F B7. 05, 00000104(d)
        cwde                                            ; 0976 _ 98
        mov     dword [ebp-10H], eax                    ; 0977 _ 89. 45, F0
        movzx   eax, word [?_096]                       ; 097A _ 0F B7. 05, 00000106(d)
        cwde                                            ; 0981 _ 98
        mov     dword [ebp-0CH], eax                    ; 0982 _ 89. 45, F4
        sub     esp, 8                                  ; 0985 _ 83. EC, 08
        push    33                                      ; 0988 _ 6A, 21
        push    32                                      ; 098A _ 6A, 20
        call    io_out8                                 ; 098C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0991 _ 83. C4, 10
        mov     byte [ebp-15H], 0                       ; 0994 _ C6. 45, EB, 00
        sub     esp, 12                                 ; 0998 _ 83. EC, 0C
        push    96                                      ; 099B _ 6A, 60
        call    io_in8                                  ; 099D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 09A2 _ 83. C4, 10
        mov     byte [ebp-15H], al                      ; 09A5 _ 88. 45, EB
        movzx   eax, byte [ebp-15H]                     ; 09A8 _ 0F B6. 45, EB
        sub     esp, 8                                  ; 09AC _ 83. EC, 08
        push    eax                                     ; 09AF _ 50
        push    keyinfo                                 ; 09B0 _ 68, 00000120(d)
        call    fifo8_put                               ; 09B5 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 09BA _ 83. C4, 10
        nop                                             ; 09BD _ 90
        leave                                           ; 09BE _ C9
        ret                                             ; 09BF _ C3
; intHandlerFromC End of function

charToHexVal:; Function begin
        push    ebp                                     ; 09C0 _ 55
        mov     ebp, esp                                ; 09C1 _ 89. E5
        sub     esp, 4                                  ; 09C3 _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 09C6 _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 09C9 _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 09CC _ 80. 7D, FC, 09
        jle     ?_034                                   ; 09D0 _ 7E, 09
        movzx   eax, byte [ebp-4H]                      ; 09D2 _ 0F B6. 45, FC
        add     eax, 55                                 ; 09D6 _ 83. C0, 37
        jmp     ?_035                                   ; 09D9 _ EB, 07

?_034:  movzx   eax, byte [ebp-4H]                      ; 09DB _ 0F B6. 45, FC
        add     eax, 48                                 ; 09DF _ 83. C0, 30
?_035:  leave                                           ; 09E2 _ C9
        ret                                             ; 09E3 _ C3
; charToHexVal End of function

charToHexStr:; Function begin
        push    ebp                                     ; 09E4 _ 55
        mov     ebp, esp                                ; 09E5 _ 89. E5
        sub     esp, 20                                 ; 09E7 _ 83. EC, 14
        mov     eax, dword [ebp+8H]                     ; 09EA _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 09ED _ 88. 45, EC
        movzx   eax, byte [ebp-14H]                     ; 09F0 _ 0F B6. 45, EC
        and     eax, 0FH                                ; 09F4 _ 83. E0, 0F
        mov     byte [ebp-1H], al                       ; 09F7 _ 88. 45, FF
        movsx   eax, byte [ebp-1H]                      ; 09FA _ 0F BE. 45, FF
        push    eax                                     ; 09FE _ 50
        call    charToHexVal                            ; 09FF _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 0A04 _ 83. C4, 04
        mov     byte [?_094], al                        ; 0A07 _ A2, 00000003(d)
        shr     byte [ebp-14H], 4                       ; 0A0C _ C0. 6D, EC, 04
        movzx   eax, byte [ebp-14H]                     ; 0A10 _ 0F B6. 45, EC
        movsx   eax, al                                 ; 0A14 _ 0F BE. C0
        push    eax                                     ; 0A17 _ 50
        call    charToHexVal                            ; 0A18 _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 0A1D _ 83. C4, 04
        mov     byte [?_093], al                        ; 0A20 _ A2, 00000002(d)
        mov     eax, keyval                             ; 0A25 _ B8, 00000000(d)
        leave                                           ; 0A2A _ C9
        ret                                             ; 0A2B _ C3
; charToHexStr End of function

intToHexStr:; Function begin
        push    ebp                                     ; 0A2C _ 55
        mov     ebp, esp                                ; 0A2D _ 89. E5
        sub     esp, 16                                 ; 0A2F _ 83. EC, 10
        mov     byte [str.1705], 48                     ; 0A32 _ C6. 05, 000001FC(d), 30
        mov     byte [?_097], 88                        ; 0A39 _ C6. 05, 000001FD(d), 58
        mov     byte [?_098], 0                         ; 0A40 _ C6. 05, 00000206(d), 00
        mov     dword [ebp-8H], 2                       ; 0A47 _ C7. 45, F8, 00000002
        mov     dword [ebp-0CH], 7                      ; 0A4E _ C7. 45, F4, 00000007
        jmp     ?_039                                   ; 0A55 _ EB, 45

?_036:  mov     eax, dword [ebp+8H]                     ; 0A57 _ 8B. 45, 08
        and     eax, 0FH                                ; 0A5A _ 83. E0, 0F
        mov     dword [ebp-4H], eax                     ; 0A5D _ 89. 45, FC
        cmp     dword [ebp-4H], 9                       ; 0A60 _ 83. 7D, FC, 09
        jg      ?_037                                   ; 0A64 _ 7F, 18
        mov     eax, dword [ebp-4H]                     ; 0A66 _ 8B. 45, FC
        lea     ecx, [eax+30H]                          ; 0A69 _ 8D. 48, 30
        mov     edx, dword [ebp-8H]                     ; 0A6C _ 8B. 55, F8
        mov     eax, dword [ebp-0CH]                    ; 0A6F _ 8B. 45, F4
        add     eax, edx                                ; 0A72 _ 01. D0
        mov     edx, ecx                                ; 0A74 _ 89. CA
        mov     byte [str.1705+eax], dl                 ; 0A76 _ 88. 90, 000001FC(d)
        jmp     ?_038                                   ; 0A7C _ EB, 16

?_037:  mov     eax, dword [ebp-4H]                     ; 0A7E _ 8B. 45, FC
        lea     ecx, [eax+37H]                          ; 0A81 _ 8D. 48, 37
        mov     edx, dword [ebp-8H]                     ; 0A84 _ 8B. 55, F8
        mov     eax, dword [ebp-0CH]                    ; 0A87 _ 8B. 45, F4
        add     eax, edx                                ; 0A8A _ 01. D0
        mov     edx, ecx                                ; 0A8C _ 89. CA
        mov     byte [str.1705+eax], dl                 ; 0A8E _ 88. 90, 000001FC(d)
?_038:  shr     dword [ebp+8H], 4                       ; 0A94 _ C1. 6D, 08, 04
        sub     dword [ebp-0CH], 1                      ; 0A98 _ 83. 6D, F4, 01
?_039:  cmp     dword [ebp-0CH], 0                      ; 0A9C _ 83. 7D, F4, 00
        jns     ?_036                                   ; 0AA0 _ 79, B5
        mov     eax, str.1705                           ; 0AA2 _ B8, 000001FC(d)
        leave                                           ; 0AA7 _ C9
        ret                                             ; 0AA8 _ C3
; intToHexStr End of function

wait_KBC_sendReady:; Function begin
        push    ebp                                     ; 0AA9 _ 55
        mov     ebp, esp                                ; 0AAA _ 89. E5
        sub     esp, 8                                  ; 0AAC _ 83. EC, 08
?_040:  sub     esp, 12                                 ; 0AAF _ 83. EC, 0C
        push    100                                     ; 0AB2 _ 6A, 64
        call    io_in8                                  ; 0AB4 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0AB9 _ 83. C4, 10
        and     eax, 02H                                ; 0ABC _ 83. E0, 02
        test    eax, eax                                ; 0ABF _ 85. C0
        jz      ?_041                                   ; 0AC1 _ 74, 02
        jmp     ?_040                                   ; 0AC3 _ EB, EA
; wait_KBC_sendReady End of function

?_041:  ; Local function
        nop                                             ; 0AC5 _ 90
        nop                                             ; 0AC6 _ 90
        leave                                           ; 0AC7 _ C9
        ret                                             ; 0AC8 _ C3

init_keyboard:; Function begin
        push    ebp                                     ; 0AC9 _ 55
        mov     ebp, esp                                ; 0ACA _ 89. E5
        sub     esp, 8                                  ; 0ACC _ 83. EC, 08
        call    wait_KBC_sendReady                      ; 0ACF _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0AD4 _ 83. EC, 08
        push    96                                      ; 0AD7 _ 6A, 60
        push    100                                     ; 0AD9 _ 6A, 64
        call    io_out8                                 ; 0ADB _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0AE0 _ 83. C4, 10
        call    wait_KBC_sendReady                      ; 0AE3 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0AE8 _ 83. EC, 08
        push    71                                      ; 0AEB _ 6A, 47
        push    96                                      ; 0AED _ 6A, 60
        call    io_out8                                 ; 0AEF _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0AF4 _ 83. C4, 10
        nop                                             ; 0AF7 _ 90
        leave                                           ; 0AF8 _ C9
        ret                                             ; 0AF9 _ C3
; init_keyboard End of function

enable_mouse:; Function begin
        push    ebp                                     ; 0AFA _ 55
        mov     ebp, esp                                ; 0AFB _ 89. E5
        sub     esp, 8                                  ; 0AFD _ 83. EC, 08
        call    wait_KBC_sendReady                      ; 0B00 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0B05 _ 83. EC, 08
        push    212                                     ; 0B08 _ 68, 000000D4
        push    100                                     ; 0B0D _ 6A, 64
        call    io_out8                                 ; 0B0F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0B14 _ 83. C4, 10
        call    wait_KBC_sendReady                      ; 0B17 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0B1C _ 83. EC, 08
        push    244                                     ; 0B1F _ 68, 000000F4
        push    96                                      ; 0B24 _ 6A, 60
        call    io_out8                                 ; 0B26 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0B2B _ 83. C4, 10
        nop                                             ; 0B2E _ 90
        leave                                           ; 0B2F _ C9
        ret                                             ; 0B30 _ C3
; enable_mouse End of function

intHandlerFromMouse:; Function begin
        push    ebp                                     ; 0B31 _ 55
        mov     ebp, esp                                ; 0B32 _ 89. E5
        sub     esp, 24                                 ; 0B34 _ 83. EC, 18
        sub     esp, 8                                  ; 0B37 _ 83. EC, 08
        push    32                                      ; 0B3A _ 6A, 20
        push    160                                     ; 0B3C _ 68, 000000A0
        call    io_out8                                 ; 0B41 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0B46 _ 83. C4, 10
        sub     esp, 8                                  ; 0B49 _ 83. EC, 08
        push    32                                      ; 0B4C _ 6A, 20
        push    32                                      ; 0B4E _ 6A, 20
        call    io_out8                                 ; 0B50 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0B55 _ 83. C4, 10
        sub     esp, 12                                 ; 0B58 _ 83. EC, 0C
        push    96                                      ; 0B5B _ 6A, 60
        call    io_in8                                  ; 0B5D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0B62 _ 83. C4, 10
        mov     byte [ebp-9H], al                       ; 0B65 _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 0B68 _ 0F B6. 45, F7
        sub     esp, 8                                  ; 0B6C _ 83. EC, 08
        push    eax                                     ; 0B6F _ 50
        push    mouseinfo                               ; 0B70 _ 68, 00000108(d)
        call    fifo8_put                               ; 0B75 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0B7A _ 83. C4, 10
        nop                                             ; 0B7D _ 90
        leave                                           ; 0B7E _ C9
        ret                                             ; 0B7F _ C3
; intHandlerFromMouse End of function

fifo8_init:; Function begin
        push    ebp                                     ; 0B80 _ 55
        mov     ebp, esp                                ; 0B81 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 0B83 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 0B86 _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 0B89 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 0B8C _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 0B8F _ 8B. 55, 10
        mov     dword [eax], edx                        ; 0B92 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 0B94 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 0B97 _ 8B. 55, 0C
        mov     dword [eax+10H], edx                    ; 0B9A _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 0B9D _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 0BA0 _ C7. 40, 14, 00000000
        mov     eax, dword [ebp+8H]                     ; 0BA7 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 0BAA _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 0BB1 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 0BB4 _ C7. 40, 08, 00000000
        nop                                             ; 0BBB _ 90
        pop     ebp                                     ; 0BBC _ 5D
        ret                                             ; 0BBD _ C3
; fifo8_init End of function

fifo8_put:; Function begin
        push    ebp                                     ; 0BBE _ 55
        mov     ebp, esp                                ; 0BBF _ 89. E5
        sub     esp, 4                                  ; 0BC1 _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 0BC4 _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 0BC7 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0BCA _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0BCD _ 8B. 40, 10
        test    eax, eax                                ; 0BD0 _ 85. C0
        jnz     ?_042                                   ; 0BD2 _ 75, 18
        mov     eax, dword [ebp+8H]                     ; 0BD4 _ 8B. 45, 08
        mov     eax, dword [eax+14H]                    ; 0BD7 _ 8B. 40, 14
        or      eax, 01H                                ; 0BDA _ 83. C8, 01
        mov     edx, eax                                ; 0BDD _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0BDF _ 8B. 45, 08
        mov     dword [eax+14H], edx                    ; 0BE2 _ 89. 50, 14
        mov     eax, 4294967295                         ; 0BE5 _ B8, FFFFFFFF
        jmp     ?_044                                   ; 0BEA _ EB, 50

?_042:  mov     eax, dword [ebp+8H]                     ; 0BEC _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 0BEF _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 0BF1 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0BF4 _ 8B. 40, 04
        add     edx, eax                                ; 0BF7 _ 01. C2
        movzx   eax, byte [ebp-4H]                      ; 0BF9 _ 0F B6. 45, FC
        mov     byte [edx], al                          ; 0BFD _ 88. 02
        mov     eax, dword [ebp+8H]                     ; 0BFF _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0C02 _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 0C05 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0C08 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 0C0B _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0C0E _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 0C11 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0C14 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0C17 _ 8B. 40, 0C
        cmp     edx, eax                                ; 0C1A _ 39. C2
        jnz     ?_043                                   ; 0C1C _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 0C1E _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 0C21 _ C7. 40, 04, 00000000
?_043:  mov     eax, dword [ebp+8H]                     ; 0C28 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0C2B _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 0C2E _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 0C31 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 0C34 _ 89. 50, 10
        mov     eax, 0                                  ; 0C37 _ B8, 00000000
?_044:  leave                                           ; 0C3C _ C9
        ret                                             ; 0C3D _ C3
; fifo8_put End of function

fifo8_get:; Function begin
        push    ebp                                     ; 0C3E _ 55
        mov     ebp, esp                                ; 0C3F _ 89. E5
        sub     esp, 16                                 ; 0C41 _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 0C44 _ 8B. 45, 08
        mov     edx, dword [eax+10H]                    ; 0C47 _ 8B. 50, 10
        mov     eax, dword [ebp+8H]                     ; 0C4A _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0C4D _ 8B. 40, 0C
        cmp     edx, eax                                ; 0C50 _ 39. C2
        jnz     ?_045                                   ; 0C52 _ 75, 07
        mov     eax, 4294967295                         ; 0C54 _ B8, FFFFFFFF
        jmp     ?_047                                   ; 0C59 _ EB, 51

?_045:  mov     eax, dword [ebp+8H]                     ; 0C5B _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 0C5E _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 0C60 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0C63 _ 8B. 40, 08
        add     eax, edx                                ; 0C66 _ 01. D0
        movzx   eax, byte [eax]                         ; 0C68 _ 0F B6. 00
        movzx   eax, al                                 ; 0C6B _ 0F B6. C0
        mov     dword [ebp-4H], eax                     ; 0C6E _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0C71 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0C74 _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 0C77 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0C7A _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0C7D _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 0C80 _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 0C83 _ 8B. 50, 08
        mov     eax, dword [ebp+8H]                     ; 0C86 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0C89 _ 8B. 40, 0C
        cmp     edx, eax                                ; 0C8C _ 39. C2
        jnz     ?_046                                   ; 0C8E _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 0C90 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 0C93 _ C7. 40, 08, 00000000
?_046:  mov     eax, dword [ebp+8H]                     ; 0C9A _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0C9D _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 0CA0 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0CA3 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 0CA6 _ 89. 50, 10
        mov     eax, dword [ebp-4H]                     ; 0CA9 _ 8B. 45, FC
?_047:  leave                                           ; 0CAC _ C9
        ret                                             ; 0CAD _ C3
; fifo8_get End of function

fifo8_status:; Function begin
        push    ebp                                     ; 0CAE _ 55
        mov     ebp, esp                                ; 0CAF _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 0CB1 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 0CB4 _ 8B. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 0CB7 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0CBA _ 8B. 40, 10
        sub     edx, eax                                ; 0CBD _ 29. C2
        mov     eax, edx                                ; 0CBF _ 89. D0
        pop     ebp                                     ; 0CC1 _ 5D
        ret                                             ; 0CC2 _ C3
; fifo8_status End of function

mouse_decode:; Function begin
        push    ebp                                     ; 0CC3 _ 55
        mov     ebp, esp                                ; 0CC4 _ 89. E5
        sub     esp, 4                                  ; 0CC6 _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 0CC9 _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 0CCC _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0CCF _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 0CD2 _ 0F B6. 40, 03
        test    al, al                                  ; 0CD6 _ 84. C0
        jnz     ?_049                                   ; 0CD8 _ 75, 17
        cmp     byte [ebp-4H], -6                       ; 0CDA _ 80. 7D, FC, FA
        jnz     ?_048                                   ; 0CDE _ 75, 07
        mov     eax, dword [ebp+8H]                     ; 0CE0 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 0CE3 _ C6. 40, 03, 01
?_048:  mov     eax, 0                                  ; 0CE7 _ B8, 00000000
        jmp     ?_056                                   ; 0CEC _ E9, 0000010F

?_049:  mov     eax, dword [ebp+8H]                     ; 0CF1 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 0CF4 _ 0F B6. 40, 03
        cmp     al, 1                                   ; 0CF8 _ 3C, 01
        jnz     ?_051                                   ; 0CFA _ 75, 28
        movzx   eax, byte [ebp-4H]                      ; 0CFC _ 0F B6. 45, FC
        and     eax, 0C8H                               ; 0D00 _ 25, 000000C8
        cmp     eax, 8                                  ; 0D05 _ 83. F8, 08
        jnz     ?_050                                   ; 0D08 _ 75, 10
        mov     eax, dword [ebp+8H]                     ; 0D0A _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 0D0D _ 0F B6. 55, FC
        mov     byte [eax], dl                          ; 0D11 _ 88. 10
        mov     eax, dword [ebp+8H]                     ; 0D13 _ 8B. 45, 08
        mov     byte [eax+3H], 2                        ; 0D16 _ C6. 40, 03, 02
?_050:  mov     eax, 0                                  ; 0D1A _ B8, 00000000
        jmp     ?_056                                   ; 0D1F _ E9, 000000DC

?_051:  mov     eax, dword [ebp+8H]                     ; 0D24 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 0D27 _ 0F B6. 40, 03
        cmp     al, 2                                   ; 0D2B _ 3C, 02
        jnz     ?_052                                   ; 0D2D _ 75, 1B
        mov     eax, dword [ebp+8H]                     ; 0D2F _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 0D32 _ 0F B6. 55, FC
        mov     byte [eax+1H], dl                       ; 0D36 _ 88. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0D39 _ 8B. 45, 08
        mov     byte [eax+3H], 3                        ; 0D3C _ C6. 40, 03, 03
        mov     eax, 0                                  ; 0D40 _ B8, 00000000
        jmp     ?_056                                   ; 0D45 _ E9, 000000B6

?_052:  mov     eax, dword [ebp+8H]                     ; 0D4A _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 0D4D _ 0F B6. 40, 03
        cmp     al, 3                                   ; 0D51 _ 3C, 03
        jne     ?_055                                   ; 0D53 _ 0F 85, 000000A2
        mov     eax, dword [ebp+8H]                     ; 0D59 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 0D5C _ 0F B6. 55, FC
        mov     byte [eax+2H], dl                       ; 0D60 _ 88. 50, 02
        mov     eax, dword [ebp+8H]                     ; 0D63 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 0D66 _ C6. 40, 03, 01
        mov     eax, dword [ebp+8H]                     ; 0D6A _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 0D6D _ 0F B6. 00
        movzx   eax, al                                 ; 0D70 _ 0F B6. C0
        and     eax, 07H                                ; 0D73 _ 83. E0, 07
        mov     edx, eax                                ; 0D76 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0D78 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 0D7B _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 0D7E _ 8B. 45, 08
        movzx   eax, byte [eax+1H]                      ; 0D81 _ 0F B6. 40, 01
        movzx   edx, al                                 ; 0D85 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 0D88 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 0D8B _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0D8E _ 8B. 45, 08
        movzx   eax, byte [eax+2H]                      ; 0D91 _ 0F B6. 40, 02
        movzx   edx, al                                 ; 0D95 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 0D98 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0D9B _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 0D9E _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 0DA1 _ 0F B6. 00
        movzx   eax, al                                 ; 0DA4 _ 0F B6. C0
        and     eax, 10H                                ; 0DA7 _ 83. E0, 10
        test    eax, eax                                ; 0DAA _ 85. C0
        jz      ?_053                                   ; 0DAC _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 0DAE _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0DB1 _ 8B. 40, 04
        or      eax, 0FFFFFF00H                         ; 0DB4 _ 0D, FFFFFF00
        mov     edx, eax                                ; 0DB9 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0DBB _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 0DBE _ 89. 50, 04
?_053:  mov     eax, dword [ebp+8H]                     ; 0DC1 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 0DC4 _ 0F B6. 00
        movzx   eax, al                                 ; 0DC7 _ 0F B6. C0
        and     eax, 20H                                ; 0DCA _ 83. E0, 20
        test    eax, eax                                ; 0DCD _ 85. C0
        jz      ?_054                                   ; 0DCF _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 0DD1 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0DD4 _ 8B. 40, 08
        or      eax, 0FFFFFF00H                         ; 0DD7 _ 0D, FFFFFF00
        mov     edx, eax                                ; 0DDC _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0DDE _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0DE1 _ 89. 50, 08
?_054:  mov     eax, dword [ebp+8H]                     ; 0DE4 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0DE7 _ 8B. 40, 08
        neg     eax                                     ; 0DEA _ F7. D8
        mov     edx, eax                                ; 0DEC _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0DEE _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0DF1 _ 89. 50, 08
        mov     eax, 1                                  ; 0DF4 _ B8, 00000001
        jmp     ?_056                                   ; 0DF9 _ EB, 05

?_055:  mov     eax, 4294967295                         ; 0DFB _ B8, FFFFFFFF
?_056:  leave                                           ; 0E00 _ C9
        ret                                             ; 0E01 _ C3
; mouse_decode End of function

computeMousePosition:; Function begin
        push    ebp                                     ; 0E02 _ 55
        mov     ebp, esp                                ; 0E03 _ 89. E5
        sub     esp, 16                                 ; 0E05 _ 83. EC, 10
        movzx   eax, word [?_095]                       ; 0E08 _ 0F B7. 05, 00000104(d)
        cwde                                            ; 0E0F _ 98
        mov     dword [ebp-8H], eax                     ; 0E10 _ 89. 45, F8
        movzx   eax, word [?_096]                       ; 0E13 _ 0F B7. 05, 00000106(d)
        cwde                                            ; 0E1A _ 98
        mov     dword [ebp-4H], eax                     ; 0E1B _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0E1E _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 0E21 _ 8B. 50, 04
        mov     eax, dword [mx]                         ; 0E24 _ A1, 000001F0(d)
        add     eax, edx                                ; 0E29 _ 01. D0
        mov     dword [mx], eax                         ; 0E2B _ A3, 000001F0(d)
        mov     eax, dword [ebp+8H]                     ; 0E30 _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 0E33 _ 8B. 50, 08
        mov     eax, dword [my]                         ; 0E36 _ A1, 000001F4(d)
        add     eax, edx                                ; 0E3B _ 01. D0
        mov     dword [my], eax                         ; 0E3D _ A3, 000001F4(d)
        mov     eax, dword [mx]                         ; 0E42 _ A1, 000001F0(d)
        test    eax, eax                                ; 0E47 _ 85. C0
        jns     ?_057                                   ; 0E49 _ 79, 0A
        mov     dword [mx], 0                           ; 0E4B _ C7. 05, 000001F0(d), 00000000
?_057:  mov     eax, dword [my]                         ; 0E55 _ A1, 000001F4(d)
        test    eax, eax                                ; 0E5A _ 85. C0
        jns     ?_058                                   ; 0E5C _ 79, 0A
        mov     dword [my], 0                           ; 0E5E _ C7. 05, 000001F4(d), 00000000
?_058:  mov     eax, dword [ebp-8H]                     ; 0E68 _ 8B. 45, F8
        lea     edx, [eax-10H]                          ; 0E6B _ 8D. 50, F0
        mov     eax, dword [mx]                         ; 0E6E _ A1, 000001F0(d)
        cmp     edx, eax                                ; 0E73 _ 39. C2
        jge     ?_059                                   ; 0E75 _ 7D, 0B
        mov     eax, dword [ebp-8H]                     ; 0E77 _ 8B. 45, F8
        sub     eax, 16                                 ; 0E7A _ 83. E8, 10
        mov     dword [mx], eax                         ; 0E7D _ A3, 000001F0(d)
?_059:  mov     eax, dword [ebp-4H]                     ; 0E82 _ 8B. 45, FC
        lea     edx, [eax-10H]                          ; 0E85 _ 8D. 50, F0
        mov     eax, dword [my]                         ; 0E88 _ A1, 000001F4(d)
        cmp     edx, eax                                ; 0E8D _ 39. C2
        jge     ?_060                                   ; 0E8F _ 7D, 0B
        mov     eax, dword [ebp-4H]                     ; 0E91 _ 8B. 45, FC
        sub     eax, 16                                 ; 0E94 _ 83. E8, 10
        mov     dword [my], eax                         ; 0E97 _ A3, 000001F4(d)
?_060:  nop                                             ; 0E9C _ 90
        leave                                           ; 0E9D _ C9
        ret                                             ; 0E9E _ C3
; computeMousePosition End of function

eraseMouse:; Function begin
        push    ebp                                     ; 0E9F _ 55
        mov     ebp, esp                                ; 0EA0 _ 89. E5
        push    ebx                                     ; 0EA2 _ 53
        sub     esp, 16                                 ; 0EA3 _ 83. EC, 10
        movzx   eax, word [?_095]                       ; 0EA6 _ 0F B7. 05, 00000104(d)
        cwde                                            ; 0EAD _ 98
        mov     dword [ebp-0CH], eax                    ; 0EAE _ 89. 45, F4
        movzx   eax, word [?_096]                       ; 0EB1 _ 0F B7. 05, 00000106(d)
        cwde                                            ; 0EB8 _ 98
        mov     dword [ebp-8H], eax                     ; 0EB9 _ 89. 45, F8
        mov     eax, dword [my]                         ; 0EBC _ A1, 000001F4(d)
        lea     ebx, [eax+0FH]                          ; 0EC1 _ 8D. 58, 0F
        mov     eax, dword [mx]                         ; 0EC4 _ A1, 000001F0(d)
        lea     ecx, [eax+0FH]                          ; 0EC9 _ 8D. 48, 0F
        mov     edx, dword [my]                         ; 0ECC _ 8B. 15, 000001F4(d)
        mov     eax, dword [mx]                         ; 0ED2 _ A1, 000001F0(d)
        push    ebx                                     ; 0ED7 _ 53
        push    ecx                                     ; 0ED8 _ 51
        push    edx                                     ; 0ED9 _ 52
        push    eax                                     ; 0EDA _ 50
        push    14                                      ; 0EDB _ 6A, 0E
        push    dword [ebp-0CH]                         ; 0EDD _ FF. 75, F4
        push    dword [ebp+8H]                          ; 0EE0 _ FF. 75, 08
        call    boxfill8                                ; 0EE3 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 0EE8 _ 83. C4, 1C
        nop                                             ; 0EEB _ 90
        mov     ebx, dword [ebp-4H]                     ; 0EEC _ 8B. 5D, FC
        leave                                           ; 0EEF _ C9
        ret                                             ; 0EF0 _ C3
; eraseMouse End of function

drawMouse:; Function begin
        push    ebp                                     ; 0EF1 _ 55
        mov     ebp, esp                                ; 0EF2 _ 89. E5
        sub     esp, 16                                 ; 0EF4 _ 83. EC, 10
        movzx   eax, word [?_095]                       ; 0EF7 _ 0F B7. 05, 00000104(d)
        cwde                                            ; 0EFE _ 98
        mov     dword [ebp-8H], eax                     ; 0EFF _ 89. 45, F8
        movzx   eax, word [?_096]                       ; 0F02 _ 0F B7. 05, 00000106(d)
        cwde                                            ; 0F09 _ 98
        mov     dword [ebp-4H], eax                     ; 0F0A _ 89. 45, FC
        mov     edx, dword [my]                         ; 0F0D _ 8B. 15, 000001F4(d)
        mov     eax, dword [mx]                         ; 0F13 _ A1, 000001F0(d)
        push    16                                      ; 0F18 _ 6A, 10
        push    mcursor                                 ; 0F1A _ 68, 00000000(d)
        push    edx                                     ; 0F1F _ 52
        push    eax                                     ; 0F20 _ 50
        push    16                                      ; 0F21 _ 6A, 10
        push    16                                      ; 0F23 _ 6A, 10
        push    dword [ebp-8H]                          ; 0F25 _ FF. 75, F8
        push    dword [ebp+8H]                          ; 0F28 _ FF. 75, 08
        call    putblock                                ; 0F2B _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0F30 _ 83. C4, 20
        nop                                             ; 0F33 _ 90
        leave                                           ; 0F34 _ C9
        ret                                             ; 0F35 _ C3
; drawMouse End of function

show_mouse_info:; Function begin
        push    ebp                                     ; 0F36 _ 55
        mov     ebp, esp                                ; 0F37 _ 89. E5
        sub     esp, 16                                 ; 0F39 _ 83. EC, 10
        mov     eax, dword [bootInfo]                   ; 0F3C _ A1, 00000100(d)
        mov     dword [ebp-4H], eax                     ; 0F41 _ 89. 45, FC
        mov     byte [ebp-5H], 0                        ; 0F44 _ C6. 45, FB, 00
        push    mouseinfo                               ; 0F48 _ 68, 00000108(d)
        call    fifo8_get                               ; 0F4D _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 0F52 _ 83. C4, 04
        mov     byte [ebp-5H], al                       ; 0F55 _ 88. 45, FB
        movzx   eax, byte [ebp-5H]                      ; 0F58 _ 0F B6. 45, FB
        push    eax                                     ; 0F5C _ 50
        push    mdec                                    ; 0F5D _ 68, 000001E0(d)
        call    mouse_decode                            ; 0F62 _ E8, FFFFFFFC(rel)
        add     esp, 8                                  ; 0F67 _ 83. C4, 08
        cmp     eax, 1                                  ; 0F6A _ 83. F8, 01
        jnz     ?_061                                   ; 0F6D _ 75, 23
        push    dword [ebp-4H]                          ; 0F6F _ FF. 75, FC
        call    eraseMouse                              ; 0F72 _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 0F77 _ 83. C4, 04
        push    mdec                                    ; 0F7A _ 68, 000001E0(d)
        call    computeMousePosition                    ; 0F7F _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 0F84 _ 83. C4, 04
        push    dword [ebp-4H]                          ; 0F87 _ FF. 75, FC
        call    drawMouse                               ; 0F8A _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 0F8F _ 83. C4, 04
?_061:  nop                                             ; 0F92 _ 90
        leave                                           ; 0F93 _ C9
        ret                                             ; 0F94 _ C3
; show_mouse_info End of function

showMemoryInfo:; Function begin
        push    ebp                                     ; 0F95 _ 55
        mov     ebp, esp                                ; 0F96 _ 89. E5
        sub     esp, 56                                 ; 0F98 _ 83. EC, 38
        mov     dword [ebp-30H], 0                      ; 0F9B _ C7. 45, D0, 00000000
        mov     dword [ebp-2CH], 0                      ; 0FA2 _ C7. 45, D4, 00000000
        mov     dword [ebp-28H], 104                    ; 0FA9 _ C7. 45, D8, 00000068
        mov     dword [ebp-24H], 80                     ; 0FB0 _ C7. 45, DC, 00000050
        push    100                                     ; 0FB7 _ 6A, 64
        push    dword [ebp+14H]                         ; 0FB9 _ FF. 75, 14
        push    0                                       ; 0FBC _ 6A, 00
        push    0                                       ; 0FBE _ 6A, 00
        push    14                                      ; 0FC0 _ 6A, 0E
        push    dword [ebp+14H]                         ; 0FC2 _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 0FC5 _ FF. 75, 0C
        call    boxfill8                                ; 0FC8 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 0FCD _ 83. C4, 1C
        mov     eax, dword [ebp+18H]                    ; 0FD0 _ 8B. 45, 18
        movsx   eax, al                                 ; 0FD3 _ 0F BE. C0
        sub     esp, 8                                  ; 0FD6 _ 83. EC, 08
        push    ?_087                                   ; 0FD9 _ 68, 00000013(d)
        push    eax                                     ; 0FDE _ 50
        push    dword [ebp-2CH]                         ; 0FDF _ FF. 75, D4
        push    dword [ebp-30H]                         ; 0FE2 _ FF. 75, D0
        push    dword [ebp+14H]                         ; 0FE5 _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 0FE8 _ FF. 75, 0C
        call    showString                              ; 0FEB _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0FF0 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0FF3 _ 8B. 45, 10
        sub     esp, 12                                 ; 0FF6 _ 83. EC, 0C
        push    eax                                     ; 0FF9 _ 50
        call    intToHexStr                             ; 0FFA _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0FFF _ 83. C4, 10
        mov     dword [ebp-20H], eax                    ; 1002 _ 89. 45, E0
        mov     eax, dword [ebp+18H]                    ; 1005 _ 8B. 45, 18
        movsx   eax, al                                 ; 1008 _ 0F BE. C0
        sub     esp, 8                                  ; 100B _ 83. EC, 08
        push    dword [ebp-20H]                         ; 100E _ FF. 75, E0
        push    eax                                     ; 1011 _ 50
        push    dword [ebp-2CH]                         ; 1012 _ FF. 75, D4
        push    dword [ebp-28H]                         ; 1015 _ FF. 75, D8
        push    dword [ebp+14H]                         ; 1018 _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 101B _ FF. 75, 0C
        call    showString                              ; 101E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1023 _ 83. C4, 20
        add     dword [ebp-2CH], 16                     ; 1026 _ 83. 45, D4, 10
        mov     eax, dword [ebp+18H]                    ; 102A _ 8B. 45, 18
        movsx   eax, al                                 ; 102D _ 0F BE. C0
        sub     esp, 8                                  ; 1030 _ 83. EC, 08
        push    ?_088                                   ; 1033 _ 68, 0000001D(d)
        push    eax                                     ; 1038 _ 50
        push    dword [ebp-2CH]                         ; 1039 _ FF. 75, D4
        push    dword [ebp-30H]                         ; 103C _ FF. 75, D0
        push    dword [ebp+14H]                         ; 103F _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 1042 _ FF. 75, 0C
        call    showString                              ; 1045 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 104A _ 83. C4, 20
        mov     eax, dword [ebp+8H]                     ; 104D _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1050 _ 8B. 00
        sub     esp, 12                                 ; 1052 _ 83. EC, 0C
        push    eax                                     ; 1055 _ 50
        call    intToHexStr                             ; 1056 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 105B _ 83. C4, 10
        mov     dword [ebp-1CH], eax                    ; 105E _ 89. 45, E4
        mov     eax, dword [ebp+18H]                    ; 1061 _ 8B. 45, 18
        movsx   eax, al                                 ; 1064 _ 0F BE. C0
        sub     esp, 8                                  ; 1067 _ 83. EC, 08
        push    dword [ebp-1CH]                         ; 106A _ FF. 75, E4
        push    eax                                     ; 106D _ 50
        push    dword [ebp-2CH]                         ; 106E _ FF. 75, D4
        push    dword [ebp-28H]                         ; 1071 _ FF. 75, D8
        push    dword [ebp+14H]                         ; 1074 _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 1077 _ FF. 75, 0C
        call    showString                              ; 107A _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 107F _ 83. C4, 20
        add     dword [ebp-2CH], 16                     ; 1082 _ 83. 45, D4, 10
        mov     eax, dword [ebp+18H]                    ; 1086 _ 8B. 45, 18
        movsx   eax, al                                 ; 1089 _ 0F BE. C0
        sub     esp, 8                                  ; 108C _ 83. EC, 08
        push    ?_089                                   ; 108F _ 68, 00000029(d)
        push    eax                                     ; 1094 _ 50
        push    dword [ebp-2CH]                         ; 1095 _ FF. 75, D4
        push    dword [ebp-30H]                         ; 1098 _ FF. 75, D0
        push    dword [ebp+14H]                         ; 109B _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 109E _ FF. 75, 0C
        call    showString                              ; 10A1 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 10A6 _ 83. C4, 20
        mov     eax, dword [ebp+8H]                     ; 10A9 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 10AC _ 8B. 40, 04
        sub     esp, 12                                 ; 10AF _ 83. EC, 0C
        push    eax                                     ; 10B2 _ 50
        call    intToHexStr                             ; 10B3 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 10B8 _ 83. C4, 10
        mov     dword [ebp-18H], eax                    ; 10BB _ 89. 45, E8
        mov     eax, dword [ebp+18H]                    ; 10BE _ 8B. 45, 18
        movsx   eax, al                                 ; 10C1 _ 0F BE. C0
        sub     esp, 8                                  ; 10C4 _ 83. EC, 08
        push    dword [ebp-18H]                         ; 10C7 _ FF. 75, E8
        push    eax                                     ; 10CA _ 50
        push    dword [ebp-2CH]                         ; 10CB _ FF. 75, D4
        push    dword [ebp-28H]                         ; 10CE _ FF. 75, D8
        push    dword [ebp+14H]                         ; 10D1 _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 10D4 _ FF. 75, 0C
        call    showString                              ; 10D7 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 10DC _ 83. C4, 20
        add     dword [ebp-2CH], 16                     ; 10DF _ 83. 45, D4, 10
        mov     eax, dword [ebp+18H]                    ; 10E3 _ 8B. 45, 18
        movsx   eax, al                                 ; 10E6 _ 0F BE. C0
        sub     esp, 8                                  ; 10E9 _ 83. EC, 08
        push    ?_090                                   ; 10EC _ 68, 00000035(d)
        push    eax                                     ; 10F1 _ 50
        push    dword [ebp-2CH]                         ; 10F2 _ FF. 75, D4
        push    dword [ebp-30H]                         ; 10F5 _ FF. 75, D0
        push    dword [ebp+14H]                         ; 10F8 _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 10FB _ FF. 75, 0C
        call    showString                              ; 10FE _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1103 _ 83. C4, 20
        mov     eax, dword [ebp+8H]                     ; 1106 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 1109 _ 8B. 40, 08
        sub     esp, 12                                 ; 110C _ 83. EC, 0C
        push    eax                                     ; 110F _ 50
        call    intToHexStr                             ; 1110 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1115 _ 83. C4, 10
        mov     dword [ebp-14H], eax                    ; 1118 _ 89. 45, EC
        mov     eax, dword [ebp+18H]                    ; 111B _ 8B. 45, 18
        movsx   eax, al                                 ; 111E _ 0F BE. C0
        sub     esp, 8                                  ; 1121 _ 83. EC, 08
        push    dword [ebp-14H]                         ; 1124 _ FF. 75, EC
        push    eax                                     ; 1127 _ 50
        push    dword [ebp-2CH]                         ; 1128 _ FF. 75, D4
        push    dword [ebp-28H]                         ; 112B _ FF. 75, D8
        push    dword [ebp+14H]                         ; 112E _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 1131 _ FF. 75, 0C
        call    showString                              ; 1134 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1139 _ 83. C4, 20
        add     dword [ebp-2CH], 16                     ; 113C _ 83. 45, D4, 10
        mov     eax, dword [ebp+18H]                    ; 1140 _ 8B. 45, 18
        movsx   eax, al                                 ; 1143 _ 0F BE. C0
        sub     esp, 8                                  ; 1146 _ 83. EC, 08
        push    ?_091                                   ; 1149 _ 68, 00000041(d)
        push    eax                                     ; 114E _ 50
        push    dword [ebp-2CH]                         ; 114F _ FF. 75, D4
        push    dword [ebp-30H]                         ; 1152 _ FF. 75, D0
        push    dword [ebp+14H]                         ; 1155 _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 1158 _ FF. 75, 0C
        call    showString                              ; 115B _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1160 _ 83. C4, 20
        mov     eax, dword [ebp+8H]                     ; 1163 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1166 _ 8B. 40, 0C
        sub     esp, 12                                 ; 1169 _ 83. EC, 0C
        push    eax                                     ; 116C _ 50
        call    intToHexStr                             ; 116D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1172 _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 1175 _ 89. 45, F0
        mov     eax, dword [ebp+18H]                    ; 1178 _ 8B. 45, 18
        movsx   eax, al                                 ; 117B _ 0F BE. C0
        sub     esp, 8                                  ; 117E _ 83. EC, 08
        push    dword [ebp-10H]                         ; 1181 _ FF. 75, F0
        push    eax                                     ; 1184 _ 50
        push    dword [ebp-2CH]                         ; 1185 _ FF. 75, D4
        push    dword [ebp-28H]                         ; 1188 _ FF. 75, D8
        push    dword [ebp+14H]                         ; 118B _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 118E _ FF. 75, 0C
        call    showString                              ; 1191 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1196 _ 83. C4, 20
        add     dword [ebp-2CH], 16                     ; 1199 _ 83. 45, D4, 10
        mov     eax, dword [ebp+18H]                    ; 119D _ 8B. 45, 18
        movsx   eax, al                                 ; 11A0 _ 0F BE. C0
        sub     esp, 8                                  ; 11A3 _ 83. EC, 08
        push    ?_092                                   ; 11A6 _ 68, 0000004E(d)
        push    eax                                     ; 11AB _ 50
        push    dword [ebp-2CH]                         ; 11AC _ FF. 75, D4
        push    dword [ebp-30H]                         ; 11AF _ FF. 75, D0
        push    dword [ebp+14H]                         ; 11B2 _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 11B5 _ FF. 75, 0C
        call    showString                              ; 11B8 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 11BD _ 83. C4, 20
        mov     eax, dword [ebp+8H]                     ; 11C0 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 11C3 _ 8B. 40, 10
        sub     esp, 12                                 ; 11C6 _ 83. EC, 0C
        push    eax                                     ; 11C9 _ 50
        call    intToHexStr                             ; 11CA _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 11CF _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 11D2 _ 89. 45, F4
        mov     eax, dword [ebp+18H]                    ; 11D5 _ 8B. 45, 18
        movsx   eax, al                                 ; 11D8 _ 0F BE. C0
        sub     esp, 8                                  ; 11DB _ 83. EC, 08
        push    dword [ebp-0CH]                         ; 11DE _ FF. 75, F4
        push    eax                                     ; 11E1 _ 50
        push    dword [ebp-2CH]                         ; 11E2 _ FF. 75, D4
        push    dword [ebp-28H]                         ; 11E5 _ FF. 75, D8
        push    dword [ebp+14H]                         ; 11E8 _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 11EB _ FF. 75, 0C
        call    showString                              ; 11EE _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 11F3 _ 83. C4, 20
        nop                                             ; 11F6 _ 90
        leave                                           ; 11F7 _ C9
        ret                                             ; 11F8 _ C3
; showMemoryInfo End of function

memman_init:; Function begin
        push    ebp                                     ; 11F9 _ 55
        mov     ebp, esp                                ; 11FA _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 11FC _ 8B. 45, 08
        mov     dword [eax], 0                          ; 11FF _ C7. 00, 00000000
        mov     eax, dword [ebp+8H]                     ; 1205 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 1208 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 120F _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 1212 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 1219 _ 8B. 45, 08
        mov     dword [eax+0CH], 0                      ; 121C _ C7. 40, 0C, 00000000
        nop                                             ; 1223 _ 90
        pop     ebp                                     ; 1224 _ 5D
        ret                                             ; 1225 _ C3
; memman_init End of function

memman_total:; Function begin
        push    ebp                                     ; 1226 _ 55
        mov     ebp, esp                                ; 1227 _ 89. E5
        sub     esp, 16                                 ; 1229 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 122C _ C7. 45, FC, 00000000
        mov     dword [ebp-8H], 0                       ; 1233 _ C7. 45, F8, 00000000
        jmp     ?_063                                   ; 123A _ EB, 14

?_062:  mov     eax, dword [ebp+8H]                     ; 123C _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 123F _ 8B. 55, F8
        add     edx, 2                                  ; 1242 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 1245 _ 8B. 44 D0, 04
        add     dword [ebp-4H], eax                     ; 1249 _ 01. 45, FC
        add     dword [ebp-8H], 1                       ; 124C _ 83. 45, F8, 01
?_063:  mov     eax, dword [ebp+8H]                     ; 1250 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1253 _ 8B. 00
        cmp     dword [ebp-8H], eax                     ; 1255 _ 39. 45, F8
        jc      ?_062                                   ; 1258 _ 72, E2
        mov     eax, dword [ebp-4H]                     ; 125A _ 8B. 45, FC
        leave                                           ; 125D _ C9
        ret                                             ; 125E _ C3
; memman_total End of function

memman_alloc:; Function begin
        push    ebp                                     ; 125F _ 55
        mov     ebp, esp                                ; 1260 _ 89. E5
        sub     esp, 16                                 ; 1262 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 1265 _ C7. 45, F8, 00000000
        jmp     ?_067                                   ; 126C _ EB, 67

?_064:  mov     eax, dword [ebp+8H]                     ; 126E _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1271 _ 8B. 55, F8
        add     edx, 2                                  ; 1274 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 1277 _ 8B. 44 D0, 04
        cmp     dword [ebp+0CH], eax                    ; 127B _ 39. 45, 0C
        ja      ?_066                                   ; 127E _ 77, 51
        mov     eax, dword [ebp+8H]                     ; 1280 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1283 _ 8B. 55, F8
        add     edx, 2                                  ; 1286 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 1289 _ 8B. 04 D0
        mov     dword [ebp-4H], eax                     ; 128C _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 128F _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1292 _ 8B. 55, F8
        add     edx, 2                                  ; 1295 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 1298 _ 8B. 44 D0, 04
        sub     eax, dword [ebp+0CH]                    ; 129C _ 2B. 45, 0C
        mov     edx, eax                                ; 129F _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 12A1 _ 8B. 45, 08
        mov     ecx, dword [ebp-8H]                     ; 12A4 _ 8B. 4D, F8
        add     ecx, 2                                  ; 12A7 _ 83. C1, 02
        mov     dword [eax+ecx*8+4H], edx               ; 12AA _ 89. 54 C8, 04
        mov     eax, dword [ebp+8H]                     ; 12AE _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 12B1 _ 8B. 55, F8
        add     edx, 2                                  ; 12B4 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 12B7 _ 8B. 44 D0, 04
        test    eax, eax                                ; 12BB _ 85. C0
        jnz     ?_065                                   ; 12BD _ 75, 0D
        mov     eax, dword [ebp+8H]                     ; 12BF _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 12C2 _ 8B. 00
        lea     edx, [eax-1H]                           ; 12C4 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 12C7 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 12CA _ 89. 10
?_065:  mov     eax, dword [ebp-4H]                     ; 12CC _ 8B. 45, FC
        jmp     ?_068                                   ; 12CF _ EB, 13

?_066:  add     dword [ebp-8H], 1                       ; 12D1 _ 83. 45, F8, 01
?_067:  mov     eax, dword [ebp+8H]                     ; 12D5 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 12D8 _ 8B. 00
        cmp     dword [ebp-8H], eax                     ; 12DA _ 39. 45, F8
        jc      ?_064                                   ; 12DD _ 72, 8F
        mov     eax, 0                                  ; 12DF _ B8, 00000000
?_068:  leave                                           ; 12E4 _ C9
        ret                                             ; 12E5 _ C3
; memman_alloc End of function

memman_free:; Function begin
        push    ebp                                     ; 12E6 _ 55
        mov     ebp, esp                                ; 12E7 _ 89. E5
        push    ebx                                     ; 12E9 _ 53
        sub     esp, 16                                 ; 12EA _ 83. EC, 10
        mov     dword [ebp-0CH], 0                      ; 12ED _ C7. 45, F4, 00000000
        jmp     ?_070                                   ; 12F4 _ EB, 15

?_069:  mov     eax, dword [ebp+8H]                     ; 12F6 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 12F9 _ 8B. 55, F4
        add     edx, 2                                  ; 12FC _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 12FF _ 8B. 04 D0
        cmp     dword [ebp+0CH], eax                    ; 1302 _ 39. 45, 0C
        jc      ?_071                                   ; 1305 _ 72, 10
        add     dword [ebp-0CH], 1                      ; 1307 _ 83. 45, F4, 01
?_070:  mov     eax, dword [ebp+8H]                     ; 130B _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 130E _ 8B. 00
        cmp     dword [ebp-0CH], eax                    ; 1310 _ 39. 45, F4
        jl      ?_069                                   ; 1313 _ 7C, E1
        jmp     ?_072                                   ; 1315 _ EB, 01

?_071:  nop                                             ; 1317 _ 90
?_072:  cmp     dword [ebp-0CH], 0                      ; 1318 _ 83. 7D, F4, 00
        jle     ?_074                                   ; 131C _ 0F 8E, 000000B9
        mov     eax, dword [ebp-0CH]                    ; 1322 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1325 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1328 _ 8B. 45, 08
        add     edx, 2                                  ; 132B _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 132E _ 8B. 14 D0
        mov     eax, dword [ebp-0CH]                    ; 1331 _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 1334 _ 8D. 48, FF
        mov     eax, dword [ebp+8H]                     ; 1337 _ 8B. 45, 08
        add     ecx, 2                                  ; 133A _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 133D _ 8B. 44 C8, 04
        add     eax, edx                                ; 1341 _ 01. D0
        cmp     dword [ebp+0CH], eax                    ; 1343 _ 39. 45, 0C
        jne     ?_074                                   ; 1346 _ 0F 85, 0000008F
        mov     eax, dword [ebp-0CH]                    ; 134C _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 134F _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1352 _ 8B. 45, 08
        add     edx, 2                                  ; 1355 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 1358 _ 8B. 54 D0, 04
        mov     eax, dword [ebp-0CH]                    ; 135C _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 135F _ 8D. 58, FF
        mov     eax, dword [ebp+10H]                    ; 1362 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 1365 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1368 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 136B _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 136E _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 1372 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1375 _ 8B. 00
        test    eax, eax                                ; 1377 _ 85. C0
        jle     ?_073                                   ; 1379 _ 7E, 56
        mov     edx, dword [ebp+0CH]                    ; 137B _ 8B. 55, 0C
        mov     eax, dword [ebp+10H]                    ; 137E _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 1381 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1384 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1387 _ 8B. 55, F4
        add     edx, 2                                  ; 138A _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 138D _ 8B. 04 D0
        cmp     ecx, eax                                ; 1390 _ 39. C1
        jnz     ?_073                                   ; 1392 _ 75, 3D
        mov     eax, dword [ebp-0CH]                    ; 1394 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1397 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 139A _ 8B. 45, 08
        add     edx, 2                                  ; 139D _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 13A0 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+8H]                     ; 13A4 _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 13A7 _ 8B. 4D, F4
        add     ecx, 2                                  ; 13AA _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 13AD _ 8B. 44 C8, 04
        mov     ecx, dword [ebp-0CH]                    ; 13B1 _ 8B. 4D, F4
        lea     ebx, [ecx-1H]                           ; 13B4 _ 8D. 59, FF
        lea     ecx, [edx+eax]                          ; 13B7 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 13BA _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 13BD _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 13C0 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 13C4 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 13C7 _ 8B. 00
        lea     edx, [eax-1H]                           ; 13C9 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 13CC _ 8B. 45, 08
        mov     dword [eax], edx                        ; 13CF _ 89. 10
?_073:  mov     eax, 0                                  ; 13D1 _ B8, 00000000
        jmp     ?_080                                   ; 13D6 _ E9, 0000011B

?_074:  mov     eax, dword [ebp+8H]                     ; 13DB _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 13DE _ 8B. 00
        test    eax, eax                                ; 13E0 _ 85. C0
        jle     ?_075                                   ; 13E2 _ 7E, 52
        mov     edx, dword [ebp+0CH]                    ; 13E4 _ 8B. 55, 0C
        mov     eax, dword [ebp+10H]                    ; 13E7 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 13EA _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 13ED _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 13F0 _ 8B. 55, F4
        add     edx, 2                                  ; 13F3 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 13F6 _ 8B. 04 D0
        cmp     ecx, eax                                ; 13F9 _ 39. C1
        jnz     ?_075                                   ; 13FB _ 75, 39
        mov     eax, dword [ebp+8H]                     ; 13FD _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1400 _ 8B. 55, F4
        add     edx, 2                                  ; 1403 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 1406 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 140A _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 140D _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1410 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1413 _ 8B. 55, F4
        add     edx, 2                                  ; 1416 _ 83. C2, 02
        mov     dword [eax+edx*8+4H], ecx               ; 1419 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 141D _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1420 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 1423 _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 1426 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 1429 _ 89. 14 C8
        mov     eax, 0                                  ; 142C _ B8, 00000000
        jmp     ?_080                                   ; 1431 _ E9, 000000C0

?_075:  mov     eax, dword [ebp+8H]                     ; 1436 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1439 _ 8B. 00
        cmp     eax, 4095                               ; 143B _ 3D, 00000FFF
        jg      ?_079                                   ; 1440 _ 0F 8F, 00000087
        mov     eax, dword [ebp+8H]                     ; 1446 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1449 _ 8B. 00
        lea     edx, [eax+1H]                           ; 144B _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 144E _ 8B. 45, 08
        mov     dword [eax], edx                        ; 1451 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 1453 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1456 _ 8B. 00
        mov     dword [ebp-8H], eax                     ; 1458 _ 89. 45, F8
        jmp     ?_077                                   ; 145B _ EB, 28

?_076:  mov     eax, dword [ebp-8H]                     ; 145D _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 1460 _ 8D. 50, FF
        mov     ecx, dword [ebp+8H]                     ; 1463 _ 8B. 4D, 08
        mov     eax, dword [ebp-8H]                     ; 1466 _ 8B. 45, F8
        lea     ebx, [eax+2H]                           ; 1469 _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 146C _ 8B. 45, 08
        add     edx, 2                                  ; 146F _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 1472 _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 1475 _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 1477 _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 147A _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 147D _ 89. 54 D9, 04
        sub     dword [ebp-8H], 1                       ; 1481 _ 83. 6D, F8, 01
?_077:  mov     eax, dword [ebp-8H]                     ; 1485 _ 8B. 45, F8
        cmp     eax, dword [ebp-0CH]                    ; 1488 _ 3B. 45, F4
        jg      ?_076                                   ; 148B _ 7F, D0
        mov     eax, dword [ebp+8H]                     ; 148D _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1490 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1493 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1496 _ 8B. 00
        cmp     edx, eax                                ; 1498 _ 39. C2
        jge     ?_078                                   ; 149A _ 7D, 0B
        mov     eax, dword [ebp+8H]                     ; 149C _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 149F _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 14A1 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 14A4 _ 89. 50, 04
?_078:  mov     eax, dword [ebp+8H]                     ; 14A7 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 14AA _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 14AD _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 14B0 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 14B3 _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 14B6 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 14B9 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 14BC _ 8D. 4A, 02
        mov     edx, dword [ebp+10H]                    ; 14BF _ 8B. 55, 10
        mov     dword [eax+ecx*8+4H], edx               ; 14C2 _ 89. 54 C8, 04
        mov     eax, 0                                  ; 14C6 _ B8, 00000000
        jmp     ?_080                                   ; 14CB _ EB, 29

?_079:  mov     eax, dword [ebp+8H]                     ; 14CD _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 14D0 _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 14D3 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 14D6 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 14D9 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 14DC _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 14DF _ 8B. 40, 08
        mov     edx, eax                                ; 14E2 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 14E4 _ 8B. 45, 10
        add     eax, edx                                ; 14E7 _ 01. D0
        mov     edx, eax                                ; 14E9 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 14EB _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 14EE _ 89. 50, 08
        mov     eax, 4294967295                         ; 14F1 _ B8, FFFFFFFF
?_080:  add     esp, 16                                 ; 14F6 _ 83. C4, 10
        pop     ebx                                     ; 14F9 _ 5B
        pop     ebp                                     ; 14FA _ 5D
        ret                                             ; 14FB _ C3
; memman_free End of function

memman_alloc_4k:; Function begin
        push    ebp                                     ; 14FC _ 55
        mov     ebp, esp                                ; 14FD _ 89. E5
        sub     esp, 16                                 ; 14FF _ 83. EC, 10
        mov     eax, dword [ebp+0CH]                    ; 1502 _ 8B. 45, 0C
        add     eax, 4095                               ; 1505 _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 150A _ 25, FFFFF000
        mov     dword [ebp+0CH], eax                    ; 150F _ 89. 45, 0C
        push    dword [ebp+0CH]                         ; 1512 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1515 _ FF. 75, 08
        call    memman_alloc                            ; 1518 _ E8, FFFFFFFC(rel)
        add     esp, 8                                  ; 151D _ 83. C4, 08
        mov     dword [ebp-4H], eax                     ; 1520 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 1523 _ 8B. 45, FC
        leave                                           ; 1526 _ C9
        ret                                             ; 1527 _ C3
; memman_alloc_4k End of function

shtctl_init:; Function begin
        push    ebp                                     ; 1528 _ 55
        mov     ebp, esp                                ; 1529 _ 89. E5
        sub     esp, 24                                 ; 152B _ 83. EC, 18
        sub     esp, 8                                  ; 152E _ 83. EC, 08
        push    9232                                    ; 1531 _ 68, 00002410
        push    dword [ebp+8H]                          ; 1536 _ FF. 75, 08
        call    memman_alloc_4k                         ; 1539 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 153E _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 1541 _ 89. 45, F4
        cmp     dword [ebp-0CH], 0                      ; 1544 _ 83. 7D, F4, 00
        jnz     ?_081                                   ; 1548 _ 75, 07
        mov     eax, 0                                  ; 154A _ B8, 00000000
        jmp     ?_084                                   ; 154F _ EB, 54

?_081:  mov     eax, dword [ebp-0CH]                    ; 1551 _ 8B. 45, F4
        mov     edx, dword [ebp+0CH]                    ; 1554 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 1557 _ 89. 10
        mov     eax, dword [ebp-0CH]                    ; 1559 _ 8B. 45, F4
        mov     edx, dword [ebp+10H]                    ; 155C _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 155F _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 1562 _ 8B. 45, F4
        mov     edx, dword [ebp+14H]                    ; 1565 _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 1568 _ 89. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 156B _ 8B. 45, F4
        mov     dword [eax+0CH], -1                     ; 156E _ C7. 40, 0C, FFFFFFFF
        mov     dword [ebp-10H], 0                      ; 1575 _ C7. 45, F0, 00000000
        jmp     ?_083                                   ; 157C _ EB, 1B

?_082:  mov     eax, dword [ebp-0CH]                    ; 157E _ 8B. 45, F4
        mov     edx, dword [ebp-10H]                    ; 1581 _ 8B. 55, F0
        add     edx, 33                                 ; 1584 _ 83. C2, 21
        shl     edx, 5                                  ; 1587 _ C1. E2, 05
        add     eax, edx                                ; 158A _ 01. D0
        add     eax, 12                                 ; 158C _ 83. C0, 0C
        mov     dword [eax], 0                          ; 158F _ C7. 00, 00000000
        add     dword [ebp-10H], 1                      ; 1595 _ 83. 45, F0, 01
?_083:  cmp     dword [ebp-10H], 255                    ; 1599 _ 81. 7D, F0, 000000FF
        jle     ?_082                                   ; 15A0 _ 7E, DC
        mov     eax, dword [ebp-0CH]                    ; 15A2 _ 8B. 45, F4
?_084:  leave                                           ; 15A5 _ C9
        ret                                             ; 15A6 _ C3
; shtctl_init End of function

sheet_alloc:; Function begin
        push    ebp                                     ; 15A7 _ 55
        mov     ebp, esp                                ; 15A8 _ 89. E5
        nop                                             ; 15AA _ 90
        pop     ebp                                     ; 15AB _ 5D
        ret                                             ; 15AC _ C3
; sheet_alloc End of function

sheet_setbuf:; Function begin
        push    ebp                                     ; 15AD _ 55
        mov     ebp, esp                                ; 15AE _ 89. E5
        nop                                             ; 15B0 _ 90
        pop     ebp                                     ; 15B1 _ 5D
        ret                                             ; 15B2 _ C3
; sheet_setbuf End of function

sheet_updown:; Function begin
        push    ebp                                     ; 15B3 _ 55
        mov     ebp, esp                                ; 15B4 _ 89. E5
        sub     esp, 16                                 ; 15B6 _ 83. EC, 10
        mov     eax, dword [ebp+0CH]                    ; 15B9 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 15BC _ 8B. 40, 18
        mov     dword [ebp-4H], eax                     ; 15BF _ 89. 45, FC
        nop                                             ; 15C2 _ 90
        leave                                           ; 15C3 _ C9
        ret                                             ; 15C4 _ C3
; sheet_updown End of function

sheet_refresh:; Function begin
        push    ebp                                     ; 15C5 _ 55
        mov     ebp, esp                                ; 15C6 _ 89. E5
        nop                                             ; 15C8 _ 90
        pop     ebp                                     ; 15C9 _ 5D
        ret                                             ; 15CA _ C3
; sheet_refresh End of function

sheet_slide:; Function begin
        push    ebp                                     ; 15CB _ 55
        mov     ebp, esp                                ; 15CC _ 89. E5
        nop                                             ; 15CE _ 90
        pop     ebp                                     ; 15CF _ 5D
        ret                                             ; 15D0 _ C3
; sheet_slide End of function


SECTION .rodata align=1 noexecute                       ; section number 2, const

?_085:                                                  ; byte
        db 74H, 6FH, 74H, 61H, 6CH, 20H, 6DH, 65H       ; 0000 _ total me
        db 6DH, 20H, 69H, 73H, 3AH, 20H, 00H            ; 0008 _ m is: .

?_086:                                                  ; byte
        db 20H, 4DH, 42H, 00H                           ; 000F _  MB.

?_087:                                                  ; byte
        db 70H, 61H, 67H, 65H, 20H, 69H, 73H, 3AH       ; 0013 _ page is:
        db 20H, 00H                                     ; 001B _  .

?_088:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 001D _ BaseAddr
        db 4CH, 3AH, 20H, 00H                           ; 0025 _ L: .

?_089:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0029 _ BaseAddr
        db 48H, 3AH, 20H, 00H                           ; 0031 _ H: .

?_090:                                                  ; byte
        db 4CH, 65H, 6EH, 67H, 74H, 68H, 4CH, 6FH       ; 0035 _ LengthLo
        db 77H, 3AH, 20H, 00H                           ; 003D _ w: .

?_091:                                                  ; byte
        db 4CH, 65H, 6EH, 67H, 74H, 68H, 48H, 69H       ; 0041 _ LengthHi
        db 67H, 68H, 3AH, 20H, 00H                      ; 0049 _ gh: .

?_092:                                                  ; byte
        db 54H, 79H, 70H, 65H, 3AH, 20H, 00H            ; 004E _ Type: .


SECTION .data   align=32 noexecute                      ; section number 3, data

keyval:                                                 ; byte
        db 30H, 78H                                     ; 0000 _ 0x

?_093:  db 00H                                          ; 0002 _ .

?_094:  db 00H, 00H, 00H, 00H, 00H                      ; 0003 _ .....

memman: dd 00100000H, 00000000H                         ; 0008 _ 1048576 0 
        dd 00000000H, 00000000H                         ; 0010 _ 0 0 
        dd 00000000H, 00000000H                         ; 0018 _ 0 0 

table_rgb.1600:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 00H, 0FFH     ; 0020 _ ........
        db 00H, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH   ; 0028 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0030 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0038 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 0040 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 0048 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0050 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0058 _ ........

cursor.1658:                                            ; byte
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


SECTION .bss    align=32 noexecute                      ; section number 4, bss

mcursor:                                                ; byte
        resb    256                                     ; 0000

bootInfo:                                               ; qword
        resb    4                                       ; 0100

?_095:  resw    1                                       ; 0104

?_096:  resw    1                                       ; 0106

mouseinfo:                                              ; byte
        resb    24                                      ; 0108

keyinfo:                                                ; byte
        resb    32                                      ; 0120

mousebuf:                                               ; byte
        resb    128                                     ; 0140

keybuf:                                                 ; yword
        resb    32                                      ; 01C0

mdec:                                                   ; oword
        resb    16                                      ; 01E0

mx:     resd    1                                       ; 01F0

my:     resd    1                                       ; 01F4

showPos.1591:                                           ; dword
        resd    1                                       ; 01F8

str.1705:                                               ; byte
        resb    1                                       ; 01FC

?_097:  resb    9                                       ; 01FD

?_098:  resb    1                                       ; 0206


