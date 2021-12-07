const db = require('../database/connect');
const bcrypt = require ("bcryptjs");

const createNewUser = (data) => {
    return new Promise(async (resolve, reject) => {
        // check email is exist or not
        const isUserExist = await checkExistUser(data.username);
        if (isUserExist) {
            reject(`This username "${data.username}" has already exist. Please choose an other username`);
        } else {
            // hash password
            let salt = bcrypt.genSaltSync(10);
            let userItem = {
                fullname: data.fullname,
                address:data.address,
                telephone:data.mobilephone,
                username: data.username,
                password: bcrypt.hashSync(data.password, salt),
            };

            //create a new account
            db.query(
                ' INSERT INTO admins set ? ', userItem,
                function (err, rows) {
                    if (err) {
                        reject(err.message)
                    }
                    resolve("Create a new user successful");
                }
            );
        }
    });
};

const checkExistUser = (username) => {
    return new Promise((resolve, reject) => {
        try {
            db.query(
                ' SELECT * FROM `admins` WHERE `username` = ?  ', username,
                function (err, rows) {
                    if (err) {
                        reject(err)
                    }
                    if (rows.length > 0) {
                        resolve(true)
                    } else {
                        resolve(false)
                    }
                }
            );
        } catch (err) {
            reject(err);
        }
    });
};
module.exports = {
    createNewUser: createNewUser
};