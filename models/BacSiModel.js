const db = require('../models/DataBaseModel');

class BacSi {
    constructor(Id, TenDangNhap, Email, MatKhau, QuyenTruyCapId, NgayTao, NgayChinhSua) {
        this.Id = Id;
        this.TenDangNhap = TenDangNhap;
        this.Email = Email;
        this.MatKhau = MatKhau;
        this.QuyenTruyCapId = QuyenTruyCapId;
        this.NgayTao = NgayTao;
        this.NgayChinhSua = NgayChinhSua;
    }

    static async danhSachBacSi() {
        let sql = "SELECT * FROM tblBacSi";
        const [rows] = await db.query(sql);

        return rows;
    }

    static async layBacSiTheoTenDangNhap(tenDangNhap){
        const sql = "SELECT * FROM tblBacSi WHERE TenDangNhap = ? LIMIT 1";
        const [row] = await db.query(sql, [tenDangNhap]);
        return row;
    }

    static async layQuyenTruyCapTheoId(id){
        const sql = "SELECT * FROM tblBacSi, tblquyentruycap WHERE tblBacSi.QuyenTruyCapId =?";
        const [row] = await db.query(sql, [id]);
        return row;
    }
}

module.exports = BacSi;
