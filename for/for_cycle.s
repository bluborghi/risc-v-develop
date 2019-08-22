.global _start


.section .rodata
    n: .dword 10
    newline: .byte '\n'
.section .data    
    msg: .byte '0'
.section .text

_start:
    li t0, 0
    ld t1, n
loop:
    blt t1, t0, exit # if t1 < t0 then exit
    
    li a0, 0 #write on stdout
    la a1, msg
    li a2, 1
    li a7, 64 #sys write
    ecall
    li a0, 0 #write on stdout
    la a1, newline
    li a2, 1
    li a7, 64 #sys write
    ecall

    la t4, msg
    lb t3, 0(t4)
    addi t3, t3, 1
    sb t3, 0(t4)

    addi t0, t0, +1
    j loop
exit:        
    li a7, 93
    ecall
