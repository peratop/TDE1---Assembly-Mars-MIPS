# TDE1---Assembly-Mars-MIPS
Explicação do ordenar.asm

- define n = 6 e o array com 6 números
- carrega em $s0 o endereço do array e em $s1 o valor de n
- $t0 começa em 0, é o índice i
- começa um loop externo: se i == n vai imprimir
- guarda i em $t7 como índice do menor valor (min_idx) e pega array[i] em $t3 (min_val)
- $t1 começa em i+1, e faz loop para achar o menor valor do resto do array
- compara array[j] com min_val, se menor, atualiza min_val e min_idx
- quando termina, troca array[i] com array[min_idx]
- incrementa i e repete até ordenar tudo (selection sort)
- depois imprime o array: pega cada elemento e dá syscall de print_int
- entre números imprime vírgula (44 na tabela ASCII)
- termina com syscall 10 (encerrar)


Explicação do soma.asm
- define três variáveis e, l, d com anos
- carrega cada uma dessas palavras na memória para registradores $s0, $s1, $s2
- soma e+l no $s3 e depois soma com d
- move o resultado para $a0 e faz syscall 1 (imprimir inteiro)
- depois faz syscall 10 (encerrar)

link do youtube
https://youtu.be/vIOAebHs7PU?si=Efh65_JR_d6I7A-e