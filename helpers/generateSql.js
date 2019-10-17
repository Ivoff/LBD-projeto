const metaData = require("./metaDataObject");

module.exports = (option) => {
        return  `INSERT INTO ${option.table} `                  +
                ` (${metaData.getAtributes(option.object)}) `    +
                ` VALUES(${metaData.createFormat(option.object)}) RETURNING *`
};