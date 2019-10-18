const faker = require('faker/locale/pt_BR');

module.exports = () => {

    let inscricao_comeco = faker.date.future();
    let inscricao_termino = faker.date.future(0.2, inscricao_comeco);
    let horario_comeco = faker.date.future(0.4, inscricao_termino);
    let horario_termino = faker.date.future(0.5, horario_comeco);

    return {
        nome: faker.lorem.words(Math.random() * 20),
        imagem_url: faker.internet.avatar().split(".com")[1],
        inscricao_comeco: inscricao_comeco,
        inscricao_termino: inscricao_termino,
        horario_comeco: horario_comeco,
        horario_termino: horario_termino,
        numero_maximo_time: faker.random.number({
            min: 5,
            max: 15
        }),
        numero_maximo_participantes_time: faker.random.number({
            min: 2,
            max: 6
        })
    }
};