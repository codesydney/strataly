/************
 * Requires *
 ************/
const express = require("express");
const mountRoutes = require("./routes");

/**
 * Globals
 */
//instantiate express
const app = express();

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
 * Mount Global Error Handler
 */
//TODO: Create a global error handler

/**
 * Listen
 */
//PORT NUMBER
// Gets port number from environment or use 5000 by default
const PORT = process.env.PORT || 5000;
//TODO: Change to HTTPS server when we have SSL. It is unsafe to send credential over standard HTTP.
app.listen(PORT), console.log(`\nListening on port ${PORT}...`);

//EXPORT
module.exports = app;
