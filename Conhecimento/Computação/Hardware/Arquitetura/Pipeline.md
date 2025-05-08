Instruções divididas em etapas, mas com execuções sobrepostas no tempo (sobrepor estágios). Todas as instruções passam por todos os estágios, mesmo não executando em algum deles.

> As instruções ainda são executadas no mesmo tempo (ou até mais!), mas o pipeline permite uma vazão (throughput) maior.

### Tempo de execução
Tempo para executar 100 instruções.
Considerando o ciclo de clock como $10ns$ (da etapa mais demorada).
O pipeline possui 5 etapas.

Para calcular o tempo necessário do pipeline, temos que somar o número de etapas subtraído 1 com o tempo do ciclo -> $(5-1)+100$. Isso resulta no número de ciclos usados.
Agora, basta multiplicar o total de ciclos pelo tempo do clock -> $104*10=1040ns$.


### Implementação
![[pipeline_processador.png]]

### Problemas do pipeline

##### Conflito Estrutural
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


##### Dependência de dados
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

##### Dependência de controle

