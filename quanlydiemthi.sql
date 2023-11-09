create schema if not exists QUANLYDIEMTHI;

-- drop schema QUANLYDIEMTHI;
use QUANLYDIEMTHI;

create table if not exists STUDENT(
	studentId varchar(4) primary key,
    studentName varchar(100) not null,
    birthday date not null,
    gender bit(1) not null,
    address text not null,
    phoneNumber varchar(45) unique
);

create table if not exists SUBJECT(
	subjectId varchar(4) primary key,
    subjectName varchar(45) not null,
    priority int(11) not null
);

create table if not exists MARK(
	studentId varchar(4) not null,
    subjectId varchar(4) not null,
    point float not null,
    constraint pk_mark primary key (studentId, subjectId),
    constraint fk_stu foreign key (studentId) references STUDENT(studentId),
    constraint fk_sub foreign key (subjectId) references SUBJECT(subjectId)
);

-- Add student
insert into STUDENT(studentId, studentName, birthday, gender, address, phoneNumber) values
 ('S001', 'Nguyễn Thế Anh', '1999-01-11', 1, 'Hà Nội', '984678082'),
 ('S002', 'Đặng Bảo Trâm', '1998-12-22', 0, 'Lào Cai', '904982654'),
 ('S003', 'Trần Hà Phương', '2000-05-05', 0, 'Nghệ An', '947645363'),
 ('S004', 'Đỗ Tiến Mạnh', '1999-03-26', 1, 'Hà Nội', '983665353'),
 ('S005', 'Phạm Duy Nhất', '1998-10-04', 1, 'Tuyên Quang', '987242678'),
 ('S006', 'Mai Văn Thái', '2002-06-22', 1, 'Nam Định', '982654268'),
 ('S007', 'Giang Gia Hân', '1996-11-10', 0, 'Phú Thọ', '982364753'),
 ('S008', 'Nguyễn Ngọc Bảo My', '1999-01-22', 0, 'Hà Nam', '927867453'),
 ('S009', 'Nguyễn Tiến Đạt', '1998-08-07', 1, 'Tuyên Quang', '989274673'),
 ('S010', 'Nguyễn Thiều Quang', '2000-09-18', 1, 'Hà Nội', '984378291');
 
 -- Add subject
 insert into SUBJECT(subjectId, subjectName, priority) values
 ('MH01', 'Toán', 2),
 ('MH02', 'Vật Lý', 2),
 ('MH03', 'Hóa Học', 1),
 ('MH04', 'Ngữ Văn', 1),
 ('MH05', 'Tiếng Anh', 2);
 
 -- Add mark
 insert into MARK(studentId, subjectId, point) values
 ('S001', 'MH01', 8.5),
 ('S001', 'MH02', 7),
 ('S001', 'MH03', 9),
 ('S001', 'MH04', 9),
 ('S001', 'MH05', 5),
 ('S002', 'MH01', 9),
 ('S002', 'MH02', 8),
 ('S002', 'MH03', 6.5),
 ('S002', 'MH04', 8),
 ('S002', 'MH05', 6),
 ('S003', 'MH01', 7.5),
 ('S003', 'MH02', 6.5),
 ('S003', 'MH03', 8),
 ('S003', 'MH04', 7),
 ('S003', 'MH05', 7),
 ('S004', 'MH01', 6),
 ('S004', 'MH02', 7),
 ('S004', 'MH03', 5),
 ('S004', 'MH04', 6.5),
 ('S004', 'MH05', 8),
 ('S005', 'MH01', 5.5),
 ('S005', 'MH02', 8),
 ('S005', 'MH03', 7.5),
 ('S005', 'MH04', 8.5),
 ('S005', 'MH05', 9),
 ('S006', 'MH01', 8),
 ('S006', 'MH02', 10),
 ('S006', 'MH03', 9),
 ('S006', 'MH04', 7.5),
 ('S006', 'MH05', 6.5),
 ('S007', 'MH01', 9.5),
 ('S007', 'MH02', 9),
 ('S007', 'MH03', 6),
 ('S007', 'MH04', 9),
 ('S007', 'MH05', 4),
 ('S008', 'MH01', 10),
 ('S008', 'MH02', 8.5),
 ('S008', 'MH03', 8.5),
 ('S008', 'MH04', 6),
 ('S008', 'MH05', 9.5),
 ('S009', 'MH01', 7.5),
 ('S009', 'MH02', 7),
 ('S009', 'MH03', 9),
 ('S009', 'MH04', 5),
 ('S009', 'MH05', 10),
 ('S010', 'MH01', 6.5),
 ('S010', 'MH02', 8),
 ('S010', 'MH03', 5.5),
 ('S010', 'MH04', 4),
 ('S010', 'MH05', 7);

-- Cập nhật dữ liệu
update STUDENT set studentName = 'Đỗ Đức Mạnh' where studentId = 'S004';

update SUBJECT set subjectName = 'Ngoại Ngữ', priority = 1 where subjectId = 'MH05';

