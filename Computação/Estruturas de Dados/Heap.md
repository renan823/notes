Heaps são tipos de [[Árvores Binárias]] com regras especiais.
Não deve-se confundir com a memória heap, usada na alocação dinâmica de variáveis.

A estrutura pode ter dois tipos de ordem:
- Heap máximo: Cada nó deve ser maior que seus filhos;
- Heap mínimo: Cada nó deve ser menor que seus filhos;

A regra para a forma de uma heap é diferente para os diferentes níveis da árvore.
Até o penúltimo nível, todos os nós devem ter filhos (estarão completos).
No último nível não é obrigatório que os nós possuam filhos, mas, se possuírem, deverão estar o mais a esquerda possível.

### Representação por vetor
As heaps podem ser representadas como um vetor, obedecendo regras especiais.

Os filhos de um nó $k$ serão:
- filho esquerdo: $2k+1$
- filho da direita: $2k+2$

O pai de um nó pode ser encontrado com $(k-1)/2$

E todas as folhas (nós sem filhos) estarão em $n/2$ em diante.
