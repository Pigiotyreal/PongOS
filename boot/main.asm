[bits 16]
[org 0x7c00]

mov si, msg
call print

jmp $

print:
	mov ah, 0x0e
	mov bh, 0x00
	mov bl, 0x07
	mov al, [si]
	int 0x10
	inc si
	cmp al, 0
	jne print
	ret

msg: db "Hello world!", 0

times 510-($-$$) db 0
dw 0xaa55