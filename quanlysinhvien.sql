create database if not exists quanlysinhvien;
use quanlysinhvien;

create table student(
id int key auto_increment,
name varchar(100)
);

create table teacher (
id int key auto_increment,
name varchar(100),
age int not null,
country varchar(100)
);
