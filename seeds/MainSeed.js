const con = require("../database/connection")();
const maratornaFactory = require("../factory/MaratonaFactory");

const ForLenghtAscyn = async (lenght, generate, includeAsync, table) => {
    let promises;
    let count = {
        Ok: 0,
        Fail: 0
    };

    for (let i = 0; i < lenght; i++) {
        // Tratando cada inserção individualmente para casos de ferir os triggers
        try {
            await includeAsync({
                object: generate(),
                table: table
            });
            count.Ok++;
        } catch (e) {
            count.Fail++
        }
    }

    await console.log(table + ": " + JSON.stringify(count));
};

module.exports = async () => {
    const initialTime = new Date().getTime();
    await con.createConnectionAsync();
    await ForLenghtAscyn(2000, maratornaFactory, con.insertAsync, "maratona");

    await con.closeConnectionAsync();
    console.log("Time spend: " + (new Date().getTime() - initialTime) + " Millis");
};