const ShoppingCartModel = require("../models/shopping-cart");
class OrderController {
  async index(req, res) {
    if (req.query.delivered === "delivered") {
      await ShoppingCartModel.updateCheckout(req.query.user_id);
    }
    const listCheckout = await ShoppingCartModel.getCheckoutDelivering();
    res.render("order/delivery", { listCheckout: listCheckout });
  }
}
module.exports = new OrderController();
