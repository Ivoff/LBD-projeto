const faker = require('faker/locale/pt_BR');

module.exports = {
    numberString: (lenght) => {
        let result = "";
        for (let i = 0; i < lenght; i++) {
            result += faker.random.number(10);
        }
        return result;
    }
};