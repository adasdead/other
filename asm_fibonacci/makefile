fibonacci: fibonacci.o
	gcc -o fibonacci fibonacci.o -no-pie

fibonacci.o: fibonacci.asm
	nasm -f elf64 fibonacci.asm