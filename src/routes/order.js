// const route = require('color-convert/route');
const express = require("express");
const router = express.Router();
const orderController = require("../controllers/OrderController");
const orderDeliveryController = require("../controllers/OrderDeliveringController");
const signInController = require("../controllers/SignInController");
// router.get('/delivery', order.delivery);//Chưa giao hàng
// router.get('/delivery/:id', order.delivery_detail);

// router.get('/delivered', order.delivered);//Đã giao hàng
// router.get('/delivered/:id', order.delivered_detail);

// router.get('/deliver/:id', order.deliver);//Giao hàng

router.get("/", signInController.checkLoggedIn, orderController.index);
router.get(
  "/delivery",
  signInController.checkLoggedIn,
  orderDeliveryController.index
);
router.get("/delivered", signInController.checkLoggedIn, orderController.index);

module.exports = router;
