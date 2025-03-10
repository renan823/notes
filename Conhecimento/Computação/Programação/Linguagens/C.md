É uma linguagem compilada de altíssimo desempenho, usada na base da grande maioria dos sistemas modernos. 
Foi criada na década de 70 por Kernighan e Ritchie.
Atualmente, possui muitas melhorias em comparação à versão original de 1972.

### Código básico
```c
#include <stdio.h>

int main () {
	printf("hello world\n");
	return 0;
}
```

- "#include <stdio.h>" adiciona funcionalidade input e output (I/O)
- A função main deve retornar 0, indicando que o programa executou corretamente
- Em caso de erros, o retorno do main é 1 ou outro valor de erro
- Ao compilar o programa, é gerado um executável


### Compilador
É o responsável por unir arquivos e tornar o programa um único arquivo binário executável.

Compilação básica
```sh
 gcc arquivo.c -o programa
```

Usando flag para identificar erros
```sh
gcc arquivo.c -Wall -o programa
```

Usando flag para definir padrão do compilador (c99, c11, c23, etc)
```sh
gcc arquivo.c std=c99 -o programa
```

Boa prática: usar flags!
```sh
gcc arquivo.c -Wall -std=c23 -o programa
```


Um arquivo **Makefile** é muito útil para compilar projetos grandes, unindo comandos para compilação individual e do projeto todo.

```Makefile
all:
	gcc arquivo.c -Wall -std=c99 -o programa

run:
	./programa

clear:
	rm programa
```

Ou então, é possível combinar processo de compilação:
```Makefile
all: avl.o main.o item.o
	gcc item.o avl.o main.o -Wall -std=c99 -o programa

item.o:
	gcc -c item.c

avl.o:
	gcc -c avl.c

main.o:
	gcc -c main.c

run:
	./programa

clear:
	rm *.o programa
```
No arquivo `Makefile` definimos todos os comandos que desejamos rodar. 
Alguns comandos dependem de dados específicos, por exemplo um arquivo já compilado.
Para identificar essas dependências, os arquivos necessários devem estar na frente do nome do comando.

Por exemplo, ao compilar todos os arquivos, precisamos que `main.o`, `avl.o` e `item.o` já estejam compilados. Se informarmos essa necessidade e criarmos um comando para atendê-la (por exemplo, um comando para compilação individual) o arquivo Makefile saberá como organizar tudo isso, para então entregar o programa final.

Para usar, basta digitar `make` e o comando desejado no terminal.

Executa o comando `all` (padrão)
```sh
make
```

Executa `run`
```sh
make run
```

### Tipos de dados
- int -> usado para valores numéricos inteiros (1, -10, 250)
- float -> usado para valores numéricos com casas decimais (1.6, 3.1415, -2.75)
- char -> armazena um único caractere; usa-se aspas simples 

### Saída formatada
Para exibir uma variável no console é necessário especificar o tipo da variável:
- `%d` ou `%i` -> int
- `%f` ou `%F` -> float
- `%lf` -> double (casas reduzidas)
- `%c` -> char
- `%s` -> string (vetor char)
- `%p` -> endereço

Desse modo, pode-se combinar diferentes saídas, como:
```c
int age = 10;
float money = 14.5;

printf("I'm %d years old, and I have %f dollars", age, money);
```

Nota: `%c` também pode ser usado para escrever ASCII, basta passar o número correto

Para saídas numéricas formatadas com precisão, usa-se o mesmo formatador do float, mas indicando a precisão:
```c
float money = 7.75654

printf("%f", money); // 7.75654
printf("%.1f", money); // 7.7
printf("%.3f", money); // 7.756
```

É possível, também, converter dados, tanto manualmente (adicionar o tipo entre parenteses) como automaticamente (o programa realiza a conversão)

### Constantes
- Ao declarar uma constante, usa-se `const` 
- Boas práticas sugerem nomear a constante em caixa alta 

