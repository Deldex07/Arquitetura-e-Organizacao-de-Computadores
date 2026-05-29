.data
	vetor : .word 5, 10, 15, 20, 25, 30, 35, 40, 45, 50
.text
la $t1, vetor
li $t2, 0
li $t3, 9

#Flag
li $t0, 1

loop:
	beq $t2, $t3, fim
	
	lw $t4, 0($t1)
	lw $t5, 4($t1)
	
	bgt $t4, $t5, desordem
	
	addi $t1, $t1, 4
	addi $t2, $t2, 1
	j loop
desordem:
li $t0, 0

fim: nop