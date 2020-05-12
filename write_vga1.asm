; Disassembly of file: write_vga1.o
; Sun Apr 19 15:47:57 2020
; Mode: 32 bits
; Syntax: YASM/NASM
; Instruction set: 80386


;global CMain: function

;extern io_hlt                                           ; near


;SECTION .text   align=1 execute                         ; section number 1, code

CMain:  ; Function begin
        push    ebp                                     ; 0000 _ 55
        mov     ebp, esp                                ; 0001 _ 89. E5
        sub     esp, 2072                               ; 0003 _ 81. EC, 00000818
; Note: Absolute memory address without relocation
        mov     eax, dword [gs:14H]                     ; 0009 _ 65: A1, 00000014
        mov     dword [ebp-0CH], eax                    ; 000F _ 89. 45, F4
        xor     eax, eax                                ; 0012 _ 31. C0
        mov     dword [ebp-814H], 0                     ; 0014 _ C7. 85, FFFFF7EC, 00000000
        mov     dword [ebp-818H], 655360                ; 001E _ C7. 85, FFFFF7E8, 000A0000
        jmp     ?_002                                   ; 0028 _ EB, 26

?_001:  mov     eax, dword [ebp-818H]                   ; 002A _ 8B. 85, FFFFF7E8
        mov     dword [ebp-814H], eax                   ; 0030 _ 89. 85, FFFFF7EC
        mov     eax, dword [ebp-818H]                   ; 0036 _ 8B. 85, FFFFF7E8
        and     eax, 0FH                                ; 003C _ 83. E0, 0F
        mov     edx, eax                                ; 003F _ 89. C2
        mov     eax, dword [ebp-814H]                   ; 0041 _ 8B. 85, FFFFF7EC
        mov     byte [eax], dl                          ; 0047 _ 88. 10
        add     dword [ebp-818H], 1                     ; 0049 _ 83. 85, FFFFF7E8, 01
?_002:  cmp     dword [ebp-818H], 720895                ; 0050 _ 81. BD, FFFFF7E8, 000AFFFF
        jle     ?_001                                   ; 005A _ 7E, CE
?_003:  call    io_hlt                                  ; 005C _ E8, FFFFFFFC(rel)
        jmp     ?_003                                   ; 0061 _ EB, F9
; CMain End of function


;SECTION .data   align=1 noexecute                       ; section number 2, data


;SECTION .bss    align=1 noexecute                       ; section number 3, bss


;SECTION .eh_frame align=4 noexecute                     ; section number 4, const

;        db 14H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0000 _ ........
;        db 01H, 7AH, 52H, 00H, 01H, 7CH, 08H, 01H       ; 0008 _ .zR..|..
;        db 1BH, 0CH, 04H, 04H, 88H, 01H, 00H, 00H       ; 0010 _ ........
;        db 18H, 00H, 00H, 00H, 1CH, 00H, 00H, 00H       ; 0018 _ ........
;        dd CMain-$-20H                                  ; 0020 _ 00000000 (rel)
;        dd 00000063H, 080E4100H                         ; 0024 _ 99 135151872 
;        dd 0D420285H, 00000005H                         ; 002C _ 222429829 5 


