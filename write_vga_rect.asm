; Disassembly of file: write_vga_rect.o
; Mon Apr 20 13:02:38 2020
; Mode: 32 bits
; Syntax: YASM/NASM
; Instruction set: 80386
CMain:  ; Function begin
        push    ebp                                     ; 0000 _ 55
        mov     ebp, esp                                ; 0001 _ 89. E5
        sub     esp, 24                                 ; 0003 _ 83. EC, 18
        mov     dword [ebp-0CH], 655360                 ; 0006 _ C7. 45, F4, 000A0000
        call    init_palette                            ; 000D _ E8, FFFFFFFC(rel)
        sub     esp, 4                                  ; 0012 _ 83. EC, 04
        push    120                                     ; 0015 _ 6A, 78
        push    120                                     ; 0017 _ 6A, 78
        push    20                                      ; 0019 _ 6A, 14
        push    20                                      ; 001B _ 6A, 14
        push    1                                       ; 001D _ 6A, 01
        push    320                                     ; 001F _ 68, 00000140
        push    dword [ebp-0CH]                         ; 0024 _ FF. 75, F4
        call    boxfill8                                ; 0027 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 002C _ 83. C4, 20
        sub     esp, 4                                  ; 002F _ 83. EC, 04
        push    150                                     ; 0032 _ 68, 00000096
        push    170                                     ; 0037 _ 68, 000000AA
        push    50                                      ; 003C _ 6A, 32
        push    70                                      ; 003E _ 6A, 46
        push    2                                       ; 0040 _ 6A, 02
        push    320                                     ; 0042 _ 68, 00000140
        push    dword [ebp-0CH]                         ; 0047 _ FF. 75, F4
        call    boxfill8                                ; 004A _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 004F _ 83. C4, 20
        sub     esp, 4                                  ; 0052 _ 83. EC, 04
        push    180                                     ; 0055 _ 68, 000000B4
        push    220                                     ; 005A _ 68, 000000DC
        push    80                                      ; 005F _ 6A, 50
        push    120                                     ; 0061 _ 6A, 78
        push    4                                       ; 0063 _ 6A, 04
        push    320                                     ; 0065 _ 68, 00000140
        push    dword [ebp-0CH]                         ; 006A _ FF. 75, F4
        call    boxfill8                                ; 006D _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0072 _ 83. C4, 20
?_001:  call    io_hlt                                  ; 0075 _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 007A _ EB, F9
; CMain End of function

init_palette:; Function begin
        push    ebp                                     ; 007C _ 55
        mov     ebp, esp                                ; 007D _ 89. E5
        sub     esp, 8                                  ; 007F _ 83. EC, 08
        sub     esp, 4                                  ; 0082 _ 83. EC, 04
        push    table_rgb.1445                          ; 0085 _ 68, 00000000(d)
        push    15                                      ; 008A _ 6A, 0F
        push    0                                       ; 008C _ 6A, 00
        call    set_palette                             ; 008E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0093 _ 83. C4, 10
        nop                                             ; 0096 _ 90
        leave                                           ; 0097 _ C9
        ret                                             ; 0098 _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 0099 _ 55
        mov     ebp, esp                                ; 009A _ 89. E5
        sub     esp, 24                                 ; 009C _ 83. EC, 18
        call    io_load_eflags                          ; 009F _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 00A4 _ 89. 45, F4
        call    io_cli                                  ; 00A7 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 00AC _ 83. EC, 08
        push    dword [ebp+8H]                          ; 00AF _ FF. 75, 08
        push    968                                     ; 00B2 _ 68, 000003C8
        call    io_out8                                 ; 00B7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00BC _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 00BF _ 8B. 45, 08
        mov     dword [ebp-10H], eax                    ; 00C2 _ 89. 45, F0
        jmp     ?_003                                   ; 00C5 _ EB, 5C

