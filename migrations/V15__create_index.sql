CREATE EXTENSION pg_trgm;

CREATE INDEX perfil_index_hash_rga
ON Perfil USING hash (rga);

CREATE INDEX perfil_index_hash_cpf
ON Perfil USING hash (cpf);

CREATE INDEX perfil_index_gin_nome_completo ON
Perfil USING gin (nome_completo gin_trgm_ops);

CREATE INDEX maratona_index_gin_nome ON
Maratona USING gin (nome gin_trgm_ops);

CREATE INDEX maratona_index_inscricao_termino ON
Maratona(inscricao_termino DESC);

CREATE INDEX equipe_index_gin_nome ON
Equipe USING gin (nome gin_trgm_ops);
