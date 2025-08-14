Linguagem compilada, criada pelo Google, que possui um grande foco em APIs e sistemas distribuídos ([[Microsserviços]]).

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

O projeto GO conta com o arquivo de configurações e de dependências (`go.mod` e `go.sum`, respectivamente).

Dependências também seguem o padrão de nomenclatura dos módulos, e devem ser instaladas para serem usadas no projeto.
As dependências não estão "embutidas" como uma pasta/arquivo no projeto, o que torna sua pasta "leve" - diferentemente do Node ([[Typescript]]), que inclui os milhares de módulos **dentro** do projeto. 

> Seus módulos podem vir a se tornar módulos para a comunidade!

Pacotes são utilizados para organizar seu código, agrupando funções e estruturas que possuem alguma relação.

Usualmente, um pacote é definido criando uma nova pasta no projeto, com o nome correspondente ao pacote (o nome da pasta não precisa, necessariamente, ser igual ao do pacote, **mas é boa prática**).

```go
package main

import "fmt"

func main() {
	fmt.Println("Hello!")
}
```

Go controla o encapsulamento, ou seja, quem pode ver funções, variáveis, etc; por meio da nomenclatura:
- Iniciado por minúscula: acessado apenas no pacote que foi declarado;
- Iniciado por maiúscula: acessado de qualquer parte, referenciado pelo pacote.

```go
package server

import "fmt"

const port = ":8080" // Visível apenas no pacote "server"

// Visível fora do pacote
func InitServer() {
	fmt.Printf("Servidor rodando na porta %v!\n", port)
}

```

```go
package main

import "projeto/server"

func main() {
	server.InitServer()
}
```

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

> O compilador Go não permite que um código seja compilado quando existem variáveis inutilizadas dentro do código -> remova-as!

Constantes podem ser declaradas usando `const nome = valor`. 
O tipo da constante pode ser omitido.

### Tipos de dados
Go apresenta tipos de dados básicos:
- Inteiro: `int int8 int16 int32 int64`
- Float: `float32 float64`
- Complexo: `complex64 complex128`
- Boolean: `bool`
- String: `string`
- Rune (similar ao **char**): `rune -> int32`
- Byte: `byte -> int8`

>Nota: Embora `rune` seja similar ao conhecido `char`, runas podem armazenar muito mais caracteres do que os definidos na tabela ASCII. Isso inclui letras "diferentes", Kanjis, etc.

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

### Condicionais
Go permite controlar operações condicionais utilizando `if-else` e também `switch-case`.

```go
func main() {
	idade := 19

	if idade >= 18 {
		fmt.Println("Pode dirigir")
	} else {
		fmt.Println("Não pode dirigir")
	}
}
```
O operador `if-else` segue os padrões da maioria das linguagens.
Também é possível utilizar `else if`.

```go
func main() {
	name := "Jorge"

	switch name {
		case "Jorge":
			fmt.Println("Jorge estava aqui!")
		case "Ana":
			fmt.Println("Ana veio!")
		default:
			fmt.Println("Ninguém veio!")
	}
}
```
O operador `break`, comum na maioria das linguagens, não é necessário aqui.

```go
func main() {
	name := "Jorge"

	switch name {
		case "Jorge", "Ana":
			fmt.Println("Algum professor veio")
		case "Carol", "Pedro":
			fmt.Println("Algum aluno veio")
		default:
			fmt.Println("Ninguém veio!")
	}
}
```
É possível fazer uma condição compostas, seguindo o operador `or`.

```go
func main() {
	name := "Jorge"

	switch name {
		case "Jorge":
			fmt.Println("Jorge estava aqui!")
			fallthrough
		case "Ana":
			fmt.Println("Ana veio!")
		default:
			fmt.Println("Ninguém veio!")
	}

	// Exibe:
	// Jorge estava aqui!
	// Ana veio!
}
```
O operador `fallthrough` permite que a próxima condição após o `case` correto seja executada também.

### Repetição
Em Go, a única estrutura de loops é o `for`.

```go
for i := 0; i < 10; i++ {
	fmt.Println(i)
}
```
Loop tradicional, com acumulador, condição de parada e incremento/decremento.

```go
for i := range 10 {
	fmt.Println(i)
} 
```
Mesmo loop, mas utilizando o operador `range`. Aqui, o acumulador é inicializado com o valor padrão 0.

