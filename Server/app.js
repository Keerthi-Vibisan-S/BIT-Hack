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

app.listen(80, () => {
    console.log("Listening on port 3001");
})