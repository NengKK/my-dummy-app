require('dotenv').config();
import express = require('express');
// import { ShowBranch } from 'dummy-package';

const port = process.env.PORT || '3000';
const app: express.Application = express();

app.get('/', (req, res) => {
    // res.send(`on ${ShowBranch.BRANCH} branch`);
    res.send(`ok`);
});

app.listen(port, () => {
    // console.log(`App listening on '${ShowBranch.BRANCH}' branch on port ${port}`);
    console.log(`App listening port ${port}`);
});
