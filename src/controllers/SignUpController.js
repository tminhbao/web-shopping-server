const signUpService = require ('../services/signUpService');
const validationResult = require ('express-validator').validationResult;

const index = (req, res) => {
    return res.render('signup', {
        errors: req.flash("errors")
    });
};

const createNewUser = async (req, res) => {
    //validate required fields
    const errorsArr = [];
    const validationErrors = validationResult(req);
    if (!validationErrors.isEmpty()) {
        const errors = Object.values(validationErrors.mapped());
        errors.forEach((item) => {
            errorsArr.push(item.msg);
        });
        req.flash("errors", errorsArr);
        return res.redirect("/signup");
    }
    //create a new user
    const newUser = {
        fullname: req.body.fullname,
        address:req.body.address,
        mobilephone:req.body.mobilephone,
        username: req.body.username,
        password: req.body.password
    };
    try {
        await signUpService.createNewUser(newUser);
        return res.redirect("/signin");
    } catch (err) {
        req.flash("errors", err);
        return res.redirect("/signup");
    }
};
module.exports = {
    index: index,
    createNewUser: createNewUser
};