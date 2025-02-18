MEMORY
{
    ROM (rx) : ORIGIN = 0x00100000, LENGTH = 1M
    RAM (rwx) : ORIGIN = 0x20000000, LENGTH = 1M
}

ENTRY(loader)

SECTIONS {
    . = 0x00100000;

    .text : {
        *(.text)
    } > ROM

    .rodata : {
        *(.rodata*)
    } > ROM

    .data : {
        *(.data)
    } > RAM

    .bss : {
        *(COMMON)
        *(.bss)
    } > RAM
}