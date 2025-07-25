create database if not exists c0225l1;
use c0225l1;
create table jame (
username varchar(50) primary key,
password varchar (50)
);
create table class (
id int primary key auto_increment,
name varchar(50)
);
create table room (
id int primary key auto_increment,
name varchar(50),
class_id int,
foreign key(class_id) references class(id)
);
create table student (
id int primary key auto_increment,
name varchar(50),
birthday date,
gender boolean,
email varchar(50),
point float,
class_id int,
username varchar(50) unique,
foreign key(class_id) references class(id),
foreign key(username) references jame(username)
);
create table instructor (
id int primary key auto_increment,
name varchar(50),
birthday date,
salary float
);
create table instructor_class(
 instructor_id int,
 class_id int,
 start_time date,
 end_time date,
 primary key (instructor_id,class_id),
 foreign key(instructor_id) references instructor(id),
 foreign key(class_id) references class(id)
);
-- insert dữ liệu cho từng bảng
insert into class (name) values ('c1121g1'), ('c1221g1'),('a0821i1'),('a0921i1');
insert into room(name,class_id) values ('Ken',1), ('Jame',1),('Ada',2),('Andy',2);
insert into jame(`username`,`password`)
 values('cunn','12345'),('chunglh','12345'),('hoanhh','12345'),('dungd','12345'),('huynhtd','12345'),
 ('hainm','12345'),('namtv','12345'),('hieuvm','12345'),('kynx','12345'),('vulm','12345');
insert into jame(`username`,`password`)
 values('chau','12345');
insert into instructor(`name`,birthday, salary)
 values('tran van chanh','1985-02-03',100),('tran minh chien','1985-02-03',200),('vu thanh tien','1985-02-03',300);
insert into instructor(`name`,birthday, salary)
 values('tran van nam','1989-12-12',100);
 insert into student(`name`,birthday, gender,`point`, class_id,`username`)
 values ('nguyen ngoc cu','1981-12-12',1,8,1,'cunn'),('le hai chung','1981-12-12',1,5,1,'chunglh'),
 ('hoang huu hoan','1990-12-12',1,6,2,'hoanhh'),('dau dung','1987-12-12',1,8,1,'dungd'),
 ('ta dinh huynh','1981-12-12',1,7,2,'huynhtd'),('nguyen minh hai','1987-12-12',1,9,1,'hainm'),
 ('tran van nam','1989-12-12',1,4,2,'namtv'),('vo minh hieu','1981-12-12',1,3,1,'hieuvm'),
 ('le xuan ky','1981-12-12',1,7,2,'kynx'),('le minh vu','1981-12-12',1,7,1,'vulm');
  insert into student(`name`,birthday, gender,`point`, class_id)
 values ('nguyen van a','1981-12-12',1,8,null),('tran van b','1981-12-12',1,5,null);
--   insert into student(`name`,birthday, gender,`point`, class_id,`username`)
--  values ('nguyen minh hai chau','1981-12-12',1,8,null,'chau');
 insert into instructor_class(class_id,instructor_id) values (1,1),(1,2),(2,1),(2,2),(3,1),(3,2);
select * from room;
select* from class;
select* from student;
select* from jame;
select* from instructor;
select * from instructor_class;

-- + Câu 1. Lấy ra thông tin các học viên, và cho biết các học viên đang theo học lớp nào.
select * from student
    inner join class on student.class_id = class.id;
-- + Câu 2. Lấy ra thông tin các học viên, và cho biết các học viên đang theo học lớp nào và cả các bạn đã đăng ký nhưng chưa có lớp học.
select * from student
    left join class on student.class_id = class.id;
-- + Câu 3. Lấy thông tin của các học viên tên “Hai” và 'Huynh’.
select * from student
where
	student.name like '%hai' or student.name like '%huynh';
-- + Câu 4. Lấy ra học viên có điểm lớn hơn 5 .
select * from student
where 
	(point > 5);
-- + Câu 5. Lấy ra học viên có họ là “nguyen”
select * 
from student
where
	student.name like 'nguyen%';
-- + Câu 6. Thông kế số lượng học sinh theo từng loại điểm.
select student.point, count(*) as total_students from student
group by
    student.point;
-- + Câu 7 . Thông kế số lượng học sinh theo điểm và điểm phải lớn hơn 5
select student.name, student.point
from student
where
    student.point > 5;
-- + Câu 8. Thông kế số lượng học sinh theo điểm lớn hơn 5 và chỉ hiện thị với số lượng>=2
select student.point, count(*) as total_students
from student
where
    student.point > 5
group by
    student.point
having
    count(*) >= 2;
-- + Câu 9. Lấy ra danh sách học viên của lớp c1121g1 và sắp xếp tên học viên theo alphabet. 
select student.id, student.name, student.birthday, student.point
from student
    inner join class on student.class_id = class.id
where
    class.name = 'c1121g1'
order by
    student.name asc;
