Uma equação diferencial é um tipo de equação matemática que inclui alguma função e suas [[Derivadas]] no meio das operações.
A função é desconhecida e, consequentemente, suas derivadas também.
O objetivo da resolução é descobrir como essa função é composta.

O nome "ordinária" indica que sempre haverá apenas **uma** variável independente na equação. Para múltiplas variáveis, temos às [[Equações Diferenciais Parciais]].


Exemplo:
### $$\frac{dy}{dx} - y' = 0$$

A equação acima depende de $y$ de de sua derivada em relação à $x$. Aqui, $x$ é a variável independente.
O apelido carinhoso (que também evita ficar repetindo "equação diferencial ordinária") é EDO.


>[!Example] Ordem da equação
>A ordem da equação é sempre dada pela derivada de maior ordem ali presente.

>[!Example] Grau da equação
>O grau da equação sempre será dado pelo expoente da derivada de maior grau.


### Resolvendo uma EDO
Ter conhecimento sobre as derivações básicas é um passo importantíssimo na resolução de EDO. Por isso, é importante conhecer alguns comportamentos básicos, principalmente os casos envolvendo [[Exponencial]] e [[Trigonometria]]. Algumas [[Técnicas de Derivação]] são igualmente importantes.

O conhecimento prévio permite um chute menos randômico e com maior probabilidade de acerto. O palpite em questão refere-se à uma possível função que, ao ser derivada, satisfará nosso problema.

Em muitos casos, é necessário encontrar algo "cíclico", que será indicado por alguns tipos específicos de derivadas. As [[Integrais]] também são muito úteis, uma vez que a verificação dos resultados pode ser feita usando-a (por ser o oposto da derivada).
O [[Teorema Fundamental do Cálculo]] é outra ferramenta no "kit para solucionar uma EDO", permitindo algumas manipulações envolvendo as equações.


>**Exemplo 1:**
>Encontrar a função que satisfaz $\frac{dy}{dx} -y = e^{2x}$.
>
>Um bom começo é notar a presença do exponencial. Isso ajuda à tomar caminhos na resolução, considerando a natureza da derivada de $e$. 
>Um bom palpite seria o próprio $e^{x}$! Mas, existe uma constante (2) acompanhado $x$ que não surgiria desse processo!
>
>Outro palpite é tentar o mesmo valor $e^{2x}$, já que assim a constante está ali e poderá (vamos verificar) permanecer igual.
>Então, aplicando a **regra da cadeia**: 
>$$f(x) = e^{2x} \implies \frac{d}{dx} = e^{2x}2 = 2e^{2x}$$
>Podemos substituir esses novos dados na equação para ver se faz (algum) sentido.
>$$2e^{2x} - e^{2x} = e^{2x}$$
>Bingo! O chute foi certeiro e encontrou a solução para a EDO.

O exemplo foi algo simples, provavelmente bem diferente daquilo que será abordado em problemas físicos, por exemplo. A ideia é praticamente a mesma, entretanto.

>[!Warning] Importante
>Em casos de funções que retornarão nelas mesmas em algum momento da derivação, o trabalho com exponencial geralmente envolve [[Número Imaginários]], o que não é tão trivial. 
>A maioria dos casos poderá ser tratado com senos e cossenos.




