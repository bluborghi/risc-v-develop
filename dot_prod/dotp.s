.global _start

.section .data
    a: .dword 24,21,44,12,215
    b: .dword 124,66,130,101,4
    n: .dword 5

.section .text

_start: 
    la t2,n  #numerosita
    ld t2,0(t2)
    li t3,0     #i
    li t5,0     #dot product
    
l1:
    bge t3, t2, endl1 # if i>=n break
    la t0,a 
    li t4,8
    mul t6, t3, t4
    add t0,t0,t6
    ld t0,0(t0)
    la t1,b
    add t1,t1,t6
    ld t1,0(t1)
    
    mul t4,t0,t1
    add t5,t5,t4
    
    addi t3,t3,1 #i++
    j l1
endl1: #t5 equal dot product of a and b
    li a7, 93
    ecall
    
