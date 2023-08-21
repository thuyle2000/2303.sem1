/*** demo PRETEST  ***/
-- 1. Create a database named dbPretest
create database dbPretest
	on primary  -- phan khai bao cua tap tin du lieu : file group default la [PRIMARY]
	(
		name='dbPretest2', filename='F:\dbSQL\dbPretest.mdf', size=8, filegrowth=40, maxsize=unlimited
	)
	log on		-- phan khai bao cho tap tin nhat ky 
	(
		name='dbPretest_log', filename='F:\dbSQL\dbPretest_log.ldf', size=8, filegrowth=10%, maxsize=64
	)
go

-- open database
use dbPretest
go


/* 2. Create the following tables in Database dbPretest */
/*
   a. Table “tbRoom”:
		- [RoomNo] int Primary key
		- [Type] Varchar(20) Only accept values : “VIP”, ”Double” or “Single”
		- [UnitPrice] Money 0 <= price < 1000
*/
create TABLE tbRoom
(
	RoomNo int not null ,
	[Type] varchar(20),
	UnitPrice Money,
	CONSTRAINT PK_Room PRIMARY KEY NONCLUSTERED (RoomNo), --dn khoa chinh.
	CONSTRAINT CK_Type CHECK ([Type] IN ('Vip', 'Double','Single')), -- dn kiem tra du lieu hop le
	CONSTRAINT CK_Price CHECK ([UnitPrice] BETWEEN 0 AND 999) -- dn kiem tra du lieu hop le
)
GO

/*
   b. Table “tbBooking”:
		- [BookingNo] int
		- [RoomNo] int Foreign key
		- [TouristName] Varchar(20) Not null
		- [DateFrom] DateTime
		- [DateTo] DateTime , dateTo must be greater than dateFrom
		Define a Composite Primary key (BookingNo, RoomNo) on Booking table.
*/
create TABLE tbBooking
(
	BookingNo int not null ,
	RoomNo int not null,
	TouristName varchar(20) not null,
	[DateFrom] date,
	[DateTo] date,
	CONSTRAINT PK_Booking PRIMARY KEY NONCLUSTERED (BookingNo, RoomNo), --dn khoa chinh.
	CONSTRAINT FK_Room FOREIGN KEY (RoomNo) REFERENCES tbRoom(RoomNo), -- dn khoa ngoai
	CONSTRAINT CK_Date CHECK (DateTo>=DateFrom) -- dn kiem tra du lieu hop le
)
GO

/*
c. Insert some records into tables “tbRoom” :
		RoomNo Type Unitprice
		101 Single 100
		102 Single 100
		103 Double 250
		201 Double 250
		202 Double 300
		203 Single 150
		301 VIP 900
*/
insert tbRoom VALUES
		(101, 'Single', 100),
		(102, 'Single', 100),
		(103, 'Double', 250),
		(201, 'Double' ,250),
		(202, 'Double', 300),
		(203, 'Single', 150),
		(301, 'Vip', 900)

select * from tbRoom
GO

/*
d. Insert some records into tables “tbBooking” :
	BookingNo RoomNo TouristName DateFrom DateTo
	1 101 Julia 12/11/2020 14/11/2020
	1 103 Julia 12/12/2020 13/12/2020
	2 301 Bill 10/01/2021 14/01/2021
	3 201 Ana 12/01/2021 14/01/2021
	3 202 Ana 12/01/2021 14/01/2021
*/
SET DATEFORMAT DMY
insert tbBooking VALUES
	(1, 101, 'Julia', '12/11/2020', '14/11/2020'),
	(1, 103, 'Julia', '12/12/2020', '13/12/2020'),
	(2, 301, 'Bill', '10/01/2021', '14/01/2021'),
	(3, 201, 'Ana', '12/01/2021', '14/01/2021'),
	(3, 202, 'Ana', '12/01/2021', '14/01/2021')
select * from tbBooking
GO

/*
3. Create a clustered index ixName on column TouristName of table tbBooking
*/
CREATE CLUSTERED INDEX [ixName] ON tbBooking(TouristName)
GO

/*
4. Create a non-clustered index ixType on column Type of table tbRoom
*/
CREATE INDEX ixType ON tbRoom ([Type])
GO

