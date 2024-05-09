const db = require('../models/DataBaseModel');
const patient = require('../models/BenhNhanModel');

exports.addPatient = async (req, res) => {
    try {
        const image = req.file.filename;
        req.body.AnhDaiDien = image;
        await patient.themBenhNhan(req.body, (err, result) => {
            if (err) throw err;
            res.redirect('/benhnhan');
        });
    } catch (err) {
        res.status(500).send('Lỗi máy chủ vui lòng thực hiện lại');
    }
};

exports.viewPatient = async (req, res) => {
    let tinhtrang = 'Bình Thường';
    const maBenhNhan = req.query['mabenhnhan'];
    try {
        await patient.layDanhSachBenhNhanTheoMa(maBenhNhan, async (err, data) => {
            if (err) throw err;
            if (data.length <= 0) {
                console.log('Không có dữ liệu');
                res.status(500).send('Không tìm thấy dữ liệu');
            } else {
                const patientInfo = data[0];

                var yyyy = patientInfo.NamSinh.getFullYear();
                var dd = patientInfo.NamSinh.getDate();
                var mm = patientInfo.NamSinh.getMonth() + 1;
                if (dd < 10) dd = '0' + dd;
                if (mm < 10) mm = '0' + mm;
                const currentYear = new Date().getFullYear();
                tuoi = currentYear - yyyy;
                const formattedToday = dd + '/' + mm + '/' + yyyy;

                console.log('Thông tin bệnh nhân: ', patientInfo);

                var data = [tuoi, patientInfo.CanNang];

                // var pyprocess = spawn('python', ['./process.py', ...data]);
                // pyprocess.stdout.on('data', (data) => {
                //     if (data < 1.0 && data > 0.5) {
                //         status = 'Bình Thường';
                //     } else {
                //         status = 'Bất thường';
                //     }
                // });

                // await new Promise((resolve) => {
                //     pyprocess.on('close', resolve);
                // });

                res.render('xem', { sinh: formattedToday, benhnhan: patientInfo, un: req.session.username, tinhtrang: tinhtrang });
            }
        });
    } catch (err) {
        console.log('Lỗi truy vấn dữ liệu');
    }
};

exports.getPatients = async (req, res) => {
    try {
        await patient.getPatients(async (err, data) => {
            if (err) throw err;

            for (let [index, patient] of data.entries()) {
                var maBenhNhan = patient.MaBenhNhan;

                let age = 0;

                var yyyy = patient.NamSinh.getFullYear();
                var dd = patient.NamSinh.getDate();
                var mm = patient.NamSinh.getMonth() + 1;
                if (dd < 10) dd = '0' + dd;
                if (mm < 10) mm = '0' + mm;
                const currentYear = new Date().getFullYear();
                age = currentYear - yyyy;

                listTinhTrang[index] = 'Bình Thường';
            }
            res.render('benhnhan', { listBenhNhan: data, un: req.session.username, listTinhtrang: listTinhTrang });
        });
    } catch (err) {
        console.log('Lỗi try vấn dữ liệu');
    }
};

exports.deletePatient = (req, res) => {
    // Đưa đoạn mã từ router.get('/xoabenhnhan', ...) vào đây
};
