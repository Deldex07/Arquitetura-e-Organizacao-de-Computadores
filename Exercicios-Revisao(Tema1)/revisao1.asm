.data
vetor: .space 32       # 8 posições * 4 bytes = 32 bytes

.text Revisao 1

main:

    # i = 0
    addi $t0, $zero, 0          # $t0 = i

    # Carrega endereço base do vetor
    lui  $s0, 0x1001            # $s0 = 0x10010000

for:

    # if(i >= 8) sai do loop
    slti $t1, $t0, 8
    beq  $t1, $zero, fim

    # verifica i % 2 == 0
    andi $t2, $t0, 1
    bne  $t2, $zero, impar

par:

    # vetor[i] = i * 2

    sll  $t3, $t0, 1            # t3 = i * 2

    # calcula endereço vetor[i]
    sll  $t4, $t0, 2            # offset = i * 4
    add  $t5, $s0, $t4          # endereço de vetor[i]

    sw   $t3, 0($t5)

    j prox

impar:

    # vetor[i] = vetor[i] + vetor[i-1]

    # endereço vetor[i]
    sll  $t4, $t0, 2
    add  $t5, $s0, $t4

    # carrega vetor[i]
    lw   $t6, 0($t5)

    # endereço vetor[i-1]
    addi $t7, $t0, -1
    sll  $t7, $t7, 2
    add  $t8, $s0, $t7

    # carrega vetor[i-1]
    lw   $t9, 0($t8)

    # soma
    add  $t6, $t6, $t9

    # salva resultado em vetor[i]
    sw   $t6, 0($t5)

prox:

    # i++
    addi $t0, $t0, 1

    j for

fim:
