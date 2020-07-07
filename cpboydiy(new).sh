#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: eSirPlayground
# Youtube Channel: https://goo.gl/fvkdwm 
#=================================================

#1. Modify default IP #定制默认IP
#sed -i 's/192.168.1.1/192.168.5.1/g' openwrt/package/base-files/files/bin/config_generate

# Add Compile-ID(cid)
cid=$(date "+%Y-%m-%d")
sed -i "s/R20.6.18/R20.6.20[${cid}] Compiled by cpboy/g" openwrt/package/lean/default-settings/files/zzz-default-settings

#添加自定义源代码

#run: cd openwrt && ./prepareCompile.sh
#chmod +x ./cpboydiy.sh && ./cpboydiy.sh

git clone https://github.com/Lienol/openwrt-package package/openwrt-package
git clone https://github.com/kenzok8/openwrt-packages package/kenzok8
#git clone https://github.com/jerrykuku/luci-app-vssr package/copy/luci-app-vssr
git clone https://github.com/liuwenwv/luci-app-vssr-plus package/copy/luci-app-vssr-plus
git clone https://github.com/Leo-Jo-My/diy package/cpboy/packages  #依赖包
 
#git clone https://github.com/frainzy1477/luci-app-clash package/copy/luci-app-clash       
#git clone -b master --single-branch https://github.com/vernesong/OpenClash package/copy/openclash
#git clone https://github.com/rufengsuixing/luci-app-adguardhome package/copy/luci-app-adguardhome
#git clone https://github.com/garypang13/luci-app-eqos package/copy/luci-app-eqos     

#git clone -b 18.06 --single-branch https://github.com/jerrykuku/luci-theme-argon package/copy/luci-theme-argon--cpboy-mod
git clone https://github.com/esirplayground/luci-theme-atmaterial-ColorIcon package/copy/luci-theme-atmaterial-ColorIcon
git clone https://github.com/Leo-Jo-My/luci-theme-Butterfly-dark  package/cpboy/luci-theme-Butterfly-dark 
git clone https://github.com/xiaoqingfengATGH/luci-theme-infinityfreedom package/copy/luci-theme-infinityfreedom       

rm -rf package/openwrt-package/package/dns2socks
rm -rf package/openwrt-package/package/ipt2socks
rm -rf package/openwrt-package/package/kcptun
rm -rf package/openwrt-package/package/pdnsd-alt
rm -rf package/openwrt-package/package/shadowsocksr-libev
rm -rf package/openwrt-package/package/simple-obfs
rm -rf package/openwrt-package/package/v2ray
rm -rf package/lean/v2ray-plugin
rm -rf package/lean/luci-app-verysync
rm -rf package/lean/luci-app-guest-wifi
rm -rf package/lean/luci-app-kodexplorer
rm -rf package/lean/luci-app-pppoe-relay
rm -rf package/lean/luci-app-ramfree
rm -rf package/lean/luci-app-softethervpn
rm -rf package/lean/luci-app-v2ray-server

rm -rf package/kenzok8/luci-app-passwall
rm -rf package/kenzok8/microsocks
rm -rf package/kenzok8/redsocks2
rm -rf package/cpboy/packages/dnscrypt-proxy-full
rm -rf package/cpboy/packages/openwrt-dnsforwarder
rm -rf package/cpboy/packages/openwrt-simple-obfs
rm -rf package/cpboy/packages/openwrt-v2ray-plugin

# 再次更新并安装源
./scripts/feeds clean
./scripts/feeds update -a && ./scripts/feeds install -a


# #自定义定制选项--修改插件分类 
sed -i 's/\"services\"/\"control\"/g' ./package/lean/luci-app-accesscontrol/luasrc/controller/mia.lua
sed -i 's/services/control/g'  ./package/lean/luci-app-accesscontrol/luasrc/view/mia/mia_status.htm

sed -i 's/\"system\"/\"control\"/g' ./package/lean/luci-app-autoreboot/luasrc/controller/autoreboot.lua

sed -i 's/\"services\"/\"dns\"/g' ./feeds/kenzok8/luci-app-adguardhome/luasrc/controller/AdGuardHome.lua
sed -i 's/services/dns/g' |xargs grep services -rl ./feeds/kenzok8/luci-app-adguardhome/luasrc/view/AdGuardHome/*.htm


sed -i 's/\"services\"/\"vpn\"/g' ./feeds/kenzok8/luci-app-clash/luasrc/controller/clash.lua
sed -i 's/services/vpn/g' |xargs grep services -rl ./feeds/kenzok8/luci-app-clash/luasrc/view/clash/*.htm

sed -i 's/\"services\"/\"vpn\"/g' ./feeds/kenzok8/luci-app-openclash/files/usr/lib/lua/luci/controller/openclash.lua
sed -i 's/services/vpn/g' |xargs grep services -rl ./feeds/kenzok8/luci-app-openclash/files/usr/lib/lua/luci/view/openclash/*.htm


sed -i 's/\"services\"/\"dns\"/g' ./feeds/kenzok8/luci-app-aliddns/luasrc/controller/aliddns.lua