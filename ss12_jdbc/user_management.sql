create database if not exists user_management;
use user_management;

create table users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    country VARCHAR(50) NOT NULL
);

INSERT INTO users (name, email, country) VALUES
('Nguyen Van A', 'a@gmail.com', 'Vietnam'),
('Tran Thi B', 'b@gmail.com', 'Japan'),
('Le Van C', 'c@gmail.com', 'USA');
