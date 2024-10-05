- Linguagem de médio nível
- Diferencia-se do C++ por não possuir objetos 

### Código básico
```c
#include <stdio.h>

int main () {
	printf("hello world\n");
	return 0;
}
```

- "#include <stdio.h>" adiciona funcionalidade input e output (I/O)
- A função main deve retornar 0 (zero), indicando que o programa executou corretamente
- Em caso de erros, o retorno do main é 1 (um)
- Ao rodar o programa, é gerado um executável

### Tipos de dados
- int -> usado para valores numéricos inteiros (1, -10, 250)
- float -> usado para valores numéricos com casas decimais (1.6, 3.1415, -2.75)
- char -> armazena um único caractere; usa-se aspas simples 

### Saída formatada
Para exibir uma variável no console é necessário especificar o tipo da váriavel:
- "%d" ou "%i" -> int
- "%f" ou "%F" -> float
- "%lf" -> double (casas reduzidas)
- "%c" -> char

Desse modo, pode-se combinar diferentes saídas, como:
```c
int age = 10;
float money = 14.5;

printf("I'm %d years old, and I have %f dollars", age, money);
```

Nota: "%c" também pode ser usado para escrever ASCII, basta passar o número correto

Para saídas numéricas formatadas com precisão, usa-se o mesmo formatador do float, mas indicando a precisão:
```c
float money = 7.75654

printf("%f", money); // 7.75654
printf("%.1f", money); // 7.7
printf("%.3f", money"); // 7.756
```

É possível, também, converter dados, tanto manualmente (adicionar o tipo entre parenteses) como automaticamente (o programa realiza a conversão)

### Constantes
- Ao declarar uma constante, usa-se "const"
- Boas práticas sugerem nomear a constante em caixa alta 

### Booleans
O tipo boolean não é nativo, então deve ser importado na biblioteca "<stdbool.h>"

### Operadores
- Igual ao JS