pyramid: pyramid.o
	gcc -o pyramid pyramid.o -no-pie

pyramid.o: pyramid.asm
	nasm -f elf64 pyramid.asm