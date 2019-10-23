BEGIN:

addi $s1, $zero, 1 #Adiciona valor a variavel a
addi $s2, $zero, 2 #Adiciona valor a variavel b
addi $s3, $zero, 0 #Adiciona valor a variavel x
slt $t1, $zero, $s1 #Verificando se a ($s1) � maior ou igual a 0
slt $t2, $s3, $s2 #Verificando se a ($s1) � menor que b ($s2)
beq $t1, $zero, ELSEIF #Verificando se a condi��o (a >= 0) � verdadeira, se n�o, vai a label ELSEIF
beq $t2, $zero, ELSEIF #Verificando se a condi��o a < b � verdadeira, se n�o, vai a label ELSEIF
addi $s3, $zero, 1 #Entrando trador $s3, ou seja, x receber� 1.

j END

ELSEIF: 

slt $t3, $s1, $zero #Verificando se a < 0
slt $t4, $s1, $s2 #Verificando se a > b
beq $t3, $zero, ELSE #Verifica se t3 � falso, ou seja, se a > 0 � verdadeira
beq $t4, $zero, ELSE #Verifica se a > b � satisfeita

addi $s3, $zero, 2 #Atribui��o do ELSEIF em x = 2

j END

ELSE:

addi $s3, $zero, 3 #Caso entre no ELSE, x receber� valor 3

END: