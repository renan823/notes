Protocolo de transferência de hipertexto, usado para mover dados entre cliente e servidor na web.

Para criar a comunicação, é necessário estabelecer a conexão com o servidor e então fazer uma **requisição**.

> Na requisição, indicamos qual é o dado que desejamos buscar!

Uma vez recebida a requisição, o servidor irá processá-la.
Após o processamento, uma **resposta** é devolvida, geralmente trazendo os dados solicitados.


### Métodos HTTP
Indicam a operação que deve ser realizada no servidor.

Métodos seguros (não alteram dados, apenas buscam)
- **GET**: busca um dado, podendo enviar certos parâmetros via URL
- **HEAD**

Métodos inseguros (fazem alterações no servidor)
- **POST**: coloca dados ao servidor usando o corpo da requisição
- **PUT**: altera dados no servidor usando o corpo da requisição
- **DELETE**: remove dados do servidor usando um id

> Métodos idempotentes são aqueles que, independentemente do número de chamadas, sempre possuem o mesmo resultado (GET, HEAD, PUT, DELETE)


**Métodos são convenções!** O servidor pode receber um método GET para fazer uma remoção...
Manter um padrão é necessário!


### Requisição


### Resposta


### Segurança
Os dados na internet percorrem pontos via [[TCP/IP]]. Assim, dados podem ser interceptados entre o ponto de partida e chegada, perdendo privacidade.

Para a resolução, o **HTTPS** foi criado, unindo a tecnologia HTTP com [[SSL]]. 
A maioria dos ataques que pegam dados expostos são evitados, devido à adesão dos dados criptografados.

Usualmente, um [[Proxy]] é responsável por criptografar e gerenciar requisições HTTP, tornando um simples servidor sem segurança em um mais seguro.





