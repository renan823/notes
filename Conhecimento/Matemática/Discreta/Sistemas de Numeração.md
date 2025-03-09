Podemos fazer a expansão em base $l$ para qualquer número. Esse tipo de expansão também é usada em [[Lógica Digital]], com a criação de sistemas numéricos que representam o mesmo número em diferentes bases (binária, hexadecimal, etc).

Transformar números entre bases é uma tarefa muito útil em certos casos, como ocorre em todos os sistemas de computação com a base 2.

Essas trocas entre bases seguem, não explicitamente, alguns princípios da [[Aritmética Modular]], com a identificação e trabalho dos restos.

### Base 10 para base N
Transformar um número para outra base é uma tarefa não muito complicada. O processo decorre de divisões sucessivas do mesmo número, que começa sendo dividido pelo valor $n$. O resto é guardado e o quociente originado é dividido novamente por $n$, repetindo o processo até obter o quociente 0.
Para encontrar o número, basta unir cada resto, começando do último até o primeiro.

Note que restos maiores que 10 devem ser "apelidados" por uma letra, uma vez que não é correto representar um algarismo como dois.

$$(25)_{10} = (x)_{3} \implies resto(25/3) \space resto(8/3) \space resto(2/3) \implies (25)_{10} = (221)_{3}$$
Note que os resto são agrupados do fim para o início.

### Base N para 10
O processo inverso é ainda mais simples, e envolve potências de base $n$.

Para cada dígito, começando da direita para a esquerda, multiplique-o por $n⁰$, depois some-o com o próximo dígito multiplicado por $n¹$ e assim sucessivamente.
$$(221)_{3} = (x)_{10} \implies 2 \cdot 3² + 2 \cdot 3¹ + 1 \cdot 3⁰ = 25$$

### Contagem de dígitos
Para descobrir o número de dígitos de $(n)_{10}$ na base $l$, usamos a seguinte regra:
- Se $n = l^x, \space x \in \mathbb{N}$ então $digitos = \lceil \log_{\space l}{n} \rceil + 1$ 
- Senão, $digitos = \lceil \log_{\space l}{n} \rceil$

$$S_{3}(27) = \lceil \log_{\space 3}{27} \rceil + 1 = 3 + 1 =  4$$
No exemplo, vemos que o total de dígitos de $(27)_{10}$ na base 3 é 4.