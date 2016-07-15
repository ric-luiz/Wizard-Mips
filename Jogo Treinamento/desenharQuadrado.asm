.data
	array_colisoes: .word 1,1,1,1,1,1,1,1
	shape_player: .word 120,120,16,16 #Possui a seguinte ordem: x,y,width,height
	array_player: .word #Player Right || 0-160(posição na memoria)
						#Head				  	              
				  		122,120,6,2,
	              		122,122,4,2,
	              		120,124,8,2,
	              		#Body
	              		120,126,10,4,
	              		122,128,8,4,
	              		#Gun
	              		134,126,2,6,
	              		130,128,4,2,
	              		#Legs Left
	              		122,132,4,2,
	              		120,134,4,2,
	              		#Legs Right
	              		128,132,4,2,
	              		130,134,4,2,
	              		
	              		#Player Left || 176-366(posição na memoria)
	              		#Head				  	              
				  		128,120,6,2,
	              		130,122,4,2,
	              		128,124,8,2,
	              		#Body
	              		126,126,10,4,
	              		126,128,8,4,
	              		#Gun
	              		120,126,2,6,
	              		122,128,4,2,
	              		#Legs Left
	              		130,132,4,2,
	              		132,134,4,2,
	              		#Legs Right
	              		124,132,4,2,
	              		122,134,4,2,
	              		
	              		#Player up || 352-512(posição na memoria)
	              		#Head				  	              
				  	    134,128,2,6,
	              	    132,130,2,4,
	              	    130,128,2,8,
	              	    #Body
	              	    126,126,4,10,
	              	    124,126,2,8,
	              	    #Gun
	              		124,120,6,2,
	              		126,122,2,4,
	              		#Legs Left
	              		120,122,2,4,
	              		122,124,2,4,
	              		#Legs Right
	              		120,132,2,4,
	              		122,130,2,4,	 
	              		             				              			
	              		#Player Down || 528-688(posição na memoria)
						#Head				  	              
				  	    120,122,2,6,
	              	    122,122,2,4,
	              	    124,120,2,8,
	              	    #Body
	              	    126,120,4,10,
	              	    130,122,2,8,
	              	    #Gun
	              		126,134,6,2,
	              		128,130,2,4,
	              		#Legs Left
	              		134,130,2,4,
	              		132,128,2,4,
	              		#Legs Right
	              		134,120,2,4,
	              		132,122,2,4
	              		
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
	                     92,96,8,24,	                     
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
	jal iniciarJogo			
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
		sub $16,$16,$18 #reset na coordenada x	
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

limparBackgroundPlayer:
		addi $sp,$sp,-4 #tiramos o espaço de memoria
		sw $ra, ($sp)
		
		lw $15,shape_player
		lw $16,shape_player+4
		lw $17,shape_player+8
		lw $18,shape_player+12
		li $10,0x0000 #cor do quadrado	
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
		
		#Recuperar a forma do player
		lw $15,shape_player
		lw $16,shape_player+4
		lw $17,shape_player+8
		lw $18,shape_player+12
		
		jal movePlayer
				
		#recupera o que esta na memoria
		lw $ra, ($sp)
		addi $sp,$sp,4
	jr $ra

desenharPlayer:
		addi $sp,$sp,-4 #tiramos o espaço de memoria
		sw $ra, ($sp)	
		
		montar:bgt $8,$25,sairmontar	
			lw $15,array_player($8)
			lw $16,array_player+4($8)
			lw $17,array_player+8($8)
			lw $18,array_player+12($8)			
			jal quadrado
		
			addi $8,$8,16
			j montar
		sairmontar:
		
		#recupera o que esta na memoria
		lw $ra, ($sp)
		addi $sp,$sp,4	
	jr $ra

