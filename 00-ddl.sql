drop table if exists Perfil cascade ;
drop table if exists Equipe cascade;
drop table if exists Membro cascade ;
drop table if exists Maratona cascade;
drop table if exists Participante cascade;
drop table if exists Questoes cascade;
drop table if exists MaratonaQuestoes cascade;
drop table if exists EquipeMaratona cascade;

create table Perfil(
    id serial primary key,
    nome_completo varchar not null,
    rga varchar not null unique,
    siapi varchar not null unique,
    cpf varchar not null unique,
    codigo_uri varchar not null unique,
    status_participante boolean not null,
    status_voluntario boolean not null,
    status_tecnico boolean not null
);


create table Equipe(
    id serial primary key,
    criador_perfil_id integer not null references Perfil (id),
    nome varchar not null unique,
    descricao varchar
);

create table Membro(
    id serial,
    perfil_id integer not null references Perfil (id),
    equipe_id integer not null references Equipe (id)
);

create table Maratona(
    id serial primary key ,
    nome varchar not null unique,
    imagem_url varchar,
    inscricao_comeco timestamp with time zone not null,
    inscricao_termino timestamp with time zone not null,
    horario_comeco timestamp with time zone not null,
    horario_termino timestamp with time zone not null,
    numero_maximo_time int not null,
    numero_maximo_participantes_time int not null
);

create table Participante(
    id serial primary key,
    perfil_id int not null references  Perfil(id),
    maratona_id int not null references Maratona(id),
    tipo_participante int not null
);

create table Questoes(
    id serial primary key,
    descricao varchar not null,
    entrada text not null,
    saida text,
    dificuldade int not null
);

create table MaratonaQuestoes(
    id serial,
    maratona_id int not null references Maratona(id),
    questao_id int not null references Questoes(id)
);

create table EquipeMaratona(
    id serial primary key,
    status_equipe int not null,
    pontuacao_final double precision not null
);

alter table EquipeMaratona add column equipe_id integer references Equipe(id);
alter table EquipeMaratona add column maratona_id integer references maratona(id);
alter table EquipeMaratona alter column equipe_id set not null;
alter table EquipeMaratona alter column maratona_id set not null;

