São unidades de memória utilizadas como base para diversos circuitos.
A presença de dispositivos de memória permite armazenar estados entre etapas de um circuito.

Os circuitos com memória precisam de um tempo mínimo para atualizar seu valor. 
Esse tempo é o **setup e hold**, em que o valor a ser salvo deve estar pronto um pouco antes de ser salvo, e não deve ser alterado por um pequeno período para ser armazenado corretamente.
![[setup_hold.png]]

Caso uma dada operação seja demorada, é comum armazenar resultados intermediários em dispositivos de memória. Assim, o processamento é dividido em etapas, e pode seguir de onde parou.

> Métodos de clean/reset são necessários para garantir integridade dos valores presentes na memória (lixo pode estar ali!)

O **D latch** é o precursor dos flip-flops, e também uma melhoria de outras versões de latch (como o SR), que possuíam valores indefinidos em algumas entradas.
![[latch.png]]

O **flip-flop D** é construído utilizando dois latches, um mestre e um escravo.
Tudo é controlado via clock, atualizando valores na borda de clock (subida ou descida).
![[ffd.png]]


Um **flip-flop T** funciona invertendo o valor que está armazenado ali.
Útil para [[Contadores]].
![[flip_flop_t.png]]