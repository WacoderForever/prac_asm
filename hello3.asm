section .data
    message db "Hello world!",10
    len equ $ - message

section .text
    global _start
    _start:
        mov rax,1           ;write syscall
        mov rdi,1           ;stdout
        mov rsi,message 
        mov rdx,len
        syscall

        mov rax,60
        xor rdi,rdi
        syscall


