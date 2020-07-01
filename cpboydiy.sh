#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: eSirPlayground
# Youtube Channel: https://goo.gl/fvkdwm 
#=================================================
#1. Modify default IP #����Ĭ��IP
sed -i 's/192.168.1.1/192.168.5.1/g' openwrt/package/base-files/files/bin/config_generate

# Add Compile-ID(cid)
cid=$(date "+%Y-%m-%d")
sed -i "s/R20.6.18/R20.6.20[${cid}]/g" openwrt/package/lean/default-settings/files/zzz-default-settings

# �Զ��嶨��ѡ��
#feeds-luci/applications/luci-app-advanced-reboot/luasrc/controller/advanced_reboot.lua
#entry({"admin", "system",


#sed -i 's/\"services\"/\"nas\"/g' openwrt/package/lean/*/luci-app-adguardhome/luasrc/controller/AdGuardHome.lua
#sed -i 's/services/nas/g'  openwrt/package/lean/*/luci-app-adguardhome/luasrc/view/AdGuardHome/AdGuardHome_status.htm

#sed -i 's/\"services\"/\"vpn\"/g' openwrt/package/lean/*/luci-app-clash/luasrc/controller/clash.lua
#sed -i 's/services/vpn/g'  openwrt/package/lean/*/luci-app-clash/luasrc/view/clash/*.htm

#sed -i 's/\""network"\"/\"nas\"/g' openwrt/package/lean/*/luasrc/controller/eqos.lua

#sed -i 's/\"services\"/\"vpn\"/g' openwrt/package/lean/*/luci-app-openclash/files/usr/lib/lua/luci/controller/openclash.lua
#sed -i 's/services/vpn/g'  openwrt/package/lean/*/luci-app-openclash/files/usr/lib/lua\luci/view/openclash/*.htm

#sed -i 's/\"services\"/\"dns\"/g'    openwrt/package/lean/*/luci-app-smartdns/luasrc/controller/smartdns.lua
#sed -i 's/services/dns/g'  openwrt/package/lean/*/luci-app-smartdns/luasrc/view/smartdns/smartdns_status.htm



#sed -i 's/\"services\"/\"vpn\"/g'    openwrt/package/lean/*/luci-app-ssr-plus/luasrc/controller/shadowsocksr.lua
#sed -i 's/services/vpn/g'  openwrt/package/lean/*/luci-app-ssr-plus/luasrc/view/shadowsocksr/*.htm


#sed -i 's/\"services\"/\"dns\"/g'    openwrt/package/lean/*/luci-app-aliddns\luasrc\controller/aliddns.lua



sed -i 's/\"services\"/\"nas\"/g' /usr/lib/lua/luci/controller/aria2.lua
sed -i 's/services/nas/g' /usr/lib/lua/luci/view/aria2/overview_status.htm
sed -i 's/\"services\"/\"nas\"/g' /usr/lib/lua/luci/controller/hd_idle.lua
sed -i 's/\"services\"/\"nas\"/g' /usr/lib/lua/luci/controller/samba.lua
sed -i 's/\"services\"/\"nas\"/g' /usr/lib/lua/luci/controller/minidlna.lua
sed -i 's/\"services\"/\"nas\"/g' /usr/lib/lua/luci/controller/transmission.lua
sed -i 's/\"services\"/\"nas\"/g' /usr/lib/lua/luci/controller/mjpg-streamer.lua
sed -i 's/\"services\"/\"nas\"/g' /usr/lib/lua/luci/controller/p910nd.lua
sed -i 's/\"services\"/\"nas\"/g' /usr/lib/lua/luci/controller/usb_printer.lua
sed -i 's/\"services\"/\"nas\"/g' /usr/lib/lua/luci/controller/xunlei.lua
sed -i 's/services/nas/g'  /usr/lib/lua/luci/view/minidlna_status.htm



sed -i 's@.*CYXluq4wUazHjmCDBCqXF*@#&@g' openwrt/package/lean/default-settings/files/zzz-default-settings #ȡ��ϵͳĬ������
sed -i 's#option commit_interval 24h#option commit_interval 10m#g' openwrt/feeds/packages/net/nlbwmon/files/nlbwmon.config #�޸�����ͳ��д��Ϊ10����
sed -i 's#option database_directory /var/lib/nlbwmon#option database_directory /etc/config/nlbwmon_data#g' openwrt/feeds/packages/net/nlbwmon/files/nlbwmon.config #�޸�����ͳ�����ݴ��Ĭ��λ��
# �滻����haproxyĬ�ϰ汾
rm -rf feeds/packages/net/haproxy && svn co https://github.com/kang-mk/openwrt-app-package/trunk/haproxy feeds/packages/net/haproxy
rm -rf package/lean/luci-app-haproxy-tcp && svn co https://github.com/kang-mk/openwrt-app-package/trunk/luci-app-haproxy-tcp package/lean/luci-app-haproxy-tcp

# luci-app-haproxy������
sed -i 's@stats auth admin:root*@#&@g' openwrt/package/lean/luci-app-haproxy-tcp/root/etc/haproxy_init.sh #ȡ��haproxyĬ������
sed -i 's#stats uri /haproxy#stats uri /#g' openwrt/package/lean/luci-app-haproxy-tcp/root/etc/haproxy_init.sh #�޸�haproxy����·��
sed -i 's#1111#1188#g' openwrt/package/lean/luci-app-haproxy-tcp/root/etc/haproxy_init.sh #�޸�haproxy����˿�
sed -i 's#2222#1181#g' openwrt/package/lean/luci-app-haproxy-tcp/root/etc/haproxy_init.sh #�޸�haproxy����˿�
sed -i 's#frontend ss-in#frontend HAProxy-in#g' openwrt/package/lean/luci-app-haproxy-tcp/root/etc/haproxy_init.sh #�޸�haproxyĬ�Ͻڵ�����
sed -i 's#backend ss-out#backend HAProxy-out#g' openwrt/package/lean/luci-app-haproxy-tcp/root/etc/haproxy_init.sh #�޸�haproxyĬ�Ͻڵ�����
sed -i 's#:1111/haproxy#:1188#g' openwrt/package/lean/luci-app-haproxy-tcp/luasrc/model/cbi/haproxy.lua #�޸�haproxy����˿�
sed -i 's#2222#1181#g' openwrt/package/lean/luci-app-haproxy-tcp/luasrc/model/cbi/haproxy.lua #�޸�haproxy���ؾ���˿�
sed -i 's#�����û���admin##g' openwrt/package/lean/luci-app-haproxy-tcp/luasrc/model/cbi/haproxy.lua #�޸�haproxy����ҳ
sed -i 's#�û���admin##g' openwrt/package/lean/luci-app-haproxy-tcp/luasrc/model/cbi/haproxy.lua #�޸�haproxy����ҳ
sed -i 's#����root##g' openwrt/package/lean/luci-app-haproxy-tcp/luasrc/model/cbi/haproxy.lua #�޸�haproxy����ҳ
sed -i 's#ʹ��˵����##g' openwrt/package/lean/luci-app-haproxy-tcp/luasrc/model/cbi/haproxy.lua #�޸�haproxy����ҳ
sed -i 's#�������##g' openwrt/package/lean/luci-app-haproxy-tcp/luasrc/model/cbi/haproxy.lua #�޸�haproxy����ҳ
