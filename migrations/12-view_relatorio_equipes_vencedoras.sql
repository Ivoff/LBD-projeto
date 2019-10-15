CREATE VIEW EquipeMaratonaVencedor AS
SELECT Maratona.id AS maratona_id , Equipe.*
FROM Maratona
INNER JOIN EquipeMaratona ON EquipeMaratona.maratona_id = Maratona.id
INNER JOIN Equipe ON Equipe.id = EquipeMaratona.equipe_id
WHERE Equipe.id IN (
        SELECT EquipeMaratona.equipe_id
        FROM EquipeMaratona AS EM
        WHERE
        Equipe.id = EM.equipe_id AND
        Maratona.id = EM.maratona_id
        ORDER BY EM.pontuacao_final
        DESC
        LIMIT 1
    );