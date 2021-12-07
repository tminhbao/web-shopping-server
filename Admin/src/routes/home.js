const express = require('express');
const router = express.Router();
const homeController = require('../controllers/HomeController');
const signInController = require('../controllers/SignInController');

router.use('/',signInController.checkLoggedIn,homeController.index);

module.exports = router;