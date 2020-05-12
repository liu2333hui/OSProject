
%macro myDesc 3
	dw %2 & 0FFFFh
	dw %1 & 0FFFFh
	db (%1 >> 16) & 0FFh
	dw ((&2 >> 8) & 0F00h) | (%3 & 0F0FFh)
	db (%1 >> 24) & 0FFh
%endmacro

%macro myMacro 2
	db %1    &0FFh
	db %2    & 0FFh
%endmacro

%macro Descriptor 3
	dw %2 & 0FFFFh
	dw %1 & 0FFFFh
	db (%1 >> 16) & 0FFh
	dw ((%2 >> 8) & 0F00h) | (%3 & 0F0FFh)
	db (%1 >> 24) & 0FFh
%endmacro

%macro Gate 4   ;selector, offset, Dcount, Attribute
	dw (%2 & 0FFFFh)
	dw %1  
	dw (%3 & 1Fh) | ((%4 << 8) & 0FF00h)               ; dw_count and attributes
	dw ((%2 >> 16) & 0FFFFh) ; shift by two bytes (offset high)   
%endmacro	

DA_32	equ 4000h   ;32 bit
DA_C	equ 98h      ;executable
DA_DRW	equ 92h      ;can read, write 
DA_DRWA equ 93h
DA_386IGate equ 8Eh   
DA_LIMIT_4K  equ   8000h   ;
