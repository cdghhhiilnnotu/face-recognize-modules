CREATE TABLE SINHVIEN (
  MaSV VARCHAR(20) PRIMARY KEY,
  TenSV VARCHAR(50) NOT NULL,
  NgSinh DATE NOT NULL,
  LopQL VARCHAR(10) NOT NULL,
  DiaChi VARCHAR(255),
  LinkAnh VARCHAR(255),
  SDT VARCHAR(15)
);

CREATE TABLE GIAOVIEN (
  MaGV VARCHAR(20) PRIMARY KEY,
  TenGV VARCHAR(50) NOT NULL,
  NgSinh DATE NOT NULL,
  DiaChi VARCHAR(255),
  MatKhau VARCHAR(255) NOT NULL,
  SDT VARCHAR(15)
);

CREATE TABLE LOPHOC (
  MaLop VARCHAR(20) PRIMARY KEY,
  TenMon VARCHAR(50) NOT NULL,
  MaGV VARCHAR(20) NOT NULL,
  LichHoc VARCHAR(255),
  PhongHoc VARCHAR(20),
  SoluongSV INT,
  SoNgay INT
);

CREATE TABLE DSLOP (
  MaDS VARCHAR(20) PRIMARY KEY,
  MaLop VARCHAR(20) NOT NULL,
  MaSV VARCHAR(20) NOT NULL,
  SoDD VARCHAR(10)
);

CREATE TABLE ADMIN (
  MaAD VARCHAR(20) PRIMARY KEY,
  TenDN VARCHAR(50) NOT NULL,
  MatKhau VARCHAR(255) NOT NULL
);

CREATE TABLE BAOCAO (
  MaBC VARCHAR(20) PRIMARY KEY,
  NgayBC TIMESTAMPTZ NOT NULL,
  MaSV VARCHAR(20) NOT NULL,
  MaLop VARCHAR(20) NOT NULL,
  DiemDanh VARCHAR(10),
  GhiChu VARCHAR(255)
);

ALTER TABLE DSLOP
ADD CONSTRAINT FK_DSLOP_SINHVIEN
FOREIGN KEY (MaSV)
REFERENCES SINHVIEN (MaSV);

ALTER TABLE LOPHOC
ADD CONSTRAINT FK_LOPHOC_GIAOVIEN
FOREIGN KEY (MaGV)
REFERENCES GIAOVIEN (MaGV);

ALTER TABLE DSLOP
ADD CONSTRAINT FK_DSLOP_LOPHOC
FOREIGN KEY (MaLop)
REFERENCES LOPHOC (MaLop);

ALTER TABLE BAOCAO
ADD CONSTRAINT FK_BAOCAO_LOPHOC
FOREIGN KEY (MaLop)
REFERENCES LOPHOC (MaLop);

ALTER TABLE BAOCAO
ADD CONSTRAINT FK_BAOCAO_SINHVIEN
FOREIGN KEY (MaSV)
REFERENCES SINHVIEN (MaSV);

