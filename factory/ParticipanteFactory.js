const faker = require('faker/locale/pt_BR');

module.exports = (generateId) => {
    let functionGenerateId = generateId;
    return async () => {
        return {
            perfil_id: await functionGenerateId("Perfil"),
            maratona_id: await functionGenerateId("Maratona"),
            tipo_participante: faker.random.number({
                min: 1,
                max: 2
            })
        }
    }
};