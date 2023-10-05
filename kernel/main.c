void main() {
    printChar('H', 0, 1);
    printChar('e', 0, 2);
    printChar('l', 0, 3);
    printChar('l', 0, 4);
    printChar('o', 0, 5);

    while (1) {
        asm("hlt");
    }
}

void printChar(char c, int row, int col) {
    char* vga = (char*)0xb8000;
    vga += 2 * (row * 80 + col);
    *vga = c;
}