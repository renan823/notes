
### Busca em profundidade 
Também chamada de **depth first search (DFS)**, visita todas as adjacências de um dado nó, até achar um nó sem adjacência.

Usa [[Pilhas]] para salvar os nós visitados

```
colors = [...]
parents = [...]
distances = [...]
adjacency = [...]
time = 0

DFS (G graph) {
	// Inicializa os nós
	for v in G.vertex {
		// Marca nó como "não visitado"
		colors[v] = "WHITE"
		parents[v] = nil
	}


	// Percorrer nós
	for v in G.vertex {
		if colors[v] == "WHITE" {
			visit(v)
		}
	}
}

visit (v vertex) {
	// Marca nó como "visitando"
	colors[v] = "GRAY"
	time += 1
	distances[v] = time

	for u in adjacency[v] {
		if colors[u] == "WHITE" {
			// Define de onde veio
			parents[u] = v

			// Visitar u
			visit(u)
		}
	}

	// Marca nós como visitado
	colors[u] = "BLACK"
}
```

### Busca em largura
Também chamada de **breadth first search (BFS)**, visita todos os nós em um mesmo nível, para depois visitar os filhos.

Usa [[Filas]] para salvar os nós visitados.
```
colors = [...]
parents = [...]
distances = [...]
adjacency = [...]
time = 0


BFS (G graph, s vertex) {
	for v in G.vertex {
		// Marca o nó como não visitado (no != s)
		if v != s {
			colors[v] = "WHITE"
			distances[v] = infinity
			parents[v] = nil
		}
	}

	// Inicializa uma fila
	Q = NewQueue()

	// Adiciona s na fila
	Q.enqueue(s)

	while (!Q.empty()) {
		// Pega o nó e visita seus filhos
		v = Q.dequeue()

		for u in adjcency[v] {
			if colors[u] == "WHITE" {
				colors[u] = "GRAY"
				distances[u] = distances[v] + 1
				parents[u] = v 
				// Adiciona o no na fila
				Q.enqueue(u)
			} 
		}

		// Nó visitado
		colors[v] = "BLACK"
	}
}
```