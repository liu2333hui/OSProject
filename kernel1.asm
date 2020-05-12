org 0x7c00    ;Store program/data at this point in memory (16 bit - 48 kB, 32 bit - 4 GB ...)

jmp entry

;ax is a 16-bit register
entry:
	mov ax, 0
	mov ss, ax    ;reset ss register
	mov ds, ax    ;reset ds register
	mov es, ax    ;reset es register
	mov si, msg
	;	jmp error 

readFloppy:
	mov CH, 3         ;cylinder to be read = 1
	mov DH, 0         ;disk head to be read from = 0
	mov CL, 10 	  ;sector to be read = 2

	mov BX, msg       ;buffer to store floppy disk read

	mov AH, 0x02      ;read floppy command
	mov AL, 1	  ;the number of sectors to be read
	mov DL, 0	  ;number of disks to read
	INT 0x13	  ;interrupter BIOS for disk reading
	jc error

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
	RESB 64       ;reserve 64 bytes of space

error:
	mov si, errmsg     ;error message print
	jmp putloop

errmsg:
	db "error",0	
