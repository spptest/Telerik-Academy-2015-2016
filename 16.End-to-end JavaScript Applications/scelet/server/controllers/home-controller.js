var path = require('path');

var CONTROLLER_NAME = 'home';

module.exports = function (appParams) {
    function getHome(req, res) {
        res.render('index')
    }

    return {
        getHome: getHome
    }
};