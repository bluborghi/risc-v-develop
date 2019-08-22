.global _start


.section .rodata
    n: .dword 10
    msg: .string "ciao"
.section .text

_start:
    li t0, 0
    ld t1, n
loop:
    blt t1, t0, exit # if t1 < t0 then exit
    
    li a0, 0 #write on stdout
    la a1, msg
    li a2, 4
    li a7, 64 #sys write
    ecall
    

    addi t0, t0, +1
    j loop
exit:        
    li a7, 93
    ecall
