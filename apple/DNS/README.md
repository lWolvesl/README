## DNS

```shell
sudo dscacheutil -flushcache
sudo killall -HUP mDNSResponder
```

```resolv.conf
cat /etc/resolv.conf

domain {redacted}.com
nameserver 8.8.8.8
nameserver 208.67.222.222
```