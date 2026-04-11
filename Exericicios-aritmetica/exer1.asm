.text Exercicio 1
#Faça um programa que some os números decimais 326, -211, 311 e -684
#e escreva o resultado no registrador $t0

addi $t1, $zero, -684   # $t1 = -684
addi $t2, $zero, -211   # $t2 = -211
add  $t1, $t1, $t2      # $t1 = -684 - 211 = -895

addi $t2, $zero, 326    # $t2 = 326
add  $t1, $t1, $t2      # $t1 = -895 + 326 = -569

addi $t2, $zero, 311    # $t2 = 311
add  $t0, $t1, $t2      # $t0 = -569 + 311 = -258