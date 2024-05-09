const db = require('./DataBaseModel');

class Khoa {
    constructor(Id, TenKhoa) {
        this.Id = Id;
        this.TenKhoa = TenKhoa;
    }

    static async danhSachKhoa() {
        const sql = 'SELECT * FROM tblkhoa';
        const [rows] = await db.query(sql);

        return rows;
    }
}

module.exports = Khoa;
