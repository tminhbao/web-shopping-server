const userModel = require("../models/user");
const db = require("../database/connect");
class UserListController {
  async index(req, res) {
    const { listItem, page, totalPage } = await userModel.getListUser(
      req.query.page || 1
    );
    const listPage = [];
    for (let i = 0; i < totalPage; i++) {
      listPage.push(i + 1);
    }
    res.render('users/list', {
      listUser: listItem,
      listPage,
      page,
      user: req.user,
    });
  }
}
module.exports = new UserListController();
