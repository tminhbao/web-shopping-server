const express = require("express");
const router = express.Router();
const userInfoController = require("../controllers/UserInfoController");
const signInController = require("../controllers/SignInController");
router.get("/", signInController.checkLoggedIn, userInfoController.index);
module.exports = router;
