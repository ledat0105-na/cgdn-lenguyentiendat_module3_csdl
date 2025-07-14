create database if not exists c0225l1_jv103;
use c0225l1_jv103;
-- tạo bảng sinh viên
create table student(
 id int primary key auto_increment,
 `name` varchar(50),
 birthday date,
 score float check (score> 0)
);
-- chỉnh sửa thông của bảng
alter table student add primary key(id);
-- thêm dữ liệu vào
-- insert into student values(1,"chánh", '1990-02-03');
-- insert into student values(2,"chánh", '1990-02-03');
insert into student(birthday,id,name) values('1990-02-03',3,"chánh2");
insert into student(birthday,name) values('1990-02-03',"chánh2");
-- xem dữ liệu của bảng
select * from student;
-- chỉnh sửa dữ liêu
SET SQL_SAFE_UPDATES = 0;
SET SQL_SAFE_UPDATES = 1;
update student set name ='chánh3' where id = 3;
delete from student where id =4;
drop database c0523l1_jv103;