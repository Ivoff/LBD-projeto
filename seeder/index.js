// Visual
const chalk = require('chalk');
const loading = require('loading-cli');


const con = require("./database/connection").default();

// Factories
const maratonaFactory = require("./factory/maratonaFactory");
const perfilFactory = require("./factory/perfilFactory").default;
const questoesFactory = require("./factory/questoesFactory");

// Factories compostos
const maratonaQuestoesFactory = require("./factory/maratonaQuestoesFactory")(con.getRandomIdFromAsync);
const participanteFactory = require("./factory/participanteFactory")(con.getRandomIdFromAsync);
const equipeFactory = require("./factory/equipeFactory")(con.getRandomIdFromAsync);
const membroFactory = require("./factory/membroFactory")(con.getRandomIdFromAsync);
const equipeMaratonaFactory = require("./factory/equipeMaratonaFactory")(con.getRandomIdFromAsync);


const ForLengthAsync = async (length, generate, includeAsync, table) => {
    const load = loading(`Seed on ${table}`).start();
    const count = {ok: 0, err: 0};
    const errMsgs = {};

    for (let i = 0; i < length; i++) {
        // Tratando cada inserção individualmente para casos de ferir os triggers
        const objectConcrete = await generate();
        try {
            await includeAsync({object: objectConcrete, table});
            count.ok++;
        } catch (e) {
            if (errMsgs[e.message]) errMsgs[e.message] += 1;
            else errMsgs[e.message] = 1;
            count.err++;
        }
    }

    load.succeed("Seed complete:");
    console.log(`\t[${table}] ${chalk.green(`${count.ok} OK`)}; ${chalk.red(`${count.err} Errors`)}.`);
    Object.entries(errMsgs).forEach(([err, qtd]) => console.log(`\t\t${qtd}x ${err}`))
    load.stop();
};

module.exports = async () => {
    const initialTime = new Date().getTime();
    await con.createConnectionAsync();

    // Seeds
    await Promise.all([
        ForLengthAsync(200, maratonaFactory, con.insertAsync, "Maratona"),
        ForLengthAsync(200, perfilFactory, con.insertAsync, "Perfil"),
        ForLengthAsync(200, questoesFactory, con.insertAsync, "Questoes"),
    ]);

    // Campos que precisam de dados do banco
    await ForLengthAsync(200, maratonaQuestoesFactory, con.insertAsync, "MaratonaQuestoes");
    await ForLengthAsync(200, participanteFactory, con.insertAsync, "Participante");
    await ForLengthAsync(200, equipeFactory, con.insertAsync, "Equipe");
    await ForLengthAsync(200, membroFactory, con.insertAsync, "Membro");
    await ForLengthAsync(200, equipeMaratonaFactory, con.insertAsync, "EquipeMaratona");

    await con.closeConnectionAsync();
    const timeOnSeed = new Date().getTime() - initialTime;
    console.log(`Time spend on seed: ${chalk.blue(`${timeOnSeed} Millis`)}`);
};
