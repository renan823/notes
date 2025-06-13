É um framework distribuído para processamento de grandes quantidades de dados de forma eficiente.

O spark possibilita a criação de clusters, responsáveis pelo processamento dos dados. Caso seja necessário, a quantidade de clusters pode ser ajustada, para mais ou para menos.

O spark opera os **RDDs - Resilient Distributed Datasets**, que permitem abstrair um conjunto de dados imutável e distribuído. Os RDDs permitem operações paralelas e recuperação de falhas (armazenam a sequência de operação que foram realizadas, reconstruindo em caso de perda).

As operações realizadas pelo spark podem ser:
- **transformations:** retornam um novo RDD. São `layzy`, apenas executando quando consumidas.
- **actions**: acionam o processamento de fato, podem retornar valores numéricos, listas, etc

> A vantagem do spark sobre o hadoop é a redução do uso de disco (disk I/O), já que o map reduce aplicado pelo hadoop usa muito mais o disco. Por ser em memória primária, o spark elimina esse fator.

O spark pode ser usado para processar dados de sensores, grandes grafos, modelos de IA, BI, etc.