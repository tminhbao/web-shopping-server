const express = require("express");
const router = express.Router();
const userInfoController = require("../controllers/UserInfoController");
router.get("/", userInfoController.index);
module.exports = router;
