const faker = require('faker/locale/pt_BR');

module.exports = (generateId) => (
    async () => ({
        perfil_id: await generateId("perfil"),
        maratona_id: await generateId("maratona"),
        tipo_participante: faker.random.arrayElement([1, 2])
    })
);
