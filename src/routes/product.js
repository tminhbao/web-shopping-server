const express = require('express');
const router = express.Router();
const productController = require('../controllers/ProductController');

// router.get('/', product.index);

// router.get('/add', product.add);
// router.post('/add', product.addPost);

router.get('/delete', productController.delete);
router.get('/delete/:id', productController.delete_get);

// router.get('/update', product.update);
// router.get('/:id', product.edit);
// router.post('/update/:id', product.updatePost);


// router.use('/add',productController.add_get)

router.get('/add', productController.add_get)
router.post('/store', productController.add_post)

router.use('/',productController.index)

module.exports = router;