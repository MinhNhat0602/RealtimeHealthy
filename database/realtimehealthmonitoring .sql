-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 09, 2024 at 05:11 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `realtimehealthmonitoring`
--

-- --------------------------------------------------------

--
-- Table structure for table `tblbacsi`
--

CREATE TABLE `tblbacsi` (
  `Id` int(11) NOT NULL,
  `MaBacSi` varchar(255) DEFAULT NULL,
  `TenBacSi` varchar(255) DEFAULT NULL,
  `NamSinh` date DEFAULT NULL,
  `GioiTinh` varchar(20) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `AnhDaiDien` text DEFAULT NULL,
  `KhoaId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tblbacsi`
--

INSERT INTO `tblbacsi` (`Id`, `MaBacSi`, `TenBacSi`, `NamSinh`, `GioiTinh`, `Email`, `AnhDaiDien`, `KhoaId`) VALUES
(1, 'BS001', 'Huỳnh Minh Phúc', '1992-05-05', 'Nam', 'huynhminhphucbs@gmail.com', 'bacsi2.png', 1),
(2, 'BS002', 'Huỳnh Minh Tân', '1994-05-11', 'Nam', 'huynhminhtanbs@gmail.com', 'bs.jpg', 2),
(3, 'BS003', 'Nguyễn Thị Hằng', '1989-03-23', 'Nữ', 'nguyenthihangbs@gmail.com', 'bacsi3.png', 3);

-- --------------------------------------------------------

--
-- Table structure for table `tblbenhan`
--

CREATE TABLE `tblbenhan` (
  `Id` int(11) NOT NULL,
  `BenhNhanId` int(11) DEFAULT NULL,
  `TenBenhVien` varchar(255) DEFAULT NULL,
  `NgayNhapVien` date DEFAULT NULL,
  `GioNhapVien` time DEFAULT NULL,
  `DuongDanFile` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblbenhnhan`
--

CREATE TABLE `tblbenhnhan` (
  `Id` int(11) NOT NULL,
  `MaBenhNhan` varchar(255) DEFAULT NULL,
  `TenBenhNhan` varchar(255) DEFAULT NULL,
  `NamSinh` date DEFAULT NULL,
  `GioiTinh` varchar(20) DEFAULT NULL,
  `CanNang` double DEFAULT NULL,
  `ChieuCao` double DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `AnhDaiDien` text DEFAULT NULL,
  `MaBacSi` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tblbenhnhan`
--

INSERT INTO `tblbenhnhan` (`Id`, `MaBenhNhan`, `TenBenhNhan`, `NamSinh`, `GioiTinh`, `CanNang`, `ChieuCao`, `Email`, `AnhDaiDien`, `MaBacSi`) VALUES
(1, 'BN001', 'Huỳnh Minh Nhật', '2002-02-06', 'Nam', 55, 173, 'huynhminhnhataguit@gmail.com', 'benhnhan1.png', 'BS001'),
(2, 'BN002', 'Phan Quang Thái', '2002-05-25', 'Nam', 80, 165, 'phanquangthai@gmail.com', 'benhnhan2.png', 'BS002'),
(3, 'BN003', 'Nguyễn Khánh Duy Tâm', '1991-08-16', 'Nam', 65, 165, 'nguyenkhanhduytam@gmail.com', 'benhnhan3.png', 'BS001'),
(4, 'BN004', 'Lâm Huỳnh Phú', '1989-02-26', 'Nam', 70, 170, 'lamhuynhphu@gmail.com', 'benhnhan4.png', 'BS001');

-- --------------------------------------------------------

--
-- Table structure for table `tblcauhoi`
--

CREATE TABLE `tblcauhoi` (
  `Id` int(11) NOT NULL,
  `NguoiDungId` int(11) DEFAULT NULL,
  `Email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SoDienThoai` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `NoiDung` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `NgayTao` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblcautraloi`
--

CREATE TABLE `tblcautraloi` (
  `Id` int(11) NOT NULL,
  `CauHoiId` int(11) DEFAULT NULL,
  `NguoiDungId` int(11) DEFAULT NULL,
  `NoiDung` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `NgayTao` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblchitiet_lichthuoc`
--

CREATE TABLE `tblchitiet_lichthuoc` (
  `Id` int(11) NOT NULL,
  `ThuocId` int(11) DEFAULT NULL,
  `LieuLuong` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblhoithoai`
--

CREATE TABLE `tblhoithoai` (
  `Id` int(11) NOT NULL,
  `BenhNhanId` int(11) NOT NULL,
  `BacSiId` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblhuyetap`
--

CREATE TABLE `tblhuyetap` (
  `Id` int(11) NOT NULL,
  `BenhNhanId` int(11) DEFAULT NULL,
  `HATTruong` int(11) DEFAULT NULL,
  `HATThu` int(11) DEFAULT NULL,
  `ThoiGianBatDau` datetime DEFAULT NULL,
  `ThoiGianKetThuc` datetime DEFAULT NULL,
  `DanhGia` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblkhoa`
--

CREATE TABLE `tblkhoa` (
  `Id` int(11) NOT NULL,
  `TenKhoa` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tblkhoa`
--

INSERT INTO `tblkhoa` (`Id`, `TenKhoa`) VALUES
(1, 'Khoa Nội'),
(2, 'Khoa Ngoại'),
(3, 'Khoa Phụ Sản'),
(4, 'Khoa Nhi'),
(5, 'Khoa Cấp Cứu'),
(6, 'Khoa Răng Hàm Mặt');

-- --------------------------------------------------------

--
-- Table structure for table `tblnguoidung`
--

CREATE TABLE `tblnguoidung` (
  `Id` int(11) NOT NULL,
  `TenDangNhap` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `MatKhau` varchar(255) DEFAULT NULL,
  `QuyenTruyCapId` int(11) DEFAULT NULL,
  `NgayTao` datetime DEFAULT NULL,
  `NgayChinhSua` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tblnguoidung`
--

INSERT INTO `tblnguoidung` (`Id`, `TenDangNhap`, `Email`, `MatKhau`, `QuyenTruyCapId`, `NgayTao`, `NgayChinhSua`) VALUES
(1, 'admin', 'admin@gmail.com', '$2b$10$kxveS/MI7sYSQA38eSqf1OBBIxGy0nw6FFouT4OYTMq2dJAYIIaYO', 1, '2024-05-08 13:22:07', '2024-05-21 13:22:07'),
(2, 'BS001', 'huynhminhphucbs@gmail.com', '$2a$12$s922sH4YbZt2h0DInndWNeoUc53IwtqJj7NPz4r0.8tOA6FRHsbC6', 2, '2024-05-08 16:07:10', '2024-05-22 16:07:10'),
(3, 'BS002', 'huynhminhtanbs@gmail.com', '$2a$12$8Uq0m60rrfe1wNfc6p.I7Ou7RWTHjwyo3qccTWJzwA.Y7e0LM2sGm', 2, '2024-05-15 16:07:10', '2024-05-22 16:07:10'),
(4, 'BS003', 'nguyenthihangbs@gmail.com', '$2a$12$fTuIzdjjBcIG4kKuvGgtnOUqZQ6qt.AXB5/ZhisjQ5Wf9Ibcp4eKy', 2, '2024-05-15 16:07:10', '2024-05-31 16:07:10'),
(5, 'BN001', 'huynhminhnhataguit@gmail.com', '$2a$12$j99u.QXAA28683M8O2UXI.io9PVlfV8Gkj7FvC1g878ocBx2H5SM6', 3, '2024-05-07 16:10:56', '2024-05-13 16:10:56'),
(6, 'BN002', 'phanquangthai@gmail.com', '$2a$12$qLc1QKkAJKnggB5JJHtpwObCzcZMkFMei./pko/wItSz6wxL7P0oa', 3, '2024-05-07 16:10:56', '2024-05-21 16:10:56'),
(7, 'BN003', 'nguyenkhanhduytam@gmail.com', '$2a$12$.jr3LER2YCuo2cFefo5yK.lJuV6.do5k61k2kkt8NUkeV9N3tMslG', 3, '2024-05-07 16:10:56', '2024-05-21 16:10:56'),
(8, 'BN004', 'lamhuynhphu@gmail.com', '$2a$12$BQDJepYhwvG/SX18I5fL7.8aYzVvqstgxmBqWlHJiGFbcFCYlpedG', 3, '2024-05-07 16:10:56', '2024-05-20 16:10:56');

-- --------------------------------------------------------

--
-- Table structure for table `tblnguoithan_benhnhan`
--

CREATE TABLE `tblnguoithan_benhnhan` (
  `Id` int(11) NOT NULL,
  `BenhNhanId` int(11) DEFAULT NULL,
  `HoTen` varchar(255) DEFAULT NULL,
  `SoDienThoai` varchar(20) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tblnguoithan_benhnhan`
--

INSERT INTO `tblnguoithan_benhnhan` (`Id`, `BenhNhanId`, `HoTen`, `SoDienThoai`, `Email`) VALUES
(1, 1, 'Huỳnh Văn Lắm', '0357356417', 'huynhvanlambtbn@gmail.com'),
(2, 2, 'Nguyễn Văn A', '0335536130', 'nguyenvanantbn@gmail.com'),
(3, 3, 'Nguyễn Thị Bé Ba', '03456789123', 'nguyenthibebantbn@gmail.com'),
(4, 4, 'Trần Văn Lươn', '0312345654', 'tranvanluonntbn@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `tblnhacnho_uongthuoc`
--

CREATE TABLE `tblnhacnho_uongthuoc` (
  `Id` int(11) NOT NULL,
  `ChiTietThuocId` int(11) DEFAULT NULL,
  `NgayNhac` date DEFAULT NULL,
  `GioNhac` time DEFAULT NULL,
  `NoiDung` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblnhiptim`
--

CREATE TABLE `tblnhiptim` (
  `Id` int(11) NOT NULL,
  `BenhNhanId` int(11) DEFAULT NULL,
  `GiaTri` int(11) DEFAULT NULL,
  `ThoiGianBatDau` datetime DEFAULT NULL,
  `ThoiGianKetThuc` datetime DEFAULT NULL,
  `DanhGia` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblphancong_dieutri`
--

CREATE TABLE `tblphancong_dieutri` (
  `Id` int(11) NOT NULL,
  `BacSiId` int(11) DEFAULT NULL,
  `BenhNhanId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblquyentruycap`
--

CREATE TABLE `tblquyentruycap` (
  `Id` int(11) NOT NULL,
  `TenQuyen` varchar(255) DEFAULT NULL,
  `GiaTri` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tblquyentruycap`
--

INSERT INTO `tblquyentruycap` (`Id`, `TenQuyen`, `GiaTri`) VALUES
(1, 'Quản trị viên', 'admin'),
(2, 'Bác Sĩ', 'bacsi'),
(3, 'Bệnh Nhân', 'benhnhan');

-- --------------------------------------------------------

--
-- Table structure for table `tblspo2`
--

CREATE TABLE `tblspo2` (
  `Id` int(11) NOT NULL,
  `BenhNhanId` int(11) DEFAULT NULL,
  `GiaTri` int(11) DEFAULT NULL,
  `ThoiGianBatDau` datetime DEFAULT NULL,
  `ThoiGianKetThuc` datetime DEFAULT NULL,
  `DanhGia` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblthuoc`
--

CREATE TABLE `tblthuoc` (
  `Id` int(11) NOT NULL,
  `TenThuoc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DonViTinh` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `HinhAnh` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbltinnhan`
--

CREATE TABLE `tbltinnhan` (
  `Id` int(11) NOT NULL,
  `HoiThoaiId` int(11) NOT NULL,
  `NguoiDungId` int(11) NOT NULL,
  `NoiDung` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblvitri_nguoidung`
--

CREATE TABLE `tblvitri_nguoidung` (
  `Id` int(11) NOT NULL,
  `BenhNhanId` int(11) DEFAULT NULL,
  `Lng` double DEFAULT NULL,
  `Lt` double DEFAULT NULL,
  `ThoiGian` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tblbacsi`
--
ALTER TABLE `tblbacsi`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `MaBacSi` (`MaBacSi`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD KEY `KhoaId` (`KhoaId`);

--
-- Indexes for table `tblbenhan`
--
ALTER TABLE `tblbenhan`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `BenhNhanId` (`BenhNhanId`);

--
-- Indexes for table `tblbenhnhan`
--
ALTER TABLE `tblbenhnhan`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `MaBenhNhan` (`MaBenhNhan`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD KEY `MaBacSi` (`MaBacSi`);

--
-- Indexes for table `tblcauhoi`
--
ALTER TABLE `tblcauhoi`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `NguoiDungId` (`NguoiDungId`);

--
-- Indexes for table `tblcautraloi`
--
ALTER TABLE `tblcautraloi`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `CauHoiId` (`CauHoiId`),
  ADD KEY `NguoiDungId` (`NguoiDungId`);

--
-- Indexes for table `tblchitiet_lichthuoc`
--
ALTER TABLE `tblchitiet_lichthuoc`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `ThuocId` (`ThuocId`);

--
-- Indexes for table `tblhoithoai`
--
ALTER TABLE `tblhoithoai`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `BenhNhanId` (`BenhNhanId`),
  ADD KEY `tblhoithoai_ibfk_1` (`BacSiId`);

--
-- Indexes for table `tblhuyetap`
--
ALTER TABLE `tblhuyetap`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `BenhNhanId` (`BenhNhanId`);

--
-- Indexes for table `tblkhoa`
--
ALTER TABLE `tblkhoa`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `tblnguoidung`
--
ALTER TABLE `tblnguoidung`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `TenDangNhap` (`TenDangNhap`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD KEY `QuyenTruyCapId` (`QuyenTruyCapId`);

--
-- Indexes for table `tblnguoithan_benhnhan`
--
ALTER TABLE `tblnguoithan_benhnhan`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `SoDienThoai` (`SoDienThoai`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD KEY `BenhNhanId` (`BenhNhanId`);

--
-- Indexes for table `tblnhacnho_uongthuoc`
--
ALTER TABLE `tblnhacnho_uongthuoc`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `ChiTietThuocId` (`ChiTietThuocId`);

--
-- Indexes for table `tblnhiptim`
--
ALTER TABLE `tblnhiptim`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `BenhNhanId` (`BenhNhanId`);

--
-- Indexes for table `tblphancong_dieutri`
--
ALTER TABLE `tblphancong_dieutri`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `BenhNhanId` (`BenhNhanId`),
  ADD KEY `BacSiId` (`BacSiId`);

--
-- Indexes for table `tblquyentruycap`
--
ALTER TABLE `tblquyentruycap`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `tblspo2`
--
ALTER TABLE `tblspo2`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `BenhNhanId` (`BenhNhanId`);

--
-- Indexes for table `tblthuoc`
--
ALTER TABLE `tblthuoc`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `tbltinnhan`
--
ALTER TABLE `tbltinnhan`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `HoiThoaiId` (`HoiThoaiId`),
  ADD KEY `NguoiDungId` (`NguoiDungId`);

--
-- Indexes for table `tblvitri_nguoidung`
--
ALTER TABLE `tblvitri_nguoidung`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `BenhNhanId` (`BenhNhanId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tblbacsi`
--
ALTER TABLE `tblbacsi`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tblbenhan`
--
ALTER TABLE `tblbenhan`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblbenhnhan`
--
ALTER TABLE `tblbenhnhan`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tblcauhoi`
--
ALTER TABLE `tblcauhoi`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblcautraloi`
--
ALTER TABLE `tblcautraloi`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblchitiet_lichthuoc`
--
ALTER TABLE `tblchitiet_lichthuoc`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblhoithoai`
--
ALTER TABLE `tblhoithoai`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblhuyetap`
--
ALTER TABLE `tblhuyetap`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblkhoa`
--
ALTER TABLE `tblkhoa`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tblnguoidung`
--
ALTER TABLE `tblnguoidung`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tblnguoithan_benhnhan`
--
ALTER TABLE `tblnguoithan_benhnhan`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tblnhacnho_uongthuoc`
--
ALTER TABLE `tblnhacnho_uongthuoc`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblnhiptim`
--
ALTER TABLE `tblnhiptim`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblphancong_dieutri`
--
ALTER TABLE `tblphancong_dieutri`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblquyentruycap`
--
ALTER TABLE `tblquyentruycap`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tblspo2`
--
ALTER TABLE `tblspo2`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblthuoc`
--
ALTER TABLE `tblthuoc`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbltinnhan`
--
ALTER TABLE `tbltinnhan`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblvitri_nguoidung`
--
ALTER TABLE `tblvitri_nguoidung`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tblbacsi`
--
ALTER TABLE `tblbacsi`
  ADD CONSTRAINT `tblbacsi_ibfk_1` FOREIGN KEY (`KhoaId`) REFERENCES `tblkhoa` (`Id`);

--
-- Constraints for table `tblbenhan`
--
ALTER TABLE `tblbenhan`
  ADD CONSTRAINT `tblbenhan_ibfk_1` FOREIGN KEY (`BenhNhanId`) REFERENCES `tblbenhnhan` (`Id`);

--
-- Constraints for table `tblbenhnhan`
--
ALTER TABLE `tblbenhnhan`
  ADD CONSTRAINT `tblbenhnhan_ibfk_1` FOREIGN KEY (`MaBacSi`) REFERENCES `tblbacsi` (`MaBacSi`);

--
-- Constraints for table `tblcauhoi`
--
ALTER TABLE `tblcauhoi`
  ADD CONSTRAINT `tblcauhoi_ibfk_1` FOREIGN KEY (`NguoiDungId`) REFERENCES `tblnguoidung` (`Id`);

--
-- Constraints for table `tblcautraloi`
--
ALTER TABLE `tblcautraloi`
  ADD CONSTRAINT `tblcautraloi_ibfk_1` FOREIGN KEY (`CauHoiId`) REFERENCES `tblcauhoi` (`Id`),
  ADD CONSTRAINT `tblcautraloi_ibfk_2` FOREIGN KEY (`NguoiDungId`) REFERENCES `tblnguoidung` (`Id`);

--
-- Constraints for table `tblchitiet_lichthuoc`
--
ALTER TABLE `tblchitiet_lichthuoc`
  ADD CONSTRAINT `tblchitiet_lichthuoc_ibfk_1` FOREIGN KEY (`ThuocId`) REFERENCES `tblthuoc` (`Id`);

--
-- Constraints for table `tblhoithoai`
--
ALTER TABLE `tblhoithoai`
  ADD CONSTRAINT `tblhoithoai_ibfk_1` FOREIGN KEY (`BacSiId`) REFERENCES `tblbacsi` (`Id`),
  ADD CONSTRAINT `tblhoithoai_ibfk_2` FOREIGN KEY (`BenhNhanId`) REFERENCES `tblbenhnhan` (`Id`);

--
-- Constraints for table `tblhuyetap`
--
ALTER TABLE `tblhuyetap`
  ADD CONSTRAINT `tblhuyetap_ibfk_1` FOREIGN KEY (`BenhNhanId`) REFERENCES `tblbenhnhan` (`Id`);

--
-- Constraints for table `tblnguoidung`
--
ALTER TABLE `tblnguoidung`
  ADD CONSTRAINT `tblnguoidung_ibfk_1` FOREIGN KEY (`QuyenTruyCapId`) REFERENCES `tblquyentruycap` (`Id`);

--
-- Constraints for table `tblnguoithan_benhnhan`
--
ALTER TABLE `tblnguoithan_benhnhan`
  ADD CONSTRAINT `tblnguoithan_benhnhan_ibfk_1` FOREIGN KEY (`BenhNhanId`) REFERENCES `tblbenhnhan` (`Id`);

--
-- Constraints for table `tblnhacnho_uongthuoc`
--
ALTER TABLE `tblnhacnho_uongthuoc`
  ADD CONSTRAINT `tblnhacnho_uongthuoc_ibfk_1` FOREIGN KEY (`ChiTietThuocId`) REFERENCES `tblchitiet_lichthuoc` (`Id`);

--
-- Constraints for table `tblnhiptim`
--
ALTER TABLE `tblnhiptim`
  ADD CONSTRAINT `tblnhiptim_ibfk_1` FOREIGN KEY (`BenhNhanId`) REFERENCES `tblbenhnhan` (`Id`);

--
-- Constraints for table `tblphancong_dieutri`
--
ALTER TABLE `tblphancong_dieutri`
  ADD CONSTRAINT `tblphancong_dieutri_ibfk_1` FOREIGN KEY (`BenhNhanId`) REFERENCES `tblbenhnhan` (`Id`),
  ADD CONSTRAINT `tblphancong_dieutri_ibfk_2` FOREIGN KEY (`BacSiId`) REFERENCES `tblbacsi` (`Id`);

--
-- Constraints for table `tblspo2`
--
ALTER TABLE `tblspo2`
  ADD CONSTRAINT `tblspo2_ibfk_1` FOREIGN KEY (`BenhNhanId`) REFERENCES `tblbenhnhan` (`Id`);

--
-- Constraints for table `tbltinnhan`
--
ALTER TABLE `tbltinnhan`
  ADD CONSTRAINT `tbltinnhan_ibfk_1` FOREIGN KEY (`HoiThoaiId`) REFERENCES `tblhoithoai` (`Id`),
  ADD CONSTRAINT `tbltinnhan_ibfk_2` FOREIGN KEY (`NguoiDungId`) REFERENCES `tblnguoidung` (`Id`);

--
-- Constraints for table `tblvitri_nguoidung`
--
ALTER TABLE `tblvitri_nguoidung`
  ADD CONSTRAINT `tblvitri_nguoidung_ibfk_1` FOREIGN KEY (`BenhNhanId`) REFERENCES `tblbenhnhan` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
