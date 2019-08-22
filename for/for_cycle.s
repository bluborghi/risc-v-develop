.global _start


.section .rodata
    n: .dword 9

.section .text

_start:
    li t0, 0
    ld t1, n
loop:
    blt t1, t0, exit # if t1 < t0 then exit
    
    

    addi t0, t0, +1
    j loop
exit:        
    li a7, 93
    ecall
