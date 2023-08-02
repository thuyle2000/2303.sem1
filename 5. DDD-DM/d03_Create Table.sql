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

