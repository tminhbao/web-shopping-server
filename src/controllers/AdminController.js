class AdminController {
    index(req,res) {
        res.render('admin/signin')
    }
}
module.exports = new AdminController;