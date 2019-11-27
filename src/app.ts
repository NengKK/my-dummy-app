require('dotenv').config();
import express = require('express');

const port = process.env.PORT || '3000';
const app: express.Application = express();

app.get('/', (req, res) => {
    res.send(`Hello`);
});

app.listen(port, () => {
    console.log(`App listening on port ${port}`);
});
