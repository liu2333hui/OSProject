%include "pm.inc" 

org 0x9000  

jmp LABEL_BEGIN

;[SECTION .gdt]

;
LABEL_GDT:   Descriptor 0h, 0h, 0h
LABEL_DESC_CODE32: Descriptor 0h, SegCode32Len - 01h, DA_C + DA_32
LABEL_DESC_VIDEO: Descriptor 0B8000h, 0ffffh, DA_DRW

GdtLen	equ	$ - LABEL_GDT
GdtPtr	dw	GdtLen - 01h
	dd	0h

SelectorCode32	equ	LABEL_DESC_CODE32 - LABEL_GDT
SelectorVideo	equ	LABEL_DESC_VIDEO  - LABEL_GDT	

[SECTION .s16]
[BITS 16]

LABEL_BEGIN:
	mov ax, cs
	mov ds, ax
	mov es, ax
	mov ss, ax
	mov sp, 0100h

	xor eax, eax ;clear eax
	mov ax, cs
	shl eax, 4 ; shift left by 4 <-- multiply by 16
	add eax, LABEL_SEG_CODE32
	mov word [LABEL_DESC_CODE32 + 2], ax
	shr eax, 16
	mov byte [LABEL_DESC_CODE32 + 4], al
	mov byte [LABEL_DESC_CODE32 + 7], ah

	xor eax, eax ;clear eax
	mov ax, ds
	shl eax, 4
	add eax, LABEL_GDT
	mov dword [GdtPtr + 2], eax

	;Switching to protected mode from real mode
	lgdt [GdtPtr]

	cli  ;turn off interrupter            
	
	;Enter protective mode (32-bit mode)
	in al, 92h    ;internal  calls to API?
	or al, 00000010b
	out 92h, al

	mov eax, cr0
	or  eax, 1
	mov cr0, eax
			
	jmp dword SelectorCode32:0	

[SECTION .s32]
[bits 32]
LABEL_SEG_CODE32:
	mov ax, SelectorVideo
	mov gs, ax
	mov si, msg
	mov ebx, 10  ;The number of cols
	mov ecx, 2   ;A character takes up two bytes
showChar:
	mov edi, (80*11) ;show the character from 11th row?
	add edi, ebx
	mov eax, edi
	mul ecx
	mov edi, eax     ;eax now points to (11*80 + 10)*2
	
	mov ah, 0ch
	mov al, [si]
	cmp al, 0
	jz end

	add ebx, 1
	add si, 1
	mov [gs:edi], ax
	jmp showChar

end:
	jmp $

msg:
	DB "Protected Mode 安全",0

SegCode32Len equ $ - LABEL_SEG_CODE32
