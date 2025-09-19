**Amazon Web Services** são o conjunto de serviços oferecidos pela Amazon em sua plataforma de [[Cloud]]. As solução são muito diversas, com servidores, SaaS e até bancos de dados.

A AWS foi criado inicialmente para atender as demandas internas da própria Amazon, primeiramente com o S3 e o EC2. 
A aplicação foi oferecida para o mercado externo pelo método "pay-as-you-go", ou seja, pague apenas por aquilo que está usando.

Atualmente, possui mais de 200 serviços, nas mais diferentes áreas.

### Alta disponibilidade
Para melhor atender os usuários, os servidores estão distribuídos em regiões, que são espaços geográficos onde os data centers se localizam. Essas regiões são divididas em zonas, para garantir que os serviços estarão de pé. Data centers separados são essenciais para manter tudo disponível a todo tempo (isso inclui sistema elétrico e redes separados).

Os servidores terão balanceamento de carga, multi deploy, replicação de data e sistema de recuperação de dados. Esse conjunto de ações tenta garantir que o serviço esteja disponível 99% do tempo.

### Tags
As tags labels (marcações) usadas para organizar os recursos dentro da AWS, como uma etiqueta. 
O uso de tags é muito útil na criação de relatórios dos serviços que estão sendo utilizados, por exemplo.

### EC2
A **Elastic Computing Cloud** permite a criação de máquinas virtuais, com diferentes sistemas operacionais e para diferentes tarefas (com hardwares dedicados para essas tarefas).
Existem famílias específicas para cada tarefa.
O custo é calculado por hora (Mac/Windows) ou segundo (Linux) e também pelo tipo de instância usada.

### EBS
É uma instância de armazenamento, a **Elastic Block Store**, que pode ser anexado à instância do EC2. Atua como um HD externo de serviços.

### Auto Scaling
Ajusta a capacidade de forma automática, conforme a demanda!
Existe, porém, um limite definido (pelo bem do seu dinheiro).

- Escalabilidade vertical ocorre com melhoria no hardware.
- Escalabilidade horizontal ocorre com a adição de instâncias.

Geralmente, a escalabilidade da AWS é horizontal. 
O gerenciamento desses recursos não é cobrado, mas o uso da instâncias sim.

Para alocar/desalocar instâncias, são usadas métricas que indicam para o sistema o que fazer. As métricas podem ser internas, como uso de memória e processamento, ou até mesmo externas, como análise do fluxo de dados.
Também é possível agendar o scaling, sendo algo programado.

### RDS
É o **Relacional Database Service**, que permite a criação de instâncias para bancos de dados relacionais, como MySQL, PostgreSQL, etc.
As atualizações e o licenciamento de serviços é totalmente gerenciado pela Amazon. 

### Aurora
Muito semelhante ao RDS, mas (segundo a própria AWS) este serviço garante uma escalabilidade muito melhor que outros bancos. Há também a melhoria em performance.
O Aurora permite servless, ou seja, consegue se adaptar sob a demanda dos dados (pré configurada ou não).
Transações com lock podem (e vão) ser um problema para o uso do Aurora servless, uma vez que o escalonamento é travado pela transação.

### ECS
O **Elastic Container Service** oferece uma estrutura escalável para gerenciar containers.

### S3
É o serviço de armazenamento de arquivos da AWS. Muito utilizado como um "Google Drive", mas também pode ser usado como um banco de dados [[NoSQL]]

### Athena
Serviço da AWS para análise de dados provenientes de uma base, geralmente o S3.
Permite a análise e extração de métricas dos dados ingeridos, possibilitando até mesmo buscas em [[SQL]]

## Desenvolvimento na AWS

### CloudFormation (IaC)
Infrastructure as code!
Parecido com o Terraform

### SAM
**Service Application Model** ajuda a organizar e criar a infraestrutura do servless. Usa templates e permite a criação direto na máquina de desenvolvimento. 

### CI/CD
- Continuous Integration: Esteira de testes, segurança e integração
- Continuous Delivery: Entregar software, validar antes da produção, subida automática