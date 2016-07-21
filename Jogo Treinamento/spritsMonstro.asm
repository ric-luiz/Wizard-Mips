.data
	monster_right: .word #head 
	              		 18,36,6,2,
	              		 18,38,2,2,
	              		 22,38,4,2,
	              		 18,40,10,2,
	              		 #body
	              		 16,42,6,2,
	              		 14,44,14,2,
	              		 14,46,8,2,
	              		 #leg Right
	              		 14,48,4,2,
	              		 12,50,4,2,
	              		 #leg Left
	              		 20,48,4,2,
	              		 22,50,4,2,	
	              		 #tail
	              		 12,36,2,2,              		 
	              		 14,38,2,2,
	              		 12,40,2,4,

	monster_left:  .word #head 
	              		 16,36,6,2,
	              		 20,38,2,2,
	              		 14,38,4,2,
	              		 12,40,10,2,
	              		 #body
	              		 18,42,6,2,
	              		 12,44,14,2,
	              		 18,46,8,2,
	              		 #leg Right
	              		 16,48,4,2,
	              		 14,50,4,2,
	              		 #leg Left
	              		 22,48,4,2,
	              		 24,50,4,2,	
	              		 #tail
	              		 26,36,2,2,              		 
	              		 24,38,2,2,
	              		 26,40,2,4,
	              		
	monster_up:	   .word #head 
	              		 26,40,2,6,
	              		 24,44,2,2,
	              		 24,38,2,4,
	              		 22,36,2,10,
	              		 #body
	              		 20,42,2,6,
	              		 18,36,2,14,
	              		 16,42,2,8,
	              		 #leg Right
	              		 14,40,2,4,
	              		 12,38,2,4,
	              		 #leg Left
	              		 14,46,2,4,
	              		 12,48,2,4,	
	              		 #tail
	              		 26,50,2,2,              		 
	              		 24,48,2,2,
	              		 20,50,4,2,
	              		
	monster_down:  .word #head 
	              		 26,42,2,6,
	              		 24,42,2,2,
	              		 24,46,2,4,
	              		 22,42,2,10,
	              		 #body
	              		 20,40,2,6,
	              		 18,38,2,14,
	              		 16,38,2,8,
	              		 #leg Right
	              		 14,38,2,4,
	              		 12,36,2,4,
	              		 #leg Left
	              		 14,44,2,4,
	              		 12,46,2,4,	
	              		 #tail
	              		 26,36,2,2,              		 
	              		 24,38,2,2,
	              		 20,36,4,2,
		
.text
main:
	#Recupera os dados da memoria
	montar:bgt $8,208,sairmontar	
		lw $15,monster_right($8)
		lw $16,monster_right+4($8)
		lw $17,monster_right+8($8)
		lw $18,monster_right+12($8)
		li $10,0xffffff		
		jal desenharQuadrado
		
		addi $8,$8,16
		j montar						
	sairmontar:
	
	li $15,12
		li $16,36
		li $17,16
		li $18,16
		li $10,0xffffff		
		jal desenharQuadrado
						
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
