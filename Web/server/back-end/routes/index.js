/************
 * Requires *
 ************/
const users = require('./users');
const strata = require('./strata');

//top level routing goes here and passes to ~/routes/'table'.js
module.exports = app => {
    app.use('/api/users', users)
    app.use('/api/strata', strata)
};