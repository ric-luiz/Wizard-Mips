.data
	zero:   .word 166,160,3,16, 166,160,13,3, 179,160,3,16, 166,172,13,4, #48
	um:     .word 174,160,3,16, #0
	dois:   .word 166,160,8,3, 174,160,3,16, 174,173,8,3, #32
	tres:   .word 166,160,8,3, 174,160,3,16, 166,175,11,3, 166,167,8,3, #48
	quatro: .word 166,160,3,8, 174,160,3,16, 166,167,11,3, #32
	cinco:  .word 166,160,8,3, 166,160,3,8, 166,173,9,3, 166,167,8,3, 172,167,3,8 #64
	seis:   .word 166,160,3,16, 166,160,10,3, 166,167,8,3, 166,173,11,3, 174,167,3,8 #64
	setew:  .word 179,160,3,16, 172,160,8,3, #16
	oito:   .word 170,160,3,16, 178,160,3,16, 170,160,8,3, 170,166,8,3, 170,173,8,3, #64
	novew:   .word 178,160,3,16, 170,160,8,3, 170,166,8,3, 168,160,3,9 #48
		
.text
main:
	#Recupera os dados da memoria
	desenhar: bgt $20,60,nDesenhar
		montar:bgt $8,64,sairmontar	
			lw $15,novew($8)
			add $15,$15,$20
			lw $16,novew+4($8)
			lw $17,novew+8($8)
			lw $18,novew+12($8)
			li $10,0xffffff
			jal desenharQuadrado
		
			addi $8,$8,16		
			j montar
		sairmontar:
		
		addi $20,$20,20
		li $8,0
		j desenhar
	nDesenhar:
	
						
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
