CREATE VIEW EquipeMaratonaAtivoHoje AS
SELECT 
    Maratona.id AS maratona_id,
    E.*,
    current_date AS data
FROM Equipe AS E
INNER JOIN EquipeMaratona EM ON EM.maratona_id = E.id
INNER JOIN Maratona M ON M.id = EM.maratona_id
WHERE 
DATE(M.horario_comeco) = current_date
GROUP BY E.id;