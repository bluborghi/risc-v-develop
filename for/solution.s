#
# stampare i numeri interi compresi tra 0 e 9
# salvati in una zona di memoria inizializzata
# col carattere '0'
#
# indice e limite loop
#
# int  i =  0;
# int  n = 10;
#
# carattere da stampare
# ( Ã¨ giÃ  in ASCII )
#
# char c = '0';
#
# for (i = 0; i < n; ++i) {
#
#        write(c);
#
#        c = c + 1;
# }


.equ _SYS_WR, 64
.equ _SYS_EX, 93

.global _start

.section .rodata
    n: .dword 9

.section .text

_start:
    li t0, 0
    ld t1, n

	loop:
        blt t1, t0, exit # if t1 < t0 then exit
		
	
		#
		# incrementa il numero
		#
		
		
		#
		# logica di controllo del for
		#
		addi	t0, t0, +1
		j loop

	
	exit:
	# esce dal programma
	li	a7, _SYS_EX
	ecall
	