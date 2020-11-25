.text
.globl main

main:
# cargamos los numeros del 1 al 4 en s0 a s3
# están en la memoria de datos en las primeras 4 words
lw $s0, 0($zero)
lw $s1, 4($zero)
lw $s2, 8($zero)
lw $s3, 12($zero)
# a partir de ahora
# s0 = 1
# s1 = 2
# s2 = 3
# s3 = 4

add $s0, $s0, $s2   # s0 = 1 + 3
sub $s3, $s3, $s0   # s3 = 4 - 4
add $s3, $s1, $s2   # s3 = 2 + 3
sw  $s3, 16($zero)  # memoria de datos direccion 0x00000010 deberia tener un 5

li $v0, 10
syscall


# ----------------------------- #
# Pasado a codigo maquina
# para el circuito del Logisim
# quedaria asi
# ----------------------------- #
#
# 8c100000
# 8c110001
# 8c120002
# 8c130003
# 02128020
# 02709822
# 02329820
# ac130004
#
# Eso va en la ROM de
# la Instruction Memory
# ----------------------------- #
