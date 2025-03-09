São [[Árvores Binárias de Busca]] cujas alturas entre as sub-árvores **nunca** diferem mais que 1 -> É balanceada.

O nome "AVL" é a junção das iniciais de sobrenomes dos matemáticos que propuseram este modelo.

### Fator de balanceamento
Como manter a estrutura balanceada após as operações de inserção ou remoção?

Em AVLs, existem fatores de balanceamento em cada nó, calculado com a altura da sub-árvore esquerda menos a altura direita.
Ao inserir em sub-árvores cujo pai seja limite, ou seja, diferente de zero, a árvore tem grandes chances de se tornar desbalanceada.

### Rotações
O método de manutenção da árvore é a chamada rotação.
Rotacionar a árvore é a operação que tenta estabilizar as alturas, mantendo a regra de diferir em no máximo 1.

-> As rotações ocorrem no nó mais jovem a se tornar desbalanceado, ou seja, o primeiro nó da hierarquia a fugir do limite 1 <-> -1. Esse erro é propagado, então devemos tratar os casos que ocorrem primeiro (nós mais baixos).

- **Rotação direita**: Ocorre quando a sub-árvore afetada é a esquerda (fator positivo)
- **Rotação esquerda**: Ocorre quando a sub-árvore afetada é a direita (fator negativo)

-> Rotações direita e esquerda são simétricas!

- **Rotação Dupla**: Casos em que as rotações simples não são suficientes! Ocorre quando os fatores dos nós possuem sinais diferentes, trabalhando sempre o nó mais jovem desbalanceado. Podem ser DE ou ED.

Para decidir qual rotação aplicar, basta olhar para o sinal dos nós A e B. Caso sejam iguais, é uma rotação simples. Caso contrário, é uma rotação dupla (começando em B). O tipo de rotação é dado pelo fator de balanceamento -> negativo roda para a esquerda, positivo roda para a direita.

-> Como ajustar corretamente os fatores após uma rotação dupla?


### Custo
AVLs possuem custo $1.44 \log{n}$, em relação as binárias de busca. De forma assintótica, as operações serão $O(\log{n})$.