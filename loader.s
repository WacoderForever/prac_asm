global loader                      ; Entry point

MAGIC_NUMBER equ 0x1BADB002        ; Magic number constant
FLAGS        equ 0x0               ; Flags initialized as 0
CHECKSUM     equ -MAGIC_NUMBER        ; Explicit checksum (negation of MAGIC_NUMBER, calculated manually)

section .text:
align 4                            ; 4-byte alignment
    dd MAGIC_NUMBER
    dd FLAGS
    dd CHECKSUM
loader:                             ; Loader label (defined as entry point)
    mov eax, 0xCAFEBABE             ; Copy 0xCAFEBABE to eax register
.loop:
    jmp .loop                       ; Loop forever

