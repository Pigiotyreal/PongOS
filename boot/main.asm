[org 0x7c00]

mov bp, 0x8000
mov sp, bp

mov bx, 0x9000
mov dh, 4 ;4 sectors

call disk_load

call switch_to_pm
jmp $

%include "boot/gdt.asm"
%include "boot/print.asm"
%include "boot/switch.asm"
%include "boot/disk.asm"

jmp $

[bits 32]
BEGIN_PM:
    mov ebx, msgprotected
    call print_string
    jmp $

msgprotected db "Hello protected mode!", 0

times 510-($-$$) db 0
dw 0xaa55