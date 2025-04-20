
### Quantização
O processo de [[Quantização]] ocorre usando matrizes pré definidas para luminância e crominância e aplicando-as nos blocos 8x8.

### Vetorização
Transforma o bloco 8x8 em um vetor de 64 posições.
A vetorização ocorre por ordem de zigue-zague: começo em 0,0; 0,1; 1,0; 2,0; 1,1; 0,2; etc

Codificação por diferença será aplicada no conjuntos dos DCs, ou seja, no índice 0 de cada vetor (gerado pela [[DCT]])
A codificação run-length será aplicada em cada sub-vetor de 63 bits, excluindo o DC.

Por último, codificação estatística -> [[Árvore de Huffman]].

JPEG perde desempenho em imagens com muitas transições de cores -> O algoritmo run length irá trabalhar mais, com menos "agrupamentos", já que os valores não são próximos.
