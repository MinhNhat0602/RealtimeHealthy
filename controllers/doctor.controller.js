const db = require('../models/DataBaseModel');
const BacSi = require('../models/BacSiModel');

exports.getDoctor = async (req, res) => {
    try {
        const userName = req.body.username;

        const data = await BacSi.danhSachBacSi(userName);

        if (data.length <= 1) {
            console.log('Danh sách bác sĩ trống');
        } else {
            res.render('bacsi', { listbacsi: data, un: req.session.username })
        }
    } catch (error) {
        res.status(500).json({ message: 'Có lỗi xảy ra trong quá trình xử lý!' });
    }
}