?_002:  mov     eax, dword [ebp+10H]                    ; 00C7 _ 8B. 45, 10
        movzx   eax, byte [eax]                         ; 00CA _ 0F B6. 00
        movzx   eax, al                                 ; 00CD _ 0F B6. C0
        sub     esp, 8                                  ; 00D0 _ 83. EC, 08
        push    eax                                     ; 00D3 _ 50
        push    969                                     ; 00D4 _ 68, 000003C9
        call    io_out8                                 ; 00D9 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00DE _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 00E1 _ 8B. 45, 10
        add     eax, 1                                  ; 00E4 _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 00E7 _ 0F B6. 00
        movzx   eax, al                                 ; 00EA _ 0F B6. C0
        sub     esp, 8                                  ; 00ED _ 83. EC, 08
        push    eax                                     ; 00F0 _ 50
        push    969                                     ; 00F1 _ 68, 000003C9
        call    io_out8                                 ; 00F6 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00FB _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 00FE _ 8B. 45, 10
        add     eax, 2                                  ; 0101 _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 0104 _ 0F B6. 00
        movzx   eax, al                                 ; 0107 _ 0F B6. C0
        sub     esp, 8                                  ; 010A _ 83. EC, 08
        push    eax                                     ; 010D _ 50
        push    969                                     ; 010E _ 68, 000003C9
        call    io_out8                                 ; 0113 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0118 _ 83. C4, 10
        add     dword [ebp+10H], 3                      ; 011B _ 83. 45, 10, 03
        add     dword [ebp-10H], 1                      ; 011F _ 83. 45, F0, 01
?_003:  mov     eax, dword [ebp-10H]                    ; 0123 _ 8B. 45, F0
        cmp     eax, dword [ebp+0CH]                    ; 0126 _ 3B. 45, 0C
        jle     ?_002                                   ; 0129 _ 7E, 9C
        sub     esp, 12                                 ; 012B _ 83. EC, 0C
        push    dword [ebp-0CH]                         ; 012E _ FF. 75, F4
        call    io_store_eflags                         ; 0131 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0136 _ 83. C4, 10
        nop                                             ; 0139 _ 90
        leave                                           ; 013A _ C9
        ret                                             ; 013B _ C3
; set_palette End of function

boxfill8:; Function begin
        push    ebp                                     ; 013C _ 55
        mov     ebp, esp                                ; 013D _ 89. E5
        sub     esp, 20                                 ; 013F _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 0142 _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 0145 _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 0148 _ 8B. 45, 18
        mov     dword [ebp-4H], eax                     ; 014B _ 89. 45, FC
        jmp     ?_007                                   ; 014E _ EB, 33

?_004:  mov     eax, dword [ebp+14H]                    ; 0150 _ 8B. 45, 14
        mov     dword [ebp-8H], eax                     ; 0153 _ 89. 45, F8
        jmp     ?_006                                   ; 0156 _ EB, 1F

?_005:  mov     eax, dword [ebp-4H]                     ; 0158 _ 8B. 45, FC
        imul    eax, dword [ebp+0CH]                    ; 015B _ 0F AF. 45, 0C
        mov     edx, eax                                ; 015F _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0161 _ 8B. 45, F8
        add     eax, edx                                ; 0164 _ 01. D0
        mov     edx, eax                                ; 0166 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0168 _ 8B. 45, 08
        add     edx, eax                                ; 016B _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 016D _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0171 _ 88. 02
        add     dword [ebp-8H], 1                       ; 0173 _ 83. 45, F8, 01
?_006:  mov     eax, dword [ebp-8H]                     ; 0177 _ 8B. 45, F8
        cmp     eax, dword [ebp+1CH]                    ; 017A _ 3B. 45, 1C
        jle     ?_005                                   ; 017D _ 7E, D9
        add     dword [ebp-4H], 1                       ; 017F _ 83. 45, FC, 01
?_007:  mov     eax, dword [ebp-4H]                     ; 0183 _ 8B. 45, FC
        cmp     eax, dword [ebp+20H]                    ; 0186 _ 3B. 45, 20
        jle     ?_004                                   ; 0189 _ 7E, C5
        nop                                             ; 018B _ 90
        leave                                           ; 018C _ C9
        ret                                             ; 018D _ C3
; boxfill8 End of function


;SECTION .data   align=32 noexecute                      ; section number 2, data

table_rgb.1445:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 00H, 0FFH     ; 0000 _ ........
        db 00H, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH   ; 0008 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0010 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0018 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 0020 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 0028 _ ........



