extern printf

section .data
    fmt     db      "%d ", 0
    nl      db      0xa, 0

section .text
    global main

main:
    push rbp
    mov rbp, rsp

    mov r13, 1
    xor r12, r12
    mov rcx, r13

.fibl:
    inc rcx

    mov rax, r12
    add rax, r13

    push rcx
    push rax

    lea rdi, [fmt]
    mov rsi, rax
    xor rax, rax
    call printf

    pop rax
    pop rcx

    mov r12, r13
    mov r13, rax

    cmp rcx, 15
    jl .fibl

    xor rax, rax
    lea rdi, [nl]
    call printf

    leave
    ret