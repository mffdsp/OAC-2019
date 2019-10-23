BEGIN:
#s0 corresponde ao a. $s1 corresponde ao b. 
addi $s0, $zero, 1 #Adicionando valor no registrador $s00,
addi $s1, $zero, -3 #Adicionando valor no registrador $s2
addi $v0, $zero, 0 #Registrador auxiliar para guardar o sinal de $s0 (1 para negativo, 0 para positivo)
addi $v1, $zero, 0 #Registrador auxiliar para guardar o sinal de $s1 (1 para negativo, 0 para positivo)
slt $v0, $s0, $zero #Verificando se a<0 ($zero<$s0)
slt $v1, $s1, $zero #Verifica se b<0

addi $t0, $zero, 0 #atribui valor da multiplica��o

MULT: #Realiza a multiplica��o entre o par de numeros

beq $s0, $zero, SINAL #Caso base, quando o $s0 chegar em 0.
add $t0, $t0, $s1 #Somando o n�mero $s1 ao registrador $t0

j INCREMENTO 

INCREMENTO: #Verifica que tipo de incremento ser� realizado

slt $t1, $zero, $s0 #Se negativo, soma-se 1
beq $t1, $zero, INCREMENTO_POSITIVO
addi $s0, $s0, -1 #Se positivo, ser� subtraido 1
	
j MULT

INCREMENTO_POSITIVO: #Label +=1

addi $s0, $s0 , 1
	
j MULT

INVERTE_SINAL: #Realiza troca de sinal

sub $t0, $zero, $t0
	
j END

POSITIVO: #Se o valor for > 0, ou seja positivo

slt $t1, $zero, $t0 #Verifica��o
beq $t1, $zero, INVERTE_SINAL #Caso n�o seja positivo, inverte-se o sinal
	
j END
	
SINAL: #Ap�s realizar a multiplica��o , verificar� qual ser� o sinal do n�mero

beq $v0, $v1, POSITIVO #Se ambos os sinais forem iguais, pula para a label, se n�o segue-se.
	
NEGATIVO: 
	
slt $t1, $zero, $t0 #Verifica se $to j� � negativo.
bne $t1, $zero, INVERTE_SINAL #Caso seja positivo inverte-se o sinal.
	
END: # Valor final fixado em $t0