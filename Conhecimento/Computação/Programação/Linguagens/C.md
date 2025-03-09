- Linguagem de médio nível
- Diferencia-se do [[C++]] por não possuir objetos 

### Código básico
```c
#include <stdio.h>

int main () {
	printf("hello world\n");
	return 0;
}
```

- "#include <stdio.h>" adiciona funcionalidade input e output (I/O)
- A função main deve retornar 0 (zero), indicando que o programa executou corretamente
- Em caso de erros, o retorno do main é 1 (um)
- Ao rodar o programa, é gerado um executável

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

Nota: "%c" também pode ser usado para escrever ASCII, basta passar o número correto

Para saídas numéricas formatadas com precisão, usa-se o mesmo formatador do float, mas indicando a precisão:
```c
float money = 7.75654

printf("%f", money); // 7.75654
printf("%.1f", money); // 7.7
printf("%.3f", money"); // 7.756
```

É possível, também, converter dados, tanto manualmente (adicionar o tipo entre parenteses) como automaticamente (o programa realiza a conversão)

### Constantes
- Ao declarar uma constante, usa-se "const"
- Boas práticas sugerem nomear a constante em caixa alta 

### Boolean
O tipo boolean não é nativo, então deve ser importado na biblioteca "<stdbool.h>".
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
- 

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



###  Funções (variádicas)
