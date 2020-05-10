//Database Access
const { Pool } = require('pg');

//TODO: Move connection info to dotenv
const pool = new Pool({
    user: 'xpress_server',
    host: 'localhost',
    database: 'strataly',
    password: 'password',
    port: '5432'
});

module.exports = {
    query: (text, params, callback) => {
        return pool.query(text, params, callback);
    }
};