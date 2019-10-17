const mainSeed = require("./seeds/MainSeed");
const figlet = require("figlet");

console.log(figlet.textSync('BD - projeto', {
    font: 'ANSI Shadow',
    horizontalLayout: 'default',
    verticalLayout: 'default'
}));
// Seeds
(async () => {
    await mainSeed();
})();