# 创建 java 项目目录结构
cd /root/JavaProjects/MavenWeb
# 在 MavenWeb 目录下创建如下文件结构
MavenWeb
	├─ pom.xml 
	├─ target   //存放运行生成的文件
	└─ src
		├─ test
		│	└─ java
		│		└─ 自定义包
		│
		│
		└─ main
			├─ webapp   
			├─ resources   //存放资源文件
			└─ java
				└─ 自定义包	
				

# 常用 Maven 命令
cd /root/JavaProjects/MavenWeb	
mvn archetype:generate  # 生成骨架
mvn archetype:create -DgroupId=packageName -DartifactId=projectName  # 创建Maven的普通java项目
mvn archetype:create -DgroupId=packageName -DartifactId=webappName -DarchetypeArtifactId=maven-archetype-webapp # 创建Maven的Web项目
mvn compile                     # 该命令将编译项目，并把 .class 文件放入到 	../MavenWeb/target 目录下
mvn exec:java -Dexec.mainClass="hello.HelloWorld"   # 运行 maven 项目
mvn package                     # 打包项目，生成 .jar 或 .war 文件放入到 ../MavenWeb/target 目录下
mvn clean                       # 删除 ../MavenWeb/target 目录下所有东西
mvn install                     # 将  ../MavenWeb/target 目录下的 .jar 或 .war 提交到本地仓库中，供其他项目使用
mvn deploy                      # 将代码发布到远程仓库

mvn test-compile                # 编译测试代码
mvn test                        #  运行测试


mvn eclipse:eclipse             # 生成eclipse项目
mvn idea:idea                   # 生成idea项目



 