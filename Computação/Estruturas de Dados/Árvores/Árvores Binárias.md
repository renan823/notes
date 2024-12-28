São tipos especiais de [[Árvores]] em que cada nó pode ter, no máximo, dois filhos.
Os nós à esquerda e a direita são, também árvores binárias (chamada de sub-árvores), que podem ou não estar vazias.q     
Por definição, o **grau da árvore** é 2. (pode ter até dois filhos).

As árvores binárias possibilitam a união entre vantagens das [[Listas Sequenciais]] e das [[Listas Encadeadas]], utilizando uma estrutura com nós que também permite [[Busca Binária]] (a maior vantagem aqui).

O controle da altura da árvore é uma ação necessária! 
A altura máxima é $n-1$.
A altura mínima é $\lfloor \log_{2}n \rfloor$

### Árvores Estritamente Binárias
São uma especificação das árvores binárias que mudam as regras, permitindo que um nó tenho 0 filhos ou 2 filhos. Nós com apenas um filho não são permitidos. 
Os nós interiores (não folhas) sempre têm 2 filhos. 

### Árvore Binária Completa Cheia
É uma árvore estritamente binária, mas com todos os nós-folha no mesmo nível (ou seja, possuem a mesma profundidade).
Isso possibilita que a árvore tenha a menor altura possível.

Porém, existem problemas na inserção e na capacidade de definir em qual posição o nó será inserido. 
Precisamos manter os níveis completos e precisamos saber quem são os nós do nível atual (o que envolve uma estrutura auxiliar).

O número total de nós em uma árvore com profundidade $d$ é: $n = 2^{d+1}-1$
Com $n$ nós, a menor altura é: $d = \log_{2}(n+1) - 1$
### Árvore Binária Completa
Neste caso, a árvore **não** precisa ser estritamente binária, o que permitirá que os nós possuam 0, 1 ou 2 filhos.
Aqui, o nível acima do atual ($d-1$) terá todos os nós. O nível atual $d$ pode não ter todos os nós, mas, os que existirem, devem estar o mais a esquerda possível.
Esse processo é similar ao da [[Heap]].

Entretanto, o problema de definir o nível permanece. Uma estrutura auxiliar é necessária.

### Árvore Binária Perfeitamente Balanceada
Para cada nó, o número de nós de suas sub-árvores esquerda e direita difere em no máximo 1. Aqui, não é necessário colocar os nós à esquerda.
É mais fácil contar o nós que armazenar nível.
A altura mínima é $\lfloor \log_{2}n \rfloor$ 

### Árvore Binária Balanceada
Aqui, o que importa é a diferença de altura das sub-árvores.
Para qualquer nó, a altura difere em no máximo 1.
Toda árvore perfeitamente balanceada é uma árvore balanceada.

### Implementação em Array
filho esquerdo 2i + 1
filho direito 2i + 2

Para achar o pai, usamos (i - 1) / 2

### Implementação encadeada
Cada nó armazena seu valor e dois ponteiros para outro nó (esquerdo e direito).
A estrutura principal da árvore armazena a raiz e outros valores, por exemplo a profundidade.

Visitar o nó significa realizar alguma ação que envolva o nó. Mostrar dado, modificar valor, etc. Apenas passar pelo nó NÃO é visitar!

### Percursos em Árvore
- Pre-order: Visitar raiz. percorrer a esquerda em pre-order. percorrer a direita em pre-order.
- In-order: percorrer a esquerda in-order. visitar a raiz. percorrer a direita in-order
- Pos-order: percorrer a esquerda em pos-order. percorrer a direita em pos-order. visitar raiz.