const express = require('express');
const router = express.Router();
const accountListController = require('../controllers/AccountListController');

router.use('/',accountListController.index);

module.exports = router;