.data
tamanho: .word 7
vetor1:  .word -30, -23, 56, -43, 72, -18, 71
vetor2:  .word 45, 23, 21, -23, -82, 0, 69
soma:    .word 0, 0, 0, 0, 0, 0, 0

.text
.globl main

main:
    # 1. Inicializa os ponteiros para o início de cada vetor usando 'la'
    la $t0, vetor1          # $t0 = ponteiro para vetor1
    la $t1, vetor2          # $t1 = ponteiro para vetor2
    la $t2, soma            # $t2 = ponteiro para o vetor soma

    # 2. Carrega o tamanho do vetor para controle do loop
    lw $t3, tamanho         # $t3 = 7 (contador de iterações)

loop:
    # 3. Condição de parada: se o contador chegar a 0, encerra
    blez $t3, fim

    # 4. Carrega os elementos atuais de vetor1 e vetor2
    lw $t4, 0($t0)          # $t4 = vetor1[i]
    lw $t5, 0($t1)          # $t5 = vetor2[i]

    # 5. Realiza a soma elemento a elemento
    add $t6, $t4, $t5       # $t6 = vetor1[i] + vetor2[i]

    # 6. Armazena o resultado no vetor soma
    sw $t6, 0($t2)          # soma[i] = $t6

    # 7. Avança os ponteiros para a próxima posição (.word = 4 bytes)
    addi $t0, $t0, 4        # Avança vetor1
    addi $t1, $t1, 4        # Avança vetor2
    addi $t2, $t2, 4        # Avança soma

    # 8. Decrementa o contador e reinicia o loop
    subi $t3, $t3, 1        # Contador de elementos restantes - 1
    j loop

fim: nop