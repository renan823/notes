
É um exemplo das [[Árvores Binárias]], utilizada na [[Compressão de Dados]], para codificação de símbolos.
Nós folha representam os símbolos, nós intermediários não.
aqui, não há mecanismos de balanceamento, mas estratégias podem ser adotadas pare gerar melhores resultados (códigos menores).

Para encontrar os símbolos, basta percorrer a árvore, contanto os caminhos para esquerda (0) e para direita (1). Então ao chegar na folha, teremos o conjunto de caminhos que foram feitos (001011 ...) -> Esse é o código!

A árvore evita o problemas dos prefixos.

