/************
 * Requires *
 ************/
const express = require('express');
const mountRoutes = require('./routes');
const ssl = require('./ssl');
const http = require('http');
const https = require('https');

/**
 * Globals
 */
//instantiate express
const app = express();

//PORT NUMBER
// Gets port number from environment or use 5000 by default
const PORT = process.env.PORT || 5000;
const HTTPS_PORT = process.env.HTTPS_PORT || 443;

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
// HTTP server
http.createServer(app).listen(PORT), console.log(`HTTP server listening on port ${PORT} ...`);

//HTTPS server
//get self signed certificate
const credentials = ssl.getCredentials();
https.createServer(credentials, app).listen(HTTPS_PORT, () => {
    console.log(`HTTPS server listening on port ${HTTPS_PORT}...`);
})