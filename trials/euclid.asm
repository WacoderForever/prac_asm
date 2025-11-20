%define SYSCALL_WRITE 1
%define SYSCALL_EXIT 60
%define STD_OUT 1

global _start
_start:
    call euclid

    ;exit
    mov rax,SYSCALL_EXIT
    mov rdi,0
    syscall

euclid:
    ;prolog
    push rbp
    mov rbp,rsp

    ;load numbers
    mov rax,26
    mov rdi,13

euclid_loop:
    