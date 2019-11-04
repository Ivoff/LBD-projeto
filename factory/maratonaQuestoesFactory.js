const faker = require('faker/locale/pt_BR');

module.exports = (generateId) => {
    return async () => ({
        maratona_id: await generateId("Maratona"),
        questao_id: await generateId("Questoes")
    })
};