create database if not exists webshop;
use webshop;

create table vi_tri (
    ma_vi_tri int primary key,
    ten_vi_tri varchar(45)
);

create table nguoi_dung (
    ma_nguoi_dung int auto_increment primary key,
    ten_dang_nhap varchar(50) unique not null,
    mat_khau varchar(255) not null,
    email varchar(100) unique,
    ho_ten varchar(100),
    so_dien_thoai varchar(20),
    dia_chi varchar(255),
    vai_tro enum('admin', 'staff', 'customer') default 'customer',
    ngay_tao datetime default current_timestamp,
    ma_vi_tri int,
    foreign key (ma_vi_tri) references vi_tri(ma_vi_tri)
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

create table khuyen_mai (
    ma_khuyen_mai int auto_increment primary key,
    ten_khuyen_mai varchar(100),
    mo_ta text,
    giam_phan_tram int check (giam_phan_tram between 0 and 100),
    ngay_bat_dau date,
    ngay_ket_thuc date
);

create table don_hang (
    ma_don_hang int auto_increment primary key,
    ma_nguoi_dung int,
    ngay_dat datetime default current_timestamp,
    trang_thai enum('cho_xu_ly','dang_xu_ly','hoan_thanh','huy') default 'cho_xu_ly',
    tong_tien decimal(10,2),
    ma_khuyen_mai int,
    foreign key (ma_nguoi_dung) references nguoi_dung(ma_nguoi_dung),
    foreign key (ma_khuyen_mai) references khuyen_mai(ma_khuyen_mai)
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

create table thanh_toan (
    ma_thanh_toan int auto_increment primary key,
    ma_don_hang int,
    phuong_thuc enum('tien_mat', 'chuyen_khoan', 'vi_dien_tu') not null,
    ngay_thanh_toan datetime default current_timestamp,
    so_tien decimal(10,2),
    trang_thai enum('da_thanh_toan', 'chua_thanh_toan') default 'chua_thanh_toan',
    foreign key (ma_don_hang) references don_hang(ma_don_hang)
);
