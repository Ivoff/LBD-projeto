const faker = require('faker/locale/pt_BR');

module.exports = (generateId) => {
    let functionGenerateId = generateId;
    return async () => {
        return {
            perfil_id: await functionGenerateId("Perfil"),
            equipe_id: await functionGenerateId("Equipe")
        }
    }
};