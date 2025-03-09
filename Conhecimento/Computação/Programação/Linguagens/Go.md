Linguagem compilada, criada pelo google, que possui um grande foco em APIs e sistemas distribuídos ([[Microsserviços]]).

Go consegue ser mais eficiente que linguagens interpretadas no quesito execução, e mais performática na compilação que a maioria das linguagens compiladas (mas ainda perde para [[Rust]]).

### Código base
```go
package main

import "fmt"

func main() {
	fmt.Println("Hello world")
}
```


### Módulos e pacotes
Go se orienta por uma arquitetura de pacotes. Existem funções e variáveis que só poderão ser acessadas em nível local, outras em nível de pacote.

Para criar um projeto Go, é necessário iniciar um módulo. O nome do módulo é, usualmente, o link para o repositório do projeto no github.

```sh
go mod init github.com/renan823/projeto-go
```

O projeto GO conta com o arquivo de configurações e de dependências (go.mod e go.sum, respectivamente).

Dependências também seguem o padrão de nomenclatura dos módulos, e devem ser instaladas para serem usadas no projeto.
As dependências não estão "embutidas" como uma pasta/arquivo no projeto, o que torna sua pasta "leve" - diferentemente do Node ([[Typescript]]), que inclui os milhares de módulos **dentro** do projeto. 

> Seus módulos podem vir a se tornar módulos para a comunidade!



### Variáveis
Go permite declarações de variáveis de várias formas: com tipo, sem tipo, com valor, sem valor, etc.

O operador usual para inicializar uma variável (usando inferência de tipos) é o `:=`, **apelidado carinhosamente de Gopher**.

```go
func main() {
	x := 10
	y := 20
	z := x + 1
}
```

Existem casos em que um valor não é atribuído diretamente na inicialização, e então a variável fica "vazia". Nesses casos, é necessário indicar qual o tipo de dado que a variável espera. Casos em que o valor inicial é nulo (`nil`) também exigem indicação explicita do tipo.

```go
func main() {
	var x int
	var ptr *int := nil
}
```

O operador `:=` não é válido em escopo global! (NÃO USE COISAS GLOBAIS!!!!)

> O compilador go não permite que um código seja compilado quando existem variáveis inutilizadas dentro do código -> remova-as!


### Tipos de dados
Go apresenta tipos de dados básicos:
- Inteiro: `int int8 int16 int32 int64`
- Float: `float32 float64`
- Complexo: `complex64 complex128`
- Boolean: `bool`
- String: `string`
- Rune (similar ao **char**): `rune -> int32`
- Byte: `byte -> int8`

Caso uma variável seja declarada, sem valor inicial, o compilador atribui o "zero", que pode ser 0, 0.0, false, ou uma string vazia para os casos de cada tipo.

Go exige conversão de dados para operá-los como iguais
```go
func main() {
	x := 1 //int
	y := 2.5 //float32
	z := float32(x) + y
}
```

Constantes também são permitidas. Elas devem ser, obviamente, inicializadas.
```go
const PI = 3.1415

func main() {
	m := PI * 5
}
```

### Funções
Em go, funções têm a estrutura: `func (receiver) nome(params...) (...returns)`

- Receiver: Utilizado para "atarraxar" uma função à uma interface...
- Params: Parâmetros da função, com nome e tipo. Funções podem receber parâmetros variádicos, que sempre serão do mesmo tipo e no fim da lista de parâmetros.
- Returns: Uma função não precisa retornar nada. Caso haja retorno, especifique o tipo. Caso mais de um valor seja retornado, especifique cada um dos tipos de retorno, dentro de parênteses.

```go
func hello() {
	fmt.Println("Hello")
}
```

```go
func sum2(x int, y int) int {
	return x + y
}
```

```go
func sum(nums ...int) (int, int) {
	total := 0

	for _, num range := nums {
		total += num
	}

	return len(nums), total
}

func main() {
	count, total := sum(1, 2, 3, 4, 5) //and so on
}
```


### Repetição


### Condições


### Ponteiros


