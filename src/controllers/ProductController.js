class ProductController {
    index(req,res) {
        res.render('product/add')
    }
}
module.exports = new ProductController;