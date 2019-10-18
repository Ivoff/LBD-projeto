const con = require("../database/connection")();
// Visual
const chalk = require('chalk');
const loading = require('loading-cli');
// Factorys
const maratornaFactory = require("../factory/maratonaFactory");
const perfilFactory = require("../factory/perfilFactory");
const questoesFactory = require("../factory/questoesFactory");
// Factorys compostos
const maratonaQuestoesFactory = require("../factory/maratonaQuestoesFactory")(con.getRandomIdFromAsync);
const participanteFactory = require("../factory/participanteFactory")(con.getRandomIdFromAsync);
const equipeFactory = require("../factory/equipeFactory")(con.getRandomIdFromAsync);
const membroFactory = require("../factory/membroFactory")(con.getRandomIdFromAsync);
const equipeMaratonaFactory = require("../factory/equipeMaratonaFactory")(con.getRandomIdFromAsync);

const ForLenghtAscyn = async (lenght, generate, includeAsync, table) => {
    const load = loading("Seed on " + table).start();
    let promises;
    let count = {
        Ok: 0,
        Fail: 0
    };

    for (let i = 0; i < lenght; i++) {
        // Tratando cada inserção individualmente para casos de ferir os triggers
        const objectConcrete = await generate();
        try {
            await includeAsync({
                object: objectConcrete,
                table: table
            });
            count.Ok++;
        } catch (e) {
            count.Fail++
        }
    }

    load.succeed("Seed complete:");
    console.log("\t" + table + ": () => " + chalk.green(" Ok: " + count.Ok) + " " + chalk.red("Fail: " + count.Fail));
    load.stop();
};

module.exports = async () => {
    const initialTime = new Date().getTime();
    await con.createConnectionAsync();


    // Seeds
    await ForLenghtAscyn(20, maratornaFactory, con.insertAsync, "Maratona");
    await ForLenghtAscyn(20, perfilFactory, con.insertAsync, "Perfil");
    await ForLenghtAscyn(20, questoesFactory, con.insertAsync, "Questoes");
    // Campos que precisam de dados do banco
    await ForLenghtAscyn(20, maratonaQuestoesFactory, con.insertAsync, "MaratonaQuestoes");
    await ForLenghtAscyn(20, participanteFactory, con.insertAsync, "Participante");
    await ForLenghtAscyn(20, equipeFactory, con.insertAsync, "Equipe");
    await ForLenghtAscyn(20, membroFactory, con.insertAsync, "Membro");
    await ForLenghtAscyn(20, equipeMaratonaFactory, con.insertAsync, "EquipeMaratona");

    await con.closeConnectionAsync();
    console.log("Time spend on seed: " + chalk.blue((new Date().getTime() - initialTime) + " Millis"));
};