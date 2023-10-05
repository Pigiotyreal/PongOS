void main() {
    printChar('H', 0, 1);
    printChar('e', 1, 1);
    printChar('l', 2, 1);
    printChar('l', 3, 1);
    printChar('o', 4, 1);
    printChar('!', 5, 1);

    printStr("hii", 6, 1);

    while (1) {
        asm("hlt");
    }
}

void printChar(char c, int row, int col) {
    char* vga = (char*)0xb8000;
    vga += 2 * (row * 80 + col);
    *vga = c;
}

void printStr(char str[], int row, int col) {
    char* vga = (char*)0xb8000;
    vga += 2 * (row * 80 + col);
    for (int i = 0; str[i] != '\0'; i++) {
        *vga = str[i];
        vga += 2;
    }
}