org 0x9000    ;Store program/data at this point in memory (16 bit - 48 kB, 32 bit - 4 GB ...)

jmp entry


;ax is a 16-bit register
entry:
	mov ax, 0
	mov ss, ax    ;reset ss register
	mov ds, ax    ;reset ds register
	mov es, ax    ;reset es register
	mov si, msg
	;	jmp error 

putloop:
	mov al, [si]  ;copy a byte pointed by si into the lower 8-bits of AX
	add si, 1     ;increment si pointer
	cmp al, 0     ;check if reach end of string
	jz fin        ;if reached end, go to finish
	
	mov ah, 0x0e  ;set upper 8-bits of AX for printing
	mov bx, 15    ;set bx for printing
	int 0x10      ;interrupter to signal printing a char
	jmp putloop

fin:
	HLT           ;halt till key press
	jmp fin


msg:
	DB "This is hello world from kernel!"

