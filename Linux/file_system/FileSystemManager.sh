################################## CentOS7 文件系统 ############################
# 查看类 ##############################
du -sh /root        # 显示 /root 目录的大小，-s 只显示总计
du -sb /root/a.txt  # 显示文件大小，单位 Byte
du -ch --max-depth=1 /path       # 表示列出 /path 目录及其第一级子目录的大小

# 相关指令 #############################
mkfs -t ext4 /dev/usb                             # 格式化操作，在设备上创建文件系统


# 查找类 ###############################
pwd                                                 # 查看当前工作目录绝对路径
ls -al [path]                                       # 查看指定路径下所有文件，省略路径代表当前路径
file -i <file>                                      # 显示文件 MIME 类型，和文件字符编码格式
stat <file>                                         # 查看文件信息
stat -f <file>                                      # 查看磁盘信息
whereis mysql                                       # 查看 mysql 的安装路径
which command1                                      # 查看 command1 命令执行文件所在的路径

find -P
find -L
find -H         # 针对软链接的处理方式
find -D help    # 调试用
find -O3        # 断言 的执行优先级类型
find -not exp
find exp1 -and exp2
find exp1 -or exp2
find exp1, exp2     # 用于不同类型的搜索，比如 文件名 和 创建时间，或的关系
        exp = operator + option + test + action
find -P -D tree -O3 /etc (-regextype posix-extended -iname *.bat) -or (-xtype d) -exec command {}+






                                                    
# 新建类 ###############################             
mkdir -p -m 755 test1/test2/test3/test4             # 递归创建目录并设定权限
touch /home/1.txt                                   # 如果文件已存在则更新时间，否则创建空文件
ln -s ./aa ./bb                                     # 创建 ./aa 的符号链接 ./bb
                                                    
                                                    
# 删除类 ###############################             
rm -r xxx                                           # 删除 xxx 文件或目录
rm -f xxx                                           # 删除，不提示任何信息
                                                    
                                                    
# 操作修改类 ###########################              
cd -                                                # 切换到上一次操作的目录
cd .                                                # 当前目录
cd ..                                               # 切换到父目录


cp /source /destination/                            # 复制文件或目录，如果目标是一个目录，那复制到目标目录下，如果目标地址不存在，则复制到上一层，并重命名
cp /source /destination/newfilename                 # 复制文件，并重命名
cp -i /source /destination/                         # 复制过程中如果出现覆盖，则提示
cp -v /source /destination/                         # 显示复制过程中做了哪些操作
cp -r /source /destination/                         # 递归复制


mv -i /source /destination/                         # 覆盖前提示

                                                    
tar -cf xx1.tar xx2 xx3 ..                          # xx2，xx3打包成xx1
tar -xf xxx.tar -C ./3                              # 拆包，-C 只当拆包到哪个目录
                                                    
zip                                                 # 压缩 
unzip -d ./unzip filename                           # 将文件解压到当前目录下的 unzip 文件夹下
                                                    
chown -R oracle:dba /home/oracle                    # 更改文件夹属主为 oracle:dba
chgrp                                               # 修改文件属组
chmod -R 775 file                                   # 递归更改文件属性
                                                    
iconv -l                                             # 查看所有可用的字符编码格式
iconv -f GB2312 -t UTF-8 file1 -o file2             # 将 file1 从 GB2312 格式转化到 UTF-8 格式，并输出到 file2 中
                                                    
rename <be_replaced> <replace> ggh*.txt             # 通配符 * ? [g] 表示单个确定的字符
rename "s/.html/.jsp/" *                            # 把所有文件名中的 .html 换成 .jsp
                                                    
dirname path1                                       # 获取目录名称
                                                    
dd if=/dev/zero of=sun.txt bs=1M count=1            # 复制字节到指定文件
    if=path                                         # 代表输入文件。如果不指定if，默认就会从stdin中读取输入。
    of=path                                         # 代表输出文件。如果不指定of，默认就会将stdout作为默认输出。
    bs=1M                                           # 表示每次读入 1M ，每次输出 1M，相当于同时设置 ibs 和 obs 两个参数为 1M
    count=2                                         # 设置要读多少个 1M
                                                    
                                                    
                                                    
# 内容类 ###############################             
cat <file>                                          # 一次性查看全部文件内容
less <file>                                         # 查看文件内容，space 下翻页， b 上翻页，q 退出当前命令
tail -10 -f file                                    # 读取文件最后 10 行并实时更新
head -10                                            # 读取文件前 10 行
vi <file>                                           # vi 文本编辑器





