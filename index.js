const mainSeed = require("./seeds/MainSeed");
const figlet = require("figlet");

console.log(figlet.textSync('BD - projeto', {
    horizontalLayout: 'default',
    verticalLayout: 'default'
}));
// Seeds
(async () => {
    await mainSeed();
})();