require('./config/mongoose');

var course = require('./models/Course.js');

course.all({}, function (err, results) {
    console.log(results);
});