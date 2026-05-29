.data
a: .word 3
b: .word 2
c: .word 6

.text Revisao 3

lui $t0, 0x1001
lw $t1, 0($t0) # t1 = a
lw $t2, 4($t0) # t2 = b
lw $t3, 8($t0) # t3 = c

slt $t4, $t1, $t2 # se b < a
slt $t5, $t3, $t1 # se a < c
or $t6, $t4, $t5
beq $t5, $0, a_mediana

slt $t4, $t2, $t1 # se b < a
slt $t5, $t3, $t2 # se c < b
or $t6, $t4, $t5
beq $t5, $0, b_mediana

slt $t4, $t1, $t2 # se a < b
slt $t5, $t2, $t3 # se b < c
or $t6, $t4, $t5
beq $t5, $0, b_mediana

or $s1, $t3, $0
j resultado

a_mediana:
or $s1, $t1, $0
j resultado

b_mediana:
or $s1, $t2, $0

resultado:
sw $s1,12($t0)