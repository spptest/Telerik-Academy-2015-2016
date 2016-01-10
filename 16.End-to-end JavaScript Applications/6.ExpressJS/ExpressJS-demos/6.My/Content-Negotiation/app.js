var express = require('express'),
    path = require('path'),
    util = require('util'),
    app = express();

app
    .set('views', path.join(__dirname, '/views'))
    .set('view engine', 'jade');

// Header: Accept: 'application/json'
app.get('/', function (req, res) {
   res.format({
        html: function () { res.render('customer') },
        json: function () { res.json(JSON.stringify('Hello')) },
        text: function () { res.send(util.format('hello')) }
   });
});

app.listen(1234);
