const check = require("express-validator").check;

let validateRegister = [
    //check("email", "Invalid email").isEmail().trim(),

    check("username","Invalid username").exists().isLength({min:3}),

    check("password", "Invalid password. Password must be at least 2 chars long")
        .isLength({ min: 2 }),

    check("confirm_password", "Password confirmation does not match password")
        .custom((value, { req }) => {
            return value === req.body.password
        })
];

let validateLogin = [
    //check("email", "Invalid email").isEmail().trim(),
    check("username","Invalid username").isLength({min:3}),
    check("password", "Invalid password")
        .not().isEmpty()
];

module.exports = {
    validateRegister: validateRegister,
    validateLogin: validateLogin
};