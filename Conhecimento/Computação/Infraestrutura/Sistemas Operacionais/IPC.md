De forma natural, os [[Processos]] precisam se comunicar.
Por exemplo, é comum criar pipelines de dados, colocando a saída de um processo na entrada de outro.

> Idealmente, essa comunicação deve ser **bem estruturada e sem interrupção**

O principais pontos a serem considerados são:
- Como realizar a comunicação?
- Como evitar dependências cíclicas entre processos?
- Como evitar **race conditions**?

---
### Race conditions
As condições de corrida podem ocorrem quando processos compartilham dados de escrita e leitura.

Com dois (ou mais) processos compartilhando dados, podem ocorrer escritas indevidas, sobrescrevendo dados de outro processo, ou então leituras erradas, nas quais o dado está inconsistente.

> Condições de corridas também ocorrem nas [[Threads]] (afinal, são processos mais leves)

###### Exemplo
Em um sistema web, as ofertas atraem um fluxo maior de clientes.
O servidor receba **1000 requisições (simultâneas)** para comprar um produto X, que possui apenas 50 unidades.
Ao processar essas requisições, **a quantidade total do produto e as informações da compra devem ser atualizadas no banco de dados**.

Caso o banco de dados não saiba lidar com threads e condições de corrida, inconsistências VÃO acontecer → **atualização incorreta da quantidade do produto, falhas ao processar a compra, etc.**

> Nesses casos, é possível que clientes que pagaram pelo produto não o recebam!


A questão envolvendo condições de corrida está em lidar com as **regiões críticas**, as partes do programa que NÃO podem ser acessadas simultaneamente pro vários processos.

O principal objetivo é criar uma **exclusão mutua (mutex)**, que protege a área crítica de acessos indevidos.

A boa execução paralela (e concorrente) de processos depende de certas condições:
- Não mais de um processo acessando a região crítica simultaneamente
- Sem suposições sobre velocidade e número de processadores
- Processos rodando fora da região crítica não devem travar outros processos
- O processo não deve esperar eternamente para acessar a região crítica


Para evitar condições de corrida, algumas técnicas podem ser empregadas.

---
#### Espera ocupada
Consiste no conjunto de técnicas que impedem acesso a região crítica enquanto outro processo está ocupando trabalhando ali. Os processos aguardam até que a região em questão seja liberada.

###### Desativar interrupções
Consiste em, basicamente, **impedir que um processo seja interrompido** (bloqueado) enquanto estiver na região crítica.

> Funciona desativando as interrupções por clock ( o que impede a CPU de trocar processos).

Pode ser um problema, já que permite que o processo desabilite a própria interrupção (e se nunca mais voltar?)
Além disso, essa abordagem só funciona para casos com uma CPU, afinal, o clock afetada é apenas da CPU em questão (**as outras ainda podem acessar a região crítica!**)

→ Ainda assim, pode ser usado em nível de kernel para tarefas internas do SO

###### Lock
Consiste em criar uma **flag que indica se a região crítica está livre para ser acessada**.

A flag seria uma variável compartilhada entre os processos... O que, novamente, leva ao problema das race conditions.

###### Alternância Estrita
Consiste na **espera por uma flag compartilhada**, que só pode ser alterada na região crítica.
O caso aqui é mais estrito, já que, idealmente, os processos devem ser alternados "ordenadamente": A, B, A, B... não como: A, B, B, A...

Além disso, essa proposta viola o termo de "não travar outro processo quando não estiver na região crítica".

###### TSL
Consiste no uso de **registradores em hardware** (operação atômica) para **setar uma variável lock (TEST AND SET LOCK).**
Originalmente, o lock é usado para barrar o barramento de memória que uma CPU está usando.

Entretanto, é possível implementá-lo como solução para race conditions. O problema, novamente, depende da coordenação entre processos para ativarem / desativarem as o lock no momento correto.

Funciona, mas também deixa processos esperando (busy waiting).

---
#### Sleep e Wakeup
Enquanto a espera ocupada (como o nome sugere) bloqueia processos e gasta tempo em CPU, a ideia aqui é bloquear e acordar processos, evitando uso desnecessário da CPU.

`sleep`: Chamada ao sistema que bloqueia o processo que a chamou;
`wakeup`: Chamada ao sistema que acorda o processo especificado;

Um problema comum que envolve sleep / wakeup é o dos produtores e consumidores.
Existe um processo responsável por colocar informações em um buffer de tamanho fixo. Do outro lado, existe o processo consumidor, que remove (e consome) informações do buffer.
Nesse caso, é possível "dormir" o produtor caso o buffer esteja cheio, ou equivalente para o consumidor, quando o buffer estiver vazio.

Ainda assim, é necessário uma variável compartilhada que indica o tamanho do buffer.
Em alguns casos, pode ocorrer de ambos estarem eternamente dormindo (quando um wakeup é enviado para o processo que ainda não "dormiu")

> Soluções possíveis para evitar o "dormir" eterno envolvem um **bit wakeup**, que, quando o processo "acordado" recebe wakeup, armazena 1, e usa esse valor para evitar um sleep, voltando a 0.


---
#### Semáforos
Consiste em, basicamente, u m valor inteiro que conta o número de wakeups, salvando para uso futuro.

Semáforos possuem duas operações semelhantes ao sleep / wakeup:

```c
void down() {
	if (semaforo > 0) {
		semaforo--;
	} else {
		sleep();
	}
}
```
A operação **down** verifica se o semáforo é maior que zero. Em caso positivo, decrementa o valor. Em caso negativo, coloca o processo em sleep.

```c
void up() {
	semaforo++
	
	if (blocked_processes.size != 0) {
		p = choose_process(bloked_processes)
		wakeup(p)
	}
}
```
A operação **up** incrementa o valor do contador. E, caso existam processos bloqueados, um deles é escolhido e desbloqueado.

> Todas operações de acesso e modificação do contador (semáforo) são **atômicas**, ou seja, é garantido que nenhum outro processo interferirá nesse valor.

É possível resolver o problema de produtor / consumidor usando semáforos: basta garantir que as operações sejam atômicas e que, em caso de múltiplos processadores, o semáforo seja protegido pro um lock TSL.

→ Usar semáforos requer cuidado, afinal, operações desordenadas geram códigos imprevisíveis e irreprodutíveis (problemas!!)

---
#### Monitores
Monitores surgem com a ideia de escrever códigos seguros para multiprocessamento.

Monitores são **coleções de procedimentos, variáveis e estruturas de dados**, agrupadas em um tipo de pacote.

Processos podem chamar precedimentos dos monitores como quiserem, **mas jamais acessar diretamente os dados internos**.

> Para evitar race conditions, **apenas um processo pode estar ativo no monitor em um dado instante**.

Monitores verificam se já existe algum processo trabalhando neles e, em caso positivo, colocam o novo processo que está tentando acessá-lo em bloqueio.

> Monitores podem ser implementados utilizando **semáforos binários**.

Nos monitores, as operações `signal` e `wait` funcionam de modo similar às utilizadas nos semáforos. Aqui, entretanto, existe uma exclusão mútua que impede os erros comuns que ocorreriam em `sleep` e `wakeup`.
