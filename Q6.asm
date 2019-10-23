BEGIN:
addi $s0, $zero, 6 # numero de fib buscado
jal FIB # chamada da funcao

j END

FIB:

addi $sp, $sp, -4
sw $ra, 0($sp) # guardo o endereço de retorno da chamada recursiva	
slti $t0, $s0, 1 # n < 1 ?
bne $t0, $zero, FALSE # Vai a label false, caso seja satisfeito
slti $t0, $s0, 3 #Verifica se n < 3
bne $t0, $zero, TRUE # Vau a labl true, caso seja satisfeito	
addi $sp, $sp, -4
sw $s0, 0($sp) # Salvando posição atual na pilha	
addi $s0, $s0, -1

jal FIB # Chamada recursiva para n - 1
	
addi $s0, $s0, -1

jal FIB # Chamada recursiva para n - 2

lw $s0, 0($sp) # Ultima posiçao da pilha para recursao
addi $sp, $sp, 4 	
lw $ra, 0($sp) # Recebe ultimo endereço da pilha
addi $sp, $sp, 4
jr $ra # Volta da chamada recursiva
	
FALSE:
lw $ra, 0($sp) # Recebe endereço final de retorno
addi $sp, $sp, 4
jr $ra #Volta da recursao
		
TRUE:
addi $v1, $v1, 1 # Adiciona 1 ao valor de fib
lw $ra, 0($sp) # Recebe endereço final de retorn
addi $sp, $sp, 4
jr $ra #Volta da recursao

END: