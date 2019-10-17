CREATE VIEW MediaQuestoes AS
SELECT 
    Q.id AS id,
    Q.titulo AS titulo,
    Q.descricao AS descricao,
    Q.dificuldade AS dificuldade,
    AVG(EMQ.pontuacao) AS media_pontuacao,
    AVG(EMQ.tentativas) AS media_tentativas,
    COUNT(MQ.id) AS maratonas_usam_questao
FROM Questoes AS Q
INNER JOIN MaratonaQuestoes MQ ON MQ.questao_id = Q.id
INNER JOIN EquipeMaratonaQuestao EMQ ON EMQ.maratona_questoes_id = MQ.id
GROUP BY Q.id, EMQ.pontuacao
ORDER BY EMQ.pontuacao DESC;
