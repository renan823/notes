
Conjunto de vértices (nós) e arestas, que representam dados e suas conexões.
São usados para modelar problemas em que partes/entidades se relacionam entre si.

### Teoria dos grafos
Proposta por Euler na resolução do **problema das 7 pontes de Königsberg** (problema sem solução). O problema envolve percorrer todo o caminho sem repetir pontes (arestas). Isso só é possível se os nós intermediários tiverem grau par (ou seja, têm um número par de arestas conectados à ele). 

### Aplicações
Grafos podem ser utilizados em diversos problemas computacionais, por exemplo:
- Recomendação de conteúdos por similaridade
- Detecção de fraude
- Análise e representação de redes sociais
- Modelos de processamento de dados (data flow)
- Geolocalização e mapeamento

### Definições
- Grau: número de arestas de um nó (pode ser de entrada e saída)


### Caminho
É a sequência de nós e arestas que unem os pontos x e y (nós).
O **comprimento** do caminho é o total de arestas (nós - 1)

### Circuito
É um caminho que, saindo do nó *k*, retornará para o nó *k*. Nesse caso, nós podem ser repetidos entre o começo e o fim do caminho

### Ciclo
É um circuito que não repete nós (com exceção, claro, do início e fim).

### Caminho Hamiltoniano
Caminho em que todos os nós do grafo são usados apenas uma vez.

### Caminho Euleriano
Caminho em que todas as arestas do grafo são usadas apenas uma vez.

O modo de organizar, ordenar e armazenar dados nos [[Grafos]] pode variar de acordo com seu tipo.

### Simples
Grafo em que dois nós podem estar conectados com até uma aresta.

### Multigrafo
Tipo de grafo com mais de uma aresta ligando dois vértices.

### Bipartido
Grafo cujos nós/vértices podem ser divididos em 2 subgrupos $V_1$ e $V_2$, com toda aresta unindo um vértice de  $V_1$ com $V_2$.

### Dígrafo
É um grafo ordenado. Suas arestas **possuem sentido**, ou seja, a ordem dos nós importa.

### Grafo complementar
Dado um grafo $G$, o grafo $G'$ é dito complementar caso seu conjunto de arestas seja compostos por aquelas que **não** estão presentes em $G$. Se unirmos os dois grafos, todas as arestas possíveis estarão preenchidas. 

### Grafo completo
É um grafo que possui todas as arestas possíveis -> $n (n-1)/2$ 

### Grafo regular
Ocorre quando todos os nós possuem o mesmo grau

### Grafos valorados
Uma aresta possui origem, destino e **peso** (força da relação)