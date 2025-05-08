São tipos diferentes de [[Árvores]], que não seguem o padrão binário.
Sua funcionalidade é muito similar a das [[Árvores 2/3]], permitindo mais de uma chave por nó.

O caso aqui é ainda mais genérico, com cada nó podendo ter até $m-1$ chaves. 
O número $m$ dita o máximo de registros por nó, sendo definido previamente. Cada nó tem no mínimo $m/2$ chaves, e no máximo $m-1$ chaves. Para $m\le4$, a regra do mínimo será quebrada.

![[arvore-b.png]]

### Funcionamento
Árvores B são estruturas usadas na criação de [[Índices]], por serem extremamente versáteis para armazenar dados em memória secundária.

Aqui, cada nó é chamado página. Cada página contém até $m-1$ chaves (preferencialmente ordenados) juntamente de seus valores. 

Ao inserir uma chave na árvore vazia, uma página é criada e a chave é colocada ali. O processo se repete, inserindo ordenadamente as chaves nessa página até atingir o limite. Quando o limite é atingindo, sabemos que a regra $m-1$ chaves foi quebrada, e precisamos arrumá-la. Quando uma página está cheia, é necessário realizar o **split**.

##### Split
É a ação de dividir uma página em outras duas, voltando a árvore para seu estado balanceado e mantendo as regras de limite.
O processo consiste em dividir a página ao meio, destacando a última chave da primeira metade. Essa chave será elevada um nível acima na árvore, enquanto os outros dados já separados se tornarão outras duas páginas, agora devidamente distribuídas e apontadas pela chave movida.