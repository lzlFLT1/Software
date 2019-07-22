/************************************************* mysql 存储过程 ***********************************************************/
-- 查看所有存储过程、存储函数
show procedure status;
show function status;    

select `name` from mysql.proc where db = 'your_db_name' and `type` = 'PROCEDURE'; -- root 权限
select `name` from mysql.proc where db = 'your_db_name' and `type` = 'FUNCTION'  

show create procedure proc_name; -- 查看存储过程创建代码
show create function func_name; -- 查看存储函数创建代码





-- 定义输入结束符
delimiter $$ 
-- 定义存储过程
create procedure param(

	in var1 int(9),			-- 输入
	inout var2 int(9),		-- 输入和输出

	out var3 varchar(255),	-- 输出
	out var4 int(9),
	out var5 decimal(9,2),	# ##
	out var6 datetime		/* */
)
begin
	
	declare var7 int(7) default 8; -- 定义变量
	set var7 = 9; -- 给变量赋值
	
	select name into var3 from order where id=1; -- 订单表
    select price into var4 from order where id=1; 
    select avg(price) into var5 from order; 
    
    -- if 语句格式
    if var7>9 then
    elseif var7<9 then
	end if;
	
	-- case 语句格式
	case var7
	when 1 then sql
	when 2 then sql
	else 
	end case;
	
	-- while 语句格式
	[begin_label:] WHILE search_condition DO
        statement_list
    END WHILE [end_label]
	
	
	LOOP1:
	while var7<9 do
		set var7=var7+1;
		iterate LOOP1  -- 相当于 continue
		leave LOOP1 -- 相当于 break
	end while
	LOOP1;
	
	-- repeat 语句格式
	[begin_label:] REPEAT
        statement_list
    UNTIL search_condition
    END REPEAT [end_label]
	
	LOOP2:
	repeat
		set var7=var7+1;
	until var7>9
	end repeat
	LOOP2 ;
	
	-- loop 语句格式
	label1: LOOP
        SET p1 = p1 + 1;
        IF p1 < 10 THEN
          ITERATE label1;
        END IF;
        LEAVE label1;
    END LOOP label1;
	

end;
$$
delimiter ;





-- 存储函数
CREATE FUNCTION sp_name([func_parameter[,...]]) 
RETURNS type 
[characteristic ...] routine_body 
Return


---------------------------------------------------------------------------------------------




/* 存储过程 */
-- 删除存储过程
drop procedure if exists demo; 

-- 创建存储过程
delimiter $$
create procedure demo(in param1 int(8), out param2 varchar(8), inout param3 decimal(4,2))
begin	
	
    declare var2 int(2);
    declare var3 int(4);
    declare var4 int(8);
    
	/* 定义变量 */
	declare var1 int(8) default 0; -- 定义变量
    declare done int(2) default 0; -- 定义游标结束标志
	declare cursorVar cursor for select resource_id, wrong_id, type from r_resource_wrong; -- 定义游标变量
    declare continue handler for sqlstate '02000' set done = 1;
    
	-- 给变量赋值
	set var1 = 2;
    set param1 = param3; -- 使用参数以及给参数赋值
			
	/* 打印变量 */
	select param1, param2, param3, var1; -- 显示参数值
    
    open cursorVar; -- 打开光标
    
    repeat -- 循环
		fetch cursorVar into var2, var3, var4;
        if var4 = 2 then  -- 分支
			insert into r_resource_wrong(resource_id, wrong_id, type) values (var2, 3, var4);
        end if;
	until done=1
	end repeat;
    
    
    close cursorVar; -- 关闭光标	
end
$$ delimiter ;


-- 调用带参数的存储过程，输入输出参数都要写
call demo(@userVar1, @userVar2, @userVar3);
