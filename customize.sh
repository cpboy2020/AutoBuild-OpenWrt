#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: eSirPlayground
# Youtube Channel: https://goo.gl/fvkdwm 
#=================================================
#1. Modify default IP #定制默认IP
sed -i 's/192.168.1.1/192.168.5.1/g' openwrt/package/base-files/files/bin/config_generate

# Add Compile-ID(cid)
cid=$(date "+%Y-%m-%d")
sed -i "s/R20.5.20/R20.5.20[${cid}]/g" openwrt/package/lean/default-settings/files/zzz-default-settings

# 自定义定制选项
sed -i 's@.*CYXluq4wUazHjmCDBCqXF*@#&@g' openwrt/package/lean/default-settings/files/zzz-default-settings #取消系统默认密码
sed -i 's#option commit_interval 24h#option commit_interval 10m#g' openwrt/feeds/packages/net/nlbwmon/files/nlbwmon.config #修改流量统计写入为10分钟
sed -i 's#option database_directory /var/lib/nlbwmon#option database_directory /etc/config/nlbwmon_data#g' openwrt/feeds/packages/net/nlbwmon/files/nlbwmon.config #修改流量统计数据存放默认位置

# luci-app-haproxy定制项
sed -i 's@stats auth admin:root*@#&@g' openwrt/package/lean/luci-app-haproxy-tcp/root/etc/haproxy_init.sh #取消haproxy默认密码
sed -i 's#stats uri /haproxy#stats uri /#g' openwrt/package/lean/luci-app-haproxy-tcp/root/etc/haproxy_init.sh #修改haproxy管理路径
sed -i 's#1111#1188#g' openwrt/package/lean/luci-app-haproxy-tcp/root/etc/haproxy_init.sh #修改haproxy管理端口
sed -i 's#2222#1181#g' openwrt/package/lean/luci-app-haproxy-tcp/root/etc/haproxy_init.sh #修改haproxy管理端口
sed -i 's#frontend ss-in#frontend HAProxy-in#g' openwrt/package/lean/luci-app-haproxy-tcp/root/etc/haproxy_init.sh #修改haproxy默认节点名称
sed -i 's#backend ss-out#backend HAProxy-out#g' openwrt/package/lean/luci-app-haproxy-tcp/root/etc/haproxy_init.sh #修改haproxy默认节点名称
sed -i 's#:1111/haproxy#:1188#g' openwrt/package/lean/luci-app-haproxy-tcp/luasrc/model/cbi/haproxy.lua #修改haproxy管理端口
sed -i 's#2222#1181#g' openwrt/package/lean/luci-app-haproxy-tcp/luasrc/model/cbi/haproxy.lua #修改haproxy负载均衡端口
sed -i 's#输入用户名admin##g' openwrt/package/lean/luci-app-haproxy-tcp/luasrc/model/cbi/haproxy.lua #修改haproxy管理页
sed -i 's#用户名admin##g' openwrt/package/lean/luci-app-haproxy-tcp/luasrc/model/cbi/haproxy.lua #修改haproxy管理页
sed -i 's#密码root##g' openwrt/package/lean/luci-app-haproxy-tcp/luasrc/model/cbi/haproxy.lua #修改haproxy管理页
sed -i 's#使用说明请##g' openwrt/package/lean/luci-app-haproxy-tcp/luasrc/model/cbi/haproxy.lua #修改haproxy管理页
sed -i 's#点击这里##g' openwrt/package/lean/luci-app-haproxy-tcp/luasrc/model/cbi/haproxy.lua #修改haproxy管理页
