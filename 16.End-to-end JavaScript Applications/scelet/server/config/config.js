var path = require('path'),
    rootPath = path.normalize(__dirname + '/../../');

module.exports = {
    development: {
        rootPath: rootPath,
        db: 'mongodb://localhost:27017/testsystem',
        port: process.env.PORT || 1234
    },
    production: {
        rootPath: rootPath,
        db: 'mongodb://admin:dsadsadsadsadsadsadsaewerwewtewfdfsgfsdfdsfefdsgfdhtrytett@ds027328.mongolab.com:27328/DB_NAME',
        port: process.env.PORT || 3030
    }
};