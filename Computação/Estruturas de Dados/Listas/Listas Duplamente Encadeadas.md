Assim como as [[Listas Encadeadas]], a lista apresenta nós conectados.
Mas, como o nome sugere, cada nó agora tem duas ligações: o anterior e o próximo.

As listas duplas podem ser utilizadas em casos onde a navegação nos dois sentidos é necessária (por, exemplo uma playlist).

As operações (algumas) podem ser mais complexas, porém, alguns casos são beneficiados pela presença da dupla ligação.

As operações continuam equivalentes às [[Listas Sequenciais]] (ou seja, a interface permanece igual).

### Funcionamento
A lista pode estar ordenada ou não, o que afeta as funções de busca, inserção e remoção.
Ao criar o [[TAD]] nó, deve-se alterar suas propriedades, colocando os campos de anterior e próximo.