vec_pow: vec_pow.o
	gcc -o vec_pow vec_pow.o -no-pie

vec_pow.o: vec_pow.asm
	nasm -f elf64 vec_pow.asm