É uma evolução do [[Vídeo Analógico]], que já não é mais usado atualmente.
Embora seja uma melhoria, ainda possui alguns pontos que foram trazidos do vídeo analógico.

Para utilizar em um computador, o sinal analógico do vídeo precisa ser digitalizado.

#### Amostragem temporal
Quanto maior a taxa de amostragem, melhor o movimento, mais suave.
Porém, ao aumentar a taxa de quadros e a qualidade da imagem, o tamanho do arquivo (quantidade de dados) aumenta também!

### Codificação
- Modelo espacial: [[Compressão de Imagens]], como o JPEG.
- Modelo temporal: predição temporal (quadro anterior e/ou posterior) estimativa de movimento.

> [[Codificação de Huffman]], [[Codificação por Carreira]] e [[Codificação por Diferença]]

##### Quadro I (Iframe)
São codificados individualmente, sem nenhuma referência a outros quadros.
As componentes Y, Cb e CR são codificadas usando o modelo JPEG.

##### Quadro P (Predicted)
São codificados em relação ao conteúdo de um quadro anterior, seja I ou P.

Usa combinação de estimativas e compensação de movimentos -> melhor compressão.

Quadros P **vão** propagar erros! Deve-se limitar o o número de quadros P entre quadros I.

> Compressão de 20:1 até 30:1

##### Quadros B (Bidirectional)
São codificados usando os quadro I ou P anteriores e posteriores.

Envolve o processamento de 3 quadros: o anterior, o atual e o posterior

É mais demorado (delay), porém não propaga erros.

> Compressão de 30:1 até 50:1


##### Compensação de movimento
Consiste em achar regiões na imagem que podem ser encontradas nas imagens seguintes/anteriores

Divide-se a imagem em macro-blocos, de Y, Cb e Cr. (blocos geralmente de 8x8, sendo 4 blocos Y, 1 Cb e 1 Cr).

> Block matching -> best match

