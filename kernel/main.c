void main() {
    printChar('H', 0, 1);
    printChar('I', 1, 1);
    printStr("Hello world!", 2, 1);

    while (1) {
        asm("hlt");
    }
}

void printChar(char c, int row, int col) {
    char* vga = (char*)0xb8000;
    vga += 2 * (row * 80 + col);
    *vga = c;
}

void printStr(char* str, int row, int col) {
    int i = 0;
    while (str[i] != '\0') {
        printChar(str[i], row, col + i);
        i++;
    }
}