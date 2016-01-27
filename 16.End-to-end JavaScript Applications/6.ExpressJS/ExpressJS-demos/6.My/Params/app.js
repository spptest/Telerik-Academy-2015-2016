var express = require('express'),
    bodyParser = require('body-parser'),
    app;

app = express();

// npm install body-parser --save
app.use(bodyParser.urlencoded());

// localhost:1234/temp/5
app.get('/temp/:id', function (req, res) {
    res.send(req.params.id);
});

// localhost:1234/temp?name="gosho"&age=10
app.get('/temp', function (req, res) {
   res.send(req.query.name + ' ' + req.query.age);
});

// post request
app.post('/temp', function (req, res) {
   res.send(req.body.name);
});

app.listen(1234);
