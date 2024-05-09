const db = require('../models/DataBaseModel');
const qtc = require('../models/QuyenTruyCapModel');

class NguoiDung {
    constructor(Id, TenDangNhap, Email, MatKhau, QuyenTruyCapId, NgayTao, NgayChinhSua) {
        this.Id = Id;
        this.TenDangNhap = TenDangNhap;
        this.Email = Email;
        this.MatKhau = MatKhau;
        this.QuyenTruyCapId = QuyenTruyCapId;
        this.NgayTao = NgayTao;
        this.NgayChinhSua = NgayChinhSua;
    }

    static async danhSachNguoiDung() {
        let sql = "SELECT * FROM tblnguoidung";
        const [rows] = await db.query(sql);

        return rows;
    }

    static async layNguoiDungTheoTenDangNhap(tenDangNhap){
        const sql = "SELECT * FROM tblnguoidung WHERE TenDangNhap = ? LIMIT 1";
        const [row] = await db.query(sql, [tenDangNhap]);
        return row;
    }

    static async layQuyenTruyCapTheoId(id){
        const sql = "SELECT * FROM tblnguoidung, tblquyentruycap WHERE tblnguoidung.QuyenTruyCapId =?";
        const [row] = await db.query(sql, [id]);
        return row;
    }
}

module.exports = NguoiDung;
