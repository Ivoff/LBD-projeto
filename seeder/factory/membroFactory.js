module.exports = (generateId) => {
    let functionGenerateId = generateId;
    return async () => ({
        perfil_id: await functionGenerateId("perfil"),
        equipe_id: await functionGenerateId("equipe")
    })
};
