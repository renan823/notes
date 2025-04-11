
### Código básico
```asm
		.data
hello:  .asciz "Hello"

		.text
		.globl main
main:
		addi a7, zero, 4
		la a0, hello
		ecall

		addi a7, zero, 10
		ecall
```


### Serviços
Serviços da **ecall**, a chamada ao SO para operações que envolvem I/O. Toda operação de I/O **deve** usar ecall!

> Serviços **SEMPRE** são colocados no registrador a7

| Operação                | Código numérico |
| ----------------------- | --------------- |
| Print int               | 1               |
| Print float             | 2               |
| Print double            | 3               |
| Print string            | 4               |
| Read int                | 5               |
| Read float              | 6               |
| Read double             | 7               |
| Read string             | 8               |
| Sbrk (alocar heap)      | 9               |
| Exit (exit sucesso)     | 10              |
| Print char              | 11              |
| Read char               | 12              |
| Exit2 (exit com código) | 93              |

> Para habilitar a escrita de uma string, por exemplo, devemos colocar o código 4 no reg. a7


**Registradores**

| Registrador | Nome     | Descrição                   |
| ----------- | -------- | --------------------------- |
| x0          | zero     | Valor fixo em zero          |
| x1          | ra       | return address              |
| x2          | sp       | stack pointer               |
| x5/x6/x7    | t0/t1/t2 | Temporário                  |
| x8/x9       | s0/s1    | Salvo                       |
| x10/x11     | a0/a1    | Argumento/retorno de função |
| x12..17     | a2..7    | Argumento de função         |
| x18..27     | s2..11   | Salvo                       |
| x28..31     | t3..6    | Temporário                  |

### Comandos
A execução de comandos envolve tanto operadores como registradores de origem/destinos. Alguns comandos precisam de uma ecall para serem executados.

**add** -> Soma o valor de dois registradores e coloca no terceiro
```asm
add s0, a0, zero #soma a0 com zero, e armazena em s0
```

**addi** -> Soma com valor imediato e salva em um registrador
```asm
addi a7, zero, 4 #salva a soma no a7 (será um serviço)
```

**la** -> Carrega o endereço do primeiro byte para o registrador
```
la a0, hello #salva o endereço do 1o byte de hello em a0
```

**j** -> Jump incondicional
```
j minha_label #pula para minha_label
```

**beq** -> Branch on equals
**bne** -> Branch on not equals
**blt** -> Branch on less than
**bge** -> Branch on greater or equals


**ecall** -> Habilita I/O. Necessário para read/write.
```
#... operações de i/o
ecall
```


### Diretivas
Ajudam o montador a entender como e onde colocar cada dado na memória. São eliminadas no binário final.

**.data** -> Dados estáticos do programa
**.text** -> Código

**.globl** -> Indica o ponto de entrada do programa

```asm
	.data
	#dados estaticos aqui

	.text
	#códigos, funções, etc aqui

	.globl sua_label
sua_label:
```

As diretivas também são usadas para representar tipos de dados:

**.byte** -> Byte
**.half** -> Meia palavra (2 bytes)
**.word** -> Palavra (4 bytes)
**.float** -> Float
**.double** -> Double
**.asciz** -> String

Os tipos de dados precisam ser alinhados na memória, para ocupar o espaço correto correspondente ao seu tamanho.
Strings, por exemplo, podem ocupar bytes. Inteiros podem ocupar palavras ou meias palavras.

**.align N** -> Realiza o alinhamento na memória de $2^{N}$ bytes 

### Procedimentos/Funções
São blocos de código que executam uma tarefa.
Funções possuem retorno.
Procedimentos não possuem retorno.

> Para parâmetros: a0 ... a7

> Para retorno: a0 e a1


**jal** -> jump and link
**jr** -> jump register (pseudo instrução)

> Exemplo: Fatorial usando função

