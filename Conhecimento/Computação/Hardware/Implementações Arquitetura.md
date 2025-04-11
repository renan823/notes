
Para simplificação, as operações implementadas serão:
- add, sub, and, or (tipo R)
- lw (tipo I)
- sw (tipo S)
- beq (tipo B)

#### Monociclo
Instruções executadas em um único ciclo de clock (considerar a instrução mais demorada)

#### Multiciclo
Instruções divididas em etapas, com cada etapa sendo executada em um ciclo.

IF: Instruction fetch -> Memória
ID: Instruction decode + fetch operands -> UC + registradores
EX: Execution -> ULA
MEM: Memory address -> Memória
WB: Write back -> Registradores

> Exemplo: Etapas das instruções
> add -> IF, ID, EX, WB
> lw -> IF, ID, EX, MEM, WB
> sw -> IF, ID, EX, MEM
> beq -> IF, ID, EX, MEM (apenas usa o ciclo da memória, não escreve lá)

O ciclo de clock considera a etapa mais demorada.
Etapas precisam, preferencialmente, ter o mesmo tempo. 

> Etapas grandes atrasam as coisas, afinal, a mais lenta define a demora!

### Pipeline
Instruções divididas em etapas, mas com execuções sobrepostas no tempo (sobrepor estágios). Todas as instruções passam por todos os estágios, mesmo não executando em algum deles.

Problemas do pipeline:
- Dependência de dados: dado não está pronto na etapa que é requisitado
- Bolhas no pipeline: atrasar instruções para executar com dados corretos
- Dependência estrutural: componentes são requisitados por instruções diferentes ao mesmo tempo.