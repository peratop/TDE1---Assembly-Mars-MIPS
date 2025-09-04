.data
e:      .word 2006 	#nasc eduardo
l:	.word 2002	#nasc leonardo
d:	.word 2006	#nasc diego

.text
.globl main
main:
    # -------------------------------
    # carrega os arquivos para somar
    # -------------------------------
    la    $t0, e
    lw    $s0, 0($t0)     # $s0 = valor de e (2006)
    
    la    $t1, l
    lw	  $s1, 0($t1)	#$s1 = valor de l (2002)
    
    la    $t2, d
    lw    $s2, 0($t2)	#$s1 = valor de d (2006)
    
    addu $s3, $s0, $s1	#soma e com l
    addu $s3, $s3, $s2	#soma o resultado com d
    
    li    $v0, 1          # imprime um valor inteiro
    move  $a0, $s3        # move o resultado para $a0
    syscall
    
    
    li    $v0, 10         # Código para matar o programa
    syscall