```asm
	.data
	.align 0
msg1:	.asciz "O fatorial de "
msg2:	.asciz " eh "

	.text
	.align 2
	.globl main
main:
	# Ler entrada de dados
	addi a7, zero, 5
	ecall
	
	# Salvar numero digitado
	add s0, zero, a0
	
	jal fatorial # Chamar a função
	
	j fim
	
# Calcula o fatorial
# a0: número para calcular o fatorial
# a1: fatorial		
fatorial:
	# Valor do fatorial
	addi t0, zero, 1
	
	# Contador
	add t1, zero, a0

loop: 
	# Parada cont <= 1
	beq t1, zero, saida
		
	# Multiplicar
	mul t0, t0, t1	
	
	# Decrementar valor
	addi t1, t1, -1 
		
	# Retomar loop
	j loop

saida:
	# Salvar valor no a1
	add a1, zero, t0
	
	jr ra # Retornar para o fim
fim:
	# Exibit msg1
	addi a7, zero, 4
	la a0, msg1
	ecall
	
	# Exibir valor digitado
	addi a7, zero, 1
	add a0, zero, s0
	ecall
	
	# Exibir msg2
	addi a7, zero, 4
	la a0, msg2
	ecall
	
	# Exibir fatorial
	addi a7, zero, 1
	add a0, zero, a1
	ecall
	
	# Encerrar programa
	addi a7, zero, 10
	ecall
	

```

### Carregando dados da memória
Até agora, todos os dados estavam disponíveis nos registradores. 


> Exemplo: Copiar strings

```asm
		.data
		.align 0

str1:   .asciz "Oi mãe! Estou na USP"
str2:   .space 24 # Reserva espaço na memoria stack

		.text
		.align 2
		.globl main

main:
		la s0, str1 # s0 armazena endereço do 1o byte de str1
		la s1, str2 # s1 armazena endereço do 1o byte de str2

loop:
		lb t0, 0(s0) # carrega o 1o byte da string, sem offset
		sb t0, 0(s1) # escreve o valor de t0 para o end. em s1

		addi s0, s0, 1
		addi s1, s1, 1

		bne t0, zero, loop

		# imprimir string
		addi a7, zero, 4
		la a0, str2 # carrega endereço da string destino
		ecall

		addi a7, zero, 10
		ecall
```


> Exemplo: Vetor de strings

```
	.data
vetor: .word 0, 0, 0, 0,0 
str1: .asciz "String"
str2: .asciz "Aaz"
.
.
.
	.text
	.globl main

main:
	# Carregar primeiro byte do vetor
	add s0, zero, vetor

	# Carregar byte da str1 e salvar no vetor
	add t0, zero, str1
	sw t0, 0(s0)

	# Carregar byte da str2 e salvar no vetor (com offset)
	add t0, zero, str2
	sw t0, 4(s0)
	
```


> Exemplo: Somar items do vetor
```asm
	.data
	.align 0
msg:	.asciz "Soma total: "
	.align 2
vet:	.word 1, 2, 3, 4, 5 # vetor de inteiros
tam:	.word 5

	.text
	.align 2
	.globl main
main:
	# carregar vetor
	la t0, vet
	
	# carregar tamanho vetor
	lw t1, tam
	
	# indice do vetor (começa 0)
	add t2, zero,zero
	
	# total
	add t3, zero, zero
soma:
	beq t1, t2, fim
	
	# pega o valor da posicao atual do vetor
	lw t4, 0(t0)
	
	# somar ao total
	add t3, t3, t4
	
	# i++
	addi t2, t2, 1
	
	#proxima posicao de memoria
	addi t0, t0, 4 # pular 4 bytes!!
	
	# continuar
	j soma
	
fim:
	# exibir mensagem
	addi a7, zero, 4
	la a0, msg
	ecall
	
	#exibir soma
	addi a7, zero, 1
	add a0, zero, t3
	ecall

	# fim do programa
	addi a7, zero, 10
	ecall
```

> Exemplo: Comparar strings

```asm
	.data
	.align 0
str1:	.asciz "Hello world"
str2:	.asciz "Hello world"
msgI:	.asciz "Iguais"
msgD:	.asciz "Diferentes"

	.text
	.align 2
	.globl main
main:
	# Carregar endereços das strs
	la t0, str1
	la t1, str2
			
loop:
	# Carregar str1 e str2
	lb t2, 0(t0)
	lb t3, 0(t1)
	
	# Verificar se são iguais
	bne t2, t3, diferentes
	
	# Verificar fim da str
	beq t2, zero, condicao
volta:
	# Proximos bytes
	addi t0, t0, 1
	addi t1, t1, 1
	
	j loop
	
condicao:
	beq t3, zero, iguais
	
	# Não estão no fim, volta pro loop
	j volta
	
iguais:
	# Exibir mensagem de iguais
	addi a7, zero, 4
	la a0, msgI
	ecall
	
	j fim

diferentes:
	# Exibir mensagem de diferentes
	addi a7, zero, 4
	la a0, msgD
	ecall
	
	j fim
	
fim:
	# Encerrar programa
	addi a7, zero, 10
	ecall
```


### Alocação Dinâmica
O serviço 9 da ecall (SBRK) é o responsável por alocar memória.

