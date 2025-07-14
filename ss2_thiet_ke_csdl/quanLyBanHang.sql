create database if not exists quanLyBanHang;
use quanLyBanHang;

create table customer(
cid varchar(10) primary key,
cname nvarchar(100),
cage int
);

create table product(
pid varchar(10) primary key,
pname nvarchar(100),
pprice decimal(18,2)
);

create table orders (
oid varchar(10) primary key,
cid varchar(10),
odate date,
ototalprice decimal(18,2),
foreign key (cid) references customer(cid)
);

create table orderdetail (
oid varchar(10),
pid varchar(10),
odqty int,
primary key (oid, pid),
foreign key (oid) references orders(oid),
foreign key (pid) references product(pid)
);