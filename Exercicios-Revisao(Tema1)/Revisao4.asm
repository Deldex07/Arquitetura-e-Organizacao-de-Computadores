.data
valor: .word 5
Resultado: .word 0

.text Revisao 4
lui $s0, 0x1001
lw  $t0, 0($s0) # t0 = n(contador decrescente: 5,4,3...)

addi $t1, $0, 1 # acumulador do fat (começa em 1)

loop:
  beq $t0, $0, fim_loop
  
  mult $t1, $t0
  mflo $t1
  
  addi $t0, $t0, -1
  
  j loop
  
fim_loop:
sw $t1, 4($s0)