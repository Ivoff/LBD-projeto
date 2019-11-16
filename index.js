const mainSeed = require("./seeds/MainSeed");
const figlet = require("figlet");
const chalk = require('chalk');
const program = require('commander');
const shell = require('shelljs');
const {version} = require('./package.json');

console.log(figlet.textSync('BD - projeto'));

// Drop and run all migrations

// Run all the seeders

// Parametros da CLI
program
    .description("Cli só para popular ou rodar as migrations, boa sorte...")
    .version(version);

program
    .command("seed")
    .description("Run all the seeders")
    .action(mainSeed);

program.parse(process.argv);
