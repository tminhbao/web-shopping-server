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
      function (err, result) {
        if (err) throw err;
        console.log("Number of records updated: " + result.affectedRows);
      }
    );
    res.redirect("/account");
  }
}
module.exports = new EditInfoController();
