O bubble sort é um dos métodos de [[Ordenação de Dados]] mais utilizados.
A ideia é intuitiva e não muito difícil de implementar.

### Funcionamento
O algoritmo "flutua" os valores para sua posição fazendo comparações.
A cada iteração, é garantido que o elemento n - i já estará ordenado. 

É necessário percorrer o vetor com dois laços.
O laço externo itera sobre o tamanho do vetor.
O laço interno será executado n vezes, e é responsável for flutuar os elementos.
Se a comparação for satisfeita, então os dois valores comparados são trocados (swap).

### Melhorias
O algoritmo, mesmo não sendo o mais eficiente, pode ser melhorado.
Sabemos que as ordenações se acumulam na ponta (dependendo do método de comparação, pode ser no começo ou no fim do vetor), então basta reduzir o número de iterações do laço menor para j - i.

Outra melhoria é contar o número de trocas. Uma vez que não ocorram mais trocas, pare o algoritmo.

### Complexidade
Existem dois laços no algoritmo, então pode-se concluir, inicialmente que a complexidade é $O(n²)$. 
No bubble sort normal, tanto no melhor como no pior caso, o algoritmo continua sendo $O(n²)$

Porém, o caso otimizado apresenta uma leve diferença nos cálculos, mas que resulta em $O(n²)$ também. 
Nesse caso, o pior caso segue igual.
Mas, no caso em que o vetor já está ordenado, o algoritmo executa 1 vez o laço interno, que por sua vez executa n vezes. Então torna-se $O(n)$

### Implementação em C

Código não otimizado
```c
void bubble_sort(ITEM* items[], int n) {
	ITEM* aux;
	for (int i = 0; i < n; i++) {
		for (int j = 0; j < n-1; j++) {
			if (item_get_key(items[j]) > item_get_key([j+1])) {
				aux = items[j];
				items[j] = items[j+1];
				item[j+1] = aux;
			}
		}
	}
} 
```


Código com otimizações
```c
void bubble_sort(ITEM* items[], int n) {
	ITEM* aux;
	int swaps;
	
	for (int i = 0; i < n && swaps > 0; i++) {
		swaps = 0;
		for (int j = 0; j < n-1-i; j++) {
			if (item_get_key(items[j]) > item_get_key([j+1])) {
				aux = items[j];
				items[j] = items[j+1];
				item[j+1] = aux;
				swaps++;
			}
		}
	}
} 
```