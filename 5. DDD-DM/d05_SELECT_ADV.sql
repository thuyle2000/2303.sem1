--open database
use db2303_M0
go

-- xem ds sv chua du thi mon lap trinh C (SUB QUERY)
--1. tim ds sv da thi mon C
select DISTINCT student, module from tbExam where module like 'LBEP'
select DISTINCT student from tbExam where module like 'LBEP'

--2. tim ds sv chua thi mon C
select * from tbStudent  -- ds tat ca sv
select * from tbStudent 
	where Roll_No NOT IN (select DISTINCT student from tbExam where module like 'LBEP')
GO

-- xem ds sv chua du thi mon lap trinh C (CTE)
WITH CTE_SVThiC AS
(select DISTINCT student from tbExam where module like 'LBEP')
SELECT * from tbStudent
	where Roll_No NOT IN (select * from CTE_SVThiC)
GO


WITH CTE_SVThiC AS
(select DISTINCT student from tbExam where module like 'LBEP')
SELECT * from tbStudent
	where NOT exists (select * from CTE_SVThiC where roll_no like student)
GO


-- xem ds sv thi ca 2 mon lap trinh C va thiet ke web
--1. ds sv thi mon C
select DISTINCT student from tbExam where module like 'LBEP'
--2. ds sv thi mon thiet ket Web
select DISTINCT student from tbExam where module like 'HCJS'

--3. ds sv thi du 2 mon
select DISTINCT student from tbExam where module like 'LBEP'
INTERSECT
select DISTINCT student from tbExam where module like 'HCJS'
GO

-- xem ds sv thi mon lap trinh C nhung ko thi thiet ke web
select DISTINCT student from tbExam where module like 'LBEP'
EXCEPT
select DISTINCT student from tbExam where module like 'HCJS'
GO

-- xem ds sv thi mon lap trinh C va thiet ke web
select DISTINCT student from tbExam where module like 'LBEP'
UNION
select DISTINCT student from tbExam where module like 'HCJS'
GO

-- xem ds sv thi mon lap trinh C va thiet ke web (ma sv, ho ten, ngay sinh)
select Roll_No, Fullname, DoB from tbStudent sv JOIN 
			( select DISTINCT student from tbExam where module like 'LBEP'
			  UNION
			  select DISTINCT student from tbExam where module like 'HCJS'
			) dsthi ON sv.Roll_No = dsthi.student
GO
