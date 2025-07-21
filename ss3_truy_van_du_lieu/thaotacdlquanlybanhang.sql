drop table if exists orderdetail, product, `order`, customer;

create table customer (
    cid int primary key,
    name varchar(25),
    cage tinyint
);

create table `order` (
    oid int primary key,
    cid int,
    odate datetime,
    ototalprice int,
    foreign key (cid) references customer(cid)
);

create table product (
    pid int primary key,
    pname varchar(25),
    pprice int
);

create table orderdetail (
    oid int,
    pid int,
    odqty int,
    foreign key (oid) references `order`(oid),
    foreign key (pid) references product(pid)
);

insert into customer values
(1, 'minh quan', 10),
(2, 'ngoc oanh', 20),
(3, 'hong ha', 50);

insert into `order` values
(1, 1, '2006-03-21', null),
(2, 2, '2006-03-23', null),
(3, 1, '2006-03-16', null);

insert into product values
(1, 'may giat', 3),
(2, 'tu lanh', 5),
(3, 'dieu hoa', 7),
(4, 'quat', 2),
(5, 'bep dien', 1);

insert into orderdetail values
(1, 1, 3),
(1, 3, 7),
(1, 4, 2),
(2, 1, 1),
(2, 5, 8),
(3, 5, 4),
(3, 3, 3);

-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
	select oid, odate, ototalprice
	from `order`;
-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
	select distinct c.name as ten_khach_hang, p.pname as san_pham_da_mua
	from customer c
	inner join `order` o on c.cid = o.cid
	inner join orderdetail od on o.oid = od.oid
	inner join product p on od.pid = p.pid;
-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
	select customer.name from customer
	left join `order` on customer.cid = `order`.cid
	where `order`.cid is null;
-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. 
-- Giá bán của từng loại được tính = odQTY*pPrice)
	select 
		o.oid,
		o.odate,
		sum(od.odqty * p.pprice) as tong_tien
	from `order` o
	join orderdetail od on o.oid = od.oid
	join product p on od.pid = p.pid
	group by o.oid, o.odate;
