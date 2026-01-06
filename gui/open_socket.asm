BITS 64
CPU x64

section .text
%define AF_UNIX 1
%define SOCK_STREAM 1

%define SYSCALL_SOCKET 41
%define SYSCALL_EXIT 60

global _start

_start:
    ;open socket
    mov rax,SYSCALL_SOCKET
    mov rdi,AF_UNIX             ;UNIX socket
    mov rsi,SOCK_STREAM         ;Stream oriented
    mov rdx,0
    syscall

    ;exit
    mov rax,SYSCALL_EXIT
    mov rdi,0
    syscall