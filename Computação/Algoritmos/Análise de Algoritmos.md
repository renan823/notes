Um algoritmo deve ser correto e terminar.
A sequência de instruções pode estar correta, mas ela se encerra?

> [!example] Algoritmo
>Um algoritmo é uma sequência finita de passos, descritas de forma não ambígua que realiza a operação desejada.

Os recursos necessários são tempo e memória!
O tempo é o principal (quando há algo errado, o erro é quase exponencial!!)
O algoritmo resolve o problema, mas demora uma ano... NÃO USE!

Existem algoritmos que realizam as mesmas tarefas, mas de maneiras diferentes (podem resultar em uma diferença de eficiência)

É necessário um cuidado extra ao tomar decisões:
- Qual máquina foi usada?
- Qual linguagem foi usada?
- O algoritmo "ruim" foi bem implementado?
- O processamento de dados grandes e pequenos é equivalente?

A ideia é generalizar as medições, independentemente de hardware, linguagem...
A análise é do algoritmo, não do programa!

## A ideia básica...
Cadastrar 10 pessoas leva mais tempo que 5... Devemos analisar com base em n elementos.
Com n entradas, deve-se calcular todas as operações a serem realizadas sobre os n elementos.

**O melhor algoritmo é aquele que realiza menos operações e resulta no mesmo resultado!**
Como calcular o custo de métodos de [[Ordenação de Dados]]? E de [[Busca de Dados]]? Quanto custam as operações?

## Operações? Quais?
Um operação é literalmente qualquer coisa (variáveis, loops, comparações, etc)

As operações não levam o mesmo tempo!
Uma leitura de arquivo, por exemplo, é MUITO mais lenta que um printf!

O tempo de cada operação é constante, o que muda é o número de chamadas da operação!
Um algoritmo pode ser representado como uma função com entrada n.
Assim, ao comparar dois algoritmos, podemos dizer em quais pontos cada algoritmo é melhor.

A taxa de crescimento é ponto chave!

## Contas (chatas)
A <strong>Taxa Assintótica</strong> descreve a eficiência quando n é muito grade!
Algumas operações, no entanto, não dependem de n -> constantes!
Conceitos matemáticos -> [[Exponencial]], logaritmos, séries...

Algoritmos com log são excelentes!!!! (geralmente a base é 2, exceto quando especificado)
Exponencial é o pior caso de todos (muito ruim mesmo)

## Notações

#### Big O
A função $T(n)$ representa o algoritmo.
A função $O(f(n))$ é a "big oh" da nossa função.

Nesse caso, é valido dizer que o algoritmo é $O(f(n))$ se existe uma constante e um n inicial maiores que 0.

$$T(n) = O(f(n)) \space \space T(n) \le cf(n)$$

Essa notação nos diz que, começando com um determinado n inicial, a função $f(n)$ (nosso algoritmo) ficará abaixo (ou junto) da função $g(n)$ (função que estamos comparando).
$g(n)$ é o limite superior. 

>[!example] Big O -> Pior caso de execução

  
#### Omega
A função $T(n)$ representa o algoritmo.
A função $\Omega(f(n))$ é a "ômega" da nossa função.

Nesse caso, é valido dizer que o algoritmo é $\Omega(f(n))$ se existe uma constante e um inicial maiores que 0.

$$T(n) = \Omega(f(n)) \space \space T(n) \ge cf(n)$$

Essa notação nos diz que, começando com um determinado n inicial, a função $f(n)$ (nosso algoritmo) ficará acima (ou junto) da função $g(n)$ (função que estamos comparando).
$g(n)$ é o limite inferior.

>[!example] Omega -> Melhor caso de execução


#### Theta
A função $T(n)$ representa o algoritmo.
A função $\Theta(f(n))$ é a "theta" da nossa função.

$$T(n) = \Theta(f(n)) \space \space T(n) = cf(n)$$

Essa notação nos diz que, começando com um determinado n inicial, a função $f(n)$ (nosso algoritmo) ficará junto da função $g(n)$ (função que estamos comparando)


### Analisando casos
É importante ter cuidado ao analisar cada caso. Entretanto, existem certos padrões que se repetem na maioria das vezes.

A maioria dos casos que envolvem loops terão a complexidade do loop!
Analisar bibliotecas de terceiros que estejam sendo usadas no código é uma tarefa necessária, tendo em vista que as documentações fornecem a complexidade de cada função disponível.

Em funções que possuem constantes, as constantes devem ser "ignoradas" -> prevalece o termo de maior grau.

>[!example] Ignorando constantes
>A análise de algoritmos trata de casos onde n é MUITO alto, então as constante são praticamente desprezíveis.


### Recursão (ocorrências)
Para analisar recursões em termos de complexidade é preciso quebrar o problema e encontrar uma equação que representa tal processo recursivo.
Com a equação definida, existem métodos de resolvê-la. Alguns casos fazem uso da [[Indução Matemática]] para provar o resultado/complexidade obtida.

- **Aproximação** -> "chutar" uma complexidade e ver o comportamento da função. Ajustar o valor com o os teste garante um melhor resultado.

