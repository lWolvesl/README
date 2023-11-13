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

