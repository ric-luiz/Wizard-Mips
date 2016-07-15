.data
	player_right: .word #Head				  	              
				  		42,36,6,2,
	              		42,38,4,2,
	              		40,40,8,2,
	              		#Body
	              		40,42,10,4,
	              		42,44,8,4,
	              		#Gun
	              		54,42,2,6,
	              		50,44,4,2,
	              		#Legs Left
	              		42,48,4,2,
	              		40,50,4,2,
	              		#Legs Right
	              		48,48,4,2,
	              		50,50,4,2,
	              		
	player_left:  .word #Head				  	              
				  		48,36,6,2,
	              		50,38,4,2,
	              		48,40,8,2,
	              		#Body
	              		46,42,10,4,
	              		46,44,8,4,
	              		#Gun
	              		40,42,2,6,
	              		42,44,4,2,
	              		#Legs Left
	              		50,48,4,2,
	              		52,50,4,2,
	              		#Legs Right
	              		44,48,4,2,
	              		42,50,4,2,
	              		
	player_up:	  .word #Head				  	              
				  	    54,44,2,6,
	              	    52,46,2,4,
	              	    50,44,2,8,
	              	    #Body
	              	    46,42,4,10,
	              	    44,42,2,8,
	              	    #Gun
	              		44,36,6,2,
	              		46,38,2,4,
	              		#Legs Left
	              		40,38,2,4,
	              		42,40,2,4,
	              		#Legs Right
	              		40,48,2,4,
	              		42,46,2,4,
	              		
	player_down:  .word #Head				  	              
				  	    40,38,2,6,
	              	    42,38,2,4,
	              	    44,36,2,8,
	              	    #Body
	              	    46,36,4,10,
	              	    50,38,2,8,
	              	    #Gun
	              		46,50,6,2,
	              		48,46,2,4,
	              		#Legs Left
	              		54,46,2,4,
	              		52,44,2,4,
	              		#Legs Right
	              		54,36,2,4,
	              		52,38,2,4,
		
.text
main:
	#Recupera os dados da memoria
	montar:bgt $8,160,sairmontar	
		lw $15,player_down($8)
		lw $16,player_down+4($8)
		lw $17,player_down+8($8)
		lw $18,player_down+12($8)
		li $10,0xff00
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
