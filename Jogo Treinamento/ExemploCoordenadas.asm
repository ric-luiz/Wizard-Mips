.data

.text
main:
		
 	for: beq $11,64,fim_for
 		
 		add $15,$0,10
		add $16,$0,$11
		
		jal coordenadas
		jal desenhar_pixel
		
		addi $11,$11,1
		j for
 	fim_for: 
	
fim: addi $2,$0,10
	 syscall

	 	 	 	 
# x = $15
# y = $16
coordenadas: 
		
		add $14,$0,$0
		
		mul $14,$16,64					
		add $14,$14,$15		
		
		mul $14,$14,4	#Converte para os espaços em memoria
		
	jr $ra
	
desenhar_pixel:

		lui $9, 0x1001
		addi $10, $0,0x00ff
		add $9,$9,$14
	    sw $10, 0($9)	    
	    
	jr $ra