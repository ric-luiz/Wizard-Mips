.data
	newLine: .asciiz " "
	newBreal: .asciiz "\n" 
	times: .word 1:4 #Tempos de movimento no jogo, 1=tiro,2=monstros,3=personagem
	array_colisoes: .word 1:8
	tipos_colisoes: .word 10:3	#1=colisao player,2 colisao tiro, 3 colisao mosntro
	array_tiros: .word 1:100	#Possui x,y,width,height,direcao (1-right,2-left,3-up,4-down)	
	#Arrays referente aos monstros do jogo
	qtd_monstro: .word 1	#Quantidade de monstros no mapa
	array_monstros: .word 1:896 #no maximo 4 monstros no mapa(com as posicoes:R,L,U,D)
	array_shapes_monster: .word 1:16 #são 4 monstro, por isso 16 numeros alocados
	posicao_monstros: .word 1:5 # 1-right,2-left,3-up,4-down. O ultimo numero corresponde a em qual index inserir
	monster: .word #Monster Right || 0-160(posição na memoria)
				   #head
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
	               
	               #Monster Left || 176-366(posição na memoria)
	               #head 
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
	               
	               #Monster up || 352-512(posição na memoria)
	               #head 
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
	               
	               #Monster Down || 528-688(posição na memoria)
	               #head 
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
	#Arrays Referentes ao jogador	
	posicao_player: .word 3	# 1-right,2-left,3-up,4-down
	aportou_tecla: .word 1
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
	li $27,0	#time		
	update:	#aqui temos o loop de animação									
		jal atualizarTiros	#Atualiza os tiros do jogo		
						
		jal lerTeclado	#pooling do teclado									 
		
		jal monstro	#Faz as operações relacionadas aos monstros do mapa
		
		#Atualizando times do jogo
		jal atualizarTempoTiro
		jal atualizarTempoMonstros
		jal atualizarTempoPlayer
	j update		
end: li $2,10
     syscall 

#Atualiza o array de tempos na posição que corresponde o tempo de refresh de tiros
atualizarTempoTiro:	
		lw $27,times
		addi $27,$27,1	#incrementa mais 1 no time
	
		blt $27,250,naoResetTempoTiro								
			li $27,0 #reset time		
		naoResetTempoTiro:
	
		sw $27,times	
	jr $ra
	
#Atualiza o array de tempos na posição que corresponde o tempo de refresh dos monstros	
atualizarTempoMonstros:	
	
	lw $27,times+4
	addi $27,$27,1	#incrementa mais 1 no time
	
	blt $27,1000,naoResetTempoMonstro								
		li $27,0 #reset time		
		naoResetTempoMonstro:
	
	sw $27,times+4
	
	jr $ra
	
atualizarTempoPlayer:
	
	lw $27,times+8
	addi $27,$27,1	#incrementa mais 1 no time
	
	blt $27,1000,naoResetTempoPlayer								
		li $27,0 #reset time		
		naoResetTempoPlayer:
	
	sw $27,times+8
	
	jr $ra
#função para desenhar um simples quadrado
quadrado:
		addi $sp,$sp,-4 #tiramos o espaço de memoria
		sw $ra, ($sp)	
		#Gaante que começõu do 0
		li $12,0
		li $11,0
										
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
			sw $20,aportou_tecla	#Seta a tecla aperta no na variavel de tecla																		
		endNaoZero:
		
		lw $27,times+8	#Aqui fazemos o jogador se mover de forma constante
		bne $27,0,naoMoverPlayer
			lw $20,aportou_tecla
			
			beqz $20,naoMoverPlayer																																																																		
				jal	player #desenha o player caso tenha pressionado alguma tecla
				sw $0,aportou_tecla						
		naoMoverPlayer:	
	  	 		  			  	  			  			  	  			  	
	  	#recupera o que esta na memoria
		lw $ra, ($sp)
		addi $sp,$sp,4		  	  			  			  	  			  	  			  	
	jr $ra

