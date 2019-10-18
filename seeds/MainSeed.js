const con = require("../database/connection")();
// Visual
const chalk = require('chalk');
const loading = require('loading-cli');
// Factorys
const maratornaFactory = require("../factory/MaratonaFactory");
const perfilFactory = require("../factory/PerfilFactory");
const participanteFactory = require("../factory/ParticipanteFactory");

const ForLenghtAscyn = async (lenght, generate, includeAsync, table) => {
    const load = loading("Seed on " + table).start();
    let promises;
    let count = {
        Ok: 0,
        Fail: 0
    };

    for (let i = 0; i < lenght; i++) {
        // Tratando cada inserção individualmente para casos de ferir os triggers
        try {
            await includeAsync({
                object: await generate(),
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
    await ForLenghtAscyn(20, participanteFactory(con.getRandomIdFromAsync), con.insertAsync, "Participante");

    await con.closeConnectionAsync();
    console.log("Time spend on seed: " + chalk.blue((new Date().getTime() - initialTime) + " Millis"));
};