### Boolean
O tipo boolean não é nativo, então deve ser importado na biblioteca `<stdbool.h>`.
Usando a biblioteca, temos acesso ao `true` e `false`.
Podemos usar 1 e 0 para, respectivamente, verdadeiro e falso.

### Operadores
Possui operadores aritméticos comuns:
- `+` soma
- `-` subtração
- `*` multiplicação
- `/` divisão
- `%` resto (ou módulo, da [[Aritmética Modular]])

As operações booleanas podem ser feitas usando os operadores:
- `&&` AND
- `||` OR
- `!` NOT

C também permite operações no nível de bits, com **operadores bitwise**:
- `<<` left shift (dois bits para esquerda, ou multiplicar por 2)
- `>>` right shift (dois bits para direita, ou dividir por 2)
- `~` complemento, inverte cada bit do valor
- `&` bitwise AND, aplica a operação AND em bits (compara cada bit usando AND)
- `|` bitwise OR, aplica operação OR em bits (compara cada bit usando OR)

Para atribuição, os operadores (considere `i` uma variável simbólica):
- `==` Igualdade
- `!=` Diferença
- `++i` Adiciona 1 ao valor de `i`, depois usa seu valor
- `i++` Usa o valor de `i`, depois adiciona 1 no valor
- `--i` Subtrai 1 no valor de `i`, depois usa seu valor
- `i--` Usa o valor de `i`, depois subtrai 1 no valor
- `i += x` Adiciona `x` ao valor de `i`
- `i -= x` Subtrai `x` do valor de `i`
- `i *= x` Multiplica o valor de `i` por `x`
- `i /= x` Divide o valor de `i` por `x`

### Condicionais
C apresenta dois tipos de condicionais principais:

##### if, else e else if
```c
if (condicao) {

} else if (condicao2) {

} else {
	//default
}
```

##### Switch 
```c
switch(variavel) {
	case 12:
		//
		break;
	case 278..389:
		break;
	default:
		
}
```
O uso do break é necessário, pois, uma vez atingida alguma condição, tudo que estiver abaixo dela será executado (sem verificar!) caso não haja break.
Caso nenhuma condição seja satisfeita, o `default` é executado.


### Repetição
C apresenta alguns métodos para executar uma mesma tarefa determinado número de vezes.

##### for
É um laço que recebe 3 argumentos: acumulador, condição de execução e mudança do acumulador.
O Acumulador é responsável por contar o número de execuções do laço. 
A condição de execução indica até quando o laço será executado. Quando a condição for falsa, então o laço se encerra.
A mudança no acumulador indica como a contagem deve ser feita. Pode ser uma soma, multiplicação, divisão, etc.


```c
for (int i = 0; i < 10; i++) {
	printf("%c\n", i);
}
```

```c
int j = 10
for (j; j > 0; j--) {
	printf("%c\n", j);
}
```


##### while
É um laço que recebe apenas um argumento: a condição de parada.
Cabe ao programador definir e garantir que a condição de para aconteça.

```c
int i = 0;
while (i != 10) {
	printf("%c\n", i);
	i++;
}
```

```c
int i = 0;
while (i != 10) { // i nunca é atualizado -> loop infinito!
	printf("%c\n", i);
}
```

Laços de repetição podem ter desvios, baseado em condições. O desvio pode sair do loop ou então ir para a próxima execução (sem finalizar a atual).

```c
int i = 0;

while (i != 10) {
	if (i % 2 == 0) {
		continue; // ignora o printf quando i é par
	}

	printf("%c\n", i);
	i++;
}

printf("%c\n", i); // i será 10
```

```c
int i = 0;

while (i != 10) {
	if (i % 2 == 0) {
		break; // encerra o loop quando i é par
	}

	printf("%c\n", i);
	i++;
}

printf("%c\n", i); // i será 0 (entrou e saiu do loop direto)
```

