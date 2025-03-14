Representa a interface entre o hardware e o software, permitindo que exista interação e programação de componentes para executar tarefas.

Contempla a comunicação entre máquina e programador.

### Interfaceamento
Para permitir a execução de programas, é necessário usar a interface fornecida pelo sistema para colocar instruções usando linguagens montadoras, como o [[Assembly]], muito próximas ao código de máquina.

Linguagens montadores são o modo para colocar instruções para executar, controlando [[Registradores]] e o processamento dentro da [[CPU]].

### Sistema Computacional
Conjunto **hardware - software**, usado como ferramenta para a resolução de problemas.

- Hardware: Aquilo que você chuta (físico)
- Software: Aquilo que você xinga (não físico)

### Arquitetura X Organização
A arquitetura define a interface, apenas. Tudo está visível ao programador. O conjunto de instruções também é visível.

A organização de computadores implementa os contratos definidos na interface. O programador não sabe o que acontece ali.

> Exemplo: A interface define a operação multiplicação. Na organização, a multiplicação pode ser implementada, por exemplo, com somas sucessivas, mas isso não é de interesse da interface, nem do programador.

- Existem diferentes implementações para a organização -> é variável entre versões!
- A interface não muda frequentemente -> compatibilidade de código!

### Arquitetura de "X bits"
Quando dizemos que uma arquitetura é "32 bits" ou "64 bits" estamos nos referindo ao **número de de bits presentes nos registradores do processador.**

A mudança de 32 para 64 foi necessária para endereçar memória. Antigamente, o máximo de memória que poderia ser endereçada era de 4GB ($2^{32}$). A necessidade de mais endereços fez com que surgisse a arquitetura de 64 bits. 

Apesar da tamanha capacidade, atualmente (2025), usamos 48 dos 64 bits disponíveis, tendo como máximo 256TB ($2^{48}$) de memória disponível para endereçamento.

**A expansão para 128 bits ainda é questionada, já que não existe nenhum tipo de memória que possua tanta capacidade -> Na casa de Iota bytes!**

### Estrutura do Computador
Um computador é um sistema complexo! São milhões de componentes eletrônicos unidos para computar e calcular nossas operações.

Para descrever um computador, usaremos um **sistema hierárquico**, com camadas superiores escondendo detalhes das inferiores. 

Cada nível conta com estrutura e função:
- **Estrutura**: maneira pela qual os componentes relacionam-se entre si.
- **Função**: operação de componentes individuais, como parte de uma estrutura.

##### - Sistema Hierárquico de Tanenbaum
Possui 6 níveis, dividindo as responsabilidades entre cada um deles.

- 5: Nível da linguagem orientada à problema (alto nível)
- 4: Nível de Assembly
- 3: Nível do Sistema Operacional (gerenciamento de recursos)
- 2: Nível do conjunto de instruções (instruction set)
- 1: Nível da microarquitetura 
- 0: Nível da lógica digital


### CISC x RISC
- CISC -> Complex Instruction Set Computer
- RISC -> Reduced Instruction Set Computer

A CISC possui instruções maiores e mais complexas. Algumas arquiteturas CISC (como a x86) apresentam a interface para o usuário no formato de instruções complexas, mas, internamente, existem decodificadores que tornam essas operações complexas em micro-operações (que são RISC).

>Instruções CISC podem ocupar uma tamanho variável de bytes.
>Instruções RISC possuem sempre a mesma quantidade de bytes.

ISA -> Instruction Set Architecture

### RISC-V
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