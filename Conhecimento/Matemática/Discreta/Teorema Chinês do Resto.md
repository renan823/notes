Permite criar um algoritmo para resolver sistemas de congruências da [[Aritmética Modular]].

### Funcionamento
Dado um problema cujo enunciado apresenta um número $n$ com seus respectivos restos em divisões com outros números, é possível encontrar $n$ aplicando o algoritmo fundamentado pelo teorema chinês do resto.

Com o sistema de congruências montado, teremos de montar uma tabela. 
Cada linha representa uma equação do sistema.
São 5 colunas:
- $A$: armazena o resto apresentado na equação
- $M$: armazena a multiplicação do divisores presentes nas equações, excluindo o divisor da linha atual.
- $\bar{M}$: armazena o resto da divisão do número em $M$ pelo divisor da equação.
- $\bar{M}^{-1}$: armazena a classe inversa de $\bar{M}$.
- $C$: armazena a multiplicação de $A \cdot M \cdot \bar{M}^{-1}$ 

Com a tabela montada, basta somar os resultados em $C$ e dividir pela multiplicação dos divisores das equações.

### Exemplo
Um general levou 2000 soldados para a guerra. Ao retornar da batalha, precisava contabilizar suas perdas. Para descobrir quantos soldados foram perdidos, agrupou seus soldados em grupos de 7, sobrando 5; em grupos de 9, sobrando 4; e em grupos de 10, sobrando 1. 
Sabe-se que na formatura pós batalha haviam mais de 1500 soldados.
Quantos foram perdidos em batalha?

-> Equações
- $N \equiv 5 \mod{7}$ 
- $N \equiv 4 \mod{9}$
- $N \equiv 1 \mod{10}$

-> Tabela

| $A$ | $M$               | $\bar{M}$                            | $\bar{M}^{-1}$ | $C$                         |
| --- | ----------------- | ------------------------------------ | -------------- | --------------------------- |
| 5   | $9 \cdot 10 = 90$ | $6 \space (90 \equiv 6 \mod{7})$<br> | 6              | $5 \cdot 90 \cdot 6 = 2700$ |
| 9   | $7 \cdot 10 = 70$ | $7 \space (70 \equiv 7 \mod{9})$     | 4              | $4 \cdot 70 \cdot 4 = 1120$ |
| 7   | $7 \cdot 9 = 63$  | $3 \space (63 \equiv 3 \mod{10})$    | 7              | $1 \cdot 63 \cdot 7 = 441$  |

-> Valor final
$$2700+1120+441 = 4261 \implies 4261 \equiv 481 \mod{630}$$

Basta encontrar os possíveis valores cujo resto é 481 na divisão por 630.
-> $\set{481, 1111, 1741, \dots}$ 
Dentre esses resultados, apenas o 1741 satisfaz a condição de que mais de 1500 soldados estavam na formatura.

Se 1741 estavam na formatura, então **259** morreram na batalha.