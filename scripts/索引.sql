use BookManageOS

DROP index IF   EXISTS Books.index_Bname
GO
DROP index IF   EXISTS Department.index_Dname
GO
DROP index IF   EXISTS Employee.index_Ename
GO
DROP index IF   EXISTS Press.index_Pname
GO
DROP index IF   EXISTS Books.index_Pname
GO
DROP index IF   EXISTS Employee.index_Dno
GO
DROP index IF   EXISTS Borrow.index_Bno
GO
DROP index IF   EXISTS Borrow.index_Eno
GO
DROP index IF   EXISTS Borrow.Eno_Shouldback
GO

create index index_Bname
on Books(Bname)
go

create index index_Dname
on Department(Dname)
go

create index index_Ename
on Employee(Ename)
go

create index index_Pname
on Press(Pname)
go

create index index_Pname
on Books(Pname)
go

create index index_Dno
on Employee(Dno)
go

create index index_Bno
on Borrow(Bno)
go

create index index_Eno
on Borrow(Eno)
go

create index Eno_Shouldback
on Borrow(Eno asc,ShouldpaybackDate asc)
go

