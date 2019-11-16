const faker = require('faker/locale/pt_BR');
const fakerExtension = require("../helpers/fakerExtension");


module.exports = () => {
    return {
        nome_completo: faker.name.findName(),
        rga: fakerExtension.numberString(12),
        siapi: fakerExtension.numberString(12),
        cpf: fakerExtension.numberString(11),
        codigo_uri: faker.random.uuid()
    }
};