São sistemas e serviços que funcionam em máquinas separadas, mas comunicantes entre si.

Podem ser empregados em problemas naturalmente distribuídos, como **distribuição geográfica**, ou também em problemas cuja carga de trabalho é grande.

![[dist_1.png]]

Alguns vantagens incluem:
- **Fault Tolerance**
- **Isolamento** (envolve questões de segurança)
- **Processamento paralelo**
- **Distribuição geográfica**

> Sistemas distribuídos são amplamente empregados nas big techs devido ao alto fluxo de dados e grande dispersão global

Porem, sistemas distribuídos adicionam uma "camada extra" de complexidade no desenvolvimento de software, o que pode acarretar em erros como:
- Dificuldade de manutenção
- Erros variados e não muito previsíveis
- Problemas de performance (quando mal implementado)

Muitas vezes, por influência externa, projetos que NÃO precisam investir na solução envolvendo sistemas distribuídos acabam optando por.
Isso gera uma carga extra de trabalho e complexidade, que poderia ter sido evitado.
![[dist_no_dist.png]]

> A regra é simples: **Se puder NÃO utilizar sistemas distribuídos, NÃO utilize.**


### Princípios
---

##### Escalabilidade
É intuitivo pensar que com duas vezes mais computadores a saída de dados será, também, duas vezes maior.

A capacidade de escalar um sistema envolve identificar os **gargalos: pontos em que o sistema "engasga", falha ou demora pra responder quando há alta demanda**.

![[dist_bottleneck.png]]

Como evitar, por exemplo, sobrecarregar sistemas de ingresso quando um show muito aguardado é liberado?
Ou então, como garantir que dados estarão consistentes entre 5 cópias de banco de dados?

Problemas de escalabilidade devem ser monitorados (existem ferramentas para tal) e cuidadosamente analisados, para então pensar e implementar as possíveis soluções.

##### Tolerância a falhas
Lidar com um pequeno servidor local é algo minimamente trabalhoso: é necessária manutenção recorrente, avaliação de ataques (por exemplo, DDoS), falta de energia, etc.

Em um sistema com múltiplos computadores, o problema é bem maior.

As quedas de energia, tentativas de ataque e até manutenção preventiva são momentos inoportunos em que o serviço fica "fora do ar".

> Um bom sistema distribuído deve saber lidar com essas falhas

É necessário verificar a **avaliabilidade** do serviços: por quanto tempo por dia (mês / ano) este serviço fica offline?

Em caso de falha, é necessário haver um mecanismo de **recuperação**.
Como retomar as atividades que ocorriam antes da falhas?

Para casos como esse, é necessário um **armazenamento não volátil**, e, principalmente, **replicação de dados  nas outras máquinas do serviço**.

##### Consistência de dados
Ao trabalhar com replicas de dados entre máquinas, é necessário algum método para mante-los consistentes.

Quando um certo dado é atualizado numa máquina, é necessário atualizá-lo, também, em todas as outras máquinas que possuem sua replica.

> Alguns sistemas distribuídos são **fracamente consistentes**, o que implica em um esforço menor pela manutenção da consistência de dados.