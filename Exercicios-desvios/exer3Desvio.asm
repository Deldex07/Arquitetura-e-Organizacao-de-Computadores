.data
x: .word 7
y: .space 4
.text
#Escreva um programa que leia um valor x > 0 da memória (posição 0x10010000) e
#calcule o x-ésimo termo da série de Fibonacci: 1,1,2,3,5,8,13,21,34,55,...

#Escreva o x-ésimo termo da série (y) em uma palavra (4 bytes) de memória. O
#resultado deve ser armazenado, obrigatoriamente, na posição 0x10010004 da
#memória .data. Inicie o código com: .data x: .word 7 y: .space 4

#Base da .data
lui $t0, 0x1001

lw $t1, 0($t0)
#Caso base x = 1 e x = 2
addi $t2, $0, 1
beq $t1, $t2, base

addi $t2, $0, 2
beq $t1, $t2, base
#fib(1) = 1, fib(2) = 1
addi $t3, $0, 1
addi $t4, $0, 1
addi $t5, $0, 3

loop:
add $t6, $t3, $t4 #t = a + b
add $t3, $t4, $0 # a = b
add $t4, $t6, $0 # b= t

beq $t5, $t1, fim # Se i == x -> terminou

addi $t5, $t5, 1 # i++
j loop

base: 
addi $t6, $0, 1 #Resultado = 1

fim:
sw $t6, 4($t0) # Salva em y (0x10010004)