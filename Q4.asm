BEGIN:

addi $s0, $zero, 1 #Adiciona valor no registrador $s0, a
addi $s1, $zero, 2 #Adiciona valor no registrador $s1, b
slt $t1, $s0 , $s1 #Verifica se b � menor que a
beq $t1, $zero , SET_1
addi $a0, $zero, 0 #Adicionando valor no registrador $a0, soma total

LOOP:

add $a0 , $a0, $s0 #Incrementa a soma com o n�mero atual
addi $s0, $s0 ,1 #Incrementa o valor do $s0 em +1, assim indo para o pr�ximo valor dentro do intervalo
beq $s0, $s1, LAST #Finaliza o loop, quando a == b

jal LOOP

SET_1: 

addi $a1, $zero, 1 #Registrador $v1 (v) recebe o valor de 1, pois a>b.

j END

LAST:

add $a0, $a0, $s1 #Realiza a ultima incrementa��o

END:
  #Se a>b , o registrador $a1 estar� com o valor 1.
  #Caso contr�rio, a soma dos n�meros no intervalo estar� no registrador $v0

