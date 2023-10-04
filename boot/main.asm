[org 0x7c00]

[bits 16]

mov ebx, msgreal
call print_16
xor ebx, ebx

mov bp, 0x8000
mov sp, bp

mov bx, 0x9000
mov dh, 8 ;8 sectors, 4KB

call disk_load

call switch_to_pm
jmp $

%include "boot/gdt.asm"
%include "boot/print.asm"
%include "boot/switch.asm"
%include "boot/disk.asm"

print_16:
    mov ah, 0x0e

print_16_loop:
    mov al, [ebx]
    cmp al, 0
    je print_16_end
    int 0x10
    inc ebx
    jmp print_16_loop

print_16_end:
    ret

jmp $

[bits 32]
BEGIN_PM:
    mov ebx, msgprotected
    call print_string
    xor ebx, ebx
    jmp $

msgreal db "Booting PongOS..", 0
msgprotected db "Loaded into protected mode!", 0

times 510-($-$$) db 0
dw 0xaa55