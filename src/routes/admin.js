const express = require('express');
const router = express.Router();
const adminController = require('../controllers/AdminController');

// router.get('/signUp', admin.signUp);
// router.post('/signUp', admin.signUpPost);

// router.get('/signIn', admin.signIn);
// router.post('/signIn', admin.signInPost);

router.use('/',adminController.index);

module.exports = router;