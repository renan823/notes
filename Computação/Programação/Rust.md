Talvez o futuro substituto para [[C]] e C++, Rust traz benefícios de linguagens baixo nível sem correr riscos manipulando erroneamente memória. Além disso, conta com uma lib extensa, que permite manipulação de threads, criação de servidores e mais.

O compilador é o `rustc`.

## Código básico

```rust
fn main() {
	println!("Hellow world");
}
```

## Gerenciador de pacotes
O rust usa o cargo para gerenciar projetos.
Todas as dependências, dados de autoria e mais estarão presente no `cargo.toml`.
Por padrão, o cargo vem instalado junto do `rustc`, apresentado alguns comandos:

```bash
cargo new <project_name> --bin
```

```bash
cargo build
```

```bash
cargo run
```

## Variáveis
Em Rust, **as variáveis, por padrão, não são mutáveis.** Ou seja, uma vez definida, já era!

Mas isso não é uma constante? Não!
As constantes aqui são valores imutáveis que seguem um padrão de nomenclatura e **não podem ser definidos em execução, apenas diretamente no código.** Ou seja, uma constante não pode ser resultado de uma soma, ou retorno de função, etc.
Além disso, o tipo da constante **deve** ser especificado.

```rust
const PI: f32 = 13.141569;
const MINHA_CONSTANTE: u32 = 100
```

Porém, uma variável pode se tornar mutável adicionando o prefixo `mut` à ela.

```rust
let x = 10 //imutavel
let mut y = 9 //mutavel
y = y + 10 
```

Ainda é possível "sobrepor" uma variável, o chamado **shadowing.**
Ao fazer shadowing, o nome da variável é reaproveitado e atribuído à outro valor.
Vale ressaltar que, diferentemente de variáveis mutáveis, **o shadowing permite mudar o tipo da variável.**

```rust
let letras = "abcdef"
let letras = letras.len() // 6
```

Rust apresenta tipagem estática, e consegue inferir tipagem com base no valor atribuído à variável (existem exceções).

## Tipos de dados
Rust precisa saber com qual tipo de dados está trabalhando. O compilador consegue identificar alguns casos, outros não.
Para identificar o tipo de uma variável basta adicioná-lo na frente de seu nome:

```rust
let valor: f32 = 10;
```

Os tipos de dados seguem (mais ou menos) o padrão da maioria das linguagens.

#### Dados escalares
Podem ser representados como números.
- int
- float
- char
- bool

Trabalhando com inteiros, é possível especificar o tamanho (bits) e a presença/ausência de sinal. 
O sinal é definido pelo prefixo `i` ou `u` (com e sem sinal, respectivamente).
Os tamanhos podem ser 8, 16, 32 ou 64 bits

Trabalhando com potos flutuantes, é possível especificar o tamanho (bits).
O tamanho pode ser 32 ou 64 bits. (Em processadores modernos a velocidade de processamento entre `f32` e `f64` é muito similar, mas `f64` oferece maior precisão).

-> O rust sempre coloca qualquer float como `f64`! É padrão.

```rust
let a: u8 = 10;
let b: f64 = 12345.972545
```

Booleanos são representados por **true e false.**

Os caracteres também são escalares! 
Valores numéricos são mapeados na **Tabela ASCII**. Mas Rust vai além.
Muito mais que ASCII, Rust suporta caracteres unicode, emojis e até tipografias orientais.

Um char DEVE ser declarado com aspas simples (Strings usam as aspas duplas).
```rust
let c = 'A';
let c: char = 'B';
```


#### Dados compostos
Definem uma "agregação" de valores.
O Rust apresenta duas possibilidades:
- tuplas
- matrizes

Tuplas são declaradas usando parenteses. Admitem tipos variados como conteúdo. (Pode misturar!)
Para acessar os valores, pode-se "desestruturar" a tupla ou usar os índices:
```rust
let tup: (i32, i32, f64) = (354, 982, 2394.98);

//desetruturar
let (x, y, z) = tup;

//indices
let a = tup.0;
```

As matrizes do Rust são bem peculiares. (É sério!)
Diferentemente de vetores*, as matrizes possuem tamanho fixo, sempre com elementos do mesmo tipo.
Uma vez declarada, a matriz NÃO pode ser alterada.
-> matrizes são alocadas na **stack**.

>[!IMPORTANT] Vetores
>Em Rust, um vetor está definido na biblioteca padrão. Uma matriz é diferente de um vetor.

Os casos de uso da matriz podem ser bem específicos, então, se houver dúvida, use vetores.
```rust
let dias_uteis = ["Segunda", "Terça". "Quarta", "Quinta", "Sexta"];
```

Um outro modo de criar vetores é `let vet = [5; 10];`  que criará um vetor de 10 elementos, todos sendo o valor 5. 
## Fluxo
O controle de fluxo ocorre como na maioria das linguagens:
- condicionais (`if `e `else`)
- laços (`loop`, `while` e `for`)

