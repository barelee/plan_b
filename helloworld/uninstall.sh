#! /bin/sh

# shadowsocks script for HND/AXHND router with kernel 4.1.27/4.1.51 merlin firmware

sh /jffs/softcenter/ss/ssconfig.sh stop
sh /jffs/softcenter/scripts/ss_conf.sh jffs/softcenter 3
sleep 1

rm -rf /jffs/softcenter/ss/*
rm -rf /jffs/softcenter/scripts/ss_*
rm -rf /jffs/softcenter/scripts/ss-rules
rm -rf /jffs/softcenter/webs/Module_helloworld*
rm -rf /jffs/softcenter/bin/ss-redir
rm -rf /jffs/softcenter/bin/gen_conf
rm -rf /jffs/softcenter/bin/lua
rm -rf /jffs/softcenter/bin/ss-local
rm -rf /jffs/softcenter/bin/ss-server
rm -rf /jffs/softcenter/bin/ssr-check
rm -rf /jffs/softcenter/bin/ssr-redir
rm -rf /jffs/softcenter/bin/ssr-local
rm -rf /jffs/softcenter/bin/ssr-server
rm -rf /jffs/softcenter/bin/obfs-local
rm -rf /jffs/softcenter/bin/obfs-server
rm -rf /jffs/softcenter/bin/pdnsd
rm -rf /jffs/softcenter/bin/dns2socks
rm -rf /jffs/softcenter/bin/client_linux
rm -rf /jffs/softcenter/bin/chinadns-ng
rm -rf /jffs/softcenter/bin/v2ray-plugin
rm -rf /jffs/softcenter/bin/xray
rm -rf /jffs/softcenter/bin/httping
rm -rf /jffs/softcenter/res/icon-helloworld.png
rm -rf /jffs/softcenter/res/ss-menu.js
rm -rf /jffs/softcenter/res/tablednd.js
rm -rf /jffs/softcenter/res/all.png
rm -rf /jffs/softcenter/res/gfw.png
rm -rf /jffs/softcenter/res/chn.png
rm -rf /jffs/softcenter/res/game.png
rm -rf /jffs/softcenter/res/helloworld.css
find /jffs/softcenter/init.d/ -name "*helloworld.sh" | xargs rm -rf
find /jffs/softcenter/init.d/ -name "*socks5.sh" | xargs rm -rf

dbus remove softcenter_module_helloworld_home_url
dbus remove softcenter_module_helloworld_install
dbus remove softcenter_module_helloworld_md5
dbus remove softcenter_module_helloworld_version


cd /tmp 
dbus list ss_|cut -d "=" -f1|sed 's/^/dbus remove /g' > clean.sh
dbus list ssconf_|cut -d "=" -f1|sed 's/^/dbus remove /g' > clean.sh
chmod 777 clean.sh 
sh ./clean.sh > /dev/null 2>&1 
rm clean.sh
rm -rf /jffs/softcenter/scripts/uninstall_helloworld.sh
