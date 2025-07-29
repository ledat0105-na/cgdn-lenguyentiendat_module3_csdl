create database if not exists webshop;
use webshop;

create table quan_tri_vien (
    ma_quan_tri_vien int auto_increment primary key,
    ten_dang_nhap varchar(50) unique not null,
    mat_khau varchar(255) not null,
    email varchar(100) unique,
    ho_ten varchar(100),
    ngay_tao datetime default current_timestamp
);

create table nguoi_dung (
    ma_nguoi_dung int auto_increment primary key,
    ten_dang_nhap varchar(50) unique not null,
    mat_khau varchar(255) not null,
    email varchar(100) unique,
    ho_ten varchar(100),
    so_dien_thoai varchar(20),
    dia_chi varchar(255),
    ngay_tao datetime default current_timestamp
);

create table danh_muc (
    ma_danh_muc int auto_increment primary key,
    ten_danh_muc varchar(100) not null
);

create table san_pham (
    ma_san_pham int auto_increment primary key,
    ten_san_pham varchar(150) not null,
    gia decimal(10,2) not null,
    so_luong int default 0,
    mo_ta text,
    hinh_anh varchar(255),
    ma_danh_muc int,
    ngay_tao datetime default current_timestamp,
    foreign key (ma_danh_muc) references danh_muc(ma_danh_muc)
);

create table don_hang (
    ma_don_hang int auto_increment primary key,
    ma_nguoi_dung int,
    ngay_dat datetime default current_timestamp,
    trang_thai enum('cho_xu_ly','dang_xu_ly','hoan_thanh','huy') default 'cho_xu_ly',
    tong_tien decimal(10,2),
    foreign key (ma_nguoi_dung) references nguoi_dung(ma_nguoi_dung)
);

create table chi_tiet_don_hang (
    ma_don_hang int,
    ma_san_pham int,
    so_luong int not null,
    gia decimal(10,2) not null,
    primary key (ma_don_hang, ma_san_pham),
    foreign key (ma_don_hang) references don_hang(ma_don_hang),
    foreign key (ma_san_pham) references san_pham(ma_san_pham)
);