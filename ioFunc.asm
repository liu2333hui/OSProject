io_in8:
	mov edx, [esp + 4]
	mov eax, 0
	in al, dx
	ret

io_in16:
	mov edx, [esp + 4]
	mov eax, 0
	in ax, dx
	ret

io_in32:
	mov edx, [esp + 4]
	in eax, dx
	ret

io_out8:
	mov edx, [esp+4]	
	mov al, [esp + 8]
	out dx, al
	ret

io_out16:
	mov edx, [esp + 4]
	mov eax, [esp + 8]
	out dx, ax
	ret

io_out32:
	mov edx, [esp + 4]
	mov eax, [esp + 8]
	out dx, eax
	ret

io_cli:
	CLI
	ret

io_sti:
	STI
	ret

io_load_eflags:
	pushfd        ;push EFLAGS into stack
	pop eax       ;pop EFLAGS into eax
	ret

io_store_eflags:
	mov eax, [esp + 4]
	push eax       ;push eax input into stack
	popfd          ;pop into EFLAGS 
	ret

show_char:
	mov ah, 0Ch
	mov al, 'U'
	mov [gs:(80*0 + 67)*2], ax
	ret
