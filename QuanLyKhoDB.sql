USE [master]
GO
IF EXISTS (SELECT 1 FROM sys.databases WHERE [name] = N'QuanLyKho')
BEGIN
    ALTER DATABASE QuanLyKho SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE QuanLyKho;
END;

CREATE DATABASE QuanLyKho
GO

USE QuanLyKho
GO

CREATE TABLE [Kho](
	[maKho] VARCHAR(20) PRIMARY KEY NOT NULL,
	[tenKho] NVARCHAR(255) NOT NULL,
	[diaChi] NVARCHAR(500) NOT NULL,
	[trangThai] INT NOT NULL DEFAULT 0,
	[ngayTao] DATETIME DEFAULT GETDATE(),
	[ngaySua] DATETIME DEFAULT GETDATE(),
)

INSERT INTO Kho (maKho,tenKho,diaChi) VALUES('KH1',N'Kho Hà Nội',N'Hà Nội')

/* Searching Kho
WITH x AS (SELECT ROW_NUMBER() OVER(ORDER BY maKho) AS [rows],
 * FROM Kho) SELECT * FROM x WHERE [rows] BETWEEN 1 AND 12 
 AND tenKho like '%j%' 
 ORDER BY updated_at DESC
 */

CREATE TABLE DanhMuc(
	maDanhMuc VARCHAR(20) PRIMARY KEY NOT NULL,
	tenDanhMuc NVARCHAR(255) NOT NULL,
	trangThai INT DEFAULT 1,
	[ngayTao] DATETIME DEFAULT GETDATE(),
	[ngaySua] DATETIME DEFAULT GETDATE(),
)

INSERT INTO DanhMuc (maDanhMuc,tenDanhMuc) VALUES('DS1','Thuốc Lao Phổi')

CREATE TABLE Ke(
	maKe VARCHAR(20) PRIMARY KEY NOT NULL,
	tenKe NVARCHAR(255) NOT NULL,
	danhMuc NVARCHAR(255) NULL,
	kichCo VARCHAR(20) NOT NULL,
	dong INT NOT NULL,
	[maKho] VARCHAR(20) FOREIGN KEY REFERENCES [Kho]([maKho]),
	trangThai INT DEFAULT 0,
	[ngayTao] DATETIME DEFAULT GETDATE(),
	[ngaySua] DATETIME DEFAULT GETDATE(),
)

INSERT INTO Ke (maKe,tenKe,danhMuc,kichCo,dong,[maKho]) VALUES('K1','Ke 01','San Pham A','100x100x100',0,'KH1')

CREATE TABLE SanPham(
	maSanPham VARCHAR(20) PRIMARY KEY NOT NULL,
	tenSanPham NVARCHAR(500) NOT NULL,
	soDangKi VARCHAR(100) NOT NULL,
	kichCo VARCHAR(20) NOT NULL,
	soLuongTon INT NOT NULL,
	giaNhap FLOAT NOT NULL,
	giaBan FLOAT NOT NULL,
	donVi VARCHAR(20) NOT NULL,
	ngaySanXuat VARCHAR(20) NOT NULL,
	noiSanXuat NVARCHAR(255) NOT NULL,
	hanSuDung VARCHAR(20) NOT NULL,
	maDanhMuc VARCHAR(20) FOREIGN KEY REFERENCES DanhMuc(maDanhMuc),
	maKe VARCHAR(20) FOREIGN KEY REFERENCES Ke(maKe),
	trangThai INT DEFAULT 1,
	[ngayTao] DATETIME DEFAULT GETDATE(),
	[ngaySua] DATETIME DEFAULT GETDATE(),
)

INSERT INTO SanPham (maSanPham,tenSanPham,soDangKi,kichCo,soLuongTon,giaNhap,giaBan,donVi,ngaySanXuat,noiSanXuat,hanSuDung,maDanhMuc,maKe)
VALUES('SP1','SanPhamA','abc','20x20x20',0,10000,20000,'Cái','29 May 2022','Ha Noi','29 June 2022','DS1','K1')

