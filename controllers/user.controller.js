const db = require('../models/DataBaseModel');
const NguoiDung = require('../models/NguoiDungModel');

exports.getUser = async (req, res) => {
    try {
        const userName = req.body.username;

        const data = await NguoiDung.danhSachNguoiDung(userName);

        if (data.length <= 1) {
            console.log('Danh sách người dùng trống');
        } else {
            res.render('nguoidung', { listnguoidung: data, un: req.session.username })
        }
    } catch (error) {
        res.status(500).json({ message: 'Có lỗi xảy ra trong quá trình xử lý!' });
    }
}