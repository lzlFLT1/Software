shell> lshw -short      # 查看所有硬件摘要信息  

#### Hard Disk   硬盘
    shell> less /proc/partitions    # 查看硬盘分区信息
    shell> lsblk -a     # 查看所有块设备    
    shell> df -ahT
    
    shell> fdisk -l     # 分区工具，适用于 MBR 分区
    shell> gdisk -l     # 分区工具，适用于 GPT 分区
    shell> parted -l    # 分区工具，
    
#### Memery
    shell> less /proc/meminfo   # 查看内存信息
    shell> free -h       # 查看内存使用情况，-h 人类可读模式
    
#### CPU
    shell> less /proc/cpuinfo       # 直接查看文件方式：查看 CPU 信息
    shell> lscpu            # 命令行方式：查看 cpu 信息


#### USB
    shell> lsusb            # 查看 USB 接口的设备信息

#### PCI
    shell> lspci            # 查看所有在 PCI 总线上的设备

#### SCSI
    shell> lsscsi           # 查看 SCSI 控制器设备的信息，如果没有硬件，则不返回信息


 
   
    
    
