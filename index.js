const mainSeed = require("./seeds/MainSeed");
const figlet = require("figlet");
const chalk = require('chalk');
const program = require('commander');
const shell = require('shelljs');

console.log(figlet.textSync('BD - projeto', {
    horizontalLayout: 'default',
    verticalLayout: 'default'
}));

// Drop and run all migrations

// Run all the seeders

// Parametros da CLI
program
    .description("Cli só para popular ou rodar as migrations, boa sorte...")
    .version('0.1.0');

program
    .command("seed")
    .description("Run all the seeders")
    .action(() => {
        (async () => {
            await mainSeed();
        })();
    });

program
    .command("migrations")
    .description("Drop and run all migrations")
    .option('-s, --seed', 'Run all the seeders')
    .action((obj) => {
        console.log(chalk.red("Clean migrations...\n"));
        shell.exec("./run-migrations.sh");
        console.log();

        if (obj.seed) {
            (async () => {
                await mainSeed();
            })();
        }
    });


program.parse(process.argv);
