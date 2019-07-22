/** todo Gradle 中两个概念，Project 和 Task
 * Project 表示一个项目，就是你想要做的某一件事
 * Task 表示运行 Gradle 时执行的操作
 * */
 
 /** todo 创建一个 Gradle 构建任务
  * shell> gradle -q hello    # 使用该命令运行这个任务，-q quiet 不打印 gradle 自身的 log
  * */
task hello {
    doLast {
        println 'Hello world!'
    }
}
