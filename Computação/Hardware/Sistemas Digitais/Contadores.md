São [[Circuitos Sequenciais]] cujo principal objetivo é gerar uma sequência de números, uma contagem. Essa contagem não é necessariamente aquela que conhecemos, indo de 0 a 10, por exemplo. 

Circuitos contadores **precisam** de um método para reiniciar sua contagem, por exemplo aplicando o reset em seus valores. Sem inicializar as memórias corretamente, a contagem pode ser falha devido ao lixo de memória.

Sua contagem é feita com [[Flip-Flops]], principalmente do tipo "T".

### Contadores Assíncronos
Nesses contadores, o clock não chega igualmente aos flip-flops, o que gera um atraso acumulativo. 
Essa solução **não é a ideal**!

![[assets/async-up-counter.png]]
Exemplo de contador assíncrono, com contagem crescente

![[assets/async-dow-counter.png]]
Exemplo de contador assíncrono, com contagem decrescente.

### Contadores Síncronos
São os circuitos com ciclo de clock sincronizado entre todos os flip-flops. O atraso aqui não é cumulativo, mas igual para todos os componentes.
As mudanças de estado serão sentidas apenas no próximo ciclo de clock.

![[assets/sync-up-counter-t.png]]
Exemplo de contador síncrono, com contagem crescente.


![[assets/sync-up-counter-d.png]]
Exemplo de contador síncrono, com contagem crescente. Note o uso de flip-flops do tipo "D". Aqui, os valores são "trocados" (mesmo efeito do flip-flop "T") quando os dois valores anteriores são 0, efeito causado pela porta XOR.


### Contadores com load
Também é possível criar contadores que permitem alterar seu conteúdo via load/reset.
Nesses casos, o load pode ser usado como reset!

![[assets/sync-counter-up-load.png]]
Exemplo de contador síncrono, com contagem crescente. Aqui, ao ativar a entrada "LOAD", os [[MUX]] permitem o carregamento dos valores $D_i, i \in \set{0, 1, 2, 3}$.

### Contadores BCD
São muito úteis para exibir valores em displays.

![[assets/bcd-counter.png]]
Exemplo de contador BCD síncrono, com contagem crescente. Sua contagem exibe um número de dois dígitos quando ligado aos displays.

### Contadores Ring e Johnson
São usados para gerar códigos. Podem ser associados aos decodificadores para gerar outros tipos de saída.

![[assets/ring-counter.png]]
Exemplo de contador ring síncrono.

Para criar um contador Johnson, basta fazer com que a última saída $\bar{Q}$ seja a entrada $D$ do primeiro flip-flop. 