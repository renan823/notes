É a parte responsável por entender as instruções e gerar sinais de controle para executar a operação.

### Sinais de controle
- ALUsrc: Segunda entrada da ULA: 0 -> registradores ou 1 -> imediato
- ALUop: 
- ImmSrc:
- Branch: 0 -> beq ou 1 -> não beq
- MemRead: 0 -> não lê memória de dados ou 1 -> lê memória de dados
- MemWrite: 0 -> não escreve na mem. dados ou 1 -> escreve na mem. dados
- MemToReg: 0 -> dados da ULA ou 1 -> dados da mem. dados
- RegWrite: 0 -> não escreve nos registradores ou 1 -> escreve nos registradores


| opcode | ALUsrc | ALUop | ImmSrc | Branch | MemRead | MemWrite | MemToReg | RegWrite |
| ------ | ------ | ----- | ------ | ------ | ------- | -------- | -------- | -------- |
| Tipo R | 0      | 10    | XX     | 0      | 0       | 0        | 0        | 1        |
| lw     | 1      | 00    | 00     | 0      | 1       | 0        | 1        | 1        |
| sw     | 1      | 00    | 01     | 0      | 0       | 1        | X        | 0        |
| beq    | 0      | 01    | 10     | 1      | 0       | 0        | X        | 0        |
| addi   | 1      | 00    | 00     | 0      | 0       | 0        | 0        | 1        |


