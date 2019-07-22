Query：
    服务文件：
    shell> systemctl -a list-unit-files                     # 列出所有服务的文件
    
    服务实例：
    shell> systemctl list-units                             # 列出已知的所有服务
    shell> systemctl list-sockets                           # 列出所有服务监听的端口
    shell> systemctl list-timers                            # 列出所有服务的运行时间
    shell> systemctl list-dependencies                      # 列出所有服务的依赖关系
    
    shell> systemctl --failed                                       # 查看启动失败的服务
    shell> systemctl status postfix.service                         # 显示一个服务的状态
    
Operate:
    shell> systemctl start postfix.service                          # 启动一个服务
    shell> systemctl stop postfix.service                           # 关闭一个服务
    shell> systemctl restart postfix.service                        # 重启一个服务

    shell> systemctl enable postfix.service                         # 开机时启动一个服务
    shell> systemctl disable postfix.service                        # 开机时禁用一个服务
    
Create&Update:
    # 以下 /usr/lib/systemd/ /lib/systemd/ /etc/systemd/ 这三个目录是一样的功能，优先级有区别
    shell> touch ~/Desktop/customized.service           # 创建一个 .service 文件
    shell> vim ~/Desktop/customized.service             # 编辑该文件，文件内容参考当前目录下的 customized.service 文件
    shell> cp ~/Desktop/customized.service /usr/lib/systemd/system  # 复制，/usr/lib/systemd/system 目录下存放的都是开机自启动的服务
    shell> chmod 754 /usr/lib/systemd/system/customized.service     # 修改文件的权限
    
Delete:
    shell> rm /usr/lib/systemd/system/customized.service    # 直接删除服务文件即可






