const faker = require('faker/locale/pt_BR');

module.exports = (generateId) => {
    let functionGenerateId = generateId;
    return async () => {
        return {
            criador_perfil_id: await functionGenerateId("Perfil"),
            nome: faker.lorem.words(Math.random() * 3),
            descricao: faker.lorem.sentence()
        }
    };
};