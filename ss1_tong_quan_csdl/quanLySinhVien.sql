create database if not exists quanlysinhvien;
use quanlysinhvien;

create table class (
    id int primary key auto_increment,
    name varchar(100)
);

create table teacher (
    id int primary key auto_increment,
    name varchar(100),
    age int not null,
    country varchar(100)
);

insert into class(name) values ('kế toán'), ('quản trị kinh doanh');

insert into teacher(name, age, country)
values ('tiến đạt', 20, 'đà nẵng'),
       ('lê nguyễn', 21, 'nghệ an');

select * from teacher;
select * from class;