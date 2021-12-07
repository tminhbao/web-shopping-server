const passportLocal = require("passport-local"); 
const passport = require("passport");
const signInService = require('../services/signInService');
const LocalStrategy = passportLocal.Strategy;

const initPassportLocal = () => {
    passport.use(new LocalStrategy({
            usernameField: 'username',
            passwordField: 'password',
            passReqToCallback: true
        },
        async (req, username, password, done) => {
            try {
                await signInService.findUserByUser(username).then(async (user) => {
                    if (!user) {
                        return done(null, false, req.flash("errors", `This user username "${username}" doesn't exist`));
                    }
                    if (user) {
                        const match = await signInService.comparePassword(password, user);
                        if (match === true) {
                            return done(null, user, null)
                        } else {
                            return done(null, false, req.flash("errors", match)
                            )
                        }
                    }
                });
            } catch (err) {
                console.log(err);
                return done(null, false, err);
            }
        }));

};

passport.serializeUser((user, done) => {
    done(null, user.id);
});

passport.deserializeUser((id, done) => {
    signInService.findUserById(id).then((user) => {
        return done(null, user);
    }).catch(error => {
        return done(error, null)
    });
});

module.exports = initPassportLocal;