const express = require('express');
const app = express();
const cors = require("cors");

app.use(cors());
app.use(express.json());

app.get("/" ,(req, res) => {
    res.send("Hello");
})

const auth = require('./routes/authenticate');
app.use('/authenticate', auth);

const labs = require('./routes/SpecialLab');
app.use('/labs', labs);

const faculty = require('./routes/faculty');
app.use('/faculty', faculty);

const request = require('./routes/requests');
app.use('/request', request);

const getCount = require('./routes/getCounts');
app.use('/getAllCount', getCount);

app.listen(80, '0.0.0.0', () => {
    console.log("Listening on port 80");
})