```go
for item, _ := range items {
	fmt.Println(item)
}
```
Também é possível usar o `range` para iterar sobre listas, retornando o item atual e o índice atual.

-> É possível ignorar um dos parâmetros retornados usando `_`.

> É importante ressaltar que, ao percorrer um vetor usando esse método, os items retornados são cópias daqueles no vetor. 
> Isso faz com que, ao alterar algum dado no item, a mudança **não** seja refletida no vetor.

### Funções
Em Go, funções têm a estrutura: `func (receiver) nome(params...) (...returns)`

- Receiver: Utilizado para "atarraxar" uma função à uma estrutura (ver **estruturas**)
- Params: Parâmetros da função, com nome e tipo. Funções podem receber parâmetros variádicos, que sempre serão do mesmo tipo e no fim da lista de parâmetros.
- Returns: Uma função não precisa retornar nada. Caso haja retorno, especifique o tipo. Caso mais de um valor seja retornado, especifique cada um dos tipos de retorno, dentro de parênteses.

```go
func hello() {
	fmt.Println("Hello")
}
```
Função sem parâmetros e sem retorno.

```go
func sum2(x, y int) int {
	return x + y
}
```
Função com parâmetros e um retorno.

```go
func sum(nums ...int) (int, int) {
	total := 0

	for _, num range := nums {
		total += num
	}

	return len(nums), total
}

func main() {
	count, total := sum(1, 2, 3, 4, 5)
}
```
Função com parâmetros variádicos e dois retornos.

> Funções são valores também! É possível passar funções como parâmetros para outras funções -> **callbacks**.

### Defer
O operador `defer` indica para o Go executar uma função logo antes de encerrar a função em que está contido.

```go
func main() {
	defer ftm.Println("Tchuss")
	fmt.Println("Opa")
	fmt.Println("Hallo!")
}
// Exibe:
// Opa
// Hallo!
// Tchuss
```

É muito utilizado para executar funções de fechar arquivos (entre outros) após o uso.

### Erros
Go lida com erros de um modo diferente da maioria das linguagens.

>Geralmente, quando um erro estoura, os programas usam estruturas de `try-cacth`, ou enviam e acumulam esse erro em chamadas superiores de função. 
  Caso o erro não seja devidamente tratado, podem ocorrer interrupções no programa todo.

Em Go, erros não são "disparados" ou "lançados" ao sistema.
Aqui, **erros são valores, assim como qualquer outra variável**.

O erro em Go é do tipo `error`, que precisa ter, obrigatoriamente, o método `erro.Error()` que retorna a mensagem contida no erro.

É totalmente possível (e muito útil!) criar estruturas e tipos customizados para representar um erro, desde que o método `.Error()` seja implementado (ver **interfaces**).

Por padrão, quando não há erro, o valor retornado é `nil`.

Também é possível criar um erro com mensagem customizada, usando o pacote `errors` com `errors.New("meu erro")`

> Mensagens de erro devem ser em letras minúsculas.

```go
package dataset

import (
	"errors"
	
	"projeto/database"
)

func CountData() (int64, error) {
	total, err := database.Process()
	if err != nil {
		return -1, errors.New("failed to count") // Ou retorna err direto
	}
	
	// Poderia ter retornado diretamente database.Process() !
	return total, nil
}
```
Executa uma função que pode retornar erro e verifica a validade do retorno.

> É muito importante tratar casos com `err != nil` para um bom funcionamento do projeto.

```go
package main

import (
	"fmt"
	
	"projeto/dataset"
)

func main() {
	total, err := dataset.CountData()
	if err != nil {
		panic(err.Error())
	}
	
	fmt.Printf("Total de dados: %v\n", total)
}
```
Para realmente parar o programa quando algo deu errado, é possível usar `panic`.

### Vetores
Go permite manipular vetores de forma prática, com tamanhos fixos e variáveis.

```go
func main() {
	var vec [10]int

	// Acesso
	vec[0] = 210
}
```
Arrays devem possuir tamanho fixo, definido em sua inicialização.

```go
func main() {
	var vec [10]int{}

	// Acesso
	vec[0] = 345
}
```
Slices são arrays flexíveis, que podem ser redimensionados conforme necessário.

