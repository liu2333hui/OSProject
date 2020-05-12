#####EXPERIENCE 0: ASM code uses C code
nasm -f elf32 -o foo.o foo.asm
gcc -m32 -c -o bar.o bar.c
ld -m elf_i386 -o foobar foo.o bar.o

#####EXPERIENCE 1: C code uses ASM code
nasm -f elf32 asmCode1.asm
gcc -m32 -Wall helloWorld.c asmCode1.o

#####EXPERIENCE 2: C code converted into ASM code, then ASM codes combined
gcc -m32 -fno-pie -s -c -o bar.o bar.c
objconv -fnasm bar.o -o bar.asm
(SOME EDITING OF THE ASM FILES)
nasm -f elf32 foo.asm
gcc -m32 foo.o -o foo
