O selection sort (ou ordenação por seleção) é um método de [[Ordenação de Dados]] muito semelhante ao [[Bubble Sort]].
A ação que difere é a movimentação (swap) dos valores, colocando o menor para a primeira posição, o segundo menor na segunda posição e assim por diante.

### Funcionamento
Cada iteração seleciona o menor valor e coloca-o no começo do array.
Depois da iteração "i", o iésimo item estará na posição correta.

Dois laços são necessários. O primeiro, mais externo, itera no tamanho do vetor. o Segundo cuida da comparação do valor.
O valor mínimo será declarado como "i".
Se o valor em "j" for menor que o valor na posição mínimo, então o mínimo agora é "j".
Depois desse laço, se o mínimo for diferente de "i", então troque suas posições (swap).


### Complexidade
Por ter dois laços, o algoritmo é $O(n²)$.
Por percorrer sempre duas vezes (independentemente do caso), sempre será $O(n²)$


### Implementação em C
```c
void selection_sort(ITEM* vec[], int n) {
	ITEM* aux;
	
	for (int i = 0; i < n-1; i++) {
		int min = i;
		
		for (int j = i+1; j < n; j++) {
			if (item_get_key(vec[j]) < item_get_key(vec[min])) {
				min = j;
			}
		}
		
		if (min != i) {
			aux = vec[min];
			vec[min] = vec[i];
			vec[i] = aux;
		}
	}
}
```

