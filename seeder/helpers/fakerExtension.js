const faker = require('faker/locale/pt_BR');

module.exports = {
    numberString: (length) => {
        let result = "";
        for (let i = 0; i < length; i++) {
            result += faker.random.number(10);
        }
        return result;
    }
};