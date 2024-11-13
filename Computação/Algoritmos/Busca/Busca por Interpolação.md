É um método diferente da [[Busca de Dados]], que conta com a boa distribuição dos dados. Seu funcionamento envolve uma equação que, em dados bem distribuídos, encontra a possível posição do valor desejado.

Usando os limites do vetor (obrigatoriamente um vetor), é possível realizar um cálculo estimando a posição da chave buscada. Entretanto, em casos práticos, dificilmente teremos chaves bem distribuídas. 
Por exemplo, nomes iniciados em "L" são mais comuns que nomes iniciados em "K", o que resulta em certa aglomeração de chaves em torno de certos valores.

### Funcionamento
A equação é dada por:
#### $$pos = inf + (inf - sup) * (\frac{x - vec[inf]}{vec[sup] - vec[inf]}) $$
- $x$ é chave de busca
- $vec$ representa o vetor de dados
- $inf$ e $sup$ são os limites inferior e superior, respectivamente, do vetor

### Complexidade
Por reduzir muito o número de comparações, a busca por interpolação tem **ótimos** resultados, tendo como complexidade $O(\log{(\log{(n)})})$ .
Porém, vetores cujos dados apresentam aglomerados e não estão corretamente distribuídos, podem possuir complexidade da [[Busca Sequencial]], $O(n)$.