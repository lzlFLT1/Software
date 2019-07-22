# 假设一个 HelloWorld.java 文件，保存在 /root/home/kasei/haku 目录下
# 内容为
# package kasei.haku
# public class HelloWorld {
#   public static void main() { 
#       System.out.println("Hello World!");   
#   }
# }



# 1. 编译 .java 文件
shell> cd /root/home/kasei/haku
shell> javac HelloWorld.java    # 会在当前目录产生一个 HelloWorld.class 文件

# 2. 运行 .class 文件
shell> cd /root/home
shell> java kasei.haku.HelloWorld

# 解释：
# java 命令会根据 CLASSPATH 环境变量 中的路径寻找 .class 文件， CLASSPATH=.:%JAVA_HOME%/lib
# 如果 .class 文件的包路径为 package kasei.haku
# 如果在 /root/home/kasei/haku 目录下执行 java kasei.haku.HelloWorld 命令
# java 命令会从 /root/home/kasei/haku/kasei/haku 路径下找 HelloWorld.class 文件，那么就会找不到，报错

# 3. 打 jar 包

# 4. 运行 jar 包
shell> java -jar .\procyon-decompiler.jar %%a -o .\source # 运行一个 jar 包，后面的是该 jar 包运行传入的参数



# 5. jdk 自带的文件编码转换工具
shell> native2ascii -encoding GBK file1 file2 # 将 GBK 编码的 file1 转成 unicode 编码的 file2，如果省略 GBK 那么表示 file1 是操作系统默认的编码格式
shell> native2ascii -reverse -encoding utf8 file1 file2 # 将 unicode 编码的文件（file1）转成 utf-8 编码的文件 （file2），如果省略 UTF8 那么转成操作系统默认的编码格式


# jdk 查看 .class 文件的字节码
shell> javap -verbose HelloWorld.class 



