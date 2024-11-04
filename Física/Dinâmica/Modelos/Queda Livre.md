
>[!Danger] DESENHO AQUI

Consideramos um objeto saindo da altura $H$ que irá cair em movimento retilíneo até atingir o solo.
A [[Força Gravitacional]] atua puxando-o para baixo, sendo a causadora do movimento. A velocidade gerada irá atingir um ponto máximo, do qual não irá passar, a chamada **velocidade terminal**. 
Por outro lado, a [[Força Viscosa]] atua no sentido oposto, desacelerando o movimento, dependendo da velocidade do móvel e da massa do fluído.

### Modelagem
Iremos dividir a modelam em dois pontos.
O primeiro desconsidera a força viscosa, o segundo não.
As coordenadas aqui poderão ser simplificadas apenas para um dos eixos, por exemplo o $\hat{k}$, já que o objeto está se movendo apenas verticalmente.

#### Caso 1:
Para iniciar, definiremos as variáveis cinemáticas envolvidas no processo.
- Posição ($\vec{r}$): É dada em relação ao tempo, e apenas possui a componente $z(t)$.
- Velocidade ($\vec{v}$): É a derivada primeira da posição ($\vec{v} = \dot{\vec{r}}$)
- Aceleração ($\vec{a}$): É a derivada primeira da velocidade ($\vec{a} = \dot{\vec{v}}$) e consequentemente derivada segunda da posição ($\vec{a} = \ddot{\vec{r}}$) 

As componentes podem ser escritas como:
#### $$\vec{r} = z(t)\hat{k}$$
#### $$\vec{v} = \dot{\vec{r}} = \dot{z}(t)\hat{k}$$
#### $$\vec{a} = \dot{\vec{v}} = \ddot{z}(t)\hat{k}$$
Como estamos desconsiderando a força viscosa, a única força que precisamos nos preocupar é a gravidade.
Aplicando a segunda lei de Newton (explicada no [[Programa Newtoniano]]), encontraremos as [[Equações Diferenciais Ordinárias]] que modelam o problema. Para esse caso teremos apenas uma EDO.

A segunda lei diz que $\vec{F} = ma$. Devemos, então, substituir os termos que obtivemos.
#### $$\vec{F} = m\ddot{z}(t)\hat{k}$$
A gravidade será representada por $\vec{F_{g}} = -mg$. É importante notarmos que a gravidade está, obviamente, no mesmo eixo $\hat{k}$ da queda livre.
#### $$-mg\hat{k} = m\ddot{z}(t)\hat{k}$$
Pelo milagre de algum divindade (ou da própria física), a componente $m$, que representa a massa do objeto, irá se cancelar. A equação simplificada e reorganizada se torna:
#### $$\ddot{z}(t) = -g$$
