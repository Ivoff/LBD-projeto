const faker = require('faker/locale/pt_BR');

module.exports = (generateId) => {
    return async () => {
        return {
            criador_perfil_id: await generateId("Perfil"),
            nome: faker.lorem.words(Math.random() * 3),
            descricao: faker.lorem.sentence()
        }
    };
};