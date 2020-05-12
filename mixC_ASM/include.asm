;assembly code 

[SECTION .data]
msg:
	db "asm hello",0h

[SECTION .text]
global asmCode




asmCode:

	mov edx, 10
	mov ecx, msg	
	mov ebx, 1
	mov eax, 4	
	int 80h
	ret

