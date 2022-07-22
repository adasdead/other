extern printf
extern usleep

section .data
    fmt db "%d - 7 = %d", 0xa, 0x0
    end db "Я гуль", 0xa, 0x0

section .text
    global main

main:
    push rbp
    mov rbp, rsp
    
    mov r12, 1000
    
.deadl:
    xor rax, rax
    lea rdi, [fmt]
    mov rsi, r12
    sub r12, 7
    mov rdx, r12
    call printf

    mov rdi, 0xC350 ; 50 ms
    call usleep
    
    cmp r12, 7
    jnl .deadl
    
    xor rax, rax
    lea rdi, [end]
    call printf

    leave
    ret