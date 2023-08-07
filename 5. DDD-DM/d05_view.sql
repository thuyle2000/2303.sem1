-- open database
use db2303_M0
go

/*---------------------------------------------------*/
/* 1.  tao view chua ds nam sinh tu bang [tbStudent] */
/*---------------------------------------------------*/
CREATE VIEW vwSchoolBoy AS
	Select * from tbStudent WHERE Gender=1
GO

-- xem ds nam sinh tu bang [tbStudent]
select * from tbStudent where gender =1

-- hoac xem ds nam sinh tu view [vwSchoolboy]
select * from vwSchoolBoy
go


/*-----------------------------------------------------------
 * 2. tao view chua ket qua thi dau, bao gom cac cot:
 *	  ms bai thi, ms va ho ten sv, ms va ten mon thi, diem kq
 *    tu bang [tbExam], [tbStudent], [tbModule]
 *-----------------------------------------------------------*/
CREATE VIEW vwExam AS
	select thi.exam_id, sv.Roll_No, sv.Fullname, mon.module_id, mon.module_name, thi.mark 
	from tbExam [thi] JOIN tbStudent [sv] ON thi.student=sv.Roll_No
					  JOIN tbModule [mon] ON thi.module=mon.module_id
	where thi.mark>=40
GO

-- test view: xem ds sv thi dau
select * from vwExam