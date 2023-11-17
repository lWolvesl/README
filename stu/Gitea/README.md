# GITEA

[回到主页](../README.md)

- 搭建

## Docker

```shell
docker run -itd --name gitea -p 56000:3000 -p 56022:22 -v /data/gitea:/data gitea/gitea
```

## 自定义构建

- [设置apk和时间](../Alpine)

```shell
apk add git --no-cache
adduer git
/data/app/gitea web --config /data/gitea/conf/app.ini
```



## GITEA支持镜像上传

- 支持的软件包管理器[](https://docs.gitea.com/zh-cn/usage/packages/overview#支持的软件包管理器)

目前支持以下软件包管理器：

| Name                                                         | Language   | Package client            |
| ------------------------------------------------------------ | ---------- | ------------------------- |
| [Alpine](https://docs.gitea.com/zh-cn/usage/packages/alpine) | -          | `apk`                     |
| [Cargo](https://docs.gitea.com/zh-cn/usage/packages/cargo)   | Rust       | `cargo`                   |
| [Chef](https://docs.gitea.com/zh-cn/usage/packages/chef)     | -          | `knife`                   |
| [Composer](https://docs.gitea.com/zh-cn/usage/packages/composer) | PHP        | `composer`                |
| [Conan](https://docs.gitea.com/zh-cn/usage/packages/conan)   | C++        | `conan`                   |
| [Conda](https://docs.gitea.com/zh-cn/usage/packages/conda)   | -          | `conda`                   |
| [Container](https://docs.gitea.com/zh-cn/usage/packages/container) | -          | 任何符合OCI规范的客户端   |
| [CRAN](https://docs.gitea.com/zh-cn/usage/packages/cran)     | R          | -                         |
| [Debian](https://docs.gitea.com/zh-cn/usage/packages/debian) | -          | `apt`                     |
| [Generic](https://docs.gitea.com/zh-cn/usage/packages/generic) | -          | 任何HTTP客户端            |
| [Go](https://docs.gitea.com/zh-cn/usage/packages/go)         | Go         | `go`                      |
| [Helm](https://docs.gitea.com/zh-cn/usage/packages/helm)     | -          | 任何HTTP客户端, `cm-push` |
| [Maven](https://docs.gitea.com/zh-cn/usage/packages/maven)   | Java       | `mvn`, `gradle`           |
| [npm](https://docs.gitea.com/zh-cn/usage/packages/npm)       | JavaScript | `npm`, `yarn`, `pnpm`     |
| [NuGet](https://docs.gitea.com/zh-cn/usage/packages/nuget)   | .NET       | `nuget`                   |
| [Pub](https://docs.gitea.com/zh-cn/usage/packages/pub)       | Dart       | `dart`, `flutter`         |
| [PyPI](https://docs.gitea.com/zh-cn/usage/packages/pypi)     | Python     | `pip`, `twine`            |
| [RPM](https://docs.gitea.com/zh-cn/usage/packages/packages/rpm) | -          | `yum`, `dnf`, `zypper`    |
| [RubyGems](https://docs.gitea.com/zh-cn/usage/packages/rubygems) | Ruby       | `gem`, `Bundler`          |
| [Swift](https://docs.gitea.com/zh-cn/usage/packages/rubygems) | Swift      | `swift`                   |
| [Vagrant](https://docs.gitea.com/zh-cn/usage/packages/vagrant) | -          | `vagrant`                 |

- nginx转发时应使用fullchain

| 文件名        | 文件作用                                                     |
| ------------- | ------------------------------------------------------------ |
| cert.pem      | 服务端证书                                                   |
| chain.pem     | 浏览器需要的所有证书但不包括服务端证书，比如根证书和中间证书 |
| fullchain.pem | 包括了cert.pem和chain.pem的内容                              |
| privkey.pem   | 证书的私钥                                                   |
