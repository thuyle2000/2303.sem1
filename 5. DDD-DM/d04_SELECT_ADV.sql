--open database
use db2303_M0
go

-- dem so bai thi trong tung mon hoc, cung voi diem cao nhat, thap nhat, binh quan
SELECT module, COUNT(*) [Số bài thi], 
	MAX(mark) [Điểm cao nhất], MIN(mark) [Điểm thấp nhất], AVG(mark) [Điểm bình quân]
	FROM tbExam 
	GROUP BY module


-- dem so bai thi trong tung mon hoc, cung voi diem cao nhat, thap nhat, binh quan (nhung ko tinh cac bai diem 0)
SELECT module, COUNT(*) [Số bài thi], 
	MAX(mark) [Điểm cao nhất], MIN(mark) [Điểm thấp nhất], AVG(mark) [Điểm bình quân]
	FROM tbExam 
	WHERE mark > 0
	GROUP BY module
GO


/* SELECT GROUP BY WITH ALL */
-- dem so bai thi trong cac mon hoc HCJS, LBEP
SELECT module, COUNT(*) [Số bài thi]
	FROM tbExam 
	WHERE module LIKE 'HCJS' OR module LIKE 'LBEP'
	GROUP BY module

SELECT module, COUNT(*) [Số bài thi]
	FROM tbExam 
	WHERE module IN ( 'HCJS', 'LBEP')
	GROUP BY module

-- dem so bai thi trong cac mon hoc HCJS, LBEP (dong thoi hien thi du cac mon thi)
SELECT module, COUNT(*) [Số bài thi]
	FROM tbExam 
	WHERE module IN ( 'HCJS', 'LBEP')
	GROUP BY ALL module 
GO

/* SELECT GROUP BY HAVING:  loai bo cac nhom co gia tri tinh toan ko phu hop */
-- dem so bai thi trong cac mon hoc (loai tru cac mon co so bai thi <15 )
SELECT module, COUNT(*) [Số bài thi]
	FROM tbExam 
	GROUP BY module 
	HAVING COUNT(*) >=15
GO

/* SELECT  GROUP BY WITH CUBE */
SELECT student, module, COUNT(*) [so lan thi], MAX(mark) [diem cao nhat], 
	   MIN(mark) [diem thap nhat]  
	FROM tbExam
	GROUP BY student, module

SELECT student, module, COUNT(*) [so lan thi], MAX(mark) [diem cao nhat], 
	   MIN(mark) [diem thap nhat]   
	FROM tbExam
	GROUP BY student, module WITH CUBE

SELECT student, module, COUNT(*) [so lan thi], MAX(mark) [diem cao nhat], 
	   MIN(mark) [diem thap nhat]   
	FROM tbExam
	GROUP BY module, student WITH CUBE
GO

/* SELECT  GROUP BY WITH ROLLUP */
SELECT student, module, COUNT(*) [so lan thi], MAX(mark) [diem cao nhat], 
	   MIN(mark) [diem thap nhat]   
	FROM tbExam
	GROUP BY module, student WITH ROLLUP
GO

SELECT student, module, COUNT(*) [so lan thi], MAX(mark) [diem cao nhat], 
	   MIN(mark) [diem thap nhat]   
	FROM tbExam
	GROUP BY student, module WITH ROLLUP
GO

/* SUBQUERY : truy van con */
-- lay thong tin cua 3 sinh vien co diem thi cao nhat
--1. lay 3 ket qua thi cao nhat
select TOP 3 WITH TIES * from tbExam order by mark desc

--2. lay thong cua cac sinh vien co ket qua lot vao top 3
SELECT * FROM tbStudent 
	WHERE Roll_No IN (SELECT TOP 3 WITH TIES student from tbExam order by mark desc)


/* SELECT WITH INNER JOIN : cho phep ket nhieu bang co cot chung, de tao ket qua co day du thong tin hon */
-- xem ket qua mon thi AJS
SELECT * FROM tbExam WHERE module LIKE 'AJS'

-- xem ket qua mon thi AJS, bao gom ho ten, thong tin lien lac cua sv
SELECT tbExam.*, tbStudent.Fullname, tbStudent.Contact 
	FROM tbExam JOIN tbStudent ON tbExam.student=tbStudent.Roll_No
	WHERE module LIKE 'AJS'


-- xem cac ket qua thi tren 90 diem, bao gom : ma so bai thi, ma va ho ten sv, ten mon thi, so diem
SELECT thi.exam_id,sv.Roll_No, sv.Fullname, mh.module_name, thi.mark
	FROM tbExam [thi] JOIN tbStudent [sv] ON thi.student=sv.Roll_No
				       JOIN tbModule [mh] ON thi.module=mh.module_id
	WHERE thi.mark >=90
GO

/* SELECT WITH OUTER JOIN : cho phep ket nhieu bang co cot chung, lay het du lieu cua bang [LEFT/RIGHT] cua phep ket */

-- xem ket qua thi, bao gom ho ten sv
SELECT sv.Fullname, thi.* 
	FROM tbStudent [sv] LEFT JOIN tbExam [thi] ON sv.Roll_No = thi.student 

-- tim ds sv chua bao gio thi
SELECT sv.*, thi.* 
	FROM tbStudent [sv] LEFT JOIN tbExam [thi] ON sv.Roll_No = thi.student 
	WHERE thi.exam_id is NULL

SELECT sv.* 
	FROM tbStudent [sv] LEFT JOIN tbExam [thi] ON sv.Roll_No = thi.student 
	WHERE thi.exam_id is NULL
GO

-- tim ds sv da du thi
SELECT sv.* 
	FROM tbStudent [sv] LEFT JOIN tbExam [thi] ON sv.Roll_No = thi.student 
	WHERE thi.exam_id is NOT NULL

SELECT DISTINCT sv.* 
	FROM tbStudent [sv] LEFT JOIN tbExam [thi] ON sv.Roll_No = thi.student 
	WHERE thi.exam_id is NOT NULL
GO

/* SELECT WITH SELF JOIN : cho phep ket cac cot chung trong cung 1 bang */
-- xem ds sv, bao gom ten cua leader

SELECT * FROM tbStudent -- ko co ten cua leader

SELECT sv.*, tn.Fullname --ds ko co truong nhom
	FROM tbStudent [sv] JOIN tbStudent [tn] ON sv.Leader_id = tn.Roll_No

SELECT sv.*, tn.Fullname --ds co truong nhom
	FROM tbStudent [sv] LEFT JOIN tbStudent [tn] ON sv.Leader_id = tn.Roll_No
