require('dotenv').config();
const express = require('express');
const axios = require("axios");
const https = require('https');
const fs = require('fs');
const bodyParser = require('body-parser');
const session = require('express-session');
const path = require('path');
const app = express();
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

const port = process.env.PORT || 3000

app.set('view engine', 'ejs');
app.set('trust proxy', 1);
app.use(session({
    secret: 'dryantezank',
    resave: true,
    saveUninitialized: true,
    cookie: {secure: true}
}));

// Thiết lập thư mục public sẽ được truy cập từ client
app.use(express.static(path.join(__dirname, 'public')));

// Thiết lập router trong ứng dụng
require('./routers/web.router')(app);

app.get('/', (req, res) => {
    if (req.session.isLogin) {
        if (req.session.quyen == 1)
            res.render('index', { un: req.session.username })
        else if (req.session.quyen == 2)
            res.redirect('/benhnhan_bacsi')
        else
            res.redirect('/hosobenhnhan')
    }
    else
        res.redirect('/dangnhap')
});
// Thiết lập sử dụng self - certification
const options = {
    key: fs.readFileSync('private-key.pem'),
    cert: fs.readFileSync('public-cert.pem')
};

https.createServer(options, app).listen(port, () => {
    console.log(`Server running on port ${port}`);
});