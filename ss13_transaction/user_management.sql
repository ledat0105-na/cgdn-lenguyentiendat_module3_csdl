-- 1. Tạo database và sử dụng
CREATE DATABASE IF NOT EXISTS user_management;
USE user_management;

-- 2. Tạo bảng users
DROP TABLE IF EXISTS users;
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    country VARCHAR(50) NOT NULL
);

-- 3. Dữ liệu mẫu
INSERT INTO users (name, email, country) VALUES
('Nguyen Van A', 'a@gmail.com', 'Vietnam'),
('Tran Thi B', 'b@gmail.com', 'Japan'),
('Le Van C', 'c@gmail.com', 'USA');

-- 4. Xóa procedure cũ nếu có
DROP PROCEDURE IF EXISTS insert_user;
DROP PROCEDURE IF EXISTS select_all_users;
DROP PROCEDURE IF EXISTS get_user_by_id;
DROP PROCEDURE IF EXISTS update_user;
DROP PROCEDURE IF EXISTS delete_user;

-- 5. Tạo stored procedure

-- Thêm người dùng
DELIMITER $$
CREATE PROCEDURE insert_user(
    IN p_name VARCHAR(50),
    IN p_email VARCHAR(100),
    IN p_country VARCHAR(50)
)
BEGIN
    INSERT INTO users (name, email, country)
    VALUES (p_name, p_email, p_country);
END$$
DELIMITER ;

-- Lấy tất cả người dùng
DELIMITER $$
CREATE PROCEDURE select_all_users()
BEGIN
    SELECT * FROM users;
END$$
DELIMITER ;

-- Lấy người dùng theo ID
DELIMITER $$
CREATE PROCEDURE get_user_by_id(IN p_id INT)
BEGIN
    SELECT * FROM users WHERE id = p_id;
END$$
DELIMITER ;

-- Cập nhật thông tin người dùng
DELIMITER $$
CREATE PROCEDURE update_user(
    IN p_id INT,
    IN p_name VARCHAR(50),
    IN p_email VARCHAR(100),
    IN p_country VARCHAR(50)
)
BEGIN
    UPDATE users
    SET name = p_name,
        email = p_email,
        country = p_country
    WHERE id = p_id;
END$$
DELIMITER ;

-- Xóa người dùng
DELIMITER $$
CREATE PROCEDURE delete_user(IN p_id INT)
BEGIN
    DELETE FROM users WHERE id = p_id;
END$$
DELIMITER ;

-- 6. Kiểm tra
CALL select_all_users();

select * from users