A [[Memória]] é parte essencial em qualquer computador.

Sua capacidade e velocidade vêm aumentando com a evolução da tecnologia.
O ideal é uma memória **barata, rápida e com muito armazenamento** → Isso é meio inviável!

> "Programas tendem a se expandir para ocupar a memória disponível" - Lei de Parkinson

Para evitar problemas e usar diferentes dispositivos de memória, foi criada uma **hierarquia de memória**, que é abstraída pelos [[Sistemas Operacionais]] para ser conveniente ao uso pelos programas.

É o **gerenciador de memória** que cuida da alocação e desalocação de memória para uso dos [[Processos]].

---

### Acesso direto
A primeira forma de abstração foi, justamente, a falta dela.

Os programas acessavam o endereço físico, "vendo" a memória diretamente.
Isso **impede que múltiplos programas sejam executados juntos**.

Geralmente, o SO era armazenado na [[Memória RAM]] ou em uma ROM.

> BIOS: Basic I/O System

Entretanto, ainda era possível se aproximar de multiprogramação (não do ideal) usando a técnica de **swapping, que consiste em guardar o processo em disco para executar outro**.

---

### Espaço de endereçamento
Para solucionar problemas de multiprogramação foi definido o **espaço de endereçamento**, que permite acessar valores contidos num dado intervalo, usando seu endereço.

> O intervalo não precisa, necessariamente, ser numérico!
> URLs de sites, endereços de casas, números de telefone, etc; são exemplos de um espaço de endereçamento que facilita a busca por um dado recurso com uma "chave" de busca.

Cada processo tem, então, seu próprio espaço de endereçamento, que **não é compartilhado (essencialmente) com nenhum outro processo.**

Para alcançar esse feito, é necessário realizar uma abstração da memória para o espaço de endereçamento do processo.
A abstração envolve algumas somas, que permitem corresponder a posição $0$ do endereçamento de um processo à uma posição na memória que não necessariamente é a $0$.

**Essa solução é implementada usando dois registradores internos à CPU: base e limite**

- Base: Armazena o primeiro endereço do programa na memória física
- Limite: Armazena o tamanho (em bytes) do programa

![[base_limite_So.png]]
Para toda operação envolvendo memória, o endereço base é adicionado ao endereço gerado pelo processo e então é enviado ao barramento.
Caso o endereço seja maior que o limite, a operação é abortada.

---

### Swapping
Como mencionado anteriormente, a técnica de swapping **permite colocar processos em disco para liberar a memória RAM**.

> Em computadores modernos, o SO já delimita um pedaço do disco que será usado como **memória swap**, para atender às necessidades do swapping.

As operações de trocar processos, inserindo e removendo dados da RAM pode gerar buracos (espaços vazios) na memória. A **compactação de memória** pode ser aplicada para remover esses buracos → *Ação essa que geralmente não é realizada por ser ligeiramente demorada*.

Durante a troca de processos, é muito possível que seja necessário reajustar seu endereçamento (base e limite atuam bem aqui).

---

### Alocação
Aqueles processos que possuem tamanho fixo são criados exatamente com o tamanho necessário.

Processos cujo uso de memória tende a aumentar durante a execução podem se expandir para algum espaço adjacente ou, caso não haja espaço, procurar um novo lugar na memória.
Se não houver nenhum espaço que comporte o processo, então ele é guardado ou encerrado.

> Respectivamente: **Alocação Estática** e **Alocação Dinâmica**.

Se é esperado que um processo cresça, então **deve-se alocar desde o início uma área extra de memória**, que pode vir a ser usada. É um *trade-off*:
- Alocar mais memória (que pode não ser usada) desde a inicialização;
- Deixar o processo crescer e trocar seu local na memória (operação cara)

→ Essa área vazia **não vai para disco durante o swap**.

![[stack_heap_processo.png]]
Geralmente, o processo possui uma região de memória para **dados temporários, a Heap** (cresce para cima) e uma região para **alocação dinâmica, a Stack** (cresce para baixo).