```go
func main() {
	vec := make(int, 0, 10)
	// make recebe tipagem, tamanho atual e capacidade
}
```
Slices podem ser inicializadas usando o operador `make`. 

```go
func main() {
	vec := make(int, 0, 10)

	vec = append(vec, 1235)
}
```
Para adicionar um novo item ao vetor basta usar o `append`.

### Mapas
Go possui, de forma nativa, as conhecidas e úteis [[Tabelas Hash]].
Para definir um mapa, é necessário especificar o tipo da chave e do valor.
A chave deve ser um valor comparável (é um tipo de valor do Go).

```go
func main() {
	var grades map[string]float32

	// Mapas também podem ser inicializados usando make
	// grades := make(map[string]float32)

	grades["Pedro"] = 9.5
	grades["Henrique"] = 10
	grades["Luisa"] = 10
	grades["Lucas"] = 1.6
}
```
Métodos para inicializar um mapa vazio e adicionar elementos.

```go
func main() {
	// Outro método para inicializar (já com valores)
	grades := map[string]float32{
		"Pedro": 10,
		"Luisa": 10,
		"Lucas": 9.5,
	}
	
	// Remover elemento
	delete(grades, "Pedro")

	// Verificar se existe
	grade, ok := grades["Pedro"]
	if !ok {
		fmt.Println("Não encontrado!")
	} else {
		fmt.Prinln(grade)
	}
}
```
Funções úteis em um mapa: adicionar, remover, percorrer, etc.

### Ponteiros
Ponteiros permitem manipular dados sem copiá-los, útil quando estruturas grandes precisam ser manipuladas por várias funções.

A diferença de um ponteiro para uma variável "comum" é que ponteiros armazenam o endereço de outra variável.
O nome é bem sugestivo, uma vez que, na memória, o ponteiro "aponta" para o endereço de memória da variável alvo.

```go
func operation(x *int) {
	*x = x + 10
}

func main() {
	x := 10
	ptr := &x
	
	// Acesso via referência
	operation(ptr) // ou operation(&x)
}
```

Podemos, então, usar o ponteiro para acessar a variável que ele aponta! 
Para fazer isso, precisamos **derreferenciá-lo** -> Usamos o mesmo operador `*` antes do ponteiro. Desse modo, estaremos lendo o valor que está na variável apontada pelo ponteiro.

**Operações com ponteiros:**
- Referenciar: `ptr = &variavel`
- Derreferenciar: `variavel = *ptr`
- Atribuir valor à variável apontada: `*ptr = valor`

### Estruturas e Interfaces
Go permite a criação das conhecidas `structs`, que permitem agrupar e modelar dados de um determinado problema.

Como Go **não segue o paradigma orientado à objetos**, não existem classes.
É possível, entretanto, "atarraxar" funções em uma struct, criando um método daquela struct.

```go
type Vec2 struct {
	X float32
	Y float32
	// Poderia ser declarado:
	// X, Y float32
}
```
Declaração de um `struct` para um vetor 2d. 

Vale mencionar a nomenclatura iniciada por maiúsculo, que permite acessar essa estrutura (e seus campos) fora do pacote.
Campos com nome iniciado em minúsculo não podem ser acessado fora do pacote!

```go
type Vec2 struct {
	X float32
	Y float32
}

func main() {
	vec := Vec2{1, 3}
	
	// Poderia ser cirado:
	// vec := Vec2{X: 1, Y: 3}

	fmt.Println(vec.X)
}
```
Métodos para inicializar uma struct e acessar seus valores.

```go
func NewVec2(x, y float32) *Vec2 {
	return &Vec2{x, y}
}
```
É comum a criação de uma função para inicializar as estruturas, como um construtor.
Nesse caso, o retorno por ponteiro é opcional.

```go
type Vec2 struct {
	X float32
	Y float32
}

// Cria um novo vetor
func NewVec2(x, y float32) *Vec2 {
	return &Vec2{x, y}
}

// Soma dois vetores
func (vec *Vec2) Sum(v2 *Vec2) *Vec2 {
	return NewVec2(vec.X + v2.X, vec.Y + v2.Y)
}

// Multiplica por escalar
// Esse método altera os dados do vec (inplace)
func (vec *Vec2) Mult(scalar float32) {
	vec.X *= scalar
	vec.Y *= scalar
}
```
Criando métodos para a struct vetor.

