A operação de alongamento do contraste, ou normalização, é um método usado para aumentar o contraste em imagens com tons de cinza.

Para aplicar a equação é necessário definir o maior e menor valor que podem aparecer nos pixels. Geralmente, esses limites serão o permitido pela imagem -> Em casos com pixels de 1 byte, os valores estão entre 0 e 255.

### Função
$$P_{out} = (P_{in}-c)(\frac{b-a}{d-c})+a$$

- a: limite inferior, menor valor que um pixel pode assumir
- b: limite superior, maior valor que um pixel pode assumir
- c: menor valor de pixel presente na imagem
- d: maior valor de pixel presente na imagem

-> Valores menores que 0 são definidos 0, valores maiores que 255 são definidos 255

### Problemas
A função pode "estragar" a imagem muito facilmente: basta um pixel com valor muito alto ou muito baixo para atrapalhar o processamento, levando à uma imagem incorreta. 
Esses casos são os chamados **outliers**.

### Melhorias
Para evitar problemas com outliers, são usados histogramas dos pixels da imagem. Com o histograma definido, pegamos valores próximos às bordas, mas não exatamente nelas. Essa técnica é chamada de percentile stretching.


