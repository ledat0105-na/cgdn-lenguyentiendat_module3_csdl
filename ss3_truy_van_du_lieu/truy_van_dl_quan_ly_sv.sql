-- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
	select * from student s
	where s.name like '%h';
-- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.
	select * from class
	where month(start_time) = 12;
-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
	select * from subject sj
	where sj.credit between 3 and 5;
-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
	update student s
	set class_id = 2
	where s.name = 'Hung';
-- Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.
	select student.name as student_name, subject.name as subject_name, mark.mark 
	from mark
		inner join student on mark.student_id = student.id
		inner join subject on mark.subject_id = subject.id
	order by
		mark.mark desc,
		student.name asc;