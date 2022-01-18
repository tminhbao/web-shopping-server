const express = require("express");
const router = express.Router();
const orderDeliveryController = require("../controllers/OrderDeliveryController");
const signInController = require("../controllers/SignInController");

router.use("/", signInController.checkLoggedIn, orderDeliveryController.index);

module.exports = router;
