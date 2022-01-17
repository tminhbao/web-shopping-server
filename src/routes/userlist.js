const express = require("express");
const router = express.Router();
const userListController = require("../controllers/UserListController");
const signInController = require("../controllers/SignInController");
router.get("/", signInController.checkLoggedIn, userListController.index);
module.exports = router;
