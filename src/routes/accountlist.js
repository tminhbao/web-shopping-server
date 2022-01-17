const express = require("express");
const router = express.Router();
const accountListController = require("../controllers/AccountListController");
const signInController = require("../controllers/SignInController");
router.use("/", signInController.checkLoggedIn, accountListController.index);
module.exports = router;
