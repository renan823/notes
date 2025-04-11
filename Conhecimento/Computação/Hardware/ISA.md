
É a **Instruction Set Architecture** .

Para definir um arquitetura, é necessário:
- Quantidade e funções dos registradores
- Tipo das instruções 


### Tipos da instrução
Na [[RISC-V]], existem 6 tipos de instruções (todas de 32 bits):
- Tipo R: register
- Tipo I: immediate
- Tipo S: store
- Tipo B: branch
- Tipo U: upper
- tipo J: jump


### Tipo R
Exemplo: add 

`add <rd>, <rs1>, <rs2>`

`add s2, s1, s0`
`f7 (7 bits) | rs2 (5 bits) | rs1 (5 bits) | f3 (3 bits) | rd (5 bits) | opcode (7 bits)`

- Código da operação: 0110011
- F3: 000
- F7: 0000000

> O campo de bits F7 existe apenas em operações do tipo R

`0000 0000 1000 0100 1000 1001 0011 0011` -> Instrução em binário
`0x00848933` -> Instrução em hexa 

### Tipo I 
Exemplo: lw

`lw <rd>, imm(<rs1>)`

`lw s2, 0(sp)`
`imm (12 bits)) rs1 (5 bits) | f3 (3 bits) | rd (5 bits) | opcode (7 bits)`

- Código da operação: 0000011 (código para loads)
- F3: 010 (diz que é um load de word)

`0000 0000 0000 0001 0010 1001 0000 0011` -> Instrução em binário
`0x00012903` -> Instrução em hexa

### Tipo S
Exemplo: sw

`sw <rs2>, imm(<rs2>)`

`sw s2, 0(sp)`
`imm[11:5] (7 bits) | rs2 (5 bits) | rs1 (5 bits) | f3 (3 bits) | imm[4:0] (5 bits) | opcode (7 bits)`

- Código da operação: 0100011
- F3: 010 (diz que é um store de word)

> Nas arquiteturas, existe um componente que irá "unir" os bits do imm que estão separados

`0000 0001 0010 0001 0010 0000 0010 0011` -> Instrução em binário
`0x01212023` -> Instrução em hex

### Tipo B
Exemplo: beq

`beq <rs1>, <rs2>, imm`

`beq s0, s1, 2`
`imm[12] imm[10: 5] (7 bits) | rs2 (5 bits) | rs1 (5 bits) | F3 (3 bits) | imm[4:1] imm[11] (5 bits) | opcode (7 bits)`

- Código da operação: 1100011
- F3: 000 (diz que é uma beq)

`0000 0000 1001 0100 0000 0010 0110 0011` -> Instrução em binário
`0x00940263` -> Instrução em hexa

### Tipo U
Exemplo: lui

`imm[31:12] (20 bits) | rd (5 bits) | opcode (7 bits)`

- Código da operação:


### Tipo J
Exemplo: jal

`jal s0, -4 // Pular 4 meia palavras para trás`
`imm[20] imm[10:1] imm[11] imm[19:12] (20 bits) | rd (5 bits) | opcode (7 bits)`

- Código da operação: 1101111
- Valor imediato do -4: 111111111111111111100

`1111 1111 1001 1111 1111 0100 0110 1111` -> Instrução em binário
`0xFF9FF46F` -> Instrução em hexa


``