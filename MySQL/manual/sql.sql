/* MySQL 数据类型：
	charactor: varchar(65535)  --> java.lang.String
	
	number: int(11)   --> java.lang.Integer     括号里的 11 表示的是显示长度，跟存储没啥关系
	        bigint(20)  --> java.lang.Long, java.math.BigInteger
			decimal(m,d) 参数m<65 是总位数，d<30且 d<m 是小数位。 --> java.math.BigDecimal
			
	date: 	datetime  日期时间 '2008-12-2 22:06:44'  --> java.sql.Timestamp
	查 增 删 改
	
    Mysql 中的转义字符	
    \0	An ASCII NUL (X'00') character
    \b	A backspace character
    \n	A newline (linefeed) character
    \r	A carriage return character
    \t	A tab character.
    \Z	ASCII 26 (Control+Z)
    \N	NULL
 */

--------------------------------------------- Query Add Delete Modify ------------------------------------------------



mysql> set sql_safe_updates = 0;  			-- 设置safe-updates模式 是否开启
mysql> source e:/tty.sql;					-- 在一个数据库下执行一个 .sql 文件
mysql> show global variables;               -- 查看数据库系统所有的全局参数

/* 对 mydb 这个数据进行备份，mydb.dbb 就是备份文件 */
C:\WINDOWS\system32> mysqldump --opt mydb>mydb.dbb 
/* 用批处理方式使用MySQL */
C:\WINDOWS\system32> mysql < mytest.sql > mytest.out  -- 对 mytest.sql 进行批处理，处理结果重定向到 mytest.out 文件中



/* 表相关 */
mysql> select table_name from information_schema.tables where table_schema = '数据库名'; -- 查看一个数据库中所有的表
mysql> show tables; -- 查看当前数据库中所有的表
mysql> desc tablename; -- 查看一个表的表结构



-- 创建表
create table t(
	col1 int(9) auto_increment,
	col2 bigint(9) default 888,
	col3 varchar(65535) not null,
	col4 date,
	col5 datetime,
	col6 timestamp comment '列的注释',
	constraint t_pk primary key(col1, col2),  -- 联合主键
	constraint t_fk foreign key(col4) references t2(id),
	constraint t_uk unique key(col4, col5)  -- 联合唯一索引
)AUTO_INCREMENT=1 comment='表的注释'; -- 编码方式：默认的是utf8，  自增长量：可以在这里初始化

-- 删除表
drop table t;

-- 修改表名
alter table t
rename t2;

-- 修改表注释
alter table t comment '修改后的注释';


alter table t auto_increment=1000;  -- 修改主键自增


/* Constraint */
-- 添加约束条件

alter table t add constraint t_pk2 primary key(col2);
alter table t add constraint t_fk2 foreign key(col4) references t2(id);
alter table t alter column col1 set default 888;
alter table t add unique key t_uk2 (col1, col2);
alter table t modify col1 int(9) not null;

-- 删除约束条件
alter table t drop primary key t_pk;
alter table t drop foreign key t_fk;
alter table t alter column col1 drop default; -- 删除 default 约束
alter table t drop index t_uk;  -- 删除 unique 约束
alter table t modify col1 int(9) null; -- 删除 not null 约束


/* Column */
mysql> select column_name from information_schema.columns  where table_name='***';  -- 查看数据库中所有表的列

-- 添加列
alter table t
add column col varchar(20) not null;

-- 删除列
alter table t
drop column col;

-- 修改列名
alter table t change col col2 varchar(20) not null default '' comment 'modify column';
alter table t change `id` `id` int(11) not null auto_increment;

-- 修改列的数据类型
alter table t
modify column col varchar(20) not null comment '';


/* Row */
-- 添加行
insert into t(col1, col2, col3)
values
    (123, 'hello', 'word'), 
    (456, 'hggf', 'wfew')
;


insert into db1_name (field1,field2)  -- 从单表中取数据
select field1,field2 
from db2_name;


insert into a (field1,field2)  -- 从多表中取数据
select * 
from(
	select b.f1,c.f2 from b join c
) as tb;

-- 删除行
delete from t
where ;

truncate table t; -- 清空表数据

-- 修改行
-- 方法一：适用于 更新值 相同的更新
update t
set col1=123, col2='fwef'
where ;

-- 方法二：适用于 更新值 随条件变化的更新
update t 
    set 
    col1 = 
    case id 
        when 1 then 3 
        when 2 then 4 
        when 3 then 5 
    end, 
    title = 
    case id 
        when 1 then 'new title 1' -- else 'new title 1-1'
        when 2 then 'new title 2'
        when 3 then 'new title 3'
    end
where id in (1,2,3); -- 没有作用，只是确保只有3行数据执行

-- 方法三：创建临时表的方式
create temporary table tmp(id int(4) primary key, dr varchar(50));
insert into tmp values  (0,'gone'), (1,'xx'),...(m,'yy');
update test_tbl, tmp set test_tbl.dr=tmp.dr where test_tbl.id=tmp.id;

-- 方法四：
insert into t_stock_chg(f_market, f_stockid, f_name) 
values('sh', '600000', '白云机场')
on duplicate key update f_market='sh', f_name='浦发银行'; 
-- 语句含义：如果该记录不存在则，插入该条记录，如果存在，则更新 f_market='sh', f_name='浦发银行'
-- 规则：f_market, f_stockid, f_name 这三列中，必须有一列是 unique 索引的，根据 unique 列判断是否重复


/* Select */
select col1, col2 
from t 
where ;


-- 分页查询
select *
from t
limit 100, 10; -- 从 100 行开始读取，一共读取 10 行



/* Advance Sql Operating */
-- left join 右表具有多个值 只取一个值的操作
select * 
from b as t3 left join (
    select max(id) as id 
    from b as t1 
    group by t1.b
    ) as t2 on t2.id=t3.id 
