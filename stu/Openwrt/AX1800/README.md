# WiFI6版本弃子，小米路由器AX1800，通过配置文件永久开启ssh和ipv6传入网关设置

<p style="color: aquamarine;text-align: center">POST ON 2024-08-23 BY WOLVES</p>

- 作为小米路由器的第一款`wifi6`路由器(ax.)，最近一次的更新是2021年底，版本为`1.0.394`，时至今日，各种新特性自然不支持，面对如此高规格的硬件，却无法进行任何的发烧友行为，自然是无法修改路由器的大多数设置，就比如`IPV6`防火墙拦截外部访问流量，只允许了`ICMP`
- 由于其特殊的处理器，目前`OPENWRT`还无法对其进行适配，因此我们只能在原有的固件上进行操作来达到我们目的
- 目前大多数很多教程，将固件版本降低到还存在`api`有`bug`的那个版本(小于`1.0.34`)，这个时候的`/api/misystem/set_config_iotdev`可以使用`-h`，因此牛人们就在其后面加入分号，继续执行指令，强行开启了`ssh`实际上是`dropbear`，以此来进入终端执行需要的操作，因为小米固件也是在`OPENWRT`的基础上修改的，所以大多数修改配置文件的操作也相同
- 但是大多数教程没有说的是，这种办法没有固定开启`ssh`方式，重启路由器后还需要执行同样的操作开启`ssh`，这样我们是不能更新固件的，新的固件`BUG`已经被修复了
- 有一个地方很多人都忘了，就是更新固件的时候是可以保留配置文件，而防火墙文件`/etc/config/firewall`中恰好有一个配置为用户自定义配置，并且指定了位置为`/etc/firewall.user`，而且系统默认是有这个文件的，也就是说更新系统不会被删除，而这个防火墙自定义配置，事实上执行的是shell脚本，而且路由器启动防火墙的时候就会执行，也就是说，我们只需要把操作变更为将命令行写入这个配置文件，就能实现路由器重启后自动配置，也能让我们更新系统享受稳定的固件

## 说干就干

- 首先降级到`1.0.34`([下载](https://i.wolves.top/picgo/202408231927106.bin))，在此处降级
  - ![截屏2024-08-23 19.28.33](https://i.wolves.top/picgo/202408231928464.png)

- 降级后不要升级，先登录网页管理界面，登录后可以在地址栏上看到

  - ```http
 http://192.168.31.1/cgi-bin/luci/;stok=XXXXXXXXXXXXXXXXXXXXXXXXXX/web/home#router

- 将XXX后面的包括斜杠"/"在内的所有文字替换成

  - ```js
/api/misystem/set_config_iotdev?bssid=Xiaomi&user_id=longdike&ssid=-h%3B%20nvram%20set%20ssh_en%3D1%3B%20nvram%20commit%3B%20sed%20-i%20's%2Fchannel%3D.*%2Fchannel%3D%5C%22debug%5C%22%2Fg'%20%2Fetc%2Finit.d%2Fdropbear%3B%20%2Fetc%2Finit.d%2Fdropbear%20start%3B```
  - 回车后会有个`code:0`，这个时候ssh就已经打开了

- 开启SSH后，将XX后面的包括斜杠"/"在内的所有文字替换成如下以修改密码为admin

  - ```js
    /api/misystem/set_config_iotdev?bssid=Xiaomi&user_id=longdike&ssid=-h%3B%20echo%20-e%20'admin%5Cnadmin'%20%7C%20passwd%20root%3B
    ```

- 若要使用`ssh`，用以下代码即可

  - ```shell
    ssh -o HostKeyAlgorithms=ssh-rsa root@192.168.31.1
    ```

## 修改配置文件

- 我们刚刚已经分析过了如何操作，现在开始执行

```shell
vi /etc/firewall.user
```

- 进入将如下内容复制到最下面

```shell
#ssh
nvram set ssh_en=1
nvram commit
sed -i 's/channel=.*/channel="debug"/g' /etc/init.d/dropbear
/etc/init.d/dropbear start

echo -e 'admin\nadmin' | passwd root
```

- `ESC`后`:wq`退出`vi`
- 好了，这样我们就设置好了ssh，接下来可以直接把系统更新到最新，还是固件升级到页面，但是他不会一次升级到最新版本，他会经历以下几个版本，一次次升级就可以
  - `1.0.34`
  - `1.0.385`
  - `1.0.390`
  - `1.0.394`
- 如此操作，即可完成更新版本自动化的开启`ssh`

## 关于IPV6

```shell
#ipv6
ip6tables -F
ip6tables -X
ip6tables -P INPUT ACCEPT
ip6tables -P OUTPUT ACCEPT
ip6tables -P FORWARD ACCEPT
```

- 对于以上的代码，这里给出解释
- 由于`IPV6`的所有公网段内，每个人都是公网，也就是说，在公网环境的每个`IPV6`机器，都可以随意的被其他人访问，这是相当危险的，之前在`IPV4`中，路由器内部每个人都是通过NAT转发的地址，相对很安全，别人不能直接访问
- 因此，`AX1800`默认提供的防火墙，是禁止`IPV6`传入的流量的，别人不能直接访问内网的任何机器的某项服务的，但是放开了`ICMP`传入，这是必要的
- 但是这样的话，我们的公网`IPV6`实际上和之前的`IPV4`差别不大，还是无法自由访问，以上的配置就是打开防火墙，让流量可以直接传入内网的任意机器，你的`NAS`或是服务器就可以直接被访问到了，<p style="color: red;">如是做一定要做好服务器端的防火墙配置</p>
- 以上的配置若有需要可以添加到`/etc/firewall.user`文件中，使用`IPV6`切记保证内网环境的安全