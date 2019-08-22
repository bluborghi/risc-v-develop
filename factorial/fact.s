
.global _start

.section .data
    res: .dword 0
.section .text

_start:
    li a2, 5
    jal ra, fact
    
    #la t1, res
    #sd a0, 0(t1)

    #li a0, 0 #write on stdout
    #la a1, res
    #li a2, 8
    #li a7, 64 #sys write
    #ecall

    li a7, 93
    ecall


fact:
    li t0, 0
    beq a2, t0, L0
    li t0, 1
    beq a2, t0, L0
    
    addi sp, sp, -8
    sd a2, 0(sp)
    addi a2, a2, -1
    jal ra, fact
    ld a2, 0(sp)
    addi sp, sp, +8
    mul a0, a0, a2
    ret

L0:
    li a0, 1
    ret
    


