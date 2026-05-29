.data
a: .word -3
b: .word 7
c: .word 5
d: .word -2
e: .word 8
x: .word 4
y: .space 4
.text exercicio 3

#3. Faça um programa que calcule o seguinte polinômio usando o método de Horner:
#y = - ax4 + bx3 - cx2 + dx - e
#Utilize endereços de memória para armazenar o valor de a, b, c, d, e, x e o resultado
#y. Cada valor deve ocupar 4 bytes na memória (.word), assim como para o resultado
#(.space 4). Utilize as sete primeiras posições da memória .data para armazenar,
#consecutivamente, a, b, c, d, e, x e y, iniciando o código com:
#.data
#a: .word -3
#b: .word 7
#c: .word 5
#d: .word -2
#e: .word 8
#x: .word 4
#y: .space 4

# base da memoria

lui $t0, 0x1001

# carregar valores

lw $t1, 0($t0) #a
lw $t2, 4($t0) #b
lw $t3, 8($t0) #c
lw $t4, 12($t0) #d
lw $t5, 16($t0) #e
lw $t6, 20($t0) #x

# resultado = -a

sub $t7, $zero, $t1

# resultado = resultado * x + b

mult $t7, $t6
mflo $t7
add $t7, $t7, $t2

# resultado = resultado * x - c

mult $t7, $t6
mflo $t7
sub $t7, $t7, $t3

# resultado = resultado * x + d

mult $t7, $t6
mflo $t7
add $t7, $t7, $t4

# resultado = resultado * x - e

mult $t7, $t6
mflo $t7
sub $t7, $t7, $t5

# salvar em y

sw $t7, 24($t0)