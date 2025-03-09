O pêndulo é um ótimo experimento (que pode, inclusive, ser feito no conforto do lar) para entender melhor a ação da [[Força Gravitacional]] e [[Força Viscosa]].

Um pêndulo consiste em um objeto (partícula, bola, vaca esférica...) pendurado por uma haste **não flexível** em uma superfície plana e fixa.
Em estado inicial, o pêndulo encontra-se imóvel. Mas, com um empurrão/peteleco, o mesmo irá se mover na direção da força aplicada. Entretanto, o movimento gerado não será infinito, pelo contrário, a resistência do ar (aqui chamada de força viscosa), irá atuar contra o movimento, reduzindo sua velocidade. 

-> Também pode ser descrito como um [[Oscilador Harmônico]]

### Eixos
Para trabalhar de forma confortável com as (futuras) [[Equações Diferenciais Ordinárias]] do pêndulo, precisamos entender quais suas componentes e como elas irão se comportar durante o movimento.

![[pendulo1.png]]
Preso ao teto, o pêndulo tem um eixo vertical e um horizontal. Aqui chamaremos de $x\hat{i}$ e $y\hat{j}$, respectivamente. 
A haste forma uma ângulo $\theta$ com $x\hat{j}$, tendo o objeto de massa $m$ preso em uma das extremidades. 

No quesito forças, à princípio, identificamos duas: 
- **Força peso (gravidade)**, apontando para baixo e originando-se no centro de massa do objeto. Suas componente podem ser decompostas para melhorar nosso trabalho
- **Força de tração**, originada pela haste em direção ao ponto de origem $O$. É oposta à uma das componentes da gravidade.

As forças encontradas irão se cancelar! Isso indica que não há movimento quando o pêndulo está parado.
Seu equilíbrio será nos pontos 0 e $\pi$, a base e o topo do movimento, respectivamente. Embora a posição em $\pi$ seja muito instável, ainda é um ponto de equilíbrio, com o pêndulo parado.

### Mudança no sistema
Alguns consideram uma mudança no sistema de coordenadas para facilitar a resolução do problema. Porém, nem sempre isso será fácil.
O esquema à seguir representa a mudança para [[Coordenadas Polares]], com os **eixos tangente e radial**, respectivamente chamados de $\hat{\theta}$ e $\hat{R}$.

>[!danger] O DESENHO ESTÁ INCORRETO, AS COMPONENTES ESTÃO TROCADAS!


![[pendulo2.png]]
A mudança permite decompor a força peso $\vec{F_{g}}$ em componentes nos novos eixos criados. A componente em $\hat{R}$ é dada por $mg\cos({\theta)}$, e representa a oposição À força de tração $\vec{T}$. Essas forças irão se anular!
A outra componente, em $\hat{\theta}$, é dada por $mg\sin{(\theta)}$. Essa componente é a responsável pelo movimento e, para a surpresa de zero pessoas, representa a velocidade $\vec{v}$.

O quadro de forças, então, torna-se:
- Tração ($\vec{T}$): Oposta à componente radial da gravidade.
- Gravidade em $\hat{R}$ ($mg\cos{(\theta)}$): Oposta à tração.
- Gravidade em $\hat{\theta}$ ($mg\sin{(\theta)}$): Responsável pelo movimento.