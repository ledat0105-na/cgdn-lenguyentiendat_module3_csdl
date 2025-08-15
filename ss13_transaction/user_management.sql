create database if not exists user_management;
use user_management;

create table users (
    id int auto_increment primary key,
    name varchar(50) not null,
    email varchar(100) not null,
    country varchar(50) not null
);

insert into users (name, email, country) values
('Nguyen Van A', 'a@gmail.com', 'Vietnam'),
('Tran Thi B', 'b@gmail.com', 'Japan'),
('Le Van C', 'c@gmail.com', 'USA');

select * from users