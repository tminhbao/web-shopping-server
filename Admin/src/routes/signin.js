const express = require('express');
const router = express.Router();
const signInController = require('../controllers/SignInController');
const passport = require('passport');
const initPassportLocal = require('../controllers/PassportController');

initPassportLocal();

router.get('/',signInController.checkLoggedOut,signInController.index);
router.post('/',passport.authenticate('local',{
    successRedirect:'/',
    failureRedirect:'/signin',
    successFlash:true,
    failureFlash:true
}))

module.exports = router;