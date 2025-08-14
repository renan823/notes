São tipos diferentes de [[Árvores]], que não seguem o padrão binário.
Sua funcionalidade é muito similar a das [[Árvores 2/3]], permitindo mais de uma chave por nó.

Amplamente utilizadas em [[Bancos de Dados]], por permitir a criação de [[Índices]] não lineares que acomodam chaves inteiras ou alfanuméricas.

### Definição
Uma árvore B é uma estrutura de dados com as seguintes propriedades:
- A ordem `m` da árvore é o número de ponteiros por nó;
- Cada nó tem `m - 1` chaves e `m` ponteiros (para nós filhos);
- As chaves de um nó **estão ordenadas**;
- Cada nó tem até `m` filhos;
- Cada nó interno (não é folha nem raiz) tem no mínimo $\lceil m / 2 \rceil$ filhos;
- A raiz possui pelo menos `2` filhos, exceto se for uma folha;
- Todas as folhas estão no mesmo nível;
- Folhas não possuem filhos;
- Folhas possuem pelo menos $\lceil m / 2 \rceil -1$ chaves.

> O pior caso de operação numa árvore B é com o mínimo de nós


A altura da árvore pode ser calculada levando em conta a número de chaves a serem inseridas (`n`) e o número de chaves por nó `m`: $d \le 1 + \log \lceil m / 2 \rceil ((n + 1) / 2)$.

> Uma árvore com 512 chaves por nó, armazenando 1.000.000 chaves, teria 3 níveis.

### Estrutura
Na árvore B, cada nó é chamado de **página de disco**.
A construção da árvore é sempre das folhas para a raiz (**bottom up**), o que mantém a árvore sempre **balanceada**.

> Nó: sequência de chaves e "ponteiros" para outros nós (n° chaves + 1)

A árvore B deve ser armazenada em um arquivo, com alguns metadados presentes no cabeçalho (por exemplo, o nó raiz, capacidade, etc).

![[no_arv_b.jpg]]

-> $K_n$ = chave de busca do item;
-> $Rn$ = RRN ou byte offset do registro no arquivo de dados;
-> O nó raiz da árvore deve ser armazenado no cabeçalho do arquivo de índice.


### Split
É a ação de dividir uma página em outras duas, voltando a árvore para seu estado balanceado e mantendo as regras de limite.
O processo consiste em dividir a página ao meio, destacando a última chave da primeira metade. Essa chave será elevada um nível acima na árvore, enquanto os outros dados já separados se tornarão outras duas páginas, agora devidamente distribuídas e apontadas pela chave movida.

### Promotion


### Operações
A árvore B possui modos específicos de realizar as principais operações: busca, inserção e remoção de chaves.

##### Busca
Para buscar uma chave `k` deve-se realizar o procedimento recursivamente, iniciando pelo nó raiz da árvore.
```
[Procedimento de Busca]

Caso o nó seja -1 (null):
	- Não achou;
	- Pare.

- Realizar busca binária nas chaves do nó;

Caso achou chave:
	- Como a chave está junto do offset, basta acessá-lo;
	- Pare.

Caso não achou chave:
	- Identificar a posição em que a chave deveria estar;
	- Seguir o ponteiro para o nó correspondente da posição;
	- Inicar a busca novamente, passando próximo nó.
```

##### Inserção
Para inserir uma chave `k` na árvore, deve-se iniciar com um busca pela raiz, inserindo somente em nós folha.
```
[Procedimento de Inserção]

// Antes da busca
Caso a árvore esteja vazia:
	- Criar um header;
	- Criar um novo nó vazio;
	- Inserir a chave no nó;
	- Atualizar o cabeçalho, colocando o nó como raiz;
	- Pare.

- Realizar busca e achar nó da inserção

Caso haja espaço no nó:
	- 
```


### Árvore B virtual
Funciona exatamente como a árvore B, com a adição de um **buffer pool** para facilitar as operações.
De maneira geral, uma árvore B virtual mantém mais páginas (nós) na memória principal, para evitar acessos no disco.

> Geralmente um buffer pool reserva de 25 à 30% da memória RAM para operar.

A realizar uma operação de busca, busca-se primeiramente no buffer pool. Caso a chave não esteja em nenhuma das páginas já armazenadas em RAM, é necessário acessar o disco.

Existem diversas políticas para substituir páginas da RAM quando o espaço do buffer pool está cheio.
