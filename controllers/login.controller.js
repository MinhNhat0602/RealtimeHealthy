const db = require('../models/DataBaseModel');
const NguoiDung = require('../models/NguoiDungModel');
const bcrypt = require('bcrypt');

exports.Login = (req, res) => {
    res.render("dangnhap.ejs");
}

exports.handleLogin = async (req, res) => {
    try {
        const userName = req.body.username;
        const password = req.body.password;
        

        const userFromDataBase = await NguoiDung.layNguoiDungTheoTenDangNhap(userName);

        if (userFromDataBase.length >= 1) {
            user = userFromDataBase[0];
            passwordInDB = user.MatKhau;

            if (bcrypt.compareSync(password, passwordInDB)) {
                console.log("OK");
                req.session.daDangNhap = true;
                req.session.username = user.TenDangNhap;
                req.session.quyen = user.QuyenTruyCapId; // Lưu quyền truy cập vào session
                
                if (req.session.daDangNhap) {
                    if (req.session.quyen == 1)
                        res.render('index', { un: req.session.username })
                    else if (req.session.quyen == 2)
                        res.redirect('/benhnhan_bacsi')
                    else
                        res.redirect('/hosobenhnhan')
                }
                else{
                    res.redirect('/dangnhap')
                }
            }
            else {
                console.log("Not OK");
                res.redirect("/dangnhap");
            }
        }
    }
    catch (error) {
        res.status(500).json({ message: 'Có lỗi xảy ra trong quá trình xử lý!' });
    }
}

exports.Exit = (req, res) => {
    req.session.destroy();
    res.redirect("/dangnhap");
}