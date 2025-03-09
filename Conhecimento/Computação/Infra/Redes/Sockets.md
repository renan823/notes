Sockets são um modo de comunicar programas usando os `file descriptors` da Unix.

**File Descriptors**, são, nada mais, que valores inteiros associados a um arquivo que esteja aberto. Não importa qual o tipo do arquivo, e esse é ponto por tras dos sockets.

Para acessar o `file descriptor` associado ao arquivo de socket, devemos usar a função `socket()` para então enviar/receber mensagens.

Como tudo em Unix *é* um arquivo, poderíamos escrever e ler dados do socket usando funções padrões do [[C]], como `write` e `read`. Sim, nós podemos. Mas usar função específicas garante maior controle sobre o envio dos dados. Para isso, usamos `send` e `recv`.

2.1

### Implementação e Exemplos

##### Bibliotecas
- `sys/socket.h` para manipular socket
- `netinet/in.h` para IP e endereços
- `arpa/inet.h` para funções auxiliares
- `unistd.h` para fechar socket Unix

