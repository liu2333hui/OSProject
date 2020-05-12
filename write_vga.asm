; Disassembly of file: write_vga.o
; Sun Apr 19 15:05:15 2020
; Mode: 32 bits
; Syntax: YASM/NASM
; Instruction set: 80386


;global CMain: function

;extern io_hlt                                           ; near


;;SECTION .text   align=1 execute                         ; section number 1, code

CMain:  ; Function begin
        push    ebp                                     ; 0000 _ 55
        mov     ebp, esp                                ; 0001 _ 89. E5
        sub     esp, 24                                 ; 0003 _ 83. EC, 18
        mov     dword [ebp-0CH], 0                      ; 0006 _ C7. 45, F4, 00000000
        mov     dword [ebp-10H], 655360                 ; 000D _ C7. 45, F0, 000A0000
        jmp     ?_002                                   ; 0014 _ EB, 17

?_001:  mov     eax, dword [ebp-10H]                    ; 0016 _ 8B. 45, F0
        mov     dword [ebp-0CH], eax                    ; 0019 _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 001C _ 8B. 45, F0
        and     eax, 0FH                                ; 001F _ 83. E0, 0F
        mov     edx, eax                                ; 0022 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 0024 _ 8B. 45, F4
        mov     byte [eax], dl                          ; 0027 _ 88. 10
        add     dword [ebp-10H], 1                      ; 0029 _ 83. 45, F0, 01
?_002:  cmp     dword [ebp-10H], 720895                 ; 002D _ 81. 7D, F0, 000AFFFF
        jle     ?_001                                   ; 0034 _ 7E, E0
?_003:  call    io_hlt                                  ; 0036 _ E8, FFFFFFFC(rel)
        jmp     ?_003                                   ; 003B _ EB, F9
; CMain End of function


;SECTION .data   align=1 noexecute                       ; section number 2, data


;SECTION .bss    align=1 noexecute                       ; section number 3, bss


;SECTION .eh_frame align=4 noexecute                     ; section number 4, const
;
;        db 14H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0000 _ ........
;        db 01H, 7AH, 52H, 00H, 01H, 7CH, 08H, 01H       ; 0008 _ .zR..|..
;        db 1BH, 0CH, 04H, 04H, 88H, 01H, 00H, 00H       ; 0010 _ ........
;        db 18H, 00H, 00H, 00H, 1CH, 00H, 00H, 00H       ; 0018 _ ........
;        dd CMain-$-20H                                  ; 0020 _ 00000000 (rel)
;        dd 0000003DH, 080E4100H                         ; 0024 _ 61 135151872 
;        dd 0D420285H, 00000005H                         ; 002C _ 222429829 5 


