Surge da indústria televisiva, com as transmissões de TV.

A imagem é capturada através de uma leitura sequencial dos valores de brilho de uma série dos pontos que a compõem. Esse processo é a **varredura (scanning)**, responsável por gerar um sinal analógica (voltagem), representando o brilho de um ponto da imagem.

Se o processo é feito de 30 a 60 vezes por segundo, a imagem é contínua.
A leitura é feita linha por linha, e o reposicionamento da leitora no início do frame é o chamado **retraço**, tempo "vago" que pode ser usado para inserir, por exemplo, legendas.

#### Parâmetros de varredura
- Taxa de aspecto: razão entre largura e altura, geralmente 16:9
- Número de linhas: número de linhas da varredura - 525 (EUA) e 625 (Europa)
- Taxa de quadros: taxa de quadros por segundo, geralmente 25 a 30. Pela taxa baixa, gera-se o efeito de oscilação (flickering)

> Para evitar flickering, foi usada a técnica do entrelaçamento (interlace), que faz a varredura em linhas pares e impares separadamente. Cada campo da do frame (pares ou ímpares) são transmitidos de uma vez, gerando um frame com resolução inferior, mas de envio mais rápido que 30 fps. Como um frequência maior, o olho humano dificilmente perceberá a falta das linhas nos campos.

#### Sistemas de cores
- Vídeo composto: RGB
- Vídeo componente: Luminância e crominância (YPbPr)

Padrões utilizados:
- NTSC: National Television Standards Committee, envia dados usando os gaps entre ondas, para não coincidir cor e luz. Era muito suscetível  às variações do clima, aviões, etc (carinhosamente apelidado de Never Twice the Same Color, pela instabilidade).
- SECAM: Systeme En Coleur Avec Memoire, usa o padrão europeu de linhas/quadro, e tem o apelido de System Essentially Contrary to The American.
- PAL: Phase Alternate Line, criado pelos alemães e ingleses. É mais recente, e tem o apelido de Perfect At Last.