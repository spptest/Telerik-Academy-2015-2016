var mongoose = require('mongoose');

mongoose.connect('localhost:27017/students');
var db = mongoose.connection;

db.once('open', function (err) {
    if (err) {
        console.log(err);
    }

    console.log('MongoDB database up and running...');
});

db.on('error', function (err) {
    console.log(err);
});

var studentSchema = new mongoose.Schema({
    firstName: {type: String, required: true},
    lastName: {type: String},
    age: {type: Number, min: 0, max: 100, required: true},
	dateEgistered: {type: Date, default: new Date() }
});

studentSchema.path('firstName').validate(function (value) {
    return value.length > 3 && value.length < 255;
});

studentSchema.virtual('fullName').get(function () {
    var currentLastName = this.lastName || 'No Lastname';
    return this.firstName + ' ' + currentLastName;
});

studentSchema.methods.printStudent = function () {
    console.log(this.fullName + ', age: ' + this.age);
};

var Student = mongoose.model('Student', studentSchema);

var courseSchema = new mongoose.Schema({
    name: {type: String, required: true},
    students: [studentSchema]
});

var Course = mongoose.model('Course', courseSchema);

//1)
//var peshoStudent = new Student({firstName: "Pesho", lastName: "Peshev", age: 10});
//peshoStudent.save(function (err, student) {
//    if (err)
//    {
//        console.log(err);
//    }
//
//    console.log(student);
//    student.printStudent();
//});

//2)
//Student.find({}, function (err, studens) {
//    var peshoStudent = studens[0];
//    var nodeCourse = new Course({name: "NodeJS Course"});
//    nodeCourse.students.push(peshoStudent);
//    nodeCourse.save(function (err, course) {
//       console.log(course);
//    });
//});

//3)
//Course.find({}, function (err, results) {
//    console.log(results);
//    var nodeCourse = results[0];
//    nodeCourse.name = "NODOEJS Course";
//    nodeCourse.save(function (err, course) {
//        console.log(course);
//    });
//});

Student
    .find()
    .or([{firstName: "Pesho"}, {firstName: "Ivan"}])
    .and([{age: 10}])
    .exec(function (err, results) {
        console.log(results);
    });