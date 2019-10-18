const faker = require('faker/locale/pt_BR');

module.exports = (generateId) => {
    let functionGenerateId = generateId;

    return async () => {
        return {
            maratona_id: await functionGenerateId("Maratona"),
            equipe_id: await functionGenerateId("Equipe"),
            status_equipe: Math.random() * 5 | 0,
            pontuacao_final: 0
        }
    }
};