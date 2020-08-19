/**
 * TITLE: /routes/users.js
 *
 * Description:
 *      Creates tail-end routes and queries for users table.
 *      Used by /routes/index.js to direct top level routing.
 */
const Router = require("express-promise-router");
const db = require("../db");
const auth = require("../auth");
const validate = auth.authentication.middlewareValidateJWT;
const authorise = auth.authorisation.authorise;
const {
  Admin, Executive, Manager, Owner, Tenant
} = require("../auth/roles");

const router = new Router();

//Permissions
const create = [Admin, Executive];
const readAll = [Admin, Executive];
const readLimited = [Manager, Owner, Tenant];
const update = [Admin, Executive, Manager, Owner, Tenant];
const del = [Admin, Executive];
router.post("/", validate, authorise(create), createUser);
router.get("/", validate, authorise(readAll), readUsers);
router.get("/:id", validate, authorise(readAll.concat(readLimited)), readUserByID);
router.delete("/", validate, authorise(del), deleteUserByEmail);
module.exports = router;

async function createUser(req, res, next) {
  const {
    user_email,
    user_password,
    user_name,
    strata,
    unit,
    user_role,
    user_status,
  } = req.body;

  try {
    const dbResponse = await db.query(
      "INSERT INTO strataly_schema.users (user_id, user_email, user_password, user_name, strata, unit, user_role, user_status)(VALUES(DEFAULT, $1, $2, $3, $4, $5, $6, $7))",
      [user_email, user_password, user_name, strata, unit, user_role, user_status]
    );

    if (dbResponse.rowCount === 0) {
      res.sendStatus(404);
    } else {
      res.sendStatus(201);
    }
  } catch (err) {
    res.sendStatus(409);
    return next();
  }
}

async function readUsers(req, res) {
  const dbResponse = await db.query(
    "SELECT * FROM strataly_schema.users ORDER BY user_id ASC;"
  );
  res.status(200).json(dbResponse.rows);
}

async function readUserByID(req, res) {
  const currentUserRole = req.user.role;
  const currentUserID = req.user.id;
  const id = parseInt(req.params.id);

  if (readAll.includes(currentUserRole) || currentUserID === id) {
    const dbResponse = await db.query(
      "SELECT * FROM strataly_schema.users WHERE user_id = $1;",
      [id]
    );

    if (dbResponse.rows.length === 0) {
      res.sendStatus(404);
    } else {
      res.status(200).json(dbResponse.rows);
    }
  } else {
    res.sendStatus(403);
  }
};

async function deleteUserByEmail(req, res) {
  const { user_email } = req.body;

  const dbResponse = await db.query(
    "DELETE FROM strataly_schema.users WHERE user_email = $1;",
    [user_email]
  );

  if (dbResponse.rowCount === 0) {
    res.sendStatus(404);
  } else {
    res.sendStatus(200);
  }
};
