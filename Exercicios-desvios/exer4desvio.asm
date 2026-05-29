.text Exercicio 4
ori $t0, $zero, 75    # Exemplo: 75 está no segundo intervalo

add $t1, $zero, $zero # Começa com a flag em 0

# --- Teste Intervalo 1 (20 a 40) ---
slti $t2, $t0, 20      # Se temp < 20
bne  $t2, $zero, teste2 # pula para o próximo teste
slti $t2, $t0, 41      # Se temp < 41 (ou seja, <= 40)
bne  $t2, $zero, set_flag # está dentro!

teste2:
# --- Teste Intervalo 2 (60 a 80) ---
slti $t2, $t0, 60      # Se temp < 60
bne  $t2, $zero, sair  # Se for menor que 60, não está em nenhum. Sair.
slti $t2, $t0, 81      # Se temp < 81 (ou seja, <= 80)
beq  $t2, $zero, sair  # Se for maior que 80, sair.

set_flag:
ori $t1, $zero, 1      # Atribui 1 à flag

sair:
# O programa termina aqui.