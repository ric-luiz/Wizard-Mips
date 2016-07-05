.data

.text
	main: lui $9, 0x1001
		  addi $10, $0,0x00ff
		  sw $10, 0($9)
		  
		  addi $9,$9,4
		  addi $10, $0,0xff00
		  sw $10, 0($9)
	
		  addi $9,$9,4
		  #addi $10, $0,0xffff
		  sll $10,$10,8
		  sw $10, 0($9)