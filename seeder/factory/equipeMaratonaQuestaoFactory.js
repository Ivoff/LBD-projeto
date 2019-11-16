const faker = require('faker/locale/pt_BR');

module.exports = (options) => {
    return {
        maratona_questoes_id: options.maratona,
        equipe_id: options.equipe,
        maratona_id: Math.random() * 5,
        pontuacao: options.maratona.encerrada ? faker.random.number({min: 1, max: 100}) : null,
        tentativas: options.maratona.encerrada ? faker.random.number({min: 1, max: 15}) : 0,
        inscricao_termino: options.maratona.encerrada
            ? faker.date.between(options.maratona.horario_comeco, options.maratona.horario_termino)
            : null,
    }
};