movePlayer:
		addi $sp,$sp,-4 #tiramos o espaço de memoria
		sw $ra, ($sp)
		
		#verifica se o player está batendo em algo
		add $14,$0,$0	#Garante que o reg esteja inicialmente com 0		
		
		#Verifica se apertou 'a' no teclado
		a:bne $20,97,naoA
		    addi $15,$15,-1	#Ajuste. Não detecta ao encostar no elemento						
			jal colidiuCenario									
			beq $14,1,naoA
				#apaga o desenho
				jal limparBackgroundPlayer
				
				#Atualiza o desenho
				li $14,-4
				jal moveHorizontal
				
				#Redesenha na nova posição
				li $8,176
				li $25,336
				li $10,0xff00	#Cor para do personagem
				jal desenharPlayer								
		naoA: li $8,0 #Reseta o contador
		      li $25,0
	
		#Verifica se apertou 'd' no teclado
		d:bne $20,100,naoD	
			addi $15,$15,1	#Ajuste. Não detecta ao encostar no elemento							
			jal colidiuCenario
			add $26,$14,$0			
			beq $14,1,naoD
				#apaga o desenho
				jal limparBackgroundPlayer
				
				#Atualiza o desenho
				li $14,4
				jal moveHorizontal
				
				#Redesenha na nova posição
				li $8,0
				li $25,160
				li $10,0xff00	#Cor para do personagem
				jal desenharPlayer
		naoD: li $8,0 #Reseta o contador
		      li $25,0
		
		#Verifica se apertou 'w' no teclado
		w:bne $20,119,naoW
			addi $16,$16,-1	#Ajuste. Não detecta ao encostar no elemento							
			jal colidiuCenario
			beq $14,1,naoW							
				#apaga o desenho
				jal limparBackgroundPlayer
				
				#Atualiza o desenho
				li $14,-4				
				jal moveVertical
				
				#Redesenha na nova posição
				li $8,352
				li $25,512
				li $10,0xff00	#Cor para do personagem
				jal desenharPlayer
		naoW: li $8,0 #Reseta o contador
		      li $25,0			
		
		#Verifica se apertou 's' no teclado
		s:bne $20,115,naoS
			addi $16,$16,1	#Ajuste. Não detecta ao encostar no elemento							
			jal colidiuCenario
			beq $14,1,naoS				
				#apaga o desenho
				jal limparBackgroundPlayer
				
				#Atualiza o desenho
				li $14,4
				jal moveVertical
				
				#Redesenha na nova posição
				li $8,528
				li $25,688
				li $10,0xff00	#Cor para do personagem
				jal desenharPlayer							
		naoS: li $8,0 #Reseta o contador
		      li $25,0
			
		#recupera o que esta na memoria
		lw $ra, ($sp)
		addi $sp,$sp,4
	jr $ra
	
#Faz a movimentação para Left ou Right, O parametro deve ser passado no reg $14
moveHorizontal:
		#Atualiza a forma do player
		lw $15,shape_player
		add $15,$15,$14
		sw $15,shape_player
		
		li $8,0	#garante que o reg esteja em 0
		montarMoverHorizontal:bgt $8,688,sairMontarMoverHorizontal	
				lw $15,array_player($8)
				add $15,$15,$14
				sw $15,array_player($8)											
				
				addi $8,$8,16
				j montarMoverHorizontal
			sairMontarMoverHorizontal:		
	jr $ra	
	
#Faz a movimentação para Up ou Down, O parametro deve ser passado no reg $14
moveVertical:
		#Atualiza a forma do player
		lw $16,shape_player+4
		add $16,$16,$14
		sw $16,shape_player+4
		
		li $8,0	#garante que o reg esteja em 0
		montarMoverVertical:bgt $8,688,sairMontarMoverVertical	
				lw $16,array_player+4($8)
				add $16,$16,$14
				sw $16,array_player+4($8)											
				
				addi $8,$8,16
				j montarMoverVertical
			sairMontarMoverVertical:					
	jr $ra	

