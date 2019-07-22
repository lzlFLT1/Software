
set transaction isolation level serializable read write name 'tran'; -- 开启一个事务

savepoint a; -- 创建保存点

rollback; -- 回滚事务
rollback to a; -- 回滚部分事务
COMMIT [ WORK ] [ COMMENT clause ] [ WRITE clause ] [ FORCE clause ]; -- 提交一个事务

