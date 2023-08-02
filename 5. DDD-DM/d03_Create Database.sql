/* tao csdl dbDemo1 : cu phap don gian nhat */
create database dbDemo1
go

/*tao CSDL dbDemo2 voi cac tham so duoc mo ta nhu sau: 
- tap du lieu: 
  ten logic: [dbDemo2], ten file: [dbDemo2.mdf], kt ban dau: 8MB, he so gia tang: 40MB, kt toi da: ko gioi han
 
- tap nhat ky: 
  ten logic: [dbDemo2_log], ten file: [dbDemo2_log.ldf], kt ban dau: 8MB, he so gia tang: 10%, kt toi da: 64MB  
*/
create database dbDemo2
	on primary  -- phan khai bao cua tap tin du lieu : file group default la [PRIMARY]
	(
		name='dbDemo2', filename='F:\dbSQL\dbDemo2.mdf', size=8, filegrowth=40, maxsize=unlimited
	)
	log on		-- phan khai bao cho tap tin nhat ky 
	(
		name='dbDemo2_log', filename='F:\dbSQL\dbDemo2_log.ldf', size=8, filegrowth=10%, maxsize=64
	)
go

/* doi ten CSDL dbDemo2 -> dbDemo2bis */
ALTER database dbDemo2
	MODIFY NAME = dbDemo2bis
go


/*tao CSDL dbDemo3 voi cac tham so duoc mo ta nhu sau: 
- tap du lieu: 
  * tap so 1 : bten logic: [dbDemo3], ten file: [dbDemo3.mdf], kt ban dau: 8MB, he so gia tang: 40MB, kt toi da: ko gioi han
  * tap so 2 : ten logic: [dbDemo3b], ten file: [dbDemo3b.ndf] - FILEGROUP : 'FGDemo'
 
- tap nhat ky: 
  ten logic: [dbDemo3_log], ten file: [dbDemo3_log.ldf]
*/
create database dbDemo3
	on primary         -- phan khai bao cua tap tin du lieu trong file group default [PRIMARY]
	(
		name='dbDemo3', filename='F:\dbSQL\dbDemo3.mdf', size=8, filegrowth=40, maxsize=unlimited
	),
	FILEGROUP [FGDemo] -- phan khai bao cua tap tin du lieu thu 2 trong file group [FGDemo]
	(
		name='dbDemo3b', filename='F:\dbSQL\dbDemo3b.ndf'
	)
	log on		-- phan khai bao cho tap tin nhat ky 
	(
		name='dbDemo3_log', filename='F:\dbSQL\dbDemo3_log.ldf'
	)
go


-- xoa CSDL dbDemo3
DROP DATABASE dbDemo3
Go


-- xoa CSDL dbDemo2bis
DROP DATABASE dbDemo2bis
Go

-- tao CSDL anh (snapshot) [dbDem1ss] tu CSDL [dbDEMO]
CREATE DATABASE dbDemoss ON
    ( NAME = dbDemo, FILENAME = 'F:\dbSQL\dbDemoss.ss')
AS SNAPSHOT OF dbDemo ;
go

-- xoa cdsl anh 
DROP DATABASE dbDemoss
go

