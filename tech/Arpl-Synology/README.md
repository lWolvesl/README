# Arpl黑群晖引导

- 项目地址[Github](https://github.com/fbelavenuto/arpl.git)

- 本篇详细
  - 群晖版本：7.2-64570
  - Arpl版本：[23.6.2](https://github.com/wjz304/arpl-i18n/releases/tag/23.6.2)
  - 方式：U盘刻录启动-使用了内存卡和读卡器，镜像大小1GB
  - 刻录器：[Rufus](https://rufus.ie/zh/)
  
- 软件下载
  - [Rufus下载](http://i.wolves.top/picgo/202307112108780.exe)
  
  - [Arpl 23.6.2下载-百度云盘](https://pan.baidu.com/s/1MbBzgU_ulhnZbulkM92WnQ?pwd=ygfx)
  
  - [7.2-Pat下载-百度云盘](https://pan.baidu.com/s/1QszvpEDJdiqcXgahGjpvyw?pwd=bdmz)-此处推荐去[群晖官网下载](https://www.synology.cn/zh-cn/support/download/DS918+?version=7.2#system)，速度会较快
  
    ![image-20230711210914050](http://i.wolves.top/picgo/202307112109072.png)

## 具体流程

- 首先刻录，根据下载Arpl文件中解压出的img镜像进行刻录
- 群晖型号选择Ds918+
- 群晖版本未选择7.2的版本，有bug，选择7.1版本的42962即可，后续也可以直接引导7.2
- SN码随机，然后直接开始编译引导，编译后直接启动群晖即可，之后开机群晖会自动启动
- 安装时直接选择下载好的Pat文件安装就可以安装7.2版本。



## Zerotier

- 直接根据[官网](https://docs.zerotier.com/devices/synology/)的安装教程走就行，使用Docker

- 首先，使用ssh远程连接到群晖，注意群晖要开启ssh（位于控制面板-终端机和SNMP中），用户名填写你登陆群晖用的用户名，密码也是

- 进入后输入```sudo su```，再输入管理员密码进入管理员模式

- 然后进行以下步骤依次输入命令

  - ```
    echo -e '#!/bin/sh -e \ninsmod /lib/modules/tun.ko' > /usr/local/etc/rc.d/tun.sh
    ```

  - ``````
    chmod a+x /usr/local/etc/rc.d/tun.sh

  - ``````
    /usr/local/etc/rc.d/tun.sh
  - ``````
    ls /dev/net/tun
    ``````

    这一步结束后会弹出```/dev/net/tun```证明成功了

- 使用docker安装zerotier

  - ```
    docker run -d           \
      --name zt             \
      --restart=always      \
      --device=/dev/net/tun \
      --net=host            \
      --cap-add=NET_ADMIN   \
      --cap-add=SYS_ADMIN   \
      -v /var/lib/zerotier-one:/var/lib/zerotier-one zerotier/zerotier-synology:latest
    ```

  - 操作生效后，使用`docker`的`exec`进入即可调用`zerotier-cli`加入自定义网络

## Alist

一个支持多种存储，支持网页浏览和 WebDAV 的文件列表程序，由 gin 和 Solidjs 驱动。

- [官方文档](https://alist.nn.ci/zh/)

### 挂载本地- Rclone

- 安装

  ```shell
  curl https://rclone.org/install.sh | sudo bash
  ```

- work

- ln -s /bin/fusermount /bin/fusermount3

rclone mount alist: /alist --use-mmap --umask 000 --allow-other --allow-non-empty --dir-cache-time 24h --cache-dir=/home/cache --vfs-cache-mode full --buffer-size 512M --vfs-read-chunk-size 16M --vfs-read-chunk-size-limit 64M --vfs-cache-max-size 10G --daemon



https://github.com/alist-org/alist/discussions/2278



rclone mount alist:/Aliyun/movies /volume1/docker/jellyfin/movies --cache-dir /.cache -v --copy-links --no-gzip-encoding --no-check-certificate --allow-other --allow-non-empty --buffer-size=256M --vfs-read-chunk-size=256M --vfs-read-chunk-size-limit=500M --vfs-cache-mode=full --vfs-cache-max-size=15G --dir-cache-time=1h --vfs-cache-max-age=24h --poll-interval=10m



挂载命令：rclone mount DriveName:Folder LocalFolder

卸载命令：fusermount -qzu LocalFolder

## Jellyfin

- 视频站

```shell
docker run -d --name jellyfin -v /volume1/docker/jellyfin/config:/config -p 8096:8096 -p 8920:8920 --device=/dev/dri/renderD128 --restart=always jellyfin/jellyfin
```

