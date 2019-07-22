进程基本概念：
    Linux Process Status
        # D 不可中断 uninterruptible sleep (usually IO)(收到信号不唤醒和不可运行, 进程必须等待直到有中断发生)
        # R 运行 runnable (on run queue)(正在运行或在运行队列中等待)
        # S 中断 sleeping(休眠中, 受阻, 在等待某个条件的形成或接受到信号)
        # T 停止 traced or stopped(进程收到SIGSTOP, SIGTSTP, SIGTTIN, SIGTTOU信号后停止运行运行)
        # Z 僵死 a defunct ("zombie") process(进程已终止, 但进程描述符存在, 直到父进程调用wait4()系统调用后释放)


查看进程打开的文件：
    shell> lsof -h              # 获取帮助信息
 
    shell> lsof -a              # 显示所有进程打开的所有文件
    
    shell> lsof aa.txt          # 显示在使用 aa.txt 文件的所有进程
    shell> lsof -d 4            # 显示在使用文件描述符为 4 的文件的 所有进程
    shell> lsof +d /usr/local   # 显示该目录下被进程打开的文件
    shell> lsof +D /usr/local   # 显示该目录及其子目录下被进程打开的所有文件
       
    
    shell> lsof -c abc          # 显示 abc 进程当前打开的所有文件
    shell> lsof -p 1234         # 显示 进程号为 1234 的进程所打开的所有文件
    
    
    
    shell> lsof -u 12           # 显示 UID 为 12 的用户的所有进程
    shell> lsof -g 12           # 显示 GID 为 12 的用户组内用户的所有进程


    shell> lsof -i[46] [protocol][@hostname|hostaddr][:service|port]
        46 --> IPv4 or IPv6
        protocol --> TCP or UDP
        hostname --> Internet host name
        hostaddr --> IPv4 地址
        service --> /etc/service中的 service name (可以不止一个)
        port --> 端口号 (可以不止一个)

进程前后台切换：
    shell> ping 8.8.8.8 &           # 命令最后的 & 表示把这个命令放到后台执行，关闭当前终端，这个后台执行的命令也会被 kill 掉
    Ctrl+Z                          # 将当前终端正在前台执行的命令放到后台，并处于暂停状态
    shell> jobs                     # 查看当前有多少在后台运行的命令
    shell> fg %jobnumber            # 将指定的 命令号 的命令调到前台运行
    shell> bg %jobnumber            # 将指定的 命令号的 后台暂停的命令，变成后台执行
    
将进程放入后台执行，且不受当前终端关闭影响
    # 不挂断的运行，注意并没有后台运行的功能，即 nohup 运行命令不会受终端关闭的影响，需要配合输出重定向使用
    # 不挂断的运行命令，并将 标准输出 和 标准错误输出 重定向到 /dev/null 文件，且该条命令在后台运行
    shell> nohup command 1>/dev/null 2>&1 &  
    
    shell> setsid command       # 在一个新会话中执行该命令
    
    shell> (command &)          # 将命令放在一个子shell 的后台去执行，这会造成该命令的父进程为 init(1) 进程，所以不会被关闭
    
    # 用于使已经运行的后台 job，忽略 HUP 信号
    shell> disown -h %jobnumber  # 使某个 job 忽略 HUP 信号
    shell> disown -ah           # 使所有 job 忽略 HUP 信号
    # 如果某个进程已经在前台运行了，需要这个进程忽略 HUP 信号
    Ctrl+Z   # 将前台命令放到后台，再执行 disown 命令即可
    shell> disown -h %jobnumber
    
    
    
杀死进程：
    Ctrl+C                          # 终止前台正在执行的命令
    shell> kill %jobnumber          # 通过 job 命令查看 job 号，然后 kill
    
       
    
    shell> kill -l                         # 显示信号列表
    shell> kill [-信号] <PID>                # kill -9 1234：终止PID(进程号)为1234 的进程
    
    shell> ps -ef| grep 'sshd: root@pts' | grep -v 'grep'| cut -c 10-15 | xargs kill -9 

    
查看进程：
    shell> ps -e                   # 查看所有进程
    shell> ps -ef                  # 显示所有进程信息，连同命令行
    shell> pstree                          # 树形结构显示进程

    shell> top                     # 实时显示进程状态，q 退出该程序
            <空格> 立即刷新显示
            h 或者? 显示帮助画面给出一些简短的命令总结说明
            m 切换显示内存信息
            t 切换显示进程和CPU状态信息
            c 切换显示命令名称和完整命令行
            M 根据驻留内存大小进行排序
            P 根据CPU使用百分比大小进行排序
            q 退出





