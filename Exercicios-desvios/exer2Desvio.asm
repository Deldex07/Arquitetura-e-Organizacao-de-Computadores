.data
y: .space 4
.text
#Escreva um programa que calcule:
#1+2+3+...+333
#Escreva o resultado (y) em uma palavra (4 bytes) de memória. O resultado deve ser
#armazenado, obrigatoriamente, na posição 0x10010000 da memória .data. Inicie o
#código com:
#.data
# y: .space 4

main:
    lui $t0, 0x1001      # endereço base

    addi $t1, $zero, 1   # i = 1
    addi $t2, $zero, 333 # limite
    add  $t3, $zero, $zero  # soma = 0

Loop:
    add $t3, $t3, $t1

    beq $t1, $t2, fim

    addi $t1, $t1, 1
    j Loop

fim:
    sw $t3, 0($t0)