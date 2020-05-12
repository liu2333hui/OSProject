_SpuriousHandler:
	SpuriousHandler equ _SpuriousHandler - $$
	push es
	push ds
	pushad
	mov eax, esp
	push eax

	call intHandlerFromC
	
	pop eax
	mov esp, eax
	popad
	pop ds
	pop es

	sti	

	iretd

_MouseHandler:
	MouseHandler equ _MouseHandler - $$
	push es
	push ds
	pushad
	mov eax, esp
	push eax

	call intHandlerFromMouse
	
	pop eax
	mov esp, eax
	popad
	pop ds
	pop es

	sti	

	iretd

_KeyboardHandler:
	KeyboardHandler equ _KeyboardHandler - $$
	push es
	push ds
	pushad
	mov eax, esp
	push eax

	call intHandlerFromC
	
	pop eax
	mov esp, eax
	popad
	pop ds
	pop es

	sti	

	iretd


