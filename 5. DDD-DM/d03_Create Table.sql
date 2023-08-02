/* Demo cach lam viec voi tables */

--1. Tao CSDL db2303_M0
create database db2303_M0
go

--2. Open CSDL db2303_M0 de lam viec
use db2303_M0
go


/* Tao cac bang lam viec trong CSDL db2303_M0 */
--3. Tao bang khoa hoc (tbCourse)
create TABLE tbCourse
(
	Course_id varchar(5) not null ,
	Course_name varchar(30) not null ,
	start_year int not null DEFAULT YEAR(GETDATE()) 
	CONSTRAINT PK_Course PRIMARY KEY NONCLUSTERED (Course_id) --dn khoa chinh 
)
GO

-- Nhap du lieu cho bang khoa hoc
INSERT tbCourse (Course_id, Course_name, start_year) VALUES ('2000', 'ACCP 2000', 2000)
select * from tbCourse

INSERT tbCourse VALUES ('6715', 'ACCP 6715', 2011)
select * from tbCourse

INSERT tbCourse VALUES 
('7023', 'ACCP 7023', 2020), 
('7091', 'ACCP 7091', 2023)
select * from tbCourse
go


--4. Tao bang lop hoc (tbBatch)
create TABLE tbBatch
(
	Batch_id varchar(10) not null ,
	[start_date] date,
	fee smallint,
	course varchar(5) not null , 
	CONSTRAINT PK_Batch PRIMARY KEY NONCLUSTERED (Batch_id), --dn khoa chinh.
	CONSTRAINT FK_Batch FOREIGN KEY (course) REFERENCES tbCourse(Course_id), -- dn khoa ngoai
	CONSTRAINT CK_Fee CHECK (fee BETWEEN 0 AND 5000) -- dn kiem tra du lieu hop le
)
GO

-- nhap du lieu cho bang lop hoc
-- nhap sai khoa hoc : loi => ko thuc hien yeu cau !
INSERT tbBatch VALUES ('T1.2303.M0','2023-03-12', 4000,'abcd')

-- nhap sai hoc phi : loi => ko thuc hien yeu cau !
INSERT tbBatch VALUES ('T1.2303.M0','2023-03-12', 5001,'7023')

-- nhap sai dinh dang DATE : loi => ko thuc hien yeu cau !
INSERT tbBatch VALUES ('T1.2303.M0','23-04-2023', 4000,'7023')

-- nhap dung yc khoa ngoai, hoc phi, thoi gian bat dau
INSERT tbBatch VALUES ('T1.2303.M0','2023-04-23', 4000,'7023')
select * from tbBatch

-- nhap dung trung khoa chinh : loi => ko thuc hien yeu cau !
INSERT tbBatch VALUES ('T1.2303.M0','2023-04-01', 4100,'7091')

-- nhap them 1 so du lieu mau dung
INSERT tbBatch VALUES
('T1.2104.E1', '2021-04-29', 3500, '6715'),
('T1.2105.E0', '2021-05-17', 3500, '6715'),
('T1.2304.M1', '2023-04-12', 4100, '7091'),
('T1.2305.E0', '2023-05-21', 4100, '7091')
select * from tbBatch
go

--5. Tao bang sinh vien (tbStudent)
create table tbStudent (
	Roll_No varchar(10) not null,
	Fullname varchar(30) not null,
	Gender bit not null default 1,
	DoB date,
	Contact varchar(30),
	Batch varchar(10),
	Leader_id varchar(10),
	CONSTRAINT PK_Student PRIMARY KEY NONCLUSTERED (Roll_No), --dn khoa chinh.
	CONSTRAINT FK_StudentBatch FOREIGN KEY (Batch) REFERENCES tbBatch(Batch_id), -- dn khoa ngoai
	CONSTRAINT FK_StudentLeader FOREIGN KEY (Leader_id) REFERENCES tbStudent(Roll_No) -- dn khoa ngoai
)
go

select * from tbBatchCONSTRAINT FK_StudentBatch FOREIGN KEY (Batch) REFERENCES tbBatch(Batch_id), -- dn khoa ngoai
select * from tbStudent
go