#Desenha o jogador na posição especificada
player:
		addi $sp,$sp,-4 #tiramos o espaço de memoria
		sw $ra, ($sp)	
		
		jal tiroJogador
		
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
		
		li $8,0 #Reseta o contador
		li $25,0
		
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
			
			#Verifica se houve colisão
			li $14,0
			jal colisaoGeral		
			#carrega para ver se houve colisao
			lw $14,tipos_colisoes			
									
			beq $14,1,naoA				
				#Seta a posição do jogador
				li $15,2 #esquerda
				sw $15,posicao_player
				
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
		naoA:
	
		#Verifica se apertou 'd' no teclado
		d:bne $20,100,naoD	
			addi $15,$15,1	#Ajuste. Não detecta ao encostar no elemento							
			
			#Verifica se houve colisão
			li $14,0
			jal colisaoGeral
			#carrega para ver se houve colisao
			lw $14,tipos_colisoes
			
			add $26,$14,$0			
			beq $14,1,naoD							
				#Seta a posição do jogador
				li $15,1 #direita
				sw $15,posicao_player
			
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
		naoD:
		
		#Verifica se apertou 'w' no teclado
		w:bne $20,119,naoW
			addi $16,$16,-1	#Ajuste. Não detecta ao encostar no elemento							
			
			#Verifica se houve colisão
			li $14,0
			jal colisaoGeral		
			#carrega para ver se houve colisao
			lw $14,tipos_colisoes
			
			beq $14,1,naoW			
				#Seta a posição do jogador
				li $15,3 #cima
				sw $15,posicao_player
																	
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
		naoW:		
		
		#Verifica se apertou 's' no teclado
		s:bne $20,115,naoS
			addi $16,$16,1	#Ajuste. Não detecta ao encostar no elemento							
			
			#Verifica se houve colisão
			li $14,0
			jal colisaoGeral		
			#carrega para ver se houve colisao
			lw $14,tipos_colisoes
			
			beq $14,1,naoS				
				#Seta a posição do jogador
				li $15,4 #baixo
				sw $15,posicao_player
											
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
		naoS:
		
		#Se ja verificou a colisão tiramos do array de tipos de colisao
		li $14,2
		sw $14,tipos_colisoes
					
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

tiroJogador:
		addi $sp,$sp,-4 #tiramos o espaço de memoria
		sw $ra, ($sp)

		#Verifica se apertou 'space' no teclado
		space:bne $20,32,naoSpace
			lw $14,posicao_player
			
			bne $14,1,naoRigth
				lw $15,array_player+80 #posição x da Gun do player
				lw $16,array_player+84 #posição y da Gun do player
				
				#Vamos montar o tiro para guarda-lo no array de tiros
				addi $15,$15,8
				addi $16,$16,1
				addi $17,$0,6
				addi $18,$0,2								
				
				jal alimentarArrayTiros
			naoRigth:
			
			bne $14,2,naoLeft
				lw $15,array_player+256 #posição x da Gun do player
				lw $16,array_player+260 #posição y da Gun do player
				
				#Vamos montar o tiro para guarda-lo no array de tiros
				addi $15,$15,-8
				addi $16,$16,1
				addi $17,$0,6
				addi $18,$0,2
												
				jal alimentarArrayTiros
			naoLeft:
			
			bne $14,3,naoUp
				lw $15,array_player+432 #posição x da Gun do player
				lw $16,array_player+436 #posição y da Gun do player
				#Vamos montar o tiro para guarda-lo no array de tiros
				addi $15,$15,1
				addi $16,$16,-8
				addi $17,$0,2
				addi $18,$0,6
				
				jal alimentarArrayTiros
			naoUp:
			
			bne $14,4,naoDown
				lw $15,array_player+608 #posição x da Gun do player
				lw $16,array_player+612 #posição y da Gun do player
				#Vamos montar o tiro para guarda-lo no array de tiros
				addi $15,$15,1
				addi $16,$16,8
				addi $17,$0,2
				addi $18,$0,6
				
				jal alimentarArrayTiros
				
			naoDown:
		naoSpace:
		
		#Recupera e devolve o espaço da memoria
		lw $ra, ($sp)
		addi $sp,$sp,4
	jr $ra

