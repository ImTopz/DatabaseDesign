use BookManageOS
go
--?????????
if exists(select * from sysobjects where name='Press')
drop table Press
go
create table Press
(
Pname     varchar(50)  PRIMARY KEY,
Paddress  varchar(255) unique,
Phone     varchar(50) null,
Pcontact  varchar(255) 
)
go

if exists(select * from sysobjects where name='Books')
drop table Books
go
create table Books 
(
Bno   varchar(13)  PRIMARY KEY,
Bname     varchar(50) not null,
Bauthor varchar(50) null,
Bprice  float   not null,
Bnumber int     null,
Pname   varchar(50)  FOREIGN KEY REFERENCES Press(Pname)

)
go

if exists(select * from sysobjects where name='Department')
drop table Department
go
create table Department
(
Dno    int PRIMARY KEY,
Dname  varchar(100),
Dphone varchar(100)
)
go

if exists(select * from sysobjects where name='Employee')
drop table Employee
go
create table Employee
(
Eno    varchar(12) PRIMARY KEY ,
Ename  varchar(100) ,
Esex   nchar(1) CHECK(Esex='??' OR Esex = '?'),
Ebirth date,
Dno    int FOREIGN KEY REFERENCES Department(Dno)
)
go


if exists(select * from sysobjects where name='Borrow')
drop table Borrow
go
create table Borrow
(
Bno  varchar(13),
Eno  varchar(12),
LendingDate date,
ShouldpaybackDate date,
RealpaybackDate date,
PRIMARY KEY(Bno,Eno)
)
go

