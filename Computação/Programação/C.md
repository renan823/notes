- Linguagem de médio nível
- Diferencia-se do C++ por não possuir objetos 

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
		return;
	}
	printf("Deu certo!\n");
}
```

### Ponteiros


### Vetores


### Alocação de memória


###  Funções (variádicas)