alimentarArrayTiros:
		#Garante que comça de 0
		li $11,0
		arrayTiros:bgt $11,384,sairArrayTiros
			lw $12,array_tiros($11)
																
			bne $12,1,jaTemTiro
				#Armazena no array de tiros em um local não reservado.
				sw $15,array_tiros($11)
				sw $16,array_tiros+4($11)
				sw $17,array_tiros+8($11)
				sw $18,array_tiros+12($11)
				sw $14,array_tiros+16($11)
												
				j sairArrayTiros
			jaTemTiro:						
			
			addi $11,$11,20
			j arrayTiros
		sairArrayTiros:		
		
		#Reset nos contadores
		li $11,0
		li $12,0
	jr $ra

atualizarTiros:
		addi $sp,$sp,-4 #tiramos o espaço de memoria
		sw $ra, ($sp)
		
		addi $sp,$sp,-4	#tiramos novamente para usar o reg 11 sem perder dados
		lw $27,times		
		bne $27,0,sairAtualizarArrayTiros #garante que o tiro seja atualizado no tempo certo
		#Garante que comça de 0
		li $26,0				
		atualizarArrayTiros:bgt $26,384,sairAtualizarArrayTiros							
			lw $12,array_tiros($26)
			sw $26, ($sp)									
			
			beq $12,1,naoTemTiro																												
				jal colisaoTiro
				bne $15,1,semColisao #caso tenha ocorrido uma colisão dispensamos o resto
					j naoTemTiro
				semColisao:
				
				jal limparBackgroundTiro
				
				jal moverTiro								
				
				lw $26, ($sp)												
				jal desenharTiro
			naoTemTiro:						
			
			
			lw $26, ($sp)
			addi $26,$26,20
			j atualizarArrayTiros
		sairAtualizarArrayTiros:										
		
		#Reset nos contadores
		li $26,0
		li $12,0
		addi $sp,$sp,4 #Devolvemos a memoria usado
		
		#Recupera e libera a memoria alocada
		lw $ra, ($sp)
		addi $sp,$sp,4
	jr $ra

#usado para limpar o Back do tiro na movimentação dele
limparBackgroundTiro:
		addi $sp,$sp,-4 #tiramos o espaço de memoria
		sw $ra, ($sp)

		lw $15,array_tiros($26)
		lw $16,array_tiros+4($26)
		lw $17,array_tiros+8($26)
		lw $18,array_tiros+12($26)
		li $10,0x0000 #cor do quadrado	
		jal quadrado
		
		#Recupera e libera a memoria alocada
		lw $ra, ($sp)
		addi $sp,$sp,4
	jr $ra

#Move todos os tiros atualmente no array de tiros
moverTiro:	
			lw $15,array_tiros($26)
			lw $16,array_tiros+4($26)				
			lw $17,array_tiros+16($26)			
			
			bne $17,1,naoMoveRigth								
				addi $15,$15,4
				sw $15,array_tiros($26)				
			naoMoveRigth:
			
			bne $17,2,naoMoveLeft				
				addi $15,$15,-4
				sw $15,array_tiros($26)
			naoMoveLeft:
			
			bne $17,3,naoMoveUp			    
				addi $16,$16,-4
				sw $16,array_tiros+4($26)
			naoMoveUp:
			
			bne $17,4,naoMoveDown
				addi $16,$16,4
				sw $16,array_tiros+4($26)
			naoMoveDown:
			
	jr $ra

desenharTiro:
		addi $sp,$sp,-4 #tiramos o espaço de memoria
		sw $ra, ($sp)

		lw $15,array_tiros($26)
		lw $16,array_tiros+4($26)
		lw $17,array_tiros+8($26)
		lw $18,array_tiros+12($26)
		li $10,0x00ff #cor do quadrado	
		jal quadrado
		
		#Recupera e libera a memoria alocada
		lw $ra, ($sp)
		addi $sp,$sp,4
	jr $ra
	
