.data
	array_player: .word #Player Right || 0-160(posição na memoria)
						#Head				  	              
				  		122,120,6,2,
	              		122,122,4,2,
	              		120,124,8,2,
	              		#Body
	              		120,126,10,4,
	              		122,128,8,4,
	              		#Gun
	              		1,126,2,6,
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
	              		2,126,2,6,
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
	              		3,120,6,2,
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
	              		4,134,6,2,
	              		128,130,2,4,
	              		#Legs Left
	              		134,130,2,4,
	              		132,128,2,4,
	              		#Legs Right
	              		134,120,2,4,
	              		132,122,2,4
.text
main:
	#li $16,176
	#addi $16,$16,176
	#addi $16,$16,176
	lw $15,array_player+80($16)

end:li $2,10
    syscall