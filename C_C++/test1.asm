section .text

global asm_add,asm_multiply,asm_sqrt,asm_str_copy,asm_double_array_vals

; ============================================
; int32_t asm_add(int32_t a, int32_t b)
; Parameters: a in EDI, b in ESI
; Returns: sum in EAX
; ============================================

asm_add:
    mov eax,edi
    add eax,esi
    ret

; ============================================
; int64_t asm_multiply(int64_t a, int64_t b)
; Parameters: a in RDI, b in RSI
; Returns: product in RAX
; ============================================

asm_multiply:
    mov rax,rdi
    imul rax,rsi
    ret

; ============================================
; double asm_sqrt(double a)
; Parameters: a in XMM0
; Returns: sqrt in XMM0
; ============================================

asm_sqrt:
    sqrtsd xmm0,xmm0
    ret

; ===================================================
; void asm_str_copy(const char *message,char *buffer)
; Parameters: *message in RDI *buffer in RSI
; ===================================================

asm_str_copy:
    push rbx        ;save callee-saved register
    mov rbx,rdi     ;move pointer to rbp

    .copy_process:
        mov al,[rbx]    ;move byte to AL
        mov [rsi],al    ;copy to destination
        test al,al
        jz .copy_done
        inc rbx
        inc rsi
        jmp .copy_process

    .copy_done:
        pop rbx
        ret    

; =====================================================
; void asm_double_array_vals(int32_t *array,size_t len)
; Parameters: *array in RDI ans len in RSI
; ======================================================

asm_double_array_vals:
    push rbp
    mov rbp,rsp

    push r12
    push r13
    push r14

    ;save parameters
    mov r12,rdi
    mov r13,rsi

    test r13,r13
    jz .done

    xor r14,r14

    .doubling:
        mov edi,[r12 + r14*4]
        ; Call C++ function
        ; Note: We must preserve XMM registers if using them
        call cpp_callback  ; Returns value in EAX
        ;Store value in array
        mov [r12+r14*4],eax
        inc r14
        cmp r14,r13
        jl .doubling

    .done:
        lea rdi,[message]
        ; Call to C++ function
        call cpp_print_message

        pop r14
        pop r13
        pop r12
        ret

section .data
message db "Hello from Assembly",0