destroirTiro:
		addi $sp,$sp,-4 #tiramos o espaço de memoria
		sw $ra, ($sp)
		
		jal limparBackgroundTiro
		
		#vamos liberar o espaço no array para um novo tiro
		li $15,1
		sw $15,array_tiros($26)
		sw $15,array_tiros+4($26)
		sw $15,array_tiros+8($26)
		sw $15,array_tiros+12($26)
		sw $15,array_tiros+16($26)
		
		#Recupera e libera a memoria alocada
		lw $ra, ($sp)
		addi $sp,$sp,4
	jr $ra
	
colisaoTiro:
		addi $sp,$sp,-4 #tiramos o espaço de memoria
		sw $ra, ($sp)
	
		lw $15,array_tiros($26)
		lw $16,array_tiros+4($26)
		lw $17,array_tiros+8($26)
		lw $18,array_tiros+12($26)
		
		li $14,4
		jal colidiuCenarioTiro
		
		lw $14,tipos_colisoes+4
		bne $14,1,semColisaoTiro
			li $14,2
			sw $14,tipos_colisoes+4
			jal destroirTiro
		semColisaoTiro:
		
		#Recupera e libera a memoria alocada
		lw $ra, ($sp)
		addi $sp,$sp,4
	jr $ra

colisaoGeral:
		addi $sp,$sp,-4 #tiramos o espaço de memoria
		sw $ra, ($sp)
		
		jal colidiuCenario
		
		#Recupera e libera a memoria alocada
		lw $ra, ($sp)
		addi $sp,$sp,4
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
			jal VerificarColidiu	#verifica se colidiu com os elementos do cenario
			
			lw $13,tipos_colisoes($14)			
			beq $13,1,sairColisaoCenario
									
			addi $8,$8,16
			j colisaoCenario
		sairColisaoCenario:				
		
		add $8,$0,$0 #Reset no contador
		
		lw $ra, ($sp)
		addi $sp,$sp,4
	jr $ra			

#Faz a verificação da colisão entre os quadrados			
VerificarColidiu:		
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
			
			bateu: li $21,1 #caso tenha alguma colisão seta para 1
				   sw $21,tipos_colisoes($14)
		sairVerificarColisao:
		
	jr $ra

#Especifico para detectar colisão entre o tiro e o Cenario
colidiuCenarioTiro:
		addi $sp,$sp,-4 #tiramos o espaço de memoria
		sw $ra, ($sp)
		
		jal alimentarArrayColisaoA #Insere no array de colisões os elementos do quadrado a
		
		#Pega as posições dos quadrados do cenario
		colisaoCenarioTiro: bgt $8,560,sairColisaoCenarioTiro
			#Recupera os dados da memoria	
			lw $21,array_cenario($8)
			lw $22,array_cenario+4($8)
			lw $23,array_cenario+8($8)
			lw $24,array_cenario+12($8)		
				
			jal alimentarArrayColisaob #Insere no array de colisões os elementos do quadrado b
			jal VerificarColidiuTiro	#verifica se colidiu com os elementos do cenario			
			
			lw $13,tipos_colisoes($14)
			beq $13,1,sairColisaoCenarioTiro
									
			addi $8,$8,16
			j colisaoCenarioTiro
		sairColisaoCenarioTiro:				
		
		add $8,$0,$0 #Reset no contador
		
		lw $ra, ($sp)
		addi $sp,$sp,4
	jr $ra

