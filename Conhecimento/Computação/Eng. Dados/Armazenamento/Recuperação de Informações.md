 
É também uma área da [[Multimídia]].

Necessidade de consumir dados, mas na era atual, são MUITOS dados -> Multimídia Big Data.

Sistemas de recomendação, personalização, sumarização, busca, visualização, navegação, localização, etc.

A melhoria é movida pelas necessidades do usuário.

Como buscar dados sem ter um "termo" alfanumérico? Seria possível buscar dados sobre determinado local dado uma foto do mesmo? Ou então, descobrir o nome de uma música ao tocar um pedaço dela?

### Recuperação de informação
Recuperar documentos que são relevantes para uma determinada consulta do usuário, retornando o **mínimo** de documentos não relevantes possível.

Como recuperar informações multimídia? O que um pixel, por exemplo, representa em uma imagem? Com texto, é possível (e extremamente comum) realizar buscas.
Para o usuário, uma imagem é bem clara. Para o sistema, é apenas um conjunto binário -> gap semântico.

### Extração de características

Propriedades da mídia:
- Visuais: cor, intensidade, textura, local features, etc
- Sonoras: silêncio, timbre, frequências

> Descritores de característica: representar a informação de forma compactada, como um vetor, e um vetor associado para fazer o "match" (busca). Por exemplo, representar uma imagem como histograma de cores ou intensidades.

Características locais: pontos de interesse, por exemplo, um pixel diferente no meio de vários pixels parecidos (cantos e junções T são comprovadamente bons pontos de interesse).

Pontos de interesse: cantos e bordas.

Sistemas como o SIFT, SURF etc.

### Medidas de Similaridade
Permitem comparar os vetores e identificar sua semelhança. 
Alguns casos usam similaridade de cossenos, distância euclidiana, de Manhattan, etc. (depende do caso) 

### Dicionários Visuais
**Content base information retrieval - CBIR** são alternativas às metodologias de recuperação de conteúdo multimídia.

> São chamados de "bag of features" ou  "bag of visual words".

### Avaliação de resultados
O que deve-se medir de um sistema de recuperação de informações?
- Tempo de processamento
- Eficiência (resolveu rápido?)
- Eficácia (resolve o problema?)
- Teve feedback do usuário?

> Proposta de Hull: Baseline de dados multimídia; avaliação estatística

Usar bases de imagem: Corel, ImageCLEF, Flickr

Workshops de avaliação:
- TREC (texto)
- CLEF (texto - cross-language)
- MIREX (música)
- TRECVID (vídeo)
- INEX (XML)

### Medidas de Avalização

##### Precisão e abrangência (precision and recall)
Usa métricas de retorno e calcula uma proporção.

Métricas:
- Verdadeiro positivo: valor retornado e correto.
- Falso positivo: valor retornado, mas incorreto.
- Verdadeiro negativo: valor corretamente não retornado. Não achou, não retorna.
- Falso negativo: valor não retornado, mas deveria ter sido retornado.

$Precision = vp / (vp + fp)$ -> Mede se tudo que foi recuperado está correto.
$Recall = vp/(vp +fn)$ -> Mede se o sistema retornou tudo o que deveria.

> F-Measure: Não privilegia nem P nem R, fazendo uma média harmônica entre elas

Medida $F_1=2 * ((P*R)/(P+R))$.

Para aplicar essas contagem dos resultados, é necessário o "ground truth", presente nas bases de dados. Essas são anotações necessárias para validar e avaliar os resultados.


Para vídeo/imagem, é possível avaliar qualidade, eficiência, etc.

Caso seja necessária avaliação de qualidade subjetiva, ou seja, com participação de pessoas, existem normas que regulam quantas imagens serão mostradas, quantos avaliadores, métodos de avaliar, etc -> ITU-R BT.500, DSQS.

Caso seja necessária avaliação objetiva, existem métodos como o PSNR.
PSNR não dá importância aos pixels, ou seja, todos são equivalentemente importantes.
Isso pode afetar o resultado, já que um grupo importante de pixels pode, para humanos, definir se a imagem está boa ou não.

PSNR varia entre 0 e 100, sendo medido em decibéis.

Não é possível confiar cegamente no PSNR!

