BEGIN:

addi $s1, $zero, 1 #Adiciona valor a variavel a
addi $s2, $zero, 2 #Adiciona valor a variavel b
addi $s3, $zero, 0 #Adiciona valor a variavel x
slt $t1, $zero, $s1 #Verificando se a ($s1) é maior ou igual a 0
slt $t2, $s3, $s2 #Verificando se a ($s1) é menor que b ($s2)
beq $t1, $zero, ELSEIF #Verificando se a condição (a >= 0) é verdadeira, se não, vai a label ELSEIF
beq $t2, $zero, ELSEIF #Verificando se a condição a < b é verdadeira, se não, vai a label ELSEIF
addi $s3, $zero, 1 #Entrando trador $s3, ou seja, x receberá 1.

j END

ELSEIF: 

slt $t3, $s1, $zero #Verificando se a < 0
slt $t4, $s1, $s2 #Verificando se a > b
beq $t3, $zero, ELSE #Verifica se t3 é falso, ou seja, se a > 0 é verdadeira
beq $t4, $zero, ELSE #Verifica se a > b é satisfeita

addi $s3, $zero, 2 #Atribuição do ELSEIF em x = 2

j END

ELSE:

addi $s3, $zero, 3 #Caso entre no ELSE, x receberá valor 3

END: