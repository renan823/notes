
![[decoder_reg.png]]
Uso do decoder para habilitar registradores em uma [[CPU]].

![[decoder_ram.png]]
Uso do decoder em um pente de memória RAM.

Cada um dos chips de memória possui 2GB, totalizando 8GB ao todo.
2GB de dados são representados por $2¹.2^{30}$, o que resulta em 31 bits. Para dados + endereçamento, são necessários 33 bits.
O decoder "habilita" a escrita na memória alvo. Todas estão conectadas ao barramento, mas somente uma será ativada por vez.