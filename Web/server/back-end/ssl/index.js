const fs = require('fs');

module.exports = {
    getCredentials: () => {
        return {
            key: fs.readFileSync('./ssl/server.key'),
            cert: fs.readFileSync('./ssl/server.cert')
        };
    }
};