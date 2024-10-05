Talvez o futuro substituto para [[C]] e C++, Rust traz benefícios de linguagens baixo nível sem correr riscos manipulando erroneamente memória. Além disso, conta com uma lib extensa, que permite manipulação de threads, criação de servidores e mais.

O compilador é o rustc.

## Código básico

```rust
fn main() {
	println!("Hellow world");
}
```

## Gerenciador de pacotes
O rust usa o cargo para gerenciar projetos.
Todas as dependências, dados de autoria e mais estarão presente no "cargo.toml".
Por padrão, o cargo vem instalado junto do rustc, apresentado alguns comandos:

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
Em Rust, as variáveis por padrão não são mutáveis. Ou seja, uma vez definida, já era!

Mas isso não é uma constante? Não!
As constantes aqui são valores imutáveis que seguem um padrão de nomenclatura e **não podem ser definidos em execução, apenas diretamente no código.** Ou seja, uma constante não pode ser resultado de uma soma, ou retorno de função, etc.
Além disso, o tipo da constante **deve** ser especificado.

```rust
const PI: f32 = 13.141569;
const MINHA_CONSTANTE: u32 = 100
```

Porém, uma variável pode se tornar mutável adicionando o prefixo "mut" à ela.

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
O sinal é definido pelo prefixo "i" ou "u" (com e sem sinal, respectivamente).
Os tamanhos podem ser 8, 16, 32 ou 64 bits

Trabalhando com potos flutuantes, é possível especificar o tamanho (bits).
O tamanho pode ser 32 ou 64 bits. (Em processadores modernos a velocidade de processamento entre f32 e f64 é muito similar, mas f64 oferece maior precisão).

-> O rust sempre coloca qualquer float como f64! É padrão.

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
O Rust apresenta duas possibiliades:
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

>[!tip] Vetores
>Em Rust, um vetor está definido na biblioteca padrão. Uma matriz é diferente de um vetor.

Os casos de uso da matriz podem ser bem específicos, então, se houver dúvida, use vetores.
```rust
let dias_uteis = ["Segunda", "Terça". "Quarta", "Quinta", "Sexta"];
```


## Fluxo
O controle de fluxo ocorre como na maioria das linguagens:
- condicionais (if e else)
- laços (loop, while e for)

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

A operação "else if" também é permitida.

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

"loop" é algo particular do Rust, que permite executar um loop infinito, que só irá parar com "força bruta" -> saindo da aplicação ou usando "break".

```rust
let mut i = 0;

loop {
	if i > 10 {
		break;
	}
	i++;
}
```


"while" difere do loop por apresentar uma condição embutida. Se a condição for falsa, o loop encerra. Caso a condição seja falsa antes mesmo do loop ser iniciado, então o loop é "ignorado"

```rust
let mut i = 0;

while i < 10 {
	i++;
}
```


"for" pode ser usado de forma muito concisa para percorrer listas ou um dado intervalo de números (range).

-> o range pode ser escrito como: **for i in (inicio..fim)**
-> iterar sobre listas é algo como: **for numero in numeros.iter()**
-> é possível usar a ordem reversa, basta adicionar **.rev()** ao fim da expressão

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