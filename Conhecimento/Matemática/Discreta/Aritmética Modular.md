Representa o estudo dos restos (módulos) e suas congruências.  Uma **congruência** ocorre quando $a \mod{m} = b \mod{m}$. Ou seja, $m$ divide $a-b$.

As técnicas e estudos desenvolvidos a partir da aritmética modular permitiram avanços na [[Criptografia]] moderna, também sendo usados em funções hashing nas [[Tabelas Hash]].

### Notação
#### $$1 \equiv 13 \mod{12}$$
> 1 é congruente à 13 no módulo 12. De forma geral, $a \equiv b \mod{m}$ 


### Exemplo
![[congruencia.png]]
Os relógios possuem sistemas diferentes: um deles tem 14 marcações (com 28 horas), o outro segue o padrão de 12 marcações (24 horas).

- Qual seria o horário equivalente às 21h no relógio de 28 horas? $21 \equiv 7 \mod{14}$

- Qual seria o horário equivalente às 16h no relógio de 28 horas? $16 \equiv 2 \mod{14}$ 


### Propriedades
Se $a \equiv b \mod{m}$ e $c \equiv d \mod{m}$

- $a + c \equiv b+d \mod{m}$
- $a-c \equiv b-d \mod{m}$
- $ka \equiv kb \mod{m}, \forall \, k \in \mathbb{Z}$  
- $ac \equiv bd \mod{m}$ 
- $a^{k} \equiv b^{k}, \forall \, k \in \mathbb{N}$ 

> Caso especial: Se $MDC(k, m) = d$, então $ka \equiv kb \mod{m} \iff a \equiv b \mod{\frac{m}{d}}$ 


### Classe inversa
Dizemos que um número possui inverno em $\mod{n}$ quando sua multiplicação por outro valor possui resto 1.
Para melhor visualizar essa propriedade, é interessante criar uma tabela de restos para um determinado número.

Exemplo: Tabela de classes do 5.

|       | 0   | 1   | 2   | 3   | 4   |
| ----- | --- | --- | --- | --- | --- |
| **0** | 0   | 0   | 0   | 0   | 0   |
| **1** | 0   | 1   | 2   | 3   | 4   |
| **2** | 0   | 2   | 4   | 1   | 3   |
| **3** | 0   | 3   | 1   | 4   | 2   |
| **4** | 0   | 4   | 3   | 2   | 1   |
A tabela representa os restos das multiplicações entre os valores que antecedem 5. 
Todas a linhas contendo 1 são inversos.
Note que, aqui, todas as linhas possuem 1. Isso ocorre pelo fato de 5 ser primo. Caso o número não seja primo, apenas algumas linhas (aquelas que representam os primos do número) conterão o 1.

$a$ tem classe inversa $\mod{n}\iff mdc(a, n) = 1$ 

### Resolvendo problemas

**Qual o resto de $17 + 18 \mod{7}$ ?**
Para resolver essa equação, realizaremos o módulo em cada um dos casos, somando seus restos. Note que, como a operação é soma, os restos serão somados.
-> $17 + 18 \mod{7} \equiv 0 \mod{7}$ 

**Qual o resto de $17*18 \mod{7}$ ?**
Para resolver essa equação, realizaremos o módulo em cada um dos casos, multiplicando seus restos. Note que, como a operação é multiplicação, os restos serão multiplicados.
-> $17+18 \mod{7} \equiv 12 \mod{7} \equiv 5 \mod{7}$

**Qual o resto de $1991^{3} \mod{7}$ ?**
Podemos separar em partes a resolução, operando cada $1991$ presente no cubo, e depois multiplicando seus restos.
-> $1991 \mod{7} \equiv 3$
Logo, basta multiplicarmos os restos e aplicar novamente o módulo.
->$3*3*3 = 27 \mod{7} \equiv 6$

Para problemas envolvendo potências de bases relativamente pequenas, é muito recomendado construir um **tabela dos comportamentos**, analisando como cada expoente afeta o resto. Na maioria dos casos, haverá repetições, que possibilitam identificar padrões de restos e aplicá-los ao problema!
-> $2^{56} \mod{7} \equiv 2 \mod{7}$
Ao construir a tabela do $2^{n}$, percebemos que os restos se repetem de 3 em 3: 2, 4, e 1.
Então, basta achar o resto correspondente ao $2^{56}$.

Em equações, devemos encontrar a classe de resto correspondente que satisfaça o problema, pensando no módulo proposto
-> $2x \equiv 1 \mod{7}$ 
Nesse exemplo, precisamos achar $x$ que multiplicado por 2 possua resto 1 no módulo 7.
Isso pode ser feito com $x=4$