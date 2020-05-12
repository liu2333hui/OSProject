global asmCode

section .data
msg: db "my string",0ah, 0h

section .text

asmCode:
	push edx
	push ecx
	push ebx
	push eax	

	mov edx, [esp + 8 + 4*4]
	mov ecx, [esp + 4 + 4*4]
	mov ebx, 1
	mov eax, 4
	int 0x80					

	pop eax
	pop ebx
	pop ecx
	pop edx
	ret
