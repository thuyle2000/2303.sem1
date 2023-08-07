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