var mongoose = require('mongoose'),
    studentScheme = mongoose.model('Student').schema;

var CourseData;

module.exports = {
    init: function () {
        var courseScheme = new mongoose.Schema({
            name: {type: String, required: true},
            students: [studentScheme]
        });

        CourseData = mongoose.model('Course', courseScheme);
    },
    all: function (request, callback) {
        request = request || {};
        CourseData.find(request).exec(callback);
    },
    findById: function (id, callback) {
        
    }
};