.data
a: .word 3
b: .word 5
y: .space 4
.text Exercicio 1
#Faça um programa que calcule a seguinte equação:
#y = 32ab - 3a + 7b - 13
#Utilize endereços de memória para armazenar o valore de a, b e o resultado y. Cada
#valor deve ocupar 4 bytes na memória (.word), assim como para o resultado (.space
#4). Utilize as três primeiras posições da memória .data para armazenar,
#consecutivamente, a, b e y, iniciando o código com:
#.data
#a: .word 3
#b: .word 5
#y: .space 4

lui $t0,  0x1001
lw $t1, 0($t0)
lw $t2, 4($t0)

#ab
mult $t1, $t2
mflo $t3	      # #$t3 = a*b 
sll $t4, $t3, 5 # $t4 = 32ab

#3a
add $t5, $t1, $t1 #2a
add $t5, $t5, $t1 #3a

#7b
sll $t6, $t2, 3 # 8b
sub $t6, $t6, $t2 # 7b

# y = 32ab  - 3b
sub $t7, $t4, $t5

# y = 32ab  - 3b + 7b
add $t7, $t7, $t6

# y = 32ab  - 3b + 7b -13
addi $t7, $t7, -13

#Salvando
sw $t7, 8($t0)