where t2.id is not null;


-- group by 后，获取没有 group by 的列
	select A.col0
	from t1 as A 
		inner join (
			select col1, col2
			from t1
			group by col1, col2) as B
		on (A.col1=B.col1 and A.col2=B.col2);

-- 从一张表中选择数据插入到另一张表中，如果插入数据要对应，那么通过表连接生成新的表即可
	insert into target_table(col1, col2, col3)
	select col4, col5, col6
	from source_table
	where ;

-- 删除符合子查询条件的行
	-- 方案一：最佳
	create table temp (col1 int(9)); -- 先建立中间表

	insert into temp
	select 
	from t1
	where;


	delete from t1 as A
	where A.id in (
		select col1
		from temp
		where 
	);
	
	-- 方案二 次佳
	DELETE e.*
	FROM tableE e
	WHERE id IN (SELECT id
	             FROM (SELECT id
	                   FROM tableE
	                   WHERE arg = 1 AND foo = 'bar') as x);
	-- 方案三                   
	DELETE th
	FROM term_hierarchy AS th
	WHERE th.parent = 1015 AND th.tid IN (
		    SELECT DISTINCT(th1.tid)
		    FROM term_hierarchy AS th1
		    INNER JOIN term_hierarchy AS th2 ON (th1.tid = th2.tid AND th2.parent != 1015)
		    WHERE th1.parent = 1015
		);
		
	-- 方案四
	DELETE FROM `secure_links` WHERE `secure_links`.`link_id` IN 
            (
            SELECT
                `sl1`.`link_id` 
            FROM 
                (
                SELECT 

                    `sl2`.`link_id` 

                FROM 
                    `secure_links` AS `sl2` 
                    LEFT JOIN `conditions` ON `conditions`.`job` = `sl2`.`job` 

                WHERE 

                    `sl2`.`action` = 'something' AND 
                    `conditions`.`ref` IS NULL 
                ) AS `sl1`
            )


-- 查找表中重复的字段，多列
select * from vitae a   
where (a.peopleId,a.seq) in (select peopleId,seq from vitae group by peopleId,seq having count(*) > 1) 

-- 删除表中多余的重复记录，多列
delete from vitae a   
where (a.peopleId, a.seq) in (
		select peopleId, seq 
		from vitae 
		group by peopleId,seq having count(*) > 1                 
		)   
	and rowid not in (
		select min(rowid) 
		from vitae 
		group by peopleId,seq having count(*)>1
	);


/*############################################### Row and Column Convert : Begin ####################################################*/
-- 行转列，指把同一行中的不同列，转化到一个列中去
create table row2col(
	id int(8) auto_increment primary key,
	name varchar(8),
    gender varchar(8),
    chinese varchar(8),
    meth varchar(8),
    english varchar(8)
);
insert into `new2016`.`row2col` (`name`, `gender`, `chinese`, `math`, `english`) values ('小明', '男', '44', '54', '64');
insert into `new2016`.`row2col` (`name`, `gender`, `chinese`, `math`, `english`) values ('小红', '女', '66', '76', '86');
insert into `new2016`.`row2col` (`name`, `gender`, `chinese`, `math`, `english`) values ('小皮', '男', '78', '88', '98');

-- 基本思路：多次调用 select into 语句到中间表
select 
	name,
	gender,
	'语文',
	score
into templateTable
from row2col;


-- 列转行，指把一个列中的不同行且不相同的数据，分配到不同的列上去
create table col2row(
	id int(8) auto_increment primary key,
	name varchar(8),
    gender varchar(8),
    subject varchar(8),
    score varchar(8)
);
insert into col2row(name, gender, subject, score) values('小明', '男', 'chinese', '34');
insert into col2row(name, gender, subject, score) values('小明', '男', 'math', '34');
insert into col2row(name, gender, subject, score) values('小明', '男', 'english', '34');
insert into col2row(name, gender, subject, score) values('小红', '女', 'chinese', '34');
insert into col2row(name, gender, subject, score) values('小皮', '男', 'chinese', '34');

-- 方法1
select
    name,
    gender,
    sum(if(subject='chinese', score, 0)) as '语文',
    sum(if(subject='math', score, 0)) as '数学',
    sum(if(subject='english', score, 0)) as '英语'
from col2row
group by name, gender;

-- 方法2，推荐
select
	name,
    gender,
    max(case subject when 'chinese' then score else 0 end) as '语文',
    max(case subject when 'math' then score else 0 end) as '数学',
    max(case subject when 'english' then score else 0 end) as '英语'
from col2row
group by name, gender;

/*############################################### Row and Column Convert : End ####################################################*/

/* mysql 函数
	使用函数的时候要先清楚一件事，
	select name, colvar from tab; 
	其中的 name 和 colvar 是列值变量，可以存取列值的.
	在不同的上下文中有不同的含义，如：
	在 max(name);  count(name); sum(name); 等函数中，name 相当于 Java 中的 List<name> name 变量；
	在 if(name='Kasei', 1, 0);  case name when 'Kasei' then 1 else 0 end; 中 name 相当于Java 中 String name; 即直接表示列值
*/
if(exp1, exp2, exp3)  -- 如果 exp1 等于 ture，则返回 exp2，否则返回 exp3

select id, group_concat([distinct] name [order by asc/desc 排序字段] [separator ',']) from aa group by id;

/* partition */
partition(partition_name1, partition_name2, partition_name3)




/* 常用 sql */
select 	
    max(case roh when 1 then COLUMN_NAME else 0 end) as z1
from 
(select @rowno:=@rowno+1 roh, COLUMN_NAME from information_schema.COLUMNS, (select @rowno:=0) t2 where table_name = 'discipline_school') t3;









