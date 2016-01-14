var passport = require('passport');

var CONTROLLER_NAME = 'users';

module.exports = function (appParams) {
    var userService = require(appParams.servicesPath + '/user-service'),
        encryption = require(appParams.encryptionUtilPath),
        logger = require(appParams.loggerPath)(appParams);

    function getRegister(req, res) {
        res.render(CONTROLLER_NAME + '/register')
    }

    function getLogin(req, res) {
        res.render(CONTROLLER_NAME + '/login');
    }

    function postRegister(req, res) {
        var newUserData = req.body;

        if (newUserData.password != newUserData.confirmPassword) {
            req.session.error = 'Passwords do not match.';
            res.redirect('/register');
        } else {
            newUserData.salt = encryption.generateSalt();
            newUserData.hashPass = encryption.generateHashedPassword(newUserData.salt, newUserData.password);
            userService.create(newUserData, function(err, user) {
                if (err) {
                    logger.log('Failed to register new user: ' + err);
                    return;
                }

                req.logIn(user, function(err) {
                    if (err) {
                        req.session.error = "Invalid credentials.";
                        res.redirect('/login');
                    }
                    else {
                        res.redirect('/');
                    }
                })
            });
        }
    }

    function login(req, res, next) {
        var auth = passport.authenticate('local', function(err, user) {
            if (err) return next(err);
            if (!user) {
                req.session.error = "Invalid credentials.";
                res.redirect('/login');
            }

            req.logIn(user, function(err) {
                if (err) return next(err);
                res.redirect('/');
            })
        });

        auth(req, res, next);
    }

    function logout(req, res) {
        req.logout();
        res.redirect('/');
    }

    return {
        getRegister: getRegister,
        getLogin: getLogin,
        postRegister: postRegister,
        logout: logout,
        login: login
    }
};