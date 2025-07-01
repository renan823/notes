O algoritmo de Djikstra permite percorrer o grafo encontrando o menor caminho entre dois nós.

O algoritmo não permite arestas com peso negativo, para isso, usa-se [[Belmman-Ford]]

Um caminho tem seu custo determinado pela soma dos pesos das arestas que o formam. Caso não haja caminho, a distância (custo) é infinita.
$$O((V+E) \log V)$$

```go
Q := PriorityNewQueue()
d := [] // distancias
s := [] // resultado
root := 0

for i := range v {
	d[i] = Infinity
	p[i] = nil
	Q.enqueue(i)
}

d[root] = 0

for {
	if Q.empty() {
		break;
	}

	u := Q.dequeue()
	s = append(s, u)
	
	for v := range adjacentes(u) {
		if d[v] > weight(u, v) + d[u] {
			p[v] = u
			d[v] = weight(u, v) + d[u]
		}
	}
}
```