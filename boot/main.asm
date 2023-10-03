[org 0x7c00]

mov bp, 0x9000
mov sp, bp

call switch_to_pm
jmp $

%include "boot/gdt.asm"
%include "boot/print.asm"
%include "boot/switch.asm"

[bits 32]
BEGIN_PM:
    mov ebx, msgprotected
    call print_string
    jmp $

msgprotected db "Hello protected mode!", 0

times 510-($-$$) db 0
dw 0xaa55