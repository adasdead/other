extern printf

section .data
    fmt     db      "%.0f ", 0
    nl      db      0xa, 0

    align 32

    fmtrx   dq      1.,  1., 0., 0.
            dq      1.,  0., 0., 0.
            dq      0.,  0., 0., 0.
            dq      0.,  0., 0., 0.

section .bss
    alignb 32

    result  resq    16

section .text
    global main

main:
    push rbp
    mov rbp, rsp

    mov rcx, 16
    mov rdi, result
    mov rsi, fmtrx
    rep movsd

    xor r12, r12

.lp:
    inc r12

    movsd xmm0, [result]

    mov rax, 1
    lea rdi, [fmt]
    call printf

    mov rdi, fmtrx 
    mov rsi, result
    mov rdx, result
    call mtrx_mul4x4 

    cmp r12, 15
    jne .lp

    xor rax, rax
    lea rdi, [nl]
    call printf

    leave
    ret

mtrx_mul4x4:
    push rbp
    mov rbp, rsp

    xor rbx, rbx
	vzeroall

.lp:       
    vmovapd ymm0, [rsi]
    
    vbroadcastsd ymm1, [rdi + rbx]
    vfmadd231pd ymm12, ymm1, ymm0
    
    vbroadcastsd ymm1, [rdi + 32 + rbx]
    vfmadd231pd ymm13, ymm1, ymm0
    
    vbroadcastsd ymm1, [rdi + 64 + rbx]
    vfmadd231pd ymm14, ymm1, ymm0
    
    vbroadcastsd ymm1, [rdi + 96 + rbx]
    vfmadd231pd ymm15, ymm1, ymm0

    add rsi, 32

    add rbx, 8
    cmp rbx, 32
    jne .lp

    vmovapd [rdx], ymm12
    vmovapd [rdx + 32], ymm13
    vmovapd [rdx + 64], ymm14
    vmovapd [rdx + 96], ymm15
    
    leave
    ret
