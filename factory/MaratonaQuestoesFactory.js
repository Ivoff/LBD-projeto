const faker = require('faker/locale/pt_BR');

module.exports = (options) => {
    return {
        maratona_id: options.maratona,
        questao_id: options.questao
    }
};