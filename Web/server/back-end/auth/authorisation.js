/**
 * TITLE: authorisation.js
 * DESC: authorisation middleware for
 *  the server-side Strataly system.
 *  Verifies user access permissions.
 */
const roles = require('./roles');

//Accepts an array of roles to be considered as authorised
//  for the next function
//See:'Configurable middleware' - https://expressjs.com/en/guide/writing-middleware.html
function authorise(authorised_roles = []) {
    return (req, res, next) => {
        console.log("Role: ", req.user.role);

        if (!authorised_roles.includes(req.user.role)) {
            //Authorisation failed, return forbidden status code and message body
            return res.status(403).json({ message: 'Unauthorised' });
        }
        //Authorisation successful, pass control to next function
        next();
    }
}

module.exports = { authorise };