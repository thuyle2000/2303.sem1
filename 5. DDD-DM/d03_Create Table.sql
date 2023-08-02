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

select * from tbBatch
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
('sv08','Chu Quoc Huy',1, '10/06/2005','huy@fpt.edu.vn','T1.2303.M0', 'sv07'),
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

select * from tbStudent
go