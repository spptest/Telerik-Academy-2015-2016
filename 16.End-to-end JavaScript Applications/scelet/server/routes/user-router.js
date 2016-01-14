var express = require('express'),
    path = require('path'),
    ROUTER_NAME = '/user';

var init = function (app, appParams) {
    var userController = require(path.normalize(appParams.controllerPath + '/users-controller'))(appParams),
        userRouter = new express.Router();

    userRouter.get('/register', userController.getRegister);
    userRouter.post('/register', userController.postRegister);

    userRouter.get('/login', userController.getLogin);
    userRouter.post('/login', userController.login);
    userRouter.get('/logout', userController.logout);

    app.use(userRouter);
};

module.exports = {
    init: init
};
