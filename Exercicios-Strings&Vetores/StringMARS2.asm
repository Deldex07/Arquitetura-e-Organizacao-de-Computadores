.data
	string: .asciiz "meu professor é muito bom"
.text

la $t0, string
li $t2, 1

loop:
	lbu $t1, 0($t0)
	
	beq $t1, $0, fim
	
	li $t3, 32
	beq $t1, $t3, espaco

	beq $t2, $0, avanca
	
# Capitalizaçao
	addi $t1, $t1, -32
	sb $t1, 0($t0)
	
	li $t2, 0
	j avanca
	
espaco:
	li $t2, 1
avanca:
	addi $t0, $t0, 1
	j loop
fim: