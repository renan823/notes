O quicksort é um método de [[Ordenação de Dados]] que apresenta algumas melhorias em relação ao [[Bubble Sort]].

### Ideia básica
O algoritmo funciona por particionamentos, ou seja, criando subvetores.
Dado um pivô, coloque-o em sua posição.
Agora, divida o  vetor em outros dois menores (antes e depois do pivô).
Repita esse paço até ter o vetor principal ordenado.


### Partição
Para funcionar, o quicksort precisa dividir os vetores usando um pivô.
Caso o pivô não seja o fim do vetor, é necessário movê-lo para lá (swap com o último elemento).
Com o pivô selecionado, deve-se percorrer o vetor do início ao fim.
Uma variável de índice deve verificar se o valor na posição atual é menor que o valor do pivô. Caso ocorra, aumente esse índice e troque o item  em "i' pelo item em "j".
Ao encerrar o laço, o pivô deve retornar à posição correta.
O local certo é indicado pelo índice auxiliar (i+1).
O retorno da partição é o local correto do pivô.

### Funcionamento
Antes de iniciar o processo, deve-se "escolher" um valor pivô. 
Esse valor será a base para as trocas e comparações.

>[!example] Escolha do pivô
>Até aqui, a escolha pode ser "aleatória", mas existem melhorias (ver abaixo)

-> Assumindo que o pivô é o meio do vetor!

A ideia do algoritmo é o clássico **dividir para conquistar**.
Com o pivô definido, dois índices são criados.
O primeiro "j" percorre todos os valores iniciando em 0.
O segundo "i" começa fora do vetor, e só é alterado quando valor na posição j for menor que o pivô. 
Quando o valor na posição j é menor que o pivô, além de modificar o índice i, o algoritmo deve trocar (swap) os valores de posição.
Ao fim da iteração, todos os valores menor que o pivô estarão à esquerda e os maiores à direita. (ISSO NÃO SIGNIFICA QUE ESTÃO EM ORDEM!)

### Complexidade
O algoritmo é recursivo, então deve-se criar uma **árvore de recursão**.
Nesse caso, cada nível possui um custo!

Em cada caso, o vetor será percorrido até ajustar o pivô (como descrito anteriormente).
Porém, em cada nível, o tamanho é diminuído, tendo então:
## $$T(n) = (n-1)n \implies \frac{(n-1)n}{2} = n²$$
Esse caso (pior) ocorre quando o pivô escolhido é o maior ou menor item no vetor. Além disso, casos em que o vetor possui o valores todos iguais também estão nesse caso.

Para o melhor caso, o pivô precisa dividir o vetor em partes iguais. Cada parte realiza n comparações (tamanho do vetor atual).
## $$T(n) = n \implies 2\frac{n}{2}+n = n\log{n}$$
Para evitar o pior caso, pode-se:
- Escolher um item aleatoriamente
- Escolher o meio do vetor
- Escolher uma mediana 

### Implementação em C
```c
int partition(ITEM* vec[], int start, int end) {
	int mid = (start + end) / 2;
	ITEM* pivot = vec[mid];
	
	// mover pivot para o fim
	ITEM* aux = vec[end];
	vec[end] = pivot;
	vec[mid] = aux;
	
	int i = start - 1; //if start = 0 then i = -1
	for (int j = start; j < end; j++) {
		if (item_get_key(vec[j]) < item_get_key(pivot)) {
			i++;
			
			aux = vec[j];
			vec[j] = vec[i];
			vec[i] = aux;
		}
	}
	
	//fazer swap ultima vez (colocar pivo na posição)
	aux = vec[end];
	vec[end] = vec[i+1];
	vec[i+1] = aux;
	
	return(i+1); //posicão do pivo
}

  

void quicksort(ITEM* vec[], int start, int end) {
	if (start >= end) {
		return;
	}
	
	int pivotPos = partition(vec, start, end);
	quicksort(vec, start, pivotPos-1);
	quicksort(vec, pivotPos+1, end);

}
```
