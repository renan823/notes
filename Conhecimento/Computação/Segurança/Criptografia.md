É a ferramenta que permite esconder dados a serem enviados de um lado para o outro. Com diferentes técnicas, letras e símbolos serão alterados e embaralhados para dificultar a leitura da mensagem em questão.

Ainda com diversos métodos avançados para esconder os dados, é possível decifrar e quebrar códigos, como feito por Alan Turing com a máquina Enigma durante a [[Segunda Guerra Mundial]]. O avanço da tecnologia permite a criação de novos métodos, tanto para encriptar como para revelar mensagens.

### Cifra de César
Utilizada pelo imperador César para trocar mensagens com outros líderes, a cifra consiste em substituir letras deslocando-as $m$ posições no alfabeto.

> Por exemplo, a palavra "cripto", usando 3 deslocamentos, será escrita "fulswr".

Entretanto, a cifra é facilmente decifrada! 
O número de ocorrência de certas letras e, principalmente, a identificação do deslocamento (e consequentemente a descoberta do alfabeto usado) fazem desse método não utilizável na prática.

### Método RSA
É uma técnica poderosa de criptografia, que envolve os conceitos de [[Aritmética Modular]] e estudos dos restos.

Sua chave pública $n$ é criada pela multiplicação de dois números primos grades $p$ e $q$.

Para trabalhar com RSA é necessário criar um alfabeto (ou conjunto de símbolos) que serão representados como números. Tomemos como exemplo o conjunto de $10$ a $35$, indo de A até Z.

###### Para criptografar
Com o alfabeto definido, basta fazer a pré codificação da palavra.
Por exemplo "RSA" -> $272810$

Após o processo inicial, devemos gerar uma chave de criptografia usando números primos. Em casos reais, os números são suficientemente grandes para "atrasar" a descriptografia. 
Com $p=5$ e $q=7$, a chave é $n=35$

Agora, devemos dividir a mensagem codificada em blocos (que não ultrapassem $n$) para aplicar a regra da codificação.
Com blocos de dois dígitos, teremos $27$, $28$ e $10$

A regra é $b^{\lambda} \equiv a (\mod{n})$, com $b$ sendo o bloco, $\lambda$ uma constante e $a$ o valor criptografado.

Adotando $\lambda = 7$, temos

-> $27^{7} \equiv 13 \mod{n}$
-> $28^{7} \equiv 7 \mod{n}$ 
-> $10^{7} \equiv 10 \mod{n}$ 

Pronto, a mensagem "RSA" foi criptografada para $13-7-10$

###### Para descriptografar
Para retornar o valor criptografado à mensagem original, precisaremos usar a chave pública $n$, criada anteriormente, e uma nova chave $d$.

$d$ é obtido usando os valores primos $p$ e $q$ juntamente do expoente $\lambda$.
$d$ é o inverso de $\lambda [\mod{(p-1)(q-1)}]$ 

Então, basta aplicar a regra para decodificar: $a^{d} \equiv b (\mod{n})$ 

-> $13^{7} \equiv 27 \mod{n}$
-> $7^{7} \equiv 28 \mod{n}$
-> $10^{7} \equiv 10 \mod{n}$ 

Logo, voltando para a mensagem original temos "RSA"

