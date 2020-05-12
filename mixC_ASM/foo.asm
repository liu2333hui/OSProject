;extern bar_func;

[SECTION .data]
arg1 dd 3
arg2 dd 4

[SECTION .text]
global main
;global foo_print

main:
mov eax, dword [arg1]
push eax
mov eax, dword [arg2]
push eax
call bar_func
add esp, 8       ;clear two pushed 32-bit data

mov ebx, 0
mov eax, 1
int 0x80     ;SYS_EXIT with code = 0

foo_print:
mov edx, [esp + 8]    ;address of length (last argument put on stack)
mov ecx, [esp + 4]    ;address of message to print (first argument put on stack)
mov ebx, 1
mov eax, 4
int 0x80      ;SYS_PRINT 
ret

%include "bar.asm"
