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


##### Ciclo de Busca
O ciclo de busca é responsável por identificar a próxima instrução, acessar o endereço correspondente na memória e trazer esses dados para dentro do processador (nos registradores).
O processador identifica que o ciclo é de instrução, então sabe que a área da memória que será acessada é da seção de instruções.

![[ciclo_busca_completo.png]]

O PC indica qual é o endereço de memória que deve ser buscado.
O barramento deve transmitir 3 tipos de dados para permitir a comunicação CPU-Memória:
- Endereço -> Qual a posição desejada
- Dados -> Valores que serão escritos ou buffer de leitura
- Controle -> Ação de leitura ou escrita

O endereço no PC deve ser armazenado no MAR para então ser buscado na memória. Porém, a instrução pode estar no IR, o que exige um controle de qual dado será usado para acesso na memória.
O controle é feito usando um [[MUX]], que recebe as saídas de ambos PC e IR, e seleciona o correto (via sinal de controle da UC) para ser enviado ao MAR.

No endereço identificado, os dados naquela posição são trazidos ao processador via barramento e são armazenados no MBR. 

O dado contido no MBR é passado para o IR. 
No IR, o Opcode (código da operação) é enviado para a UC, para que então os sinais sejam gerados.

Por último, o PC é incrementado.

> Desse modo, a instrução é buscada e armazenada no processador para ser executada


##### Ciclo de execução
O ciclo de execução é configurado pela UC, e pode ser uma das seguintes operações (ou uma combinação delas):
- Transferir dados entre processador e memória (e vice-versa)
- Transferir dados entre processado e buffers de I/O
- Executar operação lógica/aritmética
- Alterar a sequência de execução (operação de controle)

