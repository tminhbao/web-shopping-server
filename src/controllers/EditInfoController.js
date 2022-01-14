const db = require("../database/connect");
class EditInfoController {
  index(req, res) {
    res.render("editinfo", { user: req.user });
  }
  changeInfo(req, res) {
    const user = req.user;
    console.log(user);
    const username = user.username;
    const updateData = req.body;
    db.query(
      `UPDATE admins SET ? WHERE username = '${username}'`,
      updateData,
      function (err, data) {
        if (err) throw err;
        console.log(data.affectedRows + " record(s) updated");
      }
    );
    res.redirect("/account");
  }
}
module.exports = new EditInfoController();
