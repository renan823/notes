

### Simulação Quartus
Para simular, o primeiro passo é configurar o path do ModelSim.
Uma vez feito, é pra estar configurado (forever)

Crie seu circuito e rode a compilação.
Com a compilação concluída (e sem erros), crie um arquivo de WaveForm.
Vá em file -> new -> university wave form.
A tela nova será aberta.

Clique na barra lateral e insert nodes. Selecionar os nós desejados.
Configure também o tamanho do grid (geralmente 1 us).

Selecione o tempo da simulação: edit ->set end time
Lembre-se de colocar um tempo para que todos os teste sejam executados.
Por exemplo: uma simples porta end precisa de no mínimo 4 testes!

Selecione uma variavel, clique em clock overwrite.
Cada variavel terá seu período. Ao eleger uma menos significativa, a significatividade cresce e o período também ($2^n$).
Exemplo: A -> 1; B -> 2; C -> 8; D -> 16...

Clique em simular
O arquivo será salvo e simulação irá começar.