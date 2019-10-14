CREATE OR REPLACE FUNCTION perfil_validation_maratona(
    perfilId INTEGER,
    maratonaId INTEGER
) returns BOOLEAN AS $$
DECLARE
    interacoesPerfilComMaratona INTEGER
BEGIN
    SELECT COUNT(*) AS quantidade
    INTO interacoesPerfilComMaratona
    FROM (
        (
            SELECT Participante.perfil_id AS PerfilId
            FROM Participante
            WHERE
                Participante.maratona_id = maratonaId   AND
                Participante.perfil_id = perfilId
        )
        UNION
        (
            SELECT Membro.perfil_id AS PerfilId
            FROM Membro
            INNER JOIN Equipe ON Equipe.id = Membro.equipe_id
            INNER JOIN EquipeMaratona ON EquipeMaratona.equipe_id = Equipe.id
            WHERE 
                EquipeMaratona.maratona_id = maratonaId AND
                Membro.perfil_id = perfilId
        )
    ) AS UNIAO
    GROUP BY UNIAO.PerfilId;

    IF interacoesPerfilComMaratona > 0 
    THEN
        RETURN false;
    ELSE
        RETURN true;
END; $$
LANGUAGE plpgsql;