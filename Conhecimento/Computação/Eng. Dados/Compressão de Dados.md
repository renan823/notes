
Comprimir dados significa reduzir o espaço digital ocupado pela informação, usualmente sem perder a qualidade ou muitos dados da informação original.

### Por que comprimir?
A necessidade de compressão vêm do gap entre demanda e capacidade de armazenamento. 
Os meios usados para a transmissão e armazenamento de dados são limitados! Então, é necessário ajustar dados para que os meios suportem mantê-los.

> Exemplo: livro de 800 páginas (só texto). Cada página contém 40 linhas. Cada linha 80 caracteres de 1 byte -> 800 * 40 * 80 = 2,44 MB.

> Exemplo: vídeos com qualidade de TV (baixa) ocupariam 194GB por 2 horas de conteúdo! Isso é inviável!


### Compressão sem perdas
Chamada de **lossless**. 
É reversível! Dados podem ser revertidos ao original, sem perda de informação.


### Compressão com perdas
Chamada de **lossy**.
Não é reversível. Existe perda de dados, que, com sorte, não é perceptível.
Quanto maior a taxa de compressão, menor a qualidade dos dados (e vice-versa).
Usualmente, a perda de dados ocorre em "locais"/"pontos" que não são tão facilmente detectáveis. 

>Exemplo: ao comprimir um áudio, podemos ignorar ondas que fogem do espectro da audição humana -> não serão ouvidos.

### Teoria da Informação
Qual o menor número de bits para representar informação?
Esse é o papel da **teoria da informação**, uma ferramenta matemática que determina a quantidade mínima de dados para representar certa informação.

> Teorema de Shannon: transferência de informação de canais de comunicação -> existe ruído (o que é informação e o que é ruído?).
> $$H^{n}_{i=1} = -\sum P_i\log_{2}{P_i}$$
> - n é o número de símbolos diferentes
> - P é a probabilidade de ocorrência do símbolo i
> - H é a entropia



