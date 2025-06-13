Instruções divididas em etapas, mas com execuções sobrepostas no tempo (sobrepor estágios). Todas as instruções passam por todos os estágios, mesmo não executando em algum deles.

> As instruções ainda são executadas no mesmo tempo (ou até mais!), mas o pipeline permite uma vazão (throughput) maior.

### Tempo de execução
Tempo para executar 100 instruções.
Considerando o ciclo de clock como $10ns$ (da etapa mais demorada).
O pipeline possui 5 etapas.

Para calcular o tempo necessário do pipeline, temos que somar o número de etapas subtraído 1 com o tempo do ciclo -> $(5-1)+100$. Isso resulta no número de ciclos usados.
Agora, basta multiplicar o total de ciclos pelo tempo do clock -> $104*10=1040ns$.

### Implementação

Os sinais gerados na [[UC]] (etapa ID) são propagados pelos registradores intermediários na medida que são necessários paras as próximas etapas.
Salvar os sinais é necessário para entender quais operações/ações serão executadas na etapa atual. 
Caso o sinal não fosse armazenado e propagado, a operação realizada em uma instrução que já passou por ID seria a operação da instrução que atualmente está em ID -> Execução completamente errada!

Dados como resultados da [[ULA]] e flag de zero também serão propagados até serem usados.

O contador (PC) pode ser atualizado com **branch not taken** (padrão, PC + 4) ou com **branch taken** (PC + destino da branch). 

![[pipeline_processador.jpg]]

### Problemas do pipeline

#### Dependência estrutural
Uso simultâneo de recursos por instruções diferentes, em estágios diferentes.
Geralmente, são os casos mais fáceis de serem resolvidos.

> Para conflitos de memória: 
> - Divisão entre memória de instruções e dados.
> - Cache de instruções e dados

> Para conflitos de banco de registradores:
> O acesso ao banco é rápido, mas ainda assim o clock levará o tempo da maior etapa -> acesso à memoria.
> Por isso, é possível dividir o clock e em duas fases: fase baixa para WB e fase alta para ID.
> Como a etapa não é a mais demorada, o ciclo é concluído corretamente.

> Para conflitos de unidades funcionais:
> - Replicar os componentes/unidades


#### Dependência de dados
Ocorre quando um determinado operando requisitado ainda será produzido por uma instrução no pipeline -> hazard (perigo)

- **Dependência verdadeira**: Ocorre quando o operando necessário ainda não foi finalizado. Para corrigir, a execução é atrasada, coincidindo a finalização do operando com seu uso. É chamada de Read After Write (RAW)

- **Dependência Falsa**: Só existe em arquiteturas com execução fora de ordem. Nesses casos, a execução de uma operação fora de ordem pode ocasionar no uso de um operando com valor errado (por exemplo, que já foi processado por uma operação posterior). Assim, para evitar dados errados pela mudança da ordem, o commit, ou seja, o WB, não é executado. O valor é calculado, mas só será feito o WB quando a instrução que depende do operando for finalizado. 


Exemplo:
```
# a = b + c
# c = b + f
# t0 aponta para o inicio da memoria

lw t1, 0(t0) # b
lw t2, 4(t0) # e
add t3, t1, t2 # b + e
sw t3, 12(t0) # a
lw t4, 8(t0) # f
add t5, t1, t4 # b + f
sw t5, 16(t0)
```

Dependências:
- t1 em 3 depende de t1 em 1
- t2 em 3 depende de t2 em 2
- t3 em 4 depende de t3 em 3
- t1 em 6 depende de t1 em 1
- t4 em 6 depende de t4 em 5
- t5 em 7 depende de t5 em 6

> Fazer pipeline inserindo instruções e identificando bolhas

Para melhorar e evitar bolhas, o compilador pode gerar um código otimizado, como:
```
lw t1, 0(t0) # b
lw t2, 4(t0) # e
lw t4, 8(t0) # f - colocado antes no codigo
add t3, t1, t2 # b + e
add t5, t1, t4 # b + f # colocado antes
sw t3, 12(t0) # a
sw t5, 16(t0)
```

Para evitar paradas, entre as dependências devemos ter pelo menos 2 instruções.
Paradas também contam como instrução para "espaçar" instruções.

Outra forma mais eficiente de evitar paradas é **adiantar valores prontos**.
Caso um valor já esteja pronto (passou por EX), e seja requisitado por outra operação, não é necessário guardá-lo no banco e depois buscá-lo novamente, basta usa a saída diretamente de EX ou do MEM.

Esse processo é feito pela **forward unit**, que indica para os MUXs na entrada da ULA quais valores irão passar nas entradas A/B: Valor do banco, valor do EX/MEM.alu_out ou valor do último MUX, depois do WB (o MUX compara alu_out com LMD).

