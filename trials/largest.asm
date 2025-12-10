%define SYSCALL_WRITE 1
%define STD_OUT 1
%define SYSCALL_EXIT 60

SECTION .data
    a dd 9,12,445,890,745
    len equ ($ - a)/4
    message db "The largest value is X"
    mlen equ $ - message
    newline db 10

SECTION .text
global _start

_start:
    mov rcx,len
    mov rsi,a           ;rsi holds the address of the first element in the array
    mov rax,[rsi]       ;dereferencing
    dec rcx

check_large:
    jz complete
    add rsi,4
    mov rdx,[rsi]
    cmp rax,rdx
    jge next
    mov rax,rdx

next:
    dec rcx
    jmp check_large

complete:    
    mov r10,rax
    
    mov rax,SYSCALL_WRITE
    mov rdi,STD_OUT
    mov rsi,message              ;address of message
    mov rdx,mlen
    syscall

    ;print endline
    mov rax,SYSCALL_WRITE
    mov rdi,STD_OUT
    mov rsi,newline
    mov rdx,1
    syscall

    ;exit
    mov rax,SYSCALL_EXIT
    xor rdi,rdi
    syscall