/************
 * Requires *
 ************/
const express = require('express');
const mountRoutes = require('./routes');

/**
 * Globals
 */
//instantiate express
const app = express();

//PORT NUMBER
// Gets port number from environment or use 5000 by default
const PORT = process.env.PORT || 5000;

/**
 * Server Setup
 */
//Set app to parse only JSON payloads
app.use(express.json());
// Set app to parse urlencoded payloads
app.use(express.urlencoded({ extended: true }));


/**
 * Routing
 */
//Attach the url routes to the express app
mountRoutes(app);

/**
 * Listen
 */
app.listen(PORT), console.log(`Listening on port ${PORT}...`);

//EXPORT
module.exports = app;