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
GO

/* --- Them 1 nam sinh vo view vwSchoolboy  ---*/
insert vwSchoolBoy Values('sv50','nguyen van a',1,'2000/09/18', 'a@gmail.com', 'T1.2104.E1', 'sv21')
GO 

-- xem ds nam sinh
select * from tbStudent where gender=1
select * from vwSchoolBoy

/*--- doi ten cua sinh vien 'nguyen van a' -> 'nguyen anh' ---*/
update vwSchoolBoy set Fullname= 'nguyen anh' where Roll_No like 'sv50'

/*--- xoa sinh vien 'nguyen van a'  ---*/
delete from vwSchoolBoy where Roll_No like 'sv50'

-- xem ds nam sinh
select * from tbStudent where gender=1
select * from vwSchoolBoy
go

/* xem lai phan dinh nghia view vwEXAM */
sp_helptext vwExam
go