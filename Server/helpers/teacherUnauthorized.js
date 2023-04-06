function sendUnauthorized(res)
{
    res.json({
        "Error": "Un-authorized"
    }).status(401);
    res.end();
}

module.exports = sendUnauthorized;