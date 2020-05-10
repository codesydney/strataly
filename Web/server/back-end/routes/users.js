/**
 * TITLE: /routes/users.js
 * 
 * Description:
 *      Creates tail-end routes and queries for users table.
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
router.get('/', async (req, res) => {
    const dbResponse = await db.query('SELECT * FROM strataly_schema.users ORDER BY user_id ASC;');
    res.status(200).json(dbResponse.rows);
});

/***********
 * EXPORTS *
 ***********/
//Export router for mounting to app
module.exports = router;