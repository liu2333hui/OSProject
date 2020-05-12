Kernel versions

Kernel1
-Added reading from floppy capability from asm code
-Java now has seperate class for floppy disk data writing/reading
-Will print a simple text from a given sector/cylinder of the floppy disk

Kernel2 + Boot2
-Seperates assembly code for kernel and boot
-kernel can now take up more than 512 bytes (not booting sector restricted) 
-boot2 is put in the bootable portion of the floppy disk. It's task is to point the 
BIOS to where the kernel is located at ...
