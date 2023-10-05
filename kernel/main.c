void main() {
    printChar('H', 0, 1);
    printChar('I', 1, 1);

    while (1) {
        asm("hlt");
    }
}

void printChar(char c, int row, int col) {
    char* vga = (char*)0xb8000;
    vga += 2 * (row * 80 + col);
    *vga = c;
}