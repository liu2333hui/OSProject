%include "pm.inc"

org 0x8000

;VRAM_ADDRESS equ 0x000a0000

jmp LABEL_BEGIN

[SECTION .gdt]

	;    SEGMENT BASE ADDRESS,    SEGMENT LENGTH,     PRIVILEGES/SETTINGS
LABEL_GDT:   Descriptor 0, 0,0
LABEL_DESC_CODE32: Descriptor 0h, 0FFFFFh, DA_C | DA_32 | DA_LIMIT_4K
LABEL_DESC_VIDEO:  Descriptor 0B8000h, 0FFFFFh, DA_DRW
LABEL_DESC_VRAM:   Descriptor 0, 0FFFFFh,  DA_DRW | DA_LIMIT_4K
LABEL_DESC_STACK:  Descriptor 0, TopOfStack,   DA_DRWA|DA_32
LABEL_DESC_FONT:   Descriptor 0, 0fffffh, DA_DRW | DA_LIMIT_4K

GdtLen equ $ - LABEL_GDT
GdtPtr dw GdtLen - 1
       dd 0h

SelectorCode32 equ LABEL_DESC_CODE32 - LABEL_GDT
SelectorVideo equ  LABEL_DESC_VIDEO  - LABEL_GDT
SelectorStack equ LABEL_DESC_STACK - LABEL_GDT
SelectorVram  equ LABEL_DESC_VRAM   - LABEL_GDT
SelectorFont  equ  LABEL_DESC_FONT  - LABEL_GDT

LABEL_IDT:
%rep 32
	Gate SelectorCode32, SpuriousHandler, 0, DA_386IGate
%endrep

.020h:
	Gate SelectorCode32, TimerHandler, 0, DA_386IGate

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
	;Set up segment addresses
	;xor ax, ax
	;mov ds, ax
	;mov es, ax
	;mov fs, ax
	;mov gs, ax	


	;Set up VGA output
	mov al, 0x13
	mov ah, 0
	int 0x10

	;Query the VESA system
	;mov bx, 4102h;
	push es
	mov ax, 4f00h
	mov di, vbe_info_structure
	int 0x10
	pop es

	cmp ax, 0x4f
	jne vbeerror

find_mode:
	xor eax, eax
	mov ax, word[vbe_info_structure.video_modes + 0]
	mov [vbe_offset], ax
	mov ax, word[vbe_info_structure.video_modes+2]
	mov [vbe_segment], ax

	mov ax, [vbe_segment]
	mov fs, ax
	xor si, si
	mov si, [vbe_offset]
	add si, 2*11
	;Available Modes on this computer
	;100, 101, 103, 105, 107, 10E, 111, 114, 117, 11A
	;120, 121

	mov dx, [fs:si]
	mov [vbe_mode], dx



;	add si, 2
;	mov [vbe_offset], si
	

	;PROBE VBE
	push es
	mov ax, 4f01h
	;mov cx, 4101h
	mov cx, 4107h
	;mov bx, 4101h
	mov di, vbe_mode_structure 
	int 0x10
	pop es
	
	cmp ax, 0x004f
	jne vbeerror


	;Change VBE
	push es
	mov ax, 4f02h
	mov bx, 4107h
	int 0x10
	pop es
	
	cmp ax, 0x004f
	jne vbeerror



	;Set segment address for LABEL_SEG_CODE32 dynamically
	xor eax, eax   ;clear eax 32-bit register
	mov ax, cs     ;Code segment address put into LABEL_SEG_CODE32 
	shl eax, 4   ;push left by half a byte 
	add eax, LABEL_SEG_CODE32 ;	      
	mov word [LABEL_DESC_CODE32 + 2], ax	
	shr eax, 16   ;shift right by 3 bytes  	
	mov byte [LABEL_DESC_CODE32 + 4], al
	mov byte [LABEL_DESC_CODE32 + 7], ah	

	;Set segment font for C language
	xor eax, eax
	mov ax, cs
	shl eax, 4
	add eax, LABEL_SYSTEM_FONT
	mov word [LABEL_DESC_FONT + 2], ax
	shr eax, 16
	mov byte [LABEL_DESC_FONT + 4], al
	mov byte [LABEL_DESC_FONT + 7], ah	
	
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

vbeerror:
	hlt
	jmp vbeerror

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

	%include "ckernel27.clean.asm"
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
get_vbe_info:
	mov eax, vbe_info_structure
	ret;
get_vbe_version:
	xor eax, eax
	mov ax, word [vbe_info_structure.version]
	ret;
get_vbe_mode:
	xor eax, eax
	mov ax, word [vbe_mode]
	ret
get_vbe_framebuffer:
	xor eax, eax
	mov eax, [vbe_mode_structure.framebuffer]
	ret
	;0xE8000000

SegCode32Len equ $ - LABEL_SEG_CODE32     ;$ refers to the current location of the compiler??


[SECTION .data]
ALIGN 32
[BITS 32]
MemChkBuf: times 256 db 0
dwMCRNumber:   dd 0
;vbe_info_block: times 512 db 0
vbe_info_structure:
	.signature db "VBE2"
	.version   dw 0
	.oem      dd 0
	.capab    dd 0
	.video_modes dd 0
	.video_memory dw 0
	.software_rev dw 0
	.vendor       dd 0
	.product_name dd 0
	.product_rev dd 0
	.reserved times 222 db 0
	.oem_data times 256 db 0
	;.table_data resb 512-4
vbe_width: dw 0
vbe_height: dw 0
vbe_bpp: db 0
vbe_segment: dw 0
vbe_offset: dw 0
vbe_mode: dw 0
vbe_mode_structure:
	.attributes dw 0
	.window     dw 0
	.gran       dw 0
	.window_size dw 0
	.segment_a   dw 0
	.segment_b   dw 0
	.win_func_ptr dd 0
	.pitch        dw 0
	.width        dw 0
	.height       dw 0
	.w_char       db 0
	.y_char       db 0
	.planes      db 0
	.bpp      db 0
	.banks    db 0
	.memory_model db 0
	.bank_size db 0
	.image_pages db 0
	.reserved0 db 0
	.red_mask db 0
	.red_position db 0
	.green_mask db 0
	.green_position db 0
	.blue_mask db 0
	.blue_position db 0
	.reserved_mask db 0
	.reserved_position db 0
	.direct_color_attributes db 0	
	.framebuffer dd 0
	.off_screen_mem_off dd 0
	.off_screen_mem_size dw 0
	.reserved1 times 206 db 0	

[SECTION .gs]
ALIGN 32
[BITS 32]
LABEL_STACK:
times 512 db 0

TopOfStack equ $ - LABEL_STACK

LABEL_SYSTEM_FONT:
%include "fontData.inc"

SystemFontLength equ $ - LABEL_SYSTEM_FONT
