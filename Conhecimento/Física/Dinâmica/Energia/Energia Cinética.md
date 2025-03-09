É a energia relacionada ao movimento.
Pode ser obtida usando partes do [[Programa Newtoniano]] e da [[Cinemática]].

É apenas uma das formas de energia, podendo converter-se em outras formas (realização de [[Trabalho]]).

Da segunda lei, tiramos que $\vec{F} = \dot{\vec{p}}$. A expressão pode ser manipulada via integração em relação ao tempo $t$ (variação de tempo entre $t_0$ e $t$).
$$\int_{t_0}^{t} \dot{\vec{p}} \cdot d\vec{r}$$
Agora, é possível integrar com relação a $\dot{\vec{p}}$, já que conhecemos sua derivada. Na mesma manipulação, é possível "mover" a derivada para a outra componente (não faça isso perto de matemáticos).
$$\int_{t_0}^{t} \frac{d\vec{p}}{dt} \cdot d\vec{r} = \int_{t_0}^{t} \frac{d\vec{r}}{dt} \cdot d\vec{p}$$
Essa movimentação permite simplificar a derivada por uma componente já conhecida, a velocidade.
$$\int_{t_0}^{t}\vec{v} \cdot d\vec{p}$$

Existe, também, outra relação tirada da quantidade de movimento: $\vec{p} = m\vec{v}$ , que também pode ser escrita como $\vec{p} = m\frac{d\vec{v}}{dt}$.
$$m\int_{t_0}^{t}\vec{v} \cdot d\vec{p} = m\int_{t_0}^{t}\vec{v} \cdot d\vec{v}$$

A equação obtida pode ser manipulada usando [[Produto Vetorial]], resultando em uma velha conhecida, a "fórmula" da energia cinética.
$$m\frac{\vec{v}\vec{v}}{2} = \frac{m||\vec{v}||^{2}}{2}$$

**Análise dimensional**
$$\frac{[M][L²]}{[T²]}$$