section .text
    global factorial

factorial:
    push rbp
    mov rbp, rsp

    cmp rdi, 0
    jne .rec

    mov rax, 1
    jmp .exit

.rec:
    mov rbx, rdi
    push rbx

    dec rdi
    call factorial

    pop rbx
    imul rbx

.exit:
    leave
    ret