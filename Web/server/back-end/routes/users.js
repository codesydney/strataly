/**
 * TITLE: /routes/users.js
 *
 * Description:
 *      Creates tail-end routes and queries for users table.
 *      Used by /routes/index.js to direct top level routing.
 */
/************
 * Requires *
 ************/
const Router = require("express-promise-router");
const db = require("../db");
const auth = require("../auth");
const roles = require("../auth/roles");

/*************
 * Instances *
 *************/
const router = new Router();

/**********
 * Routes *
 **********/
//Attach routing functions to router

//CREATE
router.post("/",
  auth.authentication.middlewareValidateJWT,
  auth.authorisation.authorise([roles.Admin]),
  async (req, res) => {
    //Parse body for form-data
    // const {
    //   user_email,
    //   user_password,
    //   user_name,
    //   strata,
    //   unit,
    //   user_role,
    //   user_status,
    // } = req.body;

    // console.log("\n--User Registration--");
    // console.log(user_email);
    // console.log(user_password);
    // console.log(user_name);
    // console.log(strata);
    // console.log(unit);
    // console.log(user_role);
    // console.log(user_status);

    // console.log("Role: ", req.user.role); //DELETEME

    // res.status(401).json(req.body);
    res.status(401).json({ message: 'SUCCESS!' });
  });

//READ
// get all users
router.get("/", async (req, res) => {
  const dbResponse = await db.query(
    "SELECT * FROM strataly_schema.users ORDER BY user_id ASC;"
  );
  res.status(200).json(dbResponse.rows);
});

// get user by id
router.get("/:user_id", async (req, res) => {
  //Get requested id value
  const usr_id = req.params.user_id;

  //Await query response
  const dbResponse = await db.query(
    "SELECT * FROM strataly_schema.users WHERE user_id = $1;",
    [usr_id]
  );

  //Return status & query response
  res.status(200).json(dbResponse.rows);
});

/***********
 * EXPORTS *
 ***********/
//Export router for mounting to app
module.exports = router;
