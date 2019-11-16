module.exports = {
    getAttributes: (object) => {
        let attributes = "";
        for (let prop in object) {
            attributes += prop + ",";
        }
        return attributes.substring(0, attributes.length - 1);
    },
    getValues: (object) => {
        let values = [];
        for (let prop in object) {
            values.push(typeof object[prop] === "object" ? object[prop].toUTCString() : object[prop]);
        }
        return values;
    },
    createFormat: (object) => {
        let result = "";
        for (let i = 1; i <= Object.entries(object).length; i++) {
            result += `$${i},`
        }
        return result.substring(0, result.length - 1);
    }
};