### Funções (simples)
São blocos reutilizáveis de código que executam uma tarefa, podendo receber e devolver valores.

Definição: `tipo_retorno nome(tipo variavel1, tipo variavel2)`

A função pode receber vários parâmetros, precisando especificar a tipagem e o nome de cada um. Parâmetros são opcionais (`void` para indicar ausência deles).

Retorno é opcional, `void` para retorno vazio. Para retornar um valor, usamos a diretiva `return` (não é necessário envolver o valor por parenteses, vai da escolha de estilização).
**Apenas uma valor pode ser retornado**.

```c
int soma(int x, int y) {
	return(x + y);
}
```

```c
void mensagem_oi(void) {
	printf("Oi\n");
}
```

```c
void mensagem_erro(bool erro) {
	if (erro) {
		printf("Deu erro!\n");
	} else {
		printf("Deu certo!\n");
	}
}
```

### Ponteiros
Ponteiros geralmente parecem um assunto complexo, mas com certeza não são!
**Ponteiros são variáveis! Apenas isso!**

A diferença de um ponteiro para uma variável "comum" é que ponteiros armazenam o endereço de outra variável.
O nome é bem sugestivo, uma vez que, na memória, o ponteiro "aponta" para o endereço de memória da variável alvo.

![[ponteiro.png]]
Aqui, `x` é um inteiro que armazena o valor 50.
Ambos `ptr` e `ptr2` são ponteiros que armazenam o endereço de `x` na memória.
O valor presente em `x` pode ser alterado diretamente (ex: `x++`) ou indiretamente, via ponteiros (ex: `*ptr = (*ptr)++`).

```c
int main(void) {
	int x = 10;
	int *ptr = &x;

	printf("%d = %d\n", x, *ptr);

	return 0
}
```
Para declarar um ponteiro, iremos utilizar o operador `*` . O valor inicial pode ser NULL (mas tome cuidado!).
Para fazer com que o ponteiro aponte para uma variável, precisamos atribuir o endereço dela ao ponteiro (**referenciar**) -> operador `&`. 

Uma vez que o ponteiro aponta para alguém, a mágica começa.

Podemos, então, usar o ponteiro para acessar a variável que ele aponta! Para fazer isso, precisamos **derreferenciá-lo** -> Usamos o mesmo operador `*` antes do ponteiro. Desse modo, estaremos lendo o valor que está na variável apontada pelo ponteiro.

**Operações com ponteiros:**
- Referenciar: `ptr = &variavel`
- Derreferenciar: `variavel = *ptr`
- Atribuir valor à variável apontada: `*ptr = valor`


> Ponteiro void: não possui tipo, podendo assumir qualquer tipagem. Aponta para um espaço de memória válido. É muito útil.

>Ponteiro NULL: aponta para lugar nenhum -> muito úteis, mas exigem cuidado.

### Vetores


### Alocação de memória
Programas precisam estar carregados na memória para serem executados! Isso inclui carregar variáveis, funções e outros blocos de código.

Durante o processo de compilação, a memória necessária para acomodar todos esses pedaços de código é definida, sendo posteriormente colocada na **Memória Stack** (partição da RAM) -> Alocação estática.

Porém, nem tudo pode ter seu espaço de memória definido na compilação. E se, por exemplo, uma função precisar de mais memória para armazenar dados? Como isso será encaixado na memória que já foi "separada" para o programa?

> **Alocar memória significa obter mais memória durante a execução do programa**.

O programa "pede" mais memória para o SO, e, se possível for, a memória lhe é dada.
Contudo, diferentemente da memória definida na compilação, a memória alocada na execução está localizada na **Memória Heap** (outra partição da RAM) -> Alocação Dinâmica.

