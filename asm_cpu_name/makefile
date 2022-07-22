cpu_name: cpu_name.o
	gcc -o cpu_name cpu_name.o -no-pie

cpu_name.o: cpu_name.asm
	nasm -f elf64 cpu_name.asm