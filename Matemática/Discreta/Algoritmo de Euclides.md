Método eficiente para calcular o [[MDC]].

### Funcionamento
Dados dois valores $a$ e $b$, o objetivo é descobrir seu mdc. Para isso, basta colocá-los em uma sequência vertical, com o maior acima do menor. 
Agora, realizaremos divisões sucessivas nesses valores, começando a dividir o maior pelo menor. Em outra linha vertical, armazene/indique o quociente usado. Após a divisão, coloque o resto como próximo item da lista. Dívida o valor anterior pelo resto, guarde o quociente e posicione o novo resto. O método se repete até encontrar resto 0. O resto antecessor ao 0, é o mdc.

