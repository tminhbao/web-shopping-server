const express = require('express');
const router = express.Router();
const homeController = require('../controllers/HomeController');

// router.get('/signUp', admin.signUp);
// router.post('/signUp', admin.signUpPost);

// router.get('/signIn', admin.signIn);
// router.post('/signIn', admin.signInPost);

router.use('/',homeController.index);

module.exports = router;