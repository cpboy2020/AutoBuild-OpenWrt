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
sed -i "s/R20.6.18/R20.6.20[${cid}]/g" openwrt/package/lean/default-settings/files/zzz-default-settings

# 自定义定制选项
sed -i 's/\"services\"/\"control\"/g' openwrt/package/lean/luci-app-accesscontrol/luasrc/controller/mia.lua
sed -i 's/services/control/g'  openwrt/package/lean/luci-app-accesscontrol/luasrc/view/mia

sed -i 's/\"system\"/\"control\"/g' openwrt/package/lean/luci-app-autoreboot/luasrc/controller/autoreboot.lua

sed -i 's/\"services\"/\"dns\"/g' openwrt/package/feeds/kenzo/luci-app-adguardhome/luasrc/controller/AdGuardHome.lua
sed -i 's/services/dns/g' openwrt/package/feeds/kenzo/luci-app-adguardhome/luasrc/view/AdGuardHome/AdGuardHome_check.htm
sed -i 's/services/dns/g' openwrt/package/feeds/kenzo/luci-app-adguardhome/luasrc/view/AdGuardHome/AdGuardHome_status.htm
sed -i 's/services/dns/g' openwrt/package/feeds/kenzo/luci-app-adguardhome/luasrc/view/AdGuardHome/log.htm
sed -i 's/services/dns/g' openwrt/package/feeds/kenzo/luci-app-adguardhome/luasrc/view/AdGuardHome/yamleditor.htm

sed -i 's/\"services\"/\"vpn\"/g' openwrt/package/feeds/kenzo/luci-app-clash/luasrc/controller/clash.lua
sed -i 's/services/vpn/g' openwrt/package/feeds/kenzo/luci-app-clash/luasrc/view/clash/conf.htm
sed -i 's/services/vpn/g' openwrt/package/feeds/kenzo/luci-app-clash/luasrc/view/clash/core_check.htm
sed -i 's/services/vpn/g' openwrt/package/feeds/kenzo/luci-app-clash/luasrc/view/clash/game_rule.htm
sed -i 's/services/vpn/g' openwrt/package/feeds/kenzo/luci-app-clash/luasrc/view/clash/geoip.htm
sed -i 's/services/vpn/g' openwrt/package/feeds/kenzo/luci-app-clash/luasrc/view/clash/list.htm
sed -i 's/services/vpn/g' openwrt/package/feeds/kenzo/luci-app-clash/luasrc/view/clash/start_stop.htm
sed -i 's/services/vpn/g' openwrt/package/feeds/kenzo/luci-app-clash/luasrc/view/clash/status.htm
sed -i 's/services/vpn/g' openwrt/package/feeds/kenzo/luci-app-clash/luasrc/view/clash/status_log.htm
sed -i 's/services/vpn/g' openwrt/package/feeds/kenzo/luci-app-clash/luasrc/view/clash/update.htm

sed -i 's/\"services\"/\"vpn\"/g' openwrt/package/feeds/kenzo/luci-app-openclash/files/usr/lib/lua/luci/controller/openclash.lua
sed -i 's/services/vpn/g' openwrt/package/feeds/kenzo/luci-app-openclash/files/usr/lib/lua/luci/view/openclash/download_rule.htm
sed -i 's/services/vpn/g' openwrt/package/feeds/kenzo/luci-app-openclash/files/usr/lib/lua/luci/view/openclash/server_list.htm
sed -i 's/services/vpn/g' openwrt/package/feeds/kenzo/luci-app-openclash/files/usr/lib/lua/luci/view/openclash/state.htm
sed -i 's/services/vpn/g' openwrt/package/feeds/kenzo/luci-app-openclash/files/usr/lib/lua/luci/view/openclash/status.htm
sed -i 's/services/vpn/g' openwrt/package/feeds/kenzo/luci-app-openclash/files/usr/lib/lua/luci/view/openclash/update.htm

sed -i 's/\"services\"/\"dns\"/g' openwrt/feeds/kenzo/luci-app-aliddns/luasrc/controller/aliddns.lua

sed -i 's/\"services\"/\"dns\"/g' openwrt/feeds/kenzo/luci-app-smartdns/luasrc/controller/smartdns.lua
sed -i 's/services/dns/g' openwrt/feeds/kenzo/luci-app-smartdns/luasrc/view/smartdns/smartdns_status.htm

sed -i 's/\"services\"/\"dns\"/g' openwrt/package/lean/luci-app-dnsforwarder/luasrc/controller/dnsforwarder.lua

sed -i 's/\"services\"/\"nas\"/g' openwrt/package/lean/luci-app-familycloud/luasrc/controller/familycloud.lua
sed -i 's/services/nas/g' openwrt/package/lean/luci-app-familycloud/luasrc/view/familycloud/familycloud_status.htm

sed -i 's/\"services\"/\"vpn\"/g' openwrt/package/feeds/helloworld/luci-app-ssr-plus/luasrc/controller/shadowsocksr.lua
sed -i 's/services/vpn/g' openwrt/package/feeds/helloworld/luci-app-ssr-plus/luasrc/view/shadowsocksr/check.htm
sed -i 's/services/vpn/g' openwrt/package/feeds/helloworld/luci-app-ssr-plus/luasrc/view/shadowsocksr/checkport.htm
sed -i 's/services/vpn/g' openwrt/package/feeds/helloworld/luci-app-ssr-plus/luasrc/view/shadowsocksr/refresh.htm
sed -i 's/services/vpn/g' openwrt/package/feeds/helloworld/luci-app-ssr-plus/luasrc/view/shadowsocksr/status.htm
sed -i 's/services/vpn/g' openwrt/package/feeds/helloworld/luci-app-ssr-plus/luasrc/view/shadowsocksr/subscribe.htm

#sed -i 's/\""network"\"/\"nas\"/g' openwrt/package/lean/*/luasrc/controller/eqos.lua
