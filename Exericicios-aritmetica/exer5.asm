.text Exercicio 5
#Faça um programa que calcule a área do triângulo equilátero abaixo e escreva o
#resultado em $t3.
#Armazene b em $t1 e h em $t2 utilizando as instruções addi $t1, $zero, b e
#addi $t2, $zero, h, substituindo b e h pelos valores desejados, e sempre que precisar
#de b e h, utilize os valores armazenados nos registradores $t1 e $t2.

addi $t1, $zero, 2 # $t1 = 2
addi $t2, $zero, 4 # $t2 = 4

# b*h
mult $t1,$t2 #hi/lo = b * h
mflo $t0 # $t0 = b*h

# /2
addi $t4, $zero, 2 # divisor = 2
div $t0, $t4, # lo - quociente

mfhi $t3 # $t3 = area