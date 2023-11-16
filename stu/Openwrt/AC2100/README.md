# immortalwrt

## 源

```conf
/etc/opkg.conf
dest root /
dest ram /tmp
lists_dir ext /var/opkg-lists
option overlay_root /overlay
option check_signature

/etc/opkg/customfeeds.conf
# add your custom package feeds here
#
# src/gz example_feed_name http://www.example.com/path/to/files

/etc/opkg/distfeeds.conf
src/gz immortalwrt_core https://mirrors.vsean.net/openwrt/releases/21.02.7/targets/ramips/mt7621/packages
src/gz immortalwrt_base https://mirrors.vsean.net/openwrt/releases/21.02.7/packages/mipsel_24kc/base
src/gz immortalwrt_luci https://mirrors.vsean.net/openwrt/releases/21.02.7/packages/mipsel_24kc/luci
src/gz immortalwrt_packages https://mirrors.vsean.net/openwrt/releases/21.02.7/packages/mipsel_24kc/packages
src/gz immortalwrt_routing https://mirrors.vsean.net/openwrt/releases/21.02.7/packages/mipsel_24kc/routing
src/gz immortalwrt_telephony https://mirrors.vsean.net/openwrt/releases/21.02.7/packages/mipsel_24kc/telephony
```

## 源

```conf
src/gz openwrt_core https://dl.openwrt.ai/23.05/targets/ramips/mt7621/5.15.134
src/gz openwrt_base https://dl.openwrt.ai/23.05/packages/mipsel_24kc/base
src/gz openwrt_packages https://dl.openwrt.ai/23.05/packages/mipsel_24kc/packages
src/gz openwrt_luci https://dl.openwrt.ai/23.05/packages/mipsel_24kc/luci
src/gz openwrt_routing https://dl.openwrt.ai/23.05/packages/mipsel_24kc/routing
src/gz openwrt_kiddin9 https://dl.openwrt.ai/23.05/packages/mipsel_24kc/kiddin9

src/gz openwrt_core https://mirrors.tuna.tsinghua.edu.cn/openwrt/releases/23.05.0/targets/ramips/mt7621/5.15.134
src/gz openwrt_base https://mirrors.tuna.tsinghua.edu.cn/openwrt/releases/23.05.0/packages/mipsel_24kc/base
src/gz openwrt_packages https://mirrors.tuna.tsinghua.edu.cn/openwrt/releases/23.05.0/packages/mipsel_24kc/packages
src/gz openwrt_luci https://mirrors.tuna.tsinghua.edu.cn/openwrt/releases/23.05.0/packages/mipsel_24kc/luci
src/gz openwrt_routing https://mirrors.tuna.tsinghua.edu.cn/openwrt/releases/23.05.0/packages/mipsel_24kc/routing
src/gz openwrt_kiddin9 https://dl.openwrt.ai/23.05/packages/mipsel_24kc/kiddin9
src/gz openwrt_telephony https://mirrors.tuna.tsinghua.edu.cn/openwrt/releases/23.05.0/packages/mipsel_24kc/telephony

```

