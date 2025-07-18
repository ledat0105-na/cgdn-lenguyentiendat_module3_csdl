create database if not exists chuyenDoiERD;
use chuyenDoiERD;

create table phieuxuat (
    sopx varchar(10) primary key,
    ngayxuat date
);

create table phieunhap (
    sopn varchar(10) primary key,
    ngaynhap date
);

create table vattu (
    mavtu varchar(10) primary key,
    tenvtu nvarchar(100)
);

create table nhacc (
    mancc varchar(10) primary key,
    tenncc nvarchar(100),
    diachi nvarchar(200),
    sdt varchar(20)
);

create table dondh (
    sodh varchar(10) primary key,
    ngaydh date,
    mancc varchar(10),
    foreign key (mancc) references nhacc(mancc)
);

create table ct_phieuxuat (
    sopx varchar(10),
    mavtu varchar(10),
    dgxuat numeric(18,2),
    slxuat numeric(18,2),
    primary key (sopx, mavtu),
    foreign key (sopx) references phieuxuat(sopx),
    foreign key (mavtu) references vattu(mavtu)
);

create table ct_phieunhap (
    sopn varchar(10),
    mavtu varchar(10),
    dgnhap numeric(18,2),
    slnhap numeric(18,2),
    primary key (sopn, mavtu),
    foreign key (sopn) references phieunhap(sopn),
    foreign key (mavtu) references vattu(mavtu)
);

create table ct_dondh (
    sodh varchar(10),
    mavtu varchar(10),
    primary key (sodh, mavtu),
    foreign key (sodh) references dondh(sodh),
    foreign key (mavtu) references vattu(mavtu)
);