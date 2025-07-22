create database demo;
use demo;

create table products (
    id int auto_increment primary key,
    productCode varchar(50) not null,
    productName varchar(100),
    productPrice decimal(10,2),
    productAmount int,
    productDescription text,
    productStatus varchar(50)
);

insert into products (productCode, productName, productPrice, productAmount, productDescription, productStatus)
values
('P001', 'Coca Cola', 10.5, 100, 'Nước giải khát có ga', 'Còn hàng'),
('P002', 'Pepsi', 10.0, 50, 'Nước giải khát có ga', 'Còn hàng'),
('P003', 'Sting', 8.5, 70, 'Nước tăng lực', 'Hết hàng');

-- TẠO INDEX 
	-- tạo unique index trên productcode
			create unique index idx_product_code on products(productCode);
	-- tạo composite index trên productname và productprice
			create index idx_name_price on products(productName, productPrice);
	-- dùng EXPLAIN để kiểm tra truy vấn sử dụng index
			explain select * from products where productCode = 'P001';
			explain select * from products where productName = 'Pepsi' and productPrice = 10.0;
		
-- TẠO SỬA, XÓA VIEW    
	-- Tạo view
			create view view_product_basic as
			select productCode, productName, productPrice, productStatus
			from products;
	-- sửa view
			drop view if exists view_product_basic;
			create view view_product_basic as
			select productCode, productName, productPrice, productAmount, productStatus
			from products;
	-- xóa view
			drop view if exists view_product_basic;
        
-- TẠO STORED PROCEDURE
	-- lấy tất cả sp
		delimiter $$
        create procedure sp_get_all_products()
        begin
			select * from products;
        end
        delimiter ;
	-- thêm một sp
		delimiter $$
        create procedure sp_add_product(
			in p_code varchar(50),
			in p_name varchar(100),
			in p_price decimal(10,2),
			in p_amount int,
			in p_description text,
			in p_status varchar(50)
		)
            begin
				insert into products(productCode, productName, productPrice, productAmount, productDescription, productStatus)
                values (p_code, p_name, p_price, p_amount, p_description, p_status);
            end $$
            delimiter ;
	-- sửa theo id
		delimiter $$
		create procedure sp_update_product_by_id(
			in p_id int,
			in p_name varchar(100),
			in p_price decimal(10,2),
			in p_amount int,
			in p_description text,
			in p_status varchar(50)
		)
        begin 
			update products
            set productName = p_name,
				productPrice = p_price,
				productAmount = p_amount,
				productDescription = p_description,
				productStatus = p_status
			where id = p_id;
		end $$
        delimiter ;
	-- xóa theo id
		delimiter $$
        create procedure sp_delete_product_by_id(
			in p_id int
        )
        begin
			delete from products where id = p_id;
        end $$
        delimiter ;

-- CÁCH GỌI PROCEDURE
	call sp_get_all_products();
	call sp_add_product('P004', 'Revive', 9.5, 80, 'Nước điện giải', 'Còn hàng');
	call sp_update_product_by_id(1, 'Coca Cola Light', 11.0, 90, 'Phiên bản mới', 'Còn hàng');
	call sp_delete_product_by_id(2);

select * from products