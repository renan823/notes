As listas com nó cabeça são uma melhoria simples nas [[Listas Encadeadas]], possibilitando uma melhor remoção dos items.
Em listas encadeadas simples, a remoção mais trabalhosa é a do primeiro nó, uma vez que ele não tem um nó anterior (o anterior é lista->inicio).

### Funcionamento
Para resolver o problema da remoção, inserimos um novo nó sem valor, que serve apenas como um guia (cabeça) da lista. Agora, lista->inicio sempre aponta para o nó cabeça e não é necessário mudar esse valor. Desse modo, a operação de remover um item se torna mais simples e evita testes para verificar se o nó é o inicial.