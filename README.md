# LBD projeto

Projeto prático da matéria de laboratário de banco de dados.

## Configurando

```
    cp env.example env
```

Ajuste as variaveis de conexão

```
    nano env
```

Para rodar o banco execute 

```
    ./run-migrations.sh
```

## Regras para Triggers

- [x] Membros de uma equipe cadastrada na maratona não podem estar em outra equipe cadastrada na mesma maratona;
- [ ] Membros de uma equipe cadastrada em uma maratona não podem estar em outra equipe cadastrada em outra maratona que ocorre no mesmo horário;
- [x] O usuário criador de uma equipe automáticamente deve ser vinculado a ela como membro;
- [ ] As equipes participantes da maratona devem ter o mínimo de participantes necessários para realizar a inscrição;
- [ ] As equipes devem se cadastrar a uma maratona somente durante seu período de incrição;
- [ ] Membros não podem sair de uma equipe participante de uma maratona durante o período de sua execução;
- [ ] Equipes participando de uma maratona não podem editar membro durante o período de sua execução;
- [ ] Participantes não podem sair da maratona enquanto a maratona estiver em execução;
- [ ] Equipes só podem enviar respostas as questões vinculadas a maratona durante o período de execução da maratona
