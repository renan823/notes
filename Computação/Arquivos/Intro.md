
### A necessidade
Memória e armazenamento são finitos! Isso é um fato bem claro.
A memória principal é rápida, sendo usada na execução de todos os programas de um computador.
O sistema de armazenamento, também chamado de memória secundária, é quase oposto à memória, tendo um desempenho muito pior, mas sendo capaz de armazenar muito mais dados.
A memória é volátil, bastando uma apagão para todos os dados serem perdidos.

### O problema
Discos são lentos. Muito lentos. O grande avanço na capacidade cobrou seu preço no desempenho, ainda mais quando falamos de tecnologias como o HD.

Não por acaso, a ideia de organizar, indexar e estruturar sistemas de dados vêm com o propósito de deixar as operações em memória secundária minimamente viáveis no quesito eficiência.

### Buscando com eficiência
- Se possível, efetuar uma única consulta ao disco
- Efetuar o menor número de acessos em disco (caso a única consulta não seja suficiente)
- Ao acessar o dado, traga-o por completo (agrupe-o e devolva tudo que for necessário)

### Manipulando arquivos em C
A biblioteca padrão do C oferece manipulação em arquivo por meio de streams.
As streams fornecem uma interface de comunicação entre o C e o SO (quem realmente manipula os arquivos).