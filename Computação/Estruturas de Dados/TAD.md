TAD é um tipo abstrato definido pelo programador para manipular seus dados, omitindo detalhes da implementação do usuário final.

TADs serão utilizados na implementação das mais diversas estruturas de dados, permitindo uma melhor segurança e modularidade do código.

Escondendo os dados e mostrando apenas a interface (funções), um TAD permite que o usuário acesse apenas aquilo que lhe for permitido, evitando problemas futuros.

**O TAD pode ser descrito como um conjunto de dados e as operações associadas à ele.**

### Quais as vantagens do TAD?
- Encapsulamento
- Reúso
- Manutenção
- Correção

### Implementação em C
É necessário criar um arquivo de interface (.h) e o arquivo da implementação (.c)
Separando os arquivos, apenas aquilo que está definido na interface poderá ser acessado (uma função implementada no .c que não está no .h não será acessada por fora!)

Para a criação de TADs em [[C]], é necessário usar tipos especiais de [[Ponteiros]], os ponteiros opacos. Um ponteiro opaco é representado pelo `*void`, mostrando para o compilador que aquele espaço de memória pode conter qualquer conteúdo (e que aquilo não é da conta dele).
Sem ponteiro opaco não seria possível implementar os TADs, já que seus dados não estariam encapsulados.

### Abstração de Dados
Para tornar o código reutilizável, é de boa prática declarar um TAD para manipular o tipo de dado.
Desse modo, o cliente (usuário da estrutura de dados) pode especificar qual tipo de dado deseja manipular! Simples?

A implementação de um TAD "item" permite armazenar qualquer dado, salvando seu valor e sua chave. O valor pode ser literalmente QUALQUER COISA! A chave, usualmente, é um inteiro, pois facilita a vida e etc.

Quando um TAD for implementado baseado no item, o usuário tem total controle sobre qual tipo de dado está sendo usado em sua estrutura.

**item.h (interface)**
```c
#ifndef ITEM_H
    #define ITEM_H

    typedef struct item ITEM;

    ITEM* item_create(int key, void *value);
    void item_destroy(ITEM **item);

    int item_get_key(ITEM *item);
    void item_set_key(ITEM *item);

    void *item_get_value(ITEM *item);
    void item_set_value(ITEM *item, void *value);
#endif
```

**item.c (implementação)**
```c
#include <stdlib.h>
#include <stdio.h>

#include "item.h"

struct item {
    int key;
    void *value;
};

void *_allocate(int items, unsigned long int size) {
    void *mem;

    if ((mem = malloc(items * size)) == NULL) {
        fprintf(stderr, "ERROR: Not enough memory to allocate!\n");
        exit(EXIT_FAILURE);
    }

    return(mem);
}

ITEM *item_create(int key, void *value) {
    ITEM *item = (ITEM *) _allocate(1, sizeof(ITEM));

    item->key = key;
    item->value = value;

    return(item);
}

void item_destroy(ITEM **item) {
    free(*item);
    *item = NULL;
}

int item_get_key(ITEM *item) {
    return(item->key);
}

void item_set_key(ITEM *item, int key) {
    item->key = key;
}

void *item_get_value(ITEM *item) {
    return(item->value);
}

void item_set_value(ITEM *item, *void value) {
    item->value = value;
}
```


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