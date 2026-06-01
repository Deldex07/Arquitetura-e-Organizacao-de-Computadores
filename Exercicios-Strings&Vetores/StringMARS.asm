.data
string: .asciiz "Gosto muito do meu professor de AOC-I."

.text
la, $t0, string
la, $t1, string

loop:
	lbu $t2, 0($t1)
	
	beq $t2, $0, fim
	
	li $t3, 32
	beq $t2, $t3, espaco
	
	sb $t2, 0($t0)
	addi $t0, $t0, 1
espaco:
	addi $t1, $t1,1
	j loop
fim:
	sb $0, 0($t0)