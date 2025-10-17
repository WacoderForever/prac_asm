%define SYSCALL_WRITE 1
%define SYSCALL_EXIT 60
%define STD_OUT 1

section .text
global _start

_start:
    call print_hello

    mov rax,SYSCALL_EXIT
    mov rdi,0
    syscall

print_hello:
    ;prolog
    push rbp
    mov rbp,rsp

    sub rsp,16

    mov BYTE [rsp + 0],'H'
    mov BYTE [rsp + 1],'e'
    mov BYTE [rsp + 2],'l'
    mov BYTE [rsp + 3],'l'
    mov BYTE [rsp + 4],'o'

    mov rax,SYSCALL_WRITE
    mov rdi,STD_OUT
    lea rsi,[rsp]
    mov rdx,5
    syscall

    call print_world

    ;epilog
    add rsp,16
    pop rbp

    ret

print_world:
    push rbp
    mov rbp,rsp

    sub rsp,16

    mov BYTE [rsp + 0],' '
    mov BYTE [rsp + 1],'w'
    mov BYTE [rsp + 2],'o'
    mov BYTE [rsp + 3],'r'
    mov BYTE [rsp + 4],'l'
    mov BYTE [rsp + 5],'d'
    mov BYTE [rsp + 6],'!'
    mov BYTE [rsp + 7],10

    mov rax, SYSCALL_WRITE
    mov rdi,STD_OUT
    lea rsi,[rsp]
    mov rdx,8
    syscall

    add rsp,16
    pop rbp

    ret
