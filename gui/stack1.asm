%define SYSCALL_WRITE 1
%define STD_OUT 1
%define SYSCALL_EXIT 60

global _start

_start:
    call print_hello

    mov rax,SYSCALL_EXIT
    mov rdi,0
    syscall

print_hello:
    ;prolog
    push rbp            ;save caller's stack frame
    mov rbp,rsp         ;marking start of the function's frame

    sub rsp,6          ;allocate 5-bytes for 'hello'

    mov BYTE [rsp + 0],'h'
    mov BYTE [rsp + 1],'e'
    mov BYTE [rsp + 2],'l'
    mov BYTE [rsp + 3],'l'
    mov BYTE [rsp + 4],'o'
    mov BYTE [rsp + 5],10   ;line feed

    ;write the output
    mov rax,SYSCALL_WRITE
    mov rdi,STD_OUT
    lea rsi,[rsp]
    mov rdx,6
    syscall

    ;epilog
    add rsp,6              ;restore stack to its original value
    pop rbp

    ret