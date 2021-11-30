class OrderController {
    index(req,res) {
        res.render('order/delivered')
    }
}
module.exports = new OrderController;