
Para conectar:
```bash
sudo -u postgres
```

Se não estiver iniciado, rodar:
```bash
systemctl start postgres
systemctl enable postgres
```

Ao ativá-lo, basta rodar o primeiro comando novamente.

Para abrir o console do psql:
```bash
psql
```

Para listar usuários:
```psql
\du
```

Para listar os bancos de dados:
```psql
\l
```

Para se conectar à um banco específico:
```
\c <nome_do_banco>
```

Para listar as tabelas do banco:
```psql
\dt
```

Para descrever uma tabela:
```psql
\d <nome_da_tabela>
```

Para criar um usuário:
```psql
create user <nome_usuario>;
alter user <nome_usuario> with encrypted password '<senha>'
```

Para adicionar privilégios:
```psql
grant all privileges on database <nome_do_banco> to <nome_usuario>
```

Remover usuário:
```
drop user <nome_usuario>
```

Conceder permissão ao schema public:
```
grant all on schema public to <nome_usuario>
```