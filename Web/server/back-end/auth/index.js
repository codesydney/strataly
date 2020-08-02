/**
 * TITLE: auth
 * DESC: authorisation module for
 *  the server-side Strataly system.
 *
 * DOCS: https://tools.ietf.org/html/rfc7519
 */

/************
 * Requires *
 ************/
const roles = require('./roles');
const authentication = require('./authentication');
const authorisation = require('./authorisation');

/***********
 * EXPORTS *
 ***********/

module.exports = {
  authentication,
  authorisation
}