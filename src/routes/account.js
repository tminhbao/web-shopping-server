const express = require("express");
const router = express.Router();
const accountController = require("../controllers/AccountController");
const signInController = require("../controllers/SignInController");
router.use("/", signInController.checkLoggedIn, accountController.index);
module.exports = router;
