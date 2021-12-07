const ProductModel = require('../models/product');
class HomeController {
    async index(req, res) {
        // let listPro = ProductModel.list();
        // res.render('home',{listPro:listPro});
        const { listItem, page, totalPage } = await ProductModel.getList(req.query.page || 0, req.query.name)
        const listPage = [];
        for (let i = 0; i < totalPage; i++) {
            listPage.push(i);
        }
        res.render('home', { listPro: listItem, listPage, page, user:req.user });
    }
}
module.exports = new HomeController;