const faker = require('faker/locale/pt_BR');

module.exports = ({options}) => {
    return {
        perfil_id: options.perfil,
        maratona_id: options.maratona,
        tipo_participante: faker.random.number(1,2)
    }
};