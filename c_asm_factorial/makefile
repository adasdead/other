factorial: main.o factorial.o
	gcc -o factorial factorial.o main.o

main.o: src/main.c
	gcc -c src/main.c -o main.o

factorial.o: src/factorial.asm
	nasm -f elf64 -o factorial.o src/factorial.asm