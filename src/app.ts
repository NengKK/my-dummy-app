require('dotenv').config();
import express = require('express');
import { ShowBranch } from 'dummy-package';

const port = process.env.PORT || '3000';
const app: express.Application = express();

app.get('/', (req, res) => {
    res.send(`Hello from branch "${ShowBranch.BRANCH}"`);
});

app.listen(port, () => {
    console.log(`App listening on port ${port}`);
});