/*
5. Create a view vwBooking to see the information about [bookings in year 2020]   which contain the following columns:
   BookingNo, TouristName, [RoomNo], 'Type', 'UnitPrice', DateFrom, DateTo. 
The definition of view must be encrypted.
*/
CREATE VIEW [vwBooking]  with encryption AS
select b.BookingNo, b.TouristName, r.RoomNo, r.[Type], r.UnitPrice, b.DateFrom, b.DateTo
	from tbBooking [b] join tbRoom [r] on b.RoomNo = r.RoomNo
	where YEAR(b.DateFrom)=2020 
GO

-- test chuc nang cua view
select * from vwBooking

-- test chuc nang ma hoa phan dinh nghia view
sp_helptext  [vwBooking]
go

/*
6. Create a stored procedure name uspPriceDecrease will down the unit price of double rooms a given amount (input parameter). 
  If non value given, display a list of rooms, sorted by price .
*/
CREATE PROC [uspPriceDecrease]
	@amount INT = NULL -- so tien muon giam gia, tham so input
AS 
BEGIN
	IF (@amount is null)
		begin
			-- display a list of rooms, sorted by price 
			SELECT * FROM tbRoom ORDER BY UnitPrice desc
		end
	ELSE
		begin
			-- display list of double room
			SELECT * FROM tbRoom  WHERE [Type] LIKE 'double'

			-- decrease price of double room by amount
			UPDATE tbRoom SET UnitPrice = UnitPrice - @amount
					WHERE [Type] LIKE 'double'
			
			-- display list of double rooms after change price
			SELECT * FROM tbRoom  WHERE [Type] LIKE 'double'
		end
END

-- test case 1:  chay store ko tham so
exec uspPriceDecrease
GO

-- test case 2: giam gia 10$ cho cac phong double 
exec uspPriceDecrease 10
go


/*
8. Create a trigger named tgBookingRoom that allows one booking order having 3 rooms maximum.
*/
CREATE TRIGGER tgBookingRoom ON tbBooking
FOR INSERT, UPDATE AS
BEGIN
	 IF ( exists ( select BookingNo 
					  from tbBooking 
						   where tbBooking.BookingNo in 
						         (select BookingNo from inserted)
					  group by BookingNo
					  having count(*) > 3
				 )
		)			
	begin
		PRINT 'One booking order having 3 rooms maximum ! Rollback Transaction'
		ROLLBACK
	end
END
GO

select * from tbBooking order by BookingNo
-- test case 1 : them 1 booking moi so 4, dat 3 phong : OK
	SET DATEFORMAT DMY
	insert tbBooking values
	(4, '101', 'Truong', '21/08/2020', '23/08/2020'),
	(4, '102', 'Truong', '21/08/2020', '23/08/2020'),
	(4, '103', 'Truong', '21/08/2020', '23/08/2020')
	select * from tbBooking order by BookingNo
	go

-- test case 2 : them 1 booking moi so 5, dat 4 phong : FAIL !
	SET DATEFORMAT DMY
	insert tbBooking values
	(5, '101', 'Doanh', '21/08/2020', '23/08/2020'),
	(5, '102', 'Doanh', '21/08/2020', '23/08/2020'),
	(5, '103', 'Doanh', '21/08/2020', '23/08/2020'),
	(5, '301', 'Doanh', '21/08/2020', '23/08/2020')
	select * from tbBooking order by BookingNo
	go

-- test case 3 : dat them 1 phong cho booking so 1: OK !
	SET DATEFORMAT DMY
	insert tbBooking values
	(1, '102', 'Julia', '21/08/2020', '23/08/2020')

	select * from tbBooking order by BookingNo
	go

/* test case 4 : 
   dat them 1 phong cho booking so 2: OK, 
   dat them 1 phong nua cho booking so 1: FAIL !
       => toan bo cau lenh => FAIL
*/
	SET DATEFORMAT DMY
	insert tbBooking values
	(2, '102', 'Bill', '21/08/2020', '23/08/2020'),
	(1, '301', 'Julia', '21/08/2020', '23/08/2020')

	select * from tbBooking order by BookingNo
	go
