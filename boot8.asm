org 0x7c00    ;Store program/data at this point in memory (16 bit - 48 kB, 32 bit - 4 GB ...)

LOAD_ADDR EQU 0x9000     ;create a variable called LOAD_ADDR, this is where the kernel code is at 

jmp entry

;ax is a 16-bit register
entry:
	mov ax, 0
	mov ss, ax    ;reset ss register
	mov ds, ax    ;reset ds register
	mov es, ax    ;reset es register
	mov si, ax 
	;	jmp error 

readFloppy:
	mov BX, LOAD_ADDR       ;ES:BX buffer to store floppy disk read
	mov CH, 1        ;cylinder to be read = 1
	mov DH, 0         ;disk head to be read from = 0
	mov CL, 2 	  ;sector to be read = 2
	mov AH, 0x02      ;read floppy command
	mov AL, 30 ;the number of sectors to be read
	mov DL, 0x00	  ;number of disks to read
	INT 0x13	  ;interrupter BIOS for disk reading
	jc fin

	jmp LOAD_ADDR

fin:
	HLT           ;halt till key press
	jmp fin


