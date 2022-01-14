const userModel = require("../models/user");

class AccountListController {
  async index(req, res) {
    const { listItem, page, totalPage } = await userModel.getListAdmin(
      req.query.page || 1
    );
    const listPage = [];
    for (let i = 0; i < totalPage; i++) {
      listPage.push(i + 1);
    }
    res.render("accountlist", {
      listUser: listItem,
      listPage,
      page,
      user: req.user,
    });
  }
}
module.exports = new AccountListController();
