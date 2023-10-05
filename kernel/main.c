void main() {
    char* vga = (char*)0xb8000;
    *vga = 'H';
    vga += 2;
    *vga = 'e';
    vga += 2;
    *vga = 'l';
    vga += 2;
    *vga = 'l';
    vga += 2;
    *vga = 'o';
    vga += 2;
    *vga = '!';

    while (1) {
        asm("hlt");
    }
}