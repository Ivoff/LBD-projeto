CREATE INDEX perfil_index_hash_rga
ON Perfil(rga) USING hash (rga);

CREATE INDEX perfil_index_hash_cpf
ON Perfil(cpf) USING hash (cpf);

CREATE INDEX perfil_index_gin_nome_completo ON
Perfil(nome_completo) USING gin (nome_completo gin_trgm_ops);

CREATE INDEX maratona_index_gin_nome ON
Maratona(nome) USING gin (nome gin_trgm_ops);

CREATE INDEX maratona_index_inscricao_termino ON
Maratona(inscricao_termino DESC);

CREATE INDEX equipe_index_gin_nome ON
Equipe(nome) USING gin (nome gin_trgm_ops);