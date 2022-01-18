const ShoppingCartModel = require("../models/shopping-cart");
class ReportController {
  async index(req, res) {
    const listProduct = await ShoppingCartModel.getTop10Product();
    res.render("report/top", { listProduct: listProduct });
  }
}
module.exports = new ReportController();
