.data
n: .word 4 # Troque o valor de n pelo que desejar
A: .word 0

.text Revisao 2
main:

    # Carrega endereço base 0x10010000
    lui  $s0, 0x1001

    # Lê n da memória
    lw   $t0, 0($s0)        # t0 = n

    # i = 2
    addi $t1, $zero, 2

    # A = 1
    addi $t2, $zero, 1

loop:

    # if(i > n) termina
    slt  $t3, $t0, $t1
    bne  $t3, $zero, fim

    # calcula i / 2 (divisão inteira)
    srl  $t4, $t1, 1

    # A = A * (i/2)
    mult $t2, $t4
    mflo $t2

    # i++
    addi $t1, $t1, 1

    j loop

fim:

    # salva A em 0x10010004
    sw   $t2, 4($s0)
