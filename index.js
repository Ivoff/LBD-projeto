const Connection = require("./database/connection");
const MaratonaFactory = require("./factory/MaratonaFactory");

const con = Connection();

(async () => {

    await con.createConnectionAsync();

    let res = await con.insertAsync({
        table: "maratona",
        object: MaratonaFactory()
    });

    await con.closeConnectionAsync();
})();