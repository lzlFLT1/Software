# clear
iptables -t nat -F V2RAY    # delete all rule of the chain that named V2RAY
iptables -t nat -F
iptables -t nat -X    # delete chain V2RAY

# 将 V2RAY 链配置到内建 OUTPUT 链上
iptables -t nat -N V2RAY    # create a chain named V2RAY
iptables -t nat -A OUTPUT -p tcp -j V2RAY   # 如果输出的协议是 tcp 那么跳转到 V2RAY 
iptables -t nat -A OUTPUT -p udp -j V2RAY

# 编辑 V2RAY 链的规则
iptables -t nat -A V2RAY -d 66.98.122.202/32 -j RETURN     # 如果数据包的目的地址是自己的 VPS，那么不需要转发

 
iptables -t nat -A V2RAY -d 127.0.0.0/8 -j RETURN       
iptables -t nat -A V2RAY -d 192.168.0.0/16 -j RETURN    # 192.168 带头的 IP 地址都不转发

iptables -t nat -A V2RAY -p tcp -j REDIRECT --to-port 12345
iptables -t nat -A V2RAY -p udp -j REDIRECT --to-port 12345
