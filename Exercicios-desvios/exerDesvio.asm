.data
a: .half 30
b: .half 5
y: .space 4
.text
#Escreva um programa que leia dois halfwords (a e b) da memória e calcule a sua
#divisão se os dois valores forem diferentes e a sua multiplicação se os dois valores
#forem iguais. Escreva o resultado (y) em uma palavra (4 bytes) de memória. O
#resultado deve ser armazenado, obrigatoriamente, na posição 0x10010004 da
#memória .data. Inicie o código com:
#.data
#a: .half 30
#b: .half 5
#y: .space 4
lui $t0, 0x1001

lhu $t1 0($t0)
lhu $t2 2($t0)

beq $t1, $t2, iguais

diferentes:
div $t1, $t2
mflo $t3
j salvar

iguais:
mul $t3, $t1, $t2

salvar:
sw  $t3 4($t0)
