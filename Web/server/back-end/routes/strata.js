/**
 * TITLE: /routes/strata.js
 * 
 * Description:
 *      Creates tail-end routes and queries for the strata table.
 *      Used by /routes/index.js to direct top level routing.
 * 
 */
/************
 * Requires *
 ************/
const Router = require('express-promise-router');
//get database access script
const db = require('../db');

/*************
 * Instances *
 *************/
const router = new Router();

/**********
 * Routes *
 **********/
//Attach routing functions to router

//CREATE
router.post('/', async (req, res) => {
    //Parse urlencoded values
    const { 
        strata_plan_id, strata_name,
        strata_address, office_address, 
        office_email
    } = req.body;

    //Await Query response
    const dbResponse = await db.query('INSERT INTO strataly_schema.strata (strata_plan_id, strata_name, strata_address, office_address, office_email) VALUES ($1, $2, $3, $4, $5);', [strata_plan_id, strata_name, strata_address, office_address, office_email]);
    
    //Return status and success response
    res.status(201).send('New strata added');
});

//READ
//  get all strata
router.get('/', async (req, res) => {
    //Await Query response
    const dbResponse = await db.query('SELECT * FROM strataly_schema.strata;');

    //Return status & Query response
    res.status(200).json(dbResponse.rows);
});

//  get strata by id
router.get('/:strata_plan_id', async (req, res) => {
    //Get request id value
    const id = req.params.strata_plan_id;

    //Await query response
    const dbResponse = await db.query('SELECT * FROM strataly_schema.strata WHERE strata_plan_id = $1;', [id]);

    //return status & query response
    res.status(200).json(dbResponse.rows);
});

//UPDATE
//TODO: Add UPDATE endpoint/s

//DELETE
//  delete strata by id
router.delete('/:strata_plan_id', async (req, res) => {
    //Get strata id
    const id = req.params.strata_plan_id;
    
    //Await query response
    const dbResponse = await db.query('DELETE FROM strataly_schema.strata WHERE strata_plan_id = $1;', [id]);

    //return status & success response
    res.status(200).send('strata deleted');
});

/***********
 * EXPORTS *
 ***********/
//Export router for mounting to app
module.exports = router;


