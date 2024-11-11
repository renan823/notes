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

### Busca
A busca inicia na raiz, respeitando a ordenação direita e esquerda.
Caso a raiz seja nula, então retorne nulo (o item buscado não existe).
Quando o item buscado for encontrado, retorne-o.
Durante o percurso, alterne entre direita e esquerda quando necessário.



