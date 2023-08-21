use db2303_M0
go


-- xem ds sinh vien
select * from tbStudent

-- tao clustered index tren cot ho ten cua bang sinh vien (moi tabke cho co duy nhat 1 clustered index)
CREATE CLUSTERED INDEX ixFullName ON tbstudent(fullname)
GO

-- xem lai ds sinh vien
select * from tbStudent

-- tao (non-clustered) index tren cot contact cua bang sinh vien, theo thu tu giam dan
CREATE INDEX ixContact ON tbStudent(contact ASC)
go
