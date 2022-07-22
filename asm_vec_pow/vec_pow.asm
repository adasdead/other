extern printf

section .data
    align 32

    vec   dd   9, 7, 2
    fmt   db   "%d %d %d", 0xa, 0

section .text
    global main

main:
    push rbp
    mov rbp, rsp

    vmovdqa xmm0, [vec]
    vpmulld xmm0, xmm0
    call printv

    leave
    ret

printv:
    push rbp
    mov rbp, rsp

    vpextrd rsi, xmm0, 0
    vpextrd rdx, xmm0, 1
    vpextrd rcx, xmm0, 2

    xor rax, rax
    lea rdi, [fmt]
    call printf

    leave
    ret