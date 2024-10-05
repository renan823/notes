As listas circulares têm como propósito melhorar a busca em [[Listas Encadeadas]].
Utilizando do mesmo princípio das [[Listas Encadeadas com Nó Cabeça]], aqui, o nó cabeça é chamado de **sentinela**, e será usado como chave de busca.
A diferença também está na organização dos ponteiros, uma vez que o ponteiro "próximo" do último nó aponta justamente para o sentinela, que é o início da lista.

### Funcionamento
Um nó sem valor é inserido no começo da lista  -> ele é o sentinela/cabeça.
O último no sempre apontará para o sentinela, criando um loop de nós conectados.

### Operações
A busca é operação melhorada com esse método.
Para buscar, basta inserir a chave de busca como o valor do sentinela.
Agora, percorremos a lista toda verificando se o elemento atual (valor do nó) é igual à chave desejada. 

>[!IMPORTANT] A chave SEMPRE será encontrada, uma vez que ela existe no sentinela.

Ao finalizar o laço, basta verificar se o nó que possui o resultado é igual ao sentinela. Se a comparação for verdadeira, então a chave indicado não existe na lista. Em caso contrário, o item foi encontrado. 
Essa verificação indica que percorremos toda a lista e voltamos ao sentinela. Nesse caso, o item só existe no sentinela, sendo a própria chave de busca.

Com essa melhoria, a busca, que antes comparava a existência do próximo nó (1) e a equivalência dos valores (2), agora só verifica os valores, reduzindo pela metade o número de comparações necessários. A única comparação extra é a verificação nó == sentinela.

Antes: $2n$ -> $O(n)$
Depois: $n+1$ -> $O(n)$
