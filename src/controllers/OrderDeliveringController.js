const ShoppingCartModel = require("../models/shopping-cart");
class OrderController {
  async index(req, res) {
    const listCheckout = await ShoppingCartModel.getCheckoutDelivering();
    res.render("order/delivery", { listCheckout: listCheckout });
  }
}
module.exports = new OrderController();
