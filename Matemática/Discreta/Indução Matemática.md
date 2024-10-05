"Prova" certas ocorrências envolvendo os naturais 

### Exemplo
Considere uma sequência de $N$ bolinas e aplique os casos:
- Pinte a primeira bolinha $P(0)$
- Se pintar alguma bolinha $P(n)$, pinte a próxima $P(n+1)$

Percebemos que vale $P(k)$ para todo $k$ 
Por que isso é válido? 
Sabe-se que $k \ne 0$ então, para qualquer $k$ há um número anterior. Então, como há um anterior, vale o caso de pintar a próxima bolinha!


### Método Indutivo
Dado um caso base (que funciona), deve-se provar que é válido para todo $n$.

Prove que:
## $$2⁰+2¹+2²+...+2^n = 2^n -1 $$
>[!IMPORTANT] Premissa básica
Dizer que se A ocorrer B também ocorre não significa que algum caso exista.
"Todas as araras da sala são mamíferos" -> Em algum momento foi dito que existe uma arara na sala?


Então, supõe-se que, fixado um determinado $n$, vale a equação anterior (note que não está sendo especificado que vale para TODO $n$) -> Ao estabelecer esse caso, cria-se a **Hipótese Indutiva**.
Agora, verifica-se o primeiro caso (base):
## $$2⁰ = 2^{0+1}-1$$
Usando a hipótese, pode-se manipular a equação:
## $$2⁰+...+2^n+2^{n+1} = 2^{n+1}-1+2^{n+1}$$
### Torre de Hanói
Prove que é possível resolver pra qualquer quantidade $n$ de discos.

Caso 1 disco: Basta mover o disco para uma torre livre

Hipótese de indução: ao resolver com $n$ discos, sabe-se resolver também com $n+1$ discos


### Múltiplos de 3
Sabe-se que $n = 1 \implies n³-n$ é múltiplo de 3.
Prove que para $n+1$ é múltiplo também.

##### Testando o caso base
Colocando $n \ge 1$ é garantido o resultado:
## $$1³-1=0$$
Zero é múltiplo!

##### Criando a hipótese de indução
Supondo que $(n+1)³-(n+1)$ seja múltiplo de três, pode-se manipular a equação.
## $$(n+1)³-(n+1)-(n³-n) $$


Essa equação deve ser múltipla de 3.
Pode-se, então, jogar o termo $-(n³-n)$ para o outro lado, igualando a equação.
## $$(n+1)³-(n+1)=(n³-n)$$
Basta resolver a equação de terceiro grau:
## $$n³+3n²+3n+1-n-1-n³+n = 3n²+3n$$
Obviamente, um valor que está multiplicado por 3 será múltiplo de 3.