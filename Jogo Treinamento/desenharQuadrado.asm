.data
	posicaoBloco: .word 30,30,10,10
	mapaCenario: .word	0,0,62,1, 0,0,1,62
.text

main:
	jal iniciarCenario					
	update:	#aqui temos o loop de animação									
			
		jal lerTeclado	#pooling do teclado									 
						
	j update		
end: li $2,10
     syscall 

#função para desenhar um simples quadrado
quadrado:
		addi $sp,$sp,-4 #tiramos o espaço de memoria
		sw $ra, ($sp)							
								
		row:beq $11,$18,end_row						
			col:beq $12,$17,end_col											
				jal coordenadas
				jal desenhar_pixel
				addi $15,$15,1 #Adiciona mais um para avança nas colunas
				addi $12,$12,1 #contador de colunas
				j col
			end_col:			
			
			addi $16,$16,1  #Adiciona mais um para avança nas linhas
			addi $11,$11,1  #contador de linhas
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
         
#função que converte os dados do plano cartesiano para o mips entender onde desenhar                    
# x = $15
# y = $16
coordenadas: 		
		add $14,$0,$0	#Reset, só por precaução						
		sll $14,$16,8	#Faz as devidas conversões para o mips	
		sll $13,$15,2	
		add $14,$14,$13						
		
	jr $ra

#Desenha um unico pixel na tela	
desenhar_pixel:
		lui $9, 0x1001		
		add $9,$9,$14
	    sw $10, 0($9)	    
	    
	jr $ra

limparBackground:
		addi $sp,$sp,-4 #tiramos o espaço de memoria
		sw $ra, ($sp)

		li $10,0x0000	#cor black
		jal quadrado
		
		#recupera o que esta na memoria
		lw $ra, ($sp)
		addi $sp,$sp,4	
	jr $ra

# Função para ler o teclado. Dentro dela é feito as alterações do jogador
lerTeclado:			  	
		addi $sp,$sp,-4 #tiramos o espaço de memoria
		sw $ra, ($sp)
	  	
	  	lui $19,0xffff	#Recupera o valor que esta no enderço do leitor de teclado
	  	lw $20,0($19)	#Os endereços ficam em 0xffff0004		
		naoZero:beqz  $20,endNaoZero
			lw $20,4($19)			
			jal	player #desenha o player caso tenha pressionado alguma tecla			
		endNaoZero:	
	  	 		  			  	  			  			  	  			  	
	  	#recupera o que esta na memoria
		lw $ra, ($sp)
		addi $sp,$sp,4		  	  			  			  	  			  	  			  	
	jr $ra

#Desenha o jogador na posição especificada
player:
		addi $sp,$sp,-4 #tiramos o espaço de memoria
		sw $ra, ($sp)
		
		#coordenadas x e y
		lw $15,posicaoBloco
		lw $16,posicaoBloco+4	
		#Width e height da figura
		lw $17,posicaoBloco+8
		lw $18,posicaoBloco+12	
		jal limparBackground	#limpar o back do player
		
		jal movePlayer
		
		#coordenadas x e y
		lw $15,posicaoBloco
		lw $16,posicaoBloco+4	
		#Width e height da figura
		lw $17,posicaoBloco+8
		lw $18,posicaoBloco+12				
		li $10,0x00ff #cor do quadrado		
		jal quadrado
		
		#recupera o que esta na memoria
		lw $ra, ($sp)
		addi $sp,$sp,4
	jr $ra

movePlayer:
		addi $sp,$sp,-4 #tiramos o espaço de memoria
		sw $ra, ($sp)
		
		#Verifica se apertou 'a' no teclado
		a:bne $20,97,naoA
			li $14,-1
			jal moveHorizontal
		naoA:
	
		#Verifica se apertou 'd' no teclado
		d:bne $20,100,naoD
			li $14,1
			jal moveHorizontal
		naoD:
		
		#Verifica se apertou 'w' no teclado
		w:bne $20,119,naoW
			li $14,-1
			jal moveVertical
		naoW:
		
		#Verifica se apertou 's' no teclado
		s:bne $20,115,naoS
			li $14,1
			jal moveVertical
		naoS:
	
		#recupera o que esta na memoria
		lw $ra, ($sp)
		addi $sp,$sp,4
	jr $ra
	
#Faz a movimentação para Left ou Right, O parametro deve ser passado no reg $14
moveHorizontal:
		lw $15,posicaoBloco
		add $15,$15,$14
		sw $15,posicaoBloco
	jr $ra	
	
#Faz a movimentação para Up ou Down, O parametro deve ser passado no reg $14
moveVertical:		
		lw $16,posicaoBloco+4
		add $16,$16,$14
		sw $16,posicaoBloco+4	
	jr $ra	
			
#Inicia o Cenario do Jogo	
iniciarCenario:
		addi $sp,$sp,-4 #tiramos o espaço de memoria
		sw $ra, ($sp)
		
		jal player
		
		#recupera o que esta na memoria
		lw $ra, ($sp)
		addi $sp,$sp,4
	jr $ra
	
#ainda nao implementado
desenharMapa:
		addi $sp,$sp,-4 #tiramos o espaço de memoria
		sw $ra, ($sp)

		li $11,0
		elementosMapa: bge $11,24,elementosMapaEnd
			#coordenadas x e y
			lw $15,mapaCenario($11)
			lw $16,mapaCenario+4($11)	
			#Width e height da figura
			lw $17,mapaCenario+8($11)
			lw $18,mapaCenario+12($11)			
			li $10,0x00ff #cor do quadrado		
			jal quadrado
			
			addi $11,$11,12
			j elementosMapa
		elementosMapaEnd:
		
		li $11,0
		#recupera o que esta na memoria
		lw $ra, ($sp)
		addi $sp,$sp,4
	jr $ra
