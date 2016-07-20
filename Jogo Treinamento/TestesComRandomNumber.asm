.data
	espaco: .asciiz " "
.text
main:
	
	#Pega o time da classe datetime do java
	#li $2,30
	#syscall
	
	#Emite um som no programa
	#li $2,33
	#li $4,50
	#li $5,1000
	#li $6,1
	#li $7,120
	#syscall
	
	#Imprime numero randomicamente
	loop: bne $8,100000,nao		
		li $2,42
		li $5,4	
		syscall
		
		li $2,1
		syscall				
		
		li $2,4
		la $4,espaco
		syscall
		
		li $8,0
		nao:		
		add $8,$8,1
	j loop		
	
end:li $2,10
    syscall