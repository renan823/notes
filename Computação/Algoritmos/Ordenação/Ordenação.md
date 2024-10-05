
### Necessidade
Seja em bancos de dados ou listas telefônicas, ter os dados ordenados em algum padrão facilita a busca por um item desejada.
Na computação não é diferente, contendo uma gama de algoritmos que se responsabilizam por ordenar listas.

### Problema
No entanto, há um empasse. 
Mesmo o melhor algoritmo de ordenação ainda é custoso, o que leva ao questionamento da necessidade de ordenar o vetor.
As buscas/consultas são frequentes?
Vale a pena pagar o preço da ordenação?

### Conceitos
Ordenar significa colocar em alguma ordem especificada. No nosso caso, a ordem é das chaves de items ([[TAD]]).

A ordenação pode ser:
- **Interna**: Quando os registros cabem em um array na **memória principal**
- **Externa**: Usado em bancos de dados. O montante é maior que a capacidade da memória.
- **Estável**: Se existirem chaves iguais, a ordem delas no vetor original é preservada.
- **Não estável**: Se existirem chaves iguais, não é garantido que estejam na mesma ordem do vetor inicial.

-> Uma **Ordenação por endereço** ordena apenas os ponteiros dos valores, mas os valores continuam nas mesmas posições. Desse modo, uma "tabela" de posições é criada para armazenar os endereços ordenados.

Exemplo de swap por endereço
```c
void swap (ITEM** i1, ITEM** i2) {
	ITEM* aux;
	aux = *i1;
	*i1 = *i2;
	*i2 = axu;
}
```


### Comparação
Para ordenar os registros a maioria dos algoritmos usa uma comparação de valores.
Embora existam algoritmos sem comparações, os mais usuais necessitam de uma condição para comparar (geralmente maior/menor que)

-> Em algumas linguagens, existe a possibilidade de definir o método de comparação, que será usado pelo algoritmo de ordenação (por exemplo map, filter e reduce do javascript)

Em bancos de dados, por exemplo, existem muitas maneiras de ordenar suas buscas, seja com campos numéricos ou não -> os métodos de ordenação ainda funcionam!
### Complexidade e Usos
Para algoritmos de comparação, o processo mais custoso é justamente a comparação.
