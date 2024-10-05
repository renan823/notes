### Empilhando items
O funcionamento da pilha envolve colocar e retirar coisas do topo!
Empilhar objetos! A ordem de entrada e saída é muito importante.

>[!IMPORTANT] A pilha obedece a regra LIFO: O último a entrar é o primeiro a sair!

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
#ifndef STACK_H
    #define STACK_H
    #define MAX_SIZE 100

    #include "item.h"
    #include <stdbool.h>

    typedef struct stack STACK;

    STACK *stack_create();
    void stack_destroy(STACK **stack);

    bool stack_is_empty(STACK *stack);
    bool stack_is_full(STACK *stack);
    int stack_size(STACK *stack);

    void stack_push(STACK *stack, ITEM *item);
    ITEM *stack_pop(STACK *stack);
    ITEM *stack_peek(STACK *stack);

    void stack_print(STACK *stack);
    void*stack_reverse(STACK *stack);
#endif
```


**stack.c (para implementação sequencial)**
```c
#include "item.h"
#include "stack.h"

#include "<stdbool.h>"
#include "<stdlib.h>"
#include "<stdio.h>"

struct stack {
    ITEM *items[MAX_SIZE];
    int size;
};

void *_allocate(int items, unsigned long size) {
    void *mem;

    if ((mem = malloc(item * size)) == NULL) {
        fprintf(stderr, "ERROR: Not enough memory to allocate!\n");
    }

    return(mem);
}

STACK *stack_create() {
    STACK *s = (STACK *) _allocate(1, sizeof(STACK));
    s->size = 0;

    return(s);
}

void stack_destroy(STACK **stack) {
    if (stack == NULL || *stack == NULL) {
        return;
    }
    
    for (int i = 0; i < (*stack)->tamanho; i++) {
        item_destroy(&((*stack)->items[i]));
    }

    free(*pilha);
    *pilha = NULL;
}

bool stack_is_empty(STACK *stack) {
    return(stack->size == 0);
}

bool stack_is_full(STACK *stack) {
    return(stack->size == MAX_SIZE);
}

int stack_size(STACK *stack) {
    return(stack->size);
}

void stack_push(STACK *stack, ITEM *item) {
    if (stack_is_full(stack)) {
        fprintf(stderr, "ERROR: The stack is full!\n");
        return;
    }

    stack->items[stack->size] = item;
    stack->size++;
}

ITEM *stack_pop(STACK *stack) {
    if (stack_is_empty(stack)) {
        fprintf(stderr, "ERROR: The stack is empty!\n");
        return(NULL);
    }

    //precisa "apagar" o ponteiro pra item (usando auxiliar)...
    stack->size--;

    ITEM *item = stack_peek(stack);
    stack->items[stack->size] = NULL;

    return(item);
}

ITEM *stack_peek(STACK *stack) {
    if (stack_is_empty(stack)) {
        fprintf(stderr, "ERROR: The stack is empty!\n");
        return(NULL);
    }

    return(stack->items[stack->size-1]);
}

void stack_print(STACK *stack) {
    printf("Stack {\n");
    printf("  - size: %d\n", stack->size);

    printf("  - items: [ ")
    for(int i = 0; i < stack->size; i++) {
        printf("%d ", item_get_key(stack->items[i]));
    }
    printf("]\n");

    printf("}\n");
}

void _swap(ITEM *a, ITEM *b) {
    ITEM *temp = a;
    a = b;
    b = temp;
}

void stack_reverse(STACK *stack) {
    /*
    percorrer o vetor até a metade (verificar tamanho par/impar)
    se par -> max = size/2
    se impar -> max = (size-1)/2
    swap nos ponteiros (i e p->size-i)
    */
    int max = (stack->size % 2 == 0) ? stack->size / 2 : (stack->size -1) / 2;

    for(int i = 0; i < max; i++) {
        _swap(stack->items[i], stack->items[stack->size-i]);
    }
}
```


**stack.c (para implementação encadeada)**
```c
#include "item.h"
#include "stack.h"

#include <stdbool.h>
#include <stdlib.h>
#include <stdio.h>

struct stack {
    NODE *top;
    int size;
};

struct node {
    ITEM *item;
    NODE *next;
};

void *_allocate(int items, unsigned long size) {
    void *mem = malloc(items * size);

    return(mem);
}

STACK *stack_create() {
    STACK *s = (STACK *) _allocate(1, sizeof(STACK));

    if (s == NULL) {
        return(s);
    }

    s->top = NULL;
    s->size = 0;

    return(s);
}

void stack_destroy(STACK **stack) {
    if (stack == NULL || *stack == NULL) {
        return;
    }

    NODE *node;

    while ((*stack)->top != NULL) {
        node = (*stack)->top;
        (*stack)->top = (*stack)->top->next;

        item_destroy(&node->item);
        node->next = NULL;
        free(node);
        node = NULL;
    }

    free(*stack);
    *stack = NULL;

}

bool stack_is_empty(STACK *stack) {
    if (stack == NULL) {
        return(false);
    }

    return(stack->size == 0);
}

bool stack_is_full(STACK *stack) {
    if (stack == NULL) {
        return(true);
    }

    //tenta alocar (a pilha estar cheia depende da capacidade de memoria)
    //o limite é a heap!!
    NODE *node = (NODE *) _allocate(1, sizeof(NODE));
    if (node == NULL) {
        return(true);
    }

    free(node);
    return(false);
}

int stack_size(STACK *stack) {
    if (stack == NULL) {
        return(-1);
    }

    return(stack->size);
}

void stack_push(STACK *stack, ITEM *item) {
    if (stack_is_full(stack)) {
        fprintf(stderr, "ERROR: The stack is full!\n");
        return;
    }

    NODE *new = (NODE *) _allocate(1, sizeof(NODE));
    if (new == NULL) {
        return;
    }

    new->item = item;
    new->next = stack->top;

    stack->top = new;
    stack->size++;
}

ITEM *stack_pop(STACK *stack) {
    if (stack_is_empty(stack)) {
        fprintf(stderr, "ERROR: The stack is empty!\n");
        return(NULL);
    }

    stack->size--;

    //movendo o top
    NODE *old = stack->top;
    stack->top = old->next;
    old->next = NULL;

    //salvar o item e excluir ponteiros
    ITEM *item = old->item;

    free(old);
    old = NULL;

    return(item);
}

ITEM *stack_peek(STACK *stack) {
    if (stack_is_empty(stack)) {
        fprintf(stderr, "ERROR: The stack is empty!\n");
        return(NULL);
    }

    return(stack->top->item);
}

void stack_print(STACK *stack) {
    if (stack_is_empty(stack)) {
        fprintf(stderr, "ERROR: The stack is empty!\n");
        return;
    }

    printf("Stack {\n");
    printf("  - size: %d\n", stack->size);
    printf("  - items (keys): [ ");
    
    NODE *next = stack->top;
    while(next != NULL) {
        if (next != NULL) {
            printf("%d ", item_get_key(next->item));
        }

        next = stack->top->next;
    }

    free(next);

    printf("]\n");
    printf("}\n");
}

void stack_reverse(STACK *stack) {
    if (stack == NULL) {
        return;
    }
}

```