
Durante a criação e execução de algoritmos, sempre nos preocupamos em alocar e desalocar corretamente a memória. Seja para uma lista, árvore ou matriz. 
O problema se torna maior, extrapolando a área de alocação, quando o volume de dados ques estamos trabalhando é maior que a capacidade de memória - o que não é raro de acontecer!

A memória principal é rápida, sendo usada na execução de todos os programas de um computador.
O sistema de armazenamento, também chamado de memória secundária, é quase oposto à memória, tendo um desempenho muito pior, mas sendo capaz de armazenar muito mais dados.

> Memórias não são duráveis, são voláteis. Seus dados são apagados caso a energia falte.

> Disco persiste seus dados, mesmo na falta de energia. Embora não seja algo eterno, é por um bom tempo! Caso seja necessário um armazenamento mais duradouro, usa-se uma **fita magnética**.


### O problema
Discos são lentos. Muito lentos. O grande avanço na capacidade cobrou seu preço no desempenho, ainda mais quando falamos de tecnologias como o HD. 

Cada disco é composto por "pratos", também chamados de discos. Os pratos possuem uma composição magnética, que será responsável por gravar os dados.
Dentro de um HD, a **cabeça magnética** é a responsável por gravar e ler dados dos discos.

Essas operações exigem uma movimentação, tanto do disco (que está girando), como da própria cabeça, posicionada pelo braço atuador no local correto da operação.

> Todo esse movimento é custoso!!

Para facilitar as operações, cada disco é dividido em trilhas, que por sua vez são divididas em setores. 
**Setores são a menor parte endereçavel no disco, armazenando bytes de informação**.


### Buscando com eficiência
Devido à velocidade reduzida de operações em disco, quando estamos utilizando-o precisamos buscar sempre a eficiência:
- Se possível, efetuar uma única consulta ao disco
- Efetuar o menor número de acessos em disco (caso a única consulta não seja suficiente)
- Ao acessar o dado, traga-o por completo (agrupe-o e devolva tudo que for necessário)


### Custo de acesso
- Seek time: tempo para posicionar a cabeça de leitura
- Rotation delay: tempo necessário para rotacionar o disco até a posição correta
- Transfer time: tempo para descarregar os dados

 No caso dos códigos em C, o programa não salva, necessariamente, os dados na mesma hora que é feita a solicitação. Tudo é uma abstração!

### Aplicações
Sistemas que envolvem armazenamento em arquivos estão presentem corriqueiramente no dia a dia.
O melhor exemplo são os [[Bancos de Dados]], com usa eficácia e eficiência na manipulação de milhões de registros de dados, gerindo [[Índices]], tabelas e consultas.