Ao criar o método com o receber `(*Vec2)`, indicamos que os dados serão acessados via ponteiro, e não como cópia!
Caso o método não fosse por ponteiros, a operação realizada nos campos do vetor seriam realizadas apenas na cópia.

> É importante não misturar os tipos de acesso na struct: ou acesso via ponteiros (`*Vec2`) ou acesso via valor (`Vec2`)

As **interfaces** em Go permitem declarar métodos para serem implementados por structs.
Isso permite criar código limpo e de fácil manutenção, removendo a responsabilidade da interface de "entender" como aquele método é implementado.

> A interface é apenas a porta de comunicação, que não se interessa pela implementação dos seus métodos (cada struct pode implementar de modo diferente)!

```go
// Interface para processar uma imagem
type ImageProcessor interface {
	Process(filepath string) error
}

// Processar imagem: adicionar marca d'água
type WatermarkProcessor struct {}

// Cria um novo image processor
func NewWatermarkProcessor() *ImageProcessor {
	return &WatermarkProcessor{}
}

// Implementa a função "process" para watermark
func (p *WatermarkProcessor) Process(filepath string) error {
	...
}
```
Para implementar uma interface, basta que a struct tenha todos os métodos definidos nela.

A struct que implementa a interface pode ser usada como o tipo da interface.
Várias structs podem implementar a mesma interfaces (muito utilizado)!

### Genéricos
Go adicionou recentemente o suporte para tipagens genéricas.

```go
type Node[T any] struct {
	val T
	next *Node[T]
}

type LinkedQueue[T any] struct {
	root *Node[T]
	size int
}
```
Definição de uma fila encadeada com tipagem genérica.

Também é possível definir que a tipagem genérica siga alguns pressupostos, como ser comparável, ser numérica, etc.

### Concorrência
Go torna extremamente fácil lidar com código concorrente, por ser a primeira linguagem criada com multiprocessamento em mente.

> É importante destacar a **diferença de concorrência e paralelismo**: 
> Algo concorrente executa várias tarefas, mas não ao mesmo tempo. Faça um pedaço da tarefa A, troque para a B, volte para a A, etc. 
> Algo paralelo executa tarefas simultaneamente. Faça a tarefa A e B ao mesmo tempo.

A concorrência é um modo de organizar o código.
A concorrência não depende do computador possuir 1 ou 100 núcleos de processamento.
Caso existam núcleos para processamento, o código concorrente será executado em paralelo!

Para criar código concorrente, Go utiliza as **goroutines**, também chamadas de *lightweight threads.*

Goroutines são muito leves comparadas às [[Threads]] do SO:
- Thread (processo) gerenciado pelo SO: `2Mb / thread` 
- Goroutine: `2Kb / goroutine`

-> Para executar uma função de modo concorrente, usa-se o operador `go`.

```go
func Sum(x, y, int) {
	fmt.Println(x + y)
}

func main() {
	go Sum(1, 2)
	go Sum(4, 500)
	go Sum(10, 234)
	go Sum (-1, 343)
}
```
Ao executar múltiplas operações concorrentes, não é possível determinar qual será a ordem de execução!

---

Para transportar dados entre rotinas, é necessários usar **canais** (channels).
Canais devem ser criados com tipagem, e também podem receber capacidade máxima (buffering). 

> Em canais com buffering, deve-se assegurar que o limite não seja ultrapassado (o que gerará um erro se ocorrer).

Canais usam setas para indicar o fluxo de dados.

```go
func sum(v []int, c chan int) {
	sum := 0
	for _, v := range s {
		sum += v
	}
	
	c <- sum // Coloca o valor no canal
}

func main() {
	vec := []int{1, 2, 3, 4, 5, 6}
	c := make(chan int)

	go sum(vec[:len(vec)/2], c)
	go sum(vec[len(vec)/2:], c)

	// Receber o valor do canal
	x, y := <-c, <-c

	fmt.Println(x + y)
}
```
Exemplo de soma usando duas goroutines.
O vetor é dividido entre as rotinas e os resultados são somados.

