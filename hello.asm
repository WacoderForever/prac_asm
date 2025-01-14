_main:
section .data
 message db 'Hello, world!', 10    ;10 represents newline character
 len equ $ - message
section .text
global _start
_start:
    mov     rax, 1              ;'write' system call number stored in rax
    mov     rdi, 1              ;argument #1 :where to write (descriptor) stdout?
    mov     rsi, message     ; argument #2 in rsi: where does the string start?
    mov     rdx,len         ; argument #3 in rdx: how many bytes to write?
    syscall                  ; this instruction invokes a system call
    mov rax,60
    mov rdi,0
    syscall

    