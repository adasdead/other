ghoul: ghoul.o
	gcc -o ghoul ghoul.o -no-pie

ghoul.o: ghoul.asm
	nasm -f elf64 ghoul.asm