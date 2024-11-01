É o método de [[Busca de Dados]] mais comum e simples.
Consiste em percorrer um vetor de $n$ elementos até encontrar o elemento/chave especificada. 
Quando encontrar o elemento, retorne sua posição. Caso o valor não esteja presente no vetor, então retorne algum valor que indique a ausência do elemento (como -1, ou NULL).

### Recuperação Recorrente
Para melhorar a eficiência do algoritmo, é possível utilizar o fenômeno da **recuperação recorrente de registros**, que analisa a probabilidade de um registro que já foi acessado ser acessado novamente.
Existem dois modos de aplicar esse método:
- **Mover para frente**: Sempre que uma pesquisa for bem sucedida, troque a posição do valor encontrado com a primeira posição. (sempre a última busca que importa).
- **Transposição:** Um registro recuperado com sucesso é trocado com seu anterior imediato. (esse método é incremental).

### Índices
Para ajudar ainda mais na eficiência do algoritmo, podemos criar uma tabela de [[Índices]] (assim como em arquivos), que irá auxiliar o algoritmo de busca diminuindo a região da busca. Esse método é semelhante às [[Skiplists]].

A tabela guarda a posição de valores espalhados pelo vetor. Esses valores são os índices. 
Para definir os índices, precisamos definir quantas partições ($p$) serão feitas no vetor (cada qual com $n/p$ elementos). 
A busca com índices observa qual é a região que a chave pode estar, diminuindo o custo de busca. A região é um sub-vetor.

**A complexidade seria $O(p + \frac{n}{p})$.**

As tabelas de índices podem apontar para outros índices, em casos que o vetor de dados é muito grande.
Vale ressaltar que mesmo com a redução na complexidade temporal, a complexidade espacial pode (e provavelmente vai) aumentar. Além disso, a tabela de índices precisa ser atualizada juntamente com o vetor de dados.

### Melhorias
Caso o vetor esteja ordenado, ainda existe a possibilidade de otimizar o algoritmo, verificando se a o valor da chave atual é maior que a chave requerida, isso indica que a possível posição daquele elemento não existe.

Também é possível adicionar um sentinela (como nas [[Listas Encadeadas Circulares]]) ao vetor para reduzir o número de comparações dentro do laço. Isso, na prática, não terá uma diferença tão grande.

### Complexidade
No melhor caso, a chave estará na primeira posição, o que torna-o $O(1)$.
O pior caso ocorre quando o elemento está na última posição ou não está no vetor, representando $O(n)$. 
**De modo geral, $O(n)$.**

Caso os items estejam ordenados, então devemos considerar também o custo da ordenação.