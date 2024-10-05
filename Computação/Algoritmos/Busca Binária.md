Talvez um dos melhores métodos de busca.
Foca em dividir o vetor para encontrar o item desejado.

>[!IMPORTANT] O VETOR PRECISA ESTAR ORDENADO!

### Funcionamento
Dado um vetor com $n$ elementos, encontre o item $k$ e retorne sua posição.
Se o item não estiver no vetor, retorne -1.

Para encontrar o item, é necessário estabelecer margens de busca. No início, as margens são o começo e o fim do vetor (0 e $n$).
Então, deve-se encontrar o meio do vetor e analisar o item ali presente.
- Se o item é maior que $k$, descarte a metade direita do vetor e trabalhe com a esquerda;
- Se o item é menor que $k$, descarte a metade esquerda do vetor e trabalhe com a direita;
- Se o item é igual à $k$, retorne o índice
Esse processo de redefinir as margens a cada iteração garante uma eficiência maior.
Caso a margem inferior fique maior ou igual à superior, pare o algoritmo.
Se o item na posição inferior for igual à $k$, retorne-a.
Se o item na posição inferior não coincide com $k$, retorne -1

### Complexidade

### Implementação em C 

**versão iterativa**
```c
/*
considerar um TAD item com a seguinte estrutura:

typedef struct item {
	int key;
	void* data;
} ITEM;
*/


int binary_search(ITEM* vec[], int size, int target) {
	int bottom = 0;
	int top = size;
	int middle;
	
	while(1) {
		if (bottom > top) {
			return(-1);
		}
		
		middle = (bottom + top) / 2;
		if (item_get_key(vec[middle]) == target) {
			return(middle);
		}
		
		if (item_get_key(vec[middle]) > target) {
			top = middle + 1;
		} else {
			botton = middle - 1;
		}
	}
}
```
