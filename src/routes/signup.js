const express = require('express');
const router = express.Router();
const signUpController = require('../controllers/SignUpController');
const auth = require('../validation/auth');

router.get('/',signUpController.index);
router.post('/',auth.validateRegister,signUpController.createNewUser);

module.exports = router;