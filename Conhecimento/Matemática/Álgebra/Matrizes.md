
- Tabela
- **M** linhas;
- **N** colunas;
- **M x N** valores;
- Diz-se matriz do **tipo M x N**;
- Um array multidimensional (?).


### Matriz linha/coluna
- Matriz linha é aquela que possui uma única linha (M = 1);
- Matriz coluna é aquela que possui uma única coluna (N =1)

### Matriz quadrada
- **M = N**;
- Possui diagonais;
- $A_{11}-A_{MN}$  -> Diagonal principal;
- $A_{1N}-A_{M1}$ -> Diagonal secundária;
- Diz-se matriz **Origem N** (Ex.: Origem 3, etc)
Exemplo:
$$
\begin{bmatrix}
A_{11} & A_{12} & \cdots & A_{1N} \\
A_{21} & A_{22} & \cdots & A_{2N} \\
\vdots & \vdots & \ddots & \vdots \\
A_{M1} & A_{M2} & \cdots & A_{MN}
\end{bmatrix}
$$

### Função de formação
- Define um modo para "construir" uma matriz
- Nem todas possuem uma função de formação
Exemplo:
$$
C_{2x3} / A_{ij} = i + 2j
$$
No exemplo, a matriz C possui 2 linhas e 3 colunas.
**i** e **j** são os índices da matriz, sendo i as linhas e j as colunas.
Nesse caso, os elementos nos respectivos índices serão formados pela função de formação.
Exemplo completo:
$$
\begin{bmatrix}
 3 &  5 & 7 \\
 4 & 6 & 8 \\
\end{bmatrix}
$$

### Matriz nula
- Todos os valores são 0 (zero).

### Matriz oposta
- Trocar sinais.

### Matriz transposta
- Trocar linhas por colunas;
- **Matriz simétrica** -> Quando a matriz transposta é igual a original.
Exemplo:
$$
C =
\begin{bmatrix}
 3 &  5 & 7 \\
 4 & 6 & 8 \\
\end{bmatrix}
\\
-> C^T = 
\begin{bmatrix}
3 & 4 \\
5 & 6 \\
7 & 8 \\
\end{bmatrix}
$$

### Igualdade entre matrizes
- Devem ser do mesmo tipo;
- Elementos na mesma posição são iguais
Exemplo:
$$
\begin{bmatrix}
 x² & y \\
 -x & y² \\
\end{bmatrix}
=
\begin{bmatrix}
 1 & -1 \\
 -1 & 1
\end{bmatrix}
$$

### Soma de matrizes
- Devem ser do mesmo tipo;
- Somam-se os valores na mesma posição.
Exemplo:
$$
\begin{bmatrix}
 7 &  5  \\
 4 & 10  \\
\end{bmatrix}
+
\begin{bmatrix}
 3 &  8 \\
 14 & 0  \\
\end{bmatrix}
=
\begin{bmatrix}
 10 &  13  \\
 18 & 10\\
\end{bmatrix}
$$

### Subtração entre matrizes
- Devem ser do mesmo tipo;
- Subtraem-se os valores na mesma posição.
Exemplo:
$$
\begin{bmatrix}
 7 &  5  \\
 4 & 10  \\
\end{bmatrix}
-
\begin{bmatrix}
 3 &  8 \\
 14 & 0  \\
\end{bmatrix}
=
\begin{bmatrix}
 4 &  -3  \\
-10 & 10\\
\end{bmatrix}
$$


[[Determinantes]]