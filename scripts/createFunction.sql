IF OBJECT_ID (N'dbo.GetInventoryStock', N'FN') IS NOT NULL
    DROP FUNCTION GetInventoryStock;
GO

IF OBJECT_ID (N'dbo.GetPrice', N'FN') IS NOT NULL
    DROP FUNCTION GetPrice;
GO

IF OBJECT_ID (N'dbo.GetEachTimes', N'FN') IS NOT NULL
    DROP FUNCTION GetEachTimes;
GO


DROP FUNCTION GetEmployeeBorrow;
GO


IF OBJECT_ID (N'dbo.GetPressStock', N'FN') IS NOT NULL
    DROP FUNCTION GetPressStock;
GO


CREATE FUNCTION GetInventoryStock(@Bno varchar(13))
RETURNS int
AS
begin
    declare @number int
    select @number = Bnumber from Books where Bno = @Bno
    if(@number is null)
        set @number=0;
    return @number;
END
GO


CREATE FUNCTION GetPrice(@Bno varchar(13))
RETURNS float
AS
begin
    declare @price float
    select @price = Bprice from Books where Bno = @Bno
    if(@price is null)
        set @price=0;
    return @price;
END
GO


CREATE FUNCTION GetEachTimes(@Bno varchar(13))
RETURNS int
AS
begin
    declare @times int
    select @times = COUNT(*) FROM Books JOIN Borrow on Books.Bno = Borrow.Bno WHERE Books.Bno = @Bno
    if(@times is null)
        set @times=0;
    return @times;
END
GO


CREATE FUNCTION GetEmployeeBorrow(@Eno varchar(12))
RETURNS TABLE
AS
RETURN
(
    SELECT Employee.Eno,Employee.Ename,COUNT(*) as 借书数量 
    FROM Employee JOIN Borrow ON Employee.Eno=Borrow.Eno 
    where Employee.Eno=@Eno 
    group by Employee.Eno,Employee.Ename

)
GO



CREATE FUNCTION GetPressStock(@Pname varchar(50))
RETURNS int
AS
begin
    declare @times int
    select @times = COUNT(*) FROM Press JOIN Books on Press.Pname = Books.Pname WHERE Press.Pname=@Pname
    if(@times is null)
        set @times=0;
    return @times;
END
GO




SELECT Pname,dbo.GetPressStock('中国华侨出版社') AS 出版社库存 FROM Press WHERE Pname ='中国华侨出版社'

SELECT Bname,dbo.GetInventoryStock('9787511037909') AS 库存
FROM Books WHERE Bno = '9787511037909'

SELECT Bname,dbo.GetEachTimes('9787511037909') AS 库存 FROM Books
WHERE Bno = '9787511037909'

SELECT Bname,dbo.GetPrice('9787511037909') AS 价格
FROM Books  WHERE Bno = '9787511037909'

SELECT * FROM dbo.GetEmployeeBorrow('张德东')