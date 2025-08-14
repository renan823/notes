O sistema operacional é a camada que comunica os programas com o hardware, atuando como uma interface.

O SO evita que programas e usuários precisem conhecer e lidar diretamente com as implementações da [[ISA]] e da [[Arquitetura de Computadores]].

> Embora não exista uma definição única, a maioria delas define um SO como "um programa especial, que atua como interface para facilitar as interações entre aplicações e hardware".

O sistema operacional atua como:
- **Juiz**: Aloca e coordena os recursos de hardware (baixo nível mais fácil);
- **Fiscal**: Controla usuários (gerencia dispositivos do computador);
- **Ilusionista**: Esconde e prove abstrações ao hardware real.

### Classificações
Classificações por tipo de carga de trabalho (**workload**):
- **Serial**: Dedica recursos a um único programa, até terminar;
- **Concorrente**: Coordena recursos para alterar entre a execução de vários programas.

Classificação pelo **compartilhamento de hardware**:
- **Monoprogramados**: Mantém apenas um programa em memória para execução;
- **Multiprogramados**: Mantém mais de um programa em memória para execução.

Classificação pela **interação** (determinado por tempo de resposta):
- **Batch (lote)**: Usuário insere lote de dados para processar, mas não consegue interagir durante a execução dos jobs;
- **Interativo**: O usuário pode interagir com os processos em execução;
- **Tempo real**: Respostas muito rápidas, sem necessidade de interação do usuário. Geralmente usados para sistemas que precisam de respostas em tempo crítico para tomar uma ação (por exemplo: usinas, aviões, etc).

### Estrutura
Sistemas operacionais surgiram como um único e grande (bem grande) programa que executa sobre o hardware.
Com sua evolução, a tradicional organização **monolítica** foi quebrada no moderno **micro kernel**.

> O micro kernel fornece a base para a construção do restante do SO, com base em diversos processos concorrentes.

Por sem modular, cada componente do micro kernel administra um parte especifica:
- Sistema de arquivos;
- Gerenciador de processos;
- Gerenciador de rede;
- Gerenciador de memória...

A estrutura monolítica é mais fácil de ser implementada, mas também **é mais suscetível à falhas gerais quando apenas uma parte falha.**

