É uma categoria das [[Árvores Binárias]], mas, como o nome sugere, focada em operações de busca.

### Definição
Seja $S = \{s_1, ... s_n\}$ o conjunto de chaves (únicas) dos nós da árvore $T$.
Cada nó possui um chave, que será única em toda a árvore.

Essa unicidade de chaves permitirá consultas mais eficientes, associando uma função $R(v_i) = s_i$ para cada nó.

### Ordenação
A árvore binária de busca possui uma hierarquia de nós construída do seguinte modo:
- A sub-árvore esquerda é sempre **menor** que a raiz
- A sub-árvore direita é sempre **maior** que a raiz

Desse modo, é possível realizar uma [[Busca Binária]] sempre excluindo ramificações do percurso a ser seguido -> Isso implica em complexidade $O(\log{n})$ 

Ao "olhar" para um nó, é possível identificar qual caminho tomar para encontrar o valor desejado.

### Percurso
Ao fazer um percurso "em ordem", o resultado é a sequência **crescente** das chaves dos nós.

>Se, por acaso, a regra de ordenação fosse invertida (direita menor e esquerda maior), o percurso resultaria na ordem decrescente das chaves.

### Inserção
A árvore pode ser modificada, mas a condição de ordem **deve** ser mantida!

A inserção acontece nas seguintes etapas:
- Buscar pelo local do novo nó (ajustando quando ir para a direita/esquerda).
- Ao atingir um ponteiro nulo, insira o nó.

> A busca deve respeitar a ordem das sub-árvores, identificando nós maiores e menores!

Custo $O(\log{n})$

### Busca
A busca inicia na raiz, respeitando a ordenação direita e esquerda.
Caso a raiz seja nula, então retorne nulo (o item buscado não existe).
Quando o item buscado for encontrado, retorne-o.
Durante o percurso, alterne entre direita e esquerda quando necessário.

Custo $O(\log{n})$

### Remoção
É a operação mais complexa envolvendo árvores de busca.
Existem 3 casos para a remoção:
- Nós folhas podem ser removidos sem nenhum problema
- Nós com um filho terão seu local ocupado pelo filho (independentemente do lado)
- Nós com dois filhos são um problema. A ideia é colocar na posição nó a melhor escolha possível. Essa escolha depende do caminho tomado. Caso a opção seja usar algum nó da esquerda, devemos usar a maior chave encontrada. Se a escolha for o nó da direita, devemos usar a menor chave encontrada ali.

No pior caso da remoção, devemos percorrer a árvore toda (para achar o nó e fazer os ajustes para a remoção)

Custo $O(\log{n})$ 

### Complexidade
Em árvores aleatórias, ou seja, cuja probabilidade de inserção é igual em todos os nós, as comparações serão, aproximadamente, $1,39 \log{n}$. Isso é $39$% pior que uma árvore devidamente balanceada.

-> Útil em busca **se** a árvore estiver balanceada

A manutenção do balanceamento pode ser feita por um algoritmo, como rebalanceamento, ou usando árvores balanceadas, como as [[Árvores AVL]]



