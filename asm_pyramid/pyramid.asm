extern putchar

section .text
    global main

main:
    push rbp 
    mov rbp, rsp

    xor rcx, rcx

.pyrl:
    inc rcx
    push rcx

    mov rax, 10
    sub rax, rcx
    push rcx

    mov rcx, rax

.spcl:
    dec rcx
    push rcx

    mov rdi, 0x20
    call putchar

    pop rcx
    cmp rcx, 0
    jge .spcl

    pop rcx
    mov rax, 2
    imul rcx
    mov rcx, rax
    dec rcx

.strl:
    dec rcx
    push rcx

    mov rdi, 0x2a
    call putchar

    pop rcx
    cmp rcx, 0
    jge .strl

    mov rdi, 0xa
    call putchar

    pop rcx
    cmp rcx, 10
    jne .pyrl

    leave
    ret