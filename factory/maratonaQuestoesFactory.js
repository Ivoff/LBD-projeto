const faker = require('faker/locale/pt_BR');

module.exports = (generateid) => {
    let functionGenerate = generateid;
    return async () => {
        return {
            maratona_id: await functionGenerate("Maratona"),
            questao_id: await functionGenerate("Questoes")
        }
    }
};