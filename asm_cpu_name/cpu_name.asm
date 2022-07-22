extern printf

section .data
    fmt         db      "Processor name: %s", 0xa, 0

section .bss
    brand_str   resb    0x30

section .text
    global main

main:
    push rbp
    mov rbp, rsp

    mov r12, 80000001H
    xor r13, r13
    
.namel:
    inc r12
    mov rax, r12
    cpuid
    
    mov [brand_str + r13], rax
    mov [brand_str + r13 + 4], rbx
    mov [brand_str + r13 + 8], rcx
    mov [brand_str + r13 + 12], rdx

    add r13, 16

    cmp r13, 32
    jna .namel
    
    xor rax, rax
    lea rdi, [fmt]
    lea rsi, [brand_str]
    call printf

    leave
    ret