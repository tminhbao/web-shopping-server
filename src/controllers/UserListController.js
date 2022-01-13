const userModel = require("../models/user");
const db = require("../database/connect");
class UserListController {
  index(req, res) {
    db.query("SELECT * FROM users", (err, data) => {
      if (err) throw err;
      res.render("userlist", { listUser: data });
    });
  }
}
module.exports = new UserListController();
