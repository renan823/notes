São variações das [[Árvores B]], que agora controlam o arquivo de dados.

Pode ser implementada usando a versão tradicional ou a seguindo as regras das [[Árvores B*]].

Essa varição aplica no arquivo de dados o que suas outras versões faziam somente no índice.

> Na árvore B+, os nós folhas **são o páginas do arquivo de dados**

Os nós não folha seguem o padrão definido (B ou B*) e armazenam as chaves.

Existem separadores que identificam as diferentes páginas. 
O separador deve ser definido a partir da primeira (ou última )chave da página de dados que representará. Separadores não cobrem o texto completo da chave, apenas um pedaço da string que o torne único entre separadores.
Por exemplo:
 - Nó 1: registros de Adam até Beatriz
 - Nó 2: registros de Bia até Carlos
 - Nó 3: registros de Carol até Diana

Para criar o identificador entre 1 e 2, a menor string diferente é "CARL" (se fosse "CAR", seria ambíguo).

Os separadores se tornam os nós intermediários, que constroem a árvore B.

Para executar uma busca, percorre-se a árvore ATÉ A RAIZ, afinal, o dado está lá.
Mesmo que a chave seja encontrada em um nó intermediário, deve-se ir até a raiz, para então ter acesso ao dado propriamente dito.

Ao conflitar em overflow, ocorre a criação de um novo nó e a redistribuição das chaves. Porém, **não há promoção de chaves**, uma vez que a chave do nó é um separador.

Ao conflitar em underflow, ocorre a concatenação (envolve nós pai e irmão) e ajuste dos nós separadores quando necessário (uma vez que ele não será mais necessário para delimitar os nós que foram concatenados).