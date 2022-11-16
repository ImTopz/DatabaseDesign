USE BookManageOS
GO

create Procedure BorrowBook
@Bno varchar(13) ,@Eno varchar(12)
as 
declare @Bname varchar(50)
if exists (select * FROM Borrow where Bno=@Bno and Eno = @Eno)
begin
	print '对不起，你已经借阅过此书'
end

else
begin
-------更改图书库存信息----------
UPDATE Books SET Bnumber = Bnumber-1 where Bno=@Bno
-------增加借阅图书信息----------
INSERT INTO Borrow (Bno,Eno,LendingDate) values (@Bno,@Eno,getdate())
-------输出信息-----------------
DECLARE @Eno2 varchar (8)
select @Eno2= Eno FROM Borrow WHERE Eno=@Eno
select '读者'+@Eno2+'成功借出书籍！'
end
go


create Procedure ReturnBook
@Bno varchar(13) , @Eno varchar(12)
as
declare @Bname varchar(50)
if not exists (SELECT * FROM Borrow where Bno = @Bno and Eno = @Eno)
begin
	print '你还没有借过此书，无法还书'
end
else
begin
delete from Borrow where Bno = @Bno and Eno = @Eno
UPDATE Books SET Bnumber = Bnumber+1 WHERE Bno = @Bno
select '读者'+@Eno+'成功借出书籍！' +@Bno
end
go


-------读者查询借阅情况
create Procedure QueryBook
@Eno varchar(12)
as
declare @Bname varchar(50)
declare @Temptable table
(
	Bno  varchar(13),
	Eno  varchar(12),
	LendingDate date
)
insert @Temptable (Bno,Eno,LendingDate) SELECT Bno,Eno,LendingDate FROM Borrow WHERE Eno = @Eno
SELECT * FROM @Temptable
go


--------统计读者借书次数
create Procedure SelectCount
as
declare @Temptable table
(
	Eno varchar(12),
	BorrowNumber int 
)
insert @Temptable (Eno,BorrowNumber) SELECT Eno,count(*) from Borrow group by Eno
SELECT * FROM @Temptable
go


-----根据输入的学号输入这个人的具体信息
create Procedure getDetail
@Ename varchar(12)
AS
begin
declare @Temptable table
(
	Eno    varchar(12) ,
	Ename  varchar(100) ,
	Esex   nchar(1) ,
	Ebirth date,
	Dno    int 
)
insert @Temptable (Eno,Ename,Esex,Ebirth,Dno) SELECT * FROM Employee where Ename=@Ename
SELECT * FROM @Temptable AS 个人信息表
end
go





















