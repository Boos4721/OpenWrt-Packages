<h1 align="center">
  <img src="https://github.com/Dreamacro/clash/raw/master/docs/logo.png" alt="Clash" width="200">
  <br>Clash<br>

</h1>

  <p align="center">
	<a target="_blank" href="https://github.com/Dreamacro/clash/releases/tag/v1.10.0">
    <img src="https://img.shields.io/badge/Clash-v1.10.0-blue.svg">
  </a>
  <a target="_blank" href="https://github.com/yaof2/luci-app-clash/releases/tag/v1.8.1">
    <img src="https://img.shields.io/badge/New Release-v1.8.1-orange.svg">
  </a>
  </p>
  

<p align="center">
本插件是一个可运行在 OpenWrt 上的<a href="https://github.com/Dreamacro/clash" target="_blank"> Clash </a>客户端
</p>
<p align="center">
兼容 Shadowsocks、ShadowsocksR、Vmess、Trojan、Snell 等协议，根据灵活的规则配置实现策略代理。
</p>
<p align="center">
- 感谢<a href="https://github.com/frainzy1477" target="_blank"> frainzy1477 </a>，本插件基于<a href="https://github.com/frainzy1477/luci-app-clash" target="_blank"> Luci For Clash </a>进行二次修整 -
</p>

特此说明
---


* 这是一个老的版本，比较简洁，所以稍微修整了下。更全更好的clash，请使用openclash。
* 系统自带的yacd控制面板，属于v0.2.15老版本却能编译成功。自行[下载最新版](https://github.com/haishanh/yacd/releases) 解压后将public目录重命名为yacd。上传usr/share/clash目录（先删除系统自带的yacd版本）即可。

使用手册
---


* [Wiki](https://github.com/vernesong/OpenClash/wiki)



下载地址
---


* IPK [前往下载](https://github.com/yaof2/luci-app-clash/releases)

安装方法
---
- Upload ipk file to tmp folder
- cd /tmp
- opkg update
- opkg install clash_v1.10.0_all.ipk
- opkg install luci-app-clash_v1.8.1_all.ipk  
- opkg install luci-app-clash_v1.8.1_all.ipk --force-depends

卸载方法
---
- opkg remove clash 
- opkg remove luci-app-clash 
- opkg remove luci-app-clash --force-remove

支持
---
- Subscription Config
- Config Upload
- Create Config
- GeoIP Database Update
- TProxy UDP
- IP Query
- DNS Forwarding
- Support Trojan(Trojan-GFW & Trojan-Go)
- Support SSR
- Support SS
- Support V2ray
- Support Snell
- Ping Custom Proxy Servers
- Tun Support
- Access Control
- Support Provider,
- Game Rules 
- Restore Config

依赖
---

- bash
- coreutils
- coreutils-nohup
- coreutils-base64
- ipset
- iptables
- luci
- luci-base
- wget
- libustream-openssl 
- curl
- jsonfilter
- ca-certificates
- iptables-mod-tproxy
- kmod-tun


编译
---


从 OpenWrt 的 [SDK](http://wiki.openwrt.org/doc/howto/obtain.firmware.sdk) 编译
```bash
# 解压下载好的 SDK
tar xjf OpenWrt-SDK-ar71xx-for-linux-x86_64-gcc-4.8-linaro_uClibc-0.9.33.2.tar.bz2
cd OpenWrt-SDK-ar71xx-*

# Clone 项目
mkdir package/luci-app-openclash
cd package/luci-app-openclash
git init
git remote add -f origin https://github.com/yaof2/luci-app-clash.git
git config core.sparsecheckout true
echo "luci-app-clash" >> .git/info/sparse-checkout
git pull --depth 1 origin master
git branch --set-upstream-to=origin/master master

# 编译 po2lmo (如果有po2lmo可跳过)
pushd luci-app-clash/tools/po2lmo
make && sudo make install
popd

# 开始编译

# 先回退到SDK主目录
cd ../..
make package/luci-app-clash/luci-app-clash/compile V=99

# IPK文件位置
./bin/ar71xx/packages/base/luci-app-clash_1.8.1_all.ipk
```

```bash
# 同步源码
cd package/luci-app-clash/luci-app-clash
git pull

# 您也可以直接拷贝 `luci-app-clash` 文件夹至其他 `OpenWrt` 项目的 `Package` 目录下随固件编译

make menuconfig
# 选择要编译的包 LuCI -> Applications -> luci-app-clash

```


许可
---

* 内核 [clash](https://github.com/Dreamacro/clash) by [Dreamacro](https://github.com/Dreamacro)
* 本项目代码基于 [Luci For Clash](https://github.com/frainzy1477/luci-app-clash) by [frainzy1477](https://github.com/frainzy1477)
* GEOIP数据库 [GeoLite2](https://dev.maxmind.com/geoip/geoip2/geolite2/) by [MaxMind](https://www.maxmind.com)
* IP检查 [MyIP](https://github.com/SukkaW/MyIP) by [SukkaW](https://github.com/SukkaW)
* 控制面板 [clash-dashboard](https://github.com/Dreamacro/clash-dashboard) by [Dreamacro](https://github.com/Dreamacro)
* 控制面板 [yacd](https://github.com/haishanh/yacd) by [haishanh](https://github.com/haishanh)
* lhie1规则 [lhie1-Rules](https://github.com/lhie1/Rules) by [lhie1](https://github.com/lhie1)
* ConnersHua规则 [ConnersHua-Rules](https://github.com/ConnersHua/Profiles/tree/master) by [ConnersHua](https://github.com/ConnersHua)
* 游戏规则 [SSTap-Rule](https://github.com/FQrabbit/SSTap-Rule) by [FQrabbit](https://github.com/FQrabbit)


高级版本请使用Openclash
---

* [火速前往](https://github.com/vernesong/OpenClash)
