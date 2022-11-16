USE BookManageOS
go
create Procedure Proc_borrow_book
AS @a char(4),@b int, @m int,@state varchar(20)
begin
	declare employee_count int default 0;
	declare book_count int default 0;
	declare stock int default 0;
	-- 判断工号是否存在
	select count(Eno) INTO  employee_count from Employee where Eno=a;
	if per_count>0 then
		 -- 工号存在
		 -- 判断图书ID是否存在：根据参数b 查询图书记录总数
		 select count(Bno) INTO book_count from Books where Bno=b;
		 if book_count >0 then
		    -- 图书存在
			  -- 判断图书库存是否充足：查询当前图书库存，然后和参数m进行比较
				select Bnumber INTO stock from Books where Bno=b;
				if stock >= m then
					-- 执行借书
					-- 操作1：在借书记录表中添加记录
					insert into Borrow(snum,bid,borrow_num,is_return,borrow_date) values(a,b,m,0,sysdate());
					-- 操作2：修改图书库存
					update Books set Bnumber=stock-m where Bno=b;
					-- 借书成功
					set state='借书成功';
				else
				  -- 库存不足
					set state='库存不足';
				end if;				
		 else
				-- 图书不存在
				set state = '图书不存在';
		 end if;
	else
	   -- 不存在
		 set state = '非工作人员';
	end if;
end;