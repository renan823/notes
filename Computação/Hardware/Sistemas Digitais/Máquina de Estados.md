Representa o conjunto de estágios que um circuito sequencial pode avançar.
Cada estado armazena uma "recordação" do estado passado, para poder trabalhar no estado futuro.
Um diagrama de fluxo é um grafo que representa os caminho e estados do sistema.

> **Estado = variável que armazena a memória do sistema**

### Mudanças de Estado
Toda máquina de estado possui um circuíto responsável apenas pela mudança de estado, saindo do **estado atual** e chegando ao **estado futuro**. 
**As operações devem considerar o estado atual e as entradas.**

O número de estados é dado por $2^{n}$, com n sendo o número de [[Flip-Flops]].

### Diagrama de Estados
Para representar os estados e as mudanças entre eles, usamos um desenho muito próximo dos [[Grafos]], onde cada nó representa um estado e cada aresta uma mudança entre estados.

> Moore -> Nó contem estado e saída, aresta apenas entradas
> Mealy -> Nó contém apenas o estado, aresta tem a entrada aplicada e a saída

As FSMs também podem ser representadas por tabelas, com cada linha contendo o estada atual, o próximo estado relativo a cada uma das entradas e também a saída esperada. 


### Máquina de Moore
Na máquina de Moore, a saída depende do estado!

Os nós armazenam o valor do estado e o valor de saída.
As arestas representam o valor de entrada que leva o circuito para o estado futuro.

| Estado Atual | a   | b   | c   | z   |
| ------------ | --- | --- | --- | --- |
| S0           | S0  | S1  | S1  | 0   |
| S1           | S2  | S0  | S1  | 1   |
| S2           | S2  | S3  | S0  | 0   |
| S3           | S0  | S1  | S2  | 1   |

![[diagrama_moore.png]]

### Máquina de Mealy
Na máquina de Mealy, a saída depende do estado e das entradas!

Os nós armazenam somente o estado.
As arestas representam a entrada aplicada e a saída obtida.

| Estado Atual | a     | b     | c     |
| ------------ | ----- | ----- | ----- |
| S0           | S0, 0 | S1, 1 | S1, 1 |
| S1           | S2, 1 | S0, 0 | S1, 1 |
| S2           | S2, 1 | S3, 0 | S0, 0 |
| S3           | S0, 0 | S1, 1 | S2, 0 |

![[diagraga_mealy.png]]