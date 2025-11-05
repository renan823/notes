Conjunto de técnicas utilizadas para a redução de um arquivo de imagem, podendo ou não ter perda de informação.

A compressão é baseada nas **redundâncias** presentes na imagem.

### Redundâncias
**Redundância estatística:** leva em conta a distribuição de valores na imagem, podendo aplicar métodos de compressão estatística -> [[Codificação de Huffman]].

**Redundância Espacial:** leva em conta a característica de um pixel e de seus vizinhos. É relativamente possível predizer valores de pixels baseado em seus vizinhos. A remoção da redundância espacial é feita por [[Codificação por Carreira]] e [[Codificação por Diferença]].

**Redundância Psicovisual:** leva em contas as limitações da visão ([[Sistema Sensorial]]). A visão humana possui limitações e pontos de atenção (casos em que a diferença é mais perceptível). Os casos de importância incluem:
- Maior relevância da luz sobre a cor
- Maior percepção de distorções em áreas escuras
- Maior percepção de distorções em áreas suaves

As redundâncias psicovisuais são removidas usando a [[Quantização]], que gera uma perda real (quantitativa) e irreversível na imagem.

### Codificação JPEG
![[jpeg_compression.png]]