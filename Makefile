all:
	gcc -ffreestanding -c kernel/main.c -o kernel.o
	nasm boot/kernelentry.asm -f elf64 -o kernel_entry.o
	ld -o kernel.bin -Ttext 0x1000 kernel_entry.o kernel.o --oformat binary
	nasm boot/main.asm -f bin -o boot.bin
	cat boot.bin kernel.bin > os.bin
	qemu-system-x86_64 os.bin