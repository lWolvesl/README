# OrayX3A

## Openwrt install

`https://www.emperinter.info/2023/10/01/how-to-flash-openwrt-to-oray-x3a/`

- enable ssh
  - Login in and use `http://10.168.1.1/cgi-bin/oraybox?_api=ssh_set&enabled=1` to enable
  - Use rsa to ssh `ssh -o HostKeyAlgorithms=ssh-rsa root@10.168.1.1`,default password is `oray@12#$%^78`
- please backup the official firmware 
  - `scp -o HostKeyAlgorithms=ssh-rsa -O root@10.168.1.1:/tmp/firmware.bin ./`
- Download your firmware
- Then mtd it `mtd write xxx.bin firmware`