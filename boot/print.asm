[bits 32]

VIDEO_MEMORY equ 0xb8000
WHITE_ON_BLACK equ 0x0f

print_string:
    mov esi, [esp + 4]
    mov edi, VIDEO_MEMORY

    mov ah, WHITE_ON_BLACK

.repeat:
    lodsb
    cmp al, 0
    je .done

    mov [edi], ax
    add edi, 2
    jmp .repeat

.done:
    ret