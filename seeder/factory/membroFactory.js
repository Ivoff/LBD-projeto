module.exports = (generateId) => {
    let functionGenerateId = generateId;
    return async () => ({
        perfil_id: await functionGenerateId("Perfil"),
        equipe_id: await functionGenerateId("Equipe")
    })
};