.data
	array_cenario: .word #Bordas do jogo
						 4,32,248,4,  #Barra Superior
	                     4,32,8,120,  #Barra da Esquerda
	                     4,152,248,4, #Barra Inferior
	                     244,32,8,120, #Barra da Direita
	                     #1º linha de barras
	                     28,52,44,4,
	                     88,52,8,24,
	                     112,52,32,4,
	                     160,52,8,24,
	                     184,52,44,4,
	                     #2º linha de barras
	                     28,72,24,4,
	                     68,72,20,4,
	                     112,72,32,4,
	                     168,72,20,4,
	                     204,72,24,4,
	                     #3º linha de barras
	                     12,92,16,4,
	                     44,92,8,24,
	                     68,76,8,20,
	                     92,92,28,4,
	                     136,92,28,4,
	                     180,72,8,24,
	                     204,92,8,24,
	                     228,92,16,4,
	                     #4º linha de barras
	                     28,112,16,4,
	                     68,112,8,24,
	                     92,96,8,20,	                     
	                     116,112,4,24,
	                     136,112,4,24,
	                     156,96,8,24,
	                     180,112,8,24,
	                     212,112,16,4,
	                     #5º linha de barras
	                     28,116,8,20,
	                     52,132,16,4,
	                     92,136,8,16,
	                     156,136,8,16,
	                     188,132,16,4,
	                     220,116,8,20
		
.text
main:
	#Recupera os dados da memoria
	montar:bgt $8,560,sairmontar	
		lw $15,array_cenario($8)
		lw $16,array_cenario+4($8)
		lw $17,array_cenario+8($8)
		lw $18,array_cenario+12($8)
		li $10,0x00ff
		jal desenharQuadrado
		
		addi $8,$8,16
		j montar
	sairmontar:
						
end: li $2,10
     syscall
     
desenharQuadrado:
	addi $sp,$sp,-4 #tiramos o espaço de memoria
	sw $ra, ($sp)	
				
		row:beq $11,$18,end_row			
			
			col:beq $12,$17,end_col											
				jal converter
				jal desenharPixel
				addi $15,$15,1  #Adiciona mais um para avança nas colunas
				addi $12,$12,1	#contador de colunas
				j col
			end_col:			
			
			addi $16,$16,1	#Adiciona mais um para avança nas linhas
			addi $11,$11,1	#contador de linhas
			addi $12,$0,0	#reset no contador das colunas
			sub $15,$15,$17 #reset na coordenada x
			j row
		end_row:
			
		#reseta os contadores
		li $12,0
		li $11,0	
	
	#recupera o que esta na memoria
	lw $ra, ($sp)
	addi $sp,$sp,4	
jr $ra

#Faz a conversão de plano cartesiano para array de pixel (que é como o mips entende)
converter:
	sll $14,$16,10
	sll $13,$15,2
	add $14,$14,$13
jr $ra

#Desenha um unico pixel na tela
desenharPixel:	
	lui $9,0x1001
	add $9,$9,$14
	sw $10,0($9)
jr $ra