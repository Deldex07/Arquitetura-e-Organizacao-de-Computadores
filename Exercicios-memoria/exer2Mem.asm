.data
a: .word 3
y: .space 4
.text exercicio 2
#2. Faça um programa que calcule o seguinte polinômio usando o método de Horner:
#y = 9a3 - 5a2 + 7a + 15
#Utilize endereços de memória para armazenar o valor de a e o resultado y. Cada
#valor deve ocupar 4 bytes na memória (.word), assim como para o resultado (.space
#4). Utilize as duas primeiras posições da memória .data para armazenar,
#consecutivamente, a e y, iniciando o código com:
#.data
#a: .word 3
#y: .space 4
#Observe como o método de Horner é mais eficiente (faz menos operações) que
#calcular o polinômio de forma sequencial.

lui $t2, 0x1001
ori $t2, $t2, 0x0000

lw $t1, 0($t2) # $t1 = 3
addi $t0, $0, 9 # $t0 = 9

#resultado = resultado * a - 5

mult $t0, $t1
mflo $t0
addi $t0, $t0, -5

#resultado = resultado * a + 7

mult $t0, $t1
mflo $t0
addi $t0, $t0, 7

#resultado = resultado * a + 15

mult $t0, $t1
mflo $t0
addi $t0, $t0, 15

#Salva

sw $t0, 4($t2)