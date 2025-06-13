É a memória de acesso rápido, que armazena dados comumente utilizados, facilitando o rápido acesso à eles.

É implementada com [[Flip-Flops]], sendo um tipo de [[Memória RAM]] (SRAM).

Possui método de acesso associativo, buscando dados pelo conteúdo e não por endereço.
Está presente dentro da [[CPU]], com cada nível mais perto sendo um subnível do nível anterior.

> Arquiteturas modernas possuem L1, L2 e L3, respectivamente, da mais perto à mais distante do processador.

### Princípios de localidade

##### Temporal
Se um conteúdo foi utilizado, ele tem probabilidade de ser usado novamente.

##### Espacial
Se um conteúdo foi utilizado, as posições próximas tem probabilidade alta de serem utilizadas também.

### Conceitos

##### Bloco
É a menor unidade que será transferida de um nível para outro.

##### Acerto (Hit)
O dado é encontrado na cache -> hit rate: taxa de acerto

##### Falha (Miss)
O dado não é encontrado na cache -> miss rate: taxa de falha

##### Penalidade por falha
Tempo necessário para buscar um bloco de um nível inferior para um nível superior, incluindo o tempo de transferência entre os níveis e da inserção no nível que ocorreu a falta.


### Implementação
- Tamanho da cache: deve unir desempenho, custo e capacidade de armazenamento.
- Tamanho do bloco: princípio da localidade espacial (bloco maior, maior acerto)

##### Estrutura da cache
Embora diferentes implementações possuam diferentes estruturas, alguns campos podem aparecer em mais de um caso.

- Tag: identifica de maneira única se um bloco está presente na cache (chave de busca);
- V: Bit de validade que indica se a entrada é válida ou não;
- M: Bit de modificação que indica se o dado armazenado foi modificado;
- Alg: Bits usados para implementar o algoritmo de substituição dos valores;
- Bloco: Palavras trazidas da memória.

##### Algoritmos de substituição
Algoritmos de substituição são necessários quando ocorre colisão entre um bloco presente na cache e um novo que deveria ocupar aquele mesmo lugar. Qual deve ser mantido?

Existem diferentes métodos para aplicar a substituição, visando sempre a permanência dos blocos mais importantes (usados recentemente, por exemplo).

- FIFO: Fila de blocos na ordem de inserção;
- LFU (least frequently used): Remove blocos usados com menos frequência. Cada linha possui um contador de quantas vezes foi utilizada (atualizado a cada acesso);
- LRU (least recently used): Remove blocos usados a mais tempo. Armazena um contador global e salva na linha o "momento" de uso (atualizado a cada acesso).


##### Mapeamento Direto
![[cache_direct.png]]

Mapeia cada bloco para a mesma linha da cache. 
Como o número de linhas é limitado (e bem menor que a RAM), blocos em diferentes posições podem ocupar a mesma posição. 

Linha de cache a ser ocupada:
$$posicao = bloco \mod{linhas}$$

Cada valor enviado a chace será quebrado, e os bits serão usados para identificar as palavras do bloco, a tag (identificador único) e a posição correta na cache.

- Byte offset: deslocamento do byte dentro da palavra. Depende do tamanho da palavra.
- Word offset: deslocamento da palavra dentro do bloco. Depende do tamanho do bloco.
- Index: posição do bloco na cache. Depende do tamanho da cache.
- Tag: identificador único do bloco. Bits que "sobram" após usar os outros casos.

> Não há algoritmo (política) de substituição para o mapeamento direto! Essa ação de sobrescrever diretamente o bloco, sem política explicita, pode ocasionar na retirada de um bloco muito usado para dar lugar à outro que não será tão usado. Isso pode afetar o desempenho da cache.

A busca é feita comparando o índice dado, a tag presente no índice e a tag que está sendo buscada. 

##### Mapeamento totalmente associativo
![[cache_total.png]]

Permite que qualquer linha da RAM seja mapeada para qualquer linha da cache.

Exige um algoritmo de substituição para saber qual bloco será substituído.
O campo "índice" não é necessário na cache.

> Por permitir que qualquer bloco esteja em qualquer linha, os casos de colisão são tratados usando o algoritmo escolhido e assim evita-se a substituição de um bloco importante, por exemplo.

A busca é feita comparando a tag de busca com **todas** as tags presentes na cache. Esse método é muito custoso.

##### Mapeamento associativo por conjuntos
Une o melhor dos dois outros modos de mapeamento.

Permite um mapeamento direto para cada set (conjunto).
Dentro dos conjuntos, o mapeamento é totalmente associativo.

A cache deve possuir $N$ conjuntos, cada qual com o mesmo número de linhas dos outros.

> Por permitir a união do que há de melhor nos outros mapeamentos, esse é o que realmente é implementado.

Na busca, o bloco desejado é comparado com o set, e dentro do set a tag é buscada (comparada com todas as tags daquele set).
A busca é direta para o conjunto, mas exige comparar todas as tags ali dentro.