/**
 * TITLE: authentication.js
 * DESC: authentication module for
 *  the server-side Strataly system.
 *  Verifies user credentials and generates JWTs.
 *
 * DOCS: https://tools.ietf.org/html/rfc7519
 */

/************
 * Requires *
 ************/
const jwt = require("jsonwebtoken");
const crypto = require("crypto");


/**************
 * Properties *
 **************/

//Generate CSPRNG w/ 32bytes/256bits of randomness
// This satisfies compliance with the JWT JWA spec
//  for HMAC + SHA256
//NOTE: used hexadecimal encoding but as far as I know, the encoding is arbitrary
//TODO: We need some method for changing the secret during
//  runtime. Also, management of current and last secrets
const secret = process.env.SECRET || crypto.randomBytes(32).toString("hex");

/************
 * Functions *
 ************/
function generateJWT(userID, userRole) {
    //Create JWT payload
    /**
     * NOTES:
     *      Tokens are protected from tampering but are readable by anyone.
     *          Do not put secret information in the token unless encrypted.
     *
     *      Payload consists of a collection of 'claims' in a JSON object.
     *      There are 3 types of claims.
     *          1. Registered - Predefined claims that are recommended.
     *          2. Public - Can be used at will. To avoid collisions, they
     *              should be registered in the IANA JSON Web Token Registry
     *              or defined as a URI with a collision resistant namespace.
     *          3. Private - Custom claims.
     *
     * To view a list of Registered & Public claims:
     *      https://tools.ietf.org/html/rfc7519#section-4
     */
    const payload = {
        //Registered claims
        iss: "strataly_server",
        sub: userID,
        aud: "www.strataly.com.au", //TODO: get actual address of the resource server
        exp: Math.floor(Date.now() / 1000) + 60 * 15, //Expires 15 minutes after issued. Expiry is written as num of secs since epoch
        //"nbf" : Not Before claim not applicable.
        //"iat" : Issued at claim automatically set to now() by jsonwebtoken
        //"jti" : JWT ID claim Shouldn't be necessary

        //Public claims
        // Shouldn't need any atm, but there are some useful ones

        //Private claims
        role: userRole,
    };

    //Get signed JWT - algorithm default==HS256
    // Currently using synchronous, but there is a callback option
    const signedJWT = jwt.sign(payload, secret);

    return signedJWT;
}

//Verifies the jwt paramater as a valid JWT
//if valid and in date, returns the decoded JWT
//  else, throws an error
function validateJWT(userJWT) {
    //TODO: reimplement the asynchronous verification
    // jwt.verify(userJWT, secret, (err, decoded) => {
    //     return decoded;
    // });
    return jwt.verify(userJWT, secret); //TODO: catch error and handle depending on type. REF: jsonwebtoken on NPM
}

//Middleware version of validateJWT.
// Gets required paramaters from req.
// On success, attaches a user object,
//  containing user role, to the req body.
function middlewareValidateJWT(req, res, next) {
    // Get the JWT from the header,
    //  1. Split by any length of whitespace
    //  2. Keep the JWT & discard the 'Bearer' prefixs
    const userJWT = req.header("Authorization")
        .split(/\s+/)
        .pop();
    const validated = validateJWT(userJWT);

    if (!validated) {
        //If validation failed, return authentication failed status code.
        return res.status(401)
            .json({ message: 'Unauthenticated' }); v
    }

    //- Authentication successful -
    //Attach role to the request object.
    //  This is used by the authorisation middleware 
    //  to determine permissions.
    //Pass to next function
    req.user = { role: validated.role };
    next();
}

/***********
 * EXPORTS *
 ***********/
module.exports = {
    generateJWT,
    validateJWT,
    middlewareValidateJWT,
};