BITS 64
CPU x64

section .text
%define AF_UNIX 1
%define SOCK_STREAM 1

%define SYSCALL_SOCKET 41
%define SYSCALL_EXIT 60

global _start
_start:
    call x11_connect_to_server

    ;exit
    mov rax,SYSCALL_EXIT
    mov rdi,0
    syscall

;Create and connect UNIX connect
;@returns file descriptor

x11_connect_to_server:
static x11_connect_to_server:function

    push rbp
    mov rbp,rsp 

    ;open UNIX socket
    mov rax,SYSCALL_SOCKET
    mov rdi,AF_UNIX
    mov rsi,SOCK_STREAM
    mov rdx,0
    syscall

    cmp rax,0
    jle die

    mov rdi,rax     ;move socket fd to register 'rdi'

    pop rbp
    ret

die:
    mov rax,SYSCALL_EXIT
    mov rdi,1
    syscall