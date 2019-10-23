BEGIN:

addi $s0, $zero, 1 #Adicionando valor no registrador $s0
addi $s1, $zero, -3 #Adicionando valor no registrador $s2
addi $v0, $zero, 0 #Registrador auxiliar para sinal de $s0 (1 para negativo, 0 para positivo)
addi $v1, $zero, 0 #Registrador auxiliar para sinal de $s1 (1 para negativo, 0 para positivo)
slt $v0, $s0, $zero #Verifica se a < 0 
slt $v1, $s1, $zero #Verifica se b < 0

addi $t0, $zero, 0 #atribui valor da multiplicação

MULT: #Realiza a multiplicação entre o par de numeros

beq $s0, $zero, SINAL #Caso base, quando o $s0 chegar em 0.
add $t0, $t0, $s1 #Somando o número $s1 ao registrador $t0

j INCREMENTO 

INCREMENTO: #Verifica que tipo de incremento será realizado

slt $t1, $zero, $s0 #Se negativo, soma-se 1
beq $t1, $zero, INCREMENTO_POSITIVO
addi $s0, $s0, -1 #Se positivo, será subtraido 1
	
j MULT

INCREMENTO_POSITIVO: #Label +=1

addi $s0, $s0 , 1
	
j MULT

INVERTE_SINAL: #Realiza troca de sinal

sub $t0, $zero, $t0
	
j END

POSITIVO: #Se o valor for > 0, ou seja positivo

slt $t1, $zero, $t0 #Verificação
beq $t1, $zero, INVERTE_SINAL #Caso não seja positivo, inverte-se o sinal
	
j END
	
SINAL: #Após realizar a multiplicação , verificará qual será o sinal do número

beq $v0, $v1, POSITIVO #Se ambos os sinais forem iguais, pula para a label, se não segue-se.
	
NEGATIVO: 
	
slt $t1, $zero, $t0 #Verifica se $to já é negativo.
bne $t1, $zero, INVERTE_SINAL #Caso seja positivo inverte-se o sinal.
	
END: # Valor final fixado em $t0
