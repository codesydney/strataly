/**
 * TITLE: index.js - Strataly back-end
 * AUTHOR: Qj Stout-Spykers
 * NOTES:
 *          1. Uses Express Js
 * 
 * TODO: Add a Graceful Shutdown
 * TODO: Modularise - JS Module Patterns
 *   http://www.adequatelygood.com/JavaScript-Module-Pattern-In-Depth.html
 * TODO: Add Transport Layer Security
 * TODO: Add user authorisation
 * TODO: Create HTTPS server - Both or just HTTPS?
 * TODO: Look into pgBouncer for pooling
 * 
 */

/************
 * Includes *
 ************/
const express = require('express');
const bodyParser = require('body-parser');
const app = express();

const db = require('./queries');

/***********
 * Globals * 
 ***********/
//PORT NUMBER
// Gets port number from environment or use 3000 by default
const PORT = process.env.PORT || 3000;

/****************
 * Server Setup *
 ****************/
//set app to use bodyParser middleware to parse only JSON payloads
app.use(bodyParser.json());

//set bodyParser to use the extended qs library
//https://www.npmjs.com/package/qs#readme
app.use(
    bodyParser.urlencoded({
        extended: true
    })
);

/***********
 * Routing *
 ***********/
//root path
app.get('/', (req, res) => {
    res.json({ info: 'Express API for the Strataly system.'});
});

//Strata
app.post('/api/strata', db.createStrata);
app.get('/api/strata', db.getStrata);
app.get('/api/strata/:strata_plan_id', db.getStrataById);
//update
app.delete('/api/strata/:strata_plan_id', db.deleteStrata);

//Users
app.get('/api/users', db.getUsers);

/********
 * User *
 ********
 *
 * Contains:
 *      createUser(login, password, name, role, phone, email)
 *      editUser(login, name, role, phone, email)
 *      editPassword(login, password)
 *      getUserInfo(login) -> login, name, role, phone, email, creation
 */

/** DELETEME:
 * Issue
 * 
 *    createIssue(title, description, user, array of files) -> issueNum
 *    getIssue(issueNum) -> title, desc, user, status, files, comments, creation
 *    addFile(description, user, issueNum, file) -> number
 *    addComment(comment, user, issueNum) -> number
 *    changeStatus(issueNum, newStatus)
 *    deleteFile(number)
 *    deleteComment(number)
 */

//FIXME: Pretty sure this middleware will conflict with the bodyParser middleware.
// //404 response
// app.use(function (req, res, next){
//     res.status(404).send(`ERROR: Could not find ${req.path}`);
// });

/**********
 * LISTEN *
 **********/
app.listen(PORT, console.log(`Listening on port ${PORT}...`));