CREATE TABLE NhanVien(
	maNV VARCHAR(20) PRIMARY KEY NOT NULL,
	tenDangNhap VARCHAR(20) NOT NULL,
	matKhau VARCHAR(20) NOT NULL,
	tenNhanVien NVARCHAR(20) NULL,
	tuoi INT NULL,
	gioiTinh BIT DEFAULT 1,
	trangThai INT DEFAULT 1,
	chucVu INT DEFAULT 0,
	[ngayTao] DATETIME DEFAULT GETDATE(),
	[ngaySua] DATETIME DEFAULT GETDATE(),
)

-- SELECT * FROM NhanVien WHERE [username] = '' and [password] = ?

INSERT INTO NhanVien (maNV,tenDangNhap,matKhau,tenNhanVien,tuoi) VALUES('NV1','admin','admin','',31)

CREATE TABLE HoaDon(
	maHoaDon VARCHAR(20) PRIMARY KEY NOT NULL,
	tenHoaDon NVARCHAR(255) NOT NULL,
	nhiemVu BIT NOT NULL DEFAULT 0,
	maNV VARCHAR(20) FOREIGN KEY REFERENCES NhanVien(maNV),
	thanhTien FLOAT NOT NULL,
	trangThai INT DEFAULT 1,
	[ngayTao] DATETIME DEFAULT GETDATE(),
	[ngaySua] DATETIME DEFAULT GETDATE(),
)

CREATE TABLE ChiTietHoaDon(
	maHoaDon VARCHAR(20) FOREIGN KEY REFERENCES HoaDon(maHoaDon),
	donGia FLOAT NOT NULL,
	soLuong INT NOT NULL,
	maSanPham VARCHAR(20) FOREIGN KEY REFERENCES SanPham(maSanPham),
	trangThai INT DEFAULT 1,
	[ngayTao] DATETIME DEFAULT GETDATE(),
	[ngaySua] DATETIME DEFAULT GETDATE(),
)

CREATE TABLE KhachHang(
	maKhachHang VARCHAR(20) PRIMARY KEY NOT NULL,
	tenKhachHang NVARCHAR(255) NOT NULL,
	tuoi INT NULL,
	gioiTinh BIT DEFAULT 0,
	soDienThoai VARCHAR(11) NULL,
	diaChi NVARCHAR(MAX) NULL,
	trangThai INT DEFAULT 1,
	[ngayTao] DATETIME DEFAULT GETDATE(),
	[ngaySua] DATETIME DEFAULT GETDATE(),
)

CREATE TABLE NhaCungCap(
	maNhaCungCap VARCHAR(20) PRIMARY KEY NOT NULL,
	tenNhaCungCap  NVARCHAR(255) NOT NULL,
	diaChi NVARCHAR(MAX) NULL,
	soDienThoai VARCHAR(11) NULL,
	email VARCHAR(255) NULL,
	trangThai INT DEFAULT 1,
	[ngayTao] DATETIME DEFAULT GETDATE(),
	[ngaySua] DATETIME DEFAULT GETDATE(),
)

CREATE TABLE Phieu(
	maPhieu VARCHAR(20) PRIMARY KEY NOT NULL,
	maNV VARCHAR(20) FOREIGN KEY REFERENCES NhanVien(maNV),
	dong INT NOT NULL,
	loaiPhieu INT NOT NULL, --phieu nhap la 0, phieu xuat là 1
	maKho VARCHAR(20) FOREIGN KEY REFERENCES Kho(maKho),
	maKhachHang VARCHAR(20) FOREIGN KEY REFERENCES KhachHang(maKhachHang) NULL,
	maNhaCungCap VARCHAR(20) FOREIGN KEY REFERENCES NhaCungCap(maNhaCungCap) NULL,
	maHoaDon VARCHAR(20) FOREIGN KEY REFERENCES HoaDon(maHoaDon),
	trangThai INT DEFAULT 1,
	[ngayTao] DATETIME DEFAULT GETDATE(),
	[ngaySua] DATETIME DEFAULT GETDATE(),
)