-- nhap du lieu cho bang sinh vien
SET DATEFORMAT DMY
INSERT tbStudent VALUES
('sv01','Ha The Doanh',1, '18/03/2003','doanh@fpt.edu.vn','T1.2303.M0', null),
('sv02','Le Tan Thanh',1, '14/01/2002','thanh@fpt.edu.vn','T1.2303.M0', 'sv01'),
('sv03','Lee Min Hoo',1, '03/03/2003','minh@fpt.edu.vn','T1.2303.M0', 'sv01'),
('sv04','Nguyen Nhat Truong',1, '21/05/1993','truong@fpt.edu.vn','T1.2303.M0', null),
('sv05','Bui Tran Nguyen Hung',1, '05/11/2001','hung@fpt.edu.vn','T1.2303.M0', 'sv04'),
('sv06','Nguyen Quang Linh',1, '20/10/1998','linh@fpt.edu.vn','T1.2303.M0', 'sv04'),
('sv07','Vu Minh Tuan',1, '24/02/1997','tuan@fpt.edu.vn','T1.2303.M0', null),
('sv09','Bui My Nhung',0, '10/10/2006','nhung@fpt.edu.vn','T1.2303.M0', 'sv07'),
('sv10','Ta Hai Luong',1, '20/08/1998','lookso@fpt.edu.vn','T1.2303.M0', null),
('sv11','Nguyen Khanh Danh',1, '17/02/2001','danh@fpt.edu.vn','T1.2303.M0', 'sv10'),
('sv12','Nguyen Tat Thien',1, '28/06/1998','thien@fpt.edu.vn','T1.2303.M0', 'sv10'),
('sv13','Nguyen Van Phung',0, '14/01/2004','phung@fpt.edu.vn','T1.2303.M0', 'sv10'),
('sv14','Doan Dien Khanh',0, '14/01/2003','khanh@fpt.edu.vn','T1.2303.M0', 'sv10'),
('sv15','Nguyen Anh Khoa',1, '10/08/1993','khoa@fpt.edu.vn','T1.2303.M0', null),
('sv16','Nguyen Ho Anh Ngoc ',0, '13/08/1998','Ngoc@fpt.edu.vn','T1.2303.M0', 'sv15'),
('sv17','Trinh Duy Anh',1, '09/04/1988','anh@fpt.edu.vn','T1.2303.M0', 'sv15'),
('sv18','Nguyen Lam Nguyen Vu',1, '06/12/2001','vu@fpt.edu.vn','T1.2303.M0', null),
('sv19','Nguyen Minh Thien',1, '23/06/2005','thien-nguyen@fpt.edu.vn','T1.2303.M0', 'sv18'),
('sv20','Do Nhat Hoang',1, '14/01/1999','hoang@fpt.edu.vn','T1.2303.M0', 'sv18'),
('sv21','Nguyen Minh Trung',1, '26/05/2002','trung@fpt.edu.vn','T1.2104.E1', null),
('sv22','Luu Quoc Hoang',1, '26/05/2002','hoang@fpt.edu.vn','T1.2104.E1', 'sv21'),
('sv23','Dao Qui Phi',0, '26/04/2002','phi@fpt.edu.vn','T1.2104.E1', 'sv21')
go

SET DATEFORMAT DMY
INSERT tbStudent VALUES
('sv01','Ha The Doanh',1, '18/03/2003','doanh@fpt.edu.vn','T1.2303.M0', null),
select * from tbStudent
go


--6. Tao bang mon (tbModule)
create table tbModule (
	module_id varchar(5) not null,
	module_name varchar(40) not null unique,
	fee smallint,
	active bit not null default 1,
	CONSTRAINT PK_Module PRIMARY KEY NONCLUSTERED (module_id), --dn khoa chinh.
	CONSTRAINT CK_fee_module CHECK (fee BETWEEN 0 AND 300)
)
go

