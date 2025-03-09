É uma alternativa ao [[C]], também muito eficiente, mas com mais funcionalidades!
C++ adiciona [[Orientação Objetos]].

A linguagem possui MUITAS bibliotecas, e também conta com comunidade ativa. É usada principalmente em microcontroladores e jogos.

### Documentação
- https://www.learncpp.com
- https://www.cplusplus.com/doc/tutorial


### Código básico
```cpp
#include <iostream>

int main(int argc, char *argv[]) {
	std::cout << "Hello world" << std::endl;
	return 0;
}
```

- `#include <iostream>` inclui a biblioteca padrão de entrada/saída
- A função `main` é necessária em todo programa, retornando sempre um `int`
- `std::cout` importa do **namespace** `std` a saída padrão `cout`
- O operador `<<` "joga" o conteúdo para a stream de saída

### Biblioteca padrão
Possui um conjunto de funções, algoritmos e estruturas de dados genéricas.
- Vetores, Maps, sets
- Sort, Max/Min
- Streams, Files

### Namespaces
São definições de códigos que encapsulam código.
Para definir um namespace, devemos usar a declarativa `namespace`, acompanhado do nome e dos items que está encapsulando.

```cpp
namespace test { int age = 18; }
```


### Cabeçalhos
Fornecem declarações para funções.
As implementações para as funções definidas serão deitas em outro arquivo.
Arquivos de cabeçalho são `.h`

### Tipos de dados
- int -> Armazena inteiros
- char -> Armazena caracteres
- bool -> Armazena verdadeiro/falso
- float -> Armazena números reais
- double -> Armazena números reais com mais precisão

### Operadores
Além de operadores padrão, o C++ permite a definição do comportamento dos operadores para certos tipos de dados, como classes.
Basicamente, a funcionalidade daquele operador é redefinida para um uso específico.

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

### Funções
São blocos reutilizáveis de código que executam uma tarefa, podendo receber e devolver valores.

Definição: `tipo_retorno nome(tipo variavel1, tipo variavel2)`

Por seguir padrões OO, funções de mesmo nome com argumentos diferentes são permitidas (e muito úteis)!

```cpp
int soma(int x, int y) {
	return x + y;
}
```

```cpp
int soma(int x, int y) {
	return x + y;
}

int soma(int x, int y, int z) {
	return x + y + z;
}
```

### Classes
São abstrações que facilitam a representação do mundo real em código.
Classes possuem atributos e métodos.
Objetos são instâncias de classes.

Para declarar um classe, é necessário criar o arquivo de cabeçalho e a implementação.

```cpp
class Point {
	int _x;
	int _y;
	public:
		Point(int x, int y);
		int getX();
		int getY();
}
```
Arquivo `point.h`, que declara a classe, mas sem sua implementação. Por padrão, tudo dentro da classe é **privado**, ou seja, inacessível fora dela. Para tornar coisas (variáveis, funções) publicas, basta utilizar a definição `public`.

```cpp
Point::Point(int x, int y) {
	_x = x;
	_y = y;
}
```
Exemplo de implementação para o construtor.
Esse método, entretanto, é ineficiente, uma vez que os valores serão preenchidos com valor padrão (nesse caso 0) e posteriormente sobrescritos com o valor dado.

```cpp
Point::Point(int x, int y)
	: _x(x)
	, _y(y)
{ }
```
Este método de construtor é chamado de `member initializer lists`, sendo mais direto e eficiente que o construtor comum.

### Estruturas de dados
A biblioteca padrão contém algumas estruturas genéricas que facilitam a criação de código.

- `std::Vector<T>` é um vetor de items do tipo genérico `T` (o tipo precisa ter construtor)
- `std::Set<T>` é um set de items do tipo genérico `T` (o tipo precisa ter construtor)
- `std::Map<K, V>` é um map de chaves `K` e items `V` (ambos precisam de construtor)

