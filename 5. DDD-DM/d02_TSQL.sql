use dbDemo
go

-- xem ds sinh vien
select * from tbStudent

/******************************
  1) demo cach su dung vi tu (predicate) LIKE
******************************/
-- tim sv co ho 'LE'
select * from tbStudent WHERE fullname LIKE 'le %'

-- tim sv trong ten co chua tu 'an'
select * from tbStudent WHERE fullname LIKE '%an%'



/******************************
  2) demo cach su dung vi tu (predicate) IN
******************************/
-- tim sv co ma so sv01, sv03
-- 1. ko co vi tu
select * from tbStudent 
	WHERE student_id LIKE 'sv01' OR student_id LIKE'sv03'

-- 2. co vi tu
select * from tbStudent WHERE student_id IN ('sv01','sv03')



/******************************
--3) demo cach su dung vi tu BETWEEN 
******************************/

-- xem ds sv sinh nam 1999->2003
-- 1. ko co vi tu
select * from tbStudent 
	WHERE YEAR(birthday)>=1999 AND YEAR(birthday)<=2003

-- 2. co vi tu
select * from tbStudent 
	WHERE YEAR(birthday) BETWEEN 1999 AND 2003
go

/******************************
   4) demo cach su dung bien
******************************/

-- dem so luong sinh vien nam va in ra man hinh
declare @dem int
select * from tbStudent where gender=1
select @dem=COUNT(*) from tbStudent where gender=1
select @dem [so sinh vien nam]
print 'Co ' + CONVERT(varchar(10), @dem) + ' sinh vien nam.'
print 'Tim thay ' + CAST(@dem as varchar(10)) + ' sinh vien nam trong danh sach.'
go

/******************************
  5) demo bieu thuc CASE 
******************************/
-- xem ds sinh vien, bao gom gioi tinh male, female
select student_id, fullname, gender, email, birthday, phone, batch_id
from tbStudent

select student_id, fullname, 
	CASE gender
		WHEN 1 THEN 'male'
		ELSE 'female'
	END,
	email, birthday, phone, batch_id
from tbStudent

-- dat ten cho cot gender sau khi ap dung bieu thuc CASE
select student_id, fullname, 
	CASE gender
		WHEN 1 THEN 'male'
		ELSE 'female'
	END [gender],
	email, birthday, phone, batch_id
from tbStudent

-- bo sung them cot tuoi (age)
select student_id, fullname, 
	CASE gender
		WHEN 1 THEN 'male'
		ELSE 'female'
	END [gender],
	email, 
	birthday, DATEDIFF(YY, birthday, GETDATE()) [age], 
	phone, batch_id
from tbStudent