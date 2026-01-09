section .text

%define AF_UNIX 1
%define SOCK_STREAM 1

%define SYSCALL_SOCKET 41
%define SYSCALL_EXIT 60

; Create a UNIX domain socket and connect to the X11 server.
; @returns The socket file descriptor.
x11_connect_to_server:
static x11_connect_to_server:function
    push rbp
    mov rbp,rsp

    ;Open UNIX socket
    mov rax,SYSCALL_SOCKET
    mov rdi,AF_UNIX             ;UNIX socket
    mov rsi,SOCK_STREAM         ;Stream oriented
    mov rdx,0                   ;Automatic protocol
    syscall

    cmp rax,0
    jle die

    mov rdi,rax                 ;store socket fd in rdi
    
    pop rbp
    ret

die:
    mov rax,SYSCALL_EXIT
    mov rdi,1
    syscall

_start:
global _start:function
    call x11_connect_to_server
    ;END

    mov rax,SYSCALL_EXIT
    mov rdi,0
    syscall