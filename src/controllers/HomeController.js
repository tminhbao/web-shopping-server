const ProductModel = require('../models/product');

class HomeController {
    async index(req, res) {
        const { listItem, page, totalPage } = await ProductModel.getList(req.query.page || 1, req.query.name)
        const listPage = [];
        for (let i = 0; i < totalPage; i++) {
            listPage.push(i + 1);
        }
        res.render('home', { listPro: listItem, listPage, page, user:req.user });
    }
}
module.exports = new HomeController;