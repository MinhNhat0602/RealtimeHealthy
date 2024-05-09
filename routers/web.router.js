
const loginCtrl = require('../controllers/login.controller');
const multer = require('multer');
const path = require('path');
const patientCtrl = require('../controllers/patient.controller');
const userCtrl = require('../controllers/user.controller');

const storage = multer.diskStorage({
    destination: (req, file, callback) => {
        callback(null, '../public/assets/img/')
    },
    filename: function (req, file, callback) {
        callback(null, Date.now() + path.extname(file.originalname))
    }
})

const upload = multer({ storage: storage })

module.exports = function (app) {
    app.get('/themBenhNhan', (req, res) => {
        res.render('themBenhNhan', { un: req.session.username });
    });
    app.post('/themBenhNhan', upload.single('Avatar'), patientCtrl.addPatient);
    app.get('/xem', patientCtrl.viewPatient);
    app.get('/benhnhan', patientCtrl.getPatients);
    app.get('/xoabenhnhan', patientCtrl.deletePatient);
    app.get('/nguoidung', userCtrl.getUser);
    app.get('/dangnhap', loginCtrl.Login);
    app.post('/dangnhap', loginCtrl.handleLogin);
    app.get('/', loginCtrl.Login);
}