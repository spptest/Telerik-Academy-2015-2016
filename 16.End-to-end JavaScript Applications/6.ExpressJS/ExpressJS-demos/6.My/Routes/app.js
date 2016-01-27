var express = require('express'),
    app = express();

var students = [
    {id: 1, name: 'Gosho', age: 15},
    {id: 2, name: 'Pesho', age: 25},
    {id: 3, name: 'Kiro', age: 18},
    {id: 4, name: 'Stamat', age: 35},
    {id: 5, name: 'Dragan', age: 45}
];

//1)
//app.get('/temp', function (req, res) {
//    res.json('!!TEMP GET!!');
//});
//
//app.post('/temp', function (req, res) {
//    res.json('!!TEMP POST!!');
//});

//2)
//app.route('/temp')
//    .get(function (req, res) {
//        res.json('!!TEMP GET!!');
//    })
//    .post(function (req, res) {
//        res.json('!!TEMP POST!!');
//    });

//3)
var tempRouter = new express.Router();

tempRouter.get('/', function (req, res) {
    res.json('!!TEMP GET!!'); 
});

tempRouter.post('/', function (req, res) {
    res.json('!!TEMP POST!!');
});

app.use('/temp', tempRouter);

app.listen(1234);