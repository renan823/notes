São segmentos de reta com um ponto inicial e final, apresentando orientação.
Suas extremidades são $a, B \in E^{ 3}$ 


### Segmento de reta
São "pedaços" contidos na reta, com extremidades A e B.
Um segmento com extremidades A e B está contido numa reta, que é a **única** que passa por eles. 

> Por dois pontos A, B passa apenas uma reta


### Características de vetores
Dois vetores $\vec{AB}$ e $\vec{BA}$ são iguais se:
- Possuem a mesma direção (são paralelos)
- Possuem mesmo sentido
- Possuem mesmo módulo (comprimento)

O módulo é denotado por $||\vec{AB}||$

A posição de um vetor no espaço não é importante! Basta usar as características básicas para identificar vetores iguais/diferentes.

1 - Quando $\vec{AB}$ e $\vec{BA}$ possuem sentidos diferentes, são ditos opostos.
2 - Para qualquer $A \in E^{ 3}$, $\vec{AA}$ possui módulo 0, não possui sentido nem direção
3 - $V^{ 3}$ é conjunto de todos os vetores no $E^{ 3}$ 
4 - Elementos em $V^{ 3}$ são definidos como $\vec{u}, \vec{v}, \vec{w}$ etc
5 - Se $\vec{u} = AB$, então $AB$ é representante do vetor $\vec{u}$ 


### Soma de vetores
Dados dois vetores $\vec{u}, \vec{v} \in V^{ 3}$, sua soma pode ser feita encontrando seus representantes que possuem uma origem em comum.

Se $\vec{u} = \vec{AB}$ e $\vec{v} = \vec{BC}$, sua soma será data pela soma das extremidades (nesse caso, A e C), desconsiderando (ou "cortando") o valor B.
Então, a soma $\vec{w} = \vec{u}+\vec{v}$ é igual à $\vec{w} = \vec{AB} + \vec{BC}$ que será $\vec{W} = \vec{AC}$.

O vetor nulo surge quando somamos um vetor $\vec{u}$ com seu oposto $-\vec{u}$ -> $\vec{0} = \vec{u}-\vec{u}$.

##### Propriedades da soma
- $\vec{u}+\vec{v}=\vec{v}+\vec{u}$ (comutativa)
- $(\vec{u} + \vec{v}) + \vec{w} = (\vec{v} + \vec{w}) + \vec{u}$ (associativa)
- Para qualquer vetor $\vec{u}$ existe um vetor oposto tal que $\vec{u} -\vec{u} = \vec{0}$.
- O vetor $\vec{0}$ é o elemento nulo: $\vec{u}+\vec{0}=\vec{u}$.

> Para soma, pode-se aplicar a **regra do paralelogramo**


Polígonos fechados, cuja soma termine no mesmo ponto de início, terá como resultado $\vec{0}$.


### Multiplicação por escalar
Não existe um conceito bom e bem definido para a multiplicação **entre** vetores!

Por outro lado, a multiplicação entre um vetor $\vec{u}$ e um valor escalar (numérico) é muito usual.
A divisão entre vetor e escalar ocorre do mesmo modo que a multiplicação!
Seja $a \in \mathbb{R}$ e $\vec{u} \in V^{ 3}$, então a multiplicação será $a\vec{u}$.

- Se $a = 0$ ou $\vec{v} = \vec{0}$ então $a\vec{v}=\vec{0}$
- Se $a \neq 0$ e $\vec{v} \neq \vec{0}$ então $a\vec{v} \in V^{ 3}$ 
- $a\vec{v} || \vec{v}$ (são paralelos) 
- Se $a > 0$ então $a\vec{v}$ e $\vec{v}$ possuem o mesmo sentido
- Se $a < 0$ então  $a\vec{v}$ e $\vec{v}$ possuem sentidos opostos
- $||a\vec{v}|| = |a|.||\vec{v}||$

##### Propriedades da multiplicação por escalar
- $a(\vec{u}+\vec{v}) = a\vec{v}+a\vec{u}$
- $(a+b)\vec{u} = a\vec{u}+b\vec{u}$
- $1.\vec{u} = \vec{u}$ (elemento neutro)
- $a(b.\vec{u})=b(a.\vec{u})$ (associativa)


> Um **vetor unitário** é um vetor com módulo (comprimento) 1

O oposto de um vetor é único!
Se $\vec{u}$ e $\vec{u'}$ são opostos de $\vec{v}$, então: $\vec{u} +\vec{v} = 0$ e $\vec{u'}+\vec{v} = 0$.
Temos: $\vec{u} = \vec{u} +\vec{0} = \vec{u} + (\vec{v} + \vec{0}) = 0 + \vec{u'}$ 

##### Regras de sinais
Seja $a \in \mathbb{R}$ e $\vec{u} \in V^{ 3}$, temos:
- $(-a)\vec{v}=-(a\vec{v})=a(-\vec{v})$
- $(-a)(-\vec{v})=a\vec{v}$
- $-\vec{v}=(-1)\vec{v})$ 


- Seja $ABCDEF$ um hexágono regular de centro $O$, mostre que $\vec{AB}+\vec{AC}+\vec{AD}+\vec{AE}+\vec{AF}=\vec{AO}$ .
![[ex1.png]]




- Mostre que se $\vec{0} \neq \vec{u} \in V^{ 3} \implies ||\vec{u}|| > 0$:



- Sendo M o ponto médio de AC e N e de BD e $x = \vec{AB}+\vec{AD}+\vec{CB}+\vec{CD}$ prove que $\vec{x} || \vec{MN}$.


### Versor
O versor do vetor é um vetor unitário!
 $$\frac{\vec{u}}{||\vec{u}||}=\frac{1}{||\vec{u}||}\vec{u}$$
  



