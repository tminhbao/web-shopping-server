const ShoppingCartModel = require("../models/shopping-cart");
class OrderController {
  async index(req, res) {
    const listCheckout = await ShoppingCartModel.getCheckoutDelivered();
    res.render("order/delivered", { listCheckout: listCheckout });
  }
}
module.exports = new OrderController();
