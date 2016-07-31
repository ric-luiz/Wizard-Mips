.data
	fim: .word  #Letra F
				70,60,5,60, 70,60,30,5, 70,80,20,5, 
				#Letra I
				110,60,5,60, 
				#Letra M
				125,60,5,60, 125,60,60,5, 153,60,5,50, 180,60,5,60
.text
main:
	#Recupera os dados da memoria
		montar:bgt $8,112,sairmontar	
			lw $15,fim($8)
			add $15,$15,$20
			lw $16,fim+4($8)
			lw $17,fim+8($8)
			lw $18,fim+12($8)
			li $10,0xff0000
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
