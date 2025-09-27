Também chamadas de **lightweight processes**, as threads são unidades de simultaneidade do sistema operacional, e permitem múltiplas **linhas de execução** dentro dos [[Processos]].

Ao criar uma thread, o programa indica ao SO que estará usando mais de uma sequência de instruções dentro do processo.
Isso faz com que o **contexto do processo (variáveis, etc) seja compartilhado entre threads**, reduzindo o overhead de copiar todos os dados para outro espaço de memória.

![[threads_1.png]]

A thread leva consigo apenas algumas informações, como o PC e o Stack Pointer, indicando de qual ponto do código aquela execução se refere.

---
### Execução de threads
Nos sistemas multiprogramados, o uso de threads permite trabalhar com **concorrência** e, caso o hardware permita, com **paralelismo**.

Naturalmente, alguns problemas envolvem o uso de múltiplas threads dentro de um processo.
Por exemplo, um servidor web, que precisa "ouvir" requisições e também processá-las. 
Não é o ideal travar o recebimento de requisições enquanto se processa uma. Desse modo, é possível, por exemplo, criar uma thread para receber requisições e outra (ou outras) para tratá-las.

> **A execução de threads é não determinística, então, NÃO se deve esperar pela execução em uma ordem pré definida!**

Assim como nos processos, as threads possuem **estados de execução**:
- READY: thread pronta para ser executada, aguardando em fila;
- RUNNING: thread em execução;
- BLOCKED: thread que foi bloqueada por alguma operação (por exemplo, IO).

Caso uma thread do processo seja bloqueada, as outras podem seguir normalmente seu fluxo de trabalho - e isso é ótimo!

---
### Gerenciamento de threads
Threads podem ser gerenciadas pelo próprio kernel ou pelo usuário (bibliotecas alto nível).

###### Usuário
Threads de usuário são gerenciadas pelo processo, que armazena uma tabela das threads correntes. 
Nesse modo, menos chamadas ao kernel são necessárias e a troca entre threads executando é mais rápida. 
Contudo, quando uma thread bloqueia, o processo irá bloquear também!

###### Kernel
Threads de kernel são gerenciadas diretamente pelo SO, que armazena e conhece cada thread existente.
Threads de kernel bloqueadas não bloqueiam o processo todo.
Contudo, é mais caro manter threads nesse modo, devido ao maior número de chamadas ao kernel.

--- 
### Problemas envolvendo threads
Threads são, de fato, muito úteis, e possuem aplicações em diversos tipos de programas.

Entretanto, lidar com threads exige alguns cuidados, a fim de evitar problemas:
- Competição por recursos (acessar a mesma variável, por exemplo)
- Comunicação entre threads
- Problemas com `fork` de processos (copiar threads também?)
- Stack overflow (caso o kernel não aumente a pilha da thread)
- Tratamento de erros (para onde / quem vão os erros?)

A maioria do problemas está diretamente relacionado a comunicação entre processos ([[IPC]]).