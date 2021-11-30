class UserController {
    index(req,res) {
        res.render('users/list')
    }
}
module.exports = new UserController;