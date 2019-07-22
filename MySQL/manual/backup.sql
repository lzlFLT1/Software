/******************************* Mysql 数据导入 *******************************/  
-- 导入方式一：load data local infile 命令
mysql> load data 
    [low_priority | concurrent] 
    [local]  -- local 表示是否把文件传到服务器再执行导入，如果没有该关键字，那么导入的文件必须有可读权限, 一般都要该参数
infile 'e:/input.csv'
    [replace | ignore] -- ignore 表示是否在导入的时候忽略外键关系
into table tbl_name
    
    [partition (partition_name [, partition_name] ...)]
    [character set utf8]
    
fields
    terminated by '\t'                   -- 表示每一个字段以 '\t' 分隔
    [optionally] enclosed by '"'     -- 表示所有字段用 '"' 双引号包括着，optionally 表示只有 String 类型的被双引号包含着   
    escaped by '\\'                 -- 表示设置转义字符为 \ 反斜杠
lines
    starting by 'qwer'      -- 表示行开始字符为 'qwer' 导入时忽略
    terminated by '\n'      -- 表示行结尾字符为 \n

    [ignore number {lines | rows}]
    [(col_name_or_user_var[, col_name_or_user_var] ...)]  -- 指定导入到那几列
[
set -- 设置列不是从文件中导入的
    col_name={expr | default}
    [, col_name={expr | default}] ...
]

-- Entire Example
mysql> 
load data local                 -- local 表示吧文件传入服务器再执行导入
infile 'e:/aa.csv' ignore       -- ignore 表示忽略外键关系，一般不使用这个参数，以保证数据完整性
into table tb_user  character set utf8 -- 设置导入的表和字符集
fields terminated by '\t' optionally cnclosed by '"' escaped by '\\' 
lines starting by 'qwer' terminated by '\r\n' ignore 1 lines      -- 忽略第一行
(username, password, @var1)     -- 设置文件中列对应的数据库列，如果设置为 @var1 但是不使用，那么会丢弃该列
set nickname='默认昵称', age=@var1+10       -- 设置不是从文件中直接导入的列的值
partition (parition_name1, partition_name2)  -- 不知道干啥用的，不用


-- Instance
load data local 
infile 'e:/1.csv' 
into table rebuild_1st 
fields terminated by '\t' escaped by '\\' 
lines terminated by '\n' (code, name, degree_code, degree_name, @var);


-- Excel 导入数据库步骤
-- 1. 在 excel 中选取需要导入的数据块，注意一定要要多选出一列，copy
-- 2. 新建一个 excel 文件， 将选出的数据块 paste 到这个文件中
-- 3. 将新建的文件 “另存为” -> “文本文件(制表符分割)(*.txt)”
-- 4. 将另存为的 txt 文件的编码格式改为 utf-8 坑：一定要 UTF-8 NO BOM 格式的
-- 5. 查看文本文件的换行符是哪种；'\r\n' '\n' '\r' 三种；查找 \r 如果有，那么结尾字符应该用 '\r\n'
-- 5. net start mysql （字符界面导入）
-- 6. mysql -u root -p
-- 7. use 需要导入的数据库
-- 8. load data local infile 'e:/tt2.txt' into table tableName fields terminated by '\t';

/******************************* Mysql 数据导出 *******************************/
-- 1. net start mysql
-- 2. use dbname
-- 3. 命令格式
mysql> select * 
into outfile 'e:/output.csv' 
fields 
    terminated by '\t'										-- 设置以 tab 键作为字段分隔标志	
    [optionally] enclosed by '"'							-- 设置字段被 " 包含，如果使用了 optionally 则只有字符串被 " 包含
    escaped by '\\' 										-- 设置 \ 为转义符号
lines 
    terminated by '\n'										-- 每条记录以 \n 结尾
from table_name 
where xingbie="男" 
	
-- 4 修改编码格式为 936 (ANSI/OEM - 简体中文 GBK)
-- 5 打开 excel ，选择 "数据" -> "导入外部数据" -> "选中 D:/man.txt" -> 其中分隔符 选 \t  格式选 纯文本 不要选常规



/******************************* Mysql output .sql ****************************/
shell> mysqldump -u root -p --add-drop-table db_name tb_name1 tb_name2 > e:/dump.sql   # not logged in

/******************************* Mysql execute .sql ***************************/
shell> mysql -u root -p db1 < dump.sql         # not logged in, enclose this command with double quotes in window

shell> mysql -u root -p 

mysql> use db_name;
mysql> source dump.sql;