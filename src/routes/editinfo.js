const express = require("express");
const router = express.Router();
const editInfoController = require("../controllers/EditInfoController");
const signInController = require("../controllers/SignInController");
router.get("/", signInController.checkLoggedIn, editInfoController.index);
router.post("/", editInfoController.changeInfo);

module.exports = router;
