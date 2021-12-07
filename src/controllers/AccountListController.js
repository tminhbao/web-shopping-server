const userModel = require('../models/user');
const db = require('../database/connect');
class AccountListController {
    index(req,res) {
        db.query('SELECT * FROM admins',(err,data) => {
            if(err) throw err;
            res.render('accountlist',{listUser:data});
        })
    }
}
module.exports = new AccountListController;