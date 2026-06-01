.data

# Começa em 0x10010000
resultados: .space 120

msgKm:      .asciiz "Quilometros: "
msgLitros:  .asciiz "Litros: "
msgRes:     .asciiz "Km/L = "
newline:    .asciiz "\n"

.text
.globl main

main:

    # Ponteiro para o vetor de resultados
    la $s0, resultados

loop:

    # Ler quilometros
    li $v0, 4
    la $a0, msgKm
    syscall

    li $v0, 5
    syscall
    move $t0, $v0

    # Encerrar se km = 0
    beq $t0, $zero, fim

    # Ler litros
    li $v0, 4
    la $a0, msgLitros
    syscall

    li $v0, 5
    syscall
    move $t1, $v0

    # Evita divisão por zero
    beq $t1, $zero, loop

    # km/l
    div $t0, $t1
    mflo $t2

    # Imprimir resultado
    li $v0, 4
    la $a0, msgRes
    syscall

    li $v0, 1
    move $a0, $t2
    syscall

    li $v0, 4
    la $a0, newline
    syscall

    # Armazenar no vetor
    sw $t2, 0($s0)

    # Próxima posição
    addi $s0, $s0, 4

    j loop

fim:
    li $v0, 10
    syscall
