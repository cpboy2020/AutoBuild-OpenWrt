#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: eSirPlayground
# Youtube Channel: https://goo.gl/fvkdwm 
#=================================================
# chmod +x ./vpsleandiy.sh && ./vpsleandiy.sh

#1. Modify default IP #定制默认IP
#sed -i 's/192.168.1.1/192.168.5.1/g' ./package/base-files/files/bin/config_generate

date=`date +%m.%d.%Y`
sed -i "s/DISTRIB_DESCRIPTION.*/DISTRIB_DESCRIPTION='%D Compiled by cpboy'/g" package/base-files/files/etc/openwrt_release
sed -i "s/# REVISION:=x/REVISION:= $date/g" include/version.mk

# Add Compile-ID(cid)
#cid=$(date "+%Y-%m-%d")
#sed -i "s/R20.6.18/R20.6.18[${cid}] Compiled by cpboy/g" ./package/lean/default-settings/files/zzz-default-settings

#sed -i 's/\"#src-git\"/\"src-git\"/g' ./feeds.conf.default
sed -i 's/#src-git helloworld/src-git helloworld/g' ./feeds.conf.default

#添加自定义源代码
#sed -i '1i\添加的内容' file.name #这是在第一行前添加字符串
#sed -i '$i\添加的内容' file.name #这是在最后一行行前添加字符串
#sed -i '$a\添加的内容' file.name #这是在最后一行行后添加字符串

#sed -i '$a\src-git helloworld https://github.com/fw876/helloworld' ./feeds.conf.default
#sed -i '$a\src-git lienol https://github.com/Lienol/openwrt-package' ./feeds.conf.default
#sed -i '$a\src-git kenzo https://github.com/kenzok8/openwrt-packages' ./feeds.conf.default


git clone https://github.com/Lienol/openwrt-package package/lienol
git clone https://github.com/kenzok8/openwrt-packages package/kenzo


#添加luci-app-vssr-plus源码
#git clone https://github.com/jerrykuku/luci-app-vssr package/cpboy/luci-app-vssr
#git clone https://github.com/jerrykuku/lua-maxminddb package/cpboy/packages/lua-maxminddb  #git luci-app-vssr 依赖
  
#git clone https://github.com/liuwenwv/luci-app-vssr-plus package/cpboy/luci-app-vssr-plus
#git clone https://github.com/Leo-Jo-My/diy package/cpboy/packages  #依赖包

git clone https://github.com/lisaac/luci-app-dockerman package/cpboy/luci-app-dockerman
git clone https://github.com/lisaac/luci-lib-docker package/cpboy/packages/luci-lib-docker #git luci-app-dockerman 依赖

        
#git clone https://github.com/frainzy1477/luci-app-clash package/cpboy/luci-app-clash       
#git clone -b master --single-branch https://github.com/vernesong/OpenClash package/cpboy/openclash
#git clone https://github.com/rufengsuixing/luci-app-adguardhome package/cpboy/luci-app-adguardhome
#git clone https://github.com/garypang13/luci-app-eqos package/cpboy/luci-app-eqos
               
# 添加 feeds/libsodium
#git clone https://github.com/shadowsocks/openwrt-feeds package/cpboy
# 获取 minisign Makefile
#git clone https://github.com/peter-tank/openwrt-minisign package/cpboy/packages/minisign
#git clone https://github.com/peter-tank/luci-app-dnscrypt-proxy2 package/cpboy/luci-app-dnscrypt-proxy2

# 添加自定义主题
git clone https://github.com/xiaoqingfengATGH/luci-theme-infinityfreedom package/cpboy/luci-theme-infinityfreedom
git clone https://github.com/esirplayground/luci-theme-atmaterial-ColorIcon package/cpboy/luci-theme-atmaterial-ColorIcon
git clone https://github.com/Leo-Jo-My/luci-theme-Butterfly-dark package/cpboy/luci-theme-Butterfly-dark
git clone https://github.com/siropboy/luci-theme-btmod.git package/cpboy/luci-theme-btmod
  
rm -rf ./package/lean/luci-theme-argon

git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/cpboy/luci-theme-argon

# 删除重复安装包及依赖包
rm -rf package/lienol/package/dns2socks
rm -rf package/lienol/package/ipt2socks
rm -rf package/lienol/package/kcptun
rm -rf package/lienol/package/pdnsd-alt
rm -rf package/lienol/package/shadowsocksr-libev
rm -rf package/lienol/package/simple-obfs
rm -rf package/lienol/package/v2ray
rm -rf package/lienol/package/v2ray-plugin
rm -rf package/lienol/lienol/luci-app-timecontrol

rm -rf package/lean/luci-app-guest-wifi
rm -rf package/lean/luci-app-kodexplorer
rm -rf package/lean/luci-app-pppoe-relay
rm -rf package/lean/luci-app-ramfree
rm -rf package/lean/luci-app-softethervpn
rm -rf package/lean/luci-app-v2ray-server
rm -rf package/lean/luci-app-verysync
rm -rf package/lean/verysync
rm -rf package/lean/trojan

#rm -rf ./package/kenzo/luci-app-passwall
#rm -rf ./package/kenzo/luci-app-ssr-plus
#rm -rf ./package/kenzo/luci-theme-opentomato
#rm -rf package/kenzo/microsocks
#rm -rf package/kenzo/redsocks2

#rm -rf package/cpboy/packages/dnscrypt-proxy-full
rm -rf package/cpboy/packages/openwrt-dnsforwarder
rm -rf package/cpboy/packages/openwrt-simple-obfs
#rm -rf package/cpboy/packages/openwrt-v2ray-plugin

rm -rf ./package/cpboy/packages/libcares
rm -rf ./package/cpboy/packages/luci-lib-docker

# 再次更新并安装源
./scripts/feeds clean
./scripts/feeds update -a && ./scripts/feeds install -a

# OpenWRT node源码更新
#./scripts/feeds update node
#rm ./package/feeds/packages/node
#rm ./package/feeds/packages/node-*
#git clone https://github.com/nxhack/openwrt-node-packages.git package/feeds/packages/node
#./scripts/feeds install -a -p node

# 自定义定制选项

cp -rf ./dns.lua ./feeds/luci/modules/luci-mod-admin-full/luasrc/controller/admin

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


#sed -i 's/\"services\"/\"vpn\"/g' `grep \"services\" -rl --include="*.lua" ./feeds/helloworld/luci-app-ssr-plus/`
#sed -i 's/services/vpn/g' `grep services -rl --include="*.htm" ./feeds/helloworld/luci-app-ssr-plus/`

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


#sed -i 's/\"services\"/\"vpn\"/g' `grep \"services\" -rl --include="*.lua" ./package/cpboy/openclash/luci-app-openclash/`
#sed -i 's/services/vpn/g' `grep services -rl --include="*.htm" ./package/cpboy/openclash/luci-app-openclash/`

sed -i 's/\"services\"/\"vpn\"/g' `grep \"services\" -rl --include="*.lua" ./package/cpboy/luci-app-ssr-plus/`
sed -i 's/services/vpn/g' `grep services -rl --include="*.lua" ./package/cpboy/luci-app-ssr-plus/`
sed -i 's/services/vpn/g' `grep services -rl --include="*.htm" ./package/cpboy/luci-app-ssr-plus/`

