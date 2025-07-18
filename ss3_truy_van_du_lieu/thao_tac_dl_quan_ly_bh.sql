-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
	select oid, odate, ototalprice
	from `order`;
-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
	select customer.name as ten_KH, product.pname as ten_sp
    from customer
    inner join `order` on customer.cid = `oeeder`.cid
    inner join orderdetail on `order`.oid = orderdetail.oid
    inner join product on orderdetail.pid = product.pid;
-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
	select customer.name from customer
	left join `order` on customer.cid = `order`.cid
	where `order`.cid is null;
-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. 
-- Giá bán của từng loại được tính = odQTY*pPrice)
	select o.oid, o.odate, sum(od.odqty * p.pprice) as tong_gia_hoa_don
	from `order` o
	inner join orderdetail od on o.oid = od.oid
	inner join pruduct p on od.pid = p.pid
	group by o.oid, o.odate;
