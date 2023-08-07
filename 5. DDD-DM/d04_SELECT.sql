/****************************/
/*   DEMO SELECT STATEMENTs */
/****************************/

-- open database 
use db2303_M0
go

/* SELECT Without FROM*/
DECLARE @stName nvarchar(30)=N'Hà Thế Doanh'

SELECT @stName AS [Họ Tên Sinh Viên]
SELECT LEFT(@stName, 2) [Họ]
SELECT RIGHT(@stName, 5) [Tên]
SELECT SUBSTRING(@stName, 4, 3) [Tên đệm]
--
SELECT LEFT(@stName, 2) [Họ], SUBSTRING(@stName, 4, 3) [Tên đệm], RIGHT(@stName, 5) [Tên]
GO


/* SELECT * : hien thi tat ca cac cot trong bang truy van */
SELECT * FROM tbStudent
GO

/* SELECT With Selected column: hien thi cac cot co chon loc trong bang truy van */
SELECT Roll_No, Fullname, Contact, Batch FROM tbStudent
GO

/* SELECT With computed column: hien thi cac cot tinh toan trong bang truy van */
SELECT Roll_No, Fullname,DoB, DATEDIFF(YY, DoB, GETDATE()) FROM tbStudent
GO

/* SELECT With computed column, renamed column: hien thi cac cot tinh toan trong bang truy van va doi ten tieu de cot */
SELECT Roll_No [Mã số], Fullname [Họ & Tên],DoB [Ngày sinh], 
		DATEDIFF(YY, DoB, GETDATE()) [Tuổi] FROM tbStudent
GO

/* SELECT With DISTINCT : hien thi cac dong ko trung lap trong bang truy van */
-- muon biet ds cac sinh vien da du thi
SELECT student FROM tbExam				-- ket qua co nhieu dong lap lai ms so vien
SELECT DISTINCT student FROM tbExam		-- ket qua ko co chua dong lap lai ms so vien
GO

/* SELECT TOP (ORDER BY): hien thi cac dong dau tien trong bang truy van */
-- lay thong tin sinh vien lon tuoi nhat
SELECT TOP 1 * , DATEDIFF(YY, DoB, GETDATE()) [Age] 
	FROM tbStudent 
	ORDER BY DoB

-- lay thong tin sinh vien nho tuoi nhat
SELECT TOP 1 * , DATEDIFF(YY, DoB, GETDATE()) [Age] 
	FROM tbStudent 
	ORDER BY DoB DESC


-- xem ket qua thi, theo thu tu giam dan cua diem ket qua
SELECT * from tbExam ORDER BY mark DESC

-- lay 3 ket qua thi co diem cao nhat
SELECT TOP 3 * from tbExam ORDER BY mark DESC

-- lay 3 ket qua thi co diem cao nhat (bao gom kq dong hang)
SELECT TOP 3 WITH TIES * from tbExam ORDER BY mark DESC
GO

/* SELECT INTO: Luu ket qua truy van vo bang khac: han che su dung !!!*/
-- Luu ket qua thi cua mon lap trinh C vo bang ExamLBEP
SELECT * FROM tbExam WHERE module LIKE 'LBEP'
SELECT * INTO ExamLBEP 
		 FROM tbExam  WHERE module LIKE 'LBEP'

SELECT * FROM ExamLBEP
GO

/* SELECT GROUP BY: Nhom du lieu, va tinh toan trong tung nhom !*/
-- dem so bai thi trong tung mon hoc
SELECT module, COUNT(*) [Số bài thi] 
	FROM tbExam GROUP BY module


-- dem so bai thi trong tung mon hoc, cung voi diem cao nhat, thap nhat, binh quan
SELECT module, COUNT(*) [Số bài thi], 
	MAX(mark) [Điểm cao nhất], MIN(mark) [Điểm thấp nhất], AVG(mark) [Điểm bình quân]
	FROM tbExam GROUP BY module
GO