#### If e else
Diferentemente de [[C]] que considera qualquer coisa diferente de 0 como verdadeiro, Rust PRECISA receber um booleano nas comparações.
Aqui, não é necessário envolver a condicional com parênteses (em casos em que a ordem de operações importa talvez seja algo recomendável).

```rust
let idade = 18;

if idade >= 16 {
	println!("Pode votar");
} else {
	println!("Não pode votar");
}
```

A operação `else if` também é permitida.

-> Condicionais podem ser usadas para inicializar uma variável:
```rust
let idade = 18;
let categoria = if idade >= 18 {
	"Adulto"
} else {
	"Jovem"
}
```


#### Repetições (laços)
Os laços em Rust seguem praticamente o mesmo padrão das outras linguagens.

`loop` é algo particular do Rust, que permite executar um `loop` infinito, que só irá parar com "força bruta" -> saindo da aplicação ou usando `break`.

```rust
let mut i = 0;

loop {
	if i > 10 {
		break;
	}
	i++;
}
```


`while` difere do `loop` por apresentar uma condição embutida. Se a condição for falsa, o laço encerra. Caso a condição seja falsa antes mesmo do laço ser iniciado, então o laço é ignorado.

```rust
let mut i = 0;

while i < 10 {
	i++;
}
```


`for` pode ser usado de forma muito concisa para percorrer listas ou um dado intervalo de números (`range`).

-> o `range` pode ser escrito como: `for i in (inicio..fim)`
-> iterar sobre listas é algo como: `for numero in numeros.iter()`
-> é possível usar a ordem reversa, basta adicionar `.rev()` ao fim da expressão

```rust
let items = [1, 2, 3, 4, 5];

for item in items.iter() {
	println!("{}", item);
}
```

```rust
for i in (1..4).rev() {
	println!("{}", i);
}

println!("Acabou o tempo!");
```


## Ownership
Algumas linguagens possuem o Garbage Collector, outras deixam por conta do usuário a liberação de memória. O Rust não usa nada disso!
Ownership é um conjunto de regras que permite o Rust gerenciar memória de um modo muito eficiente (sem coletor de lixo) e ao mesmo tempo muito seguro, evitando erros como *null pointer e double free*.

De modo geral, cada alocação deve ser liberada após seu uso. Isso é comumente realizado em linguagens de baixo nível, mas a responsabilidade é puramente do programador. 
Rust cuida dessa tarefa (potencialmente perigosa, por sinal) eliminando memória ocupada a cada saída de escopo.
Uma variável declarada dentro de um bloco terá sua memória liberada quando o bloco se encerrar. Isso é aplicado em todos os tipos de blocos.

O compilador é o responsável por toda essa tarefa. É simples: **códigos que ferem as regras de ownership não irão compilar!**

```rust
{ //abertura do escopo, memória disponível
	let nome = "Joãozinho";
} //fechamento do escopo, memória liberada
```
A variável *nome* é declarada dentro do bloco, e será invalidada, ou seja, estará indisponível, ao fim do escopo.

O ownership também garante que variáveis não sejam alteradas por [[Ponteiros]] diferentes. 
Por exemplo, ao criar uma variável string `s1` e depois atribuí-la à outra variável `s2`, `s1`  não poderá ser acessada, uma vez que seu conteúdo é apontado por dois ponteiros. O erro ocorre direto na compilação.

```rust
{
	let s1 = String::from("Joãozinho");
	let s2 = s1;
	println!("{s1}");
}
```
O código não será compilado! Uma vez atribuída à outra variável, `s1` não poderá ser usada novamente.
Esse método cria outro ponteiro que aponta para o conteúdo da string, mas não cria uma cópia dele. Mas, se a ideia é criar uma cópia, a função `.clone()` faz o trabalho.

```rust
{
	let s1 = String::from("Joãozinho");
	let s2 = s1.clone();
	println!("{s1}");
}
```

As strings são ótimos exemplos de como funciona a alocação, uma vez que podem aumentar de tamanho durante a execução. Bem, a boa notícia é que não há preocupação alguma em relação a ocupação de memória da string, o Rust cuida disso!
Por serem alocadas na [[Memória Heap]], seus dados são referenciados através dos ponteiros, que fazem todo trabalho por baixo dos panos.

Por outro lado, variáveis com tamanho bem definidos (inteiros, caracteres, etc) não sofrem desse problema durante a alocação, já que são colocados na [[Memória Stack]].  Logo, aqui não há necessidade de trabalhar com ponteiros!


## Bibliotecas
Como em outras linguagens, o Rust também possui suas bibliotecas padrão.

#### std::io
Biblioteca de entrada e saída, permite ler dados do terminal

```rust
use std::io;

fn main() {
	let mut input = String::new();
	
	io::stdin()
		.read_line(&mut input)
		.expect("Erro na leitura!")
}
```


## Crates
São conjuntos de arquivos/funções Rust, que podem ser importadas no projeto e usadas. Qualquer desenvolvedor pode criar suas crates.
Para crates externas, é necessário incluí-las no `cargo.toml` 

```toml
[dependencies]
nome = "versao"
```