[BITS 16]       ;16-bit mode
[ORG 0x7C00]    ;where the bootloader is loaded in the memory

start:
    mov si,msg      ;load msg to the source index
    call print      ;call print function       
    jmp $           ;infinite loop  to prevent crashing

print:
    lodsb           ;load [SI] into AL and increment si
    or al,al        ;check if NULL terminator is reached
    jz done
    mov ah,0x0E     ;BIOS interrupt for text output
    int 0x10        ;call BIOS
    jmp print       ;continue printing
done:
    ret             ;return to caller

msg db "Hello from WacoderForever",0    ;message null terminated
times 510-($-$$) db 0                   ;padding the rest with zeros
dw 0xAA55                               ;Boot signature