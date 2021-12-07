const db = require('../database/connect');

const listUser = [];
const getList = () => {
    let sql = `SELECT * FROM admins`
    db.query(sql, (err, result) => {
        if (err)
            throw err;
        return result;
    })
}

module.exports = { getList }