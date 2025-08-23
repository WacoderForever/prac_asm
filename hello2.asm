_main:
section .data
    message db "Hello, Seth", 10
    len equ $ - message
section .text
  global _start
  _start:
    mov rax,1       ;write syscall
    mov rdi,1       ;stdout
    mov rsi,message ;message to print
    mov rdx,len     ;length of message
    syscall

    mov rax,60      ;exit syscall
    xor rdi,rdi     ;return value
    syscall
