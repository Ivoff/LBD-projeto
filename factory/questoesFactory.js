const faker = require('faker/locale/pt_BR');

module.exports = (criadoId) => {
    return {
        titulo:  faker.lorem.words(Math.random() * 8),
        descricao: faker.lorem.sentence(),
        entrada: faker.lorem.text(),
        saida: faker.lorem.text(),
        dificuldade: Math.random() * 5 | 0
    }
};