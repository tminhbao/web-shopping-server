const express = require('express');
const router = express.Router();
const reportController = require('../controllers/ReportController');

// router.get('/top',report.top);
router.use('/',reportController.index)
module.exports = router;