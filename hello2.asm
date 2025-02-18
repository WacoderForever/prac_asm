section .data
    message db "Hello World",10         ;string with newline
    len equ $ - message                  ;length of message

section .text
    global _start
_start:
    mov eax,1               ;write syscall
    mov edi,1               ;file descriptor (stdout)
    mov esi,message         ;ponter to the messsage
    mov edx,len             ;length of the message
    syscall

    mov eax,60              ;exit syscall
    xor edi,edi
    syscall
    
