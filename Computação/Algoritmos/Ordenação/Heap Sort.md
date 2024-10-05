O heap sort é um método de [[Ordenação]] muito eficiente, que aproveita da estrutura de  [[Heap]] (máxima) para ordenar seus valores.

### Funcionamento
O primeiro passo é construir um heap máximo no forma de vetor desordenado.
Com o vetor colocado, basta trocar (swap) o primeiro elemento com o último.
Após o procedimento, diminua o tamanho da heap (isso evita acessar posições já ordenadas).

>[!example] Ordem errada
>Perceba que ao trocar os valores a chance de estar com uma heap errônea é grande.
>Então, após cada troca, é necessário reorganizar a heap. Essa ação move um nó para baixo caso ele seja menor que algum dos filhos. É sempre importante olhar o maior dos filhos e então realizar a troca (quando necessário).

O funcionamento do algoritmo é repetido, sempre realizando a troca da raiz (root) com o n-i elemento, reorganizando os itens após cada iteração.

-> É necessário construir a heap (dado um vetor, construa uma heap)
-> É necessário rearranjar a heap (dado um índice, coloque o item em sua posição correta)

>[!example] Rearranjar 
>Dado um certo nó, deve-se analisar seus filhos e encontrar o maior entre eles. Se o maior não for o próprio nó, então a substituição deve ocorrer. Use o processo recursivamente até que nó = maior


>[!example] Construir
>O processo de construção da heap é relativamente simples. Dado um vetor, use o método algébrico para encontrar as folhas. Basta ignorar as folhas e usar todos os elementos restantes. Começando do último item, chame a função de rearranjar para cada item.


### Complexidade
Primeiramente, deve-se analisar as funções auxiliares.
O rearranjar possui complexidade $O(logn)$.
A função construir é $O(n)$.

Por executar o rearranjar n vezes, então a complexidade é $O(nlogn)$.
