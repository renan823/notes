O insertion sort é um método de [[Ordenação]] muito intuitivo, que têm como principal processo inserir (realizando trocas) o elemento em sua posição final.

### Funcionamento
Muito similar ao [[Bubble Sort]], este algoritmo flutua os valores para o início do vetor, garantindo que na iésima iteração o elemento na posição "i" esteja em seu lugar.
A diferença, entretanto, está na extremidade atingida; nesse caso, o início do vetor é ordenado primeiro.

### Complexidade
O algoritmo possui dois laços, então apresenta complexidade $O(n²)$.
Matematicamente, cada passo tem seu valor: $1+2+3+(n-1)$. Essa [[Progressão Aritmética]] pode ser somada como $\frac{n(a_1+a_n)}{2}$, o que resulta em $O(n²)$.
