const UserModel = require("../models/user");
class UserInfoController {
  async index(req, res) {
    const userInfo = await UserModel.getUserByID(req.query.id);
    console.log(userInfo);
    res.render("userinfo", { user: req.user, userInfo: userInfo });
  }
}
module.exports = new UserInfoController();
