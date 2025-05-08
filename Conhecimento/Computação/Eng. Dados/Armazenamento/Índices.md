Estrutura de dados que auxilia operações em uma tabela grande de dados, indicando como acessar determinados registros.

>Se o índice cabe em memória, ele deve ser carregado por completo na RAM e, se alterado, reescrito de novo para o disco.
>Porém deve-se tomar as precauções necessárias para evitar perda de dados -> Logs (ações realizadas no arquivo), status de arquivos, etc

- Índice primário: campo sem repetição
- Índice secundário: campo com repetição (mais difícil de lidar)

### Índice Primário Simples 
##### Criação do índice
Índices possuem campos de tamanho fixo! 
- Chave de busca (id): 4 bytes
- Byte offset: 8 bytes

##### Inserção no Índice
Primeiramente, deve-se inserir o registro correspondente no arquivo de dados.
O local da inserção depende das configurações do arquivo, podendo se inserido usando espaços vagos ou no fim do arquivo.

Após a inserção no arquivo de dados, o arquivo de índice recebe a chave e o byte offset correspondente.
É importante inserir a chave ordenadamente no índice.

##### Remoção no Índice
Identifica-se a chave alvo.
A chave deve ser buscada primeiramente no índice.

Após encontrar a posição do registro no arquivo de dados, realizamos a remoção lógica no arquivo de dados.

Após, a chave deve ser removida fisicamente do índice.

##### Busca no Índice
Para qualquer operação de busca, primeiro deve-se começar pelo índice, que permite busca binária das chaves.



