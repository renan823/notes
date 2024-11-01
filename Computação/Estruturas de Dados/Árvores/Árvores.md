Árvores são estruturas muito usadas na computação que, diferentemente das [[Listas Sequenciais]], não são lineares! As árvores possuem uma estrutura hierárquica, que facilita operações como busca e inserção.
Alguns problemas possuem naturalmente essa estrutura com hierarquia. Instituições, livros, árvores genealógicas, etc.

Extrair informações se torna uma tarefa muito mais fácil, já que podemos acessar uma ramificação selecionada da árvore. A estrutura encadeada permite flexibilidade.
[[Árvores Binárias]] permitem, também, a [[Busca Binária]], que reduz ainda mais os custos nas operações.

### Definição
Uma árvore $T$ é um conjunto de elementos chamados nós. 
- $T = \emptyset$, então é dita vazia
- $T = \set{r} \cup \set{T_{1}} \cup ... \cup \set{T_{n}}$, em que cada $T$ é um árvore

O nó inicial é chamado raiz (root) e seus filhos são sub-árvores. 
Com pouco esforço, percebemos como a definição de árvores é recursiva! Os algoritmos envolvidos são praticamente todos recursivos.


### Terminologias
O **grau de um nó** representa o número de sub-árvores que ele possui.
Quando o grau é zero, ou seja, o nó não possui filhos, dizemos que ele é uma **folha**.
Se definirmos um grau máximo geral, garantindo que todos os nós possuam no máximo esse grau, então podemos definir o **grau da árvore**. Isso não impede os nós de possuírem menos filhos, apenas limita o número limite.

Os nós irão receber nomes associados à árvore genealógica: pai, filho, avô, etc.

- **Caminho**: Sequência de nós não vazios formados por pais e filhos;
- **Comprimento**: O Comprimento do caminho P é o número de nós menos um.

A **altura** é outro conceito fundamental. Folhas têm altura zero.
A altura de um nó é dada pelo comprimento do maior caminho deste nó até uma folha.
A altura da árvore é o comprimento do maior caminho entre a raiz e uma folha.

A **profundidade** de um nó é o comprimento do caminho que liga este nó à raiz. (sempre haverá um único caminho entre um nó e a raiz).
A maior profundidade é, justamente, a altura da árvore.
