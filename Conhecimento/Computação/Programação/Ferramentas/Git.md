Software para versionamento de código, criado por Linus Torvalds.

### Configuração básica
Pra usar o git, é necessário configurar usuário e email, informações mostradas para cada ação sua em um projeto/repositório.

Configuração pode ser global, aplicada em todos os projetos, ou local, aplica no escopo do repositório.

```sh
git config user.name "xxx"
git config user.email "xxx@email.com"
``` 
Adicionando a variável `--global`, tornamos a configuração global.

### Criação de repositório

```sh
git init
```

Para clonar um repositório externo (internet)
```sh
git clone https://your-project-repo.git
```


### Commits
São confirmações das mudanças feitas no código.
Cada commit tem um hash único (identificador) e uma mensagem, que deve ser minimamente descritiva.

A comunidade angular adotou padrões de commit, os chamados conventional commits. O padrão se tornou habitual e foi adotado, também, pela comunidade.

```sh
git commit -m "your message"
```

Para adicionar arquivos modificados juntamente da mensagem
```sh
git commit -a -m "your message"
```

### Padrões de commit


### Branches
São ramificações do código principal, usadas para adicionar features, corrigir bugs, etc.
O uso correto de branches permite um desenvolvimento mais fluido entre equipes, possibilitando também uma melhor integração entre códigos.

Com o uso de branches, é possível mesclar códigos. Um código de feature pode ser mesclado na versão principal quando estiver pronto, sem afetar as demais funcionalidades durante seu desenvolvimento.

```sh
git branch <branch-name>
```

A mudança de branches se dá por:
```sh
git checkout <target_branch>
```


Para mesclar branches, basta entrar na branch que receberá as mudanças e indicar a ação de merge.
```sh
git checkout <branch_to_change>
git merge <target_branch>
```

