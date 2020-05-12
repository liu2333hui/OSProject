init8259A:
	;in ICW mode (initilization control word)
	
	;main ICW1
	;ICW[4] = 1 must
	;ICW[0] = 1 for ICW4
	mov al, 011h
	out 02h, al   ;is this 20h or 02h???
	call io_delay

	;follow ICW1
	out 0A0h, al
	call io_delay

	;main ICW2
	;ICW2[0,1,2] = 0 must
	;ICW2 = 0x20 <-- IRQ0 = 0x20, IRQ1 = 0x21 ... IRQ7 = 0x27 ... (main)
	mov al, 020h
	out 021h, al
	call io_delay

	;follow ICW2
	;ICW2[0,1,2] = 0 must
	;ICW2 = 0x28 <-- IRQ0 (f.) = 0x28, IRQ1 (f.) = 0x29, ... IRQ7  = 0x2f
	mov al, 028h
	out 0A1h, al
	call io_delay

	;main ICW3
	;ICW3[2] = 1 follow via port 2
	mov al, 004h
	out 21h, al
	call io_delay

	;follow ICW3
	;ICW3[1] = 1 follow via port 2
	mov al, 002h
	out 0A1h, al
	call io_delay

	;main ICW4
	;ICW4[0] = 1 80X86 architecture
	;ICW4[1] = 1 EOI
	mov al, 003h
	out 021h, al
	call io_delay

	;follow ICW4
	out 0A1h, al
	call io_delay

	;NOW IN OCW mode (operationg control word)
	
	;Masks which IRQ are available to use (IRQ1 is open)
	;sets the main IRQ (IRQ2 connects to follow)
	mov al, 11111001b
	;mov al, 11111001b
	out 21h, al
	call io_delay

	;Sets the follow IRQ
	mov al, 11101111b
	out 0A1h, al
	call io_delay

	ret

io_delay:
	nop
	nop
	nop
	nop
	ret
