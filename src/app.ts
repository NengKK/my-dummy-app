require('dotenv').config();
import express = require('express');
import { ShowBranch, GetFile } from 'dummy-package';
import * as SshClient from 'ssh2-sftp-client';

const port = process.env.PORT || '3000';
const app: express.Application = express();

app.get('/', (req, res) => {
    res.send(`Hello from branch "${ShowBranch.BRANCH}"`);
});

app.get('/getFile', async (req, res) => {
    req.setTimeout(0);

    try {
        const fileName = 'EMIS Insights - China Healthcare Sector Report 2017 1st Quarter.pdf';
        const result = await GetFile(fileName);
        res.send(`${result}`);
    } catch (err) {
        res.status(500).send(err.message);
    }
});

app.get('/test', async (req, res) => {
    req.setTimeout(0);

    try {
        const sftp = new SshClient();
        await sftp.connect({
            host: 'data.emis.com',
            port: 22,
            username: process.env.EMIS_USERNAME,
            password: process.env.EMIS_PASSWORD
        }).then(() => console.log('Connect SFTP successful!'));

        const fileName = 'EMIS Insights - China Healthcare Sector Report 2017 1st Quarter.pdf';
        const result = await sftp.get(fileName, undefined, { encoding: null })
            .then(() => 'successful')
            .catch(err => `error=${err}`);

        res.status(200).send(result);
    } catch (err) {
        res.status(500).send(err.message);
    }
});

app.listen(port, () => {
    console.log(`App listening on port ${port}`);
});
