 Os [[Sistemas Operacionais]] devem atuar nos dispositivos de [[Entrada e Saída (IO)]] para prover um interface de programação, se preocupando não com a implementação do dispositivo, mas em como programá-lo.

> As unidades de I/O possuem, geralmente, duas partes: Controlador do dispositivo (programável) e Componente mecânico.

As controladoras são responsáveis por comunicar o elemento de I/O com o SO, usando uma interface padrão. Algumas controladoras podem gerenciar mais de um dispositivo ao mesmo tempo.

Controladoras possuem registradores e/ou buffers para armazenar estados.

Os dispositivos de entrada e saída podem ser classificados em dois grupos (definição, no entanto, não muito precisa):
- **Dispositivos de bloco:** Permitem a leitura e escrita em blocos com tamanho definido. Permitem operações como o `seek`.
- **Dispositivos de caractere:** Permitem a leitura e escrita de um conjunto de caracteres, sem estrutura de bloco.


### Comunicação
O SO gerencia, usando drivers, a comunicação com as controladoras.

> Essa comunicação é em baixo nível ([[Assembly]]), e permite enviar e receber informações sobre o dispositivo.

![[barramento_es.png]]
A comunicação entre a [[CPU]] e as controladoras é feita via barramento.

O processador precisa se comunicar com os registradores internos de cada dispositivo. Para isso, existem 3 estratégias:
###### Porta
Cada registrador possui uma porta, que varia de 8 a 16 bits.
É usado na maioria dos casos em SOs modernos.

###### Memory Mapped
Permite alocar um endereço de memória para cada registrado (preferencialmente no topo da [[Memória RAM]], protegido do acesso por [[Processos]]).
Possibilita o uso de linguagens de alto nível, já que os registradores estão em memória.

É usado, principalmente, para dispositivos de vídeo.

###### Híbrida
Na estratégia híbrida, **registradores são mapeados em portas e buffers memória**.


### Operações
Existem 3 modos de realizar operações IO:

###### IO Programada
Nesse modelo de comunicação, o processador é o responsável pelo operação → Exige um "programa" para lidar com o dispositivo.

A CPU verifica o estado do dispositivo, envia a solicitação e aguarda a resposta.

Como o processador é mais rápido, ocorre a **espera ocupada (busy waiting)**, com a necessidade de verificar se a ação foi concluído pelo módulo de IO.

###### IO via Interrupção
Também é uma comunicação entre processador e o módulo de IO → Exige um "programa" para lidar com o dispositivo.

A CPU verifica o estado, envia a solicitação e é liberada.
Quando o dispositivo concluir a tarefa, o mesmo interrompe a CPU, que a tende ao pedido com prioridade.

Nesse caso, a CPU não precisa fazer busy waiting.

###### IO via Acesso Direto à Memória (DMA)
A comunicação aqui não envolve o processador: O dispositivo se comunica diretamente com a memória.

> Exige que cada módulo possua um processador interno, para substituir a CPU (algo muito comum hoje em dia).

A DMA não envolve a CPU no processo, apenas "pega" alguns ciclos para executar.