```go
func fibonacci(n int, c chan int) {
	x, y := 0, 1
	for i := 0; i < n; i++ {
		c <- x
		x, y = y, x+y
	}
	
	close(c) // Fecha o canal: indica que acabou o fluxo
}

func main() {
	c := make(chan int, 10)

	// Executa o fibonacci como goroutine
	go fibonacci(cap(c), c)
	
	for i := range c {
		fmt.Println(i)
	}
}
```
Também é possível percorrer um canal, recebendo os valores ali contidos.

Fechar um canal também é uma tarefa possível, mas não usual. O canal deve ser sempre fechado por quem coloca os dados nele, nunca por quem recebe!

Para selecionar resultados de um canal, usa-se o operador `select`.
Esse operador permite que uma goroutine escute vários canais, e espere até que possa executar alguma ação vinda deles.

-> `select` trava a rotina que está executando-o.

```go
func main() {
    c1 := make(chan string)
    c2 := make(chan string)

    go func() {
        time.Sleep(1 * time.Second)
        c1 <- "one"
    }()
    
    go func() {
        time.Sleep(2 * time.Second)
        c2 <- "two"
    }()

    for range 2 {
        select {
        case msg1 := <-c1:
            fmt.Println("received", msg1)
        case msg2 := <-c2:
            fmt.Println("received", msg2)
        }
    }
}

```
Nesse caso, a rotina principal aguarda até receber duas mensagens: a do canal 1 e do canal 2. Em muitos casos é comum esperar até que o canal esteja fechado.

---

Caso seja necessário aguardar o término de processos concorrentes para dar continuidade ao código, é necessário **sincronizar** as operações.

Go disponibiliza os `sync.WaitGroup`, que devem ser iniciados antes do processo concorrente, para controlar quantos processos concorrentes estão rodando.

Cada processo é responsável por se "cadastrar" e também por se "encerrar", indicando ao `WaitGroup` quantos ainda restam.

```go
func Sum(wg *sync.WaitGroup, x, y, int) {
	defer wg.Done()
	fmt.Println(x + y)
}

func main() {
	var wg sync.WaitGroup

	wg.Add(4)

	go Sum(&wg, 1, 2)
	go Sum(&wg, 4, 500)
	go Sum(&wg, 10, 234)
	go Sum (&wg, -1, 343)

	wg.Wait()

	// Outro código aqui...
}
```
Executa as 4 rotinas e espera que todas terminem para executar as próximas etapas.
Usa o `defer` para indicar que aquela função foi concluída (executa logo antes de encerrar).

---

Lidar com código concorrente (e / ou paralelo) pode gerar problemas quando variáveis são compartilhadas entre rotinas, gerando as conhecidas **condições de corrida (race conditions).**

Uma condição de corrida ocorre quando duas ou mais rotinas tentam acessar uma variável ao mesmo tempo.

Para impedir isso é necessário utilizar uma trava -> **mutex**.

```go
type Container struct {
    mu       sync.Mutex
    counters map[string]int
}

func (c *Container) inc(name string) {
    c.mu.Lock()
    defer c.mu.Unlock()
    c.counters[name]++
}

func increment(wg *sync.WaitGroup, c *Container, name string, n int) {
	defer wg.Done()
	
	for range n {
        c.inc(name)
    }
}

func main() {
    c := Container{
        counters: map[string]int{"a": 0, "b": 0},
    }

    var wg sync.WaitGroup

    wg.Add(3)
    go increment(&wg, &c, "a", 10000)
    go increment(&wg, &c, "a", 10000)
    go increment(&wg, &c, "b", 10000)

    wg.Wait()
    fmt.Println(c.counters)
}
```
Para realizar a adição do valor (que é compartilhado entre rotinas) é necessário aplicar a trava no momento da adição - `lock`. 
Assim, qualquer outra rotina que também tente acessar o valor, deverá esperar numa fila para poder alterá-lo após o `unlock`.

---

Para lidar com concorrência é muito comum definir um grupo de trabalhadores (workers), que serão executados de forma concorrente para realizar uma tarefa.
Para controlar os workers, geralmente há um função principal que divide os trabalhos, envia os dados e coleta os resultados / erros do processamento.

Também utilizado um modelo de **fan-in / fan-out**:
- Fan in: Várias rotinas enviam dados para um canal.
- Fan out: Várias rotinas coletam dados de um canal.