#especifico para colisão entre algum elemento e o tiro
VerificarColidiuTiro:
			lw $21,array_colisoes#esquerda Quadrado A
			lw $22,array_colisoes+24#direita Quadrado B						
			addi $21,$21,-2
			bgt $21,$22,sairVerificarColisaoTiro
			
			lw $21,array_colisoes+8#direita Quadrado A
			lw $22,array_colisoes+16#esquerda Quadrado B		
			blt $21,$22,sairVerificarColisaoTiro
			
			lw $21,array_colisoes+4#Cima Quadrado A
			lw $22,array_colisoes+28#Baixo Quadrado B			
			bgt $21,$22,sairVerificarColisaoTiro
			
			lw $21,array_colisoes+12#Baixo Quadrado A
			lw $22,array_colisoes+20#Cima Quadrado B			
			addi $21,$21,2
			blt $21,$22,sairVerificarColisaoTiro
			
			li $21,1 #caso tenha alguma colisão seta para 1
			sw $21,tipos_colisoes($14)
		sairVerificarColisaoTiro:
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

#Faz o controle geral dos monstros do jogo
monstro:	
		addi $sp,$sp,-4 #tiramos o espaço de memoria
		sw $ra, ($sp)

		naoPassou:
		lw $11,qtd_monstro
		bgt $11,4,passouMaximo
			
			li $2,1
			add $4,$11,$0
			syscall
			
			li $2,4
			la $4,newBreal
			syscall
			
			addi $11,$11,1 #Acrescenta a quantidade de mosntros no mapa
			sw $11,qtd_monstro
		
			jal inserirMonstro
			
			j naoPassou
		passouMaximo:		
		
		#Atualiza o array de mosntros
		lw $27,times+4
		bne $27,0,naoAtualizarMonstros
			jal atualizarMonstros			
		naoAtualizarMonstros:
		
		#recupera o que esta na memoria
		lw $ra, ($sp)
		addi $sp,$sp,4
	jr $ra

imprimirArrayMonstros:
	li $11,0
	li $8,0
	
	AtualizarMonstrot:bgt $8,2688,sairAtualizarMonstrot
			
			add $11,$0,$8
			addi $10,$11,892
			
			i: bgt $11,$10,ni						
				
				lw $4,array_monstros($11)
				li $2,1
				syscall
				
				li $2,4
				la $4,newLine
				syscall
				
				add $11,$11,4
				j i
			ni:
			
			li $2,4
			la $4,newBreal
			syscall
			
			add $8,$8,896	#incrementa
			j AtualizarMonstrot
	sairAtualizarMonstrot:
	
	j end
	
jr $ra
inserirMonstro:
	#Recupera os valores iniciais para inserir no array de monstros
		li $8,0
		li $9,0
		
		iterarM: bgt $9,2688,nIterarM			
			lw $10,array_monstros($9)								
			bne $10,1,incrementarM
			
			inserindoMonstro: bgt $8,892,inserindoMonstroSair		
				add $11,$8,$9	#atualiza de acordo com o loop
			
				lw $10,monster($8)
				sw $10,array_monstros($11)			
						
				#incrementando
				add $8,$8,4
				j inserindoMonstro				
			inserindoMonstroSair: j nIterarM
			
			incrementarM:
			addi $9,$9,896
			li $8,0
			j iterarM
		nIterarM:										
		
		#Reseta tudo que foi usado
		li $8,0
		li $9,0
		li $10,0
		
	jr $ra	

