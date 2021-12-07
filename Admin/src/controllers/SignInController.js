const validationResult = require('express-validator').validationResult;
const signInService = require('../services/signInService');

const index = async (req, res) => {
    return res.render('signin', {
        errors: req.flash("errors")
    })
}

const handleLogin = async (req, res) => {
    const errorsArr = [];
    const validationErrors = validationResult(req);
    if (!validationErrors.isEmpty()) {
        const errors = Object.values(validationErrors.mapped());
        errors.forEach((item) => {
            errorsArr.push(item.msg);
        });
        req.flash("errors", errorsArr);
        return res.redirect("/signin");
    }

    try {
        await signInService.handleLogin(req.body.username, req.body.password);
        return res.redirect("/");
    } catch (err) {
        req.flash("errors", err);
        return res.redirect("/signin");
    }
};

const checkLoggedIn = (req, res, next) => {
    if (!req.isAuthenticated()) {
        return res.redirect("/signin");
    }
    next();
};

const checkLoggedOut = (req, res, next) => {
    if (req.isAuthenticated()) {
        return res.redirect("/");
    }
    next();
};

const postLogOut = (req, res) => {
    req.session.destroy(function (err) {
        return res.redirect("/signin");
    });
};

module.exports = {
    index: index,
    handleLogin: handleLogin,
    checkLoggedIn: checkLoggedIn,
    checkLoggedOut: checkLoggedOut,
    postLogOut: postLogOut
};