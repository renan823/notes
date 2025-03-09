As tabelas hash são estruturas lineares, como as [[Listas Sequenciais]], que viabilizam o acesso direto com custo $O(1)$ aos campos. Porém, diferentemente de um simples vetor, os índices são definidos por uma função especial, o que ocasiona na desordem dos valores (hash -> bagunça).  Este endereçamento é o que garante que chaves únicas ocupem locais únicos no array.

O endereçamento pode ser direto, ou seja, o valor inteiro é seu próprio endereço.
Também é possível usar funções de hashing no modo $F(x) = y$, configurando um método indireto.

Colisões ocorrem quando a função leva diferentes chaves no mesmo valor de hash. 

> A principal desvantagem das tabelas hash é a bagunça de items, que não possuem uma ordem explícita, apenas a ordem gerada pela função. Isso dificulta percorrer ordenadamente os valores.


### Hashing Fechado
Armazena os dados em um vetor limitado de items.
As colisões são tratadas usando métodos de rehash. O problema, porém, está na aglomeração de valores causada justamente pelo rehash.

### Hashing Aberto
Armazena uma tabela de [[Listas Encadeadas]], o que permite contornar colisões.
O armazenamento nesse caso é potencialmente ilimitado, mas gera problemas nas operações conforme a tabela cresce.

### Funções de Dispersão 
Uma boa função é a chave (piada) para um bom endereçamento de dados em um tabela hash. Os diferentes métodos apresentam vantagens e desvantagens entre si.
Uma boa função deve ter:
- Poucas (ou nenhuma) colisões
- Uniformidade (probabilidade de ocupação dos endereços é igual)
- Facilmente computável

#### Método da Divisão
Consiste em utilizar o resta da divisão da chave $x$ pelo tamanho $m$ da tabela. Essa função **garante** que todos os casos sempre estejam entre $0$ e $m-1$
Idealmente, tamanhos primos (11, 37, etc) são melhores.
-> $k \mod{m}$ 

#### Método da Multiplicação
Consiste em multiplicar a chave $k$ por uma constante $A$,  usando a parte fracionária do número obtido com $\mod{m}$, mantendo a ideia do módulo de $m$. Na literatura, Knuth sugere uma constante $A = \sqrt{5} -1 = 0.6180\dots$  
-> $(kA \mod{1})m$ 


