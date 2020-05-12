; Disassembly of file: bar.o
; Sat Apr 18 21:18:33 2020
; Mode: 32 bits
; Syntax: YASM/NASM
; Instruction set: 80386


;global bar_func: function

;extern foo_print                                        ; near


SECTION .text   align=1 execute                         ; section number 1, code

bar_func:; Function begin
        push    ebp                                     ; 0000 _ 55
        mov     ebp, esp                                ; 0001 _ 89. E5
        sub     esp, 24                                 ; 0003 _ 83. EC, 18
        mov     eax, dword [ebp+8H]                     ; 0006 _ 8B. 45, 08
        cmp     eax, dword [ebp+0CH]                    ; 0009 _ 3B. 45, 0C
        jle     ?_001                                   ; 000C _ 7E, 09
        mov     dword [ebp-14H], ?_005                  ; 000E _ C7. 45, EC, 00000000(d)
        jmp     ?_002                                   ; 0015 _ EB, 07

?_001:  mov     dword [ebp-14H], ?_006                  ; 0017 _ C7. 45, EC, 0000000D(d)
?_002:  mov     dword [ebp-10H], 0                      ; 001E _ C7. 45, F0, 00000000
        mov     eax, dword [ebp-14H]                    ; 0025 _ 8B. 45, EC
        mov     dword [ebp-0CH], eax                    ; 0028 _ 89. 45, F4
        jmp     ?_004                                   ; 002B _ EB, 08

?_003:  add     dword [ebp-10H], 1                      ; 002D _ 83. 45, F0, 01
        add     dword [ebp-0CH], 1                      ; 0031 _ 83. 45, F4, 01
?_004:  mov     eax, dword [ebp-0CH]                    ; 0035 _ 8B. 45, F4
        movzx   eax, byte [eax]                         ; 0038 _ 0F B6. 00
        test    al, al                                  ; 003B _ 84. C0
        jnz     ?_003                                   ; 003D _ 75, EE
        sub     esp, 8                                  ; 003F _ 83. EC, 08
        push    dword [ebp-10H]                         ; 0042 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 0045 _ FF. 75, EC
        call    foo_print                               ; 0048 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 004D _ 83. C4, 10
        nop                                             ; 0050 _ 90
        leave                                           ; 0051 _ C9
        ret                                             ; 0052 _ C3
; bar_func End of function


SECTION .data   align=1 noexecute                       ; section number 2, data


SECTION .bss    align=1 noexecute                       ; section number 3, bss


SECTION .rodata align=1 noexecute                       ; section number 4, const

?_005:                                                  ; byte
        db 74H, 68H, 65H, 20H, 31H, 73H, 74H, 20H       ; 0000 _ the 1st 
        db 6FH, 6EH, 65H, 0AH, 00H                      ; 0008 _ one..

?_006:                                                  ; byte
        db 74H, 68H, 65H, 20H, 32H, 6EH, 64H, 20H       ; 000D _ the 2nd 
        db 6FH, 6EH, 65H, 0AH, 00H                      ; 0015 _ one..


SECTION .eh_frame align=4 noexecute                     ; section number 5, const

        db 14H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0000 _ ........
        db 01H, 7AH, 52H, 00H, 01H, 7CH, 08H, 01H       ; 0008 _ .zR..|..
        db 1BH, 0CH, 04H, 04H, 88H, 01H, 00H, 00H       ; 0010 _ ........
        db 1CH, 00H, 00H, 00H, 1CH, 00H, 00H, 00H       ; 0018 _ ........
        dd bar_func-$-20H                               ; 0020 _ 00000000 (rel)
        dd 00000053H, 080E4100H                         ; 0024 _ 83 135151872 
        dd 0D420285H, 0C54F0205H                        ; 002C _ 222429829 -984677883 
        dd 0004040CH                                    ; 0034 _ 263180 


