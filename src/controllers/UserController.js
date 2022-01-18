const ShoppingCartModel = require("../models/shopping-cart");
class UserController {
  index(req, res) {
    res.render("userlist");
  }
}

module.exports = new UserController();
