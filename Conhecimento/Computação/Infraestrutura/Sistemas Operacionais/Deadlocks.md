São impasses que ocorrem no compartilhamento de recursos entre [[Processos]].
Deadlocks ocorrem quando processos bloqueiam, mas não voltam desse estado.

São como dependências circulares:
- O recurso 1 está alocado para o processo A
- O processo A solicita o recurso 2
- O recurso 2 está alocado para o processo B
- O processo B solicita o recurso 1
- Deadlock!

> É comum representar deadlocks como grafos

Os deadlocks ocorrem, principalmente, quando os recursos em questão são exclusivos (impressora, HD, etc)

As 4 condições para haver deadlock:
- Recurso único, com exclusão mútua
- Retenção de recurso e espera por outro(s) recurso(s)
- Inexistência de preempção (ou seja, não pode haver interrupção no uso)
- Espera circular (ciclo em relação ao processos)