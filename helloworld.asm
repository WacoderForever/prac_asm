%include "io64.inc"
section .data
    message:db "Hello World",10
    len:equ $ - message
section .text
global CMAIN
CMAIN:
    ;write your code here
   mov rax,1
   mov rdi,1
   mov rsi,message
   mov rdx,len
   syscall
   
   mov rax,60
   mov rdi,
   syscall