/**
 * TITLE: queries.js
 * AUTHOR: Qj Stout-Spykers
 * 
 * TODO: Add getBy endpoints - e.g. getStrataById
 * FIXME: Put config details in a separate file not accessible to VCS
 * 
 */

const _pool = require('pg').Pool;
//FIXME: This is crazy insecure. Do something about the DB user + password
//          before sending it to everyone. If I forgot to fix this, 
//          I'm sorry everyone!
const pool = new _pool({
    user: 'xpress_server',
    host: 'localhost',
    database: 'strataly',
    password: 'password',
    port: '5432'
});

/**********
 * Strata *
 **********/
//CREATE
const createStrata = (req, res) => {
    const { strata_plan_id, strata_name, strata_address, 
        office_address, office_email} = req.body;

    pool.query('INSERT INTO strataly_schema.strata (strata_plan_id, strata_name, strata_address, office_address, office_email) VALUES ($1, $2, $3, $4, $5)', [strata_plan_id, strata_name, strata_address, 
        office_address, office_email], (err, results) => {
        
        if (err){
            throw err;
        };

        res.status(201).send('Strata added');
    });
};

//READ
const getStrata = (req, res) => {
    pool.query('SELECT * FROM strataly_schema.strata;', (err, results) => {
        if (err){
            throw err;
        };

        res.status(200).json(results.rows);
    });
};

const getStrataById = (req, res) => {
    const id = req.params.strata_plan_id;
    
    pool.query('SELECT * FROM strataly_schema.strata WHERE strata_plan_id = $1', [id], (err, results) => {
        if (err){
            throw err;
        };

        res.status(200).json(results.rows);
    });
};

//TODO: UPDATE

//DELETE
const deleteStrata = (req, res) => {
    const strata_plan_id = req.params.strata_plan_id;

    pool.query('DELETE FROM strataly_schema.strata WHERE strata_plan_id = $1', [strata_plan_id], (err, results) => {
        if (err) {
            throw err;
        }
        res.status(200).send('User deleted.');
    });
};

/********
 * User *
 ********/
const getUsers = (req, res) => {
    pool.query('SELECT * FROM strataly_schema.users ORDER BY user_id ASC;', (err, results) => {
        if(err){
            throw err;
        };

        res.status(200).json(results.rows);
    });
};

/**********
 * Export *
 **********/
module.exports = {
    createStrata,
    getStrata,
    getStrataById,
    //updateStrata,
    deleteStrata,

    getUsers
};