A linguagem C é conhecida pela sua grande capacidade em manipular memória diretamente. Cabe ao programa (e ao programador) definir como, quando e onde mais memória será utilizada. 
Porém, com grandes poderes vêm grandes responsabilidades! Também é dever do programador identificar e liberar a memória que não estiver sendo mais utilizada.
Memória é um recurso finito, e o nosso programa não é o único que precisa dela. Liberar memória indica para o SO que aquele pedaço está livre para ser usado por outro programa.

Funções para alocação de memória são provenientes da `<stdlib.h>`.
- `malloc` e `calloc` alocam memória dinamicamente.
- `free` libera o espaço de memória alocado.
- `realloc` redimensiona um espaço de memória anteriormente alocado.

##### Calloc
Aloca espaço para `N` elementos, cada um com o tamanho de `X` bytes.

Em caso de sucesso, retorna um ponteiro void para a região alocada. O espaço que foi alocado também é totalmente zerado (agora, todos os bits são 0).

Em caso de erro, retorna um ponteiro NULL.

```c
#include <stdlib.h>

int main(void) {
	int *p = (int*) calloc(1, sizeof(int));
	if (p == NULL) {
		// Falha na alocação
		return(1);
	}

	int *v = (int*) calloc(5, sizeof(int)); // vetor
	if (v == NULL) {
		// Falha na alocação
		return(1);
	}

	// Todos os valores em v são 0
	// v[2] = 0
	
	v[0] = 1;
	v[3] = 15; 

	// Liberar memória
	free(p);
	free(v);

	return(0);
}
```


##### Malloc
Aloca espaço para `N` bytes.

Em caso de sucesso, retorna um ponteiro void para a região alocada. O espaço que foi alocado continua contendo o que havia ali anteriormente!

Em caso de erro, retorna um ponteiro NULL.

```c
#include <stdlib.h>

int main(void) {
	int *p = (int*) malloc(sizeof(int));
	if (p == NULL) {
		// Falha na alocação
		return(1);
	}

	int *v = (int*) malloc(5 * sizeof(int)); // vetor
	if (v == NULL) {
		// Falha na alocação
		return(1);
	}

	// Não se sabe os valores contidos no vetor
	// v[4] = ??
	
	v[0] = 1;
	v[3] = 15; 

	// Liberar memória
	free(p);
	free(v);

	return(0);
}
```


##### Realloc
Realoca um espaço de memória previamente alocado.
A realocação pode ser tanto para mais quanto para menos.

A função aloca uma nova área da memória com o tamanho desejado, copia os items da memória anterior e retorna um ponteiro para a nova posição alocada.

Esse processo é **muito custoso**!

Em caso de sucesso, retorna um ponteiro void para a região alocada. 

Em caso de erro, retorna um ponteiro NULL. O ponteiro que seria realocada é NULL, então, todo o conteúdo que estava naquele pedaço da memória SERÁ PERDIDO! 

```c
#include <stdlib.h>

int main(void) {
	int *v = (int*) malloc(5 * sizeof(int)); // vetor
	if (v == NULL) {
		// Falha na alocação
		return(1);
	}

	v = (int*) realloc(v, sizeof(int) * 10);
	if (v == NULL) {
		// Falha no realloc - TUDO que estava em V foi perdido
		return(1);
	}
	
	v[0] = 1;
	v[9] = 15; 

	// Liberar memória
	free(v);

	return(0);
}
```


##### Free
Responsável por liberar memória alocada.
Na prática, a memória não é "liberada". Ao usar `free`, informamos ao sistema operacional que aquele pedaço que estava alocado agora está livre para uso. 

Caso a função seja usado com um ponteiro NULL, o programa irá encerrar com o erro de "Double free" ou algo assim.

Para não tentar acessar um ponteiro que já foi liberado, é muito comum após aplicar `free` atribuir NULL ao conteúdo do ponteiro -> `*ptr = NULL`;

> SEMPRE USE FREE!!!!


### Strings


### Structs


### Arquivos
A linguagem C oferece uma interface para a manipulação de arquivos via **streams e buffers**.



###  Funções (variádicas)


