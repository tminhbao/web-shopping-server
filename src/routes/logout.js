const express = require('express');
const router = express.Router();
const signInController = require('../controllers/SignInController');
router.post('/logout',signInController.postLogOut);
module.exports = router;