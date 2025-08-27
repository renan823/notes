No contexto de [[Sistemas Operacionais]], um processo indica um **programa em execução, junto de suas variáveis, espaço de memória e contexto**.

Quando um programa inicia sua execução, o SO separa um pedaço da [[Memória RAM]] para armazená-lo. Ali, estarão dados, instruções e demais informações relacionados ao programa.

→ É importante ressaltar que processos são independentes e **não devem acessar os contextos uns dos outros!**

Processos são algum tipo de atividade. Com um programa, estados, input e output.
Um **único processador será compartilhado entre múltiplos processos**, a depender de um algoritmo para escalonar e coordenar as execuções.

> A execução de múltiplos programas é chamada de multiprogramação.
> Essa técnica dos computadores modernos permite **trocar processos em execução por outros**, dando a impressão de paralelismo (nesse caso, pseudoparalelismo, ou concorrência).

### Estados
Um processo depende de seu estado atual para ser executado.
Esse estado atua como uma [[Máquina de Estados]], trocando entre cada tipo de estado em dada ação.

- READY: processo pronto para ser executado, aguardando em fila;
- RUNNING: processo em execução;
- BLOCKED: processo que foi bloqueado por alguma operação (por exemplo, IO).

![[process_states.png]]

A troca entre estes estados é controlada pelo **sistema de escalonamento**.
Processos prontos são escolhidos para usarem a [[CPU]], e enquanto um executa, os outros aguardam.
Processos podem ser bloqueados devido à necessidade de inputs e similares. Nesse caso, o processo não será marcado como READY até ter a pendência resolvida.

Em alguns casos, o processo pode ser marcado como UNDEFINED, **indicando que aquele processo não é conhecido pelo SO** (acabou de ser criado ou foi destruído).

As ações provocam a mudança entres os estados:
- `create`: Cria um novo processo;
- `awake`: Libera um processo de BLOCKED para READY;
- `dispatch`: Faz o processo ser executado (READY → RUNNING)
- `block`: Encerra a execução de um processo, bloqueando-o;
- `suspend`: Remove o processo de execução, devolvendo-o para a fila;
- `destroy`: Libera a memória correspondente ao processo.

### Escalonamento
A organização e coordenação de processos é essencial para o bom funcionamento dos computadores com multiprogramação.

É necessário algum algoritmo responsável por indicar qual processo será o próximo a ser executado, bem como controlar tempo de execução, troca entre processos e ações bloqueantes.

Um **escalonador** deve prezar por:
- **Equidade**: processos devem receber uma parcela justa de tempo;
- **Eficiência**: fazer a CPU trabalhar 100% do tempo (pouco tempo ocioso);
- **Prioridades**: coordenar diferentes prioridades entre processos;
- **Tempo de resposta**: minimizar tempo de resposta;
- **Vazão**: maximizar o processamento de jobs por hora.

> Alguns objetivos do escalonador são contraditórios, principalmente aqueles que distinguem usuários `live` de usuários `batch`.

A evolução dos computadores vez com que fosse necessário atualizar os sistemas de escalonamento, uma vez que, nos antigos processamentos em lote, **programas eram executados continuamente, até a sua finalização total**.

Os algoritmos que consideram a multiprogramação, suspendendo e trocando execuções, são chamados de **preemptivos** (substituir antes de encerrar).

>As trocas de contextos entre processos são custosas, e devem ser otimizadas para garantir uma melhor eficiência do sistema.

##### Escalonamento Round Robin
É o algoritmo mais tradicional aplicado em escalonadores. Cada processo receberá um tempo de execução chamado `quantum` e será colocado numa fila.

> Para o algoritmo, **todos os processos são igualmente importantes**.

O próximo processo na fila será executado no intervalo de tempo definido por seu `quantum`, sendo substituído pelo próximo ao final de seu tempo.

Caso o processos bloqueie ou termine antes do `quantum`, ele será trocado pelo próximo da fila.

O problema mais comum no algoritmo Round Robin **é definir o tamanho do quantum**.
- Intervalos muito curtos fazem com que a CPU gaste muito tempo (proporcionalmente) trocando entre processos.
- Intervalos muito grandes podem aumentar o tempo ocioso da CPU e fazer com que usuários esperam mais tempo por uma resposta.

![[round_robin.png]]

##### Escalonamento por prioridade
Algoritmo que aplica diferentes prioridades entre os processos, fazendo aqueles com maior prioridade serem executados por mais tempo e/ou mais frequentemente.

Para evitar problemas com uma execução indefinidamente grande, a prioridade do processo em execução é diminuída em cada ciclo de clock e um tempo `quantum` é definido como limite para a execução.

> Prioridades podem ser definidas dinamicamente conforme a necessidade.
> Por exemplo, caso um processo bloqueie por uso de I/O, outro processo, que não depende de I/O,  pode ter sua prioridade aumentada para ser executado imediatamente.

É conveniente agrupar processos pelas suas prioridades, organizando-os de modo que cada prioridade tenha uma fila de processos prontos.
O algoritmo de prioridades gerencia a tabela de prioridades, enquanto o algoritmo Round Robin gerencia cada um das filas (individualmente) para cada prioridade.

![[prioruty_scheduling.png]]