O tamanho para ser alocado deve estar no a0, e após a alocação o a0 aponta para o endereço do primeiro byte alocado.

Não é necessário desalocar memória!

> Exemplo: Copiar string (dinâmico)
```asm
	.data
	.align 0
str1:	.asciz "Oi mãe!"
ptr:	.word # Variavel ponteiro

	.text
	.align 2
	.globl main
	
main:
	# Calcular tamanho da string
	# t1 contador
	add t1, zero, zero
	
	# s0 primeiro byte da string
	la s0, str1
	
	# t0 caracter a ser lido
	
loop_tamanho:
	lb t0, 0(s0)
	
	# Proximo endereço
	addi s0, s0, 1
	
	# Contador ++
	addi t1, t1, 1
	
	# Condição de parada: caracter lido = 0
	bne t0, zero, loop_tamanho
	
	# Alocar espaço na heap --------------------------------------
	addi a7, zero, 9
	
	# Copiar tamanho da str1 para a0 (necessario no sbrk)
	add a0, zero, t1
	
	# Executar alocação
	ecall
	
	# Armazenar conteudo de a0 em ptr -----------------------------
	# t2 endereço do primeiro byte de ptr
	la t2, ptr
	
	# Armazenar a0 na posição apontada por ptr
	sw a0, 0(t2)
	
	# Preparação para copiar strings -------------------------------
	# s0 endereço str1
	la s0, str1
	
	# t2 endereço string destino
	la t2, ptr
	
	# s1 conteudo lido do ptr
	lw s1, 0(t2)
	
loop_copia:
	# Carregar byte da string 1
	lb t0, 0(s0)
	
	# Salvar byte na string destino
	sb t0, 0(s1)
	
	# Próximos bytes
	addi, s0, s0, 1
	addi, s1, s1, 1
	
	# Fim do loop -> Ler 0
	bne t0, zero, loop_copia
	
	# Imprimir string -----------------------------------------------
	addi a7, zero, 4
	
	# Colocar em a0 o conteuido de ptr
	la t2, ptr
	lw a0, 0(t2)
	
	ecall
	
	# Fim do programa
	addi a7, zero, 10
	ecall
```

O `ptr` armazena o endereço de `a0`. Primeiro é necessário carregar o endereço de `ptr`.
O conteúdo apontado por `ptr` é o endereço da região alocada, então, é necessário primeiro carregar o endereço de `ptr` e depois acessar, via `lw`, o conteúdo ali presente, que é o endereço para `a0`. 

### Pilha
Usada para realizar procedimentos recursivos.
Precisamos indicar quantos items serão salvos na pilha, para então salvar um valor ali.

```asm
addi sp, sp, -8 # 2 x 4 bytes (a pikha cresce para baixo)

# Salvar valores
sw ra, 0(sp)
sw a0, 4(sp)
```


> Exemplo: Fatorial Recursivo

```asm
	.data
	.align 0
msg1:	.asciz "Digite um valor: "
msg2:	.asciz "O fatorial calculado eh: "

	.text
	.align 2
	.globl main
	
main:
	# Imprimir msg1
	addi a7, zero, 4
	la a0, msg1
	ecall
	
	# Ler inteiro
	addi a7, zero, 5
	ecall
	
	# Salvar valor
	add s0, zero, a0
	
	# Chamar fatorial
	jal fatorial
	
	# Imprimir saida
	addi a7, zero, 4
	la a0, msg2
	ecall
	
	# Imprimir fatorial
	addi a7, zero, 1
	add a0, zero, a1
	ecall
	
	# Sair do programa
	addi a7, zero, 10
	ecall
	
fatorial:
	addi sp, sp, -8     # Alocar espaço na pilha (8 bytes)
	sw ra, 4(sp)        # Salvar o endereço de retorno na pilha
	sw a0, 0(sp)        # Salvar argumento n na pilha
	
	addi t0, zero, 1            # t0 = 1
	beq a0, zero, caso_base  # Se n == 0, retorna 1
	
	addi a0, a0, -1     # n - 1
	jal fatorial        # Chamada recursiva fatorial(n-1)
	
	lw a0, 0(sp)        # Recupera n original
	mul a1, a0, a1      # n * fatorial(n-1)
	j fim

caso_base:
        addi a1, zero, 1            # Retorna 1

fim:
    	lw ra, 4(sp)        # Recupera o endereço de retorno
    	addi sp, sp, 8      # Desaloca espaço da pilha
    	jr ra

```