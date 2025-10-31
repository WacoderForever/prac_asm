%define SYSCALL_WRITE 1
%define SYSCALL_EXIT 60
%define STD_OUT 1

global _start:

_start:
    call great_gor

    mov rax,SYSCALL_EXIT
    mov rdi,0
    syscall

great_gor:
    ;prolog
    push rbp
    mov rbp,rsp

    sub rsp,16

    mov BYTE [rsp + 0],71
    mov BYTE [rsp + 1],111
    mov BYTE [rsp + 2],114
    mov BYTE [rsp + 3],32
    mov BYTE [rsp + 4],98
    mov BYTE [rsp + 5],105
    mov BYTE [rsp + 6],114
    mov BYTE [rsp + 7],111
    mov BYTE [rsp + 8],32

    mov rax,SYSCALL_WRITE
    mov rdi,STD_OUT
    lea rsi,[rsp]
    mov rdx,9
    syscall

    call yaw_yoh

    ;epilog
    add rsp,16
    pop rbp

    ret

yaw_yoh:
    ;prolog
    push rbp
    mov rbp,rsp

    sub rsp,16

    mov BYTE [rsp + 0],121
    mov BYTE [rsp + 1],97
    mov BYTE [rsp + 2],119
    mov BYTE [rsp + 3],110
    mov BYTE [rsp + 4],101
    mov BYTE [rsp + 5],32
    mov BYTE [rsp + 6],121
    mov BYTE [rsp + 7],111
    mov BYTE [rsp + 8],111
    mov BYTE [rsp + 9],10

    mov rax,SYSCALL_WRITE
    mov rdi,STD_OUT
    lea rsi,[rsp]
    mov rdx,10
    syscall

    ;epilog
    add rsp,16
    pop rbp

    ret