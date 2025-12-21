%define SYSCALL_WRITE 1
%define SYSCALL_EXIT 60
%define STD_OUT 1

global _start
_start:
    call euclid

    ;exit
    mov rax,SYSCALL_EXIT
    syscall

euclid:
    ;prolog
    push rbp
    mov rbp,rsp

    ;load numbers
    mov rax,100
    mov rdi,50

euclid_loop:
    xor rdx,rdx
    ;divide numbers
    div rdi
    test rdx,rdx
    jz complete
    mov rax,rdi
    mov rdi,rdx
    jmp euclid_loop
    
complete:
    pop rbp
    ret
