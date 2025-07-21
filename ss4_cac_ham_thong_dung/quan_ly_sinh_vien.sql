-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
	select * from subject
	where credit = (select max(credit) from subject);
-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
	select s.* from subject s
	inner join mark m on s.subid = m.subid
	where m.mark = (select max(mark) from mark);
-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
	select st.stuid, st.stuname, avg(m.mark) as diem_trung_binh
	from student st
	join mark m on st.stuid = m.stuid
	group by st.stuid, st.stuname
	order by diem_trung_binh desc;
