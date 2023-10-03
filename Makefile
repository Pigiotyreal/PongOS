all:
	nasm boot/main.asm -f bin -o bin/boot.bin
	qemu-system-x86_64 -fda bin/boot.bin