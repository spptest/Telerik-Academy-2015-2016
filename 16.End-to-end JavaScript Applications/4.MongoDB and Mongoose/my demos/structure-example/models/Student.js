var mongoose = require('mongoose');

module.exports.init = function () {
    var studentScheme = new mongoose.Schema({
        firstName: {type: String, required: true},
        lastName: {type: String},
        age: {type: Number, min: 0, max: 120, required: true}
    });

    studentScheme.path('firstName').validate(function (value) {
        return value.length > 3 && value.length < 255;
    });

    studentScheme.virtual('fullName').get(function () {
        var currentLastName = this.lastName || "No last name";
        return this.firstName + ' ' + currentLastName;
    });

    studentScheme.methods.printStudent = function () {
        console.log(this.fullName + ', age: ', this.age);
    };

    var Student = mongoose.model('Student', studentScheme);
};