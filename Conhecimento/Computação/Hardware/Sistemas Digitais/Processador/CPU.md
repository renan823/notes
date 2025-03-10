É a unidade de processamento do computador, seu cérebro.

Em sua arquitetura atual, possui propósito geral. Ou seja, cada operação lógica ou aritmética pode ser realizada com base em um código (operação, controlada pela [[UC]]).

### Registradores Internos
A CPU possui bancos de [[Registradores]], responsáveis por manter os dados que serão usados muito próximos da ULA.
Além dos dados em uso nas operações, alguns registradores armazenam "estados" do processador, por exemplo a instrução atual.

- PC: Program counter
- IR: Instruction register
- MAR: Memory address register
- MBR: Memory buffer register
- I/O AR: I/O address register
- I/O BR: I/O buffer register

### Ciclo de Instrução
Para executar uma operação, são necessário dois passos: ciclo de busca e ciclo de execução.

![[ciclos.png]]

O ciclo de busca é responsável por identificar a próxima instrução, acessar o endereço correspondente na memória e trazer esses dados para dentro do processador (nos registradores).

![[ciclo_busca1.png]]
O PC indica qual é o endereço de memória que deve ser buscado.

![[ciclo_busca2.png]]
No endereço identificado, os dados naquela posição são trazidos ao processador via barramento e são armazenados no MBR. O valor do PC é salvo no MAR.

![[ciclo_busca3.png]]
Por último, o PC é incrementado (próxima instrução) e o dado contido no MBR é passado para o IR. 

Desse modo, a instrução é buscada e armazenada no processador para ser usada.

O ciclo de execução é configurado pela UC, e pode ser uma das seguintes operações (ou uma combinação delas):
- Transferir dados entre processador e memória (e vice-versa)
- Transferir dados entre processado e buffers de I/O
- Executar operação lógica/aritmética
- Alterar a sequência de execução (operação de controle)
