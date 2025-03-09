São [[Árvores Binárias de Busca]] com balanceamento baseado em um sistema de cores vermelho e preto (ou rubro e negro).

Seu funcionamento é variado, e pode ser implementado de diversas formas.
Sedgewick sugere uma implementação chamada **left leaning**, em que as arestas possuem cor, não os nós. Essa implementação é vantajosa por reduzir casos nas operações, simplificando código.

A implementação tradicional 

### Funcionamento
Para manter a árvore balanceada existem 3 regras principais:
- Todo nó pode ter apenas uma aresta vermelha (chegando ou saindo);
- Arestas vermelhas só podem estar à esquerda;
- A distância de qualquer folha até a raiz possui a mesma quantidade de arestas pretas (caminho negro).

A árvore, como o nome sugere, terá uma leve inclinação para a esquerda, que pouco afeta o balanceamento geral.

A manutenção do balanceamento ocorre em 3 operações:
###### Rotação Esquerda
Ocorre quando a aresta vermelha está à direita.
Rotaciona o nó afetado para esquerda, mudando seus ponteiros.
###### Rotação Direita
Ocorre quando existem duas arestas vermelhas no nó (entrando e saindo).
Rotaciona o nó afetado para direita, mudando seus ponteiros.
###### Inversão de Cores
O corre quando os dois filhos do nó são vermelhos. 
A aresta incidente no nó afetado se torna vermelha e a dos filhos preta.

### Custo
As operações em árvores com left leaning são na média de $2\log{n}$. 
Esse valor foi calculado explicitamente pelo próprio Sedgewick, mas de modo assintótico ambos os casos (left leaning ou não) serão $O(\log{n})$.
