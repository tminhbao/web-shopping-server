const userModel = require("../models/user");
const db = require("../database/connect");
class UserListController {
  async index(req, res) {
    if (req.query.user_id) await userModel.lockUser(req.query.user_id);
    const { listItem, page, totalPage } = await userModel.getListUser(
      req.query.page || 1
    );
    const listPage = [];
    for (let i = 0; i < totalPage; i++) {
      listPage.push(i + 1);
    }

    res.render("userlist", {
      listUser: listItem,
      listPage,
      page,
      user: req.user,
    });
  }
}
module.exports = new UserListController();
