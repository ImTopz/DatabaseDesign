USE BookManageOS
DROP VIEW IF   EXISTS checkPress 
GO
DROP VIEW IF EXISTS checkDepart
GO
DROP VIEW IF EXISTS checkBorrowStatus
GO

CREATE VIEW checkDepart AS
	SELECT  Ename,Dname FROM Employee e inner join Department d ON e.Dno = d.Dno
GO
CREATE VIEW checkPress AS
	SELECT Bname,p.Pname FROM Books b inner JOIN Press p ON b.Pname = p.Pname
GO
CREATE VIEW checkBorrowStatus AS 
	SELECT Ename,Bname,LendingDate,ShouldpaybackDate,RealpaybackDate
		FROM Employee  e join Borrow  b ON e.Eno = b.Eno  join Books on b.Bno=Books.Bno
GO

CREATE VIEW checkBorrowNumber AS
	SELECT Ename,count(Eno) FROM Employee e inner join Borrow b ON e.Eno = b.Eno group by a.Ename 
GO



SELECT * FROM checkDepart
GO
SELECT * FROM checkPress
GO
SELECT* FROM checkBorrowStatus
GO

