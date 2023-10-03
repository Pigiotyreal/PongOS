BOOTDIR = boot
KERNDIR = kernel
MAINBOOT = boot/main.asm
BOOTBIN = bin/boot.bin

all:
	nasm $(MAINBOOT) -f bin -o $(BOOTBIN)
	qemu-system-x86_64 -fda $(BOOTBIN)