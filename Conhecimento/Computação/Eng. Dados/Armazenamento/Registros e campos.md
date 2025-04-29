
É um método da [[Organização de Arquivos]] para armazenar campos (fixos ou variados) dos registros de dados.

RRN -> Número Relativo do Registro (Relative Record Number)

> Byte offset = rrn * tam_reg

### Remoção de registros
É usada a remoção lógica, que marca o item como removido.
A remoção pode ser feita: 
- Adicionar um * à algum campo, marcando o registro todo como removido
- Adiciona um campo extra, que marca a remoção -> Mais usado

### Busca de registros
Deve usar o byte offset para encontrar o local do registros.
Deve verificar se o registro existe e se não está excluído.
Então os dados são lidos, **byte a byte**, até o último byte válido, que não é lixo

### Inserir registro
Deve verificar se o arquivo existe e se está vazio (sem cabeçalho).
Deve pular para o fim do arquivo.
Deve escrever os dados.

### Remover registro
Deve verificar se o arquivo existe e se está vazio (sem cabeçalho).
Deve achar o registro usando o byte offset.
Caso o registro não esteja "removido", adicione o marcador da remoção.

### Reduzir dados
Para arquivos com muitos bytes vazios (lixo), é útil percorre-lo e salvar seus dados que não são lixo em outro arquivo.


### Remoção dinâmica e reuso de espaço (tam. fixo)
Com registros de tamanho fixo, uma pilha é utilizada para identificar os registros logicamente removidos.

Para remover um registro, marcamos ele como removido, empilhamos seu RRN na pilha e colocamos o antigo topo da pilha no registro atual (para saber quem é o próximo RRN).

Para inserir um novo registro, desempilhamos o RRN na pilha de removidos, pegamos o próximo RRN removido (está no registro do antigo topo) e empilhamos. Por último, inserir o novo registro na posição dada pelo RRN desempilhado. 

##### Buscar por RRN
Abrir o arquivo para leitura.
Verificar se o arquivo possui dados (não está vazio).
Calcular **byte offset** do registro pelo RRN informado.
Caso o byte offset calculado seja de um registro inválido (vazio/removido), exiba "Registro não encontrado".
Caso o registro seja válido, retorne-o.
Fechar arquivo.

##### Remover por RRN
Abrir o arquivo para escrita.
Verificar se o arquivo possui dados (não está vazio).
Calcular byte offset com o RRN informado.
Caso o registro achado não exista / já esteja removido, exiba "Registro não encontrado".
Caso o registro esteja válido, marque-o como removido.
É necessário salvar o topo da pilha nesse registro e o RRN do registro no topo da pilha.
Fechar o arquivo.

##### Inserir novo registro
Abrir o arquivo para escrita.
Verificar se existe algo no topo da pilha de removidos.
Caso exista um topo na pilha, devemos ir até o registro indicado por ele.
No topo, devemos colocar o próximo, que está no registro logicamente removido.
Com o topo ajustado, basta inserir o registro nessa posição.
Caso não haja um topo da pilha, insira o registro no fim do arquivo.
Fechar o arquivo.

##### Imprimir lista de RRNs dos registros removidos
Abrir o arquivo para leitura.
Verificar se existe o topo da pilha de removidos.
Caso exista um topo, exiba-o.
Agora, basta seguir o topo e ir até o registro indicado.
O próximo item da pilha estará no registro indicado.
Exiba este item.
E siga para o próximo, assim sucessivamente até o próximo ser NULL.
Fechar arquivo.

### Remoção dinâmica e reuso de espaço (tam. variável)