#Verifica se colidiu com o cenario. Espera que os reg [15-18] estejam preenchidos com os dados corretos
colidiuCenario:
		addi $sp,$sp,-4 #tiramos o espaço de memoria
		sw $ra, ($sp)
		
		jal alimentarArrayColisaoA #Insere no array de colisões os elementos do quadrado a
		
		#Pega as posições dos quadrados do cenario
		colisaoCenario: bgt $8,560,sairColisaoCenario
			#Recupera os dados da memoria	
			lw $21,array_cenario($8)
			lw $22,array_cenario+4($8)
			lw $23,array_cenario+8($8)
			lw $24,array_cenario+12($8)		
				
			jal alimentarArrayColisaob #Insere no array de colisões os elementos do quadrado b
			jal colidiu	#verifica se colidiu com os elementos do cenario
			add $26,$14,$0
			beq $14,1,sairColisaoCenario
									
			addi $8,$8,16
			j colisaoCenario
		sairColisaoCenario:				
		
		add $8,$0,$0 #Reset no contador
		
		lw $ra, ($sp)
		addi $sp,$sp,4
	jr $ra			

#Faz a verificação da colisão entre os quadrados			
colidiu:		
			lw $21,array_colisoes#esquerda Quadrado A
			lw $22,array_colisoes+24#direita Quadrado B
			add $21,$21,1	#Ajuste. Não detecta ao encostar no elemento
			bgt $21,$22,sairVerificarColisao
			
			lw $21,array_colisoes+8#direita Quadrado A
			lw $22,array_colisoes+16#esquerda Quadrado B
			add $21,$21,-1	#Ajuste. Não detecta ao encostar no elemento
			blt $21,$22,sairVerificarColisao
			
			lw $21,array_colisoes+4#Cima Quadrado A
			lw $22,array_colisoes+28#Baixo Quadrado B
			add $21,$21,1	#Ajuste. Não detecta ao encostar no elemento
			bgt $21,$22,sairVerificarColisao
			
			lw $21,array_colisoes+12#Baixo Quadrado A
			lw $22,array_colisoes+20#Cima Quadrado B
			add $21,$21,-1	#Ajuste. Não detecta ao encostar no elemento
			blt $21,$22,sairVerificarColisao
			
			bateu: addi $14,$0,1 #caso tenha alguma colisão seta para 1
		sairVerificarColisao:
		
	jr $ra

#Alimenta os 4 primeiros bytes do array de colisão com as posições dos lados dos quadrados	
alimentarArrayColisaoA:
		sw $15,array_colisoes
		sw $16,array_colisoes+4
		add $21,$17,$15	#posisão da largura
		add $22,$18,$16 #posisão da altura
		sw $21,array_colisoes+8
		sw $22,array_colisoes+12
	jr $ra
	
#Alimenta os 4 ultimos bytes do array de colisão com as posições dos lados dos quadrados
alimentarArrayColisaob:
		sw $21,array_colisoes+16
		sw $22,array_colisoes+20
		add $21,$21,$23	#posisão da largura
		add $22,$22,$24 #posisão da altura
		sw $21,array_colisoes+24
		sw $22,array_colisoes+28
	jr $ra
#Inicia o Cenario do Jogo	
iniciarJogo:
		addi $sp,$sp,-4 #tiramos o espaço de memoria
		sw $ra, ($sp)
		jal cenario
		jal player
		
		#recupera o que esta na memoria
		lw $ra, ($sp)
		addi $sp,$sp,4
	jr $ra	
cenario:
		addi $sp,$sp,-4 #tiramos o espaço de memoria
		sw $ra, ($sp)
		
		elementosCenario: bgt $8,560,sairElementosCenario
			#Recupera os dados da memoria	
			lw $15,array_cenario($8)
			lw $16,array_cenario+4($8)
			lw $17,array_cenario+8($8)
			lw $18,array_cenario+12($8)
			li $10,0x00ff #cor do quadrado
			jal quadrado
			
			addi $8,$8,16
			j elementosCenario
		sairElementosCenario:		
		
		#Reseta o contador
		addi $8,$0,0
		
		#recupera o que esta na memoria
		lw $ra, ($sp)
		addi $sp,$sp,4
	jr $ra
