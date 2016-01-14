var mongoose = require('mongoose'),
    fs = require('fs'),
    path = require('path');

module.exports = function (app, appParams, config) {
    var logger = require(appParams.loggerPath);

    mongoose.connect(config.db);
    var db = mongoose.connection;

    db.once('open', function (err) {
        if (err)
        {
            logger.error('Database could not be opened: ' + err);
            return;
        }

        logger.log('MongoDB is up and running...');
    });

    db.on('error', function (err) {
        logger.error('MongoDB error: ' + err);
    });

    require(appParams.modelsPath + '/user-model.js').init(appParams);

    /**
     * A hack is used in order to models before return the action to the config-loader
     * Otherwise password requires a model and is trying to get a Model which is not registered
     */
    //console.log('asd');
    //console.log(path.normalize(appParams.modelsPath));
    //var modelConfigurationComplete = false;
    //fs.readdir(path.normalize(appParams.modelsPath), function (err, files) {
    //    console.log(files);
    //    if (err)
    //    {
    //        logger.error("fs: " + err);
    //    }
    //
    //    var processedItems = 0;
    //
    //    files
    //        .filter(function (file) {
    //            return file.indexOf('-model') >= 0
    //        })
    //        .forEach(function (file, index, array) {
    //            require(path.normalize(appParams.modelsPath + '/' + file)).init(appParams);
    //            processedItems++;
    //            console.log(array.length);
    //            if(processedItems === array.length) {
    //                modelConfigurationComplete = true;
    //            }
    //        });
    //});
    //
    //while(!modelConfigurationComplete)
    //{
    //    setTimeout(function () { console.log('asd') }, 10);
    //}
};