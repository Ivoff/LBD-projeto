SELECT 
    Q.id AS id,
    Q.nome AS nome,
    Q.descricao AS descricao,
    Q.dificuldade AS dificuldade,
    AVG(EMQ.pontuacao_final) AS media_pontuacao,
    AVG(EMQ.tentativas) AS media_tentativas,
    (media_pontuacao / media_tentativas) AS pontuacao_tentativa
FROM Questoes AS Q
INNER JOIN MaratonaQuestoes MQ ON MQ.questao_id = Q.id
INNER JOIN EquipeMaratonaQuestao EMQ ON EMQ.maratona_questoes_id = MQ.id
GROUP BY Q.NOME
ORDER BY EMQ.pontuacao_final