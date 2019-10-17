const faker = require('faker/locale/pt_BR');

module.exports = (options) => {
    return {
        maratona_id: options.maratona,
        equipe_id: options.equipe,
        status_equipe: Math.random() * 5,
        pontuacao_final: options.maratona.encerada ? faker.random.number({
            min: 0,
            max: 1000
        }) : 0,
    }
};