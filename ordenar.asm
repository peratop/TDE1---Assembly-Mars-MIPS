.data
n:      .word 6
array:  .word 4, 3, 9, 5, 2, 1

.text
.globl main
main:
    # -------------------------------
    # Preparação: carregar base e n
    # -------------------------------
    la    $s0, array      # $s0 = &array
    lw    $s1, n          # $s1 = n

    # -------------------------------
    # Ordenação por seleção
    # -------------------------------
    li    $t0, 0          # i = 0
outer_loop:
    beq   $t0, $s1, print_result   # se i == n, imprimir

    move  $t7, $t0                   # min_idx = i
    sll   $t8, $t7, 2
    addu  $t9, $s0, $t8
    lw    $t3, 0($t9)                # min_val = array[i]

    addiu $t1, $t0, 1                # j = i + 1
find_min:
    slt   $t2, $t1, $s1
    beq   $t2, $zero, do_swap

    sll   $t8, $t1, 2
    addu  $t9, $s0, $t8
    lw    $t4, 0($t9)                # cur = array[j]

    slt   $t2, $t4, $t3
    beq   $t2, $zero, next_j
    move  $t3, $t4
    move  $t7, $t1

next_j:
    addiu $t1, $t1, 1
    b     find_min

do_swap:
    sll   $t8, $t0, 2
    addu  $t9, $s0, $t8
    lw    $t5, 0($t9)

    sll   $t8, $t7, 2
    addu  $t2, $s0, $t8
    lw    $t6, 0($t2)

    sw    $t6, 0($t9)
    sw    $t5, 0($t2)

    addiu $t0, $t0, 1
    b     outer_loop

# -------------------------------
# Impressão do array ordenado
# -------------------------------
print_result:
    li    $t0, 0          # i = 0

print_loop:
    beq   $t0, $s1, exit

    sll   $t1, $t0, 2
    addu  $t2, $s0, $t1
    lw    $a0, 0($t2)

    li    $v0, 1          # syscall print_int
    syscall

    addiu $t0, $t0, 1

    # imprimir vírgula e espaço se não for o último
    bne   $t0, $s1, print_comma
    b     print_loop

print_comma:
    li    $a0, 44         # vírgula
    li    $v0, 11
    syscall
    b     print_loop

exit:
    li $v0, 10            # exit
    syscall
