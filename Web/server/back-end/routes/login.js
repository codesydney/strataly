/**
 * TITLE: /routes/auth.js
 *
 * Description:
 *      Creates route for login attemps.
 *      Used by /routes/index.js to direct top level routing.
 */
/************
 * REQUIRES *
 ************/
const Router = require("express-promise-router");
//get database access script
const db = require("../db");
//get authorisation module
const { authentication: auth } = require('../auth');

/*************
 * INSTANCES *
 *************/
const router = new Router();

/**********
 * ROUTES *
 **********/
//check login credentials & return JWT on success
router.post("/", async (req, res) => {
  //Get login credentials from the Authorization header
  //  Authorization header comes in the format:
  //    Basic [email:password]"
  //  The email, password and colon delimiter are base64 encoded.
  //  Steps:
  //    1. Split by any length of whitespace
  //    2. Keep the email & password, while discarding the
  //      "Basic", using the pop() function
  //    3. Decode the base64 string to UTF8 (presumably) string
  //    4. Split the email & password by the ":" delimiter
  //    5. ...
  //    6. Profit?
  const credentials = Buffer.from(
    req.header("Authorization").split(/\s+/).pop(),
    "base64"
  )
    .toString()
    .split(/:/);

  //Await Query Response
  //  Query database for existence of credentials
  //  On success, retrieve the user_id.
  //    user_id is a non-PII identifier and will be used when generate a JWT for our response
  const dbResponse = await db.query(
    "SELECT user_id, user_role  FROM strataly_schema.users WHERE user_email = $1 AND user_password = $2;",
    [credentials[0], credentials[1]]
  );

  //Check if successful and then create JWT if it was
  // 1. extract result from array & object
  // 2. check truthiness - determined by the database response 'rows' object containing a non-empty array
  //  2.1. Truthy - generate & return JWT & success status
  //  2.2. Falsy - return failed login status and
  //      empty array response
  Array.isArray(dbResponse.rows) && dbResponse.rows.length
    ? //Return success status and JWT
    res.status(200).json({
      //Generate JWT and package into json response
      jwt: auth.generateJWT(
        dbResponse.rows[0].user_id,
        dbResponse.rows[0].user_role
      ),
    })
    : //Return failed authentication status and empty array
    res.sendStatus(401);
  //The two res.xxxxxx... statements are twin exit points
});

/***********
 * EXPORTS *
 ***********/
//Export router for mounting to app
module.exports = router;
