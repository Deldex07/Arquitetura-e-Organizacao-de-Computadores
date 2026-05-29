.text exercicio 1
#Faça um programa que escreva o valor 0xDECADA70 no
#registrador $t7, incluindo um dígito hexadecimal por vez (isto é,
#insira letra por letra, individualmente) no registrador

ori $t7, $0, 0xD #$t7=0xD
sll $t7, $t7, 4 # $t7 = 0xD0
ori $t7, $t7, 0xE #$t7=0xe
sll $t7, $t7, 4 # $t7 = 0xDE0
ori $t7, $t7, 0xC #$t7=0xC
sll $t7, $t7, 4 # $t7 = 0xDEC0
ori $t7, $t7, 0xA #$t7=0xA
sll $t7, $t7, 4 # $t7 = 0xDECA0
ori $t7, $t7, 0xD #$t7=0xD
sll $t7, $t7, 4 # $t7 = 0xDECAD0
ori $t7, $t7, 0xA #$t7=0xA
sll $t7, $t7, 4 # $t7 = 0xDECADA0
ori $t7, $t7, 0x7 #$t7=0x7
sll $t7, $t7, 4 # $t7 = 0xDECADA70