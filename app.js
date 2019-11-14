var express = require('express');
var app = express();

app.get('/', (req, res) => {
    res.send('Hello, from AWS elastic beanstalk!');
});

app.listen(3000, () => {
    console.log('Application started!');
});
