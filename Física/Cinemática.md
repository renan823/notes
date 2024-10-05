### O que é?
Cinemática é a parte da física responsável por estudar os movimentos e as trajetórias.
Velocidade, aceleração e leis de Newton são essenciais.

### Por onde começar?
A representação de grande parte da cinemática é feita utilizando [[Vetores]].
As operações envolvendo vetores também serão utilizados, bem como  [[Produto Escalar]], [[Produto Vetorial]], [[Produto Misto]].

As aplicações do cálculo serão necessárias na manipulação de muitos casos. [[Limites]], [[Derivadas]] e [[Integrais]] serão indispensáveis.

### Trajetórias e Taxas
A ideia é descrever o movimento de uma partícula. Na verdade, a partícula é a simplificação de um corpo, como se apenas o centro de massa do objeto fosse considerado nas operações.

A posição de um objeto no espaço é representada por um vetor. As componentes do vetor irão depender da dimensão, mas em geral serão funções que descrevem o movimento naquele eixo.
## $$\vec{r}(t) = (x(t), y(t), z(t))$$
A posição (representada pelo vetor $\vec{r}$) depende do parâmetro $t$.
$t$ pode ser qualquer parâmetro, mas usualmente representa a passagem de tempo.

##### Exemplo
## $$\vec{r}(t) = (x(t)= 3t, y(t) = t², z(t) = \frac{3t}{2})$$
As funções descrevem a posição da partícula no instante $t$.
As componentes da posição podem ser **literalmente** qualquer função.

### Velocidade
A velocidade era vista anteriormente como uma fórmula simples: $\frac{\Delta S}{\Delta T}$
**CHEGA DESSA FÓRMULA!!!! ACABOU!!**

A manipulação e entendimento da velocidade se tornou algo mais robusto (e talvez complexo).
A velocidade, assim como a posição, é um vetor formado por componentes que descrevem o movimento em cada eixo.

>[!example] O vetor velocidade é sempre perpendicular (reta tangente) ao vetor posição.

Assim como na posição, a velocidade irá depender não somente do parâmetro $t$, mas do vetor posição em si.
**O vetor velocidade é composto, na verdade, pela derivada de cada componente do vetor posição!**

> Como dizem as más línguas: No fundo, é "só" derivar!

A velocidade ser a derivada da posição faz todo sentido, uma vez que a derivada de uma função representa uma taxa, assim como a velocidade (variação de espaço no tempo)!!
O vetor velocidade pode ser decomposto em duas componentes: seu módulo e seu versor.
## $$\vec{v}(t) = \dot{\vec{r}(t)}$$
Também derivando as componentes:
## $$\vec{v}(t) = (x(t)', y(t)', z(t)')$$

### Aceleração
De mesmo modo, podemos obter a aceleração como um derivada da posição, mas sendo a segunda derivada. Portanto, a aceleração também pode ser obtida derivando a própria velocidade.
## $$\vec{a}(t) = \dot{\vec{v}(t)}$$
A aceleração pode ser decomposta em duas componentes perpendiculares: uma tangente ao vetor velocidade e outra normal (perpendicular) à ele.
## $$\vec{a} = \dot{\vec{v}} = \dot{v}\hat{v}+v²\kappa\hat{n}$$
Introduzimos nessa notação a variável $\kappa$, que representa a curvatura na trajetória.
Por meio de manipulação, podemos chegar ao valor de $\kappa$.

## $$ \vec{a} \times \vec{v} = \dot{v}\vec{v}\times\hat{v}+\kappa v²\vec{v}\times \hat{n}$$
A equação pode ser simplificada lembrando do produto vetorial, sabendo que o [[Produto Escalar]] entre dois vetores paralelos é nulo, uma parte da equação é removida.
Para simplificar ainda mais, podemos reduzir o produto vetorial de um vetor com seu versor ao módulo do vetor.

## $$\vec{a} \times \vec{v} = 0+\kappa v²v$$
Então:
## $$|\kappa| = \frac{||\vec{a}\times \vec{v}||}{||v||³}$$
### Torção



### Distância percorrida

