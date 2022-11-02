use master
go 
if exists(select * from sysdatabases where name='BookManageOS')
drop database BookManageOS
go
create database BookManageOS
on primary 
(
    name = 'BookManageOS_data',
    filename='D:\DB\BookManageOS_data.mdf',
    size=10MB,
    filegrowth=5MB 
)
log on
(
    name = 'BookManageOS_log',
    filename = 'D:\DB\BookManageOS_log.ldf', 
    size = 5MB,
    filegrowth = 2MB
)
go