update MARK set point = 8.5 where studentId = 'S009' and subjectId = 'MH01';
update MARK set point = 7 where studentId = 'S009' and subjectId = 'MH02';
update MARK set point = 5.5 where studentId = 'S009' and subjectId = 'MH03';
update MARK set point = 6 where studentId = 'S009' and subjectId = 'MH04';
update MARK set point = 9 where studentId = 'S009' and subjectId = 'MH05';

-- Xóa dữ liệu
delete from MARK where studentId = 'S010';
delete from STUDENT where studentId = 'S010';

-- Lấy ra tất cả thông tin của sinh viên trong bảng Student
select * from STUDENT;

-- Hiển thị tên và mã môn học của những môn có hệ số bằng 1.
select subjectId as `Mã môn học`, subjectName as `Tên môn học` from SUBJECT where priority = 1;

-- Hiển thị thông tin học sinh bào gồm: mã học sinh, tên học sinh, tuổi (bằng năm hiện tại trừ
-- năm sinh) , giới tính (hiển thị nam hoặc nữ) và quê quán của tất cả học sinh.
select studentId as `Mã học sinh`, studentName as `Tên học sinh`, (year(curdate()) - year(birthday)) as `Tuổi`,
	case
		when gender = 1 then "Nam"
        else "Nữ"
        end as `Giới tính`,
address as `Quê quán`
from STUDENT;

-- Hiển thị thông tin bao gồm: tên học sinh, tên môn học , điểm thi của tất cả học sinh của môn
-- Toán và sắp xếp theo điểm giảm dần.
select S.studentName as `Tên học sinh`, SB.subjectName as `Tên môn học`, M.point as `Điểm Toán` from MARK M
join STUDENT S on S.studentId = M.studentId
join SUBJECT SB on SB.subjectId = M.subjectId
where SB.subjectId = 'MH01'
order by M.point desc;

-- Thống kê số lượng học sinh theo giới tính ở trong bảng (Gồm 2 cột: giới tính và số lượng).
select 
	case
		when gender = 1 then "Nam"
        else "Nữ"
        end as `Giới tính`,
count(studentId) as `Số lượng học sinh`
from STUDENT
group by `Giới tính`;

-- Tính tổng điểm và điểm trung bình của các môn học theo từng học sinh (yêu cầu sử dụng hàm
-- để tính toán) , bảng gồm mã học sinh, tên hoc sinh, tổng điểm và điểm trung bình.
select sum(M.point) as `Tổng điểm`,
 avg(M.point) as `Điểm trung bình`
from MARK as M
group by M.studentId;

-- Tạo VIEW có tên STUDENT_VIEW lấy thông tin sinh viên bao gồm : mã học sinh, tên học
-- sinh, giới tính , quê quán .
create view STUDENT_VIEW as
select studentId as `Mã học sinh`, studentName as `Tên học sinh`,
 case
		when gender = 1 then "Nam"
        else "Nữ"
        end as `Giới tính`,
address as `Quê quán`
from STUDENT;

select * from STUDENT_VIEW;

-- Tạo VIEW có tên AVERAGE_MARK_VIEW lấy thông tin gồm:mã học sinh, tên học sinh,
-- điểm trung bình các môn học .
create view AVERAGE_MARK_VIEW as
select S.studentId as `Mã học sinh`, S.studentName as `Tên học sinh`, avg(M.point) as `Điểm trung bình các môn` 
from STUDENT as S
join MARK as M on M.studentId = S.studentId
group by S.studentId, S.studentName;

select * from AVERAGE_MARK_VIEW;

-- Đánh Index cho trường `phoneNumber` của bảng STUDENT.
create index phoneIndex on STUDENT(phoneNumber);

-- Tạo các PROCEDURE sau:
-- Tạo PROC_INSERTSTUDENT dùng để thêm mới 1 học sinh bao gồm tất cả
-- thông tin học sinh đó.
delimiter //
create procedure PROC_INSERTSTUDENT(inputId varchar(4), inputName varchar(100), inputBirthday date, inputGender bit(1), inputAddress text, inputPhone varchar(45))
begin
	insert into STUDENT(studentId, studentName, birthday, gender, address, phoneNumber) values (inputId, inputName, inputBirthday, inputGender, inputAddress, inputPhone);
end //
delimiter ;

-- Tạo PROC_UPDATESUBJECT dùng để cập nhật tên môn học theo mã môn học.
delimiter //
create procedure PROC_UPDATESUBJECT(inputId varchar(4), inputName varchar(45))
begin
	update SUBJECT set subjectName = inputName where subjectId = inputId;
end //
delimiter ;

-- Tạo PROC_DELETEMARK dùng để xoá toàn bộ điểm các môn học theo mã học
-- sinh và trả về số bản ghi đã xóa.
delimiter //
create procedure PROC_DELETEMARK(inputId varchar(4), out count_delete int)
begin
	set count_delete = (select count(point) from MARK where studentId = inputId);
	delete from MARK where studentId = inputId;
end //
delimiter ;

call PROC_DELETEMARK('S009', @out_value);
SELECT @out_value as `Số lượng bản ghi điểm đã xóa`;
