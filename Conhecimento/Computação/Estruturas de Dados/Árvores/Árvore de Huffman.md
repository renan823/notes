
Utilizada na [[Compressão de Dados]], para codificação de símbolos.
Nós folha representam os símbolos, nós intermediários não.

Para encontrar os símbolos, basta percorrer a árvore, contanto os caminhos para esquerda (0) e para direita (1). Então ao chegar na folha, teremos o conjunto de caminhos que foram feitos (001011 ...) -> Esse é o código!

A árvore evita o problemas dos prefixos.


### Codificação
Para construir a árvore, é necessário obter a frequência de cada símbolo. Criamos uma lista com os símbolos e suas frequências.

Agora, devemos remover os últimos items da lista, somar suas frequências e devolve-los para a lista novamente, repetindo o processo até sobrar apenas 1 item na lista.

Com o procedimento feito, temos 

### Decodificação
A decodificação pode ser feita de dois modos:
- Adicionar a árvore gerada no arquivo comprimido e usá-la para reverter a situação
- Usar uma tabela padrão de símbolos

O primeiro caso gera overhead -> mais bits no arquivo para armazenar a árvore, que, dependendo do arquivo, pode ser absolutamente insignificante

O segundo, evita overhead, mas pode ser genérico demais e não gerar uma compressão ótima.