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

date=`date +%m.%d.%Y`
sed -i "s/DISTRIB_DESCRIPTION.*/DISTRIB_DESCRIPTION='%D Compiled by cpboy'/g" package/base-files/files/etc/openwrt_release
sed -i "s/# REVISION:=x/REVISION:= $date/g" include/version.mk

#3.添加自定义源代码

git clone https://github.com/Lienol/openwrt-package package/lienol-package
git clone https://github.com/kenzok8/openwrt-packages package/kenzo

git clone https://github.com/lisaac/luci-app-dockerman package/cpboy/luci-app-dockerman
git clone https://github.com/lisaac/luci-lib-docker package/cpboy/packages/luci-lib-docker #git luci-app-dockerman 依赖

#git clone https://github.com/liuwenwv/luci-app-vssr-plus package/copy/luci-app-vssr-plus
#git clone https://github.com/Leo-Jo-My/diy package/cpboy/packages  #依赖包

#git clone https://github.com/tty228/luci-app-serverchan package/cpboy/luci-app-serverchan
#git clone https://github.com/jerrykuku/luci-app-vssr package/copy/luci-app-vssr
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
         
rm -rf package/kenzo/luci-app-passwall
rm -rf package/kenzo/luci-app-ssr-plus
rm -rf package/kenzo/microsocks
rm -rf package/kenzo/redsocks2
rm -rf package/cpboy/packages/openwrt-dnsforwarder
rm -rf package/cpboy/packages/openwrt-simple-obfs
rm -rf package/cpboy/packages/openwrt-v2ray-plugin

#替换自带argon主题。

rm -rf package/lean/luci-theme-argon

git clone https://github.com/xiaoqingfengATGH/luci-theme-infinityfreedom package/cpboy/luci-theme-infinityfreedom
git clone https://github.com/esirplayground/luci-theme-atmaterial-ColorIcon package/cpboy/luci-theme-atmaterial-ColorIcon
git clone https://github.com/Leo-Jo-My/luci-theme-Butterfly-dark package/cpboy/luci-theme-Butterfly-dark
git clone https://github.com/siropboy/luci-theme-btmod.git package/cpboy/luci-theme-btmod

cd openwrt

cp -rf ./dns.lua ./feeds/luci/modules/luci-mod-admin-full/luasrc/controller/admin

# 更新feeds文件
sed -i 's/#src-git helloworld/src-git helloworld/g' ./feeds.conf.default #启用helloworld
cat feeds.conf.default
# 再次更新并安装源
./scripts/feeds clean
./scripts/feeds update -a && ./scripts/feeds install -a


# #自定义定制选项--修改插件分类 

#sed -i s/yyyy/xxxx/g `grep yyyy -rl --include="*.txt" ./`
#作用：将当前目录(包括子目录)中所有txt文件中的yyyy字符串替换为xxxx字符串

#sed -i 's/\"services\"/\"nas\"/g' `grep \"services\" -rl --include="*.lua" path`
#sed -i 's/services/nas/g' `grep services -rl --include="*.htm" path`


sed -i 's/\"services\"/\"control\"/g' `grep \"services\" -rl --include="*.lua" ./package/lean/luci-app-accesscontrol/`
sed -i 's/services/control/g' `grep services -rl --include="*.htm" ./package/lean/luci-app-accesscontrol/`

sed -i 's/\"system\"/\"control\"/g' `grep \"services\" -rl --include="*.lua" ./package/lean/luci-app-autoreboot/`

sed -i 's/\"services\"/\"dns\"/g' `grep \"services\" -rl --include="*.lua" ./package/lean/luci-app-dnsforwarder/`
sed -i 's/services/dns/g' `grep services -rl --include="*.htm" ./package/lean/luci-app-dnsforwarder/`


sed -i 's/\"services\"/\"nas\"/g' `grep \"services\" -rl --include="*.lua" ./package/lean/luci-app-familycloud/`
sed -i 's/services/nas/g' `grep services -rl --include="*.htm" ./package/lean/luci-app-familycloud/`

sed -i 's/\"services\"/\"nas\"/g' `grep \"services\" -rl --include="*.lua" ./package/lean/luci-app-xlnetacc/`
sed -i 's/services/nas/g' `grep services -rl --include="*.htm" ./package/lean/luci-app-xlnetacc/`


sed -i 's/\"services\"/\"vpn\"/g' `grep \"services\" -rl --include="*.lua" ./feeds/helloworld/luci-app-ssr-plus/`
sed -i 's/services/vpn/g' `grep services -rl --include="*.lua" ./feeds/helloworld/luci-app-ssr-plus/`
sed -i 's/services/vpn/g' `grep services -rl --include="*.htm" ./feeds/helloworld/luci-app-ssr-plus/`

sed -i 's/\"services\"/\"dns\"/g' `grep \"services\" -rl --include="*.lua" ./feeds/luci/applications/luci-app-ddns/`
sed -i 's/services/dns/g' `grep services -rl --include="*.htm" ./feeds/luci/applications/luci-app-ddns/`

sed -i 's/\"services\"/\"dns\"/g' `grep \"services\" -rl --include="*.lua" ./feeds/luci/applications/luci-app-dnscrypt-proxy/`
sed -i 's/services/dns/g' `grep services -rl --include="*.htm" ./feeds/luci/applications/luci-app-dnscrypt-proxy/`

sed -i 's/\"services\"/\"control\"/g' `grep \"services\" -rl --include="*.lua" ./feeds/luci/applications/luci-app-wol/`

sed -i 's/\"services\"/\"vpn\"/g' `grep \"services\" -rl --include="*.lua" ./feeds/luci/applications/luci-app-ocserv/`
sed -i 's/services/vpn/g' `grep services -rl --include="*.htm" ./feeds/luci/applications/luci-app-ocserv/`

sed -i 's/\"services\"/\"vpn\"/g' `grep \"services\" -rl --include="*.lua" ./feeds/luci/applications/luci-app-openvpn/`
sed -i 's/services/vpn/g' `grep services -rl --include="*.htm" ./feeds/luci/applications/luci-app-openvpn/`



sed -i 's/\"services\"/\"dns\"/g' `grep \"services\" -rl --include="*.lua" ./package/kenzo/luci-app-adguardhome/`
sed -i 's/services/dns/g' `grep services -rl --include="*.htm" ./package/kenzo/luci-app-adguardhome/`

sed -i 's/\"services\"/\"dns\"/g' `grep \"services\" -rl --include="*.lua" ./package/kenzo/luci-app-aliddns/`
sed -i 's/services/dns/g' `grep services -rl --include="*.htm" ./package/kenzo/luci-app-aliddns/`

sed -i 's/\"services\"/\"dns\"/g' `grep \"services\" -rl --include="*.lua" ./package/kenzo/luci-app-smartdns/`
sed -i 's/services/dns/g' `grep services -rl --include="*.htm" ./package/kenzo/luci-app-smartdns/`

sed -i 's/\"services\"/\"vpn\"/g' `grep \"services\" -rl --include="*.lua" ./package//kenzo/luci-app-clash/`
sed -i 's/services/vpn/g' `grep services -rl --include="*.htm" ./package/kenzo/luci-app-clash/`

sed -i 's/\"services\"/\"vpn\"/g' `grep \"services\" -rl --include="*.lua" ./package//kenzo/luci-app-openclash/`
sed -i 's/services/vpn/g' `grep services -rl --include="*.lua" ./package//kenzo/luci-app-openclash/`
sed -i 's/services/vpn/g' `grep services -rl --include="*.htm" ./package/kenzo/luci-app-openclash/`
