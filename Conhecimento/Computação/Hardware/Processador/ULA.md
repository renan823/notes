Entrada:
- N bits no argumento 1
- N bits no argumento 2
- T total de operações
- M bits para a operação ($m = \log_{2}{T})$

Saída:
- N bits no resultado da operação
- Bits de flags (1 bit para cada flag):
	- Zero (Z)
	- Negativo (N)
	- Overflow (V)
	- Carry out (C)


> A unidade de controle recebe os sinais da [[UC]] 


#### ALU Control
- lw/sw: 00 (realiza +)
- beq: 01 (realize -)
- tipo R: 01 (depende de f3 e f7)

### Somadores

![[full_adder.png]]

![[ripple_adder.png]]

### Subtratores

### Somador-Subtrator

![[soma_sub.png]]

### Multiplicadores

### Divisores