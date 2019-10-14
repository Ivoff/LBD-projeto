drop database if exists maratona;

create database maratona;

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
    id serial primary key,
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
    id serial primary key,
    maratona_id int not null references Maratona(id),
    questao_id int not null references Questoes(id),
    constraint maratona_questao_fkey unique (maratona_id, questao_id)
);

create table EquipeMaratona(
    id serial primary key,
    maratona_id int not null references Maratona(id),
    equipe_id int not null references Equipe(id),
    status_equipe int not null,
    pontuacao_final double precision not null,
    constraint equipe_maratona unique (maratona_id, equipe_id)
);


create table equipequestao(
	id serial primary key,
	equipe_id int references equipe(id) not null,
	maratona_id int references maratona(id) not null
);