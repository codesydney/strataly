/**
 * TITLE: /routes/strata.js
 *
 * Description:
 *      Creates tail-end routes and queries for the strata table.
 *      Used by /routes/index.js to direct top level routing.
 *
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
const read = [Admin, Executive, Manager, Owner, Tenant];
const update = [Admin, Executive];
const del = [Admin, Executive];
router.post("/", validate, authorise(create), createStrata);
router.get("/", validate, authorise(read), readStrata);
router.get("/:strata_plan_id", validate, authorise(read), readStrataByID);
router.delete("/:strata_plan_id", validate, authorise(del), deleteStrataByID);
module.exports = router;

async function createStrata(req, res, next) {
  const {
    strata_plan_id,
    strata_name,
    strata_address,
    office_address,
    office_email,
  } = req.body;

  try {
    const dbResponse = await db.query(
      "INSERT INTO strataly_schema.strata (strata_plan_id, strata_name, strata_address, office_address, office_email) VALUES ($1, $2, $3, $4, $5);",
      [strata_plan_id, strata_name, strata_address, office_address, office_email]
    );

    if (dbResponse.rowCount === 0) {
      res.sendStatus(404);
    } else {
      res.sendStatus(201)
    }
  } catch (err) {
    res.sendStatus(409);
    return next();
  }
}

async function readStrata(req, res) {
  const dbResponse = await db.query(
    "SELECT * FROM strataly_schema.strata;"
  );
  res.status(200).json(dbResponse.rows);
}

async function readStrataByID(req, res) {
  const id = req.params.strata_plan_id;

  const dbResponse = await db.query(
    "SELECT * FROM strataly_schema.strata WHERE strata_plan_id = $1;",
    [id]
  );

  if (dbResponse.rows.length === 0) {
    res.sendStatus(404);
  } else {
    res.status(200).json(dbResponse.rows);
  }
}

async function deleteStrataByID(req, res) {
  const id = req.params.strata_plan_id;

  const dbResponse = await db.query(
    "DELETE FROM strataly_schema.strata WHERE strata_plan_id = $1;",
    [id]
  );

  if (dbResponse.rowCount === 0) {
    res.sendStatus(404);
  } else {
    res.sendStatus(200);
  }
}
