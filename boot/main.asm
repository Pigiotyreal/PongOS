[org 0x7c00]

mov [bootdrive], dl
mov bp, 0x9000
mov sp, bp

mov ebx, msgreal
call print_16
xor ebx, ebx

call clear_screen

call loadkernel
call switch_to_pm
jmp $

%include "boot/gdt.asm"
%include "boot/print.asm"
%include "boot/switch.asm"
%include "boot/disk.asm"

[bits 16]

loadkernel:
    mov bx, 0x1000
    mov dh, 2 ;8 sectors, 4KB
    mov dl, [bootdrive]
    call disk_load
    ret

print_16:
    mov ah, 0x0e

print_16_loop:
    mov al, [ebx]
    cmp al, 0
    je print_16_end
    int 0x10
    inc ebx
    jmp print_16_loop

print_16_nl:
    pusha
    mov ah, 0x0e
    mov al, 0x0a
    int 0x10
    mov al, 0x0d
    int 0x10
    popa
    ret

print_16_end:
    ret

clear_screen:
    mov ah, 0x00
    mov al, 0x03
    int 0x10
    ret

jmp $

[bits 32]
BEGIN_PM:
    call 0x1000
    jmp $

bootdrive db 0 
msgreal db "Booting PongOS..", 0

times 510-($-$$) db 0
dw 0xaa55