A **forward unit** gera sinais para controlar as entradas A e B da ULA.

![[forward_unit.png]]

**Forward A (FA):**
- 00: Dado no banco de registradores (A)
- 10: Dado do EX/MEM.alu_out
- 01: Dado do MUX após WB

**Forward B (FB):**
- 00: Dado no banco de registradores (B)
- 10: Dado do EX/MEM.alu_out
- 01: Dado do MUX após WB

A geração dos sinais de forward (equivalente para A e B, trocando apenas RS1 e RS2):
```c
if (ex/mem.reg_write == 1) {
	if (ex/mem.rd == id/ex.rs1) { //rs1 -> A, rs2 -> B
		if (ex/mem.rd != 0) { // destino zero? ignorar
			return "FA = 10"; // ou FB
		}

		if (mem/wb.rd != 0) {
			return "FA = 01"; // ou FB
		}
	} 
}
// Default
return "FA = 00"; // ou FB
```


> **Problema do forward**
> O caso em que o forward não consegue cobrir ocorre com a `lw`, afinal, o dado só estará pronto na última etapa. Caso o forward adiante o resultado, teremos apenas o **endereço** do dado, mas não seu conteúdo.
> Nesses casos, a geração de bolhas é necessária.´

Para resolver o problema da `lw` que o forward não consegue é cria a **stop unit**, que determina se o pipeline deve ser travado, gerando uma bolha.

Para seu funcionamento, a stop unit analisa a entrada RS1 e RS2 juntamente dos sinais de controle que indicam leitura da memória e armazenamento no banco de registradores.

![[stop_unit.png]]

Caso um problema seja detectado, ou seja, algum dos operandos é um valor que será lido da memória, sinais de controle são enviados para o PC e para os registradores do IF/ID, impedindo-os de atualizar. Isso bloqueia a busca da próxima instrução, e força a busca da instrução atual no próximo ciclo.

Além de travar a busca da próxima instrução, a unidade deve gerar uma bolha.

> Bolhas são instruções que, mesmo quando concluídas, não afetam em nada o resto da execução, servindo apenas para preencher um espaço e atrasar outra execução.

Para gerar a bolha, a stop unit muda todos os sinais de controle gerados pela UC para zero. Assim, do ID/EX em diante, a bolha entrará no processamento.
No próximo ciclo de clock, caso a dependência esteja eliminada, tudo é destravado e a busca ocorre normalmente.
A bolha seguirá o percurso do pipeline, encerrando como qualquer ou instrução na etapa de WB.

A geração dos sinais da stop unit:
```c
if (id/ex.mem_read == 1) {
	// ir[19..15] = rs1, ir[24..20] = rs2
	if ((id/ex.rd == ir[19..15]) || (id/ex.rd == ir[24..20])) {
		return "Parada + Bolha"
	}
}
// Default
return "Cotinue";
```

#### Dependência de controle
É a dependência causada pelas branchs (desvios).

Um instrução de branch entra no pipeline, mas o resultado (se haverá ou não desvio) aparece somente na fase 3 (EX).
Caso seja necessário um desvio, o que acontece com as instruções que entraram no pipeline após a branch, começaram a ser executadas mas serão inúteis no desvio?

> Caso a branch seja concretizada (branch taken), o pipeline precisa eliminar as instruções que foram inseridas em sequência -> **flush**

Possíveis soluções para os problemas com branch:
- Congelar o pipeline (nada entra) até a branch ser resolvida (**HORRÍVEL!!**)
- Considerar que o desvio não será tomando e seguir fluxo normal
- Antecipar a execução da branch do EX para o ID (um estágio antes)
- Tentar predizer qual caminho será tomado

Uma boa solução é unir a antecipação da branch com a predição.

> Delayed branch: toda instrução após um branch será executada (delay slot)


###### Predição
Pode ser **estática** ou **dinâmica** -> Como é uma previsão, em caso de erros, a bolha é gerada. O objetivo é mitigar bolhas ou flush vindos de branches.

Estática: Não se adapta ao comportamento do programa
- Hardware para inserir bolhas
- Assumir que todos os desvios não serão tomados
- Assumir que todos os desvios serão tomados
- Assumir que todos os desvios com um certo `opcode` serão tomados
- Assumir que todos os desvios para trás serão tomados, e os para frente não (EFICAZ!!)

Dinâmica: Analisa o comportamento do sistema para decidir o desvio.
- **Branch Prediction Buffer** ou tabela de histórico de desvios
- Previsor bimodal (2 bits) -> basicamente um contador (0-3)
- Preditor de relacionamento: analisa os últimos $m$ desvios para prever para escolher entre $2^n$ preditores (cada preditor tem $n$ bits)
- **Branch Target Buffer** -> durante a busca da instrução já se sabe se é desvio