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

### Tempo de execução
Tempo para executar 100 instruções.
Considerando o ciclo de clock como $10ns$ (da etapa mais demorada).

Não é possível dizer exatamente o tempo de cada instrução, já que elas podem ter etapas variadas. Resolvemos isso utilizando uma média de tempo, que será $4.2ns$.

São 100 instruções, cada qual usando 4,2. Temos que o número de ciclos necessários é $100*4.2$. Basta, então, multiplicar o tal de ciclos pelo tempo de cada ciclo -> $100*4.2*10 = 4200ns$  

> Colocar grafico aqui!!!!

