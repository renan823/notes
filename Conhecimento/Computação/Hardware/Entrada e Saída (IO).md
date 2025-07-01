Como definido na [[Arquitetura de Von Neumann]], um computador deve ter [[CPU]], [[Memória RAM]] e dispositivos para entrada e saída de dados.

É necessário utilizar controladoras (módulos) de E/S para permitir a comunicação entre a CPU e os periféricos de forma padronizada.
Cada módulo é responsável por gerenciar os dispositivos que estão conectados nele, livrando a CPU dessa tarefa.

### Módulos E/S
---
São responsáveis pela comunicação processado <-> dispositivo.

A comunicação processador -> módulo ocorrem via [[Barramento]] (de dados, controle e endereços), sendo o módulo responsável pela decodificação da instrução recebida.
Informações de estado também são fornecidas (READY, BUSY), principalmente para dispositivos lentos. 

A comunicação módulo -> dispositivo ocorre internamente no módulo, que possui registradores, a lógica de controle e uma interface que adapta a comunicação com o dispositivo em si.

> Módulos de E/S usualmente possuem um **buffer** interno, responsável pelo armazenamento de dados. 
> O buffer pode ser necessário devido às diferentes taxas de transferência de dados (por exemplo, a taxa CPU <-> Memória é muito mais alta que Memória <-> Módulo), evitando reter memória durante transferências lentas. 


**Erros podem ocorrer durante a comunicação!**  
- Falha elétrica ou mecânica
- Padrão de bits alterado

Bits podem ser utilizados para indicar erro (códigos de erro).


### Tipos de operações E/S
---
Existem três técnicas principais para efetuar as operações E/S.

##### E/S Programada
Ocorre entre CPU <-> Módulo E/S, com interrupção da CPU.
Exige um "programa" para lidar com módulos E/S.

Para efetuar uma transferência de dados:
- Verificar estado do dispositivo
- Módulo informa estado ao processador
- Se estiver pronto, processador solicita transferência
- Módulo recebe solicitação
- Módulo obtém dados do dispositivo
- Módulo envia dados

**O processador é MUITO mais rápido que o módulo, e por isso fica travado enquanto espera atualizações de estado e a transferência dos dados.**

Para evitar que a CPU trave nos casos de falha (ficar esperando, mas sem resultados), pode-se utilizar um temporizador.

##### E/S Dirigida por interrupção
Ocorre entre CPU <-> Módulo E/S, com interrupção da CPU.
Exige um "programa" para lidar com módulos E/S.

Tenta melhorar a rotina programada, permitindo que a CPU execute outras tarefas enquanto o módulo prepara / processa seus dados. 
O processador interrompe a instrução que está processando e dá prioridade à informação referente ao módulo E/S

Para efetuar uma transferência de dados:
- Verificar estado do dispositivo (processador continua executando, não espera)
- Módulo informa estado ao processador (processador interrompe instruções e recebe)
- Se estiver pronto, processador solicita transferência
- Módulo recebe solicitação (processador continua executando, não espera)
- Módulo obtém dados do dispositivo (processador continua executando, não espera)
- Módulo envia dados (processador interrompe instruções e recebe)

**Desse modo, o processador não fica parado enquanto espera o módulo trabalhar.**

##### E/S com acesso direto à memória
Conhecida como **DMA**.

Elimina o processador da transferência, que agora é feita Memória <-> Módulo E/S.
Muito útil para grandes quantidades de dados, que viriam a sobrecarregar o processador.

**Exige que os módulos possuam um processador interno, que substitui as operações da CPU.**

Para efetuar transferência de dados:
- CPU programa a transferência de dados da DMA
- DMA executa transferência (processador nem é utilizado)
- DMA encerra transferência e informa o processador  (processador nem é utilizado)
- CPU lê o estado da DMA
- CPU segue o fluxo das instruções

> Com a DMA, o problema é o uso do barramento, que pode ser solucionado com:
> 
> - Roubo de ciclo: usa forçadamente o barramento, e bloqueia as operações da CPU que envolvam barramento. Atrasa a CPU, mas menos do que trocar contexto.
> - Barramento "transparente": usa o barramento quando a CPU não estiver usando, tornando a transferência mais lenta.

### Transferência de dados
---
Dispositivos E/S podem ser classificados de acordo com o modo de transmissão dos dados:
- **Blocos:** Trabalham endereçando blocos. Ex.: HDD.
- **Fluxo:** Trabalham com fluxo contínuo de dados. Podem ser chamados de "dispositivos de caractere". Ex.: Mouse, teclado, áudio.

As conexões de barramento também podem variar:
- Compartilhado
- Compartilhado, mas com dispositivos E/S atrelados em controladora
- Separados, um para RAM - CPU - Controladoras e outro para módulos E/S - Controladora

![[barramento_es.png]]


>Atualmente, módulos E/S são, por definição, **computadores**, com memória e execução de instruções. São chamados de **processadores de E/S**.

### Interfaces
---
São responsáveis por um padrão para a comunicação e conexão dos dispositivos.
Permitem definir como os dados serão transferidos, possibilitando a comunicação de dispositivos totalmente diferentes, desde que saibam se comunicar pela mesma interface.

Para módulos E/S, podem ser:
- **Paralela:** Transmite múltiplos bits no mesmo ciclo. Usa múltiplos fios, mas deve evitar interferência eletromagnética espaçando-os.
- **Serial:** Transmite bit a bit, um por vez. Embora antigamente fosse menos vantajosa devido à tecnologia da época, os avanços tornaram seu uso mais comum.

Outros tipos de interface:
- **Ponto a ponto:** linha dedicada entre módulos de E/S e o dispositivo.
- **Multiponto:** formam um "barramento" entre os dispositivos.

![[interfaces_serial_par.png]]

Exemplos de interfaces comumente utilizadas:
- USB: universal serial bus
- SATA: serial ATA
- KBD: utilizada para teclados
- PS/2: utilizada para mouses
