.data
    .word 1, 2, 3, 4, 5

.text

main:
    # 1. Inicialização dos ponteiros
    li $t0, 0x10010000       # $t0 = Ponteiro Esquerdo (início do vetor)
    li $t1, 0x10010010       # $t1 = Ponteiro Direito (fim do vetor: 0x10010000 + 4 * 4 bytes)

loop:
    # 2. Condição de parada: se o ponteiro esquerdo for maior ou igual ao direito, terminamos
    bge $t0, $t1, fim

    # 3. Carrega os valores da memória
    lw $t2, 0($t0)           # $t2 = valor do elemento da esquerda
    lw $t3, 0($t1)           # $t3 = valor do elemento da direita

    # 4. Troca os valores na memória (Swap)
    sw $t3, 0($t0)           # Salva o valor da direita na posição da esquerda
    sw $t2, 0($t1)           # Salva o valor da esquerda na posição da direita

    # 5. Atualiza os ponteiros
    addi $t0, $t0, 4         # Avança o ponteiro esquerdo em 4 bytes (próxima palavra)
    subi $t1, $t1, 4         # Recua o ponteiro direito em 4 bytes (palavra anterior)

    # 6. Repete o ciclo
    j loop

fim: nop