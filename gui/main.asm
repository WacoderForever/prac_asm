BITS 64 ;64-bit 
CPU x64 ;processor x86_64 family

%define SYSCALL_EXIT 60

section .text
global _start
_start:
    mov rax,SYSCALL_EXIT
    mov rdi,0
    syscall