Usado para sequências de dados com um range muito grande, porém, com valores próximos.

Sempre usamos o primeiro como "pivô", mantido integralmente. Depois, cada valor será representado pela diferença com seu anterior.
Então, basta aplicar Huffman para o número de bits dos valores gerados pelas diferenças e gerar a árvore.
Os símbolos gerados serão "unidos" aos binários das diferenças, assim indicando quantos bits serão lidos -> símbolos de tamanhos variáveis!

Este método é usado na codificação JPEG
