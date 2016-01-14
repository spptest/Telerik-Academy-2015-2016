var fs = require('fs'),
    path = require('path');

module.exports = function(app, appParams, config) {
    /**
     * Load configuration
     * Looks up for files in ./server/controllers folder and loads each file with '-controller' in its name
     */
    fs.readdir(path.normalize(appParams.controllerPath), function (err, files) {
        var authService = require(appParams.authServicePath),
            controllers = {},
            currentController,
            currentControllerName;

        files
            .filter(function (file) {
                return file.indexOf('controller') >= 0;
            })
            .forEach(function (file) {
                currentController = require(path.normalize(appParams.controllerPath) + '/' + file)(appParams);
                currentControllerName = file.split('-controller')[0];
                controllers[currentControllerName] = currentController;
            });

        app.get('/register', controllers.users.getRegister);
        app.post('/register', controllers.users.postRegister);

        app.get('/admin', authService.isAuthenticated, function (req, res) {
            res.send('a');
        });

        app.get('/login', controllers.users.getLogin);
        app.post('/login', controllers.users.login);
        app.get('/logout', controllers.users.logout);

        app.get('/', function(req, res) {
            res.render('index');
        });

        app.get('*', function(req, res) {
            res.redirect('/');
        });
    });
};