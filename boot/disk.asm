[bits 16]

disk_load:
    pusha
    push dx

    mov ah, 0x02
    mov al, dh
    mov cl, 0x02

    mov ch, 0x00
    mov dh, 0x00

    int 0x13 

    jc disk_error

    pop dx
    popa
    ret

disk_error:
    cli

disk_error_str db "Disk error!", 0