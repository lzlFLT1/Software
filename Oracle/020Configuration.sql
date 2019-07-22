/** todo Oracle Database Context Parameters: Oracle 数据库上下文环境参数 */
SQL> select * from v$parameter;         -- 查看所有参数
SQL> alter system set paramName=value COMMENT '' deferred SCOPE={ MEMORY | SPFILE | BOTH } SID={'sid'|*};  -- 修改参数

