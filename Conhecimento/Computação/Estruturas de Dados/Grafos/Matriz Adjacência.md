
Estrutura de dados usada para representar [[Grafos]].

Cada nó é um índice da matriz, com a posição $[i, j]$ representado a aresta entre i e j. Caso exista uma aresta, $[i, j] = 1$, caso contrário $[i, j] = 0$


> Exemplo: Matriz de adjacência para um grado simples

| x   | 1   | 2   | 3   | 4   | 5   | 6   |
| --- | --- | --- | --- | --- | --- | --- |
| 1   | 0   | 1   | 0   | 1   | 0   | 0   |
| 2   | 0   | 0   | 0   | 0   | 1   | 0   |
| 3   | 0   | 0   | 0   | 0   | 1   | 1   |
| 4   | 0   | 1   | 0   | 0   | 0   | 0   |
| 5   | 0   | 0   | 0   | 1   | 0   | 0   |
| 6   | 0   | 0   | 0   | 0   | 0   | 1   |
