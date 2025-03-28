É uma arquitetura de conjunto de instruções universal, totalmente **open-source**.

Precisa seguir os requisitos:
- Atender todos os tipos de processador
- Funcionar bem com diversos softwares e ling. de programação
- Acomodar tecnologias de implementação
- Ser eficiente para todo tipo de microarquitetura
- Ser estável (ISA base não muda)

Algumas características:
- 32 ou 64 bits
- 32 registradores de propósito geral
- 32 registradores de ponto flutuante


**Registradores**

| Registrador | Nome     | Descrição                   |
| ----------- | -------- | --------------------------- |
| x0          | zero     | Valor fixo em zero          |
| x1          | ra       | return addres               |
| x2          | sp       | stack pointer               |
| x5/x6/x7    | t0/t1/t2 | Temporário                  |
| x8/x9       | s0/s1    | Salvo                       |
| x10/x11     | a0/a1    | Argumento/retorno de função |
| x12..17     | a2..7    | Argumento de função         |
| x18..27     | s2..11   | Salvo                       |
| x28/x31     | t3/t6    | Temporário                  |

Na RISC, a memória é endereçada a byte, ou seja, a menor unidade de acesso da memória é 1 byte.

- Byte -> 1 byte
- Halfword -> 2 bytes
- Word -> 4 bytes
- Float -> 4 bytes
- Double -> 8 bytes

> Conjunto base para inteiros é o **RV32I**
> Conjunto base para multiplicação/divisão é o **RV32M**
> Conjunto base para float é o **RV32F**
> Conjunto base para double é o **RV32D**


A arquitetura RISC é **load / store**, ou seja, os valores devem estar nos registradores para ser operados! Não existe processamento direto na memória!