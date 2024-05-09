const db = require('../models/DataBaseModel');

class BenhNhan{
    constructor(Id, MaBenhNhan, TenBenhNhan, NamSinh, GioiTinh, CanNang, ChieuCao, Email, AnhDaiDien){
        this.Id = Id;
        this.MaBenhNhan = MaBenhNhan;
        this.TenBenhNhan = TenBenhNhan;
        this.NamSinh = NamSinh;
        this.GioiTinh = GioiTinh;
        this.CanNang = CanNang;
        this.ChieuCao = ChieuCao;
        this.Email = Email;
        this.AnhDaiDien = AnhDaiDien;
        this.Ma
    }

    static async danhSachBenhNhan(){
        let sql = "SELECT * FROM tblbenhnhan";
        const [rows] = await db.query(sql);

        return rows;
    }

    static async layDanhSachBenhNhanTheoMa(maBenhNhan){
        let sql = "SELECT * FROM tblbenhnhan WHERE MaBenhNhan = ? LIMIT 1";
        const [rows] = await db.query(sql, maBenhNhan);

        return rows;
    }

    static async layBenhNhanBacSi(maBacSi){
        let insertSql = "SELECT MaBenhNhan, TenBenhNhan, CanNang, benhnhan.NamSinh FROM tblbenhnhan, tblbacsi WHERE tblbenhnhan.MaBacSi= ? AND tblbenhnhan.MaBacSi=bacsi.MaBacSi";

        const [row] = await db.query(sql, maBacSi);
        return row;
    }

    static async themBenhNhan(){

    }

    static async suaBenhNhan(){

    }

    static async xoaBenhNhan(){

    }

}

module.exports = BenhNhan;
