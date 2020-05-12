%include "pm.inc"

org 0x9000

VRAM_ADDRESS equ 0x000a0000

jmp LABEL_BEGIN

[SECTION .gdt]

	;    SEGMENT BASE ADDRESS,    SEGMENT LENGTH,     PRIVILEGES/SETTINGS
LABEL_GDT:   Descriptor 0, 0,0
LABEL_DESC_CODE32: Descriptor 0h, 0FFFFFh, DA_C | DA_32 | DA_LIMIT_4K
LABEL_DESC_VIDEO:  Descriptor 0B8000h, 0FFFFFh, DA_DRW
LABEL_DESC_VRAM:   Descriptor 0, 0FFFFFh,  DA_DRW | DA_LIMIT_4K
LABEL_DESC_STACK:  Descriptor 0, TopOfStack,   DA_DRWA|DA_32

GdtLen equ $ - LABEL_GDT
GdtPtr dw GdtLen - 1
       dd 0h

SelectorCode32 equ LABEL_DESC_CODE32 - LABEL_GDT
SelectorVideo equ  LABEL_DESC_VIDEO  - LABEL_GDT
SelectorStack equ LABEL_DESC_STACK - LABEL_GDT
SelectorVram  equ LABEL_DESC_VRAM   - LABEL_GDT

LABEL_IDT:
%rep 33
	Gate SelectorCode32, SpuriousHandler, 0, DA_386IGate
%endrep

.021h:;refers to the keyboard
	Gate SelectorCode32, KeyboardHandler,0, DA_386IGate

%rep 10
	Gate SelectorCode32, SpuriousHandler, 0, DA_386IGate
%endrep

.2CH:
	Gate SelectorCode32, MouseHandler,    0, DA_386IGate


IdtLen equ $ - LABEL_IDT
IdtPtr dw IdtLen - 1
	dd 0

[SECTION .s16]
[BITS 16]
LABEL_BEGIN:
	;Clear registers
	mov ax, cs   ;move segment C into address of ax
	mov ds, ax
	mov es, ax
	mov ss, ax
	mov sp, 0100h

;Get memory information of the computer system	
ComputeMemory:
	mov ebx, 0
	mov di, MemChkBuf
.loop:
	mov eax, 0E820h
	mov ecx, 20
	mov edx, 0534D4150h  ;SAMP
	int 15h               ;BIOS call for memory usage/allocation
	jc LABEL_MEM_CHK_FAIL
	add di, 20             ;BIOS adds 20bytes of data every time
	inc dword [dwMCRNumber]
	cmp ebx, 0
	jne .loop
	jmp LABEL_MEM_CHK_OK

LABEL_MEM_CHK_FAIL:
	mov dword [dwMCRNumber], 0

LABEL_MEM_CHK_OK:


	;Set up VGA output
	mov al, 0x13
	mov ah, 0
	int 0x10

	;Set segment address for LABEL_SEG_CODE32 dynamically
	xor eax, eax   ;clear eax 32-bit register
	mov ax, cs     ;Code segment address put into LABEL_SEG_CODE32 
	shl eax, 4   ;push left by half a byte 
	add eax, LABEL_SEG_CODE32 ;	      
	mov word [LABEL_DESC_CODE32 + 2], ax	
	shr eax, 16   ;shift right by 3 bytes  	
	mov byte [LABEL_DESC_CODE32 + 4], al
	mov byte [LABEL_DESC_CODE32 + 7], ah	

	;Set segment stack for C language
	;xor eax, eax
	;mov ax, cs
	;shl eax, 4
	;add eax, LABEL_STACK
	;mov word [LABEL_DESC_STACK + 2], ax
	;shr eax, 16
	;mov byte [LABEL_DESC_STACK + 4], al
	;mov byte [LABEL_DESC_STACK + 7], ah	
	
	;Set segment address for LABEL_GDT dynamically
	xor eax, eax
	mov ax, ds
	shl eax, 4
	add eax, LABEL_GDT
	mov dword [GdtPtr + 2], eax
	
	lgdt [GdtPtr]  ;load gdt pointer

	cli ;turn-off interrupts

	call init8259A  ;Set up the interrupter settings

	;Load the interrupt serverice
	xor eax, eax
	mov ax, ds
	shl eax, 4
	add eax, LABEL_IDT
	mov dword [IdtPtr + 2], eax
	lidt [IdtPtr]

	in al, 92h  ;internal calls?
	or al, 00000010b
	out 92h, al

	mov eax, cr0  ;load control register data
	or eax, 1     ;Set for protective mode
	mov cr0, eax  ;store control register data	
	
	jmp dword SelectorCode32: 0 ;Jump to the 32-bit code

	%include "interrupt.inc"

[SECTION .s32]
[BITS 32]
;Helper functions

LABEL_SEG_CODE32:
	
	;initialize stack
	mov ax, SelectorStack
	mov ss, ax	
	mov esp, TopOfStack
	
	mov ax, SelectorVram
	mov ds, ax

	mov ax, SelectorVideo
	mov gs, ax


	sti

	%include "Ckernel17.clean.asm"
;	%include "write_vga_mem_show.clean.asm"
	
	jmp $

;Handler functions for interrupters
%include "handlers.inc"




%include "ioFunc.asm"


io_hlt: ;void io_hlt(void);
	HLT
	RET

get_memory_block_count:
	mov eax, [dwMCRNumber]
	ret
get_adr_buffer:
	mov eax, MemChkBuf
	ret
get_seg_code:
	mov eax, SegCode32Len
	ret 

%include "fontData.inc"


SegCode32Len equ $ - LABEL_SEG_CODE32     ;$ refers to the current location of the compiler??

MemChkBuf: times 256 db 0
dwMCRNumber:   dd 0

[SECTION .gs]
ALIGN 32
[BITS 32]
LABEL_STACK:
times 512 db 0

TopOfStack equ $ - LABEL_STACK
