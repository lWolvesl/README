# Harbor - 私人docker镜像仓库

- 单容器实例 + Portainer-agent 管理

## 1.创建容器

- 镜像：`docker:dind` 此容器为`docker in docker`官方镜像[DockerHub](https://hub.docker.com/_/docker)
- 端口：
  - 宿主:80       harbor http
  - 宿主:443     harbor https
  - 宿主:9001   portainer-agent
- 文件：
  - 宿主:/data  harbor data

```sh
docker run -itd --privileged --name harbor -p 80:80 -p 443:443 -p 9001:9001 -v /data/run:/var/run -v /data:/data docker:dind
```

此处将 /var/run 映射出来是防止强行关闭容器会导致pid残留而无法启动harbor，映射出后可以直接在文件中删除pid

## 2.进入容器

```sh
docker exec -it harbor /bin/ash
```

- 进入根目录下载`harbor`文件[GitHub](https://github.com/goharbor/harbor)

```sh
cd /
```

```sh
wget https://github.com/goharbor/harbor/releases/download/v2.8.2/harbor-offline-installer-v2.8.2.tgz
```

此处下载的是2.8.2版本标准离线版镜像

- 解压

```sh
tar -zxf harbor-offline-installer-v2.8.2.tgz
```

解压出的就是名为`harbor`的文件夹

- 删除压缩包节约空间，文件 > 500MB

```sh
rm harbor-offline-installer-v2.8.2.tgz
```

- 进入 harbor 文件夹

```sh
cd /harbor
```

- 可以看到如下文件

![image-20230720163951841](https://i.wolves.top/picgo/202307201639948.png)

- 将`harbor.yml.tmpl`文件名改为`harbor.yml`

```sh
mv harbor.yml.tmpl harbor.yml
```

- 然后修改文件内容

```sh
vi harbor.yml
```

需要修改的位置为：

1. hostname 修改为你的 hostname

2. https 中的证书文件 ![image-20230720164258381](https://i.wolves.top/picgo/202307201642427.png) 将其修改为 ![image-20230720164412109](https://i.wolves.top/picgo/202307201644153.png)

   此处的证书文件，需要退出容器，在宿主机的映射目录中放入响应文件

   如果不需要 https ，则可以将所有的 https 及其子项头全部加 # 注释即可

3. harbor_admin_password 此处要修改管理员密码，后续进入系统后也可修改，管理员账户 root

4. 其他位置默认均不用修改

- 下载安装 bash

```sh
apk add bash
```

网络状态不好可以换清华源

```sh
echo "http://mirrors.sjtug.sjtu.edu.cn/alpine/latest-stable/main" > /etc/apk/repositories
echo "http://mirrors.sjtug.sjtu.edu.cn/alpine/latest-stable/community" >> /etc/apk/repositories
```

- 一切准备就绪，执行安装程序

```sh
./install.sh
```

## 3.安装portainer监控容器

- 在容器内执行

```sh
docker run -d \
  -p 9001:9001 \
  --name portainer_agent \
  --restart=always \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /var/lib/docker/volumes:/var/lib/docker/volumes \
  portainer/agent:2.18.4
```

- 在portainer添加即可在portainer主页管理内部容器状态

![image-20230720165659190](https://i.wolves.top/picgo/202307201656229.png)