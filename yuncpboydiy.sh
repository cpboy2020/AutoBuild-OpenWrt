#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: cpboy
#=================================================

#1. Modify default IP #定制默认IP
#sed -i 's/192.168.1.1/192.168.5.1/g' openwrt/package/base-files/files/bin/config_generate

#2. Add Compile-ID(cid)
#cid=$(date "+%Y-%m-%d")
#sed -i "s/R20.6.18/R20.6.20[${cid}] Compiled by cpboy/g" openwrt/package/lean/default-settings/files/zzz-default-settings

#3.添加自定义源代码
#git clone https://github.com/fw876/helloworld package/cpboy
git clone https://github.com/Lienol/openwrt-package package/lienol-package
git clone https://github.com/kenzok8/openwrt-packages package/kenzok8
#git clone https://github.com/jerrykuku/luci-app-vssr package/copy/luci-app-vssr
git clone https://github.com/liuwenwv/luci-app-vssr-plus package/copy/luci-app-vssr-plus
git clone https://github.com/Leo-Jo-My/diy package/cpboy/packages  #依赖包
git clone https://github.com/tty228/luci-app-serverchan package/cpboy/luci-app-serverchan

 #git clone https://github.com/frainzy1477/luci-app-clash package/copy/luci-app-clash
 #git clone -b master --single-branch https://github.com/vernesong/OpenClash package/copy/openclash
 #git clone https://github.com/rufengsuixing/luci-app-adguardhome package/copy/luci-app-adguardhome
 #git clone https://github.com/garypang13/luci-app-eqos package/copy/luci-app-eqos
    
 rm -rf package/lienol-package/package/dns2socks
 rm -rf package/lienol-package/package/ipt2socks
 rm -rf package/lienol-package/package/kcptun
 rm -rf package/lienol-package/package/pdnsd-alt
 rm -rf package/lienol-package/package/shadowsocksr-libev
 rm -rf package/lienol-package/package/simple-obfs
 rm -rf package/lienol-package/package/v2ray
 
 rm -rf package/lean/v2ray-plugin
 rm -rf package/lean/luci-app-verysync
 rm -rf package/lean/luci-app-guest-wifi
 rm -rf package/lean/luci-app-kodexplorer
 rm -rf package/lean/luci-app-pppoe-relay
 rm -rf package/lean/luci-app-ramfree
 rm -rf package/lean/luci-app-softethervpn
 rm -rf package/lean/luci-app-v2ray-server
         
 rm -rf package/kenzok8/luci-app-passwall
 rm -rf package/kenzok8/luci-app-ssr-plus
 rm -rf package/kenzok8/microsocks
 rm -rf package/kenzok8/redsocks2
 rm -rf package/cpboy/packages/openwrt-dnsforwarder
 rm -rf package/cpboy/packages/openwrt-simple-obfs
 rm -rf package/cpboy/packages/openwrt-v2ray-plugin

#替换自带argon主题。
cd package/lean
rm -rf luci-theme-argon
cd openwrt
#git clone -b 18.06 --single-branch https://github.com/jerrykuku/luci-theme-argon package/copy/luci-theme-argon--cpboy-mod
git clone https://github.com/esirplayground/luci-theme-atmaterial-ColorIcon package/copy/luci-theme-atmaterial-ColorIcon
git clone https://github.com/Leo-Jo-My/luci-theme-Butterfly-dark  package/cpboy/luci-theme-Butterfly-dark
git clone https://github.com/xiaoqingfengATGH/luci-theme-infinityfreedom package/copy/luci-theme-infinityfreedom

# 更新feeds文件
sed -i 's@#src-git helloworld@src-git helloworld@g' feeds.conf.default #启用helloworld
cat feeds.conf.default

# 再次更新并安装源
./scripts/feeds clean
./scripts/feeds update -a && ./scripts/feeds install -a


# #自定义定制选项--修改插件分类 
sed -i 's/\"services\"/\"dns\"/g' openwrt/package/kenzok8/luci-app-adguardhome/luasrc/controller/AdGuardHome.lua
sed -i 's/services/dns/g' |xargs grep services -rl openwrt/package/kenzok8/luci-app-adguardhome/luasrc/view/AdGuardHome/*.htm

sed -i 's/\"services\"/\"vpn\"/g' openwrt/package/kenzok8/luci-app-clash/luasrc/controller/clash.lua
sed -i 's/\"services\"/\"vpn\"/g' openwrt/package//kenzok8/luci-app-clash/luasrc/model/cbi/clash/*/*.lua
sed -i 's/services/vpn/g' |xargs grep services -rl openwrt/package/kenzok8/luci-app-clash/luasrc/view/clash/*.htm

sed -i 's/\"services\"/\"vpn\"/g' openwrt/package/kenzok8/luci-app-openclash/files/usr/lib/lua/luci/controller/openclash.lua
sed -i 's/\"services\"/\"vpn\"/g' openwrt/package/kenzok8/luci-app-openclash/files/usr/lib/lua/luci/model/cbi/openclash/*.lua
sed -i 's/services/vpn/g' |xargs grep services -rl openwrt/package/kenzok8/luci-app-openclash/files/usr/lib/lua/luci/view/openclash/*.htm

sed -i 's/\"services\"/\"dns\"/g' openwrt/package/kenzok8/luci-app-aliddns/luasrc/controller/aliddns.lua

sed -i 's/\"services\"/\"dns\"/g' openwrt/package/kenzok8/luci-app-smartdns/luasrc/controller/smartdns.lua
sed -i 's/services/dns/g' openwrt/package/kenzok8/luci-app-smartdns/luasrc/view/smartdns/smartdns_status.htm

sed -i 's/\"services\"/\"control\"/g' openwrt/package/lean/luci-app-accesscontrol/luasrc/controller/mia.lua
sed -i 's/services/control/g'  openwrt/package/lean/luci-app-accesscontrol/luasrc/view/mia/mia_status.htm

sed -i 's/\"system\"/\"control\"/g' openwrt/package/lean/luci-app-autoreboot/luasrc/controller/autoreboot.lua

sed -i 's/\"services\"/\"dns\"/g' openwrt/package/lean/luci-app-dnsforwarder/luasrc/controller/dnsforwarder.lua

sed -i 's/\"services\"/\"nas\"/g' openwrt/package/lean/luci-app-familycloud/luasrc/controller/familycloud.lua
sed -i 's/services/nas/g' openwrt/package/lean/luci-app-familycloud/luasrc/view/familycloud/familycloud_status.htm

#sed -i 's/\"services\"/\"vpn\"/g' openwrt/feeds/helloworld/luci-app-ssr-plus/luasrc/controller/shadowsocksr.lua
#sed -i 's/services/vpn/g' |xargs grep services -rl openwrt/feeds/helloworld/luci-app-ssr-plus/luasrc/view/shadowsocksr/*.htm

#sed -i 's/\""network"\"/\"nas\"/g' openwrt/package/lean/*/luasrc/controller/eqos.lua