#Recupera o array de mosntros, atualiza-los e redesenha eles na posição nova
atualizarMonstros:
		addi $sp,$sp,-4 #tiramos o espaço de memoria
		sw $ra, ($sp)					
		li $8,0
		#Seta o array de posições de monstros para começar do primeiro elemento
		li $13,1
		sw $13,posicao_monstros+16		
		li $13,0
		
		AtualizarMonstro:bgt $8,2688,sairAtualizarMonstro
			addi $sp,$sp,-4
			sw $8,($sp)	#Guardamos o que tem em 8 para nao perder
			
			addi $sp,$sp,-4
			sw $13,($sp)						
			
			lw $9,array_monstros($8)															
			beq $9,1,naoTemMonstro		
				#apaga o monstro que vai se mexer						
				jal calularPosicaoMonstro
				jal limparBackgroundMonstro
				#faz os calculos para movimentar o monstro
				lw $13, ($sp)	#recuperamos o que tinha e 13																																					
				jal moverMonstro
				#Faz os calculos para desenhar o monstro
				jal calularPosicaoMonstro				
				jal desenharMonstro				
			naoTemMonstro:
						
			lw $13, ($sp)	#recuperamos o que tinha e 13
			addi $sp,$sp,4
																					
			lw $8, ($sp)	#recuperamos o que tinha e 8
			addi $sp,$sp,4
			
			addi $13,$13,4	#Diz a posição do array de posições dos monstros
			add $8,$8,896	#incrementa
			j AtualizarMonstro
		sairAtualizarMonstro:		
		#Reseta tudo que foi usado
		li $8,0
		li $9,0
		
		#recupera o que esta na memoria
		lw $ra, ($sp)
		addi $sp,$sp,4
	jr $ra			

#Pega o valor da posição no array de posição de monstros para verificar para que lado ele deve virar
calularPosicaoMonstro:
		lw $10,posicao_monstros($13)	#carrega para que lado o monstro deve virar
		
		bne $10,1,notRight
			li $10,0
		notRight:
		
		bne $10,2,notLeft
			li $10,224
		notLeft:
		
		bne $10,3,notUp
			li $10,448
		notUp:
		
		bne $10,4,notDown
			li $10,672
		notDown:
	jr $ra
	
desenharMonstro:
		addi $sp,$sp,-4 #tiramos o espaço de memoria
		sw $ra, ($sp)								
		
		add $20,$8,$10
		addi $21,$20,208			
	
		pixelMonstro:bgt $20,$21,sairPixelMonstro							
			addi $sp,$sp,-4
			sw $21,($sp)	#Guardamos o que tem em 20 para nao perder
			
			addi $sp,$sp,-4
			sw $20,($sp)	#Guardamos o que tem em 20 para nao perder
			
			lw $15,array_monstros($20)								
			lw $16,array_monstros+4($20)			
			lw $17,array_monstros+8($20)			
			lw $18,array_monstros+12($20)			
			li $10,0xffffff		
			jal quadrado								
			
			lw $20, ($sp)	#recuperamos o que tinha e 10
			addi $sp,$sp,4
			
			lw $21, ($sp)	#recuperamos o que tinha e 10
			addi $sp,$sp,4															
																																																
			addi $20,$20,16
			j pixelMonstro
		sairPixelMonstro:
		
		#reset
		li $20,0
		li $21,0
		
		#recupera o que esta na memoria
		lw $ra, ($sp)
		addi $sp,$sp,4
	jr $ra

moverMonstro:
		addi $sp,$sp,-4 #tiramos o espaço de memoria
		sw $ra, ($sp)								
					
		#faz o random para o monstro andar de forma aleatoria no mapa
		li $2,42
		li $5,4	
		syscall
		
		#Prepara para inserir no array o valor correspondente a posicao do monstro
		addi $5,$4,1
		sw $5,posicao_monstros($13)				
			
		add $27,$8,$0				
			
		bne $4,0,nRight																		
			jal moverMonstroRight				
		nRight:
			
		bne $4,1,nLeft
			jal moverMonstroLeft
		nLeft:												
		
		bne $4,2,nUp					
			jal moverMonstroUp						
		nUp:
			
		bne $4,3,nDown						
			jal moverMonstroDown
		nDown:
		
		#reset
		li $27,0
		
		#recupera o que esta na memoria
		lw $ra, ($sp)
		addi $sp,$sp,4
	jr $ra			
	
moverMonstroUp:	
		addi $sp,$sp,-4 #tiramos o espaço de memoria
		sw $ra, ($sp)	
							
		li $14,-4
		jal moveVerticalMonster
		
		#recupera o que esta na memoria
		lw $ra, ($sp)
		addi $sp,$sp,4
	jr $ra
	
