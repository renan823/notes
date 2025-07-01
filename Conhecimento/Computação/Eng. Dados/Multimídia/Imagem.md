São as representações visuais do mundo que nos cerca.
São capturadas pelo [[Sistema Sensorial]] e interpretadas pelo [[Sistema Nervoso]], atribuindo, assim, um significado para aquele conjuntos de ondas eletromagnéticas.

### Representação de imagens
Para um computador, uma imagem é apenas mais um amontoado de bits.

É necessário "organizar" os bits para que representem aquilo que conhecemos como imagem. Para isso, existem diversas técnicas, algumas mais simples e outras mais elaboradas.

Imagens podem ser representadas como gráficos (gerados pelo computador) ou por capturas do mundo real (fotos, documentos) que foram digitalizados.

Em memória RAM, imagens geralmente são uma matriz de pixels. Para disco, seu formato pode mudar.

##### Bitmaps
São formas simples de armazenar imagens, guardando exatamente a mesma matriz de pixels da RAM. 
É um método simples,e não precisa ser "interpretado", entretanto é menos eficiente (arquivos maiores).

##### Scalable Vector Graphics (SVG)
São arquivos muitos usados para representar imagens geradas pelo computador.
Seus dados seus dados são armazenados na forma de vetores (exigem interpretação).

Muito usado no contexto da web para diminuir o tráfego de rede.

##### Fotos
Geralmente obtidas da digitalização de algo do mundo real.

Podem ser armazenadas de diversas formas, mas geralmente envolvem técnicas de compressão.
Cada formato de arquivo apresenta suas próprias técnicas para armazenar e ler esses dados.

> Exemplos: GIF, JPEG, PNG


### Luz e cores
Imagens usualmente são representadas por um conjunto de pixels R, G e B (red, green e blue). 
Esse método é muito usado em telas LED, e permitem a criação de diversas cores usando apenas as 3 cores primárias. A mistura das 3 cores resulta em **branco**.

Diferentemente da luz, os pigmentos principais são Y, M e C (yellow, magenta e cyan).
É utilizado quanto há mistura de pigmentos. A combinação das 3 cores resulta em **preto**.

> Para a interpretação humana, a luz é mais importante que a cor.

As componentes luz e cor da imagem recebem os nomes, respectivamente, de **luminância e crominância**.

Imagens podem ter diferentes canais de cor, o que dita sua coloração. Imagens de tom contínuo podem ser **monocromáticas** ou **coloridas**.
No caso da imagens branco e preto, o que prevalece é o contraste entre luz e sombra.

Para uma manipulação de imagens que leve em conta às características do olho humano, o padrão YCbCr é utilizado.

- Y: **Luminância.** Qualidade deve ser mantida alta, afinal, é mais perceptível.
- Cb: **Crominância azul.** Diferença do azul. Pode ter qualidade menor.
- Cr: **Crominância vermelha.** Diferença do vermelho. Pode ter qualidade menor.

Para converter entre RGB e YCbCr:
$$
\displaylines{
Y=0.299R+0.587G+0.114B \\ 
Cb=128−0.168736R−0.331264G+0.5B \\
Cr=128+0.5R−0.418688G−0.081312B}
$$

> **YCbCr é mais eficiente para realizar [[Compressão de Imagens]]**