A matemática discreta, em geral, apresenta métodos de contar items, chances de algo acontecer, etc. Todas as contagens são apresentadas de uma forma mais matemática.

> "Nós já sabemos contar a maioria dos casos, só vamos aprender a fazer isso de uma forma mais bonitinha." Aurichi, Leandro.

### Análise Combinatória
Podendo envolver cartas, jogos de azar (megassena) e até cassinos, a análise combinatória permite dizer o número de ocorrências de certos casos. 

Por exemplo: Um placa de carro é formada por 7 dígitos -> 4 letras e 3 números.
Qual o número de combinações possíveis (placas diferentes)? 

Pensando como "caixinhas":
## [26].[26].[26].[26].[10].[10].[10]

Montar a placa envolve combinar todas as possibilidades de números e letras.
- Letras podem ser repetidas (alfabeto 26 letras)
- Números podem ser repetidos (0-9)
Assim, obtemos algo como: $26⁴ \cdot 10³$ possibilidades diferentes.

>[!tip] O método das caixinhas é realmente útil!


### Princípio Fundamental da Contagem
Utiliza da multiplicação de $k$ fatores.
Os fatores podem ser todos iguais, o que ocasionaria em $k^{n}$ para $n$ elementos.
Os fatores podem ser diferentes, e a regra de variação depende de cada caso.
$$T = k_1 \cdot k_2 \cdot k_3 \cdot k_4 \dots k_n$$

### Permutação Simples
Casos de trocas em que a ordem importa, e cada caso é contado.
$$P_n = n!$$

### Permutação com Repetição
O caso base não engloba os problemas com items repetidos, que, ao serem multiplicados, terão sua ordem contabilizada, o que é errado.
Então, é necessário descontar casos cujas contagens desnecessárias estejam sendo feitas.

Esse "desconto" ocorre dividindo o resultado pelo fatorial do número de ocorrências do item, podendo haver mais de um tipo de item repetido.

O uso desses casos é muito comum em anagramas, em que letras podem estar repetidas.

$$P_n(\alpha, \beta) = \frac{n!}{\alpha! \cdot \beta!}$$
##### Exemplo
Anagramas de "BANANA" -> 6 letras, 2 "N" e 3 "A"
$$6! /( 2! \cdot 3!) = 60$$

### Contagem com agrupamento
Nesses casos, alguns items estarão em subgrupos, o que infere em uma contagem específica para eles, que depois será contabilizada na contagem principal.
Os agrupamentos surgem de especificações ou restrições dadas no problema

> Sempre começar a contagem pela especificação/restrição mais complexo

Agrupar é como colocar os items especificados em uma "caixinha". O grupo pode ser permutado internamente, e quando for permutado com os outros items externos irá contar apenas como um único item.

##### Exemplo
Permutações de "APROVEI" com as vogais sempre juntas.
"AOEI" -> sempre juntas (grupo), com permutação $4!$
"XRPV" -> permutação geral (com "X" sendo o grupo), com permutação $4!$

Logo $4! \cdot 4!$.

### Listas e Conjuntos
-> Lista é um agrupamento de $k$ objetos, **a ordem importa**.
-> Conjunto é um agrupamento de $k$ objetos, **a ordem não importa**.

### Arranjo
A base para a combinatória é formar conjuntos com $k$ elementos disponíveis no conjunto $n$. Contar "n k a k" significa justamente isso.

Ao iniciar, o primeiro dos $k$ elementos pode ter qualquer um dos $n$ valores. Seguindo, ao usar um valor, o próximo $k$ elemento poderá ter $n-1$ valores... A sequência formada resultada na equação da combinatória:
$$A(n,k) = \frac{n!}{(n-k)!}$$
Esse caso conta casos cuja ordem importa -> **listas** 

### Combinação
Consiste em um arranjo para items cuja ordem não importa -> **conjuntos**.
Chamado "n escolhe k".
$$C_{n}^{k} = \frac{n!}{k! \cdot (n - k)!}$$
### Estrelas e Barras
É um método para contar quantos grupos podem ser formados com $n$ elementos em $k$
grupos. O número de elementos em cada grupo pode ser 0 (será especificado o mínimo de elementos caso contrário)

Como dividir 6 estrelas em 3 grupos?
$*|*|****$  ou $**|**|**$ ou ...

O total de possíveis resultados pode ser dado por duas equações:

- Caso 1: O grupo pode ter 0 elementos
$$C_{k-1}^{n+k-1}$$
- Caso 2: O grupo não pode ter 0 elementos
$$C_{k-1}^{n-1}$$

### Princípio da inclusão e exclusão

#### Sorteio de Amigo Secreto
São N pessoas: 
## $$f\set{1, ..., N} \rightarrow \set{1, ..., N}$$
A função é injetora. 
Um bom sorteiro não permite que uma pessoa tire ela mesma ($f(i) \neq i$)

A propriedade i (Pi) é quando $f(i) = i$, então, basta calcular todos os casos que NÃO satisfazem as propriedades $N(Pi, Pn)$

Seja: $$X \subset \set{Pi, Pn} $$
Deseja-se obter todos os caras que tiraram a si mesmos no sorteio.
Envolve aquela soma estranha?
### $$S(X) = (n-|x|)!$$
A ideia é usar as "caixinhas", fixando alguns valores que satisfazem $f(i) = i$.
Fixando dois números, por exemplos, têm-se:
### [7-3].[2].[7-4].[4].[5].[7-5].[6-6]
Com $X = \set{2, 4, 5}$, as outras possibilidades são (7-3)!

### Desarranjo
É uma função injetora $f\set{1, ..., n} \rightarrow \set{1, ..., n}$ onde $f(i) \neq i$ para todo i.
Basicamente, desorganizar os items.
## $$dn = N(Pi, Pn)$$
Com um conjunto de Pi até Pn, temos:
## $$\sum(-1)^{|x|}S(X) = \sum(-1)^{|x|}{n\choose{j}}(n-j)!$$
Simplificando:
## $$\sum{\frac{(-1)^j}{j!}}$$
#### "Problema das cartas mal endereçadas" -> Euler resolveu

#### Problema:
$$f:A \rightarrow B$$
Quantas funções temos? 
O número de funções possíveis é o número de elementos do A -> |A|
Para saber quem ocupa cada uma das A casas, basta usar o B.
Como não foi declarado o tipo da função, podem haver repetições. Então, cada casa pode ser ocupada por qualquer um dos elementos em B (isso vale pra todas as casa).
Logo, o número de funções possíveis é:
$$|B|^{|A|}$$
Este número cresce bem rápido!

Dado um conjunto X finito, existe uma função $f$ que associa a entrada à um subconjunto de x e entrega na saída 1 ou 0. O resultado é 1 se o valor de entrada vindo de X estiver no subconjunto!

Os subconjuntos de X são $2^{|X|}$
Contar todos os subconjuntos é, basicamente, somar todos o conjuntos possíveis (todos com 1 + todos com 2 + ... + todos com x)

Um algoritmo recursivo que encontra os subconjuntos de um dado conjunto prova esse tópico.