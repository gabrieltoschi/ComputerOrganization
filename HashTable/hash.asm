# referencia nesses slides : http://courses.cs.vt.edu/cs2506/Fall2014/Notes/L04.MIPSAssemblyOverview.pdf


.data
 	hash:    .space 64 #alocando memoria pra uma array com 16 posicoes de 4 bytes (endereco tem 4bytes)
 	listSize:.space 64 #vector de 16 posicoes pra armazernar o tamanha de cada lista encadeada
 	#hash:   .word 16  mesma coisa que  .space 64
.align 0  
 	menu:	.asciiz "1. Insert Key\n2. Remove Key\n3. Search Key\n4. Print Hash\n5. Exit \n"
	option: .asciiz "What option: \n"
	notValid: .asciiz "Option not valid! \n" 
.text
# node:   prev (4bytes)
#         valor (4bytes)
#         next  (4bytes)

#usar variaveis para programar, nao armazenar valores nos registradores.
#Leve em conta que



.globl main
main:

#chamar menu

#ler opcao na main; guarda opcao em um reg Z
#ler valor na main; guardar em um reg X
#calcular index; guardar valor em um reg Y

#fazer um loop pra chamar a funcao de acordo com a escolha do usuario
	
	callMenu:
		jal printMenu 
	
	loop_option:
		
		beq $t1, 1, insert
		
		#beq $v0, 2, remove 
		
		#beq $v0, 3, search 
		
		#beq $v0, 4, printHash
		
		#beq $v0, 5, exit_loop
		
		li $v0, 4
		la $a0, notValid
		syscall
		
		j callMenu 
  #
	exit_loop:




calloc:

# $v0 =  returns option
printMenu:
	li $v0, 4 		# system call code for printing string = 4
	la $a0, menu		# load address of string to be printed into $a0
	syscall 
	
	#asking what option
	li $v0, 4
	la $a0, option
	syscall 
	

	li $v0, 5 #reading an interger 
	syscall 
	
	la $t1,($v0)
	jr $ra		
	
# $a0 = numero
# $v0 = retorna mod
hashFunc:
	
	li $a1, 16			  # $a1 = 16, 16 eh o valor do mod, usado na comparacao
	li $a2, -16			  # $a2 = -16, usado na subtracao
	
	mod_startloop:	
		blt $a0, $a1, mod_endloop # caso o numero ($a0) for menor que o mod ($a1),
					  # termine o loop
		add $a0, $a0, $a2	  # $a0 = $a0 + $a2; numero = numero + (-16)
		j mod_startloop		  # recomeca o loop
		
	mod_endloop:
		add $v0, $zero, $a0	  # $v0 = $zero + $a0; index = 0 + result; index = result;
		jr $ra			  # retorne a execucao do programa principal
					  # RETORNA em $v0 o resultado do mod
		
			
	

search:

	j callMenu


insert:
	j callMenu


#valor = registar X ; hash - variavel global; listSize - var global ; index - registrador Y
remove:
	j callMenu

#
printHash:
	j callMenu