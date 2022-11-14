create trigger trig_1
on Books
after update
as
if update(Bno)
	begin
		raiserror('不能修改图书号',16,2)  
		rollback
	end
go


create trigger trig_2 
on Books
after insert,delete,update
as 
	begin
		set nocount on
		select * from Books
	end
go


create trigger trig_3 
on Employee
for delete
as 
	delete Borrow
	where Borrow.Eno in(select Eno from deleted)
go


create trigger trig_4
on Books
instead of insert
as
	select * from Books
go


create trigger trig_5
on all server
after create_database
as
begin
	raiserror('不能创建新的数据库',16,2)
	rollback
end
go


create trigger trig_6 
on Borrow
after insert
as
begin
	declare @s date
	select @s= LendingDate from inserted
	declare @t date
	select @t= ShouldpaybackDate from inserted
	if @s>@t
	begin
	     select '归还日期必须在应还日期之前'
	     rollback
	end
end
go