-- nhap du lieu cho bang mon hoc
INSERT tbModule VALUES
('LBEP','Logic building Elementary with C', 200, 1),
('HCJS','HTML5 - CSS3 - javascript', 210, 1),
('AJS','Angular 9 and AngularJS', 100, 1),
('DDD','Database Design Development', 0, 0),
('PR1','eProject semester 1', 1, 150),
('DMS','Database Management System', 250, 1)

select * from tbModule
go

-- sua lai du lieu cua mon 'PR1'
UPDATE tbModule SET fee=150, active=1 WHERE module_id LIKE 'PR1'
select * from tbModule
go


--7. Tao bang luu ket qua thi (tbExam)
create table tbExam (
    exam_id int identity(100,1) not null, -- identity : so thu tu tang tu dong, 100: bat dau tu 100
	module varchar(5) not null,
	student varchar(10) not null,
	mark tinyint,
	CONSTRAINT PK_Exam PRIMARY KEY NONCLUSTERED (exam_id), --dn khoa chinh.
	CONSTRAINT FK_ExamStudent FOREIGN KEY (student) REFERENCES tbStudent(roll_no), -- dn khoa ngoai
	CONSTRAINT FK_ExamModule FOREIGN KEY (module) REFERENCES tbModule(module_id), -- dn khoa ngoai
	CONSTRAINT CK_mark CHECK (mark BETWEEN 0 AND 100)
)
go

-- nhap diem thi cho sv co ma so 'sv01' : luu y, ko nhap du lieu vo cot exam-id
insert tbExam Values
('LBEP','sv01', 30),
('LBEP','sv01', 55),
('LBEP','sv01', 60),
('HCJS','sv01', 70),
('HCJS','sv01', 80),
('AJS','sv01', 80),
('AJS','sv01', 0),
('AJS','sv01', 75)

select * from tbExam
go

-- nhap diem thi cho sv co ma so 'sv02' : luu y, ko nhap du lieu vo cot exam-id
insert tbExam Values
('LBEP','sv02', 30),
('LBEP','sv02', 50),
('LBEP','sv02', 65),
('HCJS','sv02', 40),
('HCJS','sv02', 65),
('AJS','sv02', 60),
('AJS','sv02', 50)
select * from tbExam
go

-- nhap diem thi cho sv co ma so 'sv04' : luu y, ko nhap du lieu vo cot exam-id
insert tbExam Values
('LBEP','sv04', 75),
('LBEP','sv04', 30),
('LBEP','sv04', 65),
('LBEP','sv04', 25),
('HCJS','sv04', 75),
('HCJS','sv04', 80),
('AJS','sv04', 0),
('AJS','sv04', 85),
('AJS','sv04', 75)
select * from tbExam
go

-- nhap diem thi cho sv co ma so 'sv07' : luu y, ko nhap du lieu vo cot exam-id
insert tbExam Values
('LBEP','sv07', 90),
('LBEP','sv07', 80),
('HCJS','sv07', 90),
('HCJS','sv07', 70),
('AJS','sv07', 100),
('AJS','sv07', 70)
select * from tbExam
go


-- nhap diem thi cho sv co ma so 'sv09' : luu y, ko nhap du lieu vo cot exam-id
insert tbExam Values
('LBEP','sv09', 80),
('LBEP','sv09', 80),
('HCJS','sv09', 80),
('HCJS','sv09', 90),
('AJS','sv09', 50),
('AJS','sv09', 93)
select * from tbExam
go

-- nhap diem thi cho sv co ma so 'sv15' : luu y, ko nhap du lieu vo cot exam-id
insert tbExam Values
('LBEP','sv15', 70),
('LBEP','sv15', 60),
('AJS','sv15', 80),
('AJS','sv15', 60)
select * from tbExam
go

-- nhap diem thi cho sv co ma so 'sv06' : luu y, ko nhap du lieu vo cot exam-id
insert tbExam Values
('HCJS','sv06', 90),
('HCJS','sv06', 50),
('AJS','sv06', 0),
('AJS','sv06', 75),
('AJS','sv06', 70)
select * from tbExam
go