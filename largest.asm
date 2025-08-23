section .data
    a dd 1,2,3,4,5,6,7,8
    len equ ($ - a)/4
    message db "The max value is "
    mlen equ $ - message
    nl db 10

section .text
global _start
_start:
    mov     rcx, len        ; loop counter
    mov     rsi, a          ; pointer to array start
    mov     eax, [rsi]      ; current max in eax (32-bit, zero/sign extend if needed)
    dec     rcx             ; we already used a[0]

not_fn:
    jz      complete        ; if rcx == 0 done
    add     rsi, 4          ; next int
    mov     edx, [rsi]      ; load it
    cmp     eax, edx
    jge     skip
    mov     eax, edx        ; update max
skip:
    dec     rcx
    jmp     not_fn

complete:
    ; rax has max (in low 32 bits). Print message + max.
    mov     r10d, eax       ; save max in r10d

    ; print message
    mov     rax, 1
    mov     rdi, 1
    mov     rsi, message
    mov     rdx, mlen
    syscall

    ; ---- quick+dirty: print raw binary 4 bytes (not ASCII!) ----
    ; if you want ASCII, you need integer → string conversion like I showed before.
    mov     eax, 1
    mov     edi, 1
    lea     rsi, [r10]      ; address of max value
    mov     rdx, 4
    syscall

    ; newline
    mov     eax, 1
    mov     edi, 1
    mov     rsi, nl
    mov     rdx, 1
    syscall

    ; exit
    mov     eax, 60
    xor     edi, edi
    syscall
