module.exports = (generateId) => {
    return async () => ({
        maratona_id: await generateId("maratona"),
        equipe_id: await generateId("equipe"),
        status_equipe: Math.random() * 5 | 0,
        pontuacao_final: 0
    })
};
