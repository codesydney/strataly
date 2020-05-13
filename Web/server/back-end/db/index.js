// /**
//  * Database Access
//  */
const { Pool } = require('pg');

//get connection string from process.env
const connString = process.env.DATABASE_URL;

//create new connection pool
const pool = new Pool({
    connectionString: connString
});

//Export template for routes to connect to idle connection
module.exports = {
    query: (text, params) => pool.query(text, params)
};