CREATE OR REPLACE FUNCTION perfil_validation_maratona(
    perfilId INTEGER,
    maratonaId INTEGER
) returns BOOLEAN AS $$
DECLARE
    interacoesPerfilComMaratona INTEGER
BEGIN
    
    SELECT COUNT(*) AS quantidade
    INTO interacoesPerfilComMaratona
    FROM Perfil
    INNER JOIN Participante ON Participante.perfil_id = Perfil.id
    INNER JOIN Membro ON Membro.perfil_id = Perfil.id
    INNER JOIN Equipe ON Equipe.id = Membro.equipe_id
    INNER JOIN EquipeMaratona ON EquipeMaratona.equipe_id = Equipe.id
    WHERE 
        Participante.maratona_id = maratonaId   AND
        EquipeMaratona.maratona_id = maratonaId AND
        Perfil.id = perfilId
    GROUP BY Perfil.id

    IF interacoesPerfilComMaratona > 0 
    THEN
        RETURN false;
    ELSE
        RETURN true;
END; $$
LANGUAGE plpgsql;