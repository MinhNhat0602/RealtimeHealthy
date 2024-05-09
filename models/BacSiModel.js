const db = require('../models/DataBaseModel');
const Khoa = require('../models/KhoaModel');

class BacSi {
    constructor(Id, MaBacSi, TenBacSi, NamSinh, GioiTinh, Email, KhoaId) {
        this.Id = Id;
        this.MaBacSi = MaBacSi;
        this.TenBacSi = TenBacSi;
        this.NamSinh = NamSinh;
        this.GioiTinh = GioiTinh;
        this.Email = Email;
        this.KhoaId = KhoaId;
    }

    static async danhSachBacSi() {
        let sql = "SELECT * FROM tblbacsi";
        const [rows] = await db.query(sql);

        return rows;
    }

    static async layBacSiTheoMa(maBacSi){
        const sql = "SELECT * FROM tblbacsi WHERE MaBacSi = ?";
        const [row] = await db.query(sql, [maBacSi]);
        return row;
    }

    static async layTenKhoaTheoId(id){
        const sql = "SELECT * FROM tblbacsi, tblkhoa WHERE tblbacsi.KhoaId =?";
        const [row] = await db.query(sql, [id]);
        return row;
    }
}

module.exports = BacSi;
