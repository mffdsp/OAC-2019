.data
string: .asciiz "suetam" # string a ser invertida
output: .space 256 # string vazia onde serah salva a string invertida

.text
BEGIN:
#Intervalo [a,z] em ASCII
addi $s0, $zero, 64 
addi $s1, $zero, 90 
	
#Intervalo [A,Z] em ASCII
addi $s2, $zero, 96 
addi $s3, $zero, 123 

addi $t0, $zero 0 #Contador que percorre char a char
la $a0,	string #Salva o endereco do byte inicial da string
addi $t2, $zero, 0 #Salvo endereço de cada byte
	
jal INVERSE_CASE # Realiza troca de case

add $t1, $zero, $v0 #Salva o tamanho da string em t1
add $t2, $zero, $a0	# Salva o endereco da string // string[0], primeira posicao da string

addi $t0, $zero, 0 # contador que percorre os bytes da string
addi $t3, $zero, 0 # armazena o byte atual enquanto percorre a string
	
jal INVERSE_ORDER
	
PRINT:

addi $v0, $zero, 4
la $a0, output
syscall
				
j END
	
INVERSE_ORDER:

add $t3, $t2, $t0
lb $t4, 0($t3) #Recebe o byte
	
beq $t4, $zero, PRINT
	
sb $t4, output($t1)	
addi $t1, $t1, -1 #Reduz o tamanho
addi $t0, $t0, 1 #Incrementa o contador da posição de char (byte) 
	
j INVERSE_ORDER #Chamada para novo char

INVERSE_CASE:

add $t2, $a0, $t0 #Endereo do byte atual
lb $t1, 0($t2) 
beq $t1, $zero, FINAL #Caso base. Finalizando string, fim da função.
	
j PASSO_1 #Inverte o case do char atual
	
NEXT:

sb $t1, string($t0) #Salva o byte
addiu $t0, $t0, 1 #Passa para o proximo char
		
j INVERSE_CASE #Repete o processo para o novo char, até entrar no caso base

FINAL:

addi $t0, $t0, -1 #Voltamos um char, pois, estamos no null char
add $v0, $zero, $t0
add $t0, $zero, $zero #Reinicia o contador de posição
jr $ra #Retorna 

PASSO_1: 

slt $t7,$s0,$t1 # Verifica se é maior que 64, se não for, não é um char valido
beq $t7, $zero, INVALID_CHAR
slt $t7,$s1,$t1 # Verifica se o char tem valor em ASCII >= 90
beq $t7, $zero, TO_LOWER
slt $t7,$s2,$t1 # Verifica se o char tem valor em ASCII >= 96
beq $t7, $zero, INVALID_CHAR
slt $t7,$t1,$s3 # Verifica se o char tem valor em ASCII <= 122
beq $t7, $zero, INVALID_CHAR

j TO_UPPER # Caso chegue, é minusculo, logo convertemos para maiusculo

TO_LOWER:
addi $t1,$t1,32
	
j NEXT

TO_UPPER:

addi $t1,$t1,-32
	
j NEXT

INVALID_CHAR: # Char invalido, atribuimos 1

addi $v1, $zero, 1
	
END: