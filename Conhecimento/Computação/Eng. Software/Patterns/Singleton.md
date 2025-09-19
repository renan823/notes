É um [[Design Pattern]] criacional, responsável pela inicialização única de classes.

O padrão **singleton** é muito útil para serviços / contextos que são globais no projeto, em que não há necessidade de instanciar um novo objeto em cada uso.

Singleton pode ser aplicado, por exemplo, em um conexão global com o banco de dados, fornecendo essa única conexão para toas as partes do sistemas que a requisitam.