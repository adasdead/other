avx_fibonacci: avx_fibonacci.o
	gcc -o avx_fibonacci avx_fibonacci.o -no-pie

avx_fibonacci.o: avx_fibonacci.asm
	nasm -f elf64 avx_fibonacci.asm