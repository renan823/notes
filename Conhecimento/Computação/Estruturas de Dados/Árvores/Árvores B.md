São tipos diferentes de [[Árvores]], que não seguem o padrão binário.
Sua funcionalidade é muito similar a das [[Árvores 2/3]], permitindo mais de uma chave por nó.

Amplamente utilizadas em [[Bancos de Dados]], por permitir a criação de [[Índices]] não lineares que acomodam chaves inteiras ou alfanuméricas.

![[arvore-b.png]]

- Cada nó é chamado página de disco (~4KB);
- A árvore é balanceada;
- Sua construção é sempre das folhas para a raiz (bottom up).


Ao inserir uma chave na árvore vazia, uma página é criada e a chave é colocada ali. O processo se repete, inserindo ordenadamente as chaves nessa página até atingir o limite. Quando o limite é atingindo, sabemos que a regra $m-1$ chaves foi quebrada, e precisamos arrumá-la. Quando uma página está cheia, é necessário realizar o **split**.

> Nó: sequência de chaves e "ponteiros" para outros nós (n° chaves + 1)

A **ordem** da árvore é definida pelo número de ponteiros por nó. O número máximos de ponteiros é o número máximo de filhos.

![[no_arv_b.jpg]]

-> $K_n$ = chave de busca do item;
-> $Rn$ = RRN ou byte offset do registro no arquivo de dados;
-> O nó raiz da árvore deve ser armazenado no cabeçalho do arquivo de índice.
##### Split
É a ação de dividir uma página em outras duas, voltando a árvore para seu estado balanceado e mantendo as regras de limite.
O processo consiste em dividir a página ao meio, destacando a última chave da primeira metade. Essa chave será elevada um nível acima na árvore, enquanto os outros dados já separados se tornarão outras duas páginas, agora devidamente distribuídas e apontadas pela chave movida.

### Árvore B virtual
Funciona exatamente como a árvore B, com a adição de um **buffer pool** para facilitar as operações.
De maneira geral, uma árvore B virtual mantém mais páginas (nós) na memória principal, para evitar acessos no disco.

> Geralmente um buffer pool reserva de 25 à 30% da memória RAM para operar.

A realizar uma operação de busca, busca-se primeiramente no buffer pool. Caso a chave não esteja em nenhuma das páginas já armazenadas em RAM, é necessário acessar o disco.

Existem diversas políticas para substituir páginas da RAM quando o espaço do buffer pool está cheio.
