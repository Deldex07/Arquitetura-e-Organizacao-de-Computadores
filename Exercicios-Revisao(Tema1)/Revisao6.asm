.text Revisao 6
ori $t1, $0, 5
addi $t2, $0, 0
beq $t1, $0, fim
loop:
 addi $t2, $t2, 1
 srl $t1, $t1, 1
 bne $t1, $0, loop
 
fim: