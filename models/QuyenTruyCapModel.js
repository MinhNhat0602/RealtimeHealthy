const db = require('./DataBaseModel');

class QuyenTruyCap {
    constructor(Id, TenQuyen, GiaTri) {
        this.Id = Id;
        this.TenQuyen = TenQuyen;
        this.GiaTri = GiaTri;
    }

    static async danhSachQuyenTruyCap() {
        const sql = 'SELECT * FROM QuyenTruyCap';
        const [rows] = await db.query(sql);

        return rows;
    }
}

module.exports = QuyenTruyCap;
