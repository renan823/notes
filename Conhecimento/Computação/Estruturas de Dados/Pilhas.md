O funcionamento da pilha envolve colocar e retirar coisas do topo!
Empilhar objetos! A ordem de entrada e saída é muito importante.

>[!example] A pilha obedece a regra LIFO: O último a entrar é o primeiro a sair!

### Aplicações
- Histórico de navegador
- Estrutura auxiliar em outros algoritmos

### Funcionamento
As inserções e remoções sempre ocorrem na mesma extremidade da pilha.
O item do topo pode ser acessado para consulta (apenas ele!).
Também é possível verificar o estado da pilha (cheia ou vazia).
Exemplo prático: converter decimal em binário.

### Implementação em C
A implementação pode usar alocação estática ou dinâmica.
Se o dado for um [[TAD]], por conta do ponteiro opaco, não é possível usar a estática!
Pode ser sequencial ou encadeada (quase uma linked list).
O modo estático e encadeado (é uma simulação de encadeamento) é um caso especial -> **ordenação topológica.**

**stack.h (interface)**
```c
#ifndef STACK_H_
	#define STACK_H_
	
	typedef struct item ITEM;
	
	struct item {
		int key;
		void *value;
	};
	
	ITEM *NewItem(int key, void *value);
	void DestroyItem(ITEM **item);
	
	typedef struct stack STACK;
	
	STACK *NewStack();
	void DestroyStack(STACK **stack);
	
	void StackPush(STACK *stack, ITEM *item);
	ITEM *StackPop(STACK *stack);	
	ITEM *StackPeek(STACK *stack);
	
	int StackSize(STACK *stack);
#endif
```


**stack.c (para implementação sequencial)**
```c
#include "stack.h"

#include <stdio.h>
#include <stdlib.h>

typedef struct node NODE;

struct node {
	ITEM *item;
	NODE *next;
};

struct stack {
	int size;
	NODE *top;
};

// Creates a new item
ITEM *NewItem(int key, void *value) {
	ITEM *item = (ITEM*) malloc(sizeof(ITEM));
	
	if (item != NULL) {
		item->key = key;
		item->value = value;
	}
	
	return item;
}

void DestroyItem(ITEM **item) {
	if (*item == NULL) {
		return;
	}
	
	if ((*item)->value != NULL) {
		free((*item)->value);
	}
	
	free(*item);
	*item = NULL;
}

// Creates stack node with the given item
NODE *_NewNode(ITEM *item) {
	NODE *node = (NODE*) malloc(sizeof(NODE));
	
	if (node != NULL) {
		node->item = item;
		node->next = NULL;
	}
	
	return node;
}

// Recusively destroies each stack node
void _DestroyNode(NODE *node) {
	if (node == NULL) {
		return;
	}
	
	// Go to the next
	_DestroyNode(node->next);
	
	// Deallocte item
	DestroyItem(&node->item);
	
	// Deallocate node
	free(node);
}

// Initializes an empty stack
STACK *NewStack() {
	STACK *stack = (STACK*) malloc(sizeof(STACK));
	
	if (stack != NULL) {
		stack->size = 0;
		stack->top = NULL;
	}
	
	return stack;
}

// Destroies the stack (and its items)
void DestroyStack(STACK **stack) {
	if (*stack == NULL) {
		return;
	}
	
	// Remove nodes
	_DestroyNode((*stack)->top);
	
	// Deallocate stack
	free(*stack);
	
	*stack = NULL;
}

// Inserts the new item on the top
void StackPush(STACK *stack, ITEM *item) {
	if (stack == NULL) {
		return;
	}
	
	// Create a new node
	NODE *node = _NewNode(item);
	if (node == NULL) {
		return;
	}
	
	// Adjust pointers
	node->next = stack->top;
	stack->top = node;
	stack->size++;
}

// Removes the top item
ITEM *StackPop(STACK *stack) {
	if (stack == NULL || stack->top == NULL) {
		return NULL;
	}
	
	// Save item
	NODE *top = stack->top;
	ITEM *item = top->item;
		
	// Adjust pointer
	stack->top = top->next;
	stack->size--;
	
	// Remove node (keep the item!)
	free(top);
	
	return item;
}

// Peeks the top item
ITEM *StackPeek(STACK *stack) {
	if (stack == NULL || stack->top == NULL) {
		return NULL;
	}
	
	return stack->top->item;
}

// Returns the stack size
int StackSize(STACK *stack) {
	if (stack == NULL) {
		return -1;
	}
	
	return stack->size;
}
```
