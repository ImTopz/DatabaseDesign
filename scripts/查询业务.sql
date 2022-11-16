use BookManageOS
go

--查询某本书的信息
select *
from Books
where Bname = '红岩'
go

--查询某个部门的信息
select *
from Department
where Dname = '行政部'
go

--查询某个员工的信息
select *
from Employee
where Ename = '张德东'
go

--查询某个员工的借阅记录
select * 
from checkBorrowStatus
where Ename = '王文浩'

--查询某个出版社的信息
select *
from Press
where Pname = '青岛出版社'
go

--查询某本书最近的借阅记录
select Bname as 书名,Ename as 借书人,LendingDate as 借书日期,ShouldpaybackDate as 应还日期,RealpaybackDate as 实际还书日期
from checkBorrowStatus
where Bname = '红岩'

--查询某个部门的员工
select Ename
from Employee
where Employee.Dno in (select Dno
						from Department
						where Dname = '行政部')

--查询未还书的记录
select *
from checkBorrowStatus
where RealpaybackDate is NULL

--查询逾期未还书的员工的记录
select *
from checkBorrowStatus
where RealpaybackDate is NULL and getdate()>ShouldpaybackDate

--查询某个部门的女员工信息
select *
from Employee
where Employee.Esex = '女' and Employee.Dno in (select Dno
												from Department
												where Dname = '行政部')

--查询来自某个出版社的书的信息
select *
from Books
where Books.Pname = '中国青年出版社'