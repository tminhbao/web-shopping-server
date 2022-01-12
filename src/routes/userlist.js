const express = require("express");
const router = express.Router();
const userListController = require("../controllers/UserListController");
router.get("/", userListController.index);
module.exports = router;
