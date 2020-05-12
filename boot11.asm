org 0x7c00    ;Store program/data at this point in memory (16 bit - 48 kB, 32 bit - 4 GB ...)

LoadAddr EQU 0x8000     ;create a variable called LOAD_ADDR, this is where the kernel code is at 
BufferAddr EQU 7E0h     ;A segment address

BaseOfStack equ 07c00h

jmp entry

;ax is a 16-bit register
entry:
	mov ax, 0
	mov ss, ax    ;reset ss register
	mov ds, ax    ;reset ds register

	mov ax, BufferAddr
	mov es, ax    ;reset es register

	mov ax, 0
	mov ss, ax
	mov sp, BaseOfStack
	mov di, ax
	mov si, ax	
	
	mov BX, 0              ;ES:BX will be the buffer to store 512 bytes of cylinder data	
	mov CH, 1        ;starting cylinder to be read = 1
	mov DH, 0         ;disk head to be read from = 0
	mov CL, 0         ;Starting Sector number to be read



readFloppy:
	cmp byte [load_count], 0
	je beginLoad

	mov bx, 0    ;Will copy the data into  the BufferAddr:BX space
	inc cl
	mov AH, 0x02 ; read floppy command for bios
	mov AL, 1    ; read number of sectors
	mov DL, 0    ; number of magnetic disks to read

	INT 0x13	  ;interrupter BIOS for disk reading
	jc fin            ;jmp if there is an error
	
copySector:
	push si
	push di
	push cx

	mov cx, 0200h     ;size of the buffer/ a sector	
	mov di, 0
	mov si, 0
	mov ax, word [load_section]    ;address for the kernel
	mov ds, ax

copy:
	cmp cx, 0
	je copyend

	mov al, byte [es:si]     ;moves byte from 07E00 to al
	mov byte [ds:di], al     ;moves byte data to 8000

	inc di
	inc si
	dec cx
	jmp copy

copyend:
	pop cx
	pop di
	pop si

	mov bx, ds
	add bx, 020h                  ;etc. 800h segment --> 820 segment (200h = 512 bytes = one sector) 
	mov ax, 0
	mov ds, ax 
	mov word [load_section], bx   ;update the new load section
	mov bx, 0
	
	;end of copy end

	cmp cl, 18
	jb readFloppy


	inc CH
	mov cl, 0
	dec byte [load_count]

	jmp readFloppy

beginLoad:
	mov ax, 0
	mov ds, ax

	jmp LoadAddr

load_count db 10 ;we need to read two cylinders
load_section dw 0800h;

fin:
	HLT           ;halt till key press
	jmp fin