moverMonstroDown:
		addi $sp,$sp,-4 #tiramos o espaço de memoria
		sw $ra, ($sp)			
		
		li $14,4
		jal moveVerticalMonster
		
		#recupera o que esta na memoria
		lw $ra, ($sp)
		addi $sp,$sp,4
	jr $ra
	
moverMonstroLeft:
		addi $sp,$sp,-4 #tiramos o espaço de memoria
		sw $ra, ($sp)																				
		
		li $14,-4
		jal moveHorizontalMonster
		
		lw $ra, ($sp)
		addi $sp,$sp,4
	jr $ra
	
moverMonstroRight:
		addi $sp,$sp,-4 #tiramos o espaço de memoria
		sw $ra, ($sp)	

		li $14,4
		jal moveHorizontalMonster
		
		lw $ra, ($sp)
		addi $sp,$sp,4
	jr $ra

#Faz a movimentação para Left ou Right, O parametro deve ser passado no reg $14
moveHorizontalMonster:
		#Atualiza a forma do player
		#lw $15,array_shapes_monster
		#add $15,$15,$14
		#sw $15,array_shapes_monster
		
		addi $10,$27,880
		montarMoverHorizontalMonster:bgt $27,$10,sairMontarMoverHorizontalMonster	
				
				lw $15,array_monstros($27)
				add $15,$15,$14
				sw $15,array_monstros($27)										
				
				addi $27,$27,16
				j montarMoverHorizontalMonster
			sairMontarMoverHorizontalMonster:		
	jr $ra	
	
#Faz a movimentação para Up ou Down, O parametro deve ser passado no reg $14
moveVerticalMonster:
		#Atualiza a forma do player
		#lw $16,array_shapes_monster
		#add $16,$16,$14
		#sw $16,array_shapes_monster
		
		addi $10,$27,880
		montarMoverVerticalMonster:bgt $27,$10,sairMontarMoverVerticalMonster	
				
				lw $16,array_monstros+4($27)
				add $16,$16,$14
				sw $16,array_monstros+4($27)											
				
				addi $27,$27,16
				j montarMoverVerticalMonster
			sairMontarMoverVerticalMonster:					
	jr $ra
	
limparBackgroundMonstro:
		addi $sp,$sp,-4 #tiramos o espaço de memoria
		sw $ra, ($sp)	
		
		add $20,$8,$10
		addi $21,$20,208
		
		apagarMonstro:bgt $20,$21,sairApagarMonstro							
			addi $sp,$sp,-4
			sw $21,($sp)	#Guardamos o que tem em 20 para nao perder
			
			addi $sp,$sp,-4
			sw $20,($sp)	#Guardamos o que tem em 20 para nao perder
		
			lw $15,array_monstros($20)
			lw $16,array_monstros+4($20)
			lw $17,array_monstros+8($20)
			lw $18,array_monstros+12($20)
			li $10,0x0000		
			jal quadrado
			
			lw $20, ($sp)	#recuperamos o que tinha e 10
			addi $sp,$sp,4
			
			lw $21, ($sp)	#recuperamos o que tinha e 10
			addi $sp,$sp,4															
																																																
			addi $20,$20,16
			j apagarMonstro
		sairApagarMonstro:
		
		#reset
		li $20,0
		li $21,0
		
		#recupera o que esta na memoria
		lw $ra, ($sp)
		addi $sp,$sp,4
	jr $ra
		
#Inicia o Cenario do Jogo	
iniciarJogo:
		addi $sp,$sp,-4 #tiramos o espaço de memoria
		sw $ra, ($sp)
		jal cenario
		
		#desenha o jogador virado para cima
		li $8,352
		li $25,512
		li $10,0xff00	#Cor para do personagem
		jal desenharPlayer
		
		#seta posição inicial do jogador. Default up(3)
		li $14,3
		sw $14,posicao_player
		li $14,0
		
		#recupera o que esta na memoria
		lw $ra, ($sp)
		addi $sp,$sp,4
	jr $ra	
#Desenha o cenario do jogo
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
