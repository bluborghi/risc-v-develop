.global _start

.section .data
    bits: .byte 64,32,16,8,4,2,1
    

.section .text

_start: 
    li t3,1     #i 0000001 bin
    li t2,64    #n 1000000 bin
    li t4,73    #input (0~127) 90=1011010 73=1001001
    li t6,0     #0 if the number of ones is even, 1 if it's odd
loop1:
    and t0,t3,t4
    beq t0,t3,then1
    j endif1
then1:  #1 found
    beq t6, zero,then2
    j else2
then2: #ones were even, i've found a 1 so now they're odd, i need to add 1 to obtain even parity
    li t6,1
    j endif2
else2: #ones were odd, i've found a 1 so now they're even, i need to add 0 to obtain even parity  
    li t6,0
endif2:
endif1: #0 found, number of ones does not change
        
    li t0,2
    mul t3,t3,t0 #i=i*2
    ble t3, t2, loop1 
endloop1: 
    
    li t1, 128
    mul t6, t6,t1 #0 remains 0, 1 becomes 128 aka 10000000 bin
    or t0, t4, t6 #t0 is the result
    
    li a7, 93
    ecall
