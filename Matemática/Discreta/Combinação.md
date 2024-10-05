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
Assim, obtemos algo como: $26⁴*10³$ possibilidades diferentes.

>[!tip] O método das caixinhas é realmente útil!


### Uma equação para isso
A base para a combinatória é formar conjuntos com $k$ elementos disponíveis no conjunto $n$.
Contar "n k a k" significa justamente isso.
Ao iniciar, o primeiro dos $k$ elementos pode ter qualquer um dos $n$ valores. Seguindo, ao usar um valor, o próximo $k$ elemento poderá ter $n-1$ valores... A sequência formada resultada na equação da combinatória:
### $$P(n,k) = \frac{n!}{(n-k)!}$$
Esse caso conta a quantidade de **listas** -> ordem importa!
A diferença, muitas vezes, é que buscamos algo em que a ordem não importa-> **conjuntos**.

Para contar conjuntos temos a notação "n escolhe k":

### $${n\choose{k}}=\frac{n!}{(n-k)!k!}$$
Basicamente, para contar conjuntos ("n escolhe k") deve-se descontar os casos com repetição $k!$. Para isso, basta desconta-los na equação de permutação de listas.

A grande maioria dos problemas envolve as duas equações apresentadas, variando valores e o modo de pensá-las.

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