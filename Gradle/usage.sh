################################ Gradle 的基本使用
1. 创建一个 gradle 空项目
    shell> mkdir GradleDemo
    shell> cd GradleDemo
    shell> gradle init

# 以下是创建的目录结构  
.
├── build.gradle    # gradle 的构建脚本
├── settings.gradle # gradle 的配置文件
├── gradle
│   └── wrapper
│       ├── gradle-wrapper.jar  # wrapper 用于下载 gradle distribution 的 jar 包
│       └── gradle-wrapper.properties # 配置文件，指定 wrapper 运行时的行为
├── gradlew # 用 wrapper 构建项目的脚本， *nux 下的 
└── gradlew.bat # 用 wrapper 构建项目的脚本， windows 下的 

2. 查看所有当前项目中所有 task
    shell> ./gradlew tasks

3. 执行一个 gradle task
    shell> ./gradlew taskName
    
4. 查看当前项目中所有 attribute
    shell> ./gradlew properties


################################ Gradle wrapper 的使用
1. 创建一个空目录
    shell> mkdir GradleWrapper
    shell> cd GradleWrapper
    shell> gradle wrapper



2. 用 wrapper build 一个 java 项目
    shell> gradlew build        # *nux
    shell> gradlew.bat build    # windows

################################ Gradle 命令行的使用， 以下命令都可以使用 ./gradlew 或 ./gradlew.bat 替换
    shell> gralde [taskName1 taskName2 ...] [--optionName1=value1 --optionName2 --no-optionName3]
    # 多任务 用 space 分隔
    # 有值的 option 用 = 号赋值
    # 无值的 option 前面加 --no- 表示相反的操作
    shell> gradle taskName --console=plain --build-cache --no-build-cache --help
    
    # 多模块项目构建时，在 rootProject 目录下执行命令
    shell> gradle :mySubProject:taskName # 会执行子模块的任务
    shell> gradle taskName  # 会为所有 project（包括 root 和 sub project） 执行该任务
    
    # 进入 subProject 目录后执行命令
    shell> cd muSubProject 
    shell> gradle taskName # 只会执行 subProject 的任务
    # 注意 上面这条命令 替换成 gradlew 是如下形式的别搞错了
    shell> ../gradlew taskName
    
    
    # 不包括某一个 task 
    shell> gradle taskName --exclude-task otherTaskName
    shell> gradle taskName -rerun-tasks   # 修改完任务，还是按原来的任务执行
    shell> gradle taskName --continue # 当执行时，遇到错误时继续执行，以便查看是否其他地方还有错误
    
    
    ##### gradle 约定好应该存在的任务
    shell> gradle clean # 清除 build 目录下的内容
    shell> gradle build # 构建项目
    shell> gradle run   # 执行构建好的项目
    
    shell> gradle check # 执行所有验证类型呢的 task

    #### gradle build-in task 内建任务
    shell> gradle projects      # 列出你所在项目下的所有 subProject
    shell> gradle tasks         # 列出你所在项目下的所有 task
    shell> gradle tasks --all   # 上面命令只会列出所有被分到特定 task group 中的任务，该命令则显示所有 task
    shell> gradle help --task taskName  # 显示任务的用法
    shell> gralde taskName --scan   # 查看当前任务的依赖
    
    shell> gradle dependencies  # 查看当前所在目录的项目的依赖
    shell> gradle buildEnviorment # 查看构建时的依赖
    shell> gradle dependencyInsight # 提示你所需要的依赖
    shell> gradle properties # 查看当前项目的所有属性
    
    
    
    