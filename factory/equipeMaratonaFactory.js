module.exports = (generateId) => {
    return async () => ({
        maratona_id: await generateId("Maratona"),
        equipe_id: await generateId("Equipe"),
        status_equipe: Math.random() * 5 | 0,
        pontuacao_final: 0
    })
};