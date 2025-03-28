Haskell é uma linguagem puramente funcional! Muito segura, porém sem grandes aplicações (utilidade questionável).

É um excelente modo de praticar conceitos da [[Programação Funcional]].

### Código básico
```haskell
main = putStrLn "Hello world!"
```


### Entrada de dados

A leitura de dados é feita em duas etapas.
Primeiro, a linha é lida e armazenada.
Depois, o valor da linha (string) será convertido para o valor necessário para uso.
O read identifica qual tipo de dado é necessário, inferindo a tipagem.
```haskell
lentrada <- getLine
let entrada = read lentrada
```


### Tipos de dados
Haskell possui `type` e `type class` que garantem um sistema de tipos conciso e seguro.

```haskell
m :: Int
m = 5
```

**`Integer`** -> Representa inteiros. Não tem limite de bytes (a memória é o limite).
**`Int`** -> Representa inteiros. TEM limite de valor máximo e mínimo.
**`Char`** -> Representa um caractere.
**`[X]`** -> Lista do tipo X.  

### Operadores

Sucessor de um valor
```haskell
succ 5 -- 6
```

Máximos e mínimos
```haskell
max 9 10 -- 10
min 100 5 -- 5
```

### Funções
Haskell é bem direto para criar funções!

Funções podem ser compostas por **guardas**, condições booleanas para funções mais complexas.
Os guardas verificam a condição e retornar o valor correto caso True.
Senão, o próximo guarda é verificada.
Caso nenhum guarda seja ativado, o retorno padrão é ativa.
Funções podem ter if e else ou então outro statement.

Valores que não são usados, não são calculados!

> Funções de alta ordem são aquelas que recebem outra função como argumento

Parâmetros podem ser omitidos usando `_` em sua posição na função.

```haskell
f :: Integer -> Integer
f x = x + x
```

```haskell
sinal :: Integer -> Integer
sinal x
	| x < 0 = -1
	| x == 0 = 0
	| otherwise = 1
```

```haskell
absoluto :: Integer -> Integer
absoluto x
	| x < 0 = -x
	| otherwise = x
```


### Currying
Modelo definido por Haskell Curry (dá nome à linguagem).
Implica em funções que recebem apenas um argumento, e retorna apenas um argumento, nada mais, nada menos.

```haskell
adiciona :: Integer -> Integer -> Integer
adiciona x = \x -> (\y -> x + y)
adiciona' x y = x + y 
```



### Listas
```haskell
lista = [2, 4, 5, 10]
```

Unindo listas (usa duas listas)
```haskell
[1, 2, 3, 4] ++ [5, 6, 7, 8] -- [1, 2, 3, 4, 5, 6, 7, 8]
```

```haskell
['h', 'e'] ++ ['l', 'l', 'o'] -- "hello"
```

Adicionando items (usa um item e uma lista)
```haskell
1:[2, 3, 4, 5] -- [1, 2, 3, 4, 5]
```

```haskell
'H':"ELLO" -- "HELLO"
```

Pegar o primeiro elemento
```haskell
head [1, 2, 3, 4] -- 1
```

Pegar o último elemento
```haskell
last [1, 2, 3, 4] -- 4
```

Pegar o início (todos, menos o último)
```haskell
init [1, 2, 3, 4] -- [1, 2, 3]
```

Pegar o final (todos, menos o primeiro)
```haskell
tail [1, 2, 3, 4] -- [2, 3, 4]
```

Tamanho da lista
```haskell
length [1, 2, 3] -- 3
```

Lista vazia
```haskell
null [] -- True
```

Inverter a lista
```haskell
reverse [4, 3, 2, 1] -- [1, 2, 3, 4]
```

Pegar os N primeiros elementos da lista
```haskell
take 2 [1, 2, 3, 4] -- [1, 2]
take 0 [1, 2, 3, 4] -- []
take 50 [1, 2, 3, 4] -- [1, 2, 3, 4]
```

Remover os N primeiros elementos da lista
```haskell
drop 3 [1, 2, 3, 4] -- [4]
```

Encontrar maior e menor elemento:
```haskell
maximum [1, 2, 3, 4] -- 4
minimum [1, 2, 3, 4] -- 1
```

Somar e multiplicar items:
```haskell
sum [1, 2, 3, 4] -- 10
product [1, 2, 3, 4] -- 24
```

