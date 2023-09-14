# Alpine

[回到主页](../README.md)

## 服务

```
rc-update add docker boot
```


## 镜像源

```shell
echo "http://mirrors.sjtug.sjtu.edu.cn/alpine/latest-stable/main" > /etc/apk/repositories
echo "http://mirrors.sjtug.sjtu.edu.cn/alpine/latest-stable/community" >> /etc/apk/repositories
```

## 设置时间

```shell
apk add tzdata
cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
echo "Asia/Shanghai" > /etc/timezone
```

## 查看端口占用

```shell
netstat -atunlp
```

## CPU计数器

```shell
apk add util-linux
```

