const express = require('express');
const router = express.Router();
const productController = require('../controllers/ProductController');

// router.get('/', product.index);

// router.get('/add', product.add);
// router.post('/add', product.addPost);

// router.get('/delete', product.delete);
// router.get('/delete/:id', product.deleteProduct);

// router.get('/update', product.update);
// router.get('/:id', product.edit);
// router.post('/update/:id', product.updatePost);

router.use('/',productController.index)

module.exports = router;