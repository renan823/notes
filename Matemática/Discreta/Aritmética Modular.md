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

