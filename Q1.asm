BEGIN:

addi $s0, $zero, 2 #Adicionando valor no registrador $s0, a = 2
addi $s1, $zero, 1 #Adicionando valor no registrador $s1, b = 1
addi $s2, $zero, 0 #Adicionando valor no registrador $s2, m = 0
slt $t1, $s1, $s2 #seta 1 na condi�ao b ser menor que m
beq $t1, $zero, IF #Verifica o valor de t1, para decidir se o if � satisfeito.
addi $s2, $zero, 0 #Caso n�o satisfa�a, atribui o valor a $s2

j END

IF: 

addi $s2, $s1, 0 #Atribui��o se condi��o

END:
