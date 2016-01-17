var mongoose = require('mongoose');

mongoose.connect('localhost:27017/students');
var db = mongoose.connection;

db.once('open', function (err) {
    if (err)
    {
        console.log(err);
        return;
    }

    console.log('MondoDB up and running...');
});

db.on('error', function (err) {
    console.log(err);
});

require('../models/Student.js').init();
require('../models/Course.js').init();