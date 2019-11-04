const faker = require('faker/locale/pt_BR');

module.exports = (generateId) => (
    async () => ({
        perfil_id: await generateId("Perfil"),
        maratona_id: await generateId("Maratona"),
        tipo_participante: faker.random.arrayElement([1, 2])
    })
);