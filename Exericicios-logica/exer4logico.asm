.text exercicio 4
#Escreva a sequência 0x12345678 em $t1. A seguir, escreva um
#código que inverta a sequência, escrevendo 0x87654321 em $t2.
#Obviamente o código deve inverter os bits de $t1 e não
#simplesmente escrever 0x87654321 diretamente em $t2.

# --- Parte 1: Carregar 0x12345678 em $t1 ---
ori $t1, $zero, 0x1234   # $t1 = 0x00001234
sll $t1, $t1, 16         # $t1 = 0x12340000
ori $t2, $zero, 0x5678   # $t2 = 0x00005678
or  $t1, $t1, $t2        # $t1 = 0x12345678

# Vamos limpar o $t2 antes de começar
xor $t2, $t2, $t2

# 1. Move o '8' (0x00000008) para o topo
andi $t3, $t1, 0x000F
sll  $t3, $t3, 28
or   $t2, $t2, $t3       # $t2 = 0x80000000

# 2. Move o '7' (0x00000070) para a posição 24
andi $t3, $t1, 0x00F0
sll  $t3, $t3, 20
or   $t2, $t2, $t3       # $t2 = 0x87000000

# 3. Move o '6' (0x00000600) para a posição 20
andi $t3, $t1, 0x0F00
sll  $t3, $t3, 12
or   $t2, $t2, $t3       # $t2 = 0x87600000

# 4. Move o '5' (0x00005000) para a posição 16
andi $t3, $t1, 0xF000
sll  $t3, $t3, 4
or   $t2, $t2, $t3       # $t2 = 0x87650000

# 5. Move o '4' (0x00040000) para a posição 12
srl  $t3, $t1, 4         # Move 0x4 para a posição do 0x5
andi $t3, $t3, 0xF000    # Agora a máscara 0xF000 pega o '4'
srl  $t3, $t3, 4         # Ajusta para a posição final
or   $t2, $t2, $t3       # $t2 = 0x87654000

# 6. Move o '3' (0x00300000) para a posição 8
srl  $t3, $t1, 12        # Traz o '3' para a região do 0x0F00
andi $t3, $t3, 0x0F00    # Isola o '3'
srl  $t3, $t3, 0         # (Apenas conceitual, já está na posição)
or   $t2, $t2, $t3       # $t2 = 0x87654300

# 7. Move o '2' (0x02000000) para a posição 4
srl  $t3, $t1, 20        # Traz o '2' para a região do 0x00F0
andi $t3, $t3, 0x00F0    # Isola o '2'
or   $t2, $t2, $t3       # $t2 = 0x87654320

# 8. Move o '1' (0x10000000) para a posição 0
srl  $t3, $t1, 28        # Traz o '1' para a ponta (0x00000001)
andi $t3, $t3, 0x000F    # Isola o '1'
or   $t2, $t2, $t3       # $t2 = 0x87654321