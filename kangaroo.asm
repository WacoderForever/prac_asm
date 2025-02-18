; code to convert the string 'KANGAROO' to 'kangaroo'
section .data
    Snippet db "KANGAROO"

section .text
    global _start

_start: nop
        mov ebx,Snippet     ;note that this copies the address and not the value of Snippet
        mov eax,8

DoMore: add byte [ebx],32   ;[ebx] points data in the memory
        inc ebx
        dec eax
        jnz DoMore
        nop

