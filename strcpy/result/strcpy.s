#
# inserire le direttive opportune per permettere lâ€™assemblamento.
# Inserire le stringhe x e y nel segmento dati.
# Aggiungere le direttive viste nellâ€™esempio precedente.
# Aggiungere la chiamata alla funzione exit.
# Inserire lâ€™etichetta start, il caricamento degli indirizzi e la chiamata alla funzione strcpy

strcpy:
	addi	sp,sp,-8	# adjust stack for 1 dw
	sd	x19,0(sp)	# push x19
	add	x19,x0,x0	# i=0
L1: 
	add	x5,x19,x11	# x5 = addr of y[i]
	lbu	x6,0(x5)	# x6 = y[i]
	add	x7,x19,x10	# x7 = addr of x[i]
	sb	x6,0(x7)	# x[i] = y[i]
	beq	x6,x0,L2	# if y[i] == 0 then exit
	addi	x19,x19, 1	# i = i + 1
	jal	x0,L1		# next iteration of loop
L2: 
	ld	x19,0(sp)	# restore saved x19
	addi	sp,sp,8		# pop 1 dw from stack
	jalr	x0,0(x1)	# and return
    