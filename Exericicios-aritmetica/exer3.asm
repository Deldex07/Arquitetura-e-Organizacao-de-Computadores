.text exercicio 3
#Armazene x no registrador $t5 com a instrução addi $t5, $zero, x, substituindo x
#pelo valor desejado, e sempre que precisar o valor de x, utilize o valor armazenado no
#registrador $t5.
#Armazene o resultado y no registrador $t6.
#Faça teste com diferentes valores positivos e negativos de x.

addi $t5, $zero, 1 #$t5 = x = 1

# x²
mult $t5,$t5 #hi\lo = x*x
mflo $t0 # $t0 = x²

# 3x²
add $t1,$t0,$t0 # $t1 = 2x²
add $t1,$t1,$t0 # $t1 = 3x²

#5x
add $t2, $t5, $t5      # $t2 = 2x
add $t2, $t2, $t5      # $t2 = 3x
add $t2, $t2, $t5      # $t2 = 4x
add $t2, $t2, $t5      # $t2 = 5x

#3x²-5x
sub $t3, $t1, $t2 # $t3 = 3x²-5x

#13
addi $t6, $t3,13 # $t6 = y
