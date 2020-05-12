%include "pm.inc"

org 0x9000

jmp LABEL_BEGIN

[SECTION .gdt]

	;    SEGMENT BASE ADDRESS,    SEGMENT LENGTH,     PRIVILEGES/SETTINGS
LABEL_GDT:   Descriptor 0, 0,0
LABEL_DESC_CODE32: Descriptor 0h, SegCode32Len - 1, DA_C + DA_32
LABEL_DESC_VIDEO:  Descriptor 0B8000h, 0FFFFh, DA_DRW
LABEL_DESC_5M:	   Descriptor 0500000h, 0FFFFh, DA_DRW

GdtLen equ $ - LABEL_GDT
GdtPtr dw GdtLen - 1
       dd 0h

SelectorCode32 equ LABEL_DESC_CODE32 - LABEL_GDT
SelectorVideo equ  LABEL_DESC_VIDEO  - LABEL_GDT
Selector5M    equ  LABEL_DESC_5M     - LABEL_GDT

[SECTION .s16]
[BITS 16]
LABEL_BEGIN:
	;Clear registers
	mov ax, cs   ;move segment C into address of ax
	mov ds, ax
	mov es, ax
	mov ss, ax
	mov sp, 0100h

	;Set segment address for LABEL_SEG_CODE32 dynamically
	xor eax, eax   ;clear eax 32-bit register
	mov ax, cs     ;Code segment address we want to put into LABEL_SEG_CODE32 
	;Addressing in 32-bits ... 16 bit for segment, 32 bit for rest
	shl eax, 4   ;push left by half a byte 
	add eax, LABEL_SEG_CODE32 ;	      
	mov word [LABEL_DESC_CODE32 + 2], ax	
	shr eax, 16   ;shift right by 3 bytes  	
	mov byte [LABEL_DESC_CODE32 + 4], al
	mov byte [LABEL_DESC_CODE32 + 7], ah	
	
	;Set segment address for LABEL_GDT dynamically
	xor eax, eax
	mov ax, ds
	shl eax, 4
	add eax, LABEL_GDT
	mov dword [GdtPtr + 2], eax
	
	lgdt [GdtPtr]  ;load gdt pointer

	cli ;turn-off interrupts

	in al, 92h  ;internal calls?
	or al, 00000010b
	out 92h, al

	mov eax, cr0  ;load control register data
	or eax, 1     ;Set for protective mode
	mov cr0, eax  ;store control register data	
	
	jmp dword SelectorCode32: 0 ;Jump to the 32-bit code

[SECTION .s32]
[BITS 32]
LABEL_SEG_CODE32:
	mov ax, SelectorVideo ;set GS to be the graphics pointer
	mov gs, ax

	mov si, msg           ;set SI to point to the message data
	mov ax, Selector5M
	mov es, ax            ;set ES to be the 5M pointer
	
	mov edi, 0            ;offset for storing data

write_msg_to_5M:
	cmp byte [si], 0      ;checked if reached end of string
	jz prepare_to_show_char    ;jump to show once finished copying data
	mov al, [si]               ;load data into AL register
	mov [es:edi], al          ;store data into 5M pointer (ES)
	
	inc edi                 ;increment edi
	inc si                  ;increment si
	
	jmp write_msg_to_5M

prepare_to_show_char:
	;Set up some constants
	mov ebx, 10
	mov ecx, 2
	mov si, 0

showChar:
	;move the value of ((80*11)+10)*2 (to get value of where to place the two bytes in the gs pointer <-- 11 rows, 10th column, every data takes up two bytes (one for color, one for ascii)
	mov edi, (80*11)
	add edi, ebx
	mov eax, edi
	mul ecx
	mov edi, eax

	;Set up for moving data into the graphics screen
	mov ah, 0dh
	mov al, [es:si]
	cmp al, 0
	jz end

	inc ebx
	inc si
	mov [gs:edi], ax 
	jmp showChar

end:
	jmp $
msg:
	db "This string is written in the 5M memory space", 0h


SegCode32Len equ $ - LABEL_SEG_CODE32     ;$ refers to the current location of the compiler??
