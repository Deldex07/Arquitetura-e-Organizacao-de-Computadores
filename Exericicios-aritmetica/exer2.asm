.text exercicio 2
# Escreva um programa que calcule o valor de 4x - 2y + 3z 
#(armazene os valores de x, y e z em $t1, $t2 e $t3, respectivamente) e 
# coloque o resultado em $t7. Faça testes com alguns valores diferentes 
# de x, y e z. Utilize apenas instruções já vistas na disciplina.

# x = 1,  y = 1,  z = 1
## inicializa valores X, Y e Z
addi $t1, $zero, 1  # $t1 <- x = 1
addi $t2, $zero, 1  # $t2 <- y = 1
addi $t3, $zero, 1  # $t3 <- z = 1

# 4x
# Somas sucessivas
add $t4, $t1, $t1   # $t4 <- x + x = 2x
add $t4, $t4, $t4   # $t4 <- 2x + 2x = 4x

# 2y
# Somas sucessivas
add $t5, $t2, $t2   # $t5 <- y + y = 2y

# 3z
# Somas sucessivas
add $t6, $t3, $t3    # 2z
add $t6, $t6, $t3    # 3z
 
# Finalizando os cálculos
# 4x - 2y
sub $t7, $t4, $t5

# + 3z
add $t7, $t7, $t6
