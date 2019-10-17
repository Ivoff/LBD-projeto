const faker = require('faker/locale/pt_BR');

module.exports = (criadoId) => {
    return {
        criador_perfil_id: criadoId,
        nome: faker.lorem.words(Math.random() * 3),
        descricao: faker.lorem.sentence()
    }
};