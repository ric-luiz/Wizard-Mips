.data

.text
	update:
		lui $12,0xffff	#Recupera o valor que esta no enderço do leitor de teclado
		lw $13,0($12)	#O bit que verifica se foi clicado alguma tecla fica em 0xffff0000
		
		naoZero:beqz $13,endNaoZero	#verifica se existe algo no endereço 0xffff0000
			#Após fazer o 'lw', o mips seta para 0 o endereço 0xffff0000
			lw $14,4($12)	#Os numeros ascii ficam em 0xffff0004
			li $2,1
			move $4,$14			
			syscall		
		endNaoZero:
	j update

