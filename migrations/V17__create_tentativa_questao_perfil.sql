create table TentativaQuestao
(
    id         serial primary key,
    perfil_id  integer                  not null references Perfil (id),
    questao_id integer                  not null references QuestaoId (id),
    status     int                      not null,
    entrada    text                     not null,
    criado_em  timestamp with time zone not null DEFAULT CURRENT_TIMESTAMP
);
