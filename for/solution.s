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

.section .text

_start:

	
	
	# contatore ciclo for
	li	t0, 0

	# numero di cicli da
	# fare
	li	t1, 10

	loop:

		# stampa
		li	a0, 0
		ecall
	
		#
		# incrementa il numero
		#
		
		
		#
		# logica di controllo del for
		#
		addi	t0, t0, +1
		blt	t0, t1, loop

	
	
	# esce dal programma
	li	a7, _SYS_EX
	ecall
	