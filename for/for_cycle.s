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
    li a2, 5
    li a7, 64 #sys write
    
    la a1, msg
    ecall
    la a1, newline
    ecall

    lb t3, (msg)
    addi t3, t3, 1
    sb t3, (msg)

    addi t0, t0, +1
    j loop
exit:        
    li a7, 93
    ecall
