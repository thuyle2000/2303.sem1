-- open database
use db2303_M0
go

/*
1. Tao stored [up_examC]: 
   - hien thi ket qua cua mon lap trinh C
   - dem so bai thi dat yeu cau
   - dem so bai thi ko dat yeu cau
   - hien thi ti le thi dau
*/
CREATE PROC [up_examC] AS
BEGIN
	-- 1. hien thi ket qua cua mon lap trinh C
	select * from tbExam where module LIKE 'LBEP'

	-- 2. dem tong so bai thi 
	DECLARE @baithi int 
	select @baithi= COUNT(*) from tbExam where (module LIKE 'LBEP')

	-- 3. dem so bai thi dat yeu cau
	DECLARE @baithiDat int 
	select @baithiDat= COUNT(*) from tbExam where (module LIKE 'LBEP' and mark >=40)

	--4. In ket qua thong ke
	select @baithiDat [So bai thi dat], 
		  (@baithi- @baithiDat) [so bai thi hong],
		  (@baithiDat * 100.0 / @baithi) [Ti le thi dau (%)]

END
GO

/* TEST CASE */
exec [up_examC]
go

/*
2. Tao stored [up_ChangeMark]: 
   - hien thi ket qua cua mon Thiet ket Web, theo thu tu tang dan
   - tang diem kq thi cho cac bai co so diem duoi 50 : cong them 10%
   - hien thi lai ket qua, theo thu tu tang dan
*/
CREATE PROC  [up_ChangeMark] AS
BEGIN
	--1. hien thi ket qua cua mon Thiet ket Web, theo thu tu tang dan
	select * from tbExam where module LIKE 'HCJS' order by mark

	--2. tang diem kq thi cho cac bai co so diem duoi 50 : cong them 10%
	update tbExam set mark = mark * 1.1 where mark <=50

	--3. hien thi lai ket qua, theo thu tu tang dan
	select * from tbExam where module LIKE 'HCJS' order by mark
END
GO

/* TEST CASE */
exec up_ChangeMark
go


/*
3. Tao stored [up_ChangeMark2]: 
   - hien thi ket qua cua mon BAT KY, theo thu tu tang dan
   - thay doi diem kq thi cho cac bai thi: so diem BAT KY
   - hien thi lai ket qua, theo thu tu tang dan
   => store co 2 tham so (input) : ma mon thi, so diem thay doi
*/
CREATE PROC [up_ChangeMark2] 
	@maMonThi varchar(5) = null, @diem int = 5  -- khai bao 2 tham so input
AS
BEGIN
	IF (@maMonThi is NULL) 
		SET @maMonThi = '%'
	 
	-- 1. hien thi ket qua cua mon BAT KY, theo thu tu tang dan
	select * from tbExam WHERE module LIKE @maMonThi ORDER BY module, mark

	-- 2. thay doi diem kq thi cho cac bai thi: voi so diem BAT KY duoc cung cap boi tham so input
	update tbExam set mark += @diem WHERE module LIKE @maMonThi AND (mark + @diem <=100)

	-- 3. Hien thi lai ket qua, theo thu tu tang dan
	select * from tbExam WHERE module LIKE @maMonThi ORDER BY module, mark
END
GO
/* TEST CASE */
--1. tang 5 diem cho tat ca cac mon
exec up_ChangeMark2

--2. tang 3 diem cho mon AJS
exec up_ChangeMark2 'AJS',3

--3. giam 5 diem cho mon HCJS
exec up_ChangeMark2  'HCJS', -5

