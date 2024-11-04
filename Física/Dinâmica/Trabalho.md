Está relacionado à realização de movimento.
O trabalho esta diretamente ligado à troca entre diferentes tipos de energia, como [[Energia Mecânica]] para [[Energia Cinética]], etc.

Também é relacionado na [[Termodinâmica]], cuja primeira lei relaciona a perda de energia à realização de trabalho.

O trabalho $\omega$ é o custo necessário para mover um corpo.
Usualmente o denotamos por $W = \vec{F}d\cos(\theta)$, ou seja, força aplicada vezes distância percorrida. Nesse caso, a força deve estar na direção do movimento (cosseno do ângulo).

![[trabalho.png]]
Estamos interessados na trajetória gerada por $\vec{r}$, e em como as forças resultantes estão aplicadas ali.

A relação entre forças e a trajetória irá gerar o torque $W$ que buscamos.
##### $$W = \int_{t_{o}}^{t_{f}}\vec{F}.d\vec{r}$$
Integrando, no tempo inicial até o final, o produto da trajetória pela força, obtemos o trabalho realizado pelo objeto.
Porém, a equação pode ser ajustada (usando conhecimentos sobre a segunda lei do [[Programa Newtoniano]]) para então resultar em uma conhecida componente física, a [[Energia Cinética]].

Considerando $\vec{F} = \dot{\vec{p}}$ :
##### $$W = \int_{t_{o}}^{t_{f}}\dot{\vec{p}}.d\vec{r} $$
Faremos a derivada de $\vec{p}$, que poderá ser (atenção, matemáticos morrem pela afirmação) "passada" como divisor de $d\vec{r}$.
##### $$W = \int_{t_{o}}^{t_{f}}\frac{d\vec{p}}{dt}d\vec{r}  = \int_{t_{o}}^{t_{f}}d\vec{p}\frac{d\vec{r}}{dt}$$
Existe, também, outra relação tirada da quantidade de movimento: $\vec{p} = m\vec{v}$ , que também pode ser escrita como $\vec{p} = m\frac{d\vec{v}}{dt}$.
##### $$W = m\int_{t_{o}}^{t_{f}}dp.\vec{v} = m\int_{t_{o}}^{t_{f}}d\vec{v}.\vec{v}$$
Por meio de manipulações envolvendo o [[Produto Vetorial]], iremos obter 
##### $$m\frac{\vec{v}\vec{v}}{2} = \frac{m||\vec{v}||}{2}$$
