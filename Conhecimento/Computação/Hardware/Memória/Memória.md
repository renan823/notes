Todo e qualquer componente capaz de armazenar bits de informação.
Depende do ciclo de clock para atualizar seus valores.

> [[Flip-Flops]], [[Registradores]], [[Memória RAM]], [[Cache]]

Características desejáveis:
- Grande capacidade
- Rápida
- Baixo custo

-> São características conflitantes!


### Hierarquia de Memória
Tenta resolver o problemas das características desejáveis na memória, adaptando cada vantagem para usos específicos dentro do computador.

> IMAGEM DA PIRAMIDE DE MEMORIA

Topo -> armazenamento na placa: registradores, cache e RAM;
Meio -> fora da placa: HD | SSD | Flash e CD | DVD;
Base -> offline: fita magnética.

Do topo para base: a velocidade cai, a capacidade aumenta e o preço (por bit) diminui.


|           | Tempo de acesso     | Custo (GB)    |
| --------- | ------------------- | ------------- |
| SRAM      | $0.5$ - $2.5ns$     | $500 - $1000  |
| DRAM      | $50$ - $70ns$       | $10 - $20     |
| Flash     | $5*10³$-$5*10⁴ns$   | $0.75 - $1    |
| Fita Mag. | $5*10⁶$- $20*10⁶ns$ | $0.05 - $0.10 |

##### Características
- Localização: 
	- Memória primária (RAM, registradores) 
	- Memória secundária (disco)

- Capacidade: 
	- Tamanho da palavra
	- Número de palavras
	- Endereçamento por byte ou palavra

- Unidade de transferência:
	- Memória principal: N° de bits escritos/lidos da memória de uma vez (uma palavra inteira, mesmo que apenas 1 byte seja requisitado, por exemplo)
	- Memória secundária: blocos (páginas) de disco

- Formas de acesso:
	- Sequencial: dados organizados em registros, com variação de tempo para acessar diferentes registros (pior caso é percorrer tudo) -> fita magnética
	- Direto: dados organizados em blocos, também com tempo de acesso variável, com cada bloco tendo seu endereço (único) -> HD / SSD
	- Aleatório: cada posição possui um endereço (único), com tempo de acesso constante -> RAM
	- Associativo: compara bits do endereço com o "pedaço" do endereço que foi salvo junto com os dados, similar às [[Tabelas Hash]] (chamado de **tag**) -> cache

- Desempenho:
	- Tempo de acesso: tempo para realizar escrita/leitura, ou posicionar o cabeçote de leitura
	- Tempo de ciclo de memória: em memória de acesso aleatório, é o tempo para que o sistema  esteja pronto para acessar novamente
	- Taxa de transferência: tempo para transferir dados de/para a memória

##### Características físicas
A memória pode ou não ser apagada/reescrita.

##### Organização
É o arranjo físico de bits para formar uma palavra.
Como organizar os acessos às pastilhas da RAM, por exemplo? Com demux?