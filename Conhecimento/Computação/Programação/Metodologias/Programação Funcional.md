Paradigma de programação que foca em definir o que as coisas são, não o que elas fazem.

A maioria das linguagens modernas, mesmo não sendo funcionais, incluem e permitem que o usuário use diversas opções funcionais. A ideia é misturar e incluir os benefícios funcionais nas linguagens.

Se fossemos comparar a utilidade e segurança de linguagens como eixos de um gráfico, teríamos [[C]] na extremidade mais útil, porém menos segura. Por outro lado, na outra extremidade, estaria [[Haskell]] (puramente funcional), muito seguro, porém quase inútil para problemas "reais".
A extensa maioria das linguagens de programação estaria entre essas duas.

Problemas podem ser resolvidos SEM programação funcional! Mas, existem casos em que a solução funcional é melhor!


### História
A **Máquina de Turing** foi o modelo desenvolvido pelo matemático Allan Turing, que foi capaz de provar que qualquer coisa que possa ser computado pode ser resolvido pela maquina de Turing. 

De outro lado, o matemático Church desenvolveu o conhecido **lambda calculus**, que mostrava como resolver problemas de modo funcional.

Ambas as propostas foram excelentes, com resultados ótimos. Contudo, o surgimento da [[Arquitetura de Von Neumann]] permitiu que a máquina de Turing fosse implementada, e o lambda calculus foi deixado de lado.

Desse modo, as linguagens não funcionais surgiam aos montes (e até hoje são maioria).


### Por que funcional?
Como o nome sugere, funcional deriva de funções.
Mas, não apenas uma função qualquer! Programação funcional usa o **conceito matemático de função**!

Uma função mapeia elementos de um conjunto A (domínio) para um conjunto B (contradomínio). Cada elemento em A **deve** estar associados à um elemento em B, um e apenas um.

De modo funcional, as funções puras! Ou seja, não existe um código ali dentro que você não saiba o que faz, ou então o porque está ali. Haskell, por exemplo, não permite muitos recursos que, dentro de funções que em C, seriam totalmente comuns.

> Exemplo: Considere uma função em C para calcular o seno. Matematicamente, $sin(42)$ é sempre o mesmo, não importa o número de vezes que isso ocorra. Por outro lado, na implementação feita em C, não sabemos ao certo o que ocorre ali dentro. E se, por acaso, o programador esquecer de desalocar um vetor? Ou então, como saber se uma variável global não foi usada? 
> Todos esses fatores trazem insegurança à uma simples função seno.

>Exemplo: Uma função que recebe um nome exibe uma mensagem "Olá, {nome}" **não é funcional!** Por outro lado, podemos adaptar a função para torná-la funcional. Para isso, ao invés de exibirmos o valor, iremos retornar a string com o nome. 
>As funções servem para o mesmo propósito, mas uma segue o padrão funcional, a outra não.

**Em linguagens funcionais temos certeza do que acontece nas funções, afinal são funções matemáticas!** Teremos certeza de que o resultado é o esperado, sem desvios ou variações.

Não há risco de, dentro de uma função, haver algum código que não faz parte ou não deveria estar ali -> Essa é a mágica de linguagens funcionais!



