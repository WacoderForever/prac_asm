
;Executable name : EATSYSCALL
;Version: 1.0
;Created date: 1/7/2009
;Last update: 2/11/2024
;Author: Jeff Duntemann
;Maintainer: Seth Omondi
;Description: A simple assembly app for Linux, using NASM 2.05,
;             demonstrating the use of Linux INT 80H syscalls
;             to display text.
;Build using these commands:
;   nasm -f elf64 -g -F stabs eatsyscall.asm
;   ld -m elf_x86_64 -o eatsyscall eatsyscall.o

SECTION .data

EatMsg: db "Eat at Joe's",10  ;Section containing initialised data
EatLen: equ $-EatMsg

SECTION .bss  ;Section for uninitialised data
SECTION .text  ;Sction for code

global _start  ;linker needs to find this entry point

_start:
    nop             ;no operation
    mov eax,4       ;specify sys_write call
    mov ebx,1       ;STDOUT file descriptor
    mov ecx,EatMsg  ;pass offset of message
    mov edx,EatLen  ;pass length of message
    int 80H         ;make syscall to output text to STDOUT

    mov eax,1       ;specify exit sys call
    mov ebx,0       ;return a code of zero
    int 80H         ;make syscall to terminate the program