.text Exercicio 4
#Armazene x em $t1, com a instrução addi $t1, $zero, x, substituindo x pelo valor
#desejado, e sempre que precisar o valor de x, utilize o valor armazenado no
#registrador $t1.
#Armazene o quociente da divisão em $t2 e o resto em $t3.

addi $t1, $zero, 2 # $t1 = 2
addi $t4, $zero, 9 # $t4 = 9
mult $t1, $t4 # x*9
mflo $t1 # $t1 = 9x

addi $t4, $t4, 7 # $t4 = 9x+7 (numerador)

add $t5, $t1, $t1 # $t5 = 2x
addi $t5, $t5, 8 # $t5 = 2x+8 (denominador)

div $t4, $t5 #lo = quociente, hi = resto

mflo $t2 # $t2 = quociente
mfhi $t3 # $t3 = resto