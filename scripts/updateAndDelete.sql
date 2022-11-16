USE BookManageOS
GO

--把朝花夕拾这本书的库存增加2
UPDATE Books SET Bnumber = Bnumber+2 where Bno = '9787201118574'
GO
--把图书表中所有书的单价增加1.1倍
UPDATE Books SET Bprice = Bprice*1.2
GO
--将刘雨兰调到人事部
UPDATE Employee SET Dno = 10 where Eno = '201701461265'
GO
--将生产部和人事部的人员调到客服部
UPDATE Employee SET Dno = 11 where Dno = 10 or Dno = 9
GO

--更新出版社电话
UPDATE Press SET Phone ='010-88310888' where Phone = '010-585714443'
GO

--已经被借走的书的价格修改为 20
UPDATE  Books SET Books.Bprice = 20 FROM Books INNER JOIN Borrow ON Books.Bno=Borrow.Bno 
GO

--更新人力资源部的部门名称
UPDATE Department SET Dname='劳力组织部' where Dname = '人力资源部'
GO

--把还书时间晚于10月1的书的库存加1
UPDATE Books SET Books.Bnumber = Books.Bnumber+1 FROM Books INNER JOIN Borrow ON Books.Bno = Borrow.Bno where Borrow.RealpaybackDate < '2022-10-1'
GO

--将单价不大于50的图书进行库存清空
UPDATE Books SET Books.Bnumber = 0 where Bprice <= 50
GO

--将借出数量大于10的图书的价格增加1.1倍
UPDATE Books SET Books.Bprice =  Books.Bprice *1.1 FROM Books Join (SELECT Bno FROM Borrow group by Bno having count(*) >= 10  ) AS a  ON Books.Bno = a.Bno

--删除掉图书表中库存为0的图书记录
DELETE FROM Books where Bnumber = 0
GO
--解散掉生产部和人事部
DELETE FROM Employee where Dno = 10 or Dno = 9
GO
--删除掉田浩宇的信息
DELETE FROM Employee where Ename = '田浩宇'
GO

--删除掉单价低于10或者高于999的书籍
DELETE FROM Books where Bprice not between 10 and 999

--删除掉已经归还的借阅记录
DELETE FROM Borrow where ShouldpaybackDate is not null



--删除掉人事部所有员工的借阅记录
DELETE Borrow FROM Borrow JOIN Employee ON Borrow.Eno = Employee.Eno JOIN Department ON Department.Dno = Employee.Dno where Department.Dno = 10
GO
--删除掉借阅表里面没有归还的人

DELETE FROM Borrow where ShouldpaybackDate is null
GO

--删除掉中国青年出版社出版的所有书
DELETE Books FROM Books join Press ON Books.Pname = Press.Pname where Press.Pname = '中国青年出版社'
GO

--删除掉归还时间早于10月1的记录
DELETE FROM Borrow where RealpaybackDate < '2022-10-01'



--删除掉田野借的书的借阅记录
DELETE Borrow FROM Borrow JOIN Employee ON Borrow.Eno = Employee.Eno where Borrow.Eno= '202001060122'
GO


