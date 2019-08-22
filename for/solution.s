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

.section .data
	num:	.byte '0', ' ', '\n'

.section .text

_start:

	#
	# parametri della write
	#
	la	a1, num
	#
	# due byte per stampare anche lo spazio
	li	a2, 3
	li	a7, _SYS_WR
	
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
		lb	s0, (a1)
		addi	s0, s0, +1
		sb	s0, (a1)
		
		#
		# logica di controllo del for
		#
		addi	t0, t0, +1
		blt	t0, t1, loop

	# stampa a capo
	li	a2, 1
	addi	a1, a1, 2
	ecall
	
	# esce dal programma
	li	a7, _SYS_EX
	ecall
	