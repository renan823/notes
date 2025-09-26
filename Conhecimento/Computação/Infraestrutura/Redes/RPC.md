O protocolo RPC (**remote procedure call**) permite a comunicação entre processos em máquinas diferentes, como se os processos estivessem na mesma máquina.

Ao utilizar o protocolo RPC, o sistema atua como se estivesse lidando com uma chamada local, com passagem de parâmetros e espera por execução.

### Client - Server
A interface local RPC atua como a função a ser chamado no servidor.
Ao ser executada, o stub RPC (interface que converte as chamadas em mensagens) utiliza do **runtime RPC**, encontra o servidor cuja função está sendo requisitada e então envia a chamada juntamente dos parâmetros.

![[rpc_communication.png]]
A função local aguarda até resposta do servidor, dando continuidade no processo.


### Tipos de conexão
O RPC permite três tipos de conexão entre cliente e servidor, cada qual com usos específicos:

- **Callback RPC:** cliente e servidor podem fazer chamadas entre si. Útil para sistemas **peer-to-peer**
- **Batch RPC:** une várias chamadas de clientes e envia tudo de uma vez ao servidor. Útil para "economizar" rede, quando chamadas são raras.
- **Broadcast RPC:** permite que a mensagem do cliente seja difundida entre vários servidores. Útil quando vários servidores podem responder à uma mesma requisição.

### Binding
Do cliente ao servidor, a função é chamada, convertida em mensagem, enviada ao servidor correto, lida, convertida em chamada (local) e o resultado é retornado.

Por ser um protocolo binário, o RPC precisa "empacotar" e "desempacotar" os dados, o que implica em especificar a tipagem dos dados.
![[rpc_call.png]]

### Aplicações
Embora um conceito antigo (~1980), novas bibliotecas e ferramentas implementam versões atuais do RPC, que permitem um excelente modelo de comunicação binária e tipada entre serviços.

**Vantagens:** fácil comunicação, interface simples (esconde implementação),  flexibilidade.
**Desvantagens:** Mais lento que chamadas locais, vulnerabilidade a falhas maior.

Na área de [[Sistemas Distribuídos]], RPC é amplamentene utilizado para a comunicação entre serviços.
Comumente, o RPC é empregado na comunicação interna dos serviços (ou [[Microsserviços]]).

![[dist_1.png]]
Exemplo de implementação de um sistema usando comunicação RPC (interna) e HTTP (externa).

O cliente (nesse caso API) faz a requisição ao servidor utilizando outros métodos, como HTTP.
A requisição esbarra no **gateway**, a camada que separa a comunicação interna da externa.
O gateway encaminha a requisição, agora em RPC, para o serviço correspondente.
Os serviços se comunicam entre si via RPC, mas não se comunicam com o mundo externo (de nenhum modo).

### Código boilerplate
Bibliotecas modernas possuem ferramentas para tornar código de alto nível em chamadas RPC (tanto cliente como servidor).

O mais comum é o **gRPC**, da Google, que permite a definição das interfaces em um arquivo de texto `proto`. 
O interpretador `protoc` gera os códigos referentes e a tipagem do arquivo `.proto` na linguagem de programação especificada.