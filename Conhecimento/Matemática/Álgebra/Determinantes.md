Representam uma **área**.
São aplicados em [[Matrizes]] de diferentes tamanhos, e podem exigir técnicas mais avançados dependendo do tamanho da matriz.

### Método simples
Para matriz 2x2, devemos calcular as duas diagonais, e depois subtrair a diagonal secundária da principal.



### Método de Laplace
Calcula a soma dos cofatores multiplicados pelos items da fileira (linha ou coluna) escolhidos.
##### $$C_{ij} = (-1)^{i+j}D_{ij}$$
O **menor complementar** $D_{ij}$ é o determinante da matriz resultante ao excluir a linha $i$ e a coluna $j$